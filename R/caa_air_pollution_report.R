#' Air Pollutant Report Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id EPA Facility Registry Service's REGISTRY_ID. A unique identifier for a facility across EPA program databases.
#' @param p_units Units of Measurement.  For the Air Pollutant Report, the default value is 'lbs'.  Enter "TWPE" for Toxic Weighted Pounds Equivalents (TWPE). 
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Air Pollution Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
caa_get_caapr <- function(output = NULL, p_id, p_units = NULL, callback = NULL) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "p_units" = p_units, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "EPA Facility Registry Service's REGISTRY_ID. A unique identifier for a facility across EPA program databases.", 
    type = "string"), p_units = list(name = "p_units", "in" = "query", description = "Units of Measurement.  For the Air Pollutant Report, the default value is 'lbs'.  Enter \"TWPE\" for Toxic Weighted Pounds Equivalents (TWPE). ", type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", p_units = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "p_units" = p_units, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["p_units"]]) && base::any(!base::nzchar(params[["p_units"]]))) base::stop("Empty query parameter: p_units")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- caa_request(method = "GET", path = "/caa_poll_rpt_rest_services.get_caapr", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "p_units" = params[["p_units"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Air Pollutant Report Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Pollution Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
caa_get_caapr_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "EPA Facility Registry Service's REGISTRY_ID. A unique identifier for a facility across EPA program databases.", 
    type = "string"), p_units = list(description = "Units of Measurement.  For the Air Pollutant Report, the default value is 'lbs'.  Enter \"TWPE\" for Toxic Weighted Pounds Equivalents (TWPE). ", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- caa_request(method = "POST", path = "/caa_poll_rpt_rest_services.get_caapr", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), p_units = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "EPA Facility Registry Service's REGISTRY_ID. A unique identifier for a facility across EPA program databases.", 
    type = "string"), p_units = list(description = "Units of Measurement.  For the Air Pollutant Report, the default value is 'lbs'.  Enter \"TWPE\" for Toxic Weighted Pounds Equivalents (TWPE). ", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
}

#' Air Pollutant Report Permits Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param nnn Statute filter, provide a single statute code to filter permit results (e.g., "CAA")
#' @param nn2 Secondary statute filter, provide a single statute code to filter permit results (e.g., "EP313")
#' @param p_id EPA Facility Registry Service's REGISTRY_ID. A unique identifier for a facility across EPA program databases.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Air Pollution Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
caa_get_nnn_permits <- function(output = NULL, nnn = NULL, nn2 = NULL, p_id, callback = NULL) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "nnn" = nnn, "nn2" = nn2, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), nnn = list(name = "nnn", "in" = "query", description = "Statute filter, provide a single statute code to filter permit results (e.g., \"CAA\")", 
    type = "string"), nn2 = list(name = "nn2", "in" = "query", description = "Secondary statute filter, provide a single statute code to filter permit results (e.g., \"EP313\")", type = "string"), p_id = list(name = "p_id", "in" = "query", description = "EPA Facility Registry Service's REGISTRY_ID. A unique identifier for a facility across EPA program databases.", type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), .api_validation$body_value, c(output = "query", nnn = "query", nn2 = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "nnn" = nnn, "nn2" = nn2, "p_id" = p_id, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["nnn"]]) && base::any(!base::nzchar(params[["nnn"]]))) base::stop("Empty query parameter: nnn")
  if (base::is.character(params[["nn2"]]) && base::any(!base::nzchar(params[["nn2"]]))) base::stop("Empty query parameter: nn2")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- caa_request(method = "GET", path = "/caa_poll_rpt_rest_services.get_nnnPermits", path_params = base::list(), query = base::list("output" = params[["output"]], "nnn" = params[["nnn"]], "nn2" = params[["nn2"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Air Pollutant Report Permits Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Pollution Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
caa_get_nnn_permits_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), nnn = list(description = "Statute filter, provide a single statute code to filter permit results (e.g., \"CAA\")", 
    type = "string"), nn2 = list(description = "Secondary statute filter, provide a single statute code to filter permit results (e.g., \"EP313\")", type = "string"), p_id = list(description = "EPA Facility Registry Service's REGISTRY_ID. A unique identifier for a facility across EPA program databases.", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), 
    required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- caa_request(method = "POST", path = "/caa_poll_rpt_rest_services.get_nnnPermits", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), nnn = list(), nn2 = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), nnn = list(description = "Statute filter, provide a single statute code to filter permit results (e.g., \"CAA\")", 
    type = "string"), nn2 = list(description = "Secondary statute filter, provide a single statute code to filter permit results (e.g., \"EP313\")", type = "string"), p_id = list(description = "EPA Facility Registry Service's REGISTRY_ID. A unique identifier for a facility across EPA program databases.", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), 
    required = list("p_id")))
  result
}

