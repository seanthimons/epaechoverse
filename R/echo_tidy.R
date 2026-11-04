# Client-owned tidy output for ECHO wrappers. ECHO's JSON carries every value as a
# string and its Swagger schemas declare every field as `string`, so where types
# matter they are guessed from the values (unlike Envirofacts, whose schema has
# types). Lookup routes are code/description label pairs and are NOT guessed: all
# their columns stay text (a year description such as "2023" is a label, and a
# column's type must not depend on which rows came back). The guesser,
# echo_guess_column(), is for record routes with measures and dates; it only changes
# a column when that loses nothing:
#  * integer: every value is a plain whole number of at most 9 digits ("007", "+5",
#    "-0" and "1.0" stay text);
#  * double: every value is a plain decimal without exponent or trailing fractional
#    zero, with at most 15 digits;
#  * Date: every value is one strict date format (YYYY-MM-DD or MM/DD/YYYY);
#  * otherwise character.
# Columns named like identifiers (ending in ID, Code, Zip, FIPS, Number, Num or
# Phone, or starting with CAS, NAICS, SIC or Id/ID plus a capital, as in IdReturned)
# are never guessed, because an
# identifier is text even when every value happens to be digits, and its type must
# not depend on which rows a query returned. Blank strings and nulls are NA, and
# line breaks inside text are "\n" in every route kind (as in envirofacts_tidy.R).
#
# Each route kind has a `result_formatter` that specmill calls with
# list(result, params): a pure function of the decoded result and the call's
# `tidy` argument. dev/build_client.R selects echo_tidy_lookup for every
# /rest_lookups.* route (Results$LuValues). The search services listed in
# R/echo_services.R get three more kinds, each in a per-service shim
# (R/echo_formatters.R) because a formatter receives no route or service name: get_qid
# pages (echo_tidy_qid), search summaries (echo_tidy_summary) and search rows
# (echo_tidy_info). Their field types come from ECHO's own metadata routes, per service
# (inst/extdata/echo-fields.csv, written by dev/build_echo_fields.R), instead of
# guessing. echo_qid_all() (R/echo_pages.R) pages through a search's results.

# Final formatter for a lookup route. Non-JSON `output` formats arrive as strings
# and are returned as sent.
echo_tidy_lookup <- function(data) {
  tidy <- data$params$tidy
  if (!is.logical(tidy) || length(tidy) != 1L || is.na(tidy)) {
    stop('`tidy` must be TRUE or FALSE.', call. = FALSE)
  }
  result <- data$result
  if (!tidy || !is.list(result)) {
    return(result)
  }
  records <- echo_field(result, 'Results', 'LuValues')
  # A lone record might arrive as an object instead of a one-element array.
  if (is.list(records) && length(records) && !is.null(names(records))) {
    records <- list(records)
  }
  if (is.null(records) || !is.list(records) || !all(vapply(records, is.list, logical(1)))) {
    stop('Unexpected ECHO lookup response; use tidy = FALSE to see it.', call. = FALSE)
  }
  echo_records_tibble(records, guess = FALSE)
}

# A list of flat records -> tibble: text columns, or guessed types when `guess`.
echo_records_tibble <- function(records, guess = TRUE, arrays = FALSE) {
  if (!length(records)) {
    return(tibble::tibble())
  }
  text <- echo_text_columns(records, arrays = arrays)
  columns <- Map(
    function(values, name) if (guess) echo_guess_column(values, name) else echo_clean_text(values),
    text,
    names(text)
  )
  tibble::as_tibble(columns, .name_repair = 'minimal')
}

# Records -> named list of character vectors (one per field, NA for a missing or null
# value, numbers written in full). An empty array is NA too (the compliance screener
# sends CaseDefendants: [] for a facility without cases). With `arrays`, an array of
# plain values is pasted together with ", " so a search record loses nothing (as in the
# search summary); otherwise, and for an array of objects, nested values are an error.
echo_text_columns <- function(records, arrays = FALSE) {
  names <- unique(unlist(lapply(records, names), use.names = FALSE))
  plain <- function(x) is.atomic(x) && length(x) == 1L
  lapply(stats::setNames(names, names), function(name) {
    values <- lapply(records, function(record) {
      value <- record[[name]]
      # nulls inside an array carry nothing
      if (arrays && is.list(value) && is.null(names(value))) {
        value <- Filter(Negate(is.null), value)
      }
      if (is.list(value) && !length(value)) {
        NA
      } else if (arrays && is.list(value) && is.null(names(value)) && all(vapply(value, plain, logical(1)))) {
        paste(vapply(value, function(x) if (is.numeric(x)) number_text(x) else as.character(x), character(1)), collapse = ', ')
      } else {
        value
      }
    })
    if (any(vapply(values, is.list, logical(1)))) {
      stop('Unexpected nested value in ECHO field `', name, '`; use tidy = FALSE to see it.', call. = FALSE)
    }
    values[lengths(values) == 0L] <- NA
    values <- unlist(values, use.names = FALSE)
    if (is.numeric(values)) number_text(values) else as.character(values)
  })
}

