#' ECHO BP Tribes Lookup Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param search_term Enter a partial or complete search phrase or word.
#' @param search_code Enter a partial or complete code value.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_lookups_bp_tribes <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- cwa_request(method = "GET", path = "/rest_lookups.bp_tribes", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO BP Tribes Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_lookups_bp_tribes_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- cwa_request(method = "POST", path = "/rest_lookups.bp_tribes", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' ECHO CWA Parameter Lookup Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param search_term Enter a partial or complete search phrase or word.
#' @param search_code Enter a partial or complete code value.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_lookups_cwa_parameters <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- cwa_request(method = "GET", path = "/rest_lookups.cwa_parameters", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO CWA Parameter Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_lookups_cwa_parameters_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- cwa_request(method = "POST", path = "/rest_lookups.cwa_parameters", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' ECHO CWA Pollutants Lookup Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param search_term Enter a partial or complete search phrase or word.
#' @param search_code Enter a partial or complete code value.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_lookups_cwa_pollutants <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- cwa_request(method = "GET", path = "/rest_lookups.cwa_pollutants", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO CWA Pollutants Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_lookups_cwa_pollutants_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- cwa_request(method = "POST", path = "/rest_lookups.cwa_pollutants", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' ECHO Federal Agency Lookup Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param search_term Enter a partial or complete search phrase or word.
#' @param search_code Enter a partial or complete code value.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_lookups_federal_agencies <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- cwa_request(method = "GET", path = "/rest_lookups.federal_agencies", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO Federal Agency Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_lookups_federal_agencies_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- cwa_request(method = "POST", path = "/rest_lookups.federal_agencies", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' ECHO ICIS NPDES Inspection Types Lookup Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param search_term Enter a partial or complete search phrase or word.
#' @param search_code Enter a partial or complete code value.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_lookups_icis_inspection_types <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- cwa_request(method = "GET", path = "/rest_lookups.icis_inspection_types", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO ICIS NPDES Inspection Types Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_lookups_icis_inspection_types_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- cwa_request(method = "POST", path = "/rest_lookups.icis_inspection_types", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' ECHO ICIS NPDES Law Sections Lookup Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param statute_code statute_code
#' @param status_flag status_flag
#' @param search_term Enter a partial or complete search phrase or word.
#' @param search_code Enter a partial or complete code value.
#' @param sort_order sort_order
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_lookups_icis_law_sections <- function(output = NULL, callback = NULL, statute_code = NULL, status_flag = NULL, search_term = NULL, search_code = NULL, sort_order = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "statute_code" = statute_code, "status_flag" = status_flag, "search_term" = search_term, "search_code" = search_code, "sort_order" = sort_order), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), statute_code = list(name = "statute_code", "in" = "query", type = "string"), status_flag = list(name = "status_flag", "in" = "query", type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string"), sort_order = list(name = "sort_order", "in" = "query", 
    type = "number")), .api_validation$body_value, c(output = "query", callback = "query", statute_code = "query", status_flag = "query", search_term = "query", search_code = "query", sort_order = "query"))
  params <- base::list("output" = output, "callback" = callback, "statute_code" = statute_code, "status_flag" = status_flag, "search_term" = search_term, "search_code" = search_code, "sort_order" = sort_order)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["statute_code"]]) && base::any(!base::nzchar(params[["statute_code"]]))) base::stop("Empty query parameter: statute_code")
  if (base::is.character(params[["status_flag"]]) && base::any(!base::nzchar(params[["status_flag"]]))) base::stop("Empty query parameter: status_flag")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  if (base::is.character(params[["sort_order"]]) && base::any(!base::nzchar(params[["sort_order"]]))) base::stop("Empty query parameter: sort_order")
  result <- cwa_request(method = "GET", path = "/rest_lookups.icis_law_sections", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "statute_code" = params[["statute_code"]], "status_flag" = params[["status_flag"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]], "sort_order" = params[["sort_order"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO ICIS NPDES Law Sections Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_lookups_icis_law_sections_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), statute_code = list(type = "string"), status_flag = list(type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string"), sort_order = list(type = "number")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- cwa_request(method = "POST", path = "/rest_lookups.icis_law_sections", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), statute_code = list(), status_flag = list(), search_term = list(), search_code = list(), sort_order = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), statute_code = list(type = "string"), status_flag = list(type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string"), sort_order = list(type = "number")), required = list()))
  result
}

