#' Retrieve rcra.br_gm_waste_code records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_br_gm_waste_code <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.br_gm_waste_code", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.br_gm_waste_code", params$tidy))
  result
}

#' Retrieve rcra.br_reporting records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_br_reporting <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.br_reporting", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.br_reporting", params$tidy))
  result
}

#' Retrieve rcra.br_reporting_year records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_br_reporting_year <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.br_reporting_year", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.br_reporting_year", params$tidy))
  result
}

#' Retrieve rcra.br_wr_waste_code records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_br_wr_waste_code <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.br_wr_waste_code", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.br_wr_waste_code", params$tidy))
  result
}

#' Retrieve rcra.rcr_br_lu_form_code records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_br_lu_form_code <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_br_lu_form_code", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_br_lu_form_code", params$tidy))
  result
}

#' Retrieve rcra.rcr_br_lu_form_code_1 records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_br_lu_form_code_1 <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_br_lu_form_code_1", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_br_lu_form_code_1", params$tidy))
  result
}

#' Retrieve rcra.rcr_br_lu_management_method records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_br_lu_management_method <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_br_lu_management_method", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_br_lu_management_method", params$tidy))
  result
}

#' Retrieve rcra.rcr_br_lu_source_code records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_br_lu_source_code <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_br_lu_source_code", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_br_lu_source_code", params$tidy))
  result
}

#' Retrieve rcra.rcr_br_lu_waste_minimization records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_br_lu_waste_minimization <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_br_lu_waste_minimization", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_br_lu_waste_minimization", params$tidy))
  result
}

#' Retrieve rcra.rcr_ca_area records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_ca_area <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_ca_area", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_ca_area", params$tidy))
  result
}

#' Retrieve rcra.rcr_ca_area_event records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_ca_area_event <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_ca_area_event", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_ca_area_event", params$tidy))
  result
}

#' Retrieve rcra.rcr_ca_area_unit records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_ca_area_unit <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_ca_area_unit", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_ca_area_unit", params$tidy))
  result
}

#' Retrieve rcra.rcr_ca_authority records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_ca_authority <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_ca_authority", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_ca_authority", params$tidy))
  result
}

#' Retrieve rcra.rcr_ca_authority_citation records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_ca_authority_citation <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_ca_authority_citation", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_ca_authority_citation", params$tidy))
  result
}

#' Retrieve rcra.rcr_ca_event records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_ca_event <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_ca_event", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_ca_event", params$tidy))
  result
}

#' Retrieve rcra.rcr_ca_event_authority records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_ca_event_authority <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_ca_event_authority", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_ca_event_authority", params$tidy))
  result
}

#' Retrieve rcra.rcr_ca_lu_authority records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_ca_lu_authority <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_ca_lu_authority", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_ca_lu_authority", params$tidy))
  result
}

#' Retrieve rcra.rcr_ca_lu_event_code records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_ca_lu_event_code <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_ca_lu_event_code", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_ca_lu_event_code", params$tidy))
  result
}

#' Retrieve rcra.rcr_ca_lu_statutory_citation records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_ca_lu_statutory_citation <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_ca_lu_statutory_citation", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_ca_lu_statutory_citation", params$tidy))
  result
}

#' Retrieve rcra.rcr_ce_citation records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_ce_citation <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_ce_citation", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_ce_citation", params$tidy))
  result
}

#' Retrieve rcra.rcr_ce_lu_citation records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_ce_lu_citation <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_ce_lu_citation", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_ce_lu_citation", params$tidy))
  result
}

#' Retrieve rcra.rcr_cmecomp3 records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_cmecomp3 <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_cmecomp3", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_cmecomp3", params$tidy))
  result
}

#' Retrieve rcra.rcr_em_federal_waste_code records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_em_federal_waste_code <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_em_federal_waste_code", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_em_federal_waste_code", params$tidy))
  result
}

#' Retrieve rcra.rcr_em_import records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_em_import <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_em_import", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_em_import", params$tidy))
  result
}

#' Retrieve rcra.rcr_em_import_1 records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_em_import_1 <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_em_import_1", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_em_import_1", params$tidy))
  result
}