echo_identifier_name <- function(name) {
  grepl('(ID|Id|Code|Zip|FIPS|Fips|Number|Num|Phone)$|^(CAS|NAICS|SIC)|^(Id|ID)[A-Z]', name)
}

# Line breaks as "\n", blank strings as NA.
echo_clean_text <- function(x) {
  x <- gsub('\r\n?', '\n', x)
  x[!is.na(x) & !nzchar(x)] <- NA
  x
}

# Character vector -> integer, double, Date or (unchanged) character.
echo_guess_column <- function(x, name = '') {
  x <- echo_clean_text(x)
  present <- x[!is.na(x)]
  if (!length(present) || echo_identifier_name(name)) {
    return(x)
  }
  if (all(grepl('^(0|-?[1-9][0-9]{0,8})$', present))) {
    return(as.integer(x))
  }
  if (all(grepl('^(0|-?[1-9][0-9]*|-?(0|[1-9][0-9]*)[.][0-9]*[1-9])$', present)) && all(nchar(gsub('[^0-9]', '', present)) <= 15L)) {
    return(as.numeric(x))
  }
  formats <- c('%Y-%m-%d' = '^[0-9]{4}-[0-9]{2}-[0-9]{2}$', '%m/%d/%Y' = '^[0-9]{2}/[0-9]{2}/[0-9]{4}$')
  for (format in names(formats)) {
    if (all(grepl(formats[[format]], present))) {
      dates <- as.Date(x, format = format)
      if (!anyNA(dates[!is.na(x)])) {
        return(dates)
      }
    }
  }
  x
}

# --- search result pages (get_qid) ---------------------------------------------

# Field name -> type (character, double or date) for one search service. The services
# share most field names but not all types (a flag is a number in one and text in
# another), so each service has its own map.
echo_field_types <- function(service) {
  echo_field_map(service)$types
}

# Object name -> database column name (the header of the CSV download; "" when the
# service lists none).
echo_field_columns <- function(service) {
  echo_field_map(service)$columns
}

echo_field_map <- function(service) {
  if (!is.character(service) || length(service) != 1L || !service %in% names(echo_search_services)) {
    stop('`service` must be one of: ', paste(names(echo_search_services), collapse = ', '), '.', call. = FALSE)
  }
  if (is.null(.echo_cache$fields)) {
    path <- system.file('extdata', 'echo-fields.csv', package = 'epaechoverse')
    if (!nzchar(path)) {
      stop('The ECHO field types are missing from the installed package.', call. = FALSE)
    }
    fields <- utils::read.csv(path, colClasses = 'character', stringsAsFactors = FALSE, na.strings = character())
    .echo_cache$fields <- lapply(
      split(fields, factor(fields$service, unique(fields$service))),
      function(rows) list(types = stats::setNames(rows$type, rows$object), columns = stats::setNames(rows$column, rows$object))
    )
  }
  map <- .echo_cache$fields[[service]]
  if (is.null(map)) {
    stop('The ECHO field types of `', service, '` are missing from the installed package.', call. = FALSE)
  }
  map
}

.echo_cache <- new.env(parent = emptyenv())

# The record list of a get_qid page, or NULL when the page has none. Each service
# names it: WaterSystems (sdw), Cases (case) or Facilities (the others). A response
# has one of them; if it ever had two, the first in .echo_record_keys wins.
echo_qid_records <- function(page) {
  results <- echo_field(page, 'Results')
  for (key in .echo_record_keys) {
    if (key %in% names(results)) {
      records <- results[[key]]
      # A null record list (the key present, the value null) is no rows.
      if (is.null(records)) {
        records <- list()
      }
      # A lone record might arrive as an object instead of a one-element array.
      if (is.list(records) && length(records) && !is.null(names(records))) {
        records <- list(records)
      }
      if (is.list(records) && (!length(records) || all(vapply(records, is.list, logical(1))))) {
        return(records)
      }
    }
  }
  NULL
}

