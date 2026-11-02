#' ACS 2023 demographics by facility ID
#' 
#' @noMd
#' @param output Output format. JSON (default), JSONP, or XML.
#' @param callback JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.
#' @param p_id FRS registry ID, e.g. 110000381989.
#' @return Decoded response returned by the client request helper.
#' @family DFR Demographics endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_demographics_get_acs2023x_demographics_by_id <- function(output = NULL, callback = NULL, p_id) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "p_id" = p_id), list(output = list(name = "output", description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML"), "in" = "query"), callback = list(name = "callback", description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string", "in" = "query"), p_id = list(name = "p_id", description = "FRS registry ID, e.g. 110000381989.", type = "string", "in" = "query")), .api_validation$body_value, c(output = "query", callback = "query", p_id = "query"))
  params <- base::list("output" = output, "callback" = callback, "p_id" = p_id)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  result <- dfr_demographics_request(method = "GET", path = "/dfr_rest_services.get_acs2023x_demographics_by_id", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "p_id" = params[["p_id"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ACS 2023 demographics by facility ID
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family DFR Demographics endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_demographics_get_acs2023x_demographics_by_id_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string"), p_id = list(description = "FRS registry ID, e.g. 110000381989.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- dfr_demographics_request(method = "POST", path = "/dfr_rest_services.get_acs2023x_demographics_by_id", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), p_id = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string"), p_id = list(description = "FRS registry ID, e.g. 110000381989.", type = "string")), required = list("p_id")))
  result
}

#' Demographics by facility ID (unversioned name)
#' 
#' @noMd
#' @param output Output format. JSON (default), JSONP, or XML.
#' @param callback JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.
#' @param p_id FRS registry ID.
#' @return Decoded response returned by the client request helper.
#' @family DFR Demographics endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_demographics_get_demographics_by_id <- function(output = NULL, callback = NULL, p_id) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "p_id" = p_id), list(output = list(name = "output", description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML"), "in" = "query"), callback = list(name = "callback", description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string", "in" = "query"), p_id = list(name = "p_id", description = "FRS registry ID.", type = "string", "in" = "query")), .api_validation$body_value, c(output = "query", callback = "query", p_id = "query"))
  params <- base::list("output" = output, "callback" = callback, "p_id" = p_id)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  result <- dfr_demographics_request(method = "GET", path = "/dfr_rest_services.get_demographics_by_id", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "p_id" = params[["p_id"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Demographics by facility ID (unversioned name)
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family DFR Demographics endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_demographics_get_demographics_by_id_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string"), p_id = list(description = "FRS registry ID.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- dfr_demographics_request(method = "POST", path = "/dfr_rest_services.get_demographics_by_id", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), p_id = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string"), p_id = list(description = "FRS registry ID.", type = "string")), required = list("p_id")))
  result
}
