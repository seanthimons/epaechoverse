#' Retrieve tri.tri_additional_info records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_additional_info <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_additional_info", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_additional_info", params$tidy))
  result
}

#' Retrieve tri.tri_chem_activity records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_chem_activity <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_chem_activity", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_chem_activity", params$tidy))
  result
}

#' Retrieve tri.tri_chem_info records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_chem_info <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_chem_info", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_chem_info", params$tidy))
  result
}

#' Retrieve tri.tri_code_desc records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_code_desc <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_code_desc", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_code_desc", params$tidy))
  result
}

#' Retrieve tri.tri_county records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_county <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_county", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_county", params$tidy))
  result
}

#' Retrieve tri.tri_energy_recovery records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_energy_recovery <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_energy_recovery", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_energy_recovery", params$tidy))
  result
}

#' Retrieve tri.tri_facility records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_facility <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_facility", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_facility", params$tidy))
  result
}

#' Retrieve tri.tri_facility_db records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_facility_db <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_facility_db", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_facility_db", params$tidy))
  result
}

#' Retrieve tri.tri_facility_db_history records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_facility_db_history <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_facility_db_history", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_facility_db_history", params$tidy))
  result
}

#' Retrieve tri.tri_facility_history records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_facility_history <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_facility_history", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_facility_history", params$tidy))
  result
}

#' Retrieve tri.tri_facility_npdes records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_facility_npdes <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_facility_npdes", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_facility_npdes", params$tidy))
  result
}

#' Retrieve tri.tri_facility_npdes_history records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_facility_npdes_history <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_facility_npdes_history", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_facility_npdes_history", params$tidy))
  result
}

#' Retrieve tri.tri_facility_rcra records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_facility_rcra <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_facility_rcra", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_facility_rcra", params$tidy))
  result
}

#' Retrieve tri.tri_facility_rcra_history records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_facility_rcra_history <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_facility_rcra_history", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_facility_rcra_history", params$tidy))
  result
}

#' Retrieve tri.tri_facility_uic records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_facility_uic <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_facility_uic", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_facility_uic", params$tidy))
  result
}

#' Retrieve tri.tri_facility_uic_history records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_facility_uic_history <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_facility_uic_history", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_facility_uic_history", params$tidy))
  result
}

#' Retrieve tri.tri_form_activity_subuse records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_form_activity_subuse <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_form_activity_subuse", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_form_activity_subuse", params$tidy))
  result
}

#' Retrieve tri.tri_form_r_schedule_one records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_form_r_schedule_one <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_form_r_schedule_one", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_form_r_schedule_one", params$tidy))
  result
}

#' Retrieve tri.tri_form_totals records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_form_totals <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_form_totals", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_form_totals", params$tidy))
  result
}

#' Retrieve tri.tri_off_site_transfer_location records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_off_site_transfer_location <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_off_site_transfer_location", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_off_site_transfer_location", params$tidy))
  result
}

#' Retrieve tri.tri_onsite_waste_treatment_met records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_onsite_waste_treatment_met <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_onsite_waste_treatment_met", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_onsite_waste_treatment_met", params$tidy))
  result
}

#' Retrieve tri.tri_onsite_wastestream records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_onsite_wastestream <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_onsite_wastestream", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_onsite_wastestream", params$tidy))
  result
}

#' Retrieve tri.tri_potw_location records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_potw_location <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_potw_location", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_potw_location", params$tidy))
  result
}

#' Retrieve tri.tri_recycling_process records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_recycling_process <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_recycling_process", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_recycling_process", params$tidy))
  result
}

#' Retrieve tri.tri_release_qty records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_release_qty <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_release_qty", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_release_qty", params$tidy))
  result
}

#' Retrieve tri.tri_reporting_form records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_reporting_form <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_reporting_form", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_reporting_form", params$tidy))
  result
}

#' Retrieve tri.tri_source_reduct_method records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_source_reduct_method <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_source_reduct_method", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_source_reduct_method", params$tidy))
  result
}

#' Retrieve tri.tri_source_reduct_qty records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_source_reduct_qty <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_source_reduct_qty", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_source_reduct_qty", params$tidy))
  result
}

#' Retrieve tri.tri_submission_naics records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_submission_naics <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_submission_naics", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_submission_naics", params$tidy))
  result
}

#' Retrieve tri.tri_submission_sic records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_submission_sic <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_submission_sic", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_submission_sic", params$tidy))
  result
}

#' Retrieve tri.tri_transfer_qty records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_transfer_qty <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_transfer_qty", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_transfer_qty", params$tidy))
  result
}

#' Retrieve tri.tri_tribe_desc records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_tribe_desc <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_tribe_desc", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_tribe_desc", params$tidy))
  result
}

#' Retrieve tri.tri_trips_comment records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_trips_comment <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_trips_comment", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_trips_comment", params$tidy))
  result
}

#' Retrieve tri.tri_water_stream records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_water_stream <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_water_stream", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_water_stream", params$tidy))
  result
}

#' Retrieve tri.tri_zip_code records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family tri endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_tri_tri_zip_code <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/tri.tri_zip_code", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("tri.tri_zip_code", params$tidy))
  result
}
