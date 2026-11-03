#' Retrieve sems.envirofacts_contaminants records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family sems endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_sems_envirofacts_contaminants <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/sems.envirofacts_contaminants", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("sems.envirofacts_contaminants", params$tidy))
  result
}

#' Retrieve sems.envirofacts_site records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family sems endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_sems_envirofacts_site <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/sems.envirofacts_site", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("sems.envirofacts_site", params$tidy))
  result
}
