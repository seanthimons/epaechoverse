#' Retrieve nggs.applicant_type_lk records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family nggs endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_nggs_applicant_type_lk <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/nggs.applicant_type_lk", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("nggs.applicant_type_lk", params$tidy))
  result
}

#' Retrieve nggs.grant_prg_name_lk records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family nggs endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_nggs_grant_prg_name_lk <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/nggs.grant_prg_name_lk", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("nggs.grant_prg_name_lk", params$tidy))
  result
}

#' Retrieve nggs.ogd_vw_ef_base records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family nggs endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_nggs_ogd_vw_ef_base <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/nggs.ogd_vw_ef_base", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("nggs.ogd_vw_ef_base", params$tidy))
  result
}

#' Retrieve nggs.ogd_vw_ef_base_with_pop records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family nggs endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_nggs_ogd_vw_ef_base_with_pop <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/nggs.ogd_vw_ef_base_with_pop", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("nggs.ogd_vw_ef_base_with_pop", params$tidy))
  result
}

#' Retrieve nggs.ogd_vw_ef_cfda records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family nggs endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_nggs_ogd_vw_ef_cfda <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/nggs.ogd_vw_ef_cfda", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("nggs.ogd_vw_ef_cfda", params$tidy))
  result
}

#' Retrieve nggs.ogd_vw_ef_grant_cfda records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family nggs endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_nggs_ogd_vw_ef_grant_cfda <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/nggs.ogd_vw_ef_grant_cfda", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("nggs.ogd_vw_ef_grant_cfda", params$tidy))
  result
}

#' Retrieve nggs.ogd_vw_ef_grant_sa records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family nggs endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_nggs_ogd_vw_ef_grant_sa <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/nggs.ogd_vw_ef_grant_sa", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("nggs.ogd_vw_ef_grant_sa", params$tidy))
  result
}

#' Retrieve nggs.ogd_vw_ef_sa records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family nggs endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_nggs_ogd_vw_ef_sa <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/nggs.ogd_vw_ef_sa", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("nggs.ogd_vw_ef_sa", params$tidy))
  result
}
