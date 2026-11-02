#' ECHO Air Pollutants Lookup Service
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
lookup_air_pollutants <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.air_pollutants", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO Air Pollutants Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_air_pollutants_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.air_pollutants", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' Placeholder
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
lookup_bio_analy_method_category <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.bio_analy_method_category", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_bio_analy_method_category_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.bio_analy_method_category", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' Placeholder
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
lookup_bio_analytical_method <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.bio_analytical_method", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_bio_analytical_method_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.bio_analytical_method", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' Placeholder
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
lookup_bio_container_type <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.bio_container_type", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_bio_container_type_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.bio_container_type", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' Placeholder
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
lookup_bio_mgmt_practice_handler <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.bio_mgmt_practice_handler", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_bio_mgmt_practice_handler_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.bio_mgmt_practice_handler", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' Placeholder
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param search_term Enter a partial or complete search phrase or word.
#' @param search_code Enter a partial or complete code value.
#' @param search_subcode Enter a partial or complete code value.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_bio_mgmt_practice_subtype <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL, search_subcode = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code, "search_subcode" = search_subcode), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string"), search_subcode = list(name = "search_subcode", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query", search_subcode = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code, "search_subcode" = search_subcode)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  if (base::is.character(params[["search_subcode"]]) && base::any(!base::nzchar(params[["search_subcode"]]))) base::stop("Empty query parameter: search_subcode")
  result <- lookup_request(method = "GET", path = "/rest_lookups.bio_mgmt_practice_subtype", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]], "search_subcode" = params[["search_subcode"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_bio_mgmt_practice_subtype_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string"), search_subcode = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.bio_mgmt_practice_subtype", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list(), search_subcode = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string"), search_subcode = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' Placeholder
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
lookup_bio_mgmt_practice_type <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.bio_mgmt_practice_type", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_bio_mgmt_practice_type_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.bio_mgmt_practice_type", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' Placeholder
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
lookup_bio_mgmt_practice_typesubtype <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.bio_mgmt_practice_typesubtype", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_bio_mgmt_practice_typesubtype_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.bio_mgmt_practice_typesubtype", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' Placeholder
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
lookup_bio_pathogen_class <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.bio_pathogen_class", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_bio_pathogen_class_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.bio_pathogen_class", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' Placeholder
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param search_term Enter a partial or complete search phrase or word.
#' @param search_code Enter a partial or complete code value.
#' @param search_subcode Enter a partial or complete code value.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_bio_pathogen_reduction <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL, search_subcode = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code, "search_subcode" = search_subcode), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string"), search_subcode = list(name = "search_subcode", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query", search_subcode = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code, "search_subcode" = search_subcode)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  if (base::is.character(params[["search_subcode"]]) && base::any(!base::nzchar(params[["search_subcode"]]))) base::stop("Empty query parameter: search_subcode")
  result <- lookup_request(method = "GET", path = "/rest_lookups.bio_pathogen_reduction", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]], "search_subcode" = params[["search_subcode"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_bio_pathogen_reduction_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string"), search_subcode = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.bio_pathogen_reduction", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list(), search_subcode = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string"), search_subcode = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' Placeholder
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
lookup_bio_treatment_process <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.bio_treatment_process", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_bio_treatment_process_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.bio_treatment_process", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' Placeholder
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
lookup_bio_vector_reduction <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.bio_vector_reduction", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_bio_vector_reduction_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.bio_vector_reduction", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' Placeholder
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param registry_id registry_id
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_biosolids_by_registry_id <- function(output = NULL, callback = NULL, registry_id = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "registry_id" = registry_id), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), registry_id = list(name = "registry_id", "in" = "query", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", registry_id = "query"))
  params <- base::list("output" = output, "callback" = callback, "registry_id" = registry_id)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["registry_id"]]) && base::any(!base::nzchar(params[["registry_id"]]))) base::stop("Empty query parameter: registry_id")
  result <- lookup_request(method = "GET", path = "/rest_lookups.biosolids_by_registry_id", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "registry_id" = params[["registry_id"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_biosolids_by_registry_id_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), registry_id = list(type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.biosolids_by_registry_id", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), registry_id = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), registry_id = list(type = "string")), required = list()))
  result
}

#' Placeholder
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
lookup_bio_vio_code <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.bio_vio_code", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_bio_vio_code_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.bio_vio_code", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

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
lookup_bp_tribes <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.bp_tribes", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
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
lookup_bp_tribes_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.bp_tribes", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' ECHO Counties Lookup Service
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
lookup_counties <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.counties", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO Counties Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_counties_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.counties", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' ECHO CP Citations Lookup Service
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
lookup_cp_citations <- function(output = NULL, callback = NULL, search_term = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  result <- lookup_request(method = "GET", path = "/rest_lookups.cp_citations", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO CP Citations Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_cp_citations_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.cp_citations", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string")), required = list()))
  result
}

