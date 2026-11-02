#' Air inspections, violations and enforcement actions
#' 
#' @noMd
#' @param output Output format. JSON (default), JSONP, or XML.
#' @param callback JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.
#' @param p_id ICIS-Air ID (e.g. OH0000000123010434) or FRS registry ID.
#' @return Decoded response returned by the client request helper.
#' @family Pipeline endpoints
#' @export
# Generated with specmill; do not edit by hand.
pipeline_get_pipeline_air <- function(output = NULL, callback = NULL, p_id) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "p_id" = p_id), list(output = list(name = "output", description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML"), "in" = "query"), callback = list(name = "callback", description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string", "in" = "query"), p_id = list(name = "p_id", description = "ICIS-Air ID (e.g. OH0000000123010434) or FRS registry ID.", type = "string", "in" = "query")), .api_validation$body_value, c(output = "query", callback = "query", p_id = "query"))
  params <- base::list("output" = output, "callback" = callback, "p_id" = p_id)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  result <- pipeline_request(method = "GET", path = "/pipeline_rest_services.get_pipeline_air", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "p_id" = params[["p_id"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Air inspections, violations and enforcement actions
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Pipeline endpoints
#' @export
# Generated with specmill; do not edit by hand.
pipeline_get_pipeline_air_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string"), p_id = list(description = "ICIS-Air ID (e.g. OH0000000123010434) or FRS registry ID.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- pipeline_request(method = "POST", path = "/pipeline_rest_services.get_pipeline_air", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), p_id = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string"), p_id = list(description = "ICIS-Air ID (e.g. OH0000000123010434) or FRS registry ID.", type = "string")), required = list("p_id")))
  result
}

#' RCRA inspections, violations and enforcement actions
#' 
#' @noMd
#' @param output Output format. JSON (default), JSONP, or XML.
#' @param callback JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.
#' @param p_id RCRA handler ID or FRS registry ID.
#' @return Decoded response returned by the client request helper.
#' @family Pipeline endpoints
#' @export
# Generated with specmill; do not edit by hand.
pipeline_get_pipeline_rcra <- function(output = NULL, callback = NULL, p_id) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "p_id" = p_id), list(output = list(name = "output", description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML"), "in" = "query"), callback = list(name = "callback", description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string", "in" = "query"), p_id = list(name = "p_id", description = "RCRA handler ID or FRS registry ID.", type = "string", "in" = "query")), .api_validation$body_value, c(output = "query", callback = "query", p_id = "query"))
  params <- base::list("output" = output, "callback" = callback, "p_id" = p_id)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  result <- pipeline_request(method = "GET", path = "/pipeline_rest_services.get_pipeline_rcra", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "p_id" = params[["p_id"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' RCRA inspections, violations and enforcement actions
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Pipeline endpoints
#' @export
# Generated with specmill; do not edit by hand.
pipeline_get_pipeline_rcra_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string"), p_id = list(description = "RCRA handler ID or FRS registry ID.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- pipeline_request(method = "POST", path = "/pipeline_rest_services.get_pipeline_rcra", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), p_id = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string"), p_id = list(description = "RCRA handler ID or FRS registry ID.", type = "string")), required = list("p_id")))
  result
}
