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
case_lookups_icis_law_sections <- function(output = NULL, callback = NULL, statute_code = NULL, status_flag = NULL, search_term = NULL, search_code = NULL, sort_order = NULL) {
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
  result <- case_request(method = "GET", path = "/rest_lookups.icis_law_sections", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "statute_code" = params[["statute_code"]], "status_flag" = params[["status_flag"]], "search_term" = params[["search_term"]], "search_code" = params[["search_code"]], "sort_order" = params[["sort_order"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
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
case_lookups_icis_law_sections_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), statute_code = list(type = "string"), status_flag = list(type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string"), sort_order = list(type = "number")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- case_request(method = "POST", path = "/rest_lookups.icis_law_sections", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), statute_code = list(), status_flag = list(), search_term = list(), search_code = list(), sort_order = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), statute_code = list(type = "string"), status_flag = list(type = "string"), search_term = list(description = "Enter a partial or complete search phrase or word.", type = "string"), search_code = list(description = "Enter a partial or complete code value.", type = "string"), sort_order = list(type = "number")), required = list()))
  result
}