#' Placeholder
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param agency_desc agency_desc
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_cwa_pagency_lu <- function(output = NULL, callback = NULL, agency_desc = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "agency_desc" = agency_desc), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), agency_desc = list(name = "agency_desc", "in" = "query", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", agency_desc = "query"))
  params <- base::list("output" = output, "callback" = callback, "agency_desc" = agency_desc)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["agency_desc"]]) && base::any(!base::nzchar(params[["agency_desc"]]))) base::stop("Empty query parameter: agency_desc")
  result <- lookup_request(method = "GET", path = "/rest_lookups.cwa_pagency_lu", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "agency_desc" = params[["agency_desc"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_cwa_pagency_lu_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), agency_desc = list(type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.cwa_pagency_lu", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), agency_desc = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), agency_desc = list(type = "string")), required = list()))
  result
}

#' Placeholder
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param state_code Two-letter state code
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_cwa_state_regions <- function(output = NULL, callback = NULL, state_code) {
  if (base::is.null(state_code)) base::stop("Required input: state_code")
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "state_code" = state_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), state_code = list(name = "state_code", "in" = "query", description = "Two-letter state code", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", state_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "state_code" = state_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["state_code"]]) && base::any(!base::nzchar(params[["state_code"]]))) base::stop("Empty query parameter: state_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.cwa_state_regions", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "state_code" = params[["state_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_cwa_state_regions_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), state_code = list(description = "Two-letter state code", type = "string")), required = list("state_code")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.cwa_state_regions", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), state_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), state_code = list(description = "Two-letter state code", type = "string")), required = list("state_code")))
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
lookup_cwa_parameters <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.cwa_parameters", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
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
lookup_cwa_parameters_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.cwa_parameters", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
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
lookup_cwa_pollutants <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.cwa_pollutants", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
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
lookup_cwa_pollutants_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.cwa_pollutants", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' ECHO Clean Air Targeting Tool EIS Types Lookup Service
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
lookup_ecatt_eis_types <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.ecatt_eis_types", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO Clean Air Targeting Tool EIS Types Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_ecatt_eis_types_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.ecatt_eis_types", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' ECHO Clean Air Targeting Tool Most Recent Common Year Lookup Service
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
lookup_ecatt_most_rcnt_cmmn_yr <- function(output = NULL, callback = NULL, search_term = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  result <- lookup_request(method = "GET", path = "/rest_lookups.ecatt_most_rcnt_cmmn_yr", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO Clean Air Targeting Tool Most Recent Common Year Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_ecatt_most_rcnt_cmmn_yr_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.ecatt_most_rcnt_cmmn_yr", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string")), required = list()))
  result
}

#' ECHO Clean Air Targeting Tool Most Recent Year Lookup Service
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
lookup_ecatt_most_rcnt_yr <- function(output = NULL, callback = NULL, search_term = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  result <- lookup_request(method = "GET", path = "/rest_lookups.ecatt_most_rcnt_yr", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO Clean Air Targeting Tool Most Recent Year Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_ecatt_most_rcnt_yr_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.ecatt_most_rcnt_yr", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string")), required = list()))
  result
}