#' Retrieve rcra.rcr_em_manifest records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_em_manifest <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_em_manifest", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_em_manifest", params$tidy))
  result
}

#' Retrieve rcra.rcr_em_pcb_info records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_em_pcb_info <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_em_pcb_info", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_em_pcb_info", params$tidy))
  result
}

#' Retrieve rcra.rcr_em_rejection records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_em_rejection <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_em_rejection", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_em_rejection", params$tidy))
  result
}

#' Retrieve rcra.rcr_em_state_waste_code records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_em_state_waste_code <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_em_state_waste_code", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_em_state_waste_code", params$tidy))
  result
}

#' Retrieve rcra.rcr_em_transporter records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_em_transporter <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_em_transporter", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_em_transporter", params$tidy))
  result
}

#' Retrieve rcra.rcr_em_waste_line records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_em_waste_line <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_em_waste_line", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_em_waste_line", params$tidy))
  result
}

#' Retrieve rcra.rcr_fa_cost_estimate records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_fa_cost_estimate <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_fa_cost_estimate", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_fa_cost_estimate", params$tidy))
  result
}

#' Retrieve rcra.rcr_fa_cost_mechanism_detail records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_fa_cost_mechanism_detail <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_fa_cost_mechanism_detail", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_fa_cost_mechanism_detail", params$tidy))
  result
}

#' Retrieve rcra.rcr_fa_lu_cost_estimate_reason records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_fa_lu_cost_estimate_reason <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_fa_lu_cost_estimate_reason", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_fa_lu_cost_estimate_reason", params$tidy))
  result
}

#' Retrieve rcra.rcr_fa_lu_fa_type records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_fa_lu_fa_type <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_fa_lu_fa_type", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_fa_lu_fa_type", params$tidy))
  result
}

#' Retrieve rcra.rcr_fa_lu_mechanism_type records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_fa_lu_mechanism_type <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_fa_lu_mechanism_type", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_fa_lu_mechanism_type", params$tidy))
  result
}

#' Retrieve rcra.rcr_fa_mechanism records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_fa_mechanism <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_fa_mechanism", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_fa_mechanism", params$tidy))
  result
}

#' Retrieve rcra.rcr_fa_mechanism_detail records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_fa_mechanism_detail <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_fa_mechanism_detail", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_fa_mechanism_detail", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_basic records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_basic <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_basic", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_basic", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_certification records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_certification <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_certification", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_certification", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_episodic_event records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_episodic_event <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_episodic_event", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_episodic_event", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_episodic_project records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_episodic_project <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_episodic_project", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_episodic_project", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_episodic_waste records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_episodic_waste <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_episodic_waste", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_episodic_waste", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_episodic_waste_code records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_episodic_waste_code <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_episodic_waste_code", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_episodic_waste_code", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_handler records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_handler <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_handler", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_handler", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_hsm_activity records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_hsm_activity <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_hsm_activity", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_hsm_activity", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_hsm_basic records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_hsm_basic <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_hsm_basic", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_hsm_basic", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_hsm_recycler records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_hsm_recycler <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_hsm_recycler", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_hsm_recycler", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_hsm_waste_code records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_hsm_waste_code <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_hsm_waste_code", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_hsm_waste_code", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_lqg_closure records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_lqg_closure <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_lqg_closure", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_lqg_closure", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_lqg_consolidation records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_lqg_consolidation <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_lqg_consolidation", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_lqg_consolidation", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_lu_country records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_lu_country <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_lu_country", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_lu_country", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_lu_county records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_lu_county <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_lu_county", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_lu_county", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_lu_episodic_project records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_lu_episodic_project <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_lu_episodic_project", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_lu_episodic_project", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_lu_foreign_state records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_lu_foreign_state <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_lu_foreign_state", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_lu_foreign_state", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_lu_generator_status records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_lu_generator_status <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_lu_generator_status", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_lu_generator_status", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_lu_hsm_facility_code records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_lu_hsm_facility_code <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_lu_hsm_facility_code", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_lu_hsm_facility_code", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_lu_naics records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_lu_naics <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_lu_naics", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_lu_naics", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_lu_other_permit records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_lu_other_permit <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_lu_other_permit", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_lu_other_permit", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_lu_relationship records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_lu_relationship <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_lu_relationship", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_lu_relationship", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_lu_relationship_1 records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_lu_relationship_1 <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_lu_relationship_1", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_lu_relationship_1", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_lu_state records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_lu_state <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_lu_state", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_lu_state", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_lu_state_activity records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_lu_state_activity <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_lu_state_activity", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_lu_state_activity", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_lu_state_activity_1 records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_lu_state_activity_1 <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_lu_state_activity_1", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_lu_state_activity_1", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_lu_state_district records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_lu_state_district <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_lu_state_district", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_lu_state_district", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_lu_universal_waste records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_lu_universal_waste <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_lu_universal_waste", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_lu_universal_waste", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_lu_waste_code records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_lu_waste_code <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_lu_waste_code", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_lu_waste_code", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_naics records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_naics <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_naics", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_naics", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_other_permit records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_other_permit <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_other_permit", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_other_permit", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_owner_operator records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_owner_operator <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_owner_operator", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_owner_operator", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_part_a records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_part_a <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_part_a", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_part_a", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_reporting records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_reporting <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_reporting", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_reporting", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_state_activity records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_state_activity <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_state_activity", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_state_activity", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_universal_waste records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_universal_waste <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_universal_waste", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_universal_waste", params$tidy))
  result
}

