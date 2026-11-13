#' Query Only Rejected Samples
#' 
#' @noMd
#' @param where where
#' @param outFields outFields
#' @param returnGeometry returnGeometry
#' @param resultOffset resultOffset
#' @param resultRecordCount resultRecordCount
#' @param f f
#' @param format Client result: tidy tibble (default), sf, geojson string, or raw. Spatial output is transformed from the reported CRS to EPSG:4326; tidy retains native geometry. Metadata and pagination are retained.
#' @param all_pages TRUE (the default) requests page after page, starting at resultOffset, until a page comes back empty or the client says it was the last or max_pages is reached, and returns the pages combined. FALSE requests only the page given in resultOffset.
#' @param max_pages Maximum number of pages requested when all_pages is TRUE. Reaching it stops paging with a warning; attr(result, 'pagination')$stop_reason records why paging stopped.
#' @return A tibble, sf object in EPSG:4326, GeoJSON FeatureCollection string, or native response/record list, selected by format. Metadata is retained in the arcgis attribute and GeoJSON arcgis member.
#' @family layer_5 endpoints
#' @export
# Generated with specmill; do not edit by hand.
arcgis_wqi_query_layer_5 <- function(where = "1=1", outFields = "*", returnGeometry = TRUE, resultOffset = 0L, resultRecordCount = 2000L, f = "json", format = "tidy", all_pages = TRUE, max_pages = 100L) {
  .api_validation$parameter_values(base::list("where" = where, "outFields" = outFields, "returnGeometry" = returnGeometry, "resultOffset" = resultOffset, "resultRecordCount" = resultRecordCount, "f" = f), list(where = list(type = "string", default = "1=1"), outFields = list(type = "string", default = "*"), returnGeometry = list(type = "boolean", default = TRUE), resultOffset = list(type = "integer", default = 0L, minimum = 0L), resultRecordCount = list(type = "integer", default = 2000L, minimum = 1L, maximum = 2000L), f = list(type = "string", enum = list("json", "pjson"), default = "json")), .api_validation$body_value, c(where = "query", outFields = "query", returnGeometry = "query", resultOffset = "query", resultRecordCount = "query", f = "query"))
  params <- base::list("where" = where, "outFields" = outFields, "returnGeometry" = returnGeometry, "resultOffset" = resultOffset, "resultRecordCount" = resultRecordCount, "f" = f, "format" = format)
  if (!base::is.logical(all_pages) || base::length(all_pages) != 1L || base::is.na(all_pages)) base::stop("all_pages must be TRUE or FALSE", call. = FALSE)
  if (base::is.character(params[["where"]]) && base::any(!base::nzchar(params[["where"]]))) base::stop("Empty query parameter: where")
  if (base::is.character(params[["outFields"]]) && base::any(!base::nzchar(params[["outFields"]]))) base::stop("Empty query parameter: outFields")
  if (base::is.character(params[["returnGeometry"]]) && base::any(!base::nzchar(params[["returnGeometry"]]))) base::stop("Empty query parameter: returnGeometry")
  if (base::is.character(params[["resultOffset"]]) && base::any(!base::nzchar(params[["resultOffset"]]))) base::stop("Empty query parameter: resultOffset")
  if (base::is.character(params[["resultRecordCount"]]) && base::any(!base::nzchar(params[["resultRecordCount"]]))) base::stop("Empty query parameter: resultRecordCount")
  if (base::is.character(params[["f"]]) && base::any(!base::nzchar(params[["f"]]))) base::stop("Empty query parameter: f")
  send <- function(params) {
    page_value <- params[["resultOffset"]]
    page_size_value <- params[["resultRecordCount"]]
    state <- arcgis_hook("arcgis_wqi_query_layer_5", "pre_request", base::list(params = params))
    if (base::isTRUE(state$skip_request)) base::return(state$result)
    changed <- base::intersect(base::names(params), base::names(state$params))
    params[changed] <- state$params[changed]
    if (!base::identical(params[["resultOffset"]], page_value)) base::stop("pre_request hooks must not change the pagination argument resultOffset: the pages are requested by the wrapper", call. = FALSE)
    if (!base::identical(params[["resultRecordCount"]], page_size_value)) base::stop("pre_request hooks must not change the pagination size argument", call. = FALSE)
    result <- arcgis_wqi_request(method = "GET", path = "/5/query", path_params = base::list(), query = base::list("where" = params[["where"]], "outFields" = params[["outFields"]], "returnGeometry" = params[["returnGeometry"]], "resultOffset" = params[["resultOffset"]], "resultRecordCount" = params[["resultRecordCount"]], "f" = params[["f"]]), body = NULL, response_policy = "arcgis_wqi_request_arcgis_response", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echogeo.epa.gov/arcgis/rest/services/WQI/WQI_stations_with_data/MapServer"), auth = list(), parameter_serialization = list(list(name = "returnGeometry", location = "query", schema = list(type = "boolean", default = TRUE), style = "form", explode = TRUE, collection_format = NULL, required = FALSE)))
    result <- arcgis_hook("arcgis_wqi_query_layer_5", "post_response", base::list(result = result, params = params))
    result
  }
  if (!base::isTRUE(all_pages)) {
    result <- send(params)
    if (base::inherits(result, "httr2_request")) base::return(result)
    base::return(base::get("arcgis_page_items", envir = base::environment(arcgis_wqi_request_pages), mode = "function", inherits = FALSE)(result))
  }
  if (base::is.null(params[["resultOffset"]])) base::stop("Supply resultOffset to start paging, or set all_pages = FALSE", call. = FALSE)
  result <- arcgis_wqi_request_pages(function(page) {
    params[base::names(page)] <- page
    send(params)
  }, "resultOffset", params[["resultOffset"]], max_pages, completed = base::get("arcgis_wqi_request_arcgis_completed", envir = base::environment(arcgis_wqi_request_pages), mode = "function", inherits = FALSE), mode = "offset", size_parameter = "resultRecordCount", page_size = params[["resultRecordCount"]], next_cursor = NULL, items = base::get("arcgis_page_items", envir = base::environment(arcgis_wqi_request_pages), mode = "function", inherits = FALSE), error_policy = "stop", warn_limits = TRUE, warn_errors = TRUE, stop_on_empty = FALSE, on_limit = NULL)
  if (base::inherits(result, "httr2_request")) base::return(result)
  kept <- base::attr(result, "pagination", exact = TRUE)
  result <- arcgis_hook("arcgis_wqi_query_layer_5", "post_combine", base::list(result = result, params = params))
  if (!base::is.null(kept) && !base::is.null(result) && base::is.null(base::attr(result, "pagination", exact = TRUE))) base::attr(result, "pagination") <- kept
  result
}

#' Query related records for Only Rejected Samples
#' 
#' @noMd
#' @param objectIds objectIds
#' @param relationshipId relationshipId
#' @param outFields outFields
#' @param resultOffset resultOffset
#' @param resultRecordCount resultRecordCount
#' @param f f
#' @param format Client result: tidy tibble (default), sf, geojson string, or raw. Spatial output is transformed from the reported CRS to EPSG:4326; tidy retains native geometry. Metadata and pagination are retained.
#' @param all_pages TRUE (the default) requests page after page, starting at resultOffset, until a page comes back empty or the client says it was the last or max_pages is reached, and returns the pages combined. FALSE requests only the page given in resultOffset.
#' @param max_pages Maximum number of pages requested when all_pages is TRUE. Reaching it stops paging with a warning; attr(result, 'pagination')$stop_reason records why paging stopped.
#' @return A tibble, sf object in EPSG:4326, GeoJSON FeatureCollection string, or native response/record list, selected by format. Metadata is retained in the arcgis attribute and GeoJSON arcgis member.
#' @family layer_5 endpoints
#' @export
# Generated with specmill; do not edit by hand.
arcgis_wqi_query_related_records_layer_5 <- function(objectIds, relationshipId, outFields = "*", resultOffset = 0L, resultRecordCount = 2000L, f = "json", format = "tidy", all_pages = TRUE, max_pages = 100L) {
  if (base::is.null(objectIds)) base::stop("Required input: objectIds")
  if (base::is.null(relationshipId)) base::stop("Required input: relationshipId")
  .api_validation$parameter_values(base::list("objectIds" = objectIds, "relationshipId" = relationshipId, "outFields" = outFields, "resultOffset" = resultOffset, "resultRecordCount" = resultRecordCount, "f" = f), list(objectIds = list(type = "string"), relationshipId = list(type = "integer", minimum = 0L), outFields = list(type = "string", default = "*"), resultOffset = list(type = "integer", default = 0L, minimum = 0L), resultRecordCount = list(type = "integer", default = 2000L, minimum = 1L, maximum = 2000L), f = list(type = "string", enum = list("json", "pjson"), default = "json")), .api_validation$body_value, c(objectIds = "query", relationshipId = "query", outFields = "query", resultOffset = "query", resultRecordCount = "query", f = "query"))
  params <- base::list("objectIds" = objectIds, "relationshipId" = relationshipId, "outFields" = outFields, "resultOffset" = resultOffset, "resultRecordCount" = resultRecordCount, "f" = f, "format" = format)
  if (!base::is.logical(all_pages) || base::length(all_pages) != 1L || base::is.na(all_pages)) base::stop("all_pages must be TRUE or FALSE", call. = FALSE)
  if (base::is.character(params[["objectIds"]]) && base::any(!base::nzchar(params[["objectIds"]]))) base::stop("Empty query parameter: objectIds")
  if (base::is.character(params[["relationshipId"]]) && base::any(!base::nzchar(params[["relationshipId"]]))) base::stop("Empty query parameter: relationshipId")
  if (base::is.character(params[["outFields"]]) && base::any(!base::nzchar(params[["outFields"]]))) base::stop("Empty query parameter: outFields")
  if (base::is.character(params[["resultOffset"]]) && base::any(!base::nzchar(params[["resultOffset"]]))) base::stop("Empty query parameter: resultOffset")
  if (base::is.character(params[["resultRecordCount"]]) && base::any(!base::nzchar(params[["resultRecordCount"]]))) base::stop("Empty query parameter: resultRecordCount")
  if (base::is.character(params[["f"]]) && base::any(!base::nzchar(params[["f"]]))) base::stop("Empty query parameter: f")
  send <- function(params) {
    page_value <- params[["resultOffset"]]
    page_size_value <- params[["resultRecordCount"]]
    state <- arcgis_hook("arcgis_wqi_query_related_records_layer_5", "pre_request", base::list(params = params))
    if (base::isTRUE(state$skip_request)) base::return(state$result)
    changed <- base::intersect(base::names(params), base::names(state$params))
    params[changed] <- state$params[changed]
    if (!base::identical(params[["resultOffset"]], page_value)) base::stop("pre_request hooks must not change the pagination argument resultOffset: the pages are requested by the wrapper", call. = FALSE)
    if (!base::identical(params[["resultRecordCount"]], page_size_value)) base::stop("pre_request hooks must not change the pagination size argument", call. = FALSE)
    result <- arcgis_wqi_request(method = "GET", path = "/5/queryRelatedRecords", path_params = base::list(), query = base::list("objectIds" = params[["objectIds"]], "relationshipId" = params[["relationshipId"]], "outFields" = params[["outFields"]], "resultOffset" = params[["resultOffset"]], "resultRecordCount" = params[["resultRecordCount"]], "f" = params[["f"]]), body = NULL, response_policy = "arcgis_wqi_request_arcgis_response", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echogeo.epa.gov/arcgis/rest/services/WQI/WQI_stations_with_data/MapServer"), auth = list())
    result <- arcgis_hook("arcgis_wqi_query_related_records_layer_5", "post_response", base::list(result = result, params = params))
    result
  }
  if (!base::isTRUE(all_pages)) {
    result <- send(params)
    if (base::inherits(result, "httr2_request")) base::return(result)
    base::return(base::get("arcgis_page_items", envir = base::environment(arcgis_wqi_request_pages), mode = "function", inherits = FALSE)(result))
  }
  if (base::is.null(params[["resultOffset"]])) base::stop("Supply resultOffset to start paging, or set all_pages = FALSE", call. = FALSE)
  result <- arcgis_wqi_request_pages(function(page) {
    params[base::names(page)] <- page
    send(params)
  }, "resultOffset", params[["resultOffset"]], max_pages, completed = base::get("arcgis_wqi_request_arcgis_related_completed", envir = base::environment(arcgis_wqi_request_pages), mode = "function", inherits = FALSE), mode = "offset", size_parameter = "resultRecordCount", page_size = params[["resultRecordCount"]], next_cursor = NULL, items = base::get("arcgis_page_items", envir = base::environment(arcgis_wqi_request_pages), mode = "function", inherits = FALSE), error_policy = "stop", warn_limits = TRUE, warn_errors = TRUE, stop_on_empty = FALSE, on_limit = NULL)
  if (base::inherits(result, "httr2_request")) base::return(result)
  kept <- base::attr(result, "pagination", exact = TRUE)
  result <- arcgis_hook("arcgis_wqi_query_related_records_layer_5", "post_combine", base::list(result = result, params = params))
  if (!base::is.null(kept) && !base::is.null(result) && base::is.null(base::attr(result, "pagination", exact = TRUE))) base::attr(result, "pagination") <- kept
  result
}