#' ECHO Clean Air Targeting Tool NEI SCC Code Lookup Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param search_term Enter a partial or complete search phrase or word.
#' @param search_code Enter a partial or complete code value.
#' @param scc_level scc_level
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_ecatt_nei_scc_codes <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL, scc_level = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code, "scc_level" = scc_level), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string"), scc_level = list(name = "scc_level", "in" = "query", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query", scc_level = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code, "scc_level" = scc_level)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  if (base::is.character(params[["scc_level"]]) && base::any(!base::nzchar(params[["scc_level"]]))) base::stop("Empty query parameter: scc_level")
  result <- lookup_request(method = "GET", path = "/rest_lookups.ecatt_nei_scc_codes", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]], "scc_level" = params[["scc_level"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO Clean Air Targeting Tool NEI SCC Code Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_ecatt_nei_scc_codes_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string"), scc_level = list(type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.ecatt_nei_scc_codes", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list(), scc_level = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string"), scc_level = list(type = "string")), required = list()))
  result
}

#' ECHO Clean Air Targeting Tool Pollutant Category Programs Lookup Service
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
lookup_ecatt_pcat_pgm <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.ecatt_pcat_pgm", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO Clean Air Targeting Tool Pollutant Category Programs Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_ecatt_pcat_pgm_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.ecatt_pcat_pgm", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' ECHO Clean Air Targeting Tool Pollutant Categories Lookup Service
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
lookup_ecatt_poll_categories <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.ecatt_poll_categories", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO Clean Air Targeting Tool Pollutant Categories Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_ecatt_poll_categories_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.ecatt_poll_categories", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' ECHO Clean Air Targeting Tool Pollutant Programs Lookup Service
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
lookup_ecatt_poll_pgm <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.ecatt_poll_pgm", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO Clean Air Targeting Tool Pollutant Programs Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_ecatt_poll_pgm_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.ecatt_poll_pgm", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' ECHO Clean Air Targeting Tool Pollutants Lookup Service
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
lookup_ecatt_pollutants <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.ecatt_pollutants", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO Clean Air Targeting Tool Pollutants Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_ecatt_pollutants_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.ecatt_pollutants", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' Placeholder
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
lookup_fac_universe_indicators <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.fac_universe_indicators", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_fac_universe_indicators_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.fac_universe_indicators", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
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
lookup_federal_agencies <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.federal_agencies", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
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
lookup_federal_agencies_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.federal_agencies", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' ECHO GHG Facility Types Lookup Service
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
lookup_ghg_fac_types <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.ghg_fac_types", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO GHG Facility Types Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_ghg_fac_types_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.ghg_fac_types", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' ECHO GHG Subparts Lookup Service
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
lookup_ghg_subparts <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.ghg_subparts", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO GHG Subparts Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_ghg_subparts_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.ghg_subparts", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' ECHO GHG Years Lookup Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param descending Output Sort Column Descending Flag.  Enter Y to sort results in descending order.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_ghg_years <- function(output = NULL, callback = NULL, descending = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "descending" = descending), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), descending = list(name = "descending", "in" = "query", description = "Output Sort Column Descending Flag.  Enter Y to sort results in descending order.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", descending = "query"))
  params <- base::list("output" = output, "callback" = callback, "descending" = descending)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["descending"]]) && base::any(!base::nzchar(params[["descending"]]))) base::stop("Empty query parameter: descending")
  result <- lookup_request(method = "GET", path = "/rest_lookups.ghg_years", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "descending" = params[["descending"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO GHG Years Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_ghg_years_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), descending = list(description = "Output Sort Column Descending Flag.  Enter Y to sort results in descending order.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.ghg_years", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), descending = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), descending = list(description = "Output Sort Column Descending Flag.  Enter Y to sort results in descending order.", type = "string")), required = list()))
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
lookup_icis_inspection_types <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.icis_inspection_types", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
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
lookup_icis_inspection_types_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.icis_inspection_types", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' ECHO ICIS Law Sections Lookup Service
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
lookup_icis_law_sections <- function(output = NULL, callback = NULL, statute_code = NULL, status_flag = NULL, search_term = NULL, search_code = NULL, sort_order = NULL) {
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
  result <- lookup_request(method = "GET", path = "/rest_lookups.icis_law_sections", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "statute_code" = params[["statute_code"]], "status_flag" = params[["status_flag"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]], "sort_order" = params[["sort_order"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO ICIS Law Sections Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_icis_law_sections_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), statute_code = list(type = "string"), status_flag = list(type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string"), sort_order = list(type = "number")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.icis_law_sections", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), statute_code = list(), status_flag = list(), search_term = list(), search_code = list(), sort_order = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), statute_code = list(type = "string"), status_flag = list(type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string"), sort_order = list(type = "number")), required = list()))
  result
}

#' Placeholder
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
lookup_icis_ref_program <- function(output = NULL, callback = NULL, statute_code = NULL, status_flag = NULL, search_term = NULL, search_code = NULL, sort_order = NULL) {
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
  result <- lookup_request(method = "GET", path = "/rest_lookups.icis_ref_program", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "statute_code" = params[["statute_code"]], "status_flag" = params[["status_flag"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]], "sort_order" = params[["sort_order"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_icis_ref_program_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), statute_code = list(type = "string"), status_flag = list(type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string"), sort_order = list(type = "number")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.icis_ref_program", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), statute_code = list(), status_flag = list(), search_term = list(), search_code = list(), sort_order = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
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
lookup_naics_codes <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL, n_year = 2022) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code, "n_year" = n_year), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string"), n_year = list(name = "n_year", "in" = "query", description = "Year parameter in the YYYY format, defaults to 2022.", default = 2022L, type = "number")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query", n_year = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code, "n_year" = n_year)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  if (base::is.character(params[["n_year"]]) && base::any(!base::nzchar(params[["n_year"]]))) base::stop("Empty query parameter: n_year")
  result <- lookup_request(method = "GET", path = "/rest_lookups.naics_codes", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]], "n_year" = params[["n_year"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
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
lookup_naics_codes_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string"), n_year = list(description = "Year parameter in the YYYY format, defaults to 2022.", default = 2022L, type = "number")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.naics_codes", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list(), n_year = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string"), n_year = list(description = "Year parameter in the YYYY format, defaults to 2022.", default = 2022L, type = "number")), required = list()))
  result
}

#' ECHO National Priorities Lookup Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param category_code category_code
#' @param search_term Enter a partial or complete search phrase or word.
#' @param search_code Enter a partial or complete code value.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_national_priorities <- function(output = NULL, callback = NULL, category_code = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "category_code" = category_code, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), category_code = list(name = "category_code", "in" = "query", type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", category_code = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "category_code" = category_code, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["category_code"]]) && base::any(!base::nzchar(params[["category_code"]]))) base::stop("Empty query parameter: category_code")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.national_priorities", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "category_code" = params[["category_code"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO National Priorities Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_national_priorities_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), category_code = list(type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.national_priorities", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), category_code = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), category_code = list(type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' ECHO NEI Pollutants Lookup Service
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
lookup_nei_pollutants <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.nei_pollutants", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO NEI Pollutants Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_nei_pollutants_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.nei_pollutants", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' ECHO NEI Years Lookup Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param descending Output Sort Column Descending Flag.  Enter Y to sort results in descending order.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_nei_years <- function(output = NULL, callback = NULL, descending = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "descending" = descending), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), descending = list(name = "descending", "in" = "query", description = "Output Sort Column Descending Flag.  Enter Y to sort results in descending order.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", descending = "query"))
  params <- base::list("output" = output, "callback" = callback, "descending" = descending)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["descending"]]) && base::any(!base::nzchar(params[["descending"]]))) base::stop("Empty query parameter: descending")
  result <- lookup_request(method = "GET", path = "/rest_lookups.nei_years", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "descending" = params[["descending"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO NEI Years Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_nei_years_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), descending = list(description = "Output Sort Column Descending Flag.  Enter Y to sort results in descending order.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.nei_years", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), descending = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), descending = list(description = "Output Sort Column Descending Flag.  Enter Y to sort results in descending order.", type = "string")), required = list()))
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
lookup_npdes_parameters <- function(output = NULL, callback = NULL, search_term = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  result <- lookup_request(method = "GET", path = "/rest_lookups.npdes_parameters", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
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
lookup_npdes_parameters_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.npdes_parameters", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string")), required = list()))
  result
}

