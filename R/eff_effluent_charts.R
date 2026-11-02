#' Detailed Effluent Chart Service
#' 
#' @noMd
#' @param p_id Identifier for the service.
#' @param outfall Three-character code that identifies the point of discharge (e.g., pipe or outfall) for a facility. A single NPDES ID may have multiple points of discharge.
#' @param parameter_code Five-digit numeric code identifying the parameter. See Parameter Lookup documentation for a complete list of codes.
#' @param start_date The start date (mm/dd/yyyy) for the date range of interest. Must be used in conjunction with end_date. If start_date and end_date are not specified, the service will return the last three years of data.
#' @param end_date The end date (mm/dd/yyyy) for the date range of interest. Must be used in conjunction with start_date. If start_date and end_date are not specified, the service will return the last three years of data.
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Effluent Charts endpoints
#' @export
# Generated with specmill; do not edit by hand.
eff_get_effluent_chart <- function(p_id, outfall = NULL, parameter_code = NULL, start_date = NULL, end_date = NULL, output = NULL, callback = NULL) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("p_id" = p_id, "outfall" = outfall, "parameter_code" = parameter_code, "start_date" = start_date, "end_date" = end_date, "output" = output, "callback" = callback), list(p_id = list(name = "p_id", "in" = "query", description = "Identifier for the service.", type = "string"), outfall = list(name = "outfall", "in" = "query", description = "Three-character code that identifies the point of discharge (e.g., pipe or outfall) for a facility. A single NPDES ID may have multiple points of discharge.", type = "string"), parameter_code = list(name = "parameter_code", "in" = "query", description = "Five-digit numeric code identifying the parameter. See Parameter Lookup documentation for a complete list of codes.", 
    type = "string"), start_date = list(name = "start_date", "in" = "query", description = "The start date (mm/dd/yyyy) for the date range of interest. Must be used in conjunction with end_date. If start_date and end_date are not specified, the service will return the last three years of data.", type = "string"), end_date = list(name = "end_date", "in" = "query", description = "The end date (mm/dd/yyyy) for the date range of interest. Must be used in conjunction with start_date. If start_date and end_date are not specified, the service will return the last three years of data.", 
    type = "string"), output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), .api_validation$body_value, c(p_id = "query", outfall = "query", parameter_code = "query", start_date = "query", end_date = "query", output = "query", callback = "query"))
  params <- base::list("p_id" = p_id, "outfall" = outfall, "parameter_code" = parameter_code, "start_date" = start_date, "end_date" = end_date, "output" = output, "callback" = callback)
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["outfall"]]) && base::any(!base::nzchar(params[["outfall"]]))) base::stop("Empty query parameter: outfall")
  if (base::is.character(params[["parameter_code"]]) && base::any(!base::nzchar(params[["parameter_code"]]))) base::stop("Empty query parameter: parameter_code")
  if (base::is.character(params[["start_date"]]) && base::any(!base::nzchar(params[["start_date"]]))) base::stop("Empty query parameter: start_date")
  if (base::is.character(params[["end_date"]]) && base::any(!base::nzchar(params[["end_date"]]))) base::stop("Empty query parameter: end_date")
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- eff_request(method = "GET", path = "/eff_rest_services.get_effluent_chart", path_params = base::list(), query = base::list("p_id" = params[["p_id"]], "outfall" = params[["outfall"]], "parameter_code" = params[["parameter_code"]], "start_date" = params[["start_date"]], "end_date" = params[["end_date"]], "output" = params[["output"]], "callback" = params[["callback"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Detailed Effluent Chart Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Effluent Charts endpoints
#' @export
# Generated with specmill; do not edit by hand.
eff_get_effluent_chart_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(p_id = list(description = "Identifier for the service.", type = "string"), outfall = list(description = "Three-character code that identifies the point of discharge (e.g., pipe or outfall) for a facility. A single NPDES ID may have multiple points of discharge.", type = "string"), parameter_code = list(description = "Five-digit numeric code identifying the parameter. See Parameter Lookup documentation for a complete list of codes.", type = "string"), start_date = list(
    description = "The start date (mm/dd/yyyy) for the date range of interest. Must be used in conjunction with end_date. If start_date and end_date are not specified, the service will return the last three years of data.", type = "string"), end_date = list(description = "The end date (mm/dd/yyyy) for the date range of interest. Must be used in conjunction with start_date. If start_date and end_date are not specified, the service will return the last three years of data.", type = "string"), output = list(
    description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- eff_request(method = "POST", path = "/eff_rest_services.get_effluent_chart", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(p_id = list(), outfall = list(), parameter_code = list(), start_date = list(), end_date = list(), output = list(), callback = list()), form_schema = list(type = "object", properties = list(p_id = list(description = "Identifier for the service.", type = "string"), outfall = list(description = "Three-character code that identifies the point of discharge (e.g., pipe or outfall) for a facility. A single NPDES ID may have multiple points of discharge.", type = "string"), parameter_code = list(description = "Five-digit numeric code identifying the parameter. See Parameter Lookup documentation for a complete list of codes.", type = "string"), start_date = list(
    description = "The start date (mm/dd/yyyy) for the date range of interest. Must be used in conjunction with end_date. If start_date and end_date are not specified, the service will return the last three years of data.", type = "string"), end_date = list(description = "The end date (mm/dd/yyyy) for the date range of interest. Must be used in conjunction with start_date. If start_date and end_date are not specified, the service will return the last three years of data.", type = "string"), output = list(
    description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), required = list("p_id")))
  result
}

#' Summary Effluent Chart Service
#' 
#' @noMd
#' @param p_id Identifier for the service.
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param start_date The start date (mm/dd/yyyy) for the date range of interest. Must be used in conjunction with end_date. If start_date and end_date are not specified, the service will return the last three years of data.
#' @param end_date The end date (mm/dd/yyyy) for the date range of interest. Must be used in conjunction with start_date. If start_date and end_date are not specified, the service will return the last three years of data.
#' @return Decoded response returned by the client request helper.
#' @family Effluent Charts endpoints
#' @export
# Generated with specmill; do not edit by hand.
eff_get_summary_chart <- function(p_id, output = NULL, callback = NULL, start_date = NULL, end_date = NULL) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("p_id" = p_id, "output" = output, "callback" = callback, "start_date" = start_date, "end_date" = end_date), list(p_id = list(name = "p_id", "in" = "query", description = "Identifier for the service.", type = "string"), output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(
    name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string"), start_date = list(name = "start_date", "in" = "query", description = "The start date (mm/dd/yyyy) for the date range of interest. Must be used in conjunction with end_date. If start_date and end_date are not specified, the service will return the last three years of data.", type = "string"), end_date = list(
    name = "end_date", "in" = "query", description = "The end date (mm/dd/yyyy) for the date range of interest. Must be used in conjunction with start_date. If start_date and end_date are not specified, the service will return the last three years of data.", type = "string")), .api_validation$body_value, c(p_id = "query", output = "query", callback = "query", start_date = "query", end_date = "query"))
  params <- base::list("p_id" = p_id, "output" = output, "callback" = callback, "start_date" = start_date, "end_date" = end_date)
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["start_date"]]) && base::any(!base::nzchar(params[["start_date"]]))) base::stop("Empty query parameter: start_date")
  if (base::is.character(params[["end_date"]]) && base::any(!base::nzchar(params[["end_date"]]))) base::stop("Empty query parameter: end_date")
  result <- eff_request(method = "GET", path = "/eff_rest_services.get_summary_chart", path_params = base::list(), query = base::list("p_id" = params[["p_id"]], "output" = params[["output"]], "callback" = params[["callback"]], "start_date" = params[["start_date"]], "end_date" = params[["end_date"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Summary Effluent Chart Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Effluent Charts endpoints
#' @export
# Generated with specmill; do not edit by hand.
eff_get_summary_chart_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(p_id = list(description = "Identifier for the service.", type = "string"), output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), start_date = list(description = "The start date (mm/dd/yyyy) for the date range of interest. Must be used in conjunction with end_date. If start_date and end_date are not specified, the service will return the last three years of data.", type = "string"), end_date = list(description = "The end date (mm/dd/yyyy) for the date range of interest. Must be used in conjunction with start_date. If start_date and end_date are not specified, the service will return the last three years of data.", 
    type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- eff_request(method = "POST", path = "/eff_rest_services.get_summary_chart", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(p_id = list(), output = list(), callback = list(), start_date = list(), end_date = list()), form_schema = list(type = "object", properties = list(p_id = list(description = "Identifier for the service.", type = "string"), output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string"), start_date = list(description = "The start date (mm/dd/yyyy) for the date range of interest. Must be used in conjunction with end_date. If start_date and end_date are not specified, the service will return the last three years of data.", type = "string"), end_date = list(description = "The end date (mm/dd/yyyy) for the date range of interest. Must be used in conjunction with start_date. If start_date and end_date are not specified, the service will return the last three years of data.", 
    type = "string")), required = list("p_id")))
  result
}

#' Effluent Charts Download Service
#' 
#' @noMd
#' @param p_id Identifier for the service.
#' @param outfall Three-character code that identifies the point of discharge (e.g., pipe or outfall) for a facility. A single NPDES ID may have multiple points of discharge.
#' @param parameter_code Five-digit numeric code identifying the parameter. See Parameter Lookup documentation for a complete list of codes.
#' @param start_date The start date (mm/dd/yyyy) for the date range of interest. Must be used in conjunction with end_date. If start_date and end_date are not specified, the service will return the last three years of data.
#' @param end_date The end date (mm/dd/yyyy) for the date range of interest. Must be used in conjunction with start_date. If start_date and end_date are not specified, the service will return the last three years of data.
#' @return Decoded response returned by the client request helper.
#' @family Effluent Charts endpoints
#' @export
# Generated with specmill; do not edit by hand.
eff_download_effluent_chart <- function(p_id, outfall = NULL, parameter_code = NULL, start_date = NULL, end_date = NULL) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("p_id" = p_id, "outfall" = outfall, "parameter_code" = parameter_code, "start_date" = start_date, "end_date" = end_date), list(p_id = list(name = "p_id", "in" = "query", description = "Identifier for the service.", type = "string"), outfall = list(name = "outfall", "in" = "query", description = "Three-character code that identifies the point of discharge (e.g., pipe or outfall) for a facility. A single NPDES ID may have multiple points of discharge.", type = "string"), parameter_code = list(name = "parameter_code", "in" = "query", description = "Five-digit numeric code identifying the parameter. See Parameter Lookup documentation for a complete list of codes.", 
    type = "string"), start_date = list(name = "start_date", "in" = "query", description = "The start date (mm/dd/yyyy) for the date range of interest. Must be used in conjunction with end_date. If start_date and end_date are not specified, the service will return the last three years of data.", type = "string"), end_date = list(name = "end_date", "in" = "query", description = "The end date (mm/dd/yyyy) for the date range of interest. Must be used in conjunction with start_date. If start_date and end_date are not specified, the service will return the last three years of data.", 
    type = "string")), .api_validation$body_value, c(p_id = "query", outfall = "query", parameter_code = "query", start_date = "query", end_date = "query"))
  params <- base::list("p_id" = p_id, "outfall" = outfall, "parameter_code" = parameter_code, "start_date" = start_date, "end_date" = end_date)
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["outfall"]]) && base::any(!base::nzchar(params[["outfall"]]))) base::stop("Empty query parameter: outfall")
  if (base::is.character(params[["parameter_code"]]) && base::any(!base::nzchar(params[["parameter_code"]]))) base::stop("Empty query parameter: parameter_code")
  if (base::is.character(params[["start_date"]]) && base::any(!base::nzchar(params[["start_date"]]))) base::stop("Empty query parameter: start_date")
  if (base::is.character(params[["end_date"]]) && base::any(!base::nzchar(params[["end_date"]]))) base::stop("Empty query parameter: end_date")
  result <- eff_request(method = "GET", path = "/eff_rest_services.download_effluent_chart", path_params = base::list(), query = base::list("p_id" = params[["p_id"]], "outfall" = params[["outfall"]], "parameter_code" = params[["parameter_code"]], "start_date" = params[["start_date"]], "end_date" = params[["end_date"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Effluent Charts Download Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Effluent Charts endpoints
#' @export
# Generated with specmill; do not edit by hand.
eff_download_effluent_chart_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(p_id = list(description = "Identifier for the service.", type = "string"), outfall = list(description = "Three-character code that identifies the point of discharge (e.g., pipe or outfall) for a facility. A single NPDES ID may have multiple points of discharge.", type = "string"), parameter_code = list(description = "Five-digit numeric code identifying the parameter. See Parameter Lookup documentation for a complete list of codes.", type = "string"), start_date = list(
    description = "The start date (mm/dd/yyyy) for the date range of interest. Must be used in conjunction with end_date. If start_date and end_date are not specified, the service will return the last three years of data.", type = "string"), end_date = list(description = "The end date (mm/dd/yyyy) for the date range of interest. Must be used in conjunction with start_date. If start_date and end_date are not specified, the service will return the last three years of data.", type = "string")), required = list(
    "p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- eff_request(method = "POST", path = "/eff_rest_services.download_effluent_chart", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(p_id = list(), outfall = list(), parameter_code = list(), start_date = list(), end_date = list()), form_schema = list(type = "object", properties = list(p_id = list(description = "Identifier for the service.", type = "string"), outfall = list(description = "Three-character code that identifies the point of discharge (e.g., pipe or outfall) for a facility. A single NPDES ID may have multiple points of discharge.", type = "string"), parameter_code = list(description = "Five-digit numeric code identifying the parameter. See Parameter Lookup documentation for a complete list of codes.", type = "string"), start_date = list(
    description = "The start date (mm/dd/yyyy) for the date range of interest. Must be used in conjunction with end_date. If start_date and end_date are not specified, the service will return the last three years of data.", type = "string"), end_date = list(description = "The end date (mm/dd/yyyy) for the date range of interest. Must be used in conjunction with start_date. If start_date and end_date are not specified, the service will return the last three years of data.", type = "string")), required = list(
    "p_id")))
  result
}
