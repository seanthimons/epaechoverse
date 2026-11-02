#' CAA Violation Tracker metadata
#' 
#' @noMd
#' @param output Output format. JSON (default), JSONP, or XML.
#' @param callback JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.
#' @return Decoded response returned by the client request helper.
#' @family Violation Tracker endpoints
#' @export
# Generated with specmill; do not edit by hand.
air_viotrack_metadata <- function(output = NULL, callback = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback), list(output = list(name = "output", description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML"), "in" = "query"), callback = list(name = "callback", description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string", "in" = "query")), .api_validation$body_value, c(output = "query", callback = "query"))
  params <- base::list("output" = output, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- air_viotrack_request(method = "GET", path = "/air_viotrack_services.metadata", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' CAA Violation Tracker metadata
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Violation Tracker endpoints
#' @export
# Generated with specmill; do not edit by hand.
air_viotrack_metadata_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- air_viotrack_request(method = "POST", path = "/air_viotrack_services.metadata", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string")), required = list()))
  result
}

#' CAA Violation Tracker search
#' 
#' @noMd
#' @param output Output format. JSON (default), JSONP, or XML.
#' @param callback JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.
#' @return Decoded response returned by the client request helper.
#' @family Violation Tracker endpoints
#' @export
# Generated with specmill; do not edit by hand.
air_viotrack_get_cases <- function(output = NULL, callback = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback), list(output = list(name = "output", description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML"), "in" = "query"), callback = list(name = "callback", description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string", "in" = "query")), .api_validation$body_value, c(output = "query", callback = "query"))
  params <- base::list("output" = output, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- air_viotrack_request(method = "GET", path = "/air_viotrack_services.get_cases", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' CAA Violation Tracker search
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Violation Tracker endpoints
#' @export
# Generated with specmill; do not edit by hand.
air_viotrack_get_cases_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- air_viotrack_request(method = "POST", path = "/air_viotrack_services.get_cases", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string")), required = list()))
  result
}

#' CAA Violation Tracker paginated results
#' 
#' @noMd
#' @param output Output format. JSON (default), JSONP, or XML.
#' @param callback JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.
#' @param qid Query ID returned by a previous search call (QueryID in its Results).
#' @param pageno Page number of results to return.
#' @param qcolumns Comma-separated column IDs to return; see the metadata route for the IDs.
#' @return Decoded response returned by the client request helper.
#' @family Violation Tracker endpoints
#' @export
# Generated with specmill; do not edit by hand.
air_viotrack_get_qid <- function(output = NULL, callback = NULL, qid, pageno = 1, qcolumns = NULL) {
  if (base::is.null(qid)) base::stop("Required input: qid")
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "qid" = qid, "pageno" = pageno, "qcolumns" = qcolumns), list(output = list(name = "output", description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML"), "in" = "query"), callback = list(name = "callback", description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string", "in" = "query"), qid = list(name = "qid", description = "Query ID returned by a previous search call (QueryID in its Results).", type = "string", "in" = "query"), 
    pageno = list(name = "pageno", description = "Page number of results to return.", type = "number", default = 1L, "in" = "query"), qcolumns = list(name = "qcolumns", description = "Comma-separated column IDs to return; see the metadata route for the IDs.", type = "string", "in" = "query")), .api_validation$body_value, c(output = "query", callback = "query", qid = "query", pageno = "query", qcolumns = "query"))
  params <- base::list("output" = output, "callback" = callback, "qid" = qid, "pageno" = pageno, "qcolumns" = qcolumns)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["qid"]]) && base::any(!base::nzchar(params[["qid"]]))) base::stop("Empty query parameter: qid")
  if (base::is.character(params[["pageno"]]) && base::any(!base::nzchar(params[["pageno"]]))) base::stop("Empty query parameter: pageno")
  if (base::is.character(params[["qcolumns"]]) && base::any(!base::nzchar(params[["qcolumns"]]))) base::stop("Empty query parameter: qcolumns")
  result <- air_viotrack_request(method = "GET", path = "/air_viotrack_services.get_qid", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "qid" = params[["qid"]], "pageno" = params[["pageno"]], "qcolumns" = params[["qcolumns"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' CAA Violation Tracker paginated results
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Violation Tracker endpoints
#' @export
# Generated with specmill; do not edit by hand.
air_viotrack_get_qid_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string"), qid = list(description = "Query ID returned by a previous search call (QueryID in its Results).", type = "string"), pageno = list(description = "Page number of results to return.", 
    type = "number", default = 1L), qcolumns = list(description = "Comma-separated column IDs to return; see the metadata route for the IDs.", type = "string")), required = list("qid")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- air_viotrack_request(method = "POST", path = "/air_viotrack_services.get_qid", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), qid = list(), pageno = list(), qcolumns = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string"), qid = list(description = "Query ID returned by a previous search call (QueryID in its Results).", type = "string"), pageno = list(description = "Page number of results to return.", 
    type = "number", default = 1L), qcolumns = list(description = "Comma-separated column IDs to return; see the metadata route for the IDs.", type = "string")), required = list("qid")))
  result
}

#' CAA Violation Tracker download
#' 
#' @noMd
#' @param qid Query ID returned by a previous search call (QueryID in its Results).
#' @param qcolumns Comma-separated column IDs to return; see the metadata route for the IDs.
#' @return Decoded response returned by the client request helper.
#' @family Violation Tracker endpoints
#' @export
# Generated with specmill; do not edit by hand.
air_viotrack_get_download <- function(qid, qcolumns = NULL) {
  if (base::is.null(qid)) base::stop("Required input: qid")
  .api_validation$parameter_values(base::list("qid" = qid, "qcolumns" = qcolumns), list(qid = list(name = "qid", description = "Query ID returned by a previous search call (QueryID in its Results).", type = "string", "in" = "query"), qcolumns = list(name = "qcolumns", description = "Comma-separated column IDs to return; see the metadata route for the IDs.", type = "string", "in" = "query")), .api_validation$body_value, c(qid = "query", qcolumns = "query"))
  params <- base::list("qid" = qid, "qcolumns" = qcolumns)
  if (base::is.character(params[["qid"]]) && base::any(!base::nzchar(params[["qid"]]))) base::stop("Empty query parameter: qid")
  if (base::is.character(params[["qcolumns"]]) && base::any(!base::nzchar(params[["qcolumns"]]))) base::stop("Empty query parameter: qcolumns")
  result <- air_viotrack_request(method = "GET", path = "/air_viotrack_services.get_download", path_params = base::list(), query = base::list("qid" = params[["qid"]], "qcolumns" = params[["qcolumns"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' CAA Violation Tracker download
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Violation Tracker endpoints
#' @export
# Generated with specmill; do not edit by hand.
air_viotrack_get_download_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(qid = list(description = "Query ID returned by a previous search call (QueryID in its Results).", type = "string"), qcolumns = list(description = "Comma-separated column IDs to return; see the metadata route for the IDs.", type = "string")), required = list("qid")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- air_viotrack_request(method = "POST", path = "/air_viotrack_services.get_download", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(qid = list(), qcolumns = list()), form_schema = list(type = "object", properties = list(qid = list(description = "Query ID returned by a previous search call (QueryID in its Results).", type = "string"), qcolumns = list(description = "Comma-separated column IDs to return; see the metadata route for the IDs.", type = "string")), required = list("qid")))
  result
}