#' Placeholder
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param registry_id registry_id
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_npl_site_link <- function(output = NULL, callback = NULL, registry_id = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "registry_id" = registry_id), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), registry_id = list(name = "registry_id", "in" = "query", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", registry_id = "query"))
  params <- base::list("output" = output, "callback" = callback, "registry_id" = registry_id)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["registry_id"]]) && base::any(!base::nzchar(params[["registry_id"]]))) base::stop("Empty query parameter: registry_id")
  result <- lookup_request(method = "GET", path = "/rest_lookups.npl_site_link", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "registry_id" = params[["registry_id"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_npl_site_link_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), registry_id = list(type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.npl_site_link", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), registry_id = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), registry_id = list(type = "string")), required = list()))
  result
}

#' Placeholder
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
lookup_prog_deficiency <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.prog_deficiency", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_prog_deficiency_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.prog_deficiency", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' ECHO RCRA State Districts Lookup Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param state_code Two-letter state code
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_rcra_lu_state_districts <- function(output = NULL, callback = NULL, state_code) {
  if (base::is.null(state_code)) base::stop("Required input: state_code")
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "state_code" = state_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), state_code = list(name = "state_code", "in" = "query", description = "Two-letter state code", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", state_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "state_code" = state_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["state_code"]]) && base::any(!base::nzchar(params[["state_code"]]))) base::stop("Empty query parameter: state_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.rcra_lu_state_districts", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "state_code" = params[["state_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO RCRA State Districts Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_rcra_lu_state_districts_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), state_code = list(description = "Two-letter state code", type = "string")), required = list("state_code")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.rcra_lu_state_districts", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), state_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), state_code = list(description = "Two-letter state code", type = "string")), required = list("state_code")))
  result
}