# Records -> tibble typed by the field map: character stays text, NUMBER becomes
# double (a "$" and thousands commas are dropped first), DATE becomes Date
# (MM/DD/YYYY). A column with any value that does not convert stays text, so no value
# is lost, and the call warns once. Fields the map does not know stay text, and so
# do mapped numbers whose name looks like an identifier. `types` is a service's map,
# echo_field_types(service).
echo_qid_tibble <- function(records, types) {
  if (!length(records)) {
    return(tibble::tibble())
  }
  echo_type_columns(echo_text_columns(records, arrays = TRUE), types)
}

# Named list of character vectors (the fields of the records) -> typed tibble.
echo_type_columns <- function(text, types) {
  kept <- character()
  columns <- Map(function(values, name) {
    values <- echo_clean_text(values)
    type <- unname(types[name])
    if (is.na(type) || type == 'character' || echo_identifier_name(name)) {
      return(values)
    }
    converted <- switch(type, double = echo_parse_number(values), date = echo_parse_date(values))
    if (anyNA(converted[!is.na(values)])) {
      kept <<- c(kept, sprintf('`%s` (%s; e.g. "%s")', name, type, values[!is.na(values) & is.na(converted)][[1L]]))
      return(values)
    }
    converted
  }, text, names(text))
  if (length(kept)) {
    warning('Kept as text because some values did not convert: ', paste(kept, collapse = ', '), call. = FALSE)
  }
  tibble::as_tibble(columns, .name_repair = 'minimal')
}

echo_parse_number <- function(x) {
  suppressWarnings(as.numeric(gsub('^\\s*\\$|,|\\s+$', '', x)))
}

echo_parse_date <- function(x) {
  dates <- as.Date(rep(NA_real_, length(x)))
  ok <- !is.na(x) & grepl('^[0-9]{2}/[0-9]{2}/[0-9]{4}$', x)
  dates[ok] <- as.Date(x[ok], format = '%m/%d/%Y')
  dates
}

# Final formatter for the get_qid routes: one page of records as a typed tibble. The
# page's counters (QueryID, QueryRows, PageNo) are kept in attr(, 'query').
echo_tidy_qid <- function(data, service) {
  tidy <- data$params$tidy
  if (!is.logical(tidy) || length(tidy) != 1L || is.na(tidy)) {
    stop('`tidy` must be TRUE or FALSE.', call. = FALSE)
  }
  result <- data$result
  if (!tidy || !is.list(result)) {
    return(result)
  }
  records <- echo_qid_records(result)
  if (is.null(records)) {
    stop('Unexpected ECHO search page; use tidy = FALSE to see it.', call. = FALSE)
  }
  page <- echo_qid_tibble(records, echo_field_types(service))
  attr(page, 'query') <- echo_qid_counters(result)
  page
}

# ECHO writes QueryID, except in the emission screener's search, which writes QueryId.
echo_query_id <- function(page) {
  echo_field(page, 'Results', 'QueryID') %||% echo_field(page, 'Results', 'QueryId')
}

echo_qid_counters <- function(page) {
  number <- function(x) suppressWarnings(as.numeric(x %||% NA))
  list(
    query_id = echo_query_id(page),
    query_rows = number(echo_field(page, 'Results', 'QueryRows')),
    page_no = number(echo_field(page, 'Results', 'PageNo'))
  )
}

# --- search summaries and facility info ----------------------------------------

# Results fields that hold records or objects rather than summary values.
.echo_nested_fields <- c(.echo_record_keys, 'QueryParameters', 'Columns', 'MapOutput', 'ClusterOutput')

# The scalar fields of a search response -> one-row tibble. Counters (...Rows,
# ...Penalties, MapLocations, PageNo, PageCount, StartRec, EndRec) are doubles ("$157,500" is 157500); everything
# else, including QueryID, is text. A null field is NA, and a field that holds several
# values is pasted together with ", " (BadSystemIDs) so nothing is dropped.
echo_summary_tibble <- function(results) {
  results <- echo_summary_fields(results)
  fields <- names(results)
  text <- lapply(stats::setNames(seq_along(results), fields), function(i) {
    value <- results[[i]]
    if (is.null(value) || (is.list(value) && !length(value))) {
      NA_character_
    } else {
      parts <- if (is.list(value)) value else as.list(value)
      paste(unlist(lapply(parts, function(x) if (is.numeric(x)) number_text(x) else as.character(unlist(x)))), collapse = ', ')
    }
  })
  types <- stats::setNames(ifelse(grepl('(Rows|Penalties)$|^(PageNo|PageCount|StartRec|EndRec|MapLocations)$', fields), 'double', 'character'), fields)
  echo_type_columns(text, types)
}

