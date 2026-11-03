# Client-owned tidy output for the envirofacts_* wrappers. With tidy = TRUE (the
# default) a wrapper returns a tibble, from either format = 'json' or 'csv', with the
# same column types: every table's column types come from EPA's DMAP OpenAPI schema
# (inst/extdata/envirofacts-columns.csv, written by dev/build_column_types.R).
# Generation binds each wrapper's response policy to envirofacts_response_policy()
# (dev/callbacks.R).
#
# Types: integer, double, date, datetime (timestamps carry no time zone in the
# service; they are labelled UTC) and character. Blank strings and nulls are both NA,
# because CSV cannot tell them apart, and line breaks inside text are "\n" whether
# the service sent "\r\n" (JSON) or R's CSV reader already converted them. Columns come in the order the service sent
# them. A column the schema does not know is returned as character. Columns missing
# from the rows are not added, except for an empty result, which is a zero-row tibble
# with every column of the schema.

.envirofacts_cache <- new.env(parent = emptyenv())

`%||%` <- function(x, y) if (is.null(x)) y else x

# Named list: table -> named character vector (column -> type).
envirofacts_columns <- function() {
  if (is.null(.envirofacts_cache$columns)) {
    path <- system.file('extdata', 'envirofacts-columns.csv', package = 'epaechoverse')
    if (!nzchar(path)) {
      stop('The Envirofacts column types are missing from the installed package.', call. = FALSE)
    }
    all <- utils::read.csv(path, colClasses = 'character', stringsAsFactors = FALSE)
    .envirofacts_cache$columns <- lapply(
      split(all, factor(all$table, unique(all$table))),
      function(rows) stats::setNames(rows$type, rows$column)
    )
  }
  .envirofacts_cache$columns
}

envirofacts_column_types <- function(table) {
  envirofacts_columns()[[table]]
}

# The response policy for one table. `tidy` is checked here because specmill only
# validates inputs that have constraints. The table's column types are read when a
# response arrives, not when the policy is created (dry runs create it too).
envirofacts_response_policy <- function(table, tidy) {
  if (!is.logical(tidy) || length(tidy) != 1L || is.na(tidy)) {
    stop('`tidy` must be TRUE or FALSE.', call. = FALSE)
  }
  if (!tidy) {
    return('echo_response_policy')
  }
  force(table)
  function(response, context, decode) {
    envirofacts_tidy(echo_response_policy(response, context, decode), table)
  }
}

# `x` is what decode() returns: a list of records (JSON), a string or raw vector
# (CSV) or NULL (an empty CSV body).
envirofacts_tidy <- function(x, table) {
  types <- envirofacts_column_types(table)
  if (is.raw(x)) {
    x <- rawToChar(x)
    Encoding(x) <- 'UTF-8'
  }
  problems <- character()
  if (is.null(x) || (is.list(x) && !length(x)) || (is.character(x) && !any(nzchar(trimws(x))))) {
    columns <- empty_columns(types)
  } else if (is.character(x) && length(x) == 1L) {
    columns <- tidy_csv(x, types)
  } else if (is.list(x) && all(vapply(x, is.list, logical(1)))) {
    columns <- tidy_records(x, types)
  } else {
    stop('Unexpected Envirofacts response; use tidy = FALSE to see it.', call. = FALSE)
  }
  problems <- unlist(lapply(columns, attr, 'problem'), use.names = FALSE)
  columns <- lapply(columns, function(column) {
    attr(column, 'problem') <- NULL
    column
  })
  if (length(problems)) {
    warning(paste(problems, collapse = '\n'), call. = FALSE)
  }
  tibble::as_tibble(columns, .name_repair = 'minimal')
}

empty_columns <- function(types) {
  lapply(types %||% character(), function(type) coerce_column(character(), type, ''))
}

