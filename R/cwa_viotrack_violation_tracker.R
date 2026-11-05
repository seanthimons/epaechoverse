#' CWA Violation Tracker metadata
#' 
#' @noMd
#' @param output Output format. JSON (default), JSONP, or XML.
#' @param callback JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.
#' @return Decoded response returned by the client request helper.
#' @family Violation Tracker endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_viotrack_metadata <- function(output = NULL, callback = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback), list(output = list(name = "output", description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML"), "in" = "query"), callback = list(name = "callback", description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string", "in" = "query")), .api_validation$body_value, c(output = "query", callback = "query"))
  params <- base::list("output" = output, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- cwa_viotrack_request(method = "GET", path = "/cwa_viotrack_services.metadata", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' CWA Violation Tracker metadata
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Violation Tracker endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_viotrack_metadata_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- cwa_viotrack_request(method = "POST", path = "/cwa_viotrack_services.metadata", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string")), required = list()))
  result
}

#' CWA Violation Tracker search
#' 
#' @noMd
#' @param output Output format. JSON (default), JSONP, or XML.
#' @param callback JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.
#' @param p_st Facility state or state-equivalent (USPS abbreviation, e.g. RI). Without a narrowing filter such as this, searches usually exceed the row limit.
#' @param p_ptype Permit type code, e.g. NPD (NPDES individual permit). Same codes as the CWA facility search.
#' @param p_maj Major designation. The service reports the allowed values as none, 'M', 'N'.
#' @param p_ico Indian Country flag. Y or N.
#' @param tidy Return a tibble (typed from ECHO metadata: numbers, dates and text; codes and IDs stay text). FALSE returns the decoded response. Non-JSON output formats and GeoJSON are always returned as sent.
#' @return A one-row tibble of the query summary (counters as numbers, QueryID as text; with tablelist = 'Y' the first page of rows is in attr(, 'facilities')), or the decoded response (tidy = FALSE).
#' @family Violation Tracker endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_viotrack_get_facilities <- function(output = NULL, callback = NULL, p_st = NULL, p_ptype = NULL, p_maj = NULL, p_ico = NULL, tidy = TRUE) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "p_st" = p_st, "p_ptype" = p_ptype, "p_maj" = p_maj, "p_ico" = p_ico), list(output = list(name = "output", description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML"), "in" = "query"), callback = list(name = "callback", description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string", "in" = "query"), p_st = list(name = "p_st", description = "Facility state or state-equivalent (USPS abbreviation, e.g. RI). Without a narrowing filter such as this, searches usually exceed the row limit.", 
    type = "string", "in" = "query"), p_ptype = list(name = "p_ptype", description = "Permit type code, e.g. NPD (NPDES individual permit). Same codes as the CWA facility search.", type = "string", "in" = "query"), p_maj = list(name = "p_maj", description = "Major designation. The service reports the allowed values as none, 'M', 'N'.", type = "string", "in" = "query"), p_ico = list(name = "p_ico", description = "Indian Country flag. Y or N.", type = "string", enum = list("Y", "N"), "in" = "query")), .api_validation$body_value, c(output = "query", callback = "query", p_st = "query", p_ptype = "query", p_maj = "query", p_ico = "query"))
  params <- base::list("output" = output, "callback" = callback, "p_st" = p_st, "p_ptype" = p_ptype, "p_maj" = p_maj, "p_ico" = p_ico, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["p_st"]]) && base::any(!base::nzchar(params[["p_st"]]))) base::stop("Empty query parameter: p_st")
  if (base::is.character(params[["p_ptype"]]) && base::any(!base::nzchar(params[["p_ptype"]]))) base::stop("Empty query parameter: p_ptype")
  if (base::is.character(params[["p_maj"]]) && base::any(!base::nzchar(params[["p_maj"]]))) base::stop("Empty query parameter: p_maj")
  if (base::is.character(params[["p_ico"]]) && base::any(!base::nzchar(params[["p_ico"]]))) base::stop("Empty query parameter: p_ico")
  result <- cwa_viotrack_request(method = "GET", path = "/cwa_viotrack_services.get_facilities", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "p_st" = params[["p_st"]], "p_ptype" = params[["p_ptype"]], "p_maj" = params[["p_maj"]], "p_ico" = params[["p_ico"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_summary_cwa_viotrack", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' CWA Violation Tracker search
#' 
#' @noMd
#' @param tidy Return a tibble (typed from ECHO metadata: numbers, dates and text; codes and IDs stay text). FALSE returns the decoded response. Non-JSON output formats and GeoJSON are always returned as sent.
#' @param body Request body.
#' @return A one-row tibble of the query summary (counters as numbers, QueryID as text; with tablelist = 'Y' the first page of rows is in attr(, 'facilities')), or the decoded response (tidy = FALSE).
#' @family Violation Tracker endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_viotrack_get_facilities_post <- function(body = NULL, tidy = TRUE) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string"), p_st = list(description = "Facility state or state-equivalent (USPS abbreviation, e.g. RI). Without a narrowing filter such as this, searches usually exceed the row limit.", type = "string"), 
    p_ptype = list(description = "Permit type code, e.g. NPD (NPDES individual permit). Same codes as the CWA facility search.", type = "string"), p_maj = list(description = "Major designation. The service reports the allowed values as none, 'M', 'N'.", type = "string"), p_ico = list(description = "Indian Country flag. Y or N.", type = "string", enum = list("Y", "N"))), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- cwa_viotrack_request(method = "POST", path = "/cwa_viotrack_services.get_facilities", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), p_st = list(), p_ptype = list(), p_maj = list(), p_ico = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string"), p_st = list(description = "Facility state or state-equivalent (USPS abbreviation, e.g. RI). Without a narrowing filter such as this, searches usually exceed the row limit.", type = "string"), 
    p_ptype = list(description = "Permit type code, e.g. NPD (NPDES individual permit). Same codes as the CWA facility search.", type = "string"), p_maj = list(description = "Major designation. The service reports the allowed values as none, 'M', 'N'.", type = "string"), p_ico = list(description = "Indian Country flag. Y or N.", type = "string", enum = list("Y", "N"))), required = list()))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_summary_cwa_viotrack", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' CWA Violation Tracker paginated results