#' Placeholder
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param search_term Enter a partial or complete search phrase or word.
#' @param search_code Enter a partial or complete code value.
#' @param descending Output Sort Column Descending Flag.  Enter Y to sort results in descending order.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_reporting_obligation <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL, descending = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code, "descending" = descending), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string"), descending = list(name = "descending", "in" = "query", description = "Output Sort Column Descending Flag.  Enter Y to sort results in descending order.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query", descending = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code, "descending" = descending)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  if (base::is.character(params[["descending"]]) && base::any(!base::nzchar(params[["descending"]]))) base::stop("Empty query parameter: descending")
  result <- lookup_request(method = "GET", path = "/rest_lookups.reporting_obligation", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]], "descending" = params[["descending"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_reporting_obligation_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string"), descending = list(description = "Output Sort Column Descending Flag.  Enter Y to sort results in descending order.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.reporting_obligation", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list(), descending = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string"), descending = list(description = "Output Sort Column Descending Flag.  Enter Y to sort results in descending order.", type = "string")), required = list()))
  result
}

#' ECHO RPO Regions Lookup Service
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
lookup_rpo_regions <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.rpo_regions", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO RPO Regions Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_rpo_regions_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.rpo_regions", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' ECHO SDWA Contaminants Lookup Service
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
lookup_sdwa_contaminants <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.sdwa_contaminants", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO SDWA Contaminants Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_sdwa_contaminants_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.sdwa_contaminants", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' ECHO SDWIS Tribes Lookup Service
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
lookup_sdwis_tribes <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.sdwis_tribes", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO SDWIS Tribes Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_sdwis_tribes_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.sdwis_tribes", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' ECHO States Lookup Service
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
lookup_states <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.states", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO States Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_states_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.states", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' ECHO Tri Pollutants Lookup Service
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
lookup_tri_pollutants <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- lookup_request(method = "GET", path = "/rest_lookups.tri_pollutants", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO Tri Pollutants Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_tri_pollutants_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.tri_pollutants", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}

#' ECHO Tri Years Lookup Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param descending Output Sort Column Descending Flag.  Enter Y to sort results in descending order.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_tri_years <- function(output = NULL, callback = NULL, descending = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "descending" = descending), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), descending = list(name = "descending", "in" = "query", description = "Output Sort Column Descending Flag.  Enter Y to sort results in descending order.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", descending = "query"))
  params <- base::list("output" = output, "callback" = callback, "descending" = descending)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["descending"]]) && base::any(!base::nzchar(params[["descending"]]))) base::stop("Empty query parameter: descending")
  result <- lookup_request(method = "GET", path = "/rest_lookups.tri_years", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "descending" = params[["descending"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECHO Tri Years Lookup Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_tri_years_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), descending = list(description = "Output Sort Column Descending Flag.  Enter Y to sort results in descending order.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.tri_years", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), descending = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), descending = list(description = "Output Sort Column Descending Flag.  Enter Y to sort results in descending order.", type = "string")), required = list()))
  result
}

