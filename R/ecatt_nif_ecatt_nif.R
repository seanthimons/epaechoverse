#' ECATT NIF search
#' 
#' @noMd
#' @param output Output format. JSON (default), JSONP, or XML.
#' @param callback JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.
#' @return Decoded response returned by the client request helper.
#' @family ECATT NIF endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecatt_nif_get_facilities <- function(output = NULL, callback = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback), list(output = list(name = "output", description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML"), "in" = "query"), callback = list(name = "callback", description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string", "in" = "query")), .api_validation$body_value, c(output = "query", callback = "query"))
  params <- base::list("output" = output, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- ecatt_nif_request(method = "GET", path = "/ecatt_nif_rest_services.get_facilities", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECATT NIF search
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family ECATT NIF endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecatt_nif_get_facilities_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- ecatt_nif_request(method = "POST", path = "/ecatt_nif_rest_services.get_facilities", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string")), required = list()))
  result
}

#' ECATT NIF paginated results
#' 
#' @noMd
#' @param output Output format. JSON (default), JSONP, or XML.
#' @param callback JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.
#' @param qid Query ID returned by a previous search call (QueryID in its Results).
#' @param pageno Page number of results to return.
#' @return Decoded response returned by the client request helper.
#' @family ECATT NIF endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecatt_nif_get_qid <- function(output = NULL, callback = NULL, qid, pageno = 1) {
  if (base::is.null(qid)) base::stop("Required input: qid")
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "qid" = qid, "pageno" = pageno), list(output = list(name = "output", description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML"), "in" = "query"), callback = list(name = "callback", description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string", "in" = "query"), qid = list(name = "qid", description = "Query ID returned by a previous search call (QueryID in its Results).", type = "string", "in" = "query"), 
    pageno = list(name = "pageno", description = "Page number of results to return.", type = "number", default = 1L, "in" = "query")), .api_validation$body_value, c(output = "query", callback = "query", qid = "query", pageno = "query"))
  params <- base::list("output" = output, "callback" = callback, "qid" = qid, "pageno" = pageno)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["qid"]]) && base::any(!base::nzchar(params[["qid"]]))) base::stop("Empty query parameter: qid")
  if (base::is.character(params[["pageno"]]) && base::any(!base::nzchar(params[["pageno"]]))) base::stop("Empty query parameter: pageno")
  result <- ecatt_nif_request(method = "GET", path = "/ecatt_nif_rest_services.get_qid", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "qid" = params[["qid"]], "pageno" = params[["pageno"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECATT NIF paginated results
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family ECATT NIF endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecatt_nif_get_qid_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string"), qid = list(description = "Query ID returned by a previous search call (QueryID in its Results).", type = "string"), pageno = list(description = "Page number of results to return.", 
    type = "number", default = 1L)), required = list("qid")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- ecatt_nif_request(method = "POST", path = "/ecatt_nif_rest_services.get_qid", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), qid = list(), pageno = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string"), qid = list(description = "Query ID returned by a previous search call (QueryID in its Results).", type = "string"), pageno = list(description = "Page number of results to return.", 
    type = "number", default = 1L)), required = list("qid")))
  result
}
