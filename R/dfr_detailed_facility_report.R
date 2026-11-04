#' Detailed Facility Report Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param p_system System Acronym Filter.  Enter a single system acronym to filter results.
#' 
#' * FRS (Facility Registry System)
#' * ICIS (Integrated Compliance Information System-Air)
#' * RCRA (Resource Conservation and Recovery Act)
#' * NPDES (National Pollutant Discharge Elimination System)
#' * SDWIS (Safe Drinking Water Information System)
#' * CAMDBS (Clean Air Marketing Division Business System)
#' * EIS (Emissions Inventory System)
#' * RMP (Risk Management Plan)
#' * SEMS (Superfund Enterprise Management System)
#' * TRI (Toxics Release Inventory)
#' * TSCA (Toxic Substances Control Act)
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param p_gt5yr Enter Y to include more than 5 years of data.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_dfr <- function(output = NULL, p_id, p_system = NULL, callback = NULL, p_gt5yr = "N", tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "p_system" = p_system, "callback" = callback, "p_gt5yr" = p_gt5yr), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), p_system = list(name = "p_system", "in" = "query", description = "System Acronym Filter.  Enter a single system acronym to filter results.\n\n* FRS (Facility Registry System)\n* ICIS (Integrated Compliance Information System-Air)\n* RCRA (Resource Conservation and Recovery Act)\n* NPDES (National Pollutant Discharge Elimination System)\n* SDWIS (Safe Drinking Water Information System)\n* CAMDBS (Clean Air Marketing Division Business System)\n* EIS (Emissions Inventory System)\n* RMP (Risk Management Plan)\n* SEMS (Superfund Enterprise Management System)\n* TRI (Toxics Release Inventory)\n* TSCA (Toxic Substances Control Act)", 
    enum = list("FRS", "ICIS", "RCRA", "NPDES", "SDWIS", "CAMDBS", "EIS", "RMP", "SEMS", "TRI", "TSCA"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string"), p_gt5yr = list(name = "p_gt5yr", "in" = "query", description = "Enter Y to include more than 5 years of data.", default = "N", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", p_system = "query", callback = "query", p_gt5yr = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "p_system" = p_system, "callback" = callback, "p_gt5yr" = p_gt5yr, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["p_system"]]) && base::any(!base::nzchar(params[["p_system"]]))) base::stop("Empty query parameter: p_system")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["p_gt5yr"]]) && base::any(!base::nzchar(params[["p_gt5yr"]]))) base::stop("Empty query parameter: p_gt5yr")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_dfr", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "p_system" = params[["p_system"]], "callback" = params[["callback"]], "p_gt5yr" = params[["p_gt5yr"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_dfr_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), p_system = list(description = "System Acronym Filter.  Enter a single system acronym to filter results.\n\n* FRS (Facility Registry System)\n* ICIS (Integrated Compliance Information System-Air)\n* RCRA (Resource Conservation and Recovery Act)\n* NPDES (National Pollutant Discharge Elimination System)\n* SDWIS (Safe Drinking Water Information System)\n* CAMDBS (Clean Air Marketing Division Business System)\n* EIS (Emissions Inventory System)\n* RMP (Risk Management Plan)\n* SEMS (Superfund Enterprise Management System)\n* TRI (Toxics Release Inventory)\n* TSCA (Toxic Substances Control Act)", 
    enum = list("FRS", "ICIS", "RCRA", "NPDES", "SDWIS", "CAMDBS", "EIS", "RMP", "SEMS", "TRI", "TSCA"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string"), p_gt5yr = list(description = "Enter Y to include more than 5 years of data.", default = "N", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_dfr", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), p_system = list(), callback = list(), p_gt5yr = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), p_system = list(description = "System Acronym Filter.  Enter a single system acronym to filter results.\n\n* FRS (Facility Registry System)\n* ICIS (Integrated Compliance Information System-Air)\n* RCRA (Resource Conservation and Recovery Act)\n* NPDES (National Pollutant Discharge Elimination System)\n* SDWIS (Safe Drinking Water Information System)\n* CAMDBS (Clean Air Marketing Division Business System)\n* EIS (Emissions Inventory System)\n* RMP (Risk Management Plan)\n* SEMS (Superfund Enterprise Management System)\n* TRI (Toxics Release Inventory)\n* TSCA (Toxic Substances Control Act)", 
    enum = list("FRS", "ICIS", "RCRA", "NPDES", "SDWIS", "CAMDBS", "EIS", "RMP", "SEMS", "TRI", "TSCA"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string"), p_gt5yr = list(description = "Enter Y to include more than 5 years of data.", default = "N", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Air Compliance Report Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_air_compliance <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_air_compliance", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Air Compliance Report Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_air_compliance_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_air_compliance", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Air Quality Report Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_air_quality <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_air_quality", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Air Quality Report Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_air_quality_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_air_quality", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Air Quality Nonattainment Data
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_air_quality_naa <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_air_quality_naa", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Air Quality Nonattainment Data
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_air_quality_naa_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_air_quality_naa", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Amazon Web Services Facility Documents
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id EPA Facility Registry System's REGISTRY ID for the facility.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_aws_docs <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "EPA Facility Registry System's REGISTRY ID for the facility.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_aws_docs", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Amazon Web Services Facility Documents
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_aws_docs_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), 
    callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_aws_docs", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), 
    callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Displays Cases related to the Facility
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param p_gt5yr Enter Y to include more than 5 years of data.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_case_formal_actions <- function(output = NULL, p_id, callback = NULL, p_gt5yr = "N", tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback, "p_gt5yr" = p_gt5yr), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string"), p_gt5yr = list(name = "p_gt5yr", "in" = "query", description = "Enter Y to include more than 5 years of data.", default = "N", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query", p_gt5yr = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "p_gt5yr" = p_gt5yr, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["p_gt5yr"]]) && base::any(!base::nzchar(params[["p_gt5yr"]]))) base::stop("Empty query parameter: p_gt5yr")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_case_formal_actions", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]], "p_gt5yr" = params[["p_gt5yr"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Displays Cases related to the Facility
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_case_formal_actions_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string"), p_gt5yr = list(description = "Enter Y to include more than 5 years of data.", default = "N", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_case_formal_actions", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list(), p_gt5yr = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string"), p_gt5yr = list(description = "Enter Y to include more than 5 years of data.", default = "N", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report 5 Year Compliance Monitoring History Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param p_gt5yr Enter Y to include more than 5 years of data.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_compliance_history <- function(output = NULL, p_id, callback = NULL, p_gt5yr = "N", tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback, "p_gt5yr" = p_gt5yr), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string"), p_gt5yr = list(name = "p_gt5yr", "in" = "query", description = "Enter Y to include more than 5 years of data.", default = "N", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query", p_gt5yr = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "p_gt5yr" = p_gt5yr, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["p_gt5yr"]]) && base::any(!base::nzchar(params[["p_gt5yr"]]))) base::stop("Empty query parameter: p_gt5yr")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_compliance_history", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]], "p_gt5yr" = params[["p_gt5yr"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report 5 Year Compliance Monitoring History Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_compliance_history_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string"), p_gt5yr = list(description = "Enter Y to include more than 5 years of data.", default = "N", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_compliance_history", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list(), p_gt5yr = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string"), p_gt5yr = list(description = "Enter Y to include more than 5 years of data.", default = "N", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Compliance Summary Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_compliance_summary <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_compliance_summary", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Compliance Summary Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_compliance_summary_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_compliance_summary", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Downloads a spectific section  of the DFR in CSV Format
#' 
#' @noMd
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_csv <- function() {
  params <- base::list()
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_csv", path_params = base::list(), query = base::list(), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Downloads a spectific section  of the DFR in CSV Format
#' 
#' @noMd
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_csv_post <- function() {
  params <- base::list()
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_csv", path_params = base::list(), query = base::list(), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Detailed Facility Report 3 Year CWA Facility-Level Status Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_cwa_3yr_compliance <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_cwa_3yr_compliance", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report 3 Year CWA Facility-Level Status Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_cwa_3yr_compliance_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_cwa_3yr_compliance", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Displays monlthly and quarterly counts of D80 and D90 Effluent Non Reporting Violations Related to the Facility
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_cwa_3yr_d80d90_counts <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_cwa_3yr_d80d90_counts", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Displays monlthly and quarterly counts of D80 and D90 Effluent Non Reporting Violations Related to the Facility
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_cwa_3yr_d80d90_counts_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_cwa_3yr_d80d90_counts", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Downloads CWA Single Event Violation Information
#' 
#' @noMd
#' @param p_registry_id EPA Facility Registry System's REGISTRY ID for the facility.
#' @param p_source_id NPDES ID from ICIS-NPDES for the facility.
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_cwa_3_yr_se_download <- function(p_registry_id = NULL, p_source_id = NULL) {
  .api_validation$parameter_values(base::list("p_registry_id" = p_registry_id, "p_source_id" = p_source_id), list(p_registry_id = list(name = "p_registry_id", "in" = "query", description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), p_source_id = list(name = "p_source_id", "in" = "query", description = "NPDES ID from ICIS-NPDES for the facility.", type = "string")), .api_validation$body_value, c(p_registry_id = "query", p_source_id = "query"))
  params <- base::list("p_registry_id" = p_registry_id, "p_source_id" = p_source_id)
  if (base::is.character(params[["p_registry_id"]]) && base::any(!base::nzchar(params[["p_registry_id"]]))) base::stop("Empty query parameter: p_registry_id")
  if (base::is.character(params[["p_source_id"]]) && base::any(!base::nzchar(params[["p_source_id"]]))) base::stop("Empty query parameter: p_source_id")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.cwa_3_yr_se_download", path_params = base::list(), query = base::list("p_registry_id" = params[["p_registry_id"]], "p_source_id" = params[["p_source_id"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Downloads CWA Single Event Violation Information
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_cwa_3_yr_se_download_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(p_registry_id = list(description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), p_source_id = list(description = "NPDES ID from ICIS-NPDES for the facility.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.cwa_3_yr_se_download", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(p_registry_id = list(), p_source_id = list()), form_schema = list(type = "object", properties = list(p_registry_id = list(description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), p_source_id = list(description = "NPDES ID from ICIS-NPDES for the facility.", type = "string")), required = list()))
  result
}

#' Downloads CWA Permit Schedule Violation Information
#' 
#' @noMd
#' @param p_registry_id EPA Facility Registry System's REGISTRY ID for the facility.
#' @param p_source_id NPDES ID from ICIS-NPDES for the facility.
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_cwa_3_yr_ps_download <- function(p_registry_id = NULL, p_source_id = NULL) {
  .api_validation$parameter_values(base::list("p_registry_id" = p_registry_id, "p_source_id" = p_source_id), list(p_registry_id = list(name = "p_registry_id", "in" = "query", description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), p_source_id = list(name = "p_source_id", "in" = "query", description = "NPDES ID from ICIS-NPDES for the facility.", type = "string")), .api_validation$body_value, c(p_registry_id = "query", p_source_id = "query"))
  params <- base::list("p_registry_id" = p_registry_id, "p_source_id" = p_source_id)
  if (base::is.character(params[["p_registry_id"]]) && base::any(!base::nzchar(params[["p_registry_id"]]))) base::stop("Empty query parameter: p_registry_id")
  if (base::is.character(params[["p_source_id"]]) && base::any(!base::nzchar(params[["p_source_id"]]))) base::stop("Empty query parameter: p_source_id")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.cwa_3_yr_ps_download", path_params = base::list(), query = base::list("p_registry_id" = params[["p_registry_id"]], "p_source_id" = params[["p_source_id"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Downloads CWA Permit Schedule Violation Information
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_cwa_3_yr_ps_download_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(p_registry_id = list(description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), p_source_id = list(description = "NPDES ID from ICIS-NPDES for the facility.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.cwa_3_yr_ps_download", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(p_registry_id = list(), p_source_id = list()), form_schema = list(type = "object", properties = list(p_registry_id = list(description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), p_source_id = list(description = "NPDES ID from ICIS-NPDES for the facility.", type = "string")), required = list()))
  result
}

#' Downloads CWA CS Compliance Schedule Violation Information
#' 
#' @noMd
#' @param p_registry_id EPA Facility Registry System's REGISTRY ID for the facility.
#' @param p_source_id NPDES ID from ICIS-NPDES for the facility.
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_cwa_3_yr_cs_download <- function(p_registry_id = NULL, p_source_id = NULL) {
  .api_validation$parameter_values(base::list("p_registry_id" = p_registry_id, "p_source_id" = p_source_id), list(p_registry_id = list(name = "p_registry_id", "in" = "query", description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), p_source_id = list(name = "p_source_id", "in" = "query", description = "NPDES ID from ICIS-NPDES for the facility.", type = "string")), .api_validation$body_value, c(p_registry_id = "query", p_source_id = "query"))
  params <- base::list("p_registry_id" = p_registry_id, "p_source_id" = p_source_id)
  if (base::is.character(params[["p_registry_id"]]) && base::any(!base::nzchar(params[["p_registry_id"]]))) base::stop("Empty query parameter: p_registry_id")
  if (base::is.character(params[["p_source_id"]]) && base::any(!base::nzchar(params[["p_source_id"]]))) base::stop("Empty query parameter: p_source_id")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.cwa_3_yr_cs_download", path_params = base::list(), query = base::list("p_registry_id" = params[["p_registry_id"]], "p_source_id" = params[["p_source_id"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Downloads CWA CS Compliance Schedule Violation Information
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_cwa_3_yr_cs_download_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(p_registry_id = list(description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), p_source_id = list(description = "NPDES ID from ICIS-NPDES for the facility.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.cwa_3_yr_cs_download", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(p_registry_id = list(), p_source_id = list()), form_schema = list(type = "object", properties = list(p_registry_id = list(description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), p_source_id = list(description = "NPDES ID from ICIS-NPDES for the facility.", type = "string")), required = list()))
  result
}

#' Detailed Facility Report CWA CSV Compliance Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_cwa_cs_compliance_new <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_cwa_cs_compliance_new", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report CWA CSV Compliance Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_cwa_cs_compliance_new_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_cwa_cs_compliance_new", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report CWA Effluent ALR Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_cwa_eff_alr <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_cwa_eff_alr", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report CWA Effluent ALR Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_cwa_eff_alr_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_cwa_eff_alr", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report CWA Benchmark Threshold Exceedances
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY ID or the NPDES ID from ICIS-NPDES for the facility.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_cwa_eff_alr_exp <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY ID or the NPDES ID from ICIS-NPDES for the facility.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_cwa_eff_alr_exp", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report CWA Benchmark Threshold Exceedances
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_cwa_eff_alr_exp_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY ID or the NPDES ID from ICIS-NPDES for the facility.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_cwa_eff_alr_exp", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY ID or the NPDES ID from ICIS-NPDES for the facility.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report CWA Effluent Compliance Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_cwa_eff_compliance <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_cwa_eff_compliance", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report CWA Effluent Compliance Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_cwa_eff_compliance_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_cwa_eff_compliance", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report CWA Effluent Exceedances
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY ID or the NPDES ID from ICIS-NPDES for the facility.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_cwa_eff_compliance_exp <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY ID or the NPDES ID from ICIS-NPDES for the facility.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_cwa_eff_compliance_exp", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report CWA Effluent Exceedances
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_cwa_eff_compliance_exp_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY ID or the NPDES ID from ICIS-NPDES for the facility.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_cwa_eff_compliance_exp", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY ID or the NPDES ID from ICIS-NPDES for the facility.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report CWA PSV Compliance Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_cwa_ps_compliance_new <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_cwa_ps_compliance_new", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report CWA PSV Compliance Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_cwa_ps_compliance_new_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_cwa_ps_compliance_new", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report CWA RNC Compliance Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_cwa_rnc_compliance <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_cwa_rnc_compliance", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report CWA RNC Compliance Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_cwa_rnc_compliance_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_cwa_rnc_compliance", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report CWA SEV Compliance Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_cwa_se_compliance <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_cwa_se_compliance", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report CWA SEV Compliance Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_cwa_se_compliance_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_cwa_se_compliance", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report DMR Reporting Violation (D80/D90) Details
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_npdes_id The NPDES ID from ICIS-NPDES for the facility.
#' @param p_missinglate For the D80.D90 download, identifies whether or not MISSING violations are downloaded or LATE violations are downloaded.  Valid values are:  MISSING and LATE.
#' @param p_qmtype Identifies the time frame type, month or quarter, for the D80/D90 download.
#' @param p_qmvalue A number between 1 and 39 that identifies the specific month or quarter for the D80/D90 violation download.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_d80d90s_details <- function(output = NULL, p_npdes_id, p_missinglate, p_qmtype, p_qmvalue, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_npdes_id)) base::stop("Required input: p_npdes_id")
  if (base::is.null(p_missinglate)) base::stop("Required input: p_missinglate")
  if (base::is.null(p_qmtype)) base::stop("Required input: p_qmtype")
  if (base::is.null(p_qmvalue)) base::stop("Required input: p_qmvalue")
  .api_validation$parameter_values(base::list("output" = output, "p_npdes_id" = p_npdes_id, "p_missinglate" = p_missinglate, "p_qmtype" = p_qmtype, "p_qmvalue" = p_qmvalue, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_npdes_id = list(name = "p_npdes_id", "in" = "query", description = "The NPDES ID from ICIS-NPDES for the facility.", 
    type = "string"), p_missinglate = list(name = "p_missinglate", "in" = "query", description = "For the D80.D90 download, identifies whether or not MISSING violations are downloaded or LATE violations are downloaded.  Valid values are:  MISSING and LATE.", enum = list("MISSING", "LATE"), type = "string"), p_qmtype = list(name = "p_qmtype", "in" = "query", description = "Identifies the time frame type, month or quarter, for the D80/D90 download.", enum = list("MONTH", "QUARTER"), type = "string"), 
    p_qmvalue = list(name = "p_qmvalue", "in" = "query", description = "A number between 1 and 39 that identifies the specific month or quarter for the D80/D90 violation download.", type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_npdes_id = "query", p_missinglate = "query", p_qmtype = "query", p_qmvalue = "query", callback = "query"))
  params <- base::list("output" = output, "p_npdes_id" = p_npdes_id, "p_missinglate" = p_missinglate, "p_qmtype" = p_qmtype, "p_qmvalue" = p_qmvalue, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_npdes_id"]]) && base::any(!base::nzchar(params[["p_npdes_id"]]))) base::stop("Empty query parameter: p_npdes_id")
  if (base::is.character(params[["p_missinglate"]]) && base::any(!base::nzchar(params[["p_missinglate"]]))) base::stop("Empty query parameter: p_missinglate")
  if (base::is.character(params[["p_qmtype"]]) && base::any(!base::nzchar(params[["p_qmtype"]]))) base::stop("Empty query parameter: p_qmtype")
  if (base::is.character(params[["p_qmvalue"]]) && base::any(!base::nzchar(params[["p_qmvalue"]]))) base::stop("Empty query parameter: p_qmvalue")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_d80d90s_details", path_params = base::list(), query = base::list("output" = params[["output"]], "p_npdes_id" = params[["p_npdes_id"]], "p_missinglate" = params[["p_missinglate"]], "p_qmtype" = params[["p_qmtype"]], "p_qmvalue" = params[["p_qmvalue"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report DMR Reporting Violation (D80/D90) Details
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_npdes_id The NPDES ID from ICIS-NPDES for the facility.
#' @param p_missinglate For the D80.D90 download, identifies whether or not MISSING violations are downloaded or LATE violations are downloaded.  Valid values are:  MISSING and LATE.
#' @param p_qmtype Identifies the time frame type, month or quarter, for the D80/D90 download.
#' @param p_qmvalue A number between 1 and 39 that identifies the specific month or quarter for the D80/D90 violation download.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_d80d90s_details_post <- function(output = NULL, p_npdes_id, p_missinglate, p_qmtype, p_qmvalue, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_npdes_id)) base::stop("Required input: p_npdes_id")
  if (base::is.null(p_missinglate)) base::stop("Required input: p_missinglate")
  if (base::is.null(p_qmtype)) base::stop("Required input: p_qmtype")
  if (base::is.null(p_qmvalue)) base::stop("Required input: p_qmvalue")
  .api_validation$parameter_values(base::list("output" = output, "p_npdes_id" = p_npdes_id, "p_missinglate" = p_missinglate, "p_qmtype" = p_qmtype, "p_qmvalue" = p_qmvalue, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_npdes_id = list(name = "p_npdes_id", "in" = "query", description = "The NPDES ID from ICIS-NPDES for the facility.", 
    type = "string"), p_missinglate = list(name = "p_missinglate", "in" = "query", description = "For the D80.D90 download, identifies whether or not MISSING violations are downloaded or LATE violations are downloaded.  Valid values are:  MISSING and LATE.", enum = list("MISSING", "LATE"), type = "string"), p_qmtype = list(name = "p_qmtype", "in" = "query", description = "Identifies the time frame type, month or quarter, for the D80/D90 download.", enum = list("MONTH", "QUARTER"), type = "string"), 
    p_qmvalue = list(name = "p_qmvalue", "in" = "query", description = "A number between 1 and 39 that identifies the specific month or quarter for the D80/D90 violation download.", type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_npdes_id = "query", p_missinglate = "query", p_qmtype = "query", p_qmvalue = "query", callback = "query"))
  params <- base::list("output" = output, "p_npdes_id" = p_npdes_id, "p_missinglate" = p_missinglate, "p_qmtype" = p_qmtype, "p_qmvalue" = p_qmvalue, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_npdes_id"]]) && base::any(!base::nzchar(params[["p_npdes_id"]]))) base::stop("Empty query parameter: p_npdes_id")
  if (base::is.character(params[["p_missinglate"]]) && base::any(!base::nzchar(params[["p_missinglate"]]))) base::stop("Empty query parameter: p_missinglate")
  if (base::is.character(params[["p_qmtype"]]) && base::any(!base::nzchar(params[["p_qmtype"]]))) base::stop("Empty query parameter: p_qmtype")
  if (base::is.character(params[["p_qmvalue"]]) && base::any(!base::nzchar(params[["p_qmvalue"]]))) base::stop("Empty query parameter: p_qmvalue")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_d80d90s_details", path_params = base::list(), query = base::list("output" = params[["output"]], "p_npdes_id" = params[["p_npdes_id"]], "p_missinglate" = params[["p_missinglate"]], "p_qmtype" = params[["p_qmtype"]], "p_qmvalue" = params[["p_qmvalue"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Displays 2010 Census and ACS demographics by Facility ID for Facilites in U.S. Territories
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_minortt_demographics_by_id <- function(output = NULL, p_id, callback = NULL) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_minortt_demographics_by_id", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Displays 2010 Census and ACS demographics by Facility ID for Facilites in U.S. Territories
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_minortt_demographics_by_id_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_minortt_demographics_by_id", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
}

#' Detailed Facility Report Effluent Limitation Guideline (ELG)
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY ID or the NPDES ID from ICIS-NPDES for the facility.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_elg_codes <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY ID or the NPDES ID from ICIS-NPDES for the facility.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_elg_codes", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Effluent Limitation Guideline (ELG)
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_elg_codes_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY ID or the NPDES ID from ICIS-NPDES for the facility.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_elg_codes", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY ID or the NPDES ID from ICIS-NPDES for the facility.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Enforcement Summary Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_enforcement_summary <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_enforcement_summary", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Enforcement Summary Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_enforcement_summary_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_enforcement_summary", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Displays the dates that data was extracted from native EPA systems for the DFR
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_extract_dates <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_extract_dates", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Displays the dates that data was extracted from native EPA systems for the DFR
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_extract_dates_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_extract_dates", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Formal Actions Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_formal_actions <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_formal_actions", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Formal Actions Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_formal_actions_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_formal_actions", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report ICIS Formal Actions Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_icis_formal_actions <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_icis_formal_actions", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report ICIS Formal Actions Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_icis_formal_actions_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_icis_formal_actions", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Inspections Summary Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_inspections <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_inspections", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Inspections Summary Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_inspections_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_inspections", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report NAICS Code Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_naics <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_naics", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report NAICS Code Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_naics_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_naics", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Notices Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param p_gt5yr Enter Y to include more than 5 years of data.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_notices <- function(output = NULL, p_id, callback = NULL, p_gt5yr = "N", tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback, "p_gt5yr" = p_gt5yr), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string"), p_gt5yr = list(name = "p_gt5yr", "in" = "query", description = "Enter Y to include more than 5 years of data.", default = "N", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query", p_gt5yr = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "p_gt5yr" = p_gt5yr, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["p_gt5yr"]]) && base::any(!base::nzchar(params[["p_gt5yr"]]))) base::stop("Empty query parameter: p_gt5yr")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_notices", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]], "p_gt5yr" = params[["p_gt5yr"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Notices Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_notices_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string"), p_gt5yr = list(description = "Enter Y to include more than 5 years of data.", default = "N", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_notices", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list(), p_gt5yr = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string"), p_gt5yr = list(description = "Enter Y to include more than 5 years of data.", default = "N", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Permits Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_permits <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_permits", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Permits Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_permits_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_permits", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report RCRA Compliance Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_rcra_compliance <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_rcra_compliance", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report RCRA Compliance Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_rcra_compliance_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_rcra_compliance", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report SDWA Lead and Copper Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_sdwa_lead_and_copper <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_sdwa_lead_and_copper", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report SDWA Lead and Copper Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_sdwa_lead_and_copper_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_sdwa_lead_and_copper", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report SDWA Sanitary Surveys Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_sdwa_sanitary_surveys <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_sdwa_sanitary_surveys", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report SDWA Sanitary Surveys Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_sdwa_sanitary_surveys_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_sdwa_sanitary_surveys", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report SDWA Sanitary Site Visits Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_sdwa_site_visits <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_sdwa_site_visits", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report SDWA Sanitary Site Visits Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_sdwa_site_visits_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_sdwa_site_visits", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report SDWA Violations Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_sdwa_violations <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_sdwa_violations", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report SDWA Violations Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_sdwa_violations_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_sdwa_violations", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report SDWIS Compliance Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_sdwis_compliance <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_sdwis_compliance", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report SDWIS Compliance Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_sdwis_compliance_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_sdwis_compliance", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report SIC Code Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_sic_codes <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_sic_codes", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report SIC Code Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_sic_codes_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_sic_codes", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Spatial Metadata Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_spatial_metadata <- function(output = NULL, p_id, callback = NULL) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_spatial_metadata", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Detailed Facility Report Spatial Metadata Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_spatial_metadata_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_spatial_metadata", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
}

#' Detailed Facility Report TRI History Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_tri_history <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_tri_history", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report TRI History Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_tri_history_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_tri_history", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report TRI Releases Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_tri_releases <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_tri_releases", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report TRI Releases Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_tri_releases_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_tri_releases", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Tribes Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_tribes <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_tribes", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Tribes Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_tribes_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_tribes", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Assessed Waters Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id EPA Facility Registry System's REGISTRY ID for the facility.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_assessed_waters <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "EPA Facility Registry System's REGISTRY ID for the facility.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_assessed_waters", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Assessed Waters Service
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_assessed_waters_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), 
    callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_assessed_waters", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), 
    callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Watersheds
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id EPA Facility Registry System's REGISTRY ID for the facility.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_watersheds <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "EPA Facility Registry System's REGISTRY ID for the facility.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_watersheds", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Watersheds
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_watersheds_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), 
    callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_watersheds", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), 
    callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report Map Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_map <- function(output = NULL, p_id, callback = NULL) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_map", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Detailed Facility Report Map Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_map_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_map", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Either the EPA Facility Registry System's REGISTRY_ID for a facility or the facility identifier from an EPA System.", 
    type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
}

#' Downloads NPDES Effluent Violation Information by month and quarter
#' 
#' @noMd
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_cwa_3_yr_effluent_download <- function() {
  params <- base::list()
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.cwa_3_yr_effluent_download", path_params = base::list(), query = base::list(), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Downloads NPDES Effluent Violation Information by month and quarter
#' 
#' @noMd
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_cwa_3_yr_effluent_download_post <- function() {
  params <- base::list()
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.cwa_3_yr_effluent_download", path_params = base::list(), query = base::list(), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Downloads NPDES Compliance Schedule, Permit Schedule and Single Event Violation Information by month and quarter
#' 
#' @noMd
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_cwa_3_yr_sepscs_download <- function() {
  params <- base::list()
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.cwa_3_yr_sepscs_download", path_params = base::list(), query = base::list(), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Downloads NPDES Compliance Schedule, Permit Schedule and Single Event Violation Information by month and quarter
#' 
#' @noMd
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_cwa_3_yr_sepscs_download_post <- function() {
  params <- base::list()
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.cwa_3_yr_sepscs_download", path_params = base::list(), query = base::list(), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Downloads the complete Air Compliance History Section of the DFR
#' 
#' @noMd
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_air_3_yr_download <- function() {
  params <- base::list()
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.air_3_yr_download", path_params = base::list(), query = base::list(), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Downloads the complete Air Compliance History Section of the DFR
#' 
#' @noMd
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_air_3_yr_download_post <- function() {
  params <- base::list()
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.air_3_yr_download", path_params = base::list(), query = base::list(), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Downloads the complete RCRA Compliance History Section of the DFR
#' 
#' @noMd
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_rcra_3_yr_download <- function() {
  params <- base::list()
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.rcra_3_yr_download", path_params = base::list(), query = base::list(), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Downloads the complete RCRA Compliance History Section of the DFR
#' 
#' @noMd
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_rcra_3_yr_download_post <- function() {
  params <- base::list()
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.rcra_3_yr_download", path_params = base::list(), query = base::list(), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Detailed Facility Report CWA Compliance Status Download
#' 
#' @noMd
#' @param p_registry_id EPA Facility Registry System's REGISTRY ID for the facility.
#' @param p_source_id NPDES ID from ICIS-NPDES for the facility.
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_cwa_3_yr_compl_status_download <- function(p_registry_id = NULL, p_source_id = NULL) {
  .api_validation$parameter_values(base::list("p_registry_id" = p_registry_id, "p_source_id" = p_source_id), list(p_registry_id = list(name = "p_registry_id", "in" = "query", description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), p_source_id = list(name = "p_source_id", "in" = "query", description = "NPDES ID from ICIS-NPDES for the facility.", type = "string")), .api_validation$body_value, c(p_registry_id = "query", p_source_id = "query"))
  params <- base::list("p_registry_id" = p_registry_id, "p_source_id" = p_source_id)
  if (base::is.character(params[["p_registry_id"]]) && base::any(!base::nzchar(params[["p_registry_id"]]))) base::stop("Empty query parameter: p_registry_id")
  if (base::is.character(params[["p_source_id"]]) && base::any(!base::nzchar(params[["p_source_id"]]))) base::stop("Empty query parameter: p_source_id")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.cwa_3_yr_compl_status_download", path_params = base::list(), query = base::list("p_registry_id" = params[["p_registry_id"]], "p_source_id" = params[["p_source_id"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Detailed Facility Report CWA Compliance Status Download
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_cwa_3_yr_compl_status_download_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(p_registry_id = list(description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), p_source_id = list(description = "NPDES ID from ICIS-NPDES for the facility.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.cwa_3_yr_compl_status_download", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(p_registry_id = list(), p_source_id = list()), form_schema = list(type = "object", properties = list(p_registry_id = list(description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), p_source_id = list(description = "NPDES ID from ICIS-NPDES for the facility.", type = "string")), required = list()))
  result
}

#' Detailed Facility Report CWA Effluent Download
#' 
#' @noMd
#' @param p_registry_id EPA Facility Registry System's REGISTRY ID for the facility.
#' @param p_source_id NPDES ID from ICIS-NPDES for the facility.
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_cwa_3_yr_effluent_download_exp <- function(p_registry_id = NULL, p_source_id = NULL) {
  .api_validation$parameter_values(base::list("p_registry_id" = p_registry_id, "p_source_id" = p_source_id), list(p_registry_id = list(name = "p_registry_id", "in" = "query", description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), p_source_id = list(name = "p_source_id", "in" = "query", description = "NPDES ID from ICIS-NPDES for the facility.", type = "string")), .api_validation$body_value, c(p_registry_id = "query", p_source_id = "query"))
  params <- base::list("p_registry_id" = p_registry_id, "p_source_id" = p_source_id)
  if (base::is.character(params[["p_registry_id"]]) && base::any(!base::nzchar(params[["p_registry_id"]]))) base::stop("Empty query parameter: p_registry_id")
  if (base::is.character(params[["p_source_id"]]) && base::any(!base::nzchar(params[["p_source_id"]]))) base::stop("Empty query parameter: p_source_id")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.cwa_3_yr_effluent_download_exp", path_params = base::list(), query = base::list("p_registry_id" = params[["p_registry_id"]], "p_source_id" = params[["p_source_id"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Detailed Facility Report CWA Effluent Download
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_cwa_3_yr_effluent_download_exp_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(p_registry_id = list(description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), p_source_id = list(description = "NPDES ID from ICIS-NPDES for the facility.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.cwa_3_yr_effluent_download_exp", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(p_registry_id = list(), p_source_id = list()), form_schema = list(type = "object", properties = list(p_registry_id = list(description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), p_source_id = list(description = "NPDES ID from ICIS-NPDES for the facility.", type = "string")), required = list()))
  result
}

#' Detailed Facility Report Downloads Service
#' 
#' @noMd
#' @param p_id Identifier for the service.
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_download_data <- function(p_id) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("p_id" = p_id), list(p_id = list(name = "p_id", "in" = "query", description = "Identifier for the service.", type = "string")), .api_validation$body_value, c(p_id = "query"))
  params <- base::list("p_id" = p_id)
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.download_data", path_params = base::list(), query = base::list("p_id" = params[["p_id"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Detailed Facility Report Downloads Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_download_data_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(p_id = list(description = "Identifier for the service.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.download_data", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(p_id = list()), form_schema = list(type = "object", properties = list(p_id = list(description = "Identifier for the service.", type = "string")), required = list("p_id")))
  result
}

#' Detailed Facility Report Download JSON Service
#' 
#' @noMd
#' @param p_id Identifier for the service.
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_dfr_json_dowload <- function(p_id) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("p_id" = p_id), list(p_id = list(name = "p_id", "in" = "query", description = "Identifier for the service.", type = "string")), .api_validation$body_value, c(p_id = "query"))
  params <- base::list("p_id" = p_id)
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_dfr_json_dowload", path_params = base::list(), query = base::list("p_id" = params[["p_id"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Detailed Facility Report Download JSON Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_dfr_json_dowload_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(p_id = list(description = "Identifier for the service.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_dfr_json_dowload", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(p_id = list()), form_schema = list(type = "object", properties = list(p_id = list(description = "Identifier for the service.", type = "string")), required = list("p_id")))
  result
}

#' Detailed Facility Report SDWA Compliance Data Download
#' 
#' @noMd
#' @param p_registry_id EPA Facility Registry System's REGISTRY ID for the facility.
#' @param p_source_id Public Water System Identifier (PWSID) from the Safe Drinking Water Information System.
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_sdwa_3_yr_download <- function(p_registry_id = NULL, p_source_id = NULL) {
  .api_validation$parameter_values(base::list("p_registry_id" = p_registry_id, "p_source_id" = p_source_id), list(p_registry_id = list(name = "p_registry_id", "in" = "query", description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), p_source_id = list(name = "p_source_id", "in" = "query", description = "Public Water System Identifier (PWSID) from the Safe Drinking Water Information System.", type = "string")), .api_validation$body_value, c(p_registry_id = "query", p_source_id = "query"))
  params <- base::list("p_registry_id" = p_registry_id, "p_source_id" = p_source_id)
  if (base::is.character(params[["p_registry_id"]]) && base::any(!base::nzchar(params[["p_registry_id"]]))) base::stop("Empty query parameter: p_registry_id")
  if (base::is.character(params[["p_source_id"]]) && base::any(!base::nzchar(params[["p_source_id"]]))) base::stop("Empty query parameter: p_source_id")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.sdwa_3_yr_download", path_params = base::list(), query = base::list("p_registry_id" = params[["p_registry_id"]], "p_source_id" = params[["p_source_id"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Detailed Facility Report SDWA Compliance Data Download
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_sdwa_3_yr_download_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(p_registry_id = list(description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), p_source_id = list(description = "Public Water System Identifier (PWSID) from the Safe Drinking Water Information System.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.sdwa_3_yr_download", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(p_registry_id = list(), p_source_id = list()), form_schema = list(type = "object", properties = list(p_registry_id = list(description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), p_source_id = list(description = "Public Water System Identifier (PWSID) from the Safe Drinking Water Information System.", type = "string")), required = list()))
  result
}

#' Detailed Facility Report BFLM Compliance Data
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id Identifier for the service.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_bflm_compliance <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Identifier for the service.", type = "string"), callback = list(
    name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_bflm_compliance", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report BFLM Compliance Data
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_bflm_compliance_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Identifier for the service.", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_bflm_compliance", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "Identifier for the service.", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' CWA DMR Monitoring Period Pollutant Loadings
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id EPA Facility Registry System's REGISTRY ID for the facility.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_dmr_poll_loads <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "EPA Facility Registry System's REGISTRY ID for the facility.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_dmr_poll_loads", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' CWA DMR Monitoring Period Pollutant Loadings
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_dmr_poll_loads_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), 
    callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_dmr_poll_loads", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), 
    callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report RCRA Waste History
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_id EPA Facility Registry System's REGISTRY ID for the facility.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_rcra_waste_history <- function(output = NULL, p_id, callback = NULL, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(name = "p_id", "in" = "query", description = "EPA Facility Registry System's REGISTRY ID for the facility.", 
    type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "p_id" = p_id, "callback" = callback, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_rcra_waste_history", path_params = base::list(), query = base::list("output" = params[["output"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Detailed Facility Report RCRA Waste History
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_rcra_waste_history_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), 
    callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_rcra_waste_history", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_id = list(description = "EPA Facility Registry System's REGISTRY ID for the facility.", type = "string"), 
    callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' ACS Demographics Data
#' 
#' @noMd
#' @param p_lat Latitude location in decimal degrees.
#' @param p_long Longitude location in decimal degrees.
#' @param p_radius Spatial Search Radius.  Enter a radius up to 100 miles in which to spatially search for facilities.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_acs2023x_demographics <- function(p_lat = NULL, p_long = NULL, p_radius = NULL, tidy = TRUE) {
  .api_validation$parameter_values(base::list("p_lat" = p_lat, "p_long" = p_long, "p_radius" = p_radius), list(p_lat = list(name = "p_lat", "in" = "query", description = "Latitude location in decimal degrees.", type = "number"), p_long = list(name = "p_long", "in" = "query", description = "Longitude location in decimal degrees.", type = "number"), p_radius = list(name = "p_radius", "in" = "query", description = "Spatial Search Radius.  Enter a radius up to 100 miles in which to spatially search for facilities.", type = "number")), .api_validation$body_value, c(p_lat = "query", p_long = "query", p_radius = "query"))
  params <- base::list("p_lat" = p_lat, "p_long" = p_long, "p_radius" = p_radius, "tidy" = tidy)
  if (base::is.character(params[["p_lat"]]) && base::any(!base::nzchar(params[["p_lat"]]))) base::stop("Empty query parameter: p_lat")
  if (base::is.character(params[["p_long"]]) && base::any(!base::nzchar(params[["p_long"]]))) base::stop("Empty query parameter: p_long")
  if (base::is.character(params[["p_radius"]]) && base::any(!base::nzchar(params[["p_radius"]]))) base::stop("Empty query parameter: p_radius")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_acs2023x_demographics", path_params = base::list(), query = base::list("p_lat" = params[["p_lat"]], "p_long" = params[["p_long"]], "p_radius" = params[["p_radius"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' ACS Demographics Data
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_acs2023x_demographics_post <- function(body = NULL, tidy = TRUE) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(p_lat = list(description = "Latitude location in decimal degrees.", type = "number"), p_long = list(description = "Longitude location in decimal degrees.", type = "number"), p_radius = list(description = "Spatial Search Radius.  Enter a radius up to 100 miles in which to spatially search for facilities.", type = "number")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_acs2023x_demographics", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(p_lat = list(), p_long = list(), p_radius = list()), form_schema = list(type = "object", properties = list(p_lat = list(description = "Latitude location in decimal degrees.", type = "number"), p_long = list(description = "Longitude location in decimal degrees.", type = "number"), p_radius = list(description = "Spatial Search Radius.  Enter a radius up to 100 miles in which to spatially search for facilities.", type = "number")), required = list()))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' SAB ACS Demographics Data
#' 
#' @noMd
#' @param p_id Identifier for the service.
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_sab_acs2023_demographics_by_id <- function(p_id, tidy = TRUE) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("p_id" = p_id), list(p_id = list(name = "p_id", "in" = "query", description = "Identifier for the service.", type = "string")), .api_validation$body_value, c(p_id = "query"))
  params <- base::list("p_id" = p_id, "tidy" = tidy)
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  result <- dfr_request(method = "GET", path = "/dfr_rest_services.get_sab_acs2023_demographics_by_id", path_params = base::list(), query = base::list("p_id" = params[["p_id"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' SAB ACS Demographics Data
#' 
#' @noMd
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @param body Request body.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Detailed Facility Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_get_sab_acs2023_demographics_by_id_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(p_id = list(description = "Identifier for the service.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- dfr_request(method = "POST", path = "/dfr_rest_services.get_sab_acs2023_demographics_by_id", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(p_id = list()), form_schema = list(type = "object", properties = list(p_id = list(description = "Identifier for the service.", type = "string")), required = list("p_id")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}