#' Placeholder
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param descending Output Sort Column Descending Flag.  Enter Y to column identified in the newsort parameter descending.  Enter N to use ascending sort order. Used only when newsort parameter is populated.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_tri_current_year <- function(output = NULL, callback = NULL, descending = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "descending" = descending), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), descending = list(name = "descending", "in" = "query", description = "Output Sort Column Descending Flag.  Enter Y to column identified in the newsort parameter descending.  Enter N to use ascending sort order. Used only when newsort parameter is populated.", enum = list("Y", "N"), type = "string")), .api_validation$body_value, c(output = "query", callback = "query", descending = "query"))
  params <- base::list("output" = output, "callback" = callback, "descending" = descending)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["descending"]]) && base::any(!base::nzchar(params[["descending"]]))) base::stop("Empty query parameter: descending")
  result <- lookup_request(method = "GET", path = "/rest_lookups.tri_current_year", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "descending" = params[["descending"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_tri_current_year_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), descending = list(description = "Output Sort Column Descending Flag.  Enter Y to column identified in the newsort parameter descending.  Enter N to use ascending sort order. Used only when newsort parameter is populated.", enum = list("Y", "N"), type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.tri_current_year", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), descending = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), descending = list(description = "Output Sort Column Descending Flag.  Enter Y to column identified in the newsort parameter descending.  Enter N to use ascending sort order. Used only when newsort parameter is populated.", enum = list("Y", "N"), type = "string")), required = list()))
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
lookup_wbd_code_lu <- function(output = NULL, callback = NULL, wbd_code = NULL, wbd_level = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "wbd_code" = wbd_code, "wbd_level" = wbd_level), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), wbd_code = list(name = "wbd_code", "in" = "query", description = "Two-digit watershed code [Hydrologic Unit Code (HUC)].", type = "string"), wbd_level = list(name = "wbd_level", "in" = "query", description = "The number of digits of the watershed code [Hydrologic Unit Code (HUC)] returned in the ValueCode. Must be an even number between 4 and 12.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", wbd_code = "query", wbd_level = "query"))
  params <- base::list("output" = output, "callback" = callback, "wbd_code" = wbd_code, "wbd_level" = wbd_level)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["wbd_code"]]) && base::any(!base::nzchar(params[["wbd_code"]]))) base::stop("Empty query parameter: wbd_code")
  if (base::is.character(params[["wbd_level"]]) && base::any(!base::nzchar(params[["wbd_level"]]))) base::stop("Empty query parameter: wbd_level")
  result <- lookup_request(method = "GET", path = "/rest_lookups.wbd_code_lu", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "wbd_code" = params[["wbd_code"]], "wbd_level" = params[["wbd_level"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
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
lookup_wbd_code_lu_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), wbd_code = list(description = "Two-digit watershed code [Hydrologic Unit Code (HUC)].", type = "string"), wbd_level = list(description = "The number of digits of the watershed code [Hydrologic Unit Code (HUC)] returned in the ValueCode. Must be an even number between 4 and 12.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.wbd_code_lu", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), wbd_code = list(), wbd_level = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), wbd_code = list(description = "Two-digit watershed code [Hydrologic Unit Code (HUC)].", type = "string"), wbd_level = list(description = "The number of digits of the watershed code [Hydrologic Unit Code (HUC)] returned in the ValueCode. Must be an even number between 4 and 12.", type = "string")), required = list()))
  result
}