#' Retrieve rcra.rcr_hd_waste_code records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_hd_waste_code <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_hd_waste_code", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_hd_waste_code", params$tidy))
  result
}

#' Retrieve rcra.rcr_pm_event records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_pm_event <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_pm_event", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_pm_event", params$tidy))
  result
}

#' Retrieve rcra.rcr_pm_event_unit_detail records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_pm_event_unit_detail <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_pm_event_unit_detail", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_pm_event_unit_detail", params$tidy))
  result
}

#' Retrieve rcra.rcr_pm_lu_legal_operating_status records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_pm_lu_legal_operating_status <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_pm_lu_legal_operating_status", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_pm_lu_legal_operating_status", params$tidy))
  result
}

#' Retrieve rcra.rcr_pm_lu_permit_event_code records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_pm_lu_permit_event_code <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_pm_lu_permit_event_code", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_pm_lu_permit_event_code", params$tidy))
  result
}

#' Retrieve rcra.rcr_pm_lu_process_code records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_pm_lu_process_code <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_pm_lu_process_code", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_pm_lu_process_code", params$tidy))
  result
}

#' Retrieve rcra.rcr_pm_lu_unit_of_measure records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_pm_lu_unit_of_measure <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_pm_lu_unit_of_measure", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_pm_lu_unit_of_measure", params$tidy))
  result
}

#' Retrieve rcra.rcr_pm_mod_event records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_pm_mod_event <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_pm_mod_event", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_pm_mod_event", params$tidy))
  result
}

#' Retrieve rcra.rcr_pm_series records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_pm_series <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_pm_series", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_pm_series", params$tidy))
  result
}

#' Retrieve rcra.rcr_pm_unit records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_pm_unit <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_pm_unit", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_pm_unit", params$tidy))
  result
}

#' Retrieve rcra.rcr_pm_unit_detail records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_pm_unit_detail <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_pm_unit_detail", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_pm_unit_detail", params$tidy))
  result
}

#' Retrieve rcra.rcr_pm_unit_detail_waste records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_rcr_pm_unit_detail_waste <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.rcr_pm_unit_detail_waste", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.rcr_pm_unit_detail_waste", params$tidy))
  result
}

#' Retrieve rcra.wt_ar_2024 records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_wt_ar_2024 <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.wt_ar_2024", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.wt_ar_2024", params$tidy))
  result
}

#' Retrieve rcra.wt_notices_exports records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_wt_notices_exports <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.wt_notices_exports", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.wt_notices_exports", params$tidy))
  result
}

#' Retrieve rcra.wt_notices_imports records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family rcra endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_rcra_wt_notices_imports <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(echoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/rcra.wt_notices_imports", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("rcra.wt_notices_imports", params$tidy))
  result
}