#' ECHO NAICS Codes Lookup Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param search_term Enter a partial or complete search phrase or word.
#' @param search_code Enter a partial or complete code value.
#' @param n_year Year parameter in the YYYY format, defaults to 2022.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_lookups_naics_codes <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL, n_year = 2022) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code, "n_year" = n_year), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string"), n_year = list(name = "n_year", "in" = "query", description = "Year parameter in the YYYY format, defaults to 2022.", default = 2022L, type = "number")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query", n_year = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code, "n_year" = n_year)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  if (base::is.character(params[["n_year"]]) && base::any(!base::nzchar(params[["n_year"]]))) base::stop("Empty query parameter: n_year")
  result <- cwa_request(method = "GET", path = "/rest_lookups.naics_codes", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]], "n_year" = params[["n_year"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO NAICS Codes Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_lookups_naics_codes_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string"), n_year = list(description = "Year parameter in the YYYY format, defaults to 2022.", default = 2022L, type = "number")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- cwa_request(method = "POST", path = "/rest_lookups.naics_codes", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list(), n_year = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string"), n_year = list(description = "Year parameter in the YYYY format, defaults to 2022.", default = 2022L, type = "number")), required = list()))
  result
}

#' ECHO NPDES Parameters Lookup Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param search_term Enter a partial or complete search phrase or word.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_lookups_npdes_parameters <- function(output = NULL, callback = NULL, search_term = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  result <- cwa_request(method = "GET", path = "/rest_lookups.npdes_parameters", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO NPDES Parameters Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_lookups_npdes_parameters_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- cwa_request(method = "POST", path = "/rest_lookups.npdes_parameters", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string")), required = list()))
  result
}

