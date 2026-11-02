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
eff_lookups_cwa_parameters <- function(output = NULL, callback = NULL, search_term = NULL, search_code = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(name = "search_term", "in" = "query", description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(name = "search_code", "in" = "query", description = "Enter a partial or complete code value.", type = "string")), .api_validation$body_value, c(output = "query", callback = "query", search_term = "query", search_code = "query"))
  params <- base::list("output" = output, "callback" = callback, "search_term" = search_term, "search_code" = search_code)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["search_term"]]) && base::any(!base::nzchar(params[["search_term"]]))) base::stop("Empty query parameter: search_term")
  if (base::is.character(params[["search_code"]]) && base::any(!base::nzchar(params[["search_code"]]))) base::stop("Empty query parameter: search_code")
  result <- eff_request(method = "GET", path = "/rest_lookups.cwa_parameters", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
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
eff_lookups_cwa_parameters_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- eff_request(method = "POST", path = "/rest_lookups.cwa_parameters", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), search_term = list(), search_code = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string")), required = list()))
  result
}
