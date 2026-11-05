#' Corporate Compliance Screener Search
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_fn Facility Name Filter. Enter one or more case-insensitive facility names to filter results.  Provide multiple values as a comma-delimited list.  See p_fntype for additional modifiers.
#' @param p_fn_excl Facility Name to Exclude Filter. Enter one or more case-insensitive facility names to exclude from results.  Provide multiple values as a comma-delimited list.  See p_fntype for additional modifiers.
#' @param p_fntype Controls type of text search performed on facility name with parameter p_fn.
#' - EXACT = Find facilities having the exact provided name(s).
#' - BEGINS = Find facilities with names starting with the provided term(s).
#' - ALL = Find facilities using Oracle text search terms.
#' - CONTAINS = 
#' @param p_pid Nine-digit permit IDs. May contain up to 2000 comma-separated values.
#' @param p_st Facility State and State-Equivalent Filter.  Provide one or more USPS postal abbreviations for states and state-equivalents to filter results.  Provide multiple values as a comma-delimited list.
#' @param p_frs Facility Registry Service ID Filter. Enter a single 12-digit FRS identifier to filter results.
#' @param p_reg EPA Region Filter. Provide a single value of 01 thru 10 to restrict results to a single EPA region.
#' @param p_active Active Facilities Flag.  Provide Y to filter results to facilities that are active.
#' @param p_yrs Provide the number of years to limits results by the settlement entered date.
#' @param p_caa p_caa
#' @param p_cwa p_cwa
#' @param p_rcra p_rcra
#' @param p_sdwa p_sdwa
#' @param p_tsca p_tsca
#' @param p_cercla p_cercla
#' @param queryset Query Limiter.  Enter a value to limit the number of records returned for each query. Value cannot exceed 70,000.
#' @param responseset Response Set Limiter. Enter a value to limit the number of records per page. Value cannot exceed 1,000.
#' @param tablelist Table List Flag. Enter a Y to display the first page of facility results.
#' @param summarylist Summary List Flag.  Enter a Y to return a list of summary statistics based on the parameters submitted to the query service.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param qcolumns Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.
#' @param tidy Return a tibble (typed from ECHO metadata: numbers, dates and text; codes and IDs stay text). FALSE returns the decoded response. Non-JSON output formats and GeoJSON are always returned as sent.
#' @return A one-row tibble of the query summary (counters as numbers, QueryID as text; with tablelist = 'Y' the first page of rows is in attr(, 'facilities')), or the decoded response (tidy = FALSE).
#' @family Corporate Compliance Screener endpoints
#' @export
# Generated with specmill; do not edit by hand.
compscreen_get_facilities <- function(output = NULL, p_fn = NULL, p_fn_excl = NULL, p_fntype = NULL, p_pid = NULL, p_st = NULL, p_frs = NULL, p_reg = NULL, p_active = NULL, p_yrs = NULL, p_caa = NULL, p_cwa = NULL, p_rcra = NULL, p_sdwa = NULL, p_tsca = NULL, p_cercla = NULL, queryset = NULL, responseset = NULL, tablelist = NULL, summarylist = NULL, callback = NULL, qcolumns = NULL, tidy = TRUE) {
  .api_validation$parameter_values(base::list("output" = output, "p_fn" = p_fn, "p_fn_excl" = p_fn_excl, "p_fntype" = p_fntype, "p_pid" = p_pid, "p_st" = p_st, "p_frs" = p_frs, "p_reg" = p_reg, "p_active" = p_active, "p_yrs" = p_yrs, "p_caa" = p_caa, "p_cwa" = p_cwa, "p_rcra" = p_rcra, "p_sdwa" = p_sdwa, "p_tsca" = p_tsca, "p_cercla" = p_cercla, "queryset" = queryset, "responseset" = responseset, "tablelist" = tablelist, "summarylist" = summarylist, "callback" = callback, "qcolumns" = qcolumns), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_fn = list(name = "p_fn", "in" = "query", description = "Facility Name Filter. Enter one or more case-insensitive facility names to filter results.  Provide multiple values as a comma-delimited list.  See p_fntype for additional modifiers.", 
    type = "string"), p_fn_excl = list(name = "p_fn_excl", "in" = "query", description = "Facility Name to Exclude Filter. Enter one or more case-insensitive facility names to exclude from results.  Provide multiple values as a comma-delimited list.  See p_fntype for additional modifiers.", type = "string"), p_fntype = list(name = "p_fntype", "in" = "query", description = "Controls type of text search performed on facility name with parameter p_fn.\n- EXACT = Find facilities having the exact provided name(s).\n- BEGINS = Find facilities with names starting with the provided term(s).\n- ALL = Find facilities using Oracle text search terms.\n- CONTAINS = ", 
    enum = list("ALL", "CONTAINS", "EXACT", "BEGINS"), type = "string"), p_pid = list(name = "p_pid", "in" = "query", description = "Nine-digit permit IDs. May contain up to 2000 comma-separated values.", type = "string"), p_st = list(name = "p_st", "in" = "query", description = "Facility State and State-Equivalent Filter.  Provide one or more USPS postal abbreviations for states and state-equivalents to filter results.  Provide multiple values as a comma-delimited list.", type = "string"), p_frs = list(
    name = "p_frs", "in" = "query", description = "Facility Registry Service ID Filter. Enter a single 12-digit FRS identifier to filter results.", type = "string"), p_reg = list(name = "p_reg", "in" = "query", description = "EPA Region Filter. Provide a single value of 01 thru 10 to restrict results to a single EPA region.", enum = list("01", "02", "03", "04", "05", "06", "07", "08", "09", "10"), type = "string"), p_active = list(name = "p_active", "in" = "query", description = "Active Facilities Flag.  Provide Y to filter results to facilities that are active.", 
    type = "string"), p_yrs = list(name = "p_yrs", "in" = "query", description = "Provide the number of years to limits results by the settlement entered date.", type = "number"), p_caa = list(name = "p_caa", "in" = "query", type = "string"), p_cwa = list(name = "p_cwa", "in" = "query", type = "string"), p_rcra = list(name = "p_rcra", "in" = "query", type = "string"), p_sdwa = list(name = "p_sdwa", "in" = "query", type = "string"), p_tsca = list(name = "p_tsca", "in" = "query", type = "string"), 
    p_cercla = list(name = "p_cercla", "in" = "query", type = "string"), queryset = list(name = "queryset", "in" = "query", description = "Query Limiter.  Enter a value to limit the number of records returned for each query. Value cannot exceed 70,000.", type = "number"), responseset = list(name = "responseset", "in" = "query", description = "Response Set Limiter. Enter a value to limit the number of records per page. Value cannot exceed 1,000.", type = "number"), tablelist = list(name = "tablelist", 
        "in" = "query", description = "Table List Flag. Enter a Y to display the first page of facility results.", enum = list("Y", "N"), type = "string"), summarylist = list(name = "summarylist", "in" = "query", description = "Summary List Flag.  Enter a Y to return a list of summary statistics based on the parameters submitted to the query service.", enum = list("Y", "N"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
        type = "string"), qcolumns = list(name = "qcolumns", "in" = "query", description = "Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.", type = "string")), .api_validation$body_value, c(output = "query", p_fn = "query", p_fn_excl = "query", p_fntype = "query", p_pid = "query", p_st = "query", p_frs = "query", p_reg = "query", p_active = "query", p_yrs = "query", p_caa = "query", p_cwa = "query", p_rcra = "query", p_sdwa = "query", p_tsca = "query", p_cercla = "query", queryset = "query", responseset = "query", tablelist = "query", summarylist = "query", callback = "query", qcolumns = "query"))
  params <- base::list("output" = output, "p_fn" = p_fn, "p_fn_excl" = p_fn_excl, "p_fntype" = p_fntype, "p_pid" = p_pid, "p_st" = p_st, "p_frs" = p_frs, "p_reg" = p_reg, "p_active" = p_active, "p_yrs" = p_yrs, "p_caa" = p_caa, "p_cwa" = p_cwa, "p_rcra" = p_rcra, "p_sdwa" = p_sdwa, "p_tsca" = p_tsca, "p_cercla" = p_cercla, "queryset" = queryset, "responseset" = responseset, "tablelist" = tablelist, "summarylist" = summarylist, "callback" = callback, "qcolumns" = qcolumns, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_fn"]]) && base::any(!base::nzchar(params[["p_fn"]]))) base::stop("Empty query parameter: p_fn")
  if (base::is.character(params[["p_fn_excl"]]) && base::any(!base::nzchar(params[["p_fn_excl"]]))) base::stop("Empty query parameter: p_fn_excl")
  if (base::is.character(params[["p_fntype"]]) && base::any(!base::nzchar(params[["p_fntype"]]))) base::stop("Empty query parameter: p_fntype")
  if (base::is.character(params[["p_pid"]]) && base::any(!base::nzchar(params[["p_pid"]]))) base::stop("Empty query parameter: p_pid")
  if (base::is.character(params[["p_st"]]) && base::any(!base::nzchar(params[["p_st"]]))) base::stop("Empty query parameter: p_st")
  if (base::is.character(params[["p_frs"]]) && base::any(!base::nzchar(params[["p_frs"]]))) base::stop("Empty query parameter: p_frs")
  if (base::is.character(params[["p_reg"]]) && base::any(!base::nzchar(params[["p_reg"]]))) base::stop("Empty query parameter: p_reg")
  if (base::is.character(params[["p_active"]]) && base::any(!base::nzchar(params[["p_active"]]))) base::stop("Empty query parameter: p_active")
  if (base::is.character(params[["p_yrs"]]) && base::any(!base::nzchar(params[["p_yrs"]]))) base::stop("Empty query parameter: p_yrs")
  if (base::is.character(params[["p_caa"]]) && base::any(!base::nzchar(params[["p_caa"]]))) base::stop("Empty query parameter: p_caa")
  if (base::is.character(params[["p_cwa"]]) && base::any(!base::nzchar(params[["p_cwa"]]))) base::stop("Empty query parameter: p_cwa")
  if (base::is.character(params[["p_rcra"]]) && base::any(!base::nzchar(params[["p_rcra"]]))) base::stop("Empty query parameter: p_rcra")
  if (base::is.character(params[["p_sdwa"]]) && base::any(!base::nzchar(params[["p_sdwa"]]))) base::stop("Empty query parameter: p_sdwa")
  if (base::is.character(params[["p_tsca"]]) && base::any(!base::nzchar(params[["p_tsca"]]))) base::stop("Empty query parameter: p_tsca")
  if (base::is.character(params[["p_cercla"]]) && base::any(!base::nzchar(params[["p_cercla"]]))) base::stop("Empty query parameter: p_cercla")
  if (base::is.character(params[["queryset"]]) && base::any(!base::nzchar(params[["queryset"]]))) base::stop("Empty query parameter: queryset")
  if (base::is.character(params[["responseset"]]) && base::any(!base::nzchar(params[["responseset"]]))) base::stop("Empty query parameter: responseset")
  if (base::is.character(params[["tablelist"]]) && base::any(!base::nzchar(params[["tablelist"]]))) base::stop("Empty query parameter: tablelist")
  if (base::is.character(params[["summarylist"]]) && base::any(!base::nzchar(params[["summarylist"]]))) base::stop("Empty query parameter: summarylist")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["qcolumns"]]) && base::any(!base::nzchar(params[["qcolumns"]]))) base::stop("Empty query parameter: qcolumns")
  result <- compscreen_request(method = "GET", path = "/comp_screen_services.get_facilities", path_params = base::list(), query = base::list("output" = params[["output"]], "p_fn" = params[["p_fn"]], "p_fn_excl" = params[["p_fn_excl"]], "p_fntype" = params[["p_fntype"]], "p_pid" = params[["p_pid"]], "p_st" = params[["p_st"]], "p_frs" = params[["p_frs"]], "p_reg" = params[["p_reg"]], "p_active" = params[["p_active"]], "p_yrs" = params[["p_yrs"]], "p_caa" = params[["p_caa"]], "p_cwa" = params[["p_cwa"]], "p_rcra" = params[["p_rcra"]], "p_sdwa" = params[["p_sdwa"]], "p_tsca" = params[["p_tsca"]], "p_cercla" = params[["p_cercla"]], "queryset" = params[["queryset"]], "responseset" = params[["responseset"]], "tablelist" = params[["tablelist"]], "summarylist" = params[["summarylist"]], "callback" = params[["callback"]], "qcolumns" = params[["qcolumns"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_summary_compscreen", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Corporate Compliance Screener Search
#' 
#' @noMd
#' @param tidy Return a tibble (typed from ECHO metadata: numbers, dates and text; codes and IDs stay text). FALSE returns the decoded response. Non-JSON output formats and GeoJSON are always returned as sent.
#' @param body Request body.
#' @return A one-row tibble of the query summary (counters as numbers, QueryID as text; with tablelist = 'Y' the first page of rows is in attr(, 'facilities')), or the decoded response (tidy = FALSE).
#' @family Corporate Compliance Screener endpoints
#' @export
# Generated with specmill; do not edit by hand.
compscreen_get_facilities_post <- function(body = NULL, tidy = TRUE) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_fn = list(description = "Facility Name Filter. Enter one or more case-insensitive facility names to filter results.  Provide multiple values as a comma-delimited list.  See p_fntype for additional modifiers.", 
    type = "string"), p_fn_excl = list(description = "Facility Name to Exclude Filter. Enter one or more case-insensitive facility names to exclude from results.  Provide multiple values as a comma-delimited list.  See p_fntype for additional modifiers.", type = "string"), p_fntype = list(description = "Controls type of text search performed on facility name with parameter p_fn.\n- EXACT = Find facilities having the exact provided name(s).\n- BEGINS = Find facilities with names starting with the provided term(s).\n- ALL = Find facilities using Oracle text search terms.\n- CONTAINS = ", 
    enum = list("ALL", "CONTAINS", "EXACT", "BEGINS"), type = "string"), p_pid = list(description = "Nine-digit permit IDs. May contain up to 2000 comma-separated values.", type = "string"), p_st = list(description = "Facility State and State-Equivalent Filter.  Provide one or more USPS postal abbreviations for states and state-equivalents to filter results.  Provide multiple values as a comma-delimited list.", type = "string"), p_frs = list(description = "Facility Registry Service ID Filter. Enter a single 12-digit FRS identifier to filter results.", 
    type = "string"), p_reg = list(description = "EPA Region Filter. Provide a single value of 01 thru 10 to restrict results to a single EPA region.", enum = list("01", "02", "03", "04", "05", "06", "07", "08", "09", "10"), type = "string"), p_active = list(description = "Active Facilities Flag.  Provide Y to filter results to facilities that are active.", type = "string"), p_yrs = list(description = "Provide the number of years to limits results by the settlement entered date.", type = "number"), 
    p_caa = list(type = "string"), p_cwa = list(type = "string"), p_rcra = list(type = "string"), p_sdwa = list(type = "string"), p_tsca = list(type = "string"), p_cercla = list(type = "string"), queryset = list(description = "Query Limiter.  Enter a value to limit the number of records returned for each query. Value cannot exceed 70,000.", type = "number"), responseset = list(description = "Response Set Limiter. Enter a value to limit the number of records per page. Value cannot exceed 1,000.", 
        type = "number"), tablelist = list(description = "Table List Flag. Enter a Y to display the first page of facility results.", enum = list("Y", "N"), type = "string"), summarylist = list(description = "Summary List Flag.  Enter a Y to return a list of summary statistics based on the parameters submitted to the query service.", enum = list("Y", "N"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
        type = "string"), qcolumns = list(description = "Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.", type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- compscreen_request(method = "POST", path = "/comp_screen_services.get_facilities", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_fn = list(), p_fn_excl = list(), p_fntype = list(), p_pid = list(), p_st = list(), p_frs = list(), p_reg = list(), p_active = list(), p_yrs = list(), p_caa = list(), p_cwa = list(), p_rcra = list(), p_sdwa = list(), p_tsca = list(), p_cercla = list(), queryset = list(), responseset = list(), tablelist = list(), summarylist = list(), callback = list(), qcolumns = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_fn = list(description = "Facility Name Filter. Enter one or more case-insensitive facility names to filter results.  Provide multiple values as a comma-delimited list.  See p_fntype for additional modifiers.", 
    type = "string"), p_fn_excl = list(description = "Facility Name to Exclude Filter. Enter one or more case-insensitive facility names to exclude from results.  Provide multiple values as a comma-delimited list.  See p_fntype for additional modifiers.", type = "string"), p_fntype = list(description = "Controls type of text search performed on facility name with parameter p_fn.\n- EXACT = Find facilities having the exact provided name(s).\n- BEGINS = Find facilities with names starting with the provided term(s).\n- ALL = Find facilities using Oracle text search terms.\n- CONTAINS = ", 
    enum = list("ALL", "CONTAINS", "EXACT", "BEGINS"), type = "string"), p_pid = list(description = "Nine-digit permit IDs. May contain up to 2000 comma-separated values.", type = "string"), p_st = list(description = "Facility State and State-Equivalent Filter.  Provide one or more USPS postal abbreviations for states and state-equivalents to filter results.  Provide multiple values as a comma-delimited list.", type = "string"), p_frs = list(description = "Facility Registry Service ID Filter. Enter a single 12-digit FRS identifier to filter results.", 
    type = "string"), p_reg = list(description = "EPA Region Filter. Provide a single value of 01 thru 10 to restrict results to a single EPA region.", enum = list("01", "02", "03", "04", "05", "06", "07", "08", "09", "10"), type = "string"), p_active = list(description = "Active Facilities Flag.  Provide Y to filter results to facilities that are active.", type = "string"), p_yrs = list(description = "Provide the number of years to limits results by the settlement entered date.", type = "number"), 
    p_caa = list(type = "string"), p_cwa = list(type = "string"), p_rcra = list(type = "string"), p_sdwa = list(type = "string"), p_tsca = list(type = "string"), p_cercla = list(type = "string"), queryset = list(description = "Query Limiter.  Enter a value to limit the number of records returned for each query. Value cannot exceed 70,000.", type = "number"), responseset = list(description = "Response Set Limiter. Enter a value to limit the number of records per page. Value cannot exceed 1,000.", 
        type = "number"), tablelist = list(description = "Table List Flag. Enter a Y to display the first page of facility results.", enum = list("Y", "N"), type = "string"), summarylist = list(description = "Summary List Flag.  Enter a Y to return a list of summary statistics based on the parameters submitted to the query service.", enum = list("Y", "N"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
        type = "string"), qcolumns = list(description = "Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.", type = "string")), required = list()))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_summary_compscreen", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Corporate Compliance Screener Search by Query ID
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param qid Query ID Selector.  Enter the QueryID number from a previously run query.
#' @param pageno Indicates the number of the page to display. It is used only when the results are paginated.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param newsort Output Sort Column.  Enter the number of the column on which the data will be sorted. If unpopulated results will sort on the first column.
#' @param descending Output Sort Column Descending Flag.  Enter Y to column identified in the newsort parameter descending.  Enter N to use ascending sort order. Used only when newsort parameter is populated.
#' @param qcolumns Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.
#' @param tidy Return a tibble (typed from ECHO metadata: numbers, dates and text; codes and IDs stay text). FALSE returns the decoded response. Non-JSON output formats and GeoJSON are always returned as sent.
#' @return A tibble of one page of records, typed from ECHO metadata (tidy = TRUE, the default for JSON output) or the decoded response (tidy = FALSE). Use echo_qid_all() for every page.
#' @family Corporate Compliance Screener endpoints
#' @export
# Generated with specmill; do not edit by hand.
compscreen_get_qid <- function(output = NULL, qid, pageno = 1, callback = NULL, newsort = NULL, descending = NULL, qcolumns = NULL, tidy = TRUE) {
  if (base::is.null(qid)) base::stop("Required input: qid")
  .api_validation$parameter_values(base::list("output" = output, "qid" = qid, "pageno" = pageno, "callback" = callback, "newsort" = newsort, "descending" = descending, "qcolumns" = qcolumns), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), qid = list(name = "qid", "in" = "query", description = "Query ID Selector.  Enter the QueryID number from a previously run query.", 
    type = "string"), pageno = list(name = "pageno", "in" = "query", description = "Indicates the number of the page to display. It is used only when the results are paginated.", default = 1L, type = "number"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string"), newsort = list(name = "newsort", "in" = "query", description = "Output Sort Column.  Enter the number of the column on which the data will be sorted. If unpopulated results will sort on the first column.", 
    type = "number"), descending = list(name = "descending", "in" = "query", description = "Output Sort Column Descending Flag.  Enter Y to column identified in the newsort parameter descending.  Enter N to use ascending sort order. Used only when newsort parameter is populated.", enum = list("Y", "N"), type = "string"), qcolumns = list(name = "qcolumns", "in" = "query", description = "Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.", 
    type = "string")), .api_validation$body_value, c(output = "query", qid = "query", pageno = "query", callback = "query", newsort = "query", descending = "query", qcolumns = "query"))
  params <- base::list("output" = output, "qid" = qid, "pageno" = pageno, "callback" = callback, "newsort" = newsort, "descending" = descending, "qcolumns" = qcolumns, "tidy" = tidy)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["qid"]]) && base::any(!base::nzchar(params[["qid"]]))) base::stop("Empty query parameter: qid")
  if (base::is.character(params[["pageno"]]) && base::any(!base::nzchar(params[["pageno"]]))) base::stop("Empty query parameter: pageno")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["newsort"]]) && base::any(!base::nzchar(params[["newsort"]]))) base::stop("Empty query parameter: newsort")
  if (base::is.character(params[["descending"]]) && base::any(!base::nzchar(params[["descending"]]))) base::stop("Empty query parameter: descending")
  if (base::is.character(params[["qcolumns"]]) && base::any(!base::nzchar(params[["qcolumns"]]))) base::stop("Empty query parameter: qcolumns")
  result <- compscreen_request(method = "GET", path = "/comp_screen_services.get_qid", path_params = base::list(), query = base::list("output" = params[["output"]], "qid" = params[["qid"]], "pageno" = params[["pageno"]], "callback" = params[["callback"]], "newsort" = params[["newsort"]], "descending" = params[["descending"]], "qcolumns" = params[["qcolumns"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_qid_compscreen", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Corporate Compliance Screener Search by Query ID
#' 
#' @noMd
#' @param tidy Return a tibble (typed from ECHO metadata: numbers, dates and text; codes and IDs stay text). FALSE returns the decoded response. Non-JSON output formats and GeoJSON are always returned as sent.
#' @param body Request body.
#' @return A tibble of one page of records, typed from ECHO metadata (tidy = TRUE, the default for JSON output) or the decoded response (tidy = FALSE). Use echo_qid_all() for every page.
#' @family Corporate Compliance Screener endpoints
#' @export
# Generated with specmill; do not edit by hand.
compscreen_get_qid_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), qid = list(description = "Query ID Selector.  Enter the QueryID number from a previously run query.", type = "string"), 
    pageno = list(description = "Indicates the number of the page to display. It is used only when the results are paginated.", default = 1L, type = "number"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string"), newsort = list(description = "Output Sort Column.  Enter the number of the column on which the data will be sorted. If unpopulated results will sort on the first column.", 
        type = "number"), descending = list(description = "Output Sort Column Descending Flag.  Enter Y to column identified in the newsort parameter descending.  Enter N to use ascending sort order. Used only when newsort parameter is populated.", enum = list("Y", "N"), type = "string"), qcolumns = list(description = "Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.", 
        type = "string")), required = list("qid")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- compscreen_request(method = "POST", path = "/comp_screen_services.get_qid", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), qid = list(), pageno = list(), callback = list(), newsort = list(), descending = list(), qcolumns = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), qid = list(description = "Query ID Selector.  Enter the QueryID number from a previously run query.", type = "string"), 
    pageno = list(description = "Indicates the number of the page to display. It is used only when the results are paginated.", default = 1L, type = "number"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string"), newsort = list(description = "Output Sort Column.  Enter the number of the column on which the data will be sorted. If unpopulated results will sort on the first column.", 
        type = "number"), descending = list(description = "Output Sort Column Descending Flag.  Enter Y to column identified in the newsort parameter descending.  Enter N to use ascending sort order. Used only when newsort parameter is populated.", enum = list("Y", "N"), type = "string"), qcolumns = list(description = "Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.", 
        type = "string")), required = list("qid")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_qid_compscreen", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Corporate Compliance Screener Report Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param qid Query ID Selector.  Enter the QueryID number from a previously run query.