#' 
#' @noMd
#' @param output Output format. JSON (default), JSONP, or XML.
#' @param callback JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.
#' @param qid Query ID returned by a previous search call (QueryID in its Results).
#' @param pageno Page number of results to return.
#' @param qcolumns Comma-separated column IDs to return; see the metadata route for the IDs.
#' @param tidy Return a tibble (typed from ECHO metadata: numbers, dates and text; codes and IDs stay text). FALSE returns the decoded response. Non-JSON output formats and GeoJSON are always returned as sent.
#' @return A tibble of one page of records, typed from ECHO metadata (tidy = TRUE, the default for JSON output) or the decoded response (tidy = FALSE). Use echo_qid_all() for every page.
#' @family Violation Tracker endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_viotrack_get_qid <- function(output = NULL, callback = NULL, qid, pageno = 1, qcolumns = NULL, tidy = TRUE) {
  if (base::is.null(qid)) base::stop("Required input: qid")
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback, "qid" = qid, "pageno" = pageno, "qcolumns" = qcolumns), list(output = list(name = "output", description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML"), "in" = "query"), callback = list(name = "callback", description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string", "in" = "query"), qid = list(name = "qid", description = "Query ID returned by a previous search call (QueryID in its Results).", type = "string", "in" = "query"), 
    pageno = list(name = "pageno", description = "Page number of results to return.", type = "number", default = 1L, "in" = "query"), qcolumns = list(name = "qcolumns", description = "Comma-separated column IDs to return; see the metadata route for the IDs.", type = "string", "in" = "query")), .api_validation$body_value, c(output = "query", callback = "query", qid = "query", pageno = "query", qcolumns = "query"))
  params <- base::list("output" = output, "callback" = callback, "qid" = qid, "pageno" = pageno, "qcolumns" = qcolumns, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["qid"]]) && base::any(!base::nzchar(params[["qid"]]))) base::stop("Empty query parameter: qid")
  if (base::is.character(params[["pageno"]]) && base::any(!base::nzchar(params[["pageno"]]))) base::stop("Empty query parameter: pageno")
  if (base::is.character(params[["qcolumns"]]) && base::any(!base::nzchar(params[["qcolumns"]]))) base::stop("Empty query parameter: qcolumns")
  result <- cwa_viotrack_request(method = "GET", path = "/cwa_viotrack_services.get_qid", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]], "qid" = params[["qid"]], "pageno" = params[["pageno"]], "qcolumns" = params[["qcolumns"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_qid_cwa_viotrack", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' CWA Violation Tracker paginated results
#' 
#' @noMd
#' @param tidy Return a tibble (typed from ECHO metadata: numbers, dates and text; codes and IDs stay text). FALSE returns the decoded response. Non-JSON output formats and GeoJSON are always returned as sent.
#' @param body Request body.
#' @return A tibble of one page of records, typed from ECHO metadata (tidy = TRUE, the default for JSON output) or the decoded response (tidy = FALSE). Use echo_qid_all() for every page.
#' @family Violation Tracker endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_viotrack_get_qid_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string"), qid = list(description = "Query ID returned by a previous search call (QueryID in its Results).", type = "string"), pageno = list(description = "Page number of results to return.", 
    type = "number", default = 1L), qcolumns = list(description = "Comma-separated column IDs to return; see the metadata route for the IDs.", type = "string")), required = list("qid")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- cwa_viotrack_request(method = "POST", path = "/cwa_viotrack_services.get_qid", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list(), qid = list(), pageno = list(), qcolumns = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output format. JSON (default), JSONP, or XML.", type = "string", enum = list("JSON", "JSONP", "XML")), callback = list(description = "JSONP callback. Name of the function in which to wrap the JSON response; used only with output=JSONP.", type = "string"), qid = list(description = "Query ID returned by a previous search call (QueryID in its Results).", type = "string"), pageno = list(description = "Page number of results to return.", 
    type = "number", default = 1L), qcolumns = list(description = "Comma-separated column IDs to return; see the metadata route for the IDs.", type = "string")), required = list("qid")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_qid_cwa_viotrack", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' CWA Violation Tracker download
