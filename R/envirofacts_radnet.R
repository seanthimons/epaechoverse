#' Retrieve radnet.erm_air_benchmark records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family radnet endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_radnet_erm_air_benchmark <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/radnet.erm_air_benchmark", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("radnet.erm_air_benchmark", params$tidy))
  result
}

#' Retrieve radnet.erm_ana_proc records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family radnet endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_radnet_erm_ana_proc <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/radnet.erm_ana_proc", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("radnet.erm_ana_proc", params$tidy))
  result
}

#' Retrieve radnet.erm_analysis records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family radnet endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_radnet_erm_analysis <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/radnet.erm_analysis", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("radnet.erm_analysis", params$tidy))
  result
}

#' Retrieve radnet.erm_analyte records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family radnet endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_radnet_erm_analyte <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/radnet.erm_analyte", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("radnet.erm_analyte", params$tidy))
  result
}

#' Retrieve radnet.erm_count records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family radnet endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_radnet_erm_count <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/radnet.erm_count", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("radnet.erm_count", params$tidy))
  result
}

#' Retrieve radnet.erm_det_type records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family radnet endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_radnet_erm_det_type <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/radnet.erm_det_type", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("radnet.erm_det_type", params$tidy))
  result
}

#' Retrieve radnet.erm_location records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family radnet endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_radnet_erm_location <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/radnet.erm_location", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("radnet.erm_location", params$tidy))
  result
}

#' Retrieve radnet.erm_location_ll records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family radnet endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_radnet_erm_location_ll <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/radnet.erm_location_ll", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("radnet.erm_location_ll", params$tidy))
  result
}

#' Retrieve radnet.erm_matrix records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family radnet endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_radnet_erm_matrix <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/radnet.erm_matrix", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("radnet.erm_matrix", params$tidy))
  result
}

#' Retrieve radnet.erm_milk_benchmark records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family radnet endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_radnet_erm_milk_benchmark <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/radnet.erm_milk_benchmark", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("radnet.erm_milk_benchmark", params$tidy))
  result
}

#' Retrieve radnet.erm_precip_benchmark records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family radnet endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_radnet_erm_precip_benchmark <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/radnet.erm_precip_benchmark", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("radnet.erm_precip_benchmark", params$tidy))
  result
}

#' Retrieve radnet.erm_project records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family radnet endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_radnet_erm_project <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/radnet.erm_project", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("radnet.erm_project", params$tidy))
  result
}

#' Retrieve radnet.erm_result records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family radnet endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_radnet_erm_result <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/radnet.erm_result", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("radnet.erm_result", params$tidy))
  result
}

#' Retrieve radnet.erm_sample records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family radnet endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_radnet_erm_sample <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/radnet.erm_sample", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("radnet.erm_sample", params$tidy))
  result
}

#' Retrieve radnet.erm_study records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family radnet endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_radnet_erm_study <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/radnet.erm_study", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("radnet.erm_study", params$tidy))
  result
}

#' Retrieve radnet.erm_water_benchmark records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family radnet endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_radnet_erm_water_benchmark <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/radnet.erm_water_benchmark", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("radnet.erm_water_benchmark", params$tidy))
  result
}

#' Retrieve radnet.erm_years records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json or csv.
#' @param tidy Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv.
#' @return Decoded response returned by the client request helper.
#' @family radnet endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_radnet_erm_years <- function(filter = NULL, first = 1L, last = 100L, format = "json", tidy = TRUE) {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format, "tidy" = tidy)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/radnet.erm_years", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = envirofacts_response_policy("radnet.erm_years", params$tidy))
  result
}