#' Placeholder
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param wbd_code Two-digit watershed code [Hydrologic Unit Code (HUC)].
#' @param wbd_name Watershed Name Filter.
#' @param wbd_level The number of digits of the watershed code [Hydrologic Unit Code (HUC)] returned in the ValueCode. Must be an even number between 4 and 12.
#' @param exact_match exact_match
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_wbd_lu <- function(output = NULL, callback = NULL, wbd_code = NULL, wbd_name, wbd_level = NULL, exact_match = NULL) {
  if (base::is.null(wbd_name)) base::stop("Required input: wbd_name")
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "wbd_code" = wbd_code, "wbd_name" = wbd_name, "wbd_level" = wbd_level, "exact_match" = exact_match), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), wbd_code = list(name = "wbd_code", "in" = "query", description = "Two-digit watershed code [Hydrologic Unit Code (HUC)].", type = "string"), wbd_name = list(name = "wbd_name", "in" = "query", description = "Watershed Name Filter.", type = "string"), wbd_level = list(name = "wbd_level", "in" = "query", description = "The number of digits of the watershed code [Hydrologic Unit Code (HUC)] returned in the ValueCode. Must be an even number between 4 and 12.", type = "string"), exact_match = list(
    name = "exact_match", "in" = "query", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", wbd_code = "query", wbd_name = "query", wbd_level = "query", exact_match = "query"))
  params <- base::list("output" = output, "callback" = callback, "wbd_code" = wbd_code, "wbd_name" = wbd_name, "wbd_level" = wbd_level, "exact_match" = exact_match)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["wbd_code"]]) && base::any(!base::nzchar(params[["wbd_code"]]))) base::stop("Empty query parameter: wbd_code")
  if (base::is.character(params[["wbd_name"]]) && base::any(!base::nzchar(params[["wbd_name"]]))) base::stop("Empty query parameter: wbd_name")
  if (base::is.character(params[["wbd_level"]]) && base::any(!base::nzchar(params[["wbd_level"]]))) base::stop("Empty query parameter: wbd_level")
  if (base::is.character(params[["exact_match"]]) && base::any(!base::nzchar(params[["exact_match"]]))) base::stop("Empty query parameter: exact_match")
  result <- lookup_request(method = "GET", path = "/rest_lookups.wbd_lu", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "wbd_code" = params[["wbd_code"]], "wbd_name" = params[["wbd_name"]], "wbd_level" = params[["wbd_level"]], "exact_match" = params[["exact_match"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
lookup_wbd_lu_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), wbd_code = list(description = "Two-digit watershed code [Hydrologic Unit Code (HUC)].", type = "string"), wbd_name = list(description = "Watershed Name Filter.", type = "string"), wbd_level = list(description = "The number of digits of the watershed code [Hydrologic Unit Code (HUC)] returned in the ValueCode. Must be an even number between 4 and 12.", type = "string"), exact_match = list(type = "string")), required = list("wbd_name")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.wbd_lu", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), wbd_code = list(), wbd_name = list(), wbd_level = list(), exact_match = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), wbd_code = list(description = "Two-digit watershed code [Hydrologic Unit Code (HUC)].", type = "string"), wbd_name = list(description = "Watershed Name Filter.", type = "string"), wbd_level = list(description = "The number of digits of the watershed code [Hydrologic Unit Code (HUC)] returned in the ValueCode. Must be an even number between 4 and 12.", type = "string"), exact_match = list(type = "string")), required = list("wbd_name")))
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
lookup_wbd_name_lu <- function(output = NULL, callback = NULL, wbd_name, wbd_level = NULL) {
  if (base::is.null(wbd_name)) base::stop("Required input: wbd_name")
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "wbd_name" = wbd_name, "wbd_level" = wbd_level), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), wbd_name = list(name = "wbd_name", "in" = "query", description = "Watershed Name Filter.", type = "string"), wbd_level = list(name = "wbd_level", "in" = "query", description = "The number of digits of the watershed code [Hydrologic Unit Code (HUC)] returned in the ValueCode. Must be an even number between 4 and 12.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", wbd_name = "query", wbd_level = "query"))
  params <- base::list("output" = output, "callback" = callback, "wbd_name" = wbd_name, "wbd_level" = wbd_level)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["wbd_name"]]) && base::any(!base::nzchar(params[["wbd_name"]]))) base::stop("Empty query parameter: wbd_name")
  if (base::is.character(params[["wbd_level"]]) && base::any(!base::nzchar(params[["wbd_level"]]))) base::stop("Empty query parameter: wbd_level")
  result <- lookup_request(method = "GET", path = "/rest_lookups.wbd_name_lu", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "wbd_name" = params[["wbd_name"]], "wbd_level" = params[["wbd_level"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
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
lookup_wbd_name_lu_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), wbd_name = list(description = "Watershed Name Filter.", type = "string"), wbd_level = list(description = "The number of digits of the watershed code [Hydrologic Unit Code (HUC)] returned in the ValueCode. Must be an even number between 4 and 12.", type = "string")), required = list("wbd_name")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- lookup_request(method = "POST", path = "/rest_lookups.wbd_name_lu", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), wbd_name = list(), wbd_level = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), wbd_name = list(description = "Watershed Name Filter.", type = "string"), wbd_level = list(description = "The number of digits of the watershed code [Hydrologic Unit Code (HUC)] returned in the ValueCode. Must be an even number between 4 and 12.", type = "string")), required = list("wbd_name")))
  result
}