#' ECHO WBD Code Lookup Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param wbd_code Two-digit watershed code [Hydrologic Unit Code (HUC)].
#' @param wbd_level The number of digits of the watershed code [Hydrologic Unit Code (HUC)] returned in the ValueCode. Must be an even number between 4 and 12.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_lookups_wbd_code_lu <- function(output = NULL, callback = NULL, wbd_code = NULL, wbd_level = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "wbd_code" = wbd_code, "wbd_level" = wbd_level), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), wbd_code = list(name = "wbd_code", "in" = "query", description = "Two-digit watershed code [Hydrologic Unit Code (HUC)].", type = "string"), wbd_level = list(name = "wbd_level", "in" = "query", description = "The number of digits of the watershed code [Hydrologic Unit Code (HUC)] returned in the ValueCode. Must be an even number between 4 and 12.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", wbd_code = "query", wbd_level = "query"))
  params <- base::list("output" = output, "callback" = callback, "wbd_code" = wbd_code, "wbd_level" = wbd_level)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["wbd_code"]]) && base::any(!base::nzchar(params[["wbd_code"]]))) base::stop("Empty query parameter: wbd_code")
  if (base::is.character(params[["wbd_level"]]) && base::any(!base::nzchar(params[["wbd_level"]]))) base::stop("Empty query parameter: wbd_level")
  result <- cwa_request(method = "GET", path = "/rest_lookups.wbd_code_lu", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "wbd_code" = params[["wbd_code"]], "wbd_level" = params[["wbd_level"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO WBD Code Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_lookups_wbd_code_lu_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), wbd_code = list(description = "Two-digit watershed code [Hydrologic Unit Code (HUC)].", type = "string"), wbd_level = list(description = "The number of digits of the watershed code [Hydrologic Unit Code (HUC)] returned in the ValueCode. Must be an even number between 4 and 12.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- cwa_request(method = "POST", path = "/rest_lookups.wbd_code_lu", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), wbd_code = list(), wbd_level = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), wbd_code = list(description = "Two-digit watershed code [Hydrologic Unit Code (HUC)].", type = "string"), wbd_level = list(description = "The number of digits of the watershed code [Hydrologic Unit Code (HUC)] returned in the ValueCode. Must be an even number between 4 and 12.", type = "string")), required = list()))
  result
}

#' ECHO WBD Name Lookup Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param wbd_name Watershed Name Filter.
#' @param wbd_level The number of digits of the watershed code [Hydrologic Unit Code (HUC)] returned in the ValueCode. Must be an even number between 4 and 12.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_lookups_wbd_name_lu <- function(output = NULL, callback = NULL, wbd_name, wbd_level = NULL) {
  if (base::is.null(wbd_name)) base::stop("Required input: wbd_name")
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "wbd_name" = wbd_name, "wbd_level" = wbd_level), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), wbd_name = list(name = "wbd_name", "in" = "query", description = "Watershed Name Filter.", type = "string"), wbd_level = list(name = "wbd_level", "in" = "query", description = "The number of digits of the watershed code [Hydrologic Unit Code (HUC)] returned in the ValueCode. Must be an even number between 4 and 12.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", wbd_name = "query", wbd_level = "query"))
  params <- base::list("output" = output, "callback" = callback, "wbd_name" = wbd_name, "wbd_level" = wbd_level)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["wbd_name"]]) && base::any(!base::nzchar(params[["wbd_name"]]))) base::stop("Empty query parameter: wbd_name")
  if (base::is.character(params[["wbd_level"]]) && base::any(!base::nzchar(params[["wbd_level"]]))) base::stop("Empty query parameter: wbd_level")
  result <- cwa_request(method = "GET", path = "/rest_lookups.wbd_name_lu", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "wbd_name" = params[["wbd_name"]], "wbd_level" = params[["wbd_level"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO WBD Name Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_lookups_wbd_name_lu_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), wbd_name = list(description = "Watershed Name Filter.", type = "string"), wbd_level = list(description = "The number of digits of the watershed code [Hydrologic Unit Code (HUC)] returned in the ValueCode. Must be an even number between 4 and 12.", type = "string")), required = list("wbd_name")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- cwa_request(method = "POST", path = "/rest_lookups.wbd_name_lu", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), wbd_name = list(), wbd_level = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), wbd_name = list(description = "Watershed Name Filter.", type = "string"), wbd_level = list(description = "The number of digits of the watershed code [Hydrologic Unit Code (HUC)] returned in the ValueCode. Must be an even number between 4 and 12.", type = "string")), required = list("wbd_name")))
  result
}

#' ECHO MSGP Annual Report Years Lookup Servicve
#' 
#' @noMd
#' @param ascending Output Sort Column Ascending Flag.  Enter Y to sort results in ascending order.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_lookups_msgp_years <- function(ascending = NULL) {
  .api_validation$parameter_values(base::list("ascending" = ascending), list(ascending = list(name = "ascending", "in" = "query", description = "Output Sort Column Ascending Flag.  Enter Y to sort results in ascending order.", enum = list("Y"), type = "string")), .api_validation$body_value, c(ascending = "query"))
  params <- base::list("ascending" = ascending)
  if (base::is.character(params[["ascending"]]) && base::any(!base::nzchar(params[["ascending"]]))) base::stop("Empty query parameter: ascending")
  result <- cwa_request(method = "GET", path = "/rest_lookups.msgp_years", path_params = base::list(), query = base::list("ascending" = params[["ascending"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO MSGP Annual Report Years Lookup Servicve
#' 
#' @noMd
#' @param ascending Output Sort Column Ascending Flag.  Enter Y to sort results in ascending order.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_lookups_msgp_years_post <- function(ascending = NULL) {
  .api_validation$parameter_values(base::list("ascending" = ascending), list(ascending = list(name = "ascending", "in" = "query", description = "Output Sort Column Ascending Flag.  Enter Y to sort results in ascending order.", enum = list("Y"), type = "string")), .api_validation$body_value, c(ascending = "query"))
  params <- base::list("ascending" = ascending)
  if (base::is.character(params[["ascending"]]) && base::any(!base::nzchar(params[["ascending"]]))) base::stop("Empty query parameter: ascending")
  result <- cwa_request(method = "POST", path = "/rest_lookups.msgp_years", path_params = base::list(), query = base::list("ascending" = params[["ascending"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}
