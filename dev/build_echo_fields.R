# Write inst/extdata/echo-fields.csv: the type of every field ECHO's facility search
# services return, per service, read from each service's `metadata` route
# (Results$ResultColumns). R/echo_tidy.R uses it to type the records of get_qid pages,
# search rows and search tables. Needs the network (one request per service, paced).
# Run from the project root after ECHO changes a service's metadata:
#   Rscript dev/build_echo_fields.R [project root = .]
#
# `ObjectName` is the JSON field name of a record; `DataType` is the database type:
# CHAR, VARCHAR2 and NVARCHAR2 -> character, NUMBER -> double, DATE -> date
# (ECHO writes dates as MM/DD/YYYY). The services share field names but not always
# types (a flag is a number in one service and text in another), so the file has one
# row per service and field: service, object, type, column (the database column,
# which is the header of the service's CSV download). Fields absent from a service's map
# stay text. `extras` below are fields the records carry that no metadata describes
# (typed by hand, added to every service).
#
# A service without a `metadata` route (metadata = FALSE in R/echo_services.R:
# ecattems) is typed from a live sample instead, once, and the result is frozen in the
# CSV: a field is a number when every non-blank value in the sample is a plain decimal
# (no leading zero, so "02840" stays text; ".6" is fine), a date when every value is MM/DD/YYYY, and
# text otherwise, and always text when its name looks like an identifier or the sample
# has no value for it. `overrides` corrects fields by hand, and the tidy code keeps a
# column as text, with a warning, if a later value does not convert, so a wrong guess
# costs a warning, never a value. Review the proposal printed for the sample before
# committing the CSV; rerun the script when the service changes.

root <- normalizePath(if (length(commandArgs(TRUE))) commandArgs(TRUE)[[1L]] else '.', winslash = '/', mustWork = TRUE)
source(file.path(root, 'R', 'echo_services.R'), local = TRUE)
# echo_identifier_name(), echo_text_columns() and what they use
source(file.path(root, 'R', 'echo_response_policy.R'), local = TRUE)
source(file.path(root, 'R', 'envirofacts_tidy.R'), local = TRUE)
source(file.path(root, 'R', 'echo_tidy.R'), local = TRUE)
metadata_services <- Filter(function(service) service$metadata, echo_search_services)
services <- vapply(metadata_services, function(service) service$namespace, character(1))

# Services typed from a sample: the route, the keys of the queries to sample, and fields
# whose guessed type is corrected by hand.
samples <- list(
  ecattems = list(
    queries = lapply(c('RI', 'VT', 'DE', 'NH'), function(state) list(output = 'JSON', p_year = '2020', p_st = state)),
    # a year is a label, like ReportingYear in the metadata of the other services
    overrides = c(SearchYear = 'character')
  )
)
stopifnot(setequal(names(samples), names(Filter(function(service) !service$metadata, echo_search_services))))

sample_types <- function(service) {
  entry <- echo_search_services[[service]]
  records <- list()
  for (query in samples[[service]]$queries) {
    Sys.sleep(1)
    url <- sprintf('https://echodata.epa.gov/echo/%s.%s', entry$namespace, entry$info)
    request <- httr2::req_retry(do.call(httr2::req_url_query, c(list(httr2::request(url)), query)), max_tries = 3)
    page <- httr2::resp_body_json(httr2::req_perform(request))
    found <- echo_qid_records(page)
    stopifnot(!is.null(found))
    records <- c(records, found)
  }
  text <- echo_text_columns(records, arrays = TRUE)
  # the column list of the last page names each field's database column (the header of
  # the CSV download); a field it does not list has none
  listed <- page$Results$Columns
  column_of <- stats::setNames(
    vapply(listed, function(entry) entry$fieldName, character(1)),
    vapply(listed, function(entry) entry$tagName, character(1))
  )
  types <- vapply(names(text), function(name) {
    values <- text[[name]][!is.na(text[[name]]) & nzchar(text[[name]])]
    if (!length(values) || echo_identifier_name(name)) {
      'character'
    } else if (all(grepl('^-?((0|[1-9][0-9]*)([.][0-9]+)?|[.][0-9]+)$', values))) {
      'double'
    } else if (all(grepl('^[0-9]{2}/[0-9]{2}/[0-9]{4}$', values)) && !anyNA(echo_parse_date(values))) {
      'date'
    } else {
      'character'
    }
  }, character(1))
  types[names(samples[[service]]$overrides)] <- samples[[service]]$overrides
  message(service, ': ', length(records), ' sample records, ', length(types), ' fields')
  message('  double: ', paste(names(types)[types == 'double'], collapse = ', '))
  message('  date: ', paste(names(types)[types == 'date'], collapse = ', '))
  message('  never filled: ', paste(names(text)[vapply(text, function(v) all(is.na(v) | !nzchar(v)), logical(1))], collapse = ', '))
  data.frame(
    object = names(types), data_type = NA_character_, type = unname(types),
    column = unname(column_of[names(types)]), stringsAsFactors = FALSE
  )
}

fetch <- function(namespace) {
  url <- sprintf('https://echodata.epa.gov/echo/%s.metadata?output=JSON', namespace)
  response <- httr2::req_perform(httr2::req_retry(httr2::request(url), max_tries = 3))
  columns <- httr2::resp_body_json(response)$Results$ResultColumns
  stopifnot(length(columns) > 0L)
  data.frame(
    object = vapply(columns, function(column) column$ObjectName, character(1)),
    data_type = vapply(columns, function(column) column$DataType, character(1)),
    column = vapply(columns, function(column) column$ColumnName, character(1)),
    stringsAsFactors = FALSE
  )
}

type_of <- function(data_type) {
  switch(data_type,
    CHAR = , VARCHAR2 = , NVARCHAR2 = 'character',
    NUMBER = 'double',
    DATE = 'date',
    stop('Unknown ECHO data type: ', data_type, call. = FALSE)
  )
}

extras <- c(MaxScore = 'double')

typed <- function(service) {
  if (service %in% names(samples)) {
    fields <- sample_types(service)
  } else {
    Sys.sleep(1)
    fields <- fetch(services[[service]])
    fields$type <- vapply(fields$data_type, type_of, character(1))
  }
  stopifnot(!anyDuplicated(fields$object), !any(names(extras) %in% fields$object))
  data.frame(
    service = service,
    object = c(fields$object, names(extras)),
    type = c(fields$type, unname(extras)),
    column = c(fields$column, rep(NA_character_, length(extras))),
    stringsAsFactors = FALSE,
    row.names = NULL
  )
}
map <- do.call(rbind, lapply(names(echo_search_services), typed))
dir.create(file.path(root, 'inst', 'extdata'), showWarnings = FALSE, recursive = TRUE)
# `column` is the database column name, the header of the service's CSV download
map$column <- ifelse(is.na(map$column), '', map$column)
stopifnot(!anyDuplicated(map[map$column != '', c('service', 'column')]))
utils::write.csv(map, file.path(root, 'inst', 'extdata', 'echo-fields.csv'), row.names = FALSE)
message(
  'Wrote ', nrow(map), ' rows for ', length(echo_search_services), ' services: ',
  paste(names(table(map$type)), table(map$type), collapse = ', ')
)
