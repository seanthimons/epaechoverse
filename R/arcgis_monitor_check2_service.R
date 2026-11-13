#' Identify features in ncc_arcgis_check2
#' 
#' @noMd
#' @param geometry geometry
#' @param geometryType geometryType
#' @param tolerance tolerance
#' @param mapExtent mapExtent
#' @param imageDisplay imageDisplay
#' @param layers layers
#' @param f f
#' @param format Client result: tidy tibble (default), sf, geojson string, or raw. Spatial output is transformed from the reported CRS to EPSG:4326; tidy retains native geometry. Metadata and pagination are retained.
#' @return A tibble, sf object in EPSG:4326, GeoJSON FeatureCollection string, or native response/record list, selected by format. Metadata is retained in the arcgis attribute and GeoJSON arcgis member.
#' @family service endpoints
#' @export
# Generated with specmill; do not edit by hand.
arcgis_monitor_check2_identify <- function(geometry, geometryType = "esriGeometryPoint", tolerance, mapExtent, imageDisplay, layers = "all", f = "json", format = "tidy") {
  if (base::is.null(geometry)) base::stop("Required input: geometry")
  if (base::is.null(tolerance)) base::stop("Required input: tolerance")
  if (base::is.null(mapExtent)) base::stop("Required input: mapExtent")
  if (base::is.null(imageDisplay)) base::stop("Required input: imageDisplay")
  .api_validation$parameter_values(base::list("geometry" = geometry, "geometryType" = geometryType, "tolerance" = tolerance, "mapExtent" = mapExtent, "imageDisplay" = imageDisplay, "layers" = layers, "f" = f), list(geometry = list(type = "string"), geometryType = list(type = "string", default = "esriGeometryPoint"), tolerance = list(type = "integer", minimum = 0L), mapExtent = list(type = "string"), imageDisplay = list(type = "string"), layers = list(type = "string", default = "all"), f = list(type = "string", enum = list("json", "pjson"), default = "json")), .api_validation$body_value, c(geometry = "query", geometryType = "query", tolerance = "query", mapExtent = "query", imageDisplay = "query", layers = "query", f = "query"))
  params <- base::list("geometry" = geometry, "geometryType" = geometryType, "tolerance" = tolerance, "mapExtent" = mapExtent, "imageDisplay" = imageDisplay, "layers" = layers, "f" = f, "format" = format)
  if (base::is.character(params[["geometry"]]) && base::any(!base::nzchar(params[["geometry"]]))) base::stop("Empty query parameter: geometry")
  if (base::is.character(params[["geometryType"]]) && base::any(!base::nzchar(params[["geometryType"]]))) base::stop("Empty query parameter: geometryType")
  if (base::is.character(params[["tolerance"]]) && base::any(!base::nzchar(params[["tolerance"]]))) base::stop("Empty query parameter: tolerance")
  if (base::is.character(params[["mapExtent"]]) && base::any(!base::nzchar(params[["mapExtent"]]))) base::stop("Empty query parameter: mapExtent")
  if (base::is.character(params[["imageDisplay"]]) && base::any(!base::nzchar(params[["imageDisplay"]]))) base::stop("Empty query parameter: imageDisplay")
  if (base::is.character(params[["layers"]]) && base::any(!base::nzchar(params[["layers"]]))) base::stop("Empty query parameter: layers")
  if (base::is.character(params[["f"]]) && base::any(!base::nzchar(params[["f"]]))) base::stop("Empty query parameter: f")
  state <- arcgis_hook("arcgis_monitor_check2_identify", "pre_request", base::list(params = params))
  if (base::isTRUE(state$skip_request)) base::return(state$result)
  changed <- base::intersect(base::names(params), base::names(state$params))
  params[changed] <- state$params[changed]
  result <- arcgis_monitor_check2_request(method = "GET", path = "/identify", path_params = base::list(), query = base::list("geometry" = params[["geometry"]], "geometryType" = params[["geometryType"]], "tolerance" = params[["tolerance"]], "mapExtent" = params[["mapExtent"]], "imageDisplay" = params[["imageDisplay"]], "layers" = params[["layers"]], "f" = params[["f"]]), body = NULL, response_policy = "arcgis_monitor_check2_request_arcgis_response", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echogeo.epa.gov/arcgis/rest/services/monitor/ncc_arcgis_check2/MapServer"), auth = list())
  result <- arcgis_hook("arcgis_monitor_check2_identify", "post_response", base::list(result = result, params = params))
  result
}