#' Air Pollutant Report Aggregated Emissions Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id EPA Facility Registry Service's REGISTRY_ID. A unique identifier for a facility across EPA program databases.
#' @param p_units Units of Measurement.  For the Air Pollutant Report, the default value is 'lbs'.  Enter "TWPE" for Toxic Weighted Pounds Equivalents (TWPE). 
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Air Pollution Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
caa_get_aggregate_emissions <- function(output = NULL, p_id, p_units = NULL, callback = NULL) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "p_units" = p_units, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "EPA Facility Registry Service's REGISTRY_ID. A unique identifier for a facility across EPA program databases.", 
    type = "string"), p_units = list(name = "p_units", "in" = "query", description = "Units of Measurement.  For the Air Pollutant Report, the default value is 'lbs'.  Enter \"TWPE\" for Toxic Weighted Pounds Equivalents (TWPE). ", type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", p_units = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "p_units" = p_units, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["p_units"]]) && base::any(!base::nzchar(params[["p_units"]]))) base::stop("Empty query parameter: p_units")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- caa_request(method = "GET", path = "/caa_poll_rpt_rest_services.get_aggregate_emissions", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "p_units" = params[["p_units"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Air Pollutant Report Aggregated Emissions Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Pollution Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
caa_get_aggregate_emissions_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "EPA Facility Registry Service's REGISTRY_ID. A unique identifier for a facility across EPA program databases.", 
    type = "string"), p_units = list(description = "Units of Measurement.  For the Air Pollutant Report, the default value is 'lbs'.  Enter \"TWPE\" for Toxic Weighted Pounds Equivalents (TWPE). ", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- caa_request(method = "POST", path = "/caa_poll_rpt_rest_services.get_aggregate_emissions", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), p_units = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "EPA Facility Registry Service's REGISTRY_ID. A unique identifier for a facility across EPA program databases.", 
    type = "string"), p_units = list(description = "Units of Measurement.  For the Air Pollutant Report, the default value is 'lbs'.  Enter \"TWPE\" for Toxic Weighted Pounds Equivalents (TWPE). ", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
}

#' Air Pollutant Report Air Quality Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id EPA Facility Registry Service's REGISTRY_ID. A unique identifier for a facility across EPA program databases.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Air Pollution Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
caa_get_air_quality <- function(output = NULL, p_id, callback = NULL) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "EPA Facility Registry Service's REGISTRY_ID. A unique identifier for a facility across EPA program databases.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- caa_request(method = "GET", path = "/caa_poll_rpt_rest_services.get_air_quality", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Air Pollutant Report Air Quality Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Pollution Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
caa_get_air_quality_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "EPA Facility Registry Service's REGISTRY_ID. A unique identifier for a facility across EPA program databases.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- caa_request(method = "POST", path = "/caa_poll_rpt_rest_services.get_air_quality", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "EPA Facility Registry Service's REGISTRY_ID. A unique identifier for a facility across EPA program databases.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
}

#' Air Pollutant Report Map Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id EPA Facility Registry Service's REGISTRY_ID. A unique identifier for a facility across EPA program databases.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Air Pollution Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
caa_get_map <- function(output = NULL, p_id, callback = NULL) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "EPA Facility Registry Service's REGISTRY_ID. A unique identifier for a facility across EPA program databases.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- caa_request(method = "GET", path = "/caa_poll_rpt_rest_services.get_map", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Air Pollutant Report Map Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Pollution Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
caa_get_map_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "EPA Facility Registry Service's REGISTRY_ID. A unique identifier for a facility across EPA program databases.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- caa_request(method = "POST", path = "/caa_poll_rpt_rest_services.get_map", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "EPA Facility Registry Service's REGISTRY_ID. A unique identifier for a facility across EPA program databases.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
}

#' Air Pollutant Report Spatial Metadata Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Identifier for the service.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Air Pollution Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
caa_get_spatial_metadata <- function(output = NULL, p_id, callback = NULL) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Identifier for the service.", type = "string"), callback = list(
    name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- caa_request(method = "GET", path = "/caa_poll_rpt_rest_services.get_spatial_metadata", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Air Pollutant Report Spatial Metadata Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Pollution Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
caa_get_spatial_metadata_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Identifier for the service.", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- caa_request(method = "POST", path = "/caa_poll_rpt_rest_services.get_spatial_metadata", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Identifier for the service.", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), required = list("p_id")))
  result
}
