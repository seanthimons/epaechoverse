#' ACS Demographics Data
#' 
#' @noMd
#' @param p_lat Latitude location in decimal degrees.
#' @param p_long Longitude location in decimal degrees.
#' @param p_radius Spatial Search Radius.  Enter a radius up to 100 miles in which to spatially search for facilities.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Hazardous Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattams_get_acs2023x_demographics_by_id <- function(p_lat = NULL, p_long = NULL, p_radius = NULL) {
  .api_validation$parameter_values(base::list("p_lat" = p_lat, "p_long" = p_long, "p_radius" = p_radius), list(p_lat = list(name = "p_lat", "in" = "query", description = "Latitude location in decimal degrees.", type = "number"), p_long = list(name = "p_long", "in" = "query", description = "Longitude location in decimal degrees.", type = "number"), p_radius = list(name = "p_radius", "in" = "query", description = "Spatial Search Radius.  Enter a radius up to 100 miles in which to spatially search for facilities.", type = "number")), .api_validation$body_value, c(p_lat = "query", p_long = "query", p_radius = "query"))
  params <- base::list("p_lat" = p_lat, "p_long" = p_long, "p_radius" = p_radius)
  if (base::is.character(params[["p_lat"]]) && base::any(!base::nzchar(params[["p_lat"]]))) base::stop("Empty query parameter: p_lat")
  if (base::is.character(params[["p_long"]]) && base::any(!base::nzchar(params[["p_long"]]))) base::stop("Empty query parameter: p_long")
  if (base::is.character(params[["p_radius"]]) && base::any(!base::nzchar(params[["p_radius"]]))) base::stop("Empty query parameter: p_radius")
  result <- ecattams_request(method = "GET", path = "/ecatt_ams_rest_services.get_acs2023x_demographics_by_id", path_params = base::list(), query = base::list("p_lat" = params[["p_lat"]], "p_long" = params[["p_long"]], "p_radius" = params[["p_radius"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ACS Demographics Data
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Hazardous Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattams_get_acs2023x_demographics_by_id_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(p_lat = list(description = "Latitude location in decimal degrees.", type = "number"), p_long = list(description = "Longitude location in decimal degrees.", type = "number"), p_radius = list(description = "Spatial Search Radius.  Enter a radius up to 100 miles in which to spatially search for facilities.", type = "number")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- ecattams_request(method = "POST", path = "/ecatt_ams_rest_services.get_acs2023x_demographics_by_id", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(p_lat = list(), p_long = list(), p_radius = list()), form_schema = list(type = "object", properties = list(p_lat = list(description = "Latitude location in decimal degrees.", type = "number"), p_long = list(description = "Longitude location in decimal degrees.", type = "number"), p_radius = list(description = "Spatial Search Radius.  Enter a radius up to 100 miles in which to spatially search for facilities.", type = "number")), required = list()))
  result
}

#' ECATT Air Monitoring Station (AMS) HAP Report Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_site_code The AMA site code of the station
#' @param p_year Year filter. Available values: LAST10, LAST5, or a single calendar year
#' @param p_annual_comp Best Rolling 12-months of data filter. Enter Y to restrict results to best rolling 12 months of data in the selected timeframe
#' @param p_nd Nondetect methodology filter. Enter a single nondetect method to filter results. Available values: "ROS", "ZERO", "HALF"
#' @param p_nd_pct Nondetect Percentage filter. Enter "NONE" to include stations with 80\% or greater non-detect measurements in the timeframe
#' @param p_summary Summary Data Flag. Enter a Y to retrieve monitor summary data only.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Hazardous Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattams_get_rpt <- function(output = NULL, p_site_code = NULL, p_year, p_annual_comp = "Y", p_nd = NULL, p_nd_pct = NULL, p_summary = NULL, callback = NULL) {
  if (base::is.null(p_year)) base::stop("Required input: p_year")
  .api_validation$parameter_values(base::list("output" = output, "p_site_code" = p_site_code, "p_year" = p_year, "p_annual_comp" = p_annual_comp, "p_nd" = p_nd, "p_nd_pct" = p_nd_pct, "p_summary" = p_summary, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(name = "p_site_code", "in" = "query", description = "The AMA site code of the station", type = "string"), 
    p_year = list(name = "p_year", "in" = "query", description = "Year filter. Available values: LAST10, LAST5, or a single calendar year", default = "LAST10", type = "string"), p_annual_comp = list(name = "p_annual_comp", "in" = "query", description = "Best Rolling 12-months of data filter. Enter Y to restrict results to best rolling 12 months of data in the selected timeframe", default = "Y", type = "string"), p_nd = list(name = "p_nd", "in" = "query", description = "Nondetect methodology filter. Enter a single nondetect method to filter results. Available values: \"ROS\", \"ZERO\", \"HALF\"", 
        type = "string"), p_nd_pct = list(name = "p_nd_pct", "in" = "query", description = "Nondetect Percentage filter. Enter \"NONE\" to include stations with 80% or greater non-detect measurements in the timeframe", type = "number"), p_summary = list(name = "p_summary", "in" = "query", description = "Summary Data Flag. Enter a Y to retrieve monitor summary data only.", type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
        type = "string")), .api_validation$body_value, c(output = "query", p_site_code = "query", p_year = "query", p_annual_comp = "query", p_nd = "query", p_nd_pct = "query", p_summary = "query", callback = "query"))
  params <- base::list("output" = output, "p_site_code" = p_site_code, "p_year" = p_year, "p_annual_comp" = p_annual_comp, "p_nd" = p_nd, "p_nd_pct" = p_nd_pct, "p_summary" = p_summary, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_site_code"]]) && base::any(!base::nzchar(params[["p_site_code"]]))) base::stop("Empty query parameter: p_site_code")
  if (base::is.character(params[["p_year"]]) && base::any(!base::nzchar(params[["p_year"]]))) base::stop("Empty query parameter: p_year")
  if (base::is.character(params[["p_annual_comp"]]) && base::any(!base::nzchar(params[["p_annual_comp"]]))) base::stop("Empty query parameter: p_annual_comp")
  if (base::is.character(params[["p_nd"]]) && base::any(!base::nzchar(params[["p_nd"]]))) base::stop("Empty query parameter: p_nd")
  if (base::is.character(params[["p_nd_pct"]]) && base::any(!base::nzchar(params[["p_nd_pct"]]))) base::stop("Empty query parameter: p_nd_pct")
  if (base::is.character(params[["p_summary"]]) && base::any(!base::nzchar(params[["p_summary"]]))) base::stop("Empty query parameter: p_summary")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- ecattams_request(method = "GET", path = "/ecatt_ams_rest_services.get_rpt", path_params = base::list(), query = base::list("output" = params[["output"]], "p_site_code" = params[["p_site_code"]], "p_year" = params[["p_year"]], "p_annual_comp" = params[["p_annual_comp"]], "p_nd" = params[["p_nd"]], "p_nd_pct" = params[["p_nd_pct"]], "p_summary" = params[["p_summary"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECATT Air Monitoring Station (AMS) HAP Report Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Hazardous Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattams_get_rpt_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(description = "The AMA site code of the station", type = "string"), p_year = list(description = "Year filter. Available values: LAST10, LAST5, or a single calendar year", 
    default = "LAST10", type = "string"), p_annual_comp = list(description = "Best Rolling 12-months of data filter. Enter Y to restrict results to best rolling 12 months of data in the selected timeframe", default = "Y", type = "string"), p_nd = list(description = "Nondetect methodology filter. Enter a single nondetect method to filter results. Available values: \"ROS\", \"ZERO\", \"HALF\"", type = "string"), p_nd_pct = list(description = "Nondetect Percentage filter. Enter \"NONE\" to include stations with 80% or greater non-detect measurements in the timeframe", 
    type = "number"), p_summary = list(description = "Summary Data Flag. Enter a Y to retrieve monitor summary data only.", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_year")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- ecattams_request(method = "POST", path = "/ecatt_ams_rest_services.get_rpt", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_site_code = list(), p_year = list(), p_annual_comp = list(), p_nd = list(), p_nd_pct = list(), p_summary = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(description = "The AMA site code of the station", type = "string"), p_year = list(description = "Year filter. Available values: LAST10, LAST5, or a single calendar year", 
    default = "LAST10", type = "string"), p_annual_comp = list(description = "Best Rolling 12-months of data filter. Enter Y to restrict results to best rolling 12 months of data in the selected timeframe", default = "Y", type = "string"), p_nd = list(description = "Nondetect methodology filter. Enter a single nondetect method to filter results. Available values: \"ROS\", \"ZERO\", \"HALF\"", type = "string"), p_nd_pct = list(description = "Nondetect Percentage filter. Enter \"NONE\" to include stations with 80% or greater non-detect measurements in the timeframe", 
    type = "number"), p_summary = list(description = "Summary Data Flag. Enter a Y to retrieve monitor summary data only.", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_year")))
  result
}

#' ECATT Air Monitoring Station (AMS) HAP Report Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_nd Nondetect methodology filter. Enter a single nondetect method to filter results. Available values: "ROS", "ZERO", "HALF"
#' @param p_nd_pct Nondetect Percentage filter. Enter "NONE" to include stations with 80\% or greater non-detect measurements in the timeframe
#' @param p_site_code The AMA site code of the station
#' @param p_year Year filter. Available values: LAST10, LAST5, or a single calendar year
#' @param p_annual_comp Best Rolling 12-months of data filter. Enter Y to restrict results to best rolling 12 months of data in the selected timeframe
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Hazardous Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattams_get_rpt_polls <- function(output = NULL, p_nd = NULL, p_nd_pct = NULL, p_site_code = NULL, p_year, p_annual_comp = "Y", callback = NULL) {
  if (base::is.null(p_year)) base::stop("Required input: p_year")
  .api_validation$parameter_values(base::list("output" = output, "p_nd" = p_nd, "p_nd_pct" = p_nd_pct, "p_site_code" = p_site_code, "p_year" = p_year, "p_annual_comp" = p_annual_comp, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_nd = list(name = "p_nd", "in" = "query", description = "Nondetect methodology filter. Enter a single nondetect method to filter results. Available values: \"ROS\", \"ZERO\", \"HALF\"", 
    type = "string"), p_nd_pct = list(name = "p_nd_pct", "in" = "query", description = "Nondetect Percentage filter. Enter \"NONE\" to include stations with 80% or greater non-detect measurements in the timeframe", type = "number"), p_site_code = list(name = "p_site_code", "in" = "query", description = "The AMA site code of the station", type = "string"), p_year = list(name = "p_year", "in" = "query", description = "Year filter. Available values: LAST10, LAST5, or a single calendar year", default = "LAST10", 
    type = "string"), p_annual_comp = list(name = "p_annual_comp", "in" = "query", description = "Best Rolling 12-months of data filter. Enter Y to restrict results to best rolling 12 months of data in the selected timeframe", default = "Y", type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_nd = "query", p_nd_pct = "query", p_site_code = "query", p_year = "query", p_annual_comp = "query", callback = "query"))
  params <- base::list("output" = output, "p_nd" = p_nd, "p_nd_pct" = p_nd_pct, "p_site_code" = p_site_code, "p_year" = p_year, "p_annual_comp" = p_annual_comp, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_nd"]]) && base::any(!base::nzchar(params[["p_nd"]]))) base::stop("Empty query parameter: p_nd")
  if (base::is.character(params[["p_nd_pct"]]) && base::any(!base::nzchar(params[["p_nd_pct"]]))) base::stop("Empty query parameter: p_nd_pct")
  if (base::is.character(params[["p_site_code"]]) && base::any(!base::nzchar(params[["p_site_code"]]))) base::stop("Empty query parameter: p_site_code")
  if (base::is.character(params[["p_year"]]) && base::any(!base::nzchar(params[["p_year"]]))) base::stop("Empty query parameter: p_year")
  if (base::is.character(params[["p_annual_comp"]]) && base::any(!base::nzchar(params[["p_annual_comp"]]))) base::stop("Empty query parameter: p_annual_comp")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- ecattams_request(method = "GET", path = "/ecatt_ams_rest_services.get_rpt_polls", path_params = base::list(), query = base::list("output" = params[["output"]], "p_nd" = params[["p_nd"]], "p_nd_pct" = params[["p_nd_pct"]], "p_site_code" = params[["p_site_code"]], "p_year" = params[["p_year"]], "p_annual_comp" = params[["p_annual_comp"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECATT Air Monitoring Station (AMS) HAP Report Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Hazardous Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattams_get_rpt_polls_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_nd = list(description = "Nondetect methodology filter. Enter a single nondetect method to filter results. Available values: \"ROS\", \"ZERO\", \"HALF\"", 
    type = "string"), p_nd_pct = list(description = "Nondetect Percentage filter. Enter \"NONE\" to include stations with 80% or greater non-detect measurements in the timeframe", type = "number"), p_site_code = list(description = "The AMA site code of the station", type = "string"), p_year = list(description = "Year filter. Available values: LAST10, LAST5, or a single calendar year", default = "LAST10", type = "string"), p_annual_comp = list(description = "Best Rolling 12-months of data filter. Enter Y to restrict results to best rolling 12 months of data in the selected timeframe", 
    default = "Y", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_year")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- ecattams_request(method = "POST", path = "/ecatt_ams_rest_services.get_rpt_polls", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_nd = list(), p_nd_pct = list(), p_site_code = list(), p_year = list(), p_annual_comp = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_nd = list(description = "Nondetect methodology filter. Enter a single nondetect method to filter results. Available values: \"ROS\", \"ZERO\", \"HALF\"", 
    type = "string"), p_nd_pct = list(description = "Nondetect Percentage filter. Enter \"NONE\" to include stations with 80% or greater non-detect measurements in the timeframe", type = "number"), p_site_code = list(description = "The AMA site code of the station", type = "string"), p_year = list(description = "Year filter. Available values: LAST10, LAST5, or a single calendar year", default = "LAST10", type = "string"), p_annual_comp = list(description = "Best Rolling 12-months of data filter. Enter Y to restrict results to best rolling 12 months of data in the selected timeframe", 
    default = "Y", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_year")))
  result
}

#' ECATT Air Monitoring Station (AMS) HAP Report Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_nd Nondetect methodology filter. Enter a single nondetect method to filter results. Available values: "ROS", "ZERO", "HALF"
#' @param p_nd_pct Nondetect Percentage filter. Enter "NONE" to include stations with 80\% or greater non-detect measurements in the timeframe
#' @param p_site_code The AMA site code of the station
#' @param p_annual_comp Best Rolling 12-months of data filter. Enter Y to restrict results to best rolling 12 months of data in the selected timeframe
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Hazardous Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattams_get_rpt_stats <- function(output = NULL, p_nd = NULL, p_nd_pct = NULL, p_site_code = NULL, p_annual_comp = "Y", callback = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "p_nd" = p_nd, "p_nd_pct" = p_nd_pct, "p_site_code" = p_site_code, "p_annual_comp" = p_annual_comp, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_nd = list(name = "p_nd", "in" = "query", description = "Nondetect methodology filter. Enter a single nondetect method to filter results. Available values: \"ROS\", \"ZERO\", \"HALF\"", 
    type = "string"), p_nd_pct = list(name = "p_nd_pct", "in" = "query", description = "Nondetect Percentage filter. Enter \"NONE\" to include stations with 80% or greater non-detect measurements in the timeframe", type = "number"), p_site_code = list(name = "p_site_code", "in" = "query", description = "The AMA site code of the station", type = "string"), p_annual_comp = list(name = "p_annual_comp", "in" = "query", description = "Best Rolling 12-months of data filter. Enter Y to restrict results to best rolling 12 months of data in the selected timeframe", 
    default = "Y", type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_nd = "query", p_nd_pct = "query", p_site_code = "query", p_annual_comp = "query", callback = "query"))
  params <- base::list("output" = output, "p_nd" = p_nd, "p_nd_pct" = p_nd_pct, "p_site_code" = p_site_code, "p_annual_comp" = p_annual_comp, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_nd"]]) && base::any(!base::nzchar(params[["p_nd"]]))) base::stop("Empty query parameter: p_nd")
  if (base::is.character(params[["p_nd_pct"]]) && base::any(!base::nzchar(params[["p_nd_pct"]]))) base::stop("Empty query parameter: p_nd_pct")
  if (base::is.character(params[["p_site_code"]]) && base::any(!base::nzchar(params[["p_site_code"]]))) base::stop("Empty query parameter: p_site_code")
  if (base::is.character(params[["p_annual_comp"]]) && base::any(!base::nzchar(params[["p_annual_comp"]]))) base::stop("Empty query parameter: p_annual_comp")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- ecattams_request(method = "GET", path = "/ecatt_ams_rest_services.get_rpt_stats", path_params = base::list(), query = base::list("output" = params[["output"]], "p_nd" = params[["p_nd"]], "p_nd_pct" = params[["p_nd_pct"]], "p_site_code" = params[["p_site_code"]], "p_annual_comp" = params[["p_annual_comp"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECATT Air Monitoring Station (AMS) HAP Report Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Hazardous Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattams_get_rpt_stats_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_nd = list(description = "Nondetect methodology filter. Enter a single nondetect method to filter results. Available values: \"ROS\", \"ZERO\", \"HALF\"", 
    type = "string"), p_nd_pct = list(description = "Nondetect Percentage filter. Enter \"NONE\" to include stations with 80% or greater non-detect measurements in the timeframe", type = "number"), p_site_code = list(description = "The AMA site code of the station", type = "string"), p_annual_comp = list(description = "Best Rolling 12-months of data filter. Enter Y to restrict results to best rolling 12 months of data in the selected timeframe", default = "Y", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- ecattams_request(method = "POST", path = "/ecatt_ams_rest_services.get_rpt_stats", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_nd = list(), p_nd_pct = list(), p_site_code = list(), p_annual_comp = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_nd = list(description = "Nondetect methodology filter. Enter a single nondetect method to filter results. Available values: \"ROS\", \"ZERO\", \"HALF\"", 
    type = "string"), p_nd_pct = list(description = "Nondetect Percentage filter. Enter \"NONE\" to include stations with 80% or greater non-detect measurements in the timeframe", type = "number"), p_site_code = list(description = "The AMA site code of the station", type = "string"), p_annual_comp = list(description = "Best Rolling 12-months of data filter. Enter Y to restrict results to best rolling 12 months of data in the selected timeframe", default = "Y", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), required = list()))
  result
}

#' ECATT Air Monitoring Station (AMS) HAP Report Service
#' 
#' @noMd
#' @param p_nd Nondetect methodology filter. Enter a single nondetect method to filter results. Available values: "ROS", "ZERO", "HALF"
#' @param p_nd_pct Nondetect Percentage filter. Enter "NONE" to include stations with 80\% or greater non-detect measurements in the timeframe
#' @param p_site_code The AMA site code of the station
#' @param qcolumns Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Hazardous Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattams_get_rpt_stats_download <- function(p_nd = NULL, p_nd_pct = NULL, p_site_code = NULL, qcolumns = NULL) {
  .api_validation$parameter_values(base::list("p_nd" = p_nd, "p_nd_pct" = p_nd_pct, "p_site_code" = p_site_code, "qcolumns" = qcolumns), list(p_nd = list(name = "p_nd", "in" = "query", description = "Nondetect methodology filter. Enter a single nondetect method to filter results. Available values: \"ROS\", \"ZERO\", \"HALF\"", type = "string"), p_nd_pct = list(name = "p_nd_pct", "in" = "query", description = "Nondetect Percentage filter. Enter \"NONE\" to include stations with 80% or greater non-detect measurements in the timeframe", type = "number"), p_site_code = list(name = "p_site_code", "in" = "query", description = "The AMA site code of the station", 
    type = "string"), qcolumns = list(name = "qcolumns", "in" = "query", description = "Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.", type = "string")), .api_validation$body_value, c(p_nd = "query", p_nd_pct = "query", p_site_code = "query", qcolumns = "query"))
  params <- base::list("p_nd" = p_nd, "p_nd_pct" = p_nd_pct, "p_site_code" = p_site_code, "qcolumns" = qcolumns)
  if (base::is.character(params[["p_nd"]]) && base::any(!base::nzchar(params[["p_nd"]]))) base::stop("Empty query parameter: p_nd")
  if (base::is.character(params[["p_nd_pct"]]) && base::any(!base::nzchar(params[["p_nd_pct"]]))) base::stop("Empty query parameter: p_nd_pct")
  if (base::is.character(params[["p_site_code"]]) && base::any(!base::nzchar(params[["p_site_code"]]))) base::stop("Empty query parameter: p_site_code")
  if (base::is.character(params[["qcolumns"]]) && base::any(!base::nzchar(params[["qcolumns"]]))) base::stop("Empty query parameter: qcolumns")
  result <- ecattams_request(method = "GET", path = "/ecatt_ams_rest_services.get_rpt_stats_download", path_params = base::list(), query = base::list("p_nd" = params[["p_nd"]], "p_nd_pct" = params[["p_nd_pct"]], "p_site_code" = params[["p_site_code"]], "qcolumns" = params[["qcolumns"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECATT Air Monitoring Station (AMS) HAP Report Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Hazardous Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattams_get_rpt_stats_download_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(p_nd = list(description = "Nondetect methodology filter. Enter a single nondetect method to filter results. Available values: \"ROS\", \"ZERO\", \"HALF\"", type = "string"), p_nd_pct = list(description = "Nondetect Percentage filter. Enter \"NONE\" to include stations with 80% or greater non-detect measurements in the timeframe", type = "number"), p_site_code = list(description = "The AMA site code of the station", type = "string"), qcolumns = list(description = "Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.", 
    type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- ecattams_request(method = "POST", path = "/ecatt_ams_rest_services.get_rpt_stats_download", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(p_nd = list(), p_nd_pct = list(), p_site_code = list(), qcolumns = list()), form_schema = list(type = "object", properties = list(p_nd = list(description = "Nondetect methodology filter. Enter a single nondetect method to filter results. Available values: \"ROS\", \"ZERO\", \"HALF\"", type = "string"), p_nd_pct = list(description = "Nondetect Percentage filter. Enter \"NONE\" to include stations with 80% or greater non-detect measurements in the timeframe", type = "number"), p_site_code = list(description = "The AMA site code of the station", type = "string"), qcolumns = list(description = "Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.", 
    type = "string")), required = list()))
  result
}

#' ECATT Air Monitoring Station (AMS) HAP Report Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_wban Weather Bureau Army Navy (WBAN) Station
#' @param p_year Year filter. Available values: LAST10, LAST5, or a single calendar year
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Hazardous Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattams_get_rpt_windrose <- function(output = NULL, p_wban, p_year, callback = NULL) {
  if (base::is.null(p_wban)) base::stop("Required input: p_wban")
  if (base::is.null(p_year)) base::stop("Required input: p_year")
  .api_validation$parameter_values(base::list("output" = output, "p_wban" = p_wban, "p_year" = p_year, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_wban = list(name = "p_wban", "in" = "query", description = "Weather Bureau Army Navy (WBAN) Station", type = "string"), 
    p_year = list(name = "p_year", "in" = "query", description = "Year filter. Available values: LAST10, LAST5, or a single calendar year", default = "LAST10", type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_wban = "query", p_year = "query", callback = "query"))
  params <- base::list("output" = output, "p_wban" = p_wban, "p_year" = p_year, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_wban"]]) && base::any(!base::nzchar(params[["p_wban"]]))) base::stop("Empty query parameter: p_wban")
  if (base::is.character(params[["p_year"]]) && base::any(!base::nzchar(params[["p_year"]]))) base::stop("Empty query parameter: p_year")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- ecattams_request(method = "GET", path = "/ecatt_ams_rest_services.get_rpt_windrose", path_params = base::list(), query = base::list("output" = params[["output"]], "p_wban" = params[["p_wban"]], "p_year" = params[["p_year"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECATT Air Monitoring Station (AMS) HAP Report Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Hazardous Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattams_get_rpt_windrose_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_wban = list(description = "Weather Bureau Army Navy (WBAN) Station", type = "string"), p_year = list(description = "Year filter. Available values: LAST10, LAST5, or a single calendar year", 
    default = "LAST10", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_wban", "p_year")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- ecattams_request(method = "POST", path = "/ecatt_ams_rest_services.get_rpt_windrose", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_wban = list(), p_year = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_wban = list(description = "Weather Bureau Army Navy (WBAN) Station", type = "string"), p_year = list(description = "Year filter. Available values: LAST10, LAST5, or a single calendar year", 
    default = "LAST10", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_wban", "p_year")))
  result
}

#' ECATT Air Monitoring Station (AMS) HAP Report Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_site_code The AMA site code of the station
#' @param p_year Year filter. Available values: LAST10, LAST5, or a single calendar year
#' @param p_annual_comp Best Rolling 12-months of data filter. Enter Y to restrict results to best rolling 12 months of data in the selected timeframe
#' @param p_nd Nondetect methodology filter. Enter a single nondetect method to filter results. Available values: "ROS", "ZERO", "HALF"
#' @param p_nd_pct Nondetect Percentage filter. Enter "NONE" to include stations with 80\% or greater non-detect measurements in the timeframe
#' @param p_summary Summary Data Flag. Enter a Y to retrieve monitor summary data only.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Hazardous Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattams_get_rpt_summary <- function(output = NULL, p_site_code = NULL, p_year, p_annual_comp = "Y", p_nd = NULL, p_nd_pct = NULL, p_summary = NULL, callback = NULL) {
  if (base::is.null(p_year)) base::stop("Required input: p_year")
  .api_validation$parameter_values(base::list("output" = output, "p_site_code" = p_site_code, "p_year" = p_year, "p_annual_comp" = p_annual_comp, "p_nd" = p_nd, "p_nd_pct" = p_nd_pct, "p_summary" = p_summary, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(name = "p_site_code", "in" = "query", description = "The AMA site code of the station", type = "string"), 
    p_year = list(name = "p_year", "in" = "query", description = "Year filter. Available values: LAST10, LAST5, or a single calendar year", default = "LAST10", type = "string"), p_annual_comp = list(name = "p_annual_comp", "in" = "query", description = "Best Rolling 12-months of data filter. Enter Y to restrict results to best rolling 12 months of data in the selected timeframe", default = "Y", type = "string"), p_nd = list(name = "p_nd", "in" = "query", description = "Nondetect methodology filter. Enter a single nondetect method to filter results. Available values: \"ROS\", \"ZERO\", \"HALF\"", 
        type = "string"), p_nd_pct = list(name = "p_nd_pct", "in" = "query", description = "Nondetect Percentage filter. Enter \"NONE\" to include stations with 80% or greater non-detect measurements in the timeframe", type = "number"), p_summary = list(name = "p_summary", "in" = "query", description = "Summary Data Flag. Enter a Y to retrieve monitor summary data only.", type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
        type = "string")), .api_validation$body_value, c(output = "query", p_site_code = "query", p_year = "query", p_annual_comp = "query", p_nd = "query", p_nd_pct = "query", p_summary = "query", callback = "query"))
  params <- base::list("output" = output, "p_site_code" = p_site_code, "p_year" = p_year, "p_annual_comp" = p_annual_comp, "p_nd" = p_nd, "p_nd_pct" = p_nd_pct, "p_summary" = p_summary, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_site_code"]]) && base::any(!base::nzchar(params[["p_site_code"]]))) base::stop("Empty query parameter: p_site_code")
  if (base::is.character(params[["p_year"]]) && base::any(!base::nzchar(params[["p_year"]]))) base::stop("Empty query parameter: p_year")
  if (base::is.character(params[["p_annual_comp"]]) && base::any(!base::nzchar(params[["p_annual_comp"]]))) base::stop("Empty query parameter: p_annual_comp")
  if (base::is.character(params[["p_nd"]]) && base::any(!base::nzchar(params[["p_nd"]]))) base::stop("Empty query parameter: p_nd")
  if (base::is.character(params[["p_nd_pct"]]) && base::any(!base::nzchar(params[["p_nd_pct"]]))) base::stop("Empty query parameter: p_nd_pct")
  if (base::is.character(params[["p_summary"]]) && base::any(!base::nzchar(params[["p_summary"]]))) base::stop("Empty query parameter: p_summary")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- ecattams_request(method = "GET", path = "/ecatt_ams_rest_services.get_rpt_summary", path_params = base::list(), query = base::list("output" = params[["output"]], "p_site_code" = params[["p_site_code"]], "p_year" = params[["p_year"]], "p_annual_comp" = params[["p_annual_comp"]], "p_nd" = params[["p_nd"]], "p_nd_pct" = params[["p_nd_pct"]], "p_summary" = params[["p_summary"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECATT Air Monitoring Station (AMS) HAP Report Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Hazardous Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattams_get_rpt_summary_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(description = "The AMA site code of the station", type = "string"), p_year = list(description = "Year filter. Available values: LAST10, LAST5, or a single calendar year", 
    default = "LAST10", type = "string"), p_annual_comp = list(description = "Best Rolling 12-months of data filter. Enter Y to restrict results to best rolling 12 months of data in the selected timeframe", default = "Y", type = "string"), p_nd = list(description = "Nondetect methodology filter. Enter a single nondetect method to filter results. Available values: \"ROS\", \"ZERO\", \"HALF\"", type = "string"), p_nd_pct = list(description = "Nondetect Percentage filter. Enter \"NONE\" to include stations with 80% or greater non-detect measurements in the timeframe", 
    type = "number"), p_summary = list(description = "Summary Data Flag. Enter a Y to retrieve monitor summary data only.", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_year")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- ecattams_request(method = "POST", path = "/ecatt_ams_rest_services.get_rpt_summary", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_site_code = list(), p_year = list(), p_annual_comp = list(), p_nd = list(), p_nd_pct = list(), p_summary = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(description = "The AMA site code of the station", type = "string"), p_year = list(description = "Year filter. Available values: LAST10, LAST5, or a single calendar year", 
    default = "LAST10", type = "string"), p_annual_comp = list(description = "Best Rolling 12-months of data filter. Enter Y to restrict results to best rolling 12 months of data in the selected timeframe", default = "Y", type = "string"), p_nd = list(description = "Nondetect methodology filter. Enter a single nondetect method to filter results. Available values: \"ROS\", \"ZERO\", \"HALF\"", type = "string"), p_nd_pct = list(description = "Nondetect Percentage filter. Enter \"NONE\" to include stations with 80% or greater non-detect measurements in the timeframe", 
    type = "number"), p_summary = list(description = "Summary Data Flag. Enter a Y to retrieve monitor summary data only.", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_year")))
  result
}

#' ECATT Air Monitoring Station (AMS) HAP Report Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_nd Nondetect methodology filter. Enter a single nondetect method to filter results. Available values: "ROS", "ZERO", "HALF"
#' @param p_nd_pct Nondetect Percentage filter. Enter "NONE" to include stations with 80\% or greater non-detect measurements in the timeframe
#' @param p_annual_comp Best Rolling 12-months of data filter. Enter Y to restrict results to best rolling 12 months of data in the selected timeframe
#' @param p_site_code The AMA site code of the station
#' @param p_year Year filter. Available values: LAST10, LAST5, or a single calendar year
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Hazardous Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattams_get_rpt_pollrose <- function(output = NULL, p_nd = NULL, p_nd_pct = NULL, p_annual_comp = "Y", p_site_code = NULL, p_year, callback = NULL) {
  if (base::is.null(p_year)) base::stop("Required input: p_year")
  .api_validation$parameter_values(base::list("output" = output, "p_nd" = p_nd, "p_nd_pct" = p_nd_pct, "p_annual_comp" = p_annual_comp, "p_site_code" = p_site_code, "p_year" = p_year, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_nd = list(name = "p_nd", "in" = "query", description = "Nondetect methodology filter. Enter a single nondetect method to filter results. Available values: \"ROS\", \"ZERO\", \"HALF\"", 
    type = "string"), p_nd_pct = list(name = "p_nd_pct", "in" = "query", description = "Nondetect Percentage filter. Enter \"NONE\" to include stations with 80% or greater non-detect measurements in the timeframe", type = "number"), p_annual_comp = list(name = "p_annual_comp", "in" = "query", description = "Best Rolling 12-months of data filter. Enter Y to restrict results to best rolling 12 months of data in the selected timeframe", default = "Y", type = "string"), p_site_code = list(name = "p_site_code", 
    "in" = "query", description = "The AMA site code of the station", type = "string"), p_year = list(name = "p_year", "in" = "query", description = "Year filter. Available values: LAST10, LAST5, or a single calendar year", default = "LAST10", type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_nd = "query", p_nd_pct = "query", p_annual_comp = "query", p_site_code = "query", p_year = "query", callback = "query"))
  params <- base::list("output" = output, "p_nd" = p_nd, "p_nd_pct" = p_nd_pct, "p_annual_comp" = p_annual_comp, "p_site_code" = p_site_code, "p_year" = p_year, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_nd"]]) && base::any(!base::nzchar(params[["p_nd"]]))) base::stop("Empty query parameter: p_nd")
  if (base::is.character(params[["p_nd_pct"]]) && base::any(!base::nzchar(params[["p_nd_pct"]]))) base::stop("Empty query parameter: p_nd_pct")
  if (base::is.character(params[["p_annual_comp"]]) && base::any(!base::nzchar(params[["p_annual_comp"]]))) base::stop("Empty query parameter: p_annual_comp")
  if (base::is.character(params[["p_site_code"]]) && base::any(!base::nzchar(params[["p_site_code"]]))) base::stop("Empty query parameter: p_site_code")
  if (base::is.character(params[["p_year"]]) && base::any(!base::nzchar(params[["p_year"]]))) base::stop("Empty query parameter: p_year")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- ecattams_request(method = "GET", path = "/ecatt_ams_rest_services.get_rpt_pollrose", path_params = base::list(), query = base::list("output" = params[["output"]], "p_nd" = params[["p_nd"]], "p_nd_pct" = params[["p_nd_pct"]], "p_annual_comp" = params[["p_annual_comp"]], "p_site_code" = params[["p_site_code"]], "p_year" = params[["p_year"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECATT Air Monitoring Station (AMS) HAP Report Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Hazardous Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattams_get_rpt_pollrose_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_nd = list(description = "Nondetect methodology filter. Enter a single nondetect method to filter results. Available values: \"ROS\", \"ZERO\", \"HALF\"", 
    type = "string"), p_nd_pct = list(description = "Nondetect Percentage filter. Enter \"NONE\" to include stations with 80% or greater non-detect measurements in the timeframe", type = "number"), p_annual_comp = list(description = "Best Rolling 12-months of data filter. Enter Y to restrict results to best rolling 12 months of data in the selected timeframe", default = "Y", type = "string"), p_site_code = list(description = "The AMA site code of the station", type = "string"), p_year = list(description = "Year filter. Available values: LAST10, LAST5, or a single calendar year", 
    default = "LAST10", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_year")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- ecattams_request(method = "POST", path = "/ecatt_ams_rest_services.get_rpt_pollrose", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_nd = list(), p_nd_pct = list(), p_annual_comp = list(), p_site_code = list(), p_year = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_nd = list(description = "Nondetect methodology filter. Enter a single nondetect method to filter results. Available values: \"ROS\", \"ZERO\", \"HALF\"", 
    type = "string"), p_nd_pct = list(description = "Nondetect Percentage filter. Enter \"NONE\" to include stations with 80% or greater non-detect measurements in the timeframe", type = "number"), p_annual_comp = list(description = "Best Rolling 12-months of data filter. Enter Y to restrict results to best rolling 12 months of data in the selected timeframe", default = "Y", type = "string"), p_site_code = list(description = "The AMA site code of the station", type = "string"), p_year = list(description = "Year filter. Available values: LAST10, LAST5, or a single calendar year", 
    default = "LAST10", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_year")))
  result
}

#' ECATT Air Monitoring Station (AMS) HAP Report Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_site_code The AMA site code of the station
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param format Client result format: tidy (default), sf (optional sf package), geojson (string), or raw. Formatted output requires JSON. Metadata is retained in the map attribute (GeoJSON: echo member); .layer distinguishes record arrays. Missing coordinates yield empty geometries.
#' @return A map tibble, sf points, GeoJSON FeatureCollection string, or decoded response, selected by format. Map coordinates use EPSG:4326; clusters are representative points.
#' @family Air Monitoring Station Hazardous Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattams_get_rpt_map <- function(output = NULL, p_site_code = NULL, callback = NULL, format = "tidy") {
  .api_validation$parameter_values(base::list("output" = output, "p_site_code" = p_site_code, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(name = "p_site_code", "in" = "query", description = "The AMA site code of the station", type = "string"), 
    callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_site_code = "query", callback = "query"))
  params <- base::list("output" = output, "p_site_code" = p_site_code, "callback" = callback, "format" = format)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_site_code"]]) && base::any(!base::nzchar(params[["p_site_code"]]))) base::stop("Empty query parameter: p_site_code")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- ecattams_request("method" = "GET", "path" = "/ecatt_ams_rest_services.get_rpt_map", "path_params" = base::list(), "query" = params[base::setdiff(base::names(params), "format")], "body" = NULL, "form_schema" = NULL, "body_encoding" = list(), "body_media" = "application/json", "request_controls" = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = echo_map_policy("/ecatt_ams_rest_services.get_rpt_map", params$format, params$output))
  result
}

#' ECATT Air Monitoring Station (AMS) HAP Report Service
#' 
#' @noMd
#' @param format Client result format: tidy (default), sf (optional sf package), geojson (string), or raw. Formatted output requires JSON. Metadata is retained in the map attribute (GeoJSON: echo member); .layer distinguishes record arrays. Missing coordinates yield empty geometries.
#' @param body Request body.
#' @return A map tibble, sf points, GeoJSON FeatureCollection string, or decoded response, selected by format. Map coordinates use EPSG:4326; clusters are representative points.
#' @family Air Monitoring Station Hazardous Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattams_get_rpt_map_post <- function(body = NULL, format = "tidy") {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(description = "The AMA site code of the station", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("format" = format, "body" = body)
  result <- ecattams_request("method" = "POST", "path" = "/ecatt_ams_rest_services.get_rpt_map", "path_params" = base::list(), "query" = base::list(), "body" = params$body, "form_schema" = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(description = "The AMA site code of the station", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), required = list()), "body_encoding" = list(output = list(), p_site_code = list(), callback = list()), "body_media" = "application/x-www-form-urlencoded", "request_controls" = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), "response_policy" = echo_map_policy("/ecatt_ams_rest_services.get_rpt_map", params$format, params$body$output))
  result
}

#' ECATT Air Monitoring Station (AMS) HAP Report Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_site_code The AMA site code of the station
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Hazardous Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattams_get_rpt_facs <- function(output = NULL, p_site_code = NULL, callback = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "p_site_code" = p_site_code, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(name = "p_site_code", "in" = "query", description = "The AMA site code of the station", type = "string"), 
    callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_site_code = "query", callback = "query"))
  params <- base::list("output" = output, "p_site_code" = p_site_code, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_site_code"]]) && base::any(!base::nzchar(params[["p_site_code"]]))) base::stop("Empty query parameter: p_site_code")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- ecattams_request(method = "GET", path = "/ecatt_ams_rest_services.get_rpt_facs", path_params = base::list(), query = base::list("output" = params[["output"]], "p_site_code" = params[["p_site_code"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECATT Air Monitoring Station (AMS) HAP Report Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Hazardous Air Pollutant Report Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattams_get_rpt_facs_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(description = "The AMA site code of the station", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- ecattams_request(method = "POST", path = "/ecatt_ams_rest_services.get_rpt_facs", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_site_code = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(description = "The AMA site code of the station", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), required = list()))
  result
}
