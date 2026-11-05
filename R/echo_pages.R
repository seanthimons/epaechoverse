#' Fetch every page of an ECHO facility search
#'
#' ECHO's facility searches are two steps: the search call (for example
#' [cwa_get_facilities()]) returns a summary and a query ID, and the rows come from
#' the matching `get_qid` function, 500 to 5,000 to a page. `echo_qid_all()` requests the
#' pages in turn and returns all the rows as one tibble, typed from ECHO's own
#' metadata: counts and amounts are numbers, dates are `Date`s, and codes and IDs
#' stay text. The pages are typed together, so a column cannot change type between
#' them. It stops when the rows ECHO says the query has are all in, or at an empty
#' page, or after `max_pages`.
#'
#' @param qid The query ID, the summary a search function returned (a one-row
#'   tibble, or the list with `tidy = FALSE`), or a tibble of rows that carries its
#'   query in `attr(, "query")`.
#' @param service Which service ran the search: `"sdw"`, `"cwa"`, `"rcra"`, `"air"`,
#'   `"echo"`, `"compscreen"`, `"case"`, `"ecattaqs"`, `"ecattams"`, `"ecattems"`, `"cwa_viotrack"`
#'   or `"rcra_viotrack"`.
#' @param max_pages The most pages to request (default 20, which is 100,000 rows).
#'   A warning says how many rows were left when the limit stops the call.
#' @param ... Further arguments for the service's `get_qid` function, such as
#'   `qcolumns`, `newsort` or `descending`. `pageno` and `tidy` are set here.
#' @return A tibble. `attr(, "query")` holds the query ID, the number of rows ECHO
#'   reports, the rows returned and the pages requested.
#' @examples
#' \dontrun{
#' search <- cwa_get_facilities(p_st = "RI", p_maj = "Y")
#' echo_qid_all(search, "cwa")
#' }
#' @export
echo_qid_all <- function(qid, service, max_pages = 20L, ...) {
  if (missing(service)) {
    stop('`service` is required: one of ', paste0('"', names(echo_search_services), '"', collapse = ', '), '.', call. = FALSE)
  }
  service <- match.arg(service, names(echo_search_services))
  if (is.data.frame(qid)) {
    # rows carry their query in attr "query", which wins over a search summary's QueryID column
    qid <- attr(qid, 'query')$query_id %||% (if (nrow(qid) == 1L && 'QueryID' %in% names(qid)) qid[['QueryID']])
  } else if (is.list(qid)) {
    qid <- echo_query_id(qid)
  }
  if (is.numeric(qid) && length(qid) == 1L && !is.na(qid) && qid == trunc(qid)) {
    qid <- format(qid, scientific = FALSE, trim = TRUE)
  }
  if (!is.character(qid) || length(qid) != 1L || is.na(qid) || !nzchar(qid)) {
    stop('`qid` must be a query ID string or the list a search function returned.', call. = FALSE)
  }
  if (!is.numeric(max_pages) || length(max_pages) != 1L || is.na(max_pages) || max_pages < 1 || max_pages != trunc(max_pages)) {
    stop('`max_pages` must be a whole number of at least 1.', call. = FALSE)
  }
  extra <- list(...)
  if (length(extra) && (is.null(names(extra)) || any(!nzchar(names(extra))))) {
    stop('Arguments in `...` must be named.', call. = FALSE)
  }
  if (any(c('pageno', 'tidy', 'qid', 'output', 'callback') %in% names(extra))) {
    stop('`pageno`, `tidy`, `qid`, `output` and `callback` are set by echo_qid_all().', call. = FALSE)
  }
  fetch <- get(paste0(service, '_get_qid'), envir = topenv(environment()), mode = 'function')
  parts <- list()
  collected <- 0L
  expected <- NA_real_
  pages <- 0L
  repeat {
    pages <- pages + 1L
    page <- do.call(fetch, c(list(qid = qid, pageno = pages, tidy = FALSE), extra))
    if (inherits(page, 'httr2_request')) {
      stop('echo_qid_all() cannot run with the dry-run option on.', call. = FALSE)
    }
    found <- echo_qid_records(page)
    if (is.null(found)) {
      stop('Unexpected ECHO search page; call ', service, '_get_qid(tidy = FALSE) to see it.', call. = FALSE)
    }
    if (pages == 1L) {
      expected <- echo_qid_counters(page)$query_rows
    }
    # Keep each page as text columns, not as lists of records: far smaller for a big query.
    if (length(found)) {
      parts[[length(parts) + 1L]] <- echo_text_columns(found, arrays = TRUE)
    }
    collected <- collected + length(found)
    if (!length(found) || (!is.na(expected) && collected >= expected)) {
      break
    }
    if (pages >= max_pages) {
      warning(
        sprintf(
          'Stopped after %d page(s) with %s%s rows; raise `max_pages` for the rest.',
          pages, format(collected, big.mark = ','),
          if (is.na(expected)) '' else paste0(' of ', format(expected, big.mark = ','))
        ),
        call. = FALSE
      )
      break
    }
  }
  # Type once, over every page, so a column cannot change type between pages.
  result <- if (length(parts)) echo_type_columns(echo_bind_text(parts), echo_field_types(service)) else tibble::tibble()
  attr(result, 'query') <- list(query_id = qid, query_rows = expected, rows = nrow(result), pages = pages)
  result
}

# Per-page named lists of character vectors -> one named list; a field a page lacks
# is NA for that page's rows.
echo_bind_text <- function(parts) {
  names <- unique(unlist(lapply(parts, names), use.names = FALSE))
  sizes <- vapply(parts, function(part) length(part[[1L]]), integer(1))
  lapply(stats::setNames(names, names), function(name) {
    unlist(lapply(seq_along(parts), function(i) {
      if (name %in% names(parts[[i]])) parts[[i]][[name]] else rep(NA_character_, sizes[[i]])
    }), use.names = FALSE)
  })
}
