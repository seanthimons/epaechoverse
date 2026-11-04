#' ECHO Clean Air Targeting Tool AQS Available Reporting Years Lookup Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return a tibble of text columns (blank values are NA). FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A tibble of text columns (tidy = TRUE, the default for JSON output) or the decoded response (tidy = FALSE).
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_lookups_ecatt_aqs_years <- function(output = NULL, callback = NULL, tidy = TRUE) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), .api_validation$body_value, c(output = "query", callback = "query"))
  params <- base::list("output" = output, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- ecattaqs_request(method = "GET", path = "/rest_lookups.ecatt_aqs_years", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_lookup", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' ECHO Clean Air Targeting Tool AQS Available Reporting Years Lookup Service
#' 
#' @noMd
#' @param tidy Return a tibble of text columns (blank values are NA). FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A tibble of text columns (tidy = TRUE, the default for JSON output) or the decoded response (tidy = FALSE).
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_lookups_ecatt_aqs_years_post <- function(body = NULL, tidy = TRUE) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- ecattaqs_request(method = "POST", path = "/rest_lookups.ecatt_aqs_years", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), required = list()))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_lookup", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' ECHO Clean Air Targeting Tool AQS Pollutants Standards Lookup Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param search_term Enter a partial or complete search phrase or word.
#' @param search_code Enter a partial or complete code value.
#' @param tidy Return a tibble of text columns (blank values are NA). FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A tibble of text columns (tidy = TRUE, the default for JSON output) or the decoded response (tidy = FALSE).
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_lookups_ecatt_aqs_pollutant_standards <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL, tidy = TRUE) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- ecattaqs_request(method = "GET", path = "/rest_lookups.ecatt_aqs_pollutant_standards", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_lookup", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' ECHO Clean Air Targeting Tool AQS Pollutants Standards Lookup Service
#' 
#' @noMd
#' @param tidy Return a tibble of text columns (blank values are NA). FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A tibble of text columns (tidy = TRUE, the default for JSON output) or the decoded response (tidy = FALSE).
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_lookups_ecatt_aqs_pollutant_standards_post <- function(body = NULL, tidy = TRUE) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- ecattaqs_request(method = "POST", path = "/rest_lookups.ecatt_aqs_pollutant_standards", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_lookup", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' ECHO Clean Air Targeting Tool AQS Pollutants Lookup Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param search_term Enter a partial or complete search phrase or word.
#' @param search_code Enter a partial or complete code value.
#' @param tidy Return a tibble of text columns (blank values are NA). FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A tibble of text columns (tidy = TRUE, the default for JSON output) or the decoded response (tidy = FALSE).
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_lookups_ecatt_aqs_polls <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL, tidy = TRUE) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- ecattaqs_request(method = "GET", path = "/rest_lookups.ecatt_aqs_polls", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_lookup", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' ECHO Clean Air Targeting Tool AQS Pollutants Lookup Service
#' 
#' @noMd
#' @param tidy Return a tibble of text columns (blank values are NA). FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A tibble of text columns (tidy = TRUE, the default for JSON output) or the decoded response (tidy = FALSE).
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_lookups_ecatt_aqs_polls_post <- function(body = NULL, tidy = TRUE) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- ecattaqs_request(method = "POST", path = "/rest_lookups.ecatt_aqs_polls", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_lookup", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}
