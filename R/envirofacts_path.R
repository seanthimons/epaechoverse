# Client-owned request-path builder shared by every envirofacts_* wrapper. The
# wrappers are generated from EPA's DMAP OpenAPI document, which declares no
# parameters: the service takes filters, a row range and the output format as
# path segments,
#   /schema.table/<column>/<operator>/<value>[/and/...]/<first>:<last>/<format>
# and streams the whole table when no range is given. Generation binds each
# wrapper's path to this function (dev/callbacks.R), so a call can never be
# unbounded: the range always has values, is validated here and is capped.

# Rows one call may request. Raise it with options(epaechoverse.max_rows = n).
envirofacts_max_rows <- function() {
  cap <- getOption('epaechoverse.max_rows', 10000)
  envirofacts_row(cap, 'epaechoverse.max_rows')
  cap
}

# One finite whole number in 1..integer max, as the number it will be written as:
# as.character(2e5) is "2e+05", which the server could read as a reversed range.
envirofacts_row <- function(x, name) {
  if (!is.numeric(x) || length(x) != 1L || is.na(x) || !is.finite(x) || x != trunc(x) ||
        x < 1 || x > .Machine$integer.max) {
    stop(sprintf('`%s` must be a single whole number between 1 and %d.', name, .Machine$integer.max), call. = FALSE)
  }
  sprintf('%d', as.integer(x))
}

envirofacts_path <- function(table_path, filter = NULL, first = 1L, last = 100L, format = 'json') {
  if (!is.character(table_path) || length(table_path) != 1L || !grepl('^/[a-z0-9_]+[.][a-z0-9_]+$', table_path)) {
    stop('`table_path` must look like "/schema.table".', call. = FALSE)
  }
  from <- envirofacts_row(first, 'first')
  to <- envirofacts_row(last, 'last')
  # Double arithmetic: integer overflow would turn the count into NA.
  rows <- as.numeric(last) - as.numeric(first) + 1
  if (rows < 1) {
    stop('`first` must not be greater than `last`.', call. = FALSE)
  }
  cap <- envirofacts_max_rows()
  if (rows > cap) {
    stop(sprintf(
      'Requested %s rows but a call may return at most %s; request a smaller range or raise options(epaechoverse.max_rows).',
      format(rows, scientific = FALSE, big.mark = ','), format(cap, scientific = FALSE, big.mark = ',')
    ), call. = FALSE)
  }
  if (!is.character(format) || length(format) != 1L || !format %in% c('json', 'csv', 'xml')) {
    stop('`format` must be one of "json", "csv" or "xml".', call. = FALSE)
  }
  paste0(table_path, envirofacts_filter_path(filter), '/', from, ':', to, '/', format)
}

# `filter` is a character vector of "column/operator/value" conditions, all of
# which must hold (they are joined with /and/). Column and operator are plain
# identifiers; the value is percent-encoded. Anything that could add or change
# path segments is rejected instead of encoded, so a filter cannot smuggle in its
# own row range or format: values may not contain "/", "\" or "%", be empty, ".",
# "..", or contain control characters.
envirofacts_filter_path <- function(filter) {
  if (is.null(filter) || !length(filter)) {
    return('')
  }
  if (!is.character(filter) || anyNA(filter)) {
    stop('`filter` must be a character vector of "column/operator/value" conditions.', call. = FALSE)
  }
  segments <- vapply(filter, function(condition) {
    parts <- regmatches(condition, regexec('^([^/]+)/([^/]+)/(.*)$', condition))[[1L]]
    if (length(parts) != 4L) {
      stop(sprintf('Filter "%s" must look like "column/operator/value".', condition), call. = FALSE)
    }
    column <- parts[[2L]]
    operator <- parts[[3L]]
    value <- parts[[4L]]
    identifier <- '^[A-Za-z][A-Za-z0-9_]*$'
    if (!grepl(identifier, column) || !grepl(identifier, operator)) {
      stop(sprintf('Filter "%s": column and operator must be plain names (letters, digits, underscore).', condition), call. = FALSE)
    }
    if (!nzchar(value) || value %in% c('.', '..') || grepl('[/\\\\%[:cntrl:]]', value)) {
      stop(sprintf('Filter "%s": the value must not be empty, "." or "..", or contain "/", "\\" or "%%" or control characters.', condition), call. = FALSE)
    }
    paste(column, operator, utils::URLencode(value, reserved = TRUE, repeated = TRUE), sep = '/')
  }, character(1), USE.NAMES = FALSE)
  paste0('/', paste(segments, collapse = '/and/'))
}