# The summary values of a response, by position: ECHO can send a key twice (the
# compliance screener repeats VRows). The first one is kept, and the call warns only
# when a repeat disagrees with it.
echo_summary_fields <- function(results) {
  fields <- results[!names(results) %in% .echo_nested_fields]
  repeated <- duplicated(names(fields))
  if (any(repeated)) {
    first <- fields[match(names(fields)[repeated], names(fields))]
    differs <- !mapply(identical, fields[repeated], first)
    if (any(differs)) {
      warning(
        'ECHO sent ', paste0('`', unique(names(fields)[repeated][differs]), '`', collapse = ', '),
        ' more than once with different values; the first is kept.',
        call. = FALSE
      )
    }
    fields <- fields[!repeated]
  }
  fields
}

# The records of a search response: NULL when the response carries none, an error
# when it carries a malformed list.
echo_search_records <- function(results) {
  if (!any(.echo_record_keys %in% names(results))) {
    return(NULL)
  }
  records <- echo_qid_records(list(Results = results))
  if (is.null(records)) {
    stop('Unexpected ECHO response: the record list is malformed; use tidy = FALSE to see it.', call. = FALSE)
  }
  records
}

# Both search formatters share this guard. Returns the response when it is to be
# passed through untouched (tidy = FALSE, a string, or a list with no `Results`, as
# GeoJSON output has), otherwise NULL. With `strict`, a `Results` that is an unnamed
# list is an error; echo_tidy_nested() passes such a response through instead.
echo_search_passthrough <- function(data, strict = TRUE) {
  tidy <- data$params$tidy
  if (!is.logical(tidy) || length(tidy) != 1L || is.na(tidy)) {
    stop('`tidy` must be TRUE or FALSE.', call. = FALSE)
  }
  result <- data$result
  if (!tidy || !is.list(result) || !is.list(result$Results)) {
    return(list(result))
  }
  if (strict && length(result$Results) && is.null(names(result$Results))) {
    stop('Unexpected ECHO response: `Results` is a list without names; use tidy = FALSE to see it.', call. = FALSE)
  }
  NULL
}

# Final formatter for the search routes (get_facilities, get_systems): the query
# summary as a one-row tibble. When the response also carries the first page of rows
# (tablelist = "Y"), the typed rows are in attr(, "facilities"), and a map object in
# attr(, "map_output").
echo_tidy_summary <- function(data, service) {
  passthrough <- echo_search_passthrough(data)
  if (!is.null(passthrough)) {
    return(passthrough[[1L]])
  }
  results <- data$result$Results
  summary <- echo_summary_tibble(results)
  records <- echo_search_records(results)
  if (!is.null(records)) {
    attr(summary, 'facilities') <- echo_qid_tibble(records, echo_field_types(service))
  }
  if (!is.null(results[['MapOutput']])) {
    attr(summary, 'map_output') <- results[['MapOutput']]
  }
  summary
}

