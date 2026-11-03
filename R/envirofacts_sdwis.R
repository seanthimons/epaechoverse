#' Retrieve sdwis.enforcement records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json, csv or xml.
#' @return Decoded response returned by the client request helper.
#' @family sdwis endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_sdwis_enforcement <- function(filter = NULL, first = 1L, last = 100L, format = "json") {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/sdwis.enforcement", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = "echo_response_policy")
  result
}

#' Retrieve sdwis.enforcement_action records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json, csv or xml.
#' @return Decoded response returned by the client request helper.
#' @family sdwis endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_sdwis_enforcement_action <- function(filter = NULL, first = 1L, last = 100L, format = "json") {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/sdwis.enforcement_action", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = "echo_response_policy")
  result
}

#' Retrieve sdwis.geographic_area records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json, csv or xml.
#' @return Decoded response returned by the client request helper.
#' @family sdwis endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_sdwis_geographic_area <- function(filter = NULL, first = 1L, last = 100L, format = "json") {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/sdwis.geographic_area", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = "echo_response_policy")
  result
}

#' Retrieve sdwis.lcr_sample records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json, csv or xml.
#' @return Decoded response returned by the client request helper.
#' @family sdwis endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_sdwis_lcr_sample <- function(filter = NULL, first = 1L, last = 100L, format = "json") {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/sdwis.lcr_sample", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = "echo_response_policy")
  result
}

#' Retrieve sdwis.lcr_sample_result records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json, csv or xml.
#' @return Decoded response returned by the client request helper.
#' @family sdwis endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_sdwis_lcr_sample_result <- function(filter = NULL, first = 1L, last = 100L, format = "json") {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/sdwis.lcr_sample_result", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = "echo_response_policy")
  result
}

#' Retrieve sdwis.pws records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json, csv or xml.
#' @return Decoded response returned by the client request helper.
#' @family sdwis endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_sdwis_pws <- function(filter = NULL, first = 1L, last = 100L, format = "json") {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/sdwis.pws", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = "echo_response_policy")
  result
}

#' Retrieve sdwis.pws_county records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json, csv or xml.
#' @return Decoded response returned by the client request helper.
#' @family sdwis endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_sdwis_pws_county <- function(filter = NULL, first = 1L, last = 100L, format = "json") {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/sdwis.pws_county", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = "echo_response_policy")
  result
}

#' Retrieve sdwis.ref_code_value records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json, csv or xml.
#' @return Decoded response returned by the client request helper.
#' @family sdwis endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_sdwis_ref_code_value <- function(filter = NULL, first = 1L, last = 100L, format = "json") {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/sdwis.ref_code_value", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = "echo_response_policy")
  result
}

#' Retrieve sdwis.ref_primacy_agency records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json, csv or xml.
#' @return Decoded response returned by the client request helper.
#' @family sdwis endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_sdwis_ref_primacy_agency <- function(filter = NULL, first = 1L, last = 100L, format = "json") {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/sdwis.ref_primacy_agency", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = "echo_response_policy")
  result
}

#' Retrieve sdwis.ref_rule_application records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json, csv or xml.
#' @return Decoded response returned by the client request helper.
#' @family sdwis endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_sdwis_ref_rule_application <- function(filter = NULL, first = 1L, last = 100L, format = "json") {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/sdwis.ref_rule_application", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = "echo_response_policy")
  result
}

#' Retrieve sdwis.ref_rule_family records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json, csv or xml.
#' @return Decoded response returned by the client request helper.
#' @family sdwis endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_sdwis_ref_rule_family <- function(filter = NULL, first = 1L, last = 100L, format = "json") {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/sdwis.ref_rule_family", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = "echo_response_policy")
  result
}

#' Retrieve sdwis.ref_violation records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json, csv or xml.
#' @return Decoded response returned by the client request helper.
#' @family sdwis endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_sdwis_ref_violation <- function(filter = NULL, first = 1L, last = 100L, format = "json") {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/sdwis.ref_violation", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = "echo_response_policy")
  result
}