tidy_records <- function(records, types) {
  names <- unique(unlist(lapply(records, names), use.names = FALSE))
  columns <- lapply(stats::setNames(names, names), function(name) {
    values <- lapply(records, function(record) record[[name]])
    if (any(vapply(values, is.list, logical(1)))) {
      stop('Unexpected nested value in Envirofacts column `', name, '`; use tidy = FALSE to see it.', call. = FALSE)
    }
    values[lengths(values) == 0L] <- NA
    coerce_column(unlist(values, use.names = FALSE), types[name], name)
  })
  columns
}

tidy_csv <- function(text, types) {
  text <- sub('^\ufeff', '', text)
  # read.table silently shifts values left when every row has one more field than the
  # header, so check the field counts first.
  counts <- utils::count.fields(textConnection(text), sep = ',', quote = '"', comment.char = '')
  if (length(unique(counts[!is.na(counts)])) > 1L) {
    stop('The Envirofacts CSV has rows with different numbers of fields; use tidy = FALSE to see it.', call. = FALSE)
  }
  data <- utils::read.csv(
    text = text, colClasses = 'character', na.strings = '', check.names = FALSE,
    fill = FALSE, comment.char = '', encoding = 'UTF-8', stringsAsFactors = FALSE,
    row.names = NULL
  )
  if (!nrow(data)) {
    return(empty_columns(types))
  }
  lapply(stats::setNames(names(data), names(data)), function(name) {
    coerce_column(data[[name]], types[name], name)
  })
}

# Convert one column to its schema type. Values that do not parse become NA and are
# reported through the `problem` attribute, which envirofacts_tidy() turns into one
# warning for the whole result. `type` is NA for a column the schema does not know.
coerce_column <- function(x, type, name) {
  type <- unname(type)
  type <- if (is.null(type) || is.na(type)) 'character' else type
  if (is.character(x)) {
    x <- gsub('\r\n?', '\n', x)
    x[!is.na(x) & !nzchar(x)] <- NA
  }
  failed <- function(result, source) {
    bad <- sum(is.na(result) & !is.na(source))
    if (bad) {
      attr(result, 'problem') <- sprintf('Column `%s`: %d value(s) could not be read as %s and are NA.', name, bad, type)
    }
    result
  }
  switch(type,
    character = if (is.numeric(x)) number_text(x) else as.character(x),
    double = failed(suppressWarnings(as.numeric(x)), x),
    integer = {
      number <- suppressWarnings(as.numeric(x))
      whole <- is.na(number) | (number == trunc(number) & abs(number) <= .Machine$integer.max)
      if (all(whole)) {
        failed(as.integer(number), x)
      } else {
        result <- failed(number, x)
        attr(result, 'problem') <- c(attr(result, 'problem'), sprintf(
          'Column `%s`: values are not whole numbers within the integer range; kept as double.', name
        ))
        result
      }
    },
    date = failed(as.Date(substr(as.character(x), 1L, 10L), format = '%Y-%m-%d'), x),
    datetime = failed(parse_datetime(as.character(x)), x),
    if (is.numeric(x)) number_text(x) else as.character(x)
  )
}

# A JSON number in a text column, written in full as the CSV form has it
# (as.character(1e5) is "1e+05").
number_text <- function(x) {
  out <- rep(NA_character_, length(x))
  ok <- !is.na(x)
  out[ok] <- vapply(x[ok], function(value) format(value, scientific = FALSE, trim = TRUE, digits = 15), character(1))
  out
}

# "1986-09-01 00:00:00", with optional fractional seconds or a "T" separator, or a
# bare date, all read as UTC.
parse_datetime <- function(x) {
  result <- as.POSIXct(rep(NA_real_, length(x)), origin = '1970-01-01', tz = 'UTC')
  for (format in c('%Y-%m-%d %H:%M:%OS', '%Y-%m-%dT%H:%M:%OS', '%Y-%m-%d')) {
    # strptime ignores trailing text, so only a bare date may use the date format
    todo <- is.na(result) & !is.na(x) & (format != '%Y-%m-%d' | nchar(x) == 10L)
    if (!any(todo)) {
      break
    }
    result[todo] <- as.POSIXct(strptime(x[todo], format, tz = 'UTC'))
  }
  result
}