# Final formatter for get_facility_info: the matching facilities as a typed tibble.
# attr(, "query") has the query ID and row count, attr(, "summary") the one-row
# summary, attr(, "parameters") the query as ECHO read it, attr(, "columns") ECHO's
# column list where it sends one, and clustered or map output, if requested, is kept
# as attr(, "cluster_output") / attr(, "map_output").
# ECHO answers a large query with clusters instead of facilities (110 clusters for
# 22,508 rows), so the tibble then has no rows and the call warns; echo_qid_all()
# fetches such a query's rows.
echo_tidy_info <- function(data, service) {
  passthrough <- echo_search_passthrough(data)
  if (!is.null(passthrough)) {
    return(passthrough[[1L]])
  }
  results <- data$result$Results
  records <- echo_search_records(results)
  rows <- if (is.null(records)) tibble::tibble() else echo_qid_tibble(records, echo_field_types(service))
  attr(rows, 'query') <- echo_qid_counters(data$result)
  attr(rows, 'summary') <- echo_summary_tibble(results)
  # The parameters are only informational: a surprising shape must not fail the call.
  parameters <- results[['QueryParameters']]
  if (is.list(parameters) && length(parameters) && !is.null(names(parameters))) {
    parameters <- list(parameters)
  }
  if (length(parameters)) {
    attr(rows, 'parameters') <- tryCatch(tibble::as_tibble(echo_text_columns(parameters)), error = function(e) NULL)
  }
  # The air monitoring services describe their columns; kept as informational too.
  columns <- results[['Columns']]
  if (is.list(columns) && length(columns) && all(vapply(columns, is.list, logical(1)))) {
    attr(rows, 'columns') <- tryCatch(tibble::as_tibble(echo_text_columns(columns)), error = function(e) NULL)
  }
  if (is.null(records) && !is.null(results[['ClusterOutput']])) {
    warning(
      'ECHO returned clusters, not facilities, for this ',
      format(attr(rows, 'query')$query_rows, big.mark = ','),
      '-row query. Use echo_qid_all(x, service) to fetch the rows.',
      call. = FALSE
    )
  }
  for (name in c('ClusterOutput', 'MapOutput')) {
    if (!is.null(results[[name]])) {
      attr(rows, if (name == 'ClusterOutput') 'cluster_output' else 'map_output') <- results[[name]]
    }
  }
  rows
}

# --- report routes ---------------------------------------------------------------

# Final formatter for a report route that holds one flat list of records under `key`
# (echo_report_routes in R/echo_services.R): the records as an all-text tibble (the
# service declares no types; blank values are NA; a record's nested values are
# list-columns), and the scalar summary fields as a one-row tibble in
# attr(, "summary"). A response without the key is an error.
echo_tidy_report <- function(data, key) {
  passthrough <- echo_search_passthrough(data)
  if (!is.null(passthrough)) {
    return(passthrough[[1L]])
  }
  results <- data$result$Results
  if (!key %in% names(results)) {
    stop('Unexpected ECHO report: no `', key, '` in the response; use tidy = FALSE to see it.', call. = FALSE)
  }
  records <- results[[key]]
  if (is.null(records)) {
    records <- list()
  }
  # A lone record might arrive as an object instead of a one-element array.
  if (is.list(records) && length(records) && !is.null(names(records))) {
    records <- list(records)
  }
  if (!is.list(records) || !all(vapply(records, is.list, logical(1)))) {
    stop('Unexpected ECHO report: `', key, '` is not a list of records; use tidy = FALSE to see it.', call. = FALSE)
  }
  rows <- echo_array_table(records)
  summary <- echo_summary_tibble(results[names(results) != key])
  if (ncol(summary)) {
    attr(rows, 'summary') <- summary
  }
  rows
}

# --- CSV downloads -----------------------------------------------------------------

# Final formatter for a service's get_download route: the CSV of a query's rows as the
# same typed tibble that echo_qid_all() returns. The CSV header is the field name in most
# services and the database column (facility_case_name) in a few; a header that is not
# a field name but matches one column of the service is renamed to its field. Values are
# typed like the pages are (echo_type_columns); a header the map does not know stays
# text. Other output formats and tidy = FALSE are returned as sent.
echo_tidy_download <- function(data, service) {
  tidy <- data$params$tidy
  if (!is.logical(tidy) || length(tidy) != 1L || is.na(tidy)) {
    stop('`tidy` must be TRUE or FALSE.', call. = FALSE)
  }
  result <- data$result
  if (!tidy || !is.character(result) || length(result) != 1L) {
    return(result)
  }
  text <- sub('^\ufeff', '', result)
  if (!nzchar(trimws(text))) {
    return(tibble::tibble())
  }
  connection <- textConnection(text)
  counts <- utils::count.fields(connection, sep = ',', quote = '"', comment.char = '')
  close(connection)
  if (length(unique(counts[!is.na(counts)])) > 1L) {
    stop('The ECHO CSV has rows with different numbers of fields; use tidy = FALSE to see it.', call. = FALSE)
  }
  rows <- utils::read.csv(
    text = text, colClasses = 'character', na.strings = '', check.names = FALSE,
    fill = FALSE, comment.char = '', encoding = 'UTF-8', stringsAsFactors = FALSE, row.names = NULL
  )
  types <- echo_field_types(service)
  header <- names(rows)
  columns <- echo_field_columns(service)
  columns <- columns[nzchar(columns)]
  match_at <- match(tolower(header), tolower(columns))
  rename <- !header %in% names(types) & !is.na(match_at) & !duplicated(match_at) & !duplicated(match_at, fromLast = TRUE)
  renamed <- names(columns)[match_at]
  # a rename that would collide with a header that stays is skipped on its own
  rename <- rename & !renamed %in% header[!rename] & !duplicated(renamed) & !duplicated(renamed, fromLast = TRUE)
  header[rename] <- renamed[rename]
  names(rows) <- header
  echo_type_columns(lapply(rows, identity), types)
}