#' Retrieve sdwis.sdw_contaminants records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json, csv or xml.
#' @return Decoded response returned by the client request helper.
#' @family sdwis endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_sdwis_sdw_contaminants <- function(filter = NULL, first = 1L, last = 100L, format = "json") {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/sdwis.sdw_contaminants", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = "echo_response_policy")
  result
}

#' Retrieve sdwis.sdw_county_served records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json, csv or xml.
#' @return Decoded response returned by the client request helper.
#' @family sdwis endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_sdwis_sdw_county_served <- function(filter = NULL, first = 1L, last = 100L, format = "json") {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/sdwis.sdw_county_served", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = "echo_response_policy")
  result
}

#' Retrieve sdwis.sdw_viol_enforcement records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json, csv or xml.
#' @return Decoded response returned by the client request helper.
#' @family sdwis endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_sdwis_sdw_viol_enforcement <- function(filter = NULL, first = 1L, last = 100L, format = "json") {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/sdwis.sdw_viol_enforcement", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = "echo_response_policy")
  result
}

#' Retrieve sdwis.service_area records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json, csv or xml.
#' @return Decoded response returned by the client request helper.
#' @family sdwis endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_sdwis_service_area <- function(filter = NULL, first = 1L, last = 100L, format = "json") {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/sdwis.service_area", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = "echo_response_policy")
  result
}

#' Retrieve sdwis.treatment records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json, csv or xml.
#' @return Decoded response returned by the client request helper.
#' @family sdwis endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_sdwis_treatment <- function(filter = NULL, first = 1L, last = 100L, format = "json") {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/sdwis.treatment", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = "echo_response_policy")
  result
}

#' Retrieve sdwis.violation records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json, csv or xml.
#' @return Decoded response returned by the client request helper.
#' @family sdwis endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_sdwis_violation <- function(filter = NULL, first = 1L, last = 100L, format = "json") {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/sdwis.violation", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = "echo_response_policy")
  result
}

#' Retrieve sdwis.violation_enf_assoc records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json, csv or xml.
#' @return Decoded response returned by the client request helper.
#' @family sdwis endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_sdwis_violation_enf_assoc <- function(filter = NULL, first = 1L, last = 100L, format = "json") {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/sdwis.violation_enf_assoc", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = "echo_response_policy")
  result
}

#' Retrieve sdwis.water_system records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json, csv or xml.
#' @return Decoded response returned by the client request helper.
#' @family sdwis endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_sdwis_water_system <- function(filter = NULL, first = 1L, last = 100L, format = "json") {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/sdwis.water_system", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = "echo_response_policy")
  result
}

#' Retrieve sdwis.water_system_facility records
#' 
#' @noMd
#' @param filter Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none.
#' @param first First row to return (1-based).
#' @param last Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.
#' @param format Output format: json, csv or xml.
#' @return Decoded response returned by the client request helper.
#' @family sdwis endpoints
#' @export
# Generated with specmill; do not edit by hand.
envirofacts_sdwis_water_system_facility <- function(filter = NULL, first = 1L, last = 100L, format = "json") {
  .api_validation$parameter_values(base::list("first" = first, "last" = last), list(first = list(type = "integer", description = "First row to return (1-based).", minimum = 1L), last = list(type = "integer", description = "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call.", minimum = 1L)), .api_validation$body_value, c(first = "client", last = "client"))
  params <- base::list("filter" = filter, "first" = first, "last" = last, "format" = format)
  result <- envirofacts_request("method" = "GET", "path" = envirofacts_path("/sdwis.water_system_facility", params$filter, params$first, params$last, params$format), "path_params" = base::list(), "query" = base::list(), "body" = NULL, "request_controls" = list(timeout = 120L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = "echo_response_policy")
  result
}
