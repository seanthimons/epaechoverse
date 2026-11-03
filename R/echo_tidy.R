# Client-owned tidy output for ECHO wrappers. ECHO's JSON carries every value as a
# string and its Swagger schemas declare every field as `string`, so column types
# are guessed from the values (unlike Envirofacts, whose schema has types). The
# guess only changes a column when that loses nothing:
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
# line breaks inside text are "\n" (as in envirofacts_tidy.R).
#
# Each route kind has a `result_formatter` that specmill calls with
# list(result, params): a pure function of the decoded result and the call's
# `tidy` argument. dev/build_client.R selects echo_tidy_lookup for every
# /rest_lookups.* route (Results$LuValues).

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
  echo_records_tibble(records)
}

# A list of flat records -> tibble with guessed column types.
echo_records_tibble <- function(records) {
  if (!length(records)) {
    return(tibble::tibble())
  }
  names <- unique(unlist(lapply(records, names), use.names = FALSE))
  columns <- lapply(stats::setNames(names, names), function(name) {
    values <- lapply(records, function(record) record[[name]])
    if (any(vapply(values, is.list, logical(1)))) {
      stop('Unexpected nested value in ECHO field `', name, '`; use tidy = FALSE to see it.', call. = FALSE)
    }
    values[lengths(values) == 0L] <- NA
    values <- unlist(values, use.names = FALSE)
    echo_guess_column(if (is.numeric(values)) number_text(values) else as.character(values), name)
  })
  tibble::as_tibble(columns, .name_repair = 'minimal')
}

echo_identifier_name <- function(name) {
  grepl('(ID|Id|Code|Zip|FIPS|Fips|Number|Num|Phone)$|^(CAS|NAICS|SIC)|^(Id|ID)[A-Z]', name)
}

# Character vector -> integer, double, Date or (unchanged) character.
echo_guess_column <- function(x, name = '') {
  x <- gsub('\r\n?', '\n', x)
  x[!is.na(x) & !nzchar(x)] <- NA
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