# --- nested reports (dfr, caa) ----------------------------------------------------------

# Final formatter for a nested report (the detailed facility report and the air
# pollutant report): a named list of tibbles, one for each table in the report, never
# an error for an unfamiliar shape. A report is a tree: an array of records is a table,
# the plain values of an object are a one-row table, and an object that holds further
# arrays or objects is walked. Names are the path through the report joined with ".";
# the plain values at the top are "summary" (a repeated name gets a numeric suffix).
# Columns are text (the services declare no
# types), blank values are NA, and a record's own nested values stay as list-columns, so
# nothing is lost. An empty array is an empty table. Responses without `Results` (or
# with an unnamed one), strings and tidy = FALSE are returned as sent.
echo_tidy_nested <- function(data) {
  passthrough <- echo_search_passthrough(data, strict = FALSE)
  if (!is.null(passthrough)) {
    return(passthrough[[1L]])
  }
  results <- data$result$Results
  if (length(results) && is.null(names(results))) {
    return(data$result)
  }
  tables <- list()
  labels <- character()
  add <- function(label, table) {
    tables[[length(tables) + 1L]] <<- table
    labels[[length(labels) + 1L]] <<- label
  }
  walk <- function(x, path) {
    nested <- vapply(x, is.list, logical(1))
    if (any(!nested)) {
      add(if (nzchar(path)) path else 'summary', echo_scalar_row(x[!nested]))
    }
    # by position: a key may repeat
    for (i in which(nested)) {
      child <- x[[i]]
      at <- if (nzchar(path)) paste(path, names(x)[[i]], sep = '.') else names(x)[[i]]
      if (is.null(names(child))) {
        add(at, echo_array_table(child))
      } else {
        walk(child, at)
      }
    }
  }
  if (length(results)) {
    walk(results, '')
  }
  if (length(tables)) {
    names(tables) <- make.unique(labels, sep = '_')
  }
  tables
}

# Named plain values -> one-row text tibble (a NULL is NA).
echo_scalar_row <- function(values) {
  text <- lapply(values, function(value) {
    if (!length(value)) NA_character_ else if (is.numeric(value)) number_text(value) else as.character(value)
  })
  tibble::as_tibble(lapply(echo_clean_text_all(text), identity), .name_repair = 'minimal')
}

echo_clean_text_all <- function(columns) {
  lapply(columns, function(x) echo_clean_text(as.character(x)))
}

# An unnamed array -> tibble: records are rows (plain fields text, nested fields
# list-columns); an array of plain values is one `value` column.
echo_array_table <- function(items) {
  if (!length(items)) {
    return(tibble::tibble())
  }
  if (!all(vapply(items, function(item) is.list(item) && !is.null(names(item)), logical(1)))) {
    # plain values are a text column; anything else (arrays of arrays, a mix of records
    # and plain values) is kept whole as a list-column
    if (!any(vapply(items, is.list, logical(1)))) {
      return(tibble::tibble(value = echo_clean_text(vapply(items, function(item) {
        if (!length(item)) NA_character_ else if (is.numeric(item)) number_text(item) else as.character(item)
      }, character(1)))))
    }
    return(tibble::tibble(value = items))
  }
  names <- unique(unlist(lapply(items, names), use.names = FALSE))
  columns <- lapply(stats::setNames(names, names), function(name) {
    values <- lapply(items, function(item) item[[name]])
    if (any(vapply(values, is.list, logical(1)))) {
      values
    } else {
      values[lengths(values) == 0L] <- NA
      values <- unlist(values, use.names = FALSE)
      echo_clean_text(if (is.numeric(values)) number_text(values) else as.character(values))
    }
  })
  tibble::as_tibble(columns, .name_repair = 'minimal')
}