#' @param p_id Identifier for the service.
#' @param p_yrs Provide the number of years to limits results by the settlement entered date.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Corporate Compliance Screener endpoints
#' @export
# Generated with specmill; do not edit by hand.
compscreen_get_report <- function(output = NULL, qid, p_id, p_yrs = NULL, callback = NULL) {
  if (base::is.null(qid)) base::stop("Required input: qid")
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "qid" = qid, "p_id" = p_id, "p_yrs" = p_yrs, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), qid = list(name = "qid", "in" = "query", description = "Query ID Selector.  Enter the QueryID number from a previously run query.", 
    type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Identifier for the service.", type = "string"), p_yrs = list(name = "p_yrs", "in" = "query", description = "Provide the number of years to limits results by the settlement entered date.", type = "number"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", qid = "query", p_id = "query", p_yrs = "query", callback = "query"))
  params <- base::list("output" = output, "qid" = qid, "p_id" = p_id, "p_yrs" = p_yrs, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["qid"]]) && base::any(!base::nzchar(params[["qid"]]))) base::stop("Empty query parameter: qid")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["p_yrs"]]) && base::any(!base::nzchar(params[["p_yrs"]]))) base::stop("Empty query parameter: p_yrs")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- compscreen_request(method = "GET", path = "/comp_screen_services.get_report", path_params = base::list(), query = base::list("output" = params[["output"]], "qid" = params[["qid"]], "p_id" = params[["p_id"]], "p_yrs" = params[["p_yrs"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Corporate Compliance Screener Report Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Corporate Compliance Screener endpoints
#' @export
# Generated with specmill; do not edit by hand.
compscreen_get_report_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), qid = list(description = "Query ID Selector.  Enter the QueryID number from a previously run query.", type = "string"), 
    p_id = list(description = "Identifier for the service.", type = "string"), p_yrs = list(description = "Provide the number of years to limits results by the settlement entered date.", type = "number"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("qid", "p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- compscreen_request(method = "POST", path = "/comp_screen_services.get_report", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), qid = list(), p_id = list(), p_yrs = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), qid = list(description = "Query ID Selector.  Enter the QueryID number from a previously run query.", type = "string"), 
    p_id = list(description = "Identifier for the service.", type = "string"), p_yrs = list(description = "Provide the number of years to limits results by the settlement entered date.", type = "number"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("qid", "p_id")))
  result
}

#' Corporate Compliance Screener Current Facility Violation Information Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param queryid Query ID Selector.  Enter the QueryID number from a previously run query.
#' @param p_id Identifier for the service.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Corporate Compliance Screener endpoints
#' @export
# Generated with specmill; do not edit by hand.
compscreen_get_curr_fac_info <- function(output = NULL, queryid, p_id, callback = NULL) {
  if (base::is.null(queryid)) base::stop("Required input: queryid")
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "queryid" = queryid, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), queryid = list(name = "queryid", "in" = "query", description = "Query ID Selector.  Enter the QueryID number from a previously run query.", 
    type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Identifier for the service.", type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", queryid = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "queryid" = queryid, "p_id" = p_id, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["queryid"]]) && base::any(!base::nzchar(params[["queryid"]]))) base::stop("Empty query parameter: queryid")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- compscreen_request(method = "GET", path = "/comp_screen_services.get_curr_fac_info", path_params = base::list(), query = base::list("output" = params[["output"]], "queryid" = params[["queryid"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Corporate Compliance Screener Current Facility Violation Information Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Corporate Compliance Screener endpoints
#' @export
# Generated with specmill; do not edit by hand.
compscreen_get_curr_fac_info_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), queryid = list(description = "Query ID Selector.  Enter the QueryID number from a previously run query.", 
    type = "string"), p_id = list(description = "Identifier for the service.", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("queryid", "p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- compscreen_request(method = "POST", path = "/comp_screen_services.get_curr_fac_info", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), queryid = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), queryid = list(description = "Query ID Selector.  Enter the QueryID number from a previously run query.", 
    type = "string"), p_id = list(description = "Identifier for the service.", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("queryid", "p_id")))
  result
}

#' Corporate Compliance Screener EPA and State Formal Enforcement Settlements Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param queryid Query ID Selector.  Enter the QueryID number from a previously run query.
#' @param p_id Identifier for the service.
#' @param p_yrs Provide the number of years to limits results by the settlement entered date.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Corporate Compliance Screener endpoints
#' @export
# Generated with specmill; do not edit by hand.
compscreen_get_settlements <- function(output = NULL, queryid, p_id, p_yrs = NULL, callback = NULL) {
  if (base::is.null(queryid)) base::stop("Required input: queryid")
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "queryid" = queryid, "p_id" = p_id, "p_yrs" = p_yrs, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), queryid = list(name = "queryid", "in" = "query", description = "Query ID Selector.  Enter the QueryID number from a previously run query.", 
    type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Identifier for the service.", type = "string"), p_yrs = list(name = "p_yrs", "in" = "query", description = "Provide the number of years to limits results by the settlement entered date.", type = "number"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", queryid = "query", p_id = "query", p_yrs = "query", callback = "query"))
  params <- base::list("output" = output, "queryid" = queryid, "p_id" = p_id, "p_yrs" = p_yrs, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["queryid"]]) && base::any(!base::nzchar(params[["queryid"]]))) base::stop("Empty query parameter: queryid")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["p_yrs"]]) && base::any(!base::nzchar(params[["p_yrs"]]))) base::stop("Empty query parameter: p_yrs")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- compscreen_request(method = "GET", path = "/comp_screen_services.get_settlements", path_params = base::list(), query = base::list("output" = params[["output"]], "queryid" = params[["queryid"]], "p_id" = params[["p_id"]], "p_yrs" = params[["p_yrs"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Corporate Compliance Screener EPA and State Formal Enforcement Settlements Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Corporate Compliance Screener endpoints
#' @export
# Generated with specmill; do not edit by hand.
compscreen_get_settlements_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), queryid = list(description = "Query ID Selector.  Enter the QueryID number from a previously run query.", 
    type = "string"), p_id = list(description = "Identifier for the service.", type = "string"), p_yrs = list(description = "Provide the number of years to limits results by the settlement entered date.", type = "number"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("queryid", "p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- compscreen_request(method = "POST", path = "/comp_screen_services.get_settlements", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), queryid = list(), p_id = list(), p_yrs = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), queryid = list(description = "Query ID Selector.  Enter the QueryID number from a previously run query.", 
    type = "string"), p_id = list(description = "Identifier for the service.", type = "string"), p_yrs = list(description = "Provide the number of years to limits results by the settlement entered date.", type = "number"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("queryid", "p_id")))
  result
}

#' Corporate Compliance Screener EPA "Open" Civil Enforcement Cases Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param queryid Query ID Selector.  Enter the QueryID number from a previously run query.
#' @param p_id Identifier for the service.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Corporate Compliance Screener endpoints
#' @export
# Generated with specmill; do not edit by hand.
compscreen_get_open_cases <- function(output = NULL, queryid, p_id, callback = NULL) {
  if (base::is.null(queryid)) base::stop("Required input: queryid")
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "queryid" = queryid, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), queryid = list(name = "queryid", "in" = "query", description = "Query ID Selector.  Enter the QueryID number from a previously run query.", 
    type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Identifier for the service.", type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", queryid = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "queryid" = queryid, "p_id" = p_id, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["queryid"]]) && base::any(!base::nzchar(params[["queryid"]]))) base::stop("Empty query parameter: queryid")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- compscreen_request(method = "GET", path = "/comp_screen_services.get_open_cases", path_params = base::list(), query = base::list("output" = params[["output"]], "queryid" = params[["queryid"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Corporate Compliance Screener EPA "Open" Civil Enforcement Cases Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Corporate Compliance Screener endpoints
#' @export
# Generated with specmill; do not edit by hand.
compscreen_get_open_cases_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), queryid = list(description = "Query ID Selector.  Enter the QueryID number from a previously run query.", 
    type = "string"), p_id = list(description = "Identifier for the service.", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("queryid", "p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- compscreen_request(method = "POST", path = "/comp_screen_services.get_open_cases", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), queryid = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), queryid = list(description = "Query ID Selector.  Enter the QueryID number from a previously run query.", 
    type = "string"), p_id = list(description = "Identifier for the service.", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("queryid", "p_id")))
  result
}

#' Placeholder
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param queryid Query ID Selector.  Enter the QueryID number from a previously run query.
#' @param p_id Identifier for the service.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Corporate Compliance Screener endpoints
#' @export
# Generated with specmill; do not edit by hand.
compscreen_get_curr_fac_info_b <- function(output = NULL, queryid, p_id, callback = NULL) {
  if (base::is.null(queryid)) base::stop("Required input: queryid")
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "queryid" = queryid, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), queryid = list(name = "queryid", "in" = "query", description = "Query ID Selector.  Enter the QueryID number from a previously run query.", 
    type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Identifier for the service.", type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", queryid = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "queryid" = queryid, "p_id" = p_id, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["queryid"]]) && base::any(!base::nzchar(params[["queryid"]]))) base::stop("Empty query parameter: queryid")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- compscreen_request(method = "GET", path = "/comp_screen_services.get_curr_fac_info_b", path_params = base::list(), query = base::list("output" = params[["output"]], "queryid" = params[["queryid"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Corporate Compliance Screener endpoints
#' @export
# Generated with specmill; do not edit by hand.
compscreen_get_curr_fac_info_b_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), queryid = list(description = "Query ID Selector.  Enter the QueryID number from a previously run query.", 
    type = "string"), p_id = list(description = "Identifier for the service.", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("queryid", "p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- compscreen_request(method = "POST", path = "/comp_screen_services.get_curr_fac_info_b", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), queryid = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), queryid = list(description = "Query ID Selector.  Enter the QueryID number from a previously run query.", 
    type = "string"), p_id = list(description = "Identifier for the service.", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("queryid", "p_id")))
  result
}

#' Placeholder
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param queryid Query ID Selector.  Enter the QueryID number from a previously run query.
#' @param p_id Identifier for the service.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Corporate Compliance Screener endpoints
#' @export
# Generated with specmill; do not edit by hand.
compscreen_get_majors <- function(output = NULL, queryid, p_id, callback = NULL) {
  if (base::is.null(queryid)) base::stop("Required input: queryid")
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "queryid" = queryid, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), queryid = list(name = "queryid", "in" = "query", description = "Query ID Selector.  Enter the QueryID number from a previously run query.", 
    type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Identifier for the service.", type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", queryid = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "queryid" = queryid, "p_id" = p_id, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["queryid"]]) && base::any(!base::nzchar(params[["queryid"]]))) base::stop("Empty query parameter: queryid")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- compscreen_request(method = "GET", path = "/comp_screen_services.get_majors", path_params = base::list(), query = base::list("output" = params[["output"]], "queryid" = params[["queryid"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Corporate Compliance Screener endpoints
#' @export
# Generated with specmill; do not edit by hand.
compscreen_get_majors_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), queryid = list(description = "Query ID Selector.  Enter the QueryID number from a previously run query.", 
    type = "string"), p_id = list(description = "Identifier for the service.", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("queryid", "p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- compscreen_request(method = "POST", path = "/comp_screen_services.get_majors", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), queryid = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), queryid = list(description = "Query ID Selector.  Enter the QueryID number from a previously run query.", 
    type = "string"), p_id = list(description = "Identifier for the service.", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("queryid", "p_id")))
  result
}

#' Placeholder
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param queryid Query ID Selector.  Enter the QueryID number from a previously run query.
#' @param p_id Identifier for the service.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Corporate Compliance Screener endpoints
#' @export
# Generated with specmill; do not edit by hand.
compscreen_get_superfund <- function(output = NULL, queryid, p_id, callback = NULL) {
  if (base::is.null(queryid)) base::stop("Required input: queryid")
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("output" = output, "queryid" = queryid, "p_id" = p_id, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), queryid = list(name = "queryid", "in" = "query", description = "Query ID Selector.  Enter the QueryID number from a previously run query.", 
    type = "string"), p_id = list(name = "p_id", "in" = "query", description = "Identifier for the service.", type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", queryid = "query", p_id = "query", callback = "query"))
  params <- base::list("output" = output, "queryid" = queryid, "p_id" = p_id, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["queryid"]]) && base::any(!base::nzchar(params[["queryid"]]))) base::stop("Empty query parameter: queryid")
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- compscreen_request(method = "GET", path = "/comp_screen_services.get_superfund", path_params = base::list(), query = base::list("output" = params[["output"]], "queryid" = params[["queryid"]], "p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Placeholder
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Corporate Compliance Screener endpoints
#' @export
# Generated with specmill; do not edit by hand.
compscreen_get_superfund_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), queryid = list(description = "Query ID Selector.  Enter the QueryID number from a previously run query.", 
    type = "string"), p_id = list(description = "Identifier for the service.", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("queryid", "p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- compscreen_request(method = "POST", path = "/comp_screen_services.get_superfund", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), queryid = list(), p_id = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), queryid = list(description = "Query ID Selector.  Enter the QueryID number from a previously run query.", 
    type = "string"), p_id = list(description = "Identifier for the service.", type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), required = list("queryid", "p_id")))
  result
}

#' Corporate Compliance Screener Download Data Service
#' 
#' @noMd
#' @param qid Query ID Selector.  Enter the QueryID number from a previously run query.
#' @param qcolumns Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.
#' @param tidy Return a tibble (typed from ECHO metadata like get_qid: numbers, dates and text; codes and IDs stay text). FALSE returns the CSV text as sent.
#' @return A tibble of the query rows read from the CSV, typed like the get_qid pages (tidy = TRUE, the default for the CSV output) or the CSV text as sent (tidy = FALSE).
#' @family Corporate Compliance Screener endpoints
#' @export
# Generated with specmill; do not edit by hand.
compscreen_get_download <- function(qid, qcolumns = NULL, tidy = TRUE) {
  if (base::is.null(qid)) base::stop("Required input: qid")
  .api_validation$parameter_values(base::list("qid" = qid, "qcolumns" = qcolumns), list(qid = list(name = "qid", "in" = "query", description = "Query ID Selector.  Enter the QueryID number from a previously run query.", type = "string"), qcolumns = list(name = "qcolumns", "in" = "query", description = "Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.", type = "string")), .api_validation$body_value, c(qid = "query", qcolumns = "query"))
  params <- base::list("qid" = qid, "qcolumns" = qcolumns, "tidy" = tidy)
  if (base::is.character(params[["qid"]]) && base::any(!base::nzchar(params[["qid"]]))) base::stop("Empty query parameter: qid")
  if (base::is.character(params[["qcolumns"]]) && base::any(!base::nzchar(params[["qcolumns"]]))) base::stop("Empty query parameter: qcolumns")
  result <- compscreen_request(method = "GET", path = "/comp_screen_services.get_download", path_params = base::list(), query = base::list("qid" = params[["qid"]], "qcolumns" = params[["qcolumns"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_download_compscreen", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Corporate Compliance Screener Download Data Service
#' 
#' @noMd
#' @param tidy Return a tibble (typed from ECHO metadata like get_qid: numbers, dates and text; codes and IDs stay text). FALSE returns the CSV text as sent.
#' @param body Request body.
#' @return A tibble of the query rows read from the CSV, typed like the get_qid pages (tidy = TRUE, the default for the CSV output) or the CSV text as sent (tidy = FALSE).
#' @family Corporate Compliance Screener endpoints
#' @export
# Generated with specmill; do not edit by hand.
compscreen_get_download_post <- function(body, tidy = TRUE) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(qid = list(description = "Query ID Selector.  Enter the QueryID number from a previously run query.", type = "string"), qcolumns = list(description = "Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.", type = "string")), required = list("qid")), .api_validation$body_value, TRUE)
  }
  params <- base::list("tidy" = tidy, "body" = body)
  result <- compscreen_request(method = "POST", path = "/comp_screen_services.get_download", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(qid = list(), qcolumns = list()), form_schema = list(type = "object", properties = list(qid = list(description = "Query ID Selector.  Enter the QueryID number from a previously run query.", type = "string"), qcolumns = list(description = "Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.", type = "string")), required = list("qid")))
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_download_compscreen", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Corporate Compliance Screener Metadata Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Corporate Compliance Screener endpoints
#' @export
# Generated with specmill; do not edit by hand.
compscreen_metadata <- function(output = NULL, callback = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), .api_validation$body_value, c(output = "query", callback = "query"))
  params <- base::list("output" = output, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- compscreen_request(method = "GET", path = "/comp_screen_services.metadata", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Corporate Compliance Screener Metadata Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Corporate Compliance Screener endpoints
#' @export
# Generated with specmill; do not edit by hand.
compscreen_metadata_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- compscreen_request(method = "POST", path = "/comp_screen_services.metadata", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), required = list()))
  result
}
