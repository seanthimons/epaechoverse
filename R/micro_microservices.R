#' FRS registry ID lookup
#' 
#' @noMd
#' @param output Output format. JSON (default), JSONP, or XML.
#' @param callback JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.
#' @param p_id Program system ID, e.g. an ICIS-Air ID.
#' @return Decoded response returned by the client request helper.
#' @family Microservices endpoints
#' @export
# Generated with specmill; do not edit by hand.
micro_get_frs_id <- function(output = NULL, callback = NULL, p_id) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "p_id" = p_id), list(output = list(name = "output", description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML"), "in" = "query"), callback = list(name = "callback", description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string", "in" = "query"), p_id = list(name = "p_id", description = "Program system ID, e.g. an ICIS-Air ID.", type = "string", "in" = "query")), .api_validation$body_value, c(output = "query", callback = "query", p_id = "query"))
  params <- base::list("output" = output, "callback" = callback, "p_id" = p_id)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  result <- micro_request(method = "GET", path = "/micro_services.get_frs_id", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "p_id" = params[["p_id"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' FRS registry ID lookup
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Microservices endpoints
#' @export
# Generated with specmill; do not edit by hand.
micro_get_frs_id_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string"), p_id = list(description = "Program system ID, e.g. an ICIS-Air ID.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- micro_request(method = "POST", path = "/micro_services.get_frs_id", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), p_id = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string"), p_id = list(description = "Program system ID, e.g. an ICIS-Air ID.", type = "string")), required = list("p_id")))
  result
}

#' Air monitoring sites within 5 km (AMA sites)
#' 
#' @noMd
#' @param output Output format. JSON (default), JSONP, or XML.
#' @param callback JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.
#' @param p_id Facility identifier (FRS registry ID or program system ID).
#' @return Decoded response returned by the client request helper.
#' @family Microservices endpoints
#' @export
# Generated with specmill; do not edit by hand.
micro_get_ama_sites_5k <- function(output = NULL, callback = NULL, p_id) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "p_id" = p_id), list(output = list(name = "output", description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML"), "in" = "query"), callback = list(name = "callback", description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string", "in" = "query"), p_id = list(name = "p_id", description = "Facility identifier (FRS registry ID or program system ID).", type = "string", "in" = "query")), .api_validation$body_value, c(output = "query", callback = "query", p_id = "query"))
  params <- base::list("output" = output, "callback" = callback, "p_id" = p_id)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  result <- micro_request(method = "GET", path = "/micro_services.get_ama_sites_5k", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "p_id" = params[["p_id"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Air monitoring sites within 5 km (AMA sites)
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Microservices endpoints
#' @export
# Generated with specmill; do not edit by hand.
micro_get_ama_sites_5k_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string"), p_id = list(description = "Facility identifier (FRS registry ID or program system ID).", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- micro_request(method = "POST", path = "/micro_services.get_ama_sites_5k", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), p_id = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string"), p_id = list(description = "Facility identifier (FRS registry ID or program system ID).", type = "string")), required = list("p_id")))
  result
}