#' 
#' @noMd
#' @param qid Query ID returned by a previous search call (QueryID in its Results).
#' @param qcolumns Comma-separated column IDs to return; see the metadata route for the IDs.
#' @param tidy Return a tibble (typed from ECHO metadata like get_qid: numbers, dates and text; codes and IDs stay text). FALSE returns the CSV text as sent.
#' @return A tibble of the query rows read from the CSV, typed like the get_qid pages (tidy = TRUE, the default for the CSV output) or the CSV text as sent (tidy = FALSE).
#' @family Violation Tracker endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_viotrack_get_download <- function(qid, qcolumns = NULL, tidy = TRUE) {
  if (base::is.null(qid)) base::stop("Required input: qid")
  .api_validation$parameter_values(base::list("qid" = qid, "qcolumns" = qcolumns), list(qid = list(name = "qid", description = "Query ID returned by a previous search call (QueryID in its Results).", type = "string", "in" = "query"), qcolumns = list(name = "qcolumns", description = "Comma-separated column IDs to return; see the metadata route for the IDs.", type = "string", "in" = "query")), .api_validation$body_value, c(qid = "query", qcolumns = "query"))
  params <- base::list("qid" = qid, "qcolumns" = qcolumns, "tidy" = tidy)
  if (base::is.character(params[["qid"]]) && base::any(!base::nzchar(params[["qid"]]))) base::stop("Empty query parameter: qid")
  if (base::is.character(params[["qcolumns"]]) && base::any(!base::nzchar(params[["qcolumns"]]))) base::stop("Empty query parameter: qcolumns")
  result <- cwa_viotrack_request(method = "GET", path = "/cwa_viotrack_services.get_download", path_params = base::list(), query = base::list("qid" = params[["qid"]], "qcolumns" = params[["qcolumns"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_download_cwa_viotrack", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' CWA Violation Tracker download
#' 
#' @noMd
#' @param tidy Return a tibble (typed from ECHO metadata like get_qid: numbers, dates and text; codes and IDs stay text). FALSE returns the CSV text as sent.
#' @param body Request body.
#' @return A tibble of the query rows read from the CSV, typed like the get_qid pages (tidy = TRUE, the default for the CSV output) or the CSV text as sent (tidy = FALSE).
#' @family Violation Tracker endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_viotrack_get_download_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(qid = list(description = "Query ID returned by a previous search call (QueryID in its Results).", type = "string"), qcolumns = list(description = "Comma-separated column IDs to return; see the metadata route for the IDs.", type = "string")), required = list("qid")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- cwa_viotrack_request(method = "POST", path = "/cwa_viotrack_services.get_download", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(qid = list(), qcolumns = list()), form_schema = list(type = "object", properties = list(qid = list(description = "Query ID returned by a previous search call (QueryID in its Results).", type = "string"), qcolumns = list(description = "Comma-separated column IDs to return; see the metadata route for the IDs.", type = "string")), required = list("qid")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_download_cwa_viotrack", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}
