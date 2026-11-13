#' Query Facility Finder Industrial Stormwater
#' 
#' @noMd
#' @param where where
#' @param outFields outFields
#' @param returnGeometry returnGeometry
#' @param resultOffset resultOffset
#' @param resultRecordCount resultRecordCount
#' @param f f
#' @param all_pages TRUE (the default) requests page after page, starting at resultOffset, until a page comes back empty or the client says it was the last or max_pages is reached, and returns the pages combined. FALSE requests only the page given in resultOffset.
#' @param max_pages Maximum number of pages requested when all_pages is TRUE. Reaching it stops paging with a warning; attr(result, 'pagination')$stop_reason records why paging stopped.
#' @return Decoded response returned by the client request helper. With all_pages = TRUE the pages are combined, and attr(result, 'pagination') lists requests, item_count and stop_reason.
#' @family layer_0 endpoints
#' @export
# Generated with specmill; do not edit by hand.
arcgis_stormwater_query_layer_0 <- function(where = "1=1", outFields = "*", returnGeometry = TRUE, resultOffset = 0L, resultRecordCount = 2000L, f = "json", all_pages = TRUE, max_pages = 100L) {
  .api_validation$parameter_values(base::list("where" = where, "outFields" = outFields, "returnGeometry" = returnGeometry, "resultOffset" = resultOffset, "resultRecordCount" = resultRecordCount, "f" = f), list(where = list(type = "string", default = "1=1"), outFields = list(type = "string", default = "*"), returnGeometry = list(type = "boolean", default = TRUE), resultOffset = list(type = "integer", default = 0L, minimum = 0L), resultRecordCount = list(type = "integer", default = 2000L, minimum = 1L, maximum = 2000L), f = list(type = "string", enum = list("json", "pjson"), default = "json")), .api_validation$body_value, c(where = "query", outFields = "query", returnGeometry = "query", resultOffset = "query", resultRecordCount = "query", f = "query"))
  params <- base::list("where" = where, "outFields" = outFields, "returnGeometry" = returnGeometry, "resultOffset" = resultOffset, "resultRecordCount" = resultRecordCount, "f" = f)
  if (!base::is.logical(all_pages) || base::length(all_pages) != 1L || base::is.na(all_pages)) base::stop("all_pages must be TRUE or FALSE", call. = FALSE)
  if (base::is.character(params[["where"]]) && base::any(!base::nzchar(params[["where"]]))) base::stop("Empty query parameter: where")
  if (base::is.character(params[["outFields"]]) && base::any(!base::nzchar(params[["outFields"]]))) base::stop("Empty query parameter: outFields")
  if (base::is.character(params[["returnGeometry"]]) && base::any(!base::nzchar(params[["returnGeometry"]]))) base::stop("Empty query parameter: returnGeometry")
  if (base::is.character(params[["resultOffset"]]) && base::any(!base::nzchar(params[["resultOffset"]]))) base::stop("Empty query parameter: resultOffset")
  if (base::is.character(params[["resultRecordCount"]]) && base::any(!base::nzchar(params[["resultRecordCount"]]))) base::stop("Empty query parameter: resultRecordCount")
  if (base::is.character(params[["f"]]) && base::any(!base::nzchar(params[["f"]]))) base::stop("Empty query parameter: f")
  send <- function(params) {
    result <- arcgis_stormwater_request(method = "GET", path = "/0/query", path_params = base::list(), query = base::list("where" = params[["where"]], "outFields" = params[["outFields"]], "returnGeometry" = params[["returnGeometry"]], "resultOffset" = params[["resultOffset"]], "resultRecordCount" = params[["resultRecordCount"]], "f" = params[["f"]]), body = NULL, response_policy = "arcgis_stormwater_request_arcgis_response", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echogeo.epa.gov/arcgis/rest/services/ECHO/FacilityFinderStateStormWater/MapServer"), auth = list(), parameter_serialization = list(list(name = "returnGeometry", location = "query", schema = list(type = "boolean", default = TRUE), style = "form", explode = TRUE, collection_format = NULL, required = FALSE)))
    result
  }
  if (!base::isTRUE(all_pages)) {
    result <- send(params)
    if (base::inherits(result, "httr2_request")) base::return(result)
    base::return(base::get("arcgis_stormwater_request_arcgis_features", envir = base::environment(arcgis_stormwater_request_pages), mode = "function", inherits = FALSE)(result))
  }
  if (base::is.null(params[["resultOffset"]])) base::stop("Supply resultOffset to start paging, or set all_pages = FALSE", call. = FALSE)
  result <- arcgis_stormwater_request_pages(function(page) {
    params[base::names(page)] <- page
    send(params)
  }, "resultOffset", params[["resultOffset"]], max_pages, completed = base::get("arcgis_stormwater_request_arcgis_completed", envir = base::environment(arcgis_stormwater_request_pages), mode = "function", inherits = FALSE), mode = "offset", size_parameter = "resultRecordCount", page_size = params[["resultRecordCount"]], next_cursor = NULL, items = base::get("arcgis_stormwater_request_arcgis_features", envir = base::environment(arcgis_stormwater_request_pages), mode = "function", inherits = FALSE), error_policy = "stop", warn_limits = TRUE, warn_errors = TRUE, stop_on_empty = FALSE, on_limit = NULL)
  if (base::inherits(result, "httr2_request")) base::return(result)
  result
}
