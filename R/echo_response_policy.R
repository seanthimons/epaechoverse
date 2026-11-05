# Client-owned runtime behavior shared by every ECHO wrapper. specmill selects
# these by name in specmill.yml (defaults.response_policy and
# defaults.request_controls.retry_policy); regenerating never edits this file.

# Retry only transient failures. ECHO answers a query it cannot process with a
# deterministic HTTP 500, so retrying 500 would only repeat the same bad request.
echo_retry_policy <- function(response) {
  httr2::resp_status(response) %in% c(408L, 429L, 502L, 503L, 504L)
}

# ECHO reports most errors as HTTP 200 with the message inside the body; turn
# those into R errors. Successful calls return exactly what the generated wrapper
# would have returned. HTTP failures are raised by decode() as usual (keeping its
# condition classes, including httr2's when preserve_errors is on and
# specmill_call_error for a 401) with ECHO's message appended when the body has one.
echo_response_policy <- function(response, context, decode) {
  if (httr2::resp_status(response) >= 400L) {
    body <- tryCatch(decode(check_status = FALSE), error = function(e) NULL)
    message <- echo_error_message(body)
    if (!is.null(message)) {
      tryCatch(
        decode(),
        error = function(e) {
          e$message <- paste0(conditionMessage(e), ': ', message)
          class(e) <- unique(c('echo_error', class(e)))
          stop(e)
        }
      )
    }
  }
  result <- tryCatch(
    decode(),
    error = function(e) {
      repaired <- echo_repair_json(response)
      if (is.null(repaired)) {
        stop(e)
      }
      repaired
    }
  )
  message <- echo_error_message(result)
  if (!is.null(message)) {
    stop(structure(
      class = c('echo_error', 'error', 'condition'),
      list(message = paste0('ECHO reported an error: ', message), call = NULL)
    ))
  }
  result
}

# Known server bugs: JSON with a trailing comma before a closing brace or
# bracket (pipeline routes for an id with no records) and an array opened but
# never closed (micro_services.get_frs_id with no match). Only tried after the
# normal parse failed, only for successful JSON responses, and only accepted if
# the repaired text parses. The substitutions are textual, so a body that is
# already malformed and also contains a string such as "a, ]" could be altered.
echo_repair_json <- function(response) {
  if (httr2::resp_status(response) %/% 100L != 2L) {
    return(NULL)
  }
  type <- httr2::resp_content_type(response)
  if (is.na(type) || !grepl('json', type, fixed = TRUE)) {
    return(NULL)
  }
  text <- httr2::resp_body_string(response)
  text <- gsub(',(\\s*[}\\]])', '\\1', text, perl = TRUE)
  text <- gsub('\\[\\s*\\}', '[]}', text, perl = TRUE)
  tryCatch(jsonlite::fromJSON(text, simplifyVector = FALSE), error = function(e) NULL)
}

# Follow names through nested lists with exact matching; NULL when any step is
# missing or not a list (`$` would partially match names and fail on strings).
echo_field <- function(x, ...) {
  for (name in c(...)) {
    if (!is.list(x) || !name %in% names(x)) {
      return(NULL)
    }
    x <- x[[name]]
  }
  x
}

# Error envelopes seen so far: Results$Error$ErrorMessage (most services),
# status = 'error' / 'fail' with message or data (download and biosolids routes)
# and a lone `error` string (Envirofacts/DMAP, sent with HTTP 404 or 500).
# Returns the message, or NULL when the result is not an error.
echo_error_message <- function(result) {
  message <- echo_field(result, 'Results', 'Error', 'ErrorMessage')
  if (is.null(message) && identical(names(result), 'error') && is.list(result)) {
    message <- result[['error']]
  }
  if (is.null(message)) {
    status <- echo_field(result, 'status')
    if (is.character(status) && length(status) == 1L && status %in% c('error', 'fail')) {
      message <- echo_field(result, 'message')
      if (is.null(message)) {
        message <- paste(unlist(echo_field(result, 'data')), collapse = '; ')
      }
    }
  }
  if (is.character(message) && length(message) == 1L && nzchar(message)) message else NULL
}
