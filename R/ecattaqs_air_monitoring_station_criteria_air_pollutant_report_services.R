#' ECATT Air Monitoring Station (AMS) CAP Report Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_site_code Enter the AQS Site Code(s) for the monitoring stations. Provide multiple values as a comma-delimited list.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Criteria Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_get_rpt_facs <- function(output = NULL, p_site_code = NULL, callback = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "p_site_code" = p_site_code, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(name = "p_site_code", "in" = "query", description = "Enter the AQS Site Code(s) for the monitoring stations. Provide multiple values as a comma-delimited list.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_site_code = "query", callback = "query"))
  params <- base::list("output" = output, "p_site_code" = p_site_code, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_site_code"]]) && base::any(!base::nzchar(params[["p_site_code"]]))) base::stop("Empty query parameter: p_site_code")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- ecattaqs_request(method = "GET", path = "/ecatt_aqs_rest_services.get_rpt_facs", path_params = base::list(), query = base::list("output" = params[["output"]], "p_site_code" = params[["p_site_code"]], "callback" = params[["callback"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECATT Air Monitoring Station (AMS) CAP Report Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Criteria Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_get_rpt_facs_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(description = "Enter the AQS Site Code(s) for the monitoring stations. Provide multiple values as a comma-delimited list.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- ecattaqs_request(method = "POST", path = "/ecatt_aqs_rest_services.get_rpt_facs", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_site_code = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(description = "Enter the AQS Site Code(s) for the monitoring stations. Provide multiple values as a comma-delimited list.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list()))
  result
}

#' ECATT Air Monitoring Station (AMS) CAP Report Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_site_code Enter the AQS Site Code(s) for the monitoring stations. Provide multiple values as a comma-delimited list.
#' @param p_map_facs p_map_facs
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Criteria Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_get_rpt_map <- function(output = NULL, p_site_code = NULL, p_map_facs = NULL, callback = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "p_site_code" = p_site_code, "p_map_facs" = p_map_facs, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(name = "p_site_code", "in" = "query", description = "Enter the AQS Site Code(s) for the monitoring stations. Provide multiple values as a comma-delimited list.", 
    type = "string"), p_map_facs = list(name = "p_map_facs", "in" = "query", type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_site_code = "query", p_map_facs = "query", callback = "query"))
  params <- base::list("output" = output, "p_site_code" = p_site_code, "p_map_facs" = p_map_facs, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_site_code"]]) && base::any(!base::nzchar(params[["p_site_code"]]))) base::stop("Empty query parameter: p_site_code")
  if (base::is.character(params[["p_map_facs"]]) && base::any(!base::nzchar(params[["p_map_facs"]]))) base::stop("Empty query parameter: p_map_facs")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- ecattaqs_request(method = "GET", path = "/ecatt_aqs_rest_services.get_rpt_map", path_params = base::list(), query = base::list("output" = params[["output"]], "p_site_code" = params[["p_site_code"]], "p_map_facs" = params[["p_map_facs"]], "callback" = params[["callback"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECATT Air Monitoring Station (AMS) CAP Report Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Criteria Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_get_rpt_map_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(description = "Enter the AQS Site Code(s) for the monitoring stations. Provide multiple values as a comma-delimited list.", 
    type = "string"), p_map_facs = list(type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- ecattaqs_request(method = "POST", path = "/ecatt_aqs_rest_services.get_rpt_map", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_site_code = list(), p_map_facs = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(description = "Enter the AQS Site Code(s) for the monitoring stations. Provide multiple values as a comma-delimited list.", 
    type = "string"), p_map_facs = list(type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list()))
  result
}

#' ECATT Air Monitoring Station (AMS) CAP Report Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_site_code Enter the AQS Site Code(s) for the monitoring stations. Provide multiple values as a comma-delimited list.
#' @param p_year Year. Enter LAST5 or a single calendar year to filter results. Available values: LAST10, LAST5, or a single calendar year
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Criteria Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_get_rpt_polls <- function(output = NULL, p_site_code = NULL, p_year = "LAST10", callback = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "p_site_code" = p_site_code, "p_year" = p_year, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(name = "p_site_code", "in" = "query", description = "Enter the AQS Site Code(s) for the monitoring stations. Provide multiple values as a comma-delimited list.", 
    type = "string"), p_year = list(name = "p_year", "in" = "query", description = "Year. Enter LAST5 or a single calendar year to filter results. Available values: LAST10, LAST5, or a single calendar year", default = "LAST10", type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_site_code = "query", p_year = "query", callback = "query"))
  params <- base::list("output" = output, "p_site_code" = p_site_code, "p_year" = p_year, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_site_code"]]) && base::any(!base::nzchar(params[["p_site_code"]]))) base::stop("Empty query parameter: p_site_code")
  if (base::is.character(params[["p_year"]]) && base::any(!base::nzchar(params[["p_year"]]))) base::stop("Empty query parameter: p_year")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- ecattaqs_request(method = "GET", path = "/ecatt_aqs_rest_services.get_rpt_polls", path_params = base::list(), query = base::list("output" = params[["output"]], "p_site_code" = params[["p_site_code"]], "p_year" = params[["p_year"]], "callback" = params[["callback"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECATT Air Monitoring Station (AMS) CAP Report Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Criteria Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_get_rpt_polls_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(description = "Enter the AQS Site Code(s) for the monitoring stations. Provide multiple values as a comma-delimited list.", 
    type = "string"), p_year = list(description = "Year. Enter LAST5 or a single calendar year to filter results. Available values: LAST10, LAST5, or a single calendar year", default = "LAST10", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- ecattaqs_request(method = "POST", path = "/ecatt_aqs_rest_services.get_rpt_polls", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_site_code = list(), p_year = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(description = "Enter the AQS Site Code(s) for the monitoring stations. Provide multiple values as a comma-delimited list.", 
    type = "string"), p_year = list(description = "Year. Enter LAST5 or a single calendar year to filter results. Available values: LAST10, LAST5, or a single calendar year", default = "LAST10", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list()))
  result
}

#' ECATT Air Monitoring Station (AMS) CAP Report Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_site_code Enter the AQS Site Code(s) for the monitoring stations. Provide multiple values as a comma-delimited list.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Criteria Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_get_rpt_stats <- function(output = NULL, p_site_code = NULL, callback = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "p_site_code" = p_site_code, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(name = "p_site_code", "in" = "query", description = "Enter the AQS Site Code(s) for the monitoring stations. Provide multiple values as a comma-delimited list.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_site_code = "query", callback = "query"))
  params <- base::list("output" = output, "p_site_code" = p_site_code, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_site_code"]]) && base::any(!base::nzchar(params[["p_site_code"]]))) base::stop("Empty query parameter: p_site_code")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- ecattaqs_request(method = "GET", path = "/ecatt_aqs_rest_services.get_rpt_stats", path_params = base::list(), query = base::list("output" = params[["output"]], "p_site_code" = params[["p_site_code"]], "callback" = params[["callback"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECATT Air Monitoring Station (AMS) CAP Report Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Criteria Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_get_rpt_stats_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(description = "Enter the AQS Site Code(s) for the monitoring stations. Provide multiple values as a comma-delimited list.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- ecattaqs_request(method = "POST", path = "/ecatt_aqs_rest_services.get_rpt_stats", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_site_code = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(description = "Enter the AQS Site Code(s) for the monitoring stations. Provide multiple values as a comma-delimited list.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list()))
  result
}

#' ECATT Air Monitoring Station (AMS) CAP Report Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_wban Weather Bureau Army Navy (WBAN) Station
#' @param p_year Year. Enter LAST5 or a single calendar year to filter results. Available values: LAST10, LAST5, or a single calendar year
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Criteria Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_get_rpt_windrose <- function(output = NULL, p_wban, p_year = "LAST10", callback = NULL) {
  if (base::is.null(p_wban)) base::stop("Required input: p_wban")
  .api_validation$parameter_values(base::list("output" = output, "p_wban" = p_wban, "p_year" = p_year, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_wban = list(name = "p_wban", "in" = "query", description = "Weather Bureau Army Navy (WBAN) Station", type = "string"), 
    p_year = list(name = "p_year", "in" = "query", description = "Year. Enter LAST5 or a single calendar year to filter results. Available values: LAST10, LAST5, or a single calendar year", default = "LAST10", type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_wban = "query", p_year = "query", callback = "query"))
  params <- base::list("output" = output, "p_wban" = p_wban, "p_year" = p_year, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_wban"]]) && base::any(!base::nzchar(params[["p_wban"]]))) base::stop("Empty query parameter: p_wban")
  if (base::is.character(params[["p_year"]]) && base::any(!base::nzchar(params[["p_year"]]))) base::stop("Empty query parameter: p_year")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- ecattaqs_request(method = "GET", path = "/ecatt_aqs_rest_services.get_rpt_windrose", path_params = base::list(), query = base::list("output" = params[["output"]], "p_wban" = params[["p_wban"]], "p_year" = params[["p_year"]], "callback" = params[["callback"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECATT Air Monitoring Station (AMS) CAP Report Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Criteria Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_get_rpt_windrose_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_wban = list(description = "Weather Bureau Army Navy (WBAN) Station", type = "string"), p_year = list(description = "Year. Enter LAST5 or a single calendar year to filter results. Available values: LAST10, LAST5, or a single calendar year", 
    default = "LAST10", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_wban")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- ecattaqs_request(method = "POST", path = "/ecatt_aqs_rest_services.get_rpt_windrose", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_wban = list(), p_year = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_wban = list(description = "Weather Bureau Army Navy (WBAN) Station", type = "string"), p_year = list(description = "Year. Enter LAST5 or a single calendar year to filter results. Available values: LAST10, LAST5, or a single calendar year", 
    default = "LAST10", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_wban")))
  result
}

#' ECATT Air Monitoring Station (AMS) CAP Report Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_wban Weather Bureau Army Navy (WBAN) Station
#' @param p_begin_dt The beginning date (mm/dd/yyyy) for the sample period.
#' @param p_end_dt The end date (mm/dd/yyyy) for the sample period.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Criteria Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_get_rpt_windrose_daily <- function(output = NULL, p_wban, p_begin_dt, p_end_dt, callback = NULL) {
  if (base::is.null(p_wban)) base::stop("Required input: p_wban")
  if (base::is.null(p_begin_dt)) base::stop("Required input: p_begin_dt")
  if (base::is.null(p_end_dt)) base::stop("Required input: p_end_dt")
  .api_validation$parameter_values(base::list("output" = output, "p_wban" = p_wban, "p_begin_dt" = p_begin_dt, "p_end_dt" = p_end_dt, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_wban = list(name = "p_wban", "in" = "query", description = "Weather Bureau Army Navy (WBAN) Station", type = "string"), 
    p_begin_dt = list(name = "p_begin_dt", "in" = "query", description = "The beginning date (mm/dd/yyyy) for the sample period.", type = "string"), p_end_dt = list(name = "p_end_dt", "in" = "query", description = "The end date (mm/dd/yyyy) for the sample period.", type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_wban = "query", p_begin_dt = "query", p_end_dt = "query", callback = "query"))
  params <- base::list("output" = output, "p_wban" = p_wban, "p_begin_dt" = p_begin_dt, "p_end_dt" = p_end_dt, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_wban"]]) && base::any(!base::nzchar(params[["p_wban"]]))) base::stop("Empty query parameter: p_wban")
  if (base::is.character(params[["p_begin_dt"]]) && base::any(!base::nzchar(params[["p_begin_dt"]]))) base::stop("Empty query parameter: p_begin_dt")
  if (base::is.character(params[["p_end_dt"]]) && base::any(!base::nzchar(params[["p_end_dt"]]))) base::stop("Empty query parameter: p_end_dt")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- ecattaqs_request(method = "GET", path = "/ecatt_aqs_rest_services.get_rpt_windrose_daily", path_params = base::list(), query = base::list("output" = params[["output"]], "p_wban" = params[["p_wban"]], "p_begin_dt" = params[["p_begin_dt"]], "p_end_dt" = params[["p_end_dt"]], "callback" = params[["callback"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECATT Air Monitoring Station (AMS) CAP Report Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Criteria Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_get_rpt_windrose_daily_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_wban = list(description = "Weather Bureau Army Navy (WBAN) Station", type = "string"), p_begin_dt = list(
    description = "The beginning date (mm/dd/yyyy) for the sample period.", type = "string"), p_end_dt = list(description = "The end date (mm/dd/yyyy) for the sample period.", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_wban", "p_begin_dt", "p_end_dt")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- ecattaqs_request(method = "POST", path = "/ecatt_aqs_rest_services.get_rpt_windrose_daily", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_wban = list(), p_begin_dt = list(), p_end_dt = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_wban = list(description = "Weather Bureau Army Navy (WBAN) Station", type = "string"), p_begin_dt = list(
    description = "The beginning date (mm/dd/yyyy) for the sample period.", type = "string"), p_end_dt = list(description = "The end date (mm/dd/yyyy) for the sample period.", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_wban", "p_begin_dt", "p_end_dt")))
  result
}

#' ACS Demographics Data
#' 
#' @noMd
#' @param p_lat Latitude location in decimal degrees.
#' @param p_long Longitude location in decimal degrees.
#' @param p_radius Spatial Search Radius.  Enter a radius up to 100 miles in which to spatially search for facilities.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Criteria Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_get_acs2023x_demographics_by_id <- function(p_lat = NULL, p_long = NULL, p_radius = NULL) {
  .api_validation$parameter_values(base::list("p_lat" = p_lat, "p_long" = p_long, "p_radius" = p_radius), list(p_lat = list(name = "p_lat", "in" = "query", description = "Latitude location in decimal degrees.", type = "number"), p_long = list(name = "p_long", "in" = "query", description = "Longitude location in decimal degrees.", type = "number"), p_radius = list(name = "p_radius", "in" = "query", description = "Spatial Search Radius.  Enter a radius up to 100 miles in which to spatially search for facilities.", type = "number")), .api_validation$body_value, c(p_lat = "query", p_long = "query", p_radius = "query"))
  params <- base::list("p_lat" = p_lat, "p_long" = p_long, "p_radius" = p_radius)
  if (base::is.character(params[["p_lat"]]) && base::any(!base::nzchar(params[["p_lat"]]))) base::stop("Empty query parameter: p_lat")
  if (base::is.character(params[["p_long"]]) && base::any(!base::nzchar(params[["p_long"]]))) base::stop("Empty query parameter: p_long")
  if (base::is.character(params[["p_radius"]]) && base::any(!base::nzchar(params[["p_radius"]]))) base::stop("Empty query parameter: p_radius")
  result <- ecattaqs_request(method = "GET", path = "/ecatt_aqs_rest_services.get_acs2023x_demographics_by_id", path_params = base::list(), query = base::list("p_lat" = params[["p_lat"]], "p_long" = params[["p_long"]], "p_radius" = params[["p_radius"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ACS Demographics Data
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Criteria Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_get_acs2023x_demographics_by_id_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(p_lat = list(description = "Latitude location in decimal degrees.", type = "number"), p_long = list(description = "Longitude location in decimal degrees.", type = "number"), p_radius = list(description = "Spatial Search Radius.  Enter a radius up to 100 miles in which to spatially search for facilities.", type = "number")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- ecattaqs_request(method = "POST", path = "/ecatt_aqs_rest_services.get_acs2023x_demographics_by_id", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(p_lat = list(), p_long = list(), p_radius = list()), form_schema = list(type = "object", properties = list(p_lat = list(description = "Latitude location in decimal degrees.", type = "number"), p_long = list(description = "Longitude location in decimal degrees.", type = "number"), p_radius = list(description = "Spatial Search Radius.  Enter a radius up to 100 miles in which to spatially search for facilities.", type = "number")), required = list()))
  result
}
