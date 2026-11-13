#' Query city1
#' 
#' @noMd
#' @param where where
#' @param outFields outFields
#' @param returnGeometry returnGeometry
#' @param f f
#' @return Decoded response returned by the client request helper.
#' @family layer_0 endpoints
#' @export
# Generated with specmill; do not edit by hand.
arcgis_monitor_check2_query_layer_0 <- function(where = "1=1", outFields = "*", returnGeometry = TRUE, f = "json") {
  .api_validation$parameter_values(base::list("where" = where, "outFields" = outFields, "returnGeometry" = returnGeometry, "f" = f), list(where = list(type = "string", default = "1=1"), outFields = list(type = "string", default = "*"), returnGeometry = list(type = "boolean", default = TRUE), f = list(type = "string", enum = list("json", "pjson"), default = "json")), .api_validation$body_value, c(where = "query", outFields = "query", returnGeometry = "query", f = "query"))
  params <- base::list("where" = where, "outFields" = outFields, "returnGeometry" = returnGeometry, "f" = f)
  if (base::is.character(params[["where"]]) && base::any(!base::nzchar(params[["where"]]))) base::stop("Empty query parameter: where")
  if (base::is.character(params[["outFields"]]) && base::any(!base::nzchar(params[["outFields"]]))) base::stop("Empty query parameter: outFields")
  if (base::is.character(params[["returnGeometry"]]) && base::any(!base::nzchar(params[["returnGeometry"]]))) base::stop("Empty query parameter: returnGeometry")
  if (base::is.character(params[["f"]]) && base::any(!base::nzchar(params[["f"]]))) base::stop("Empty query parameter: f")
  result <- arcgis_monitor_check2_request(method = "GET", path = "/0/query", path_params = base::list(), query = base::list("where" = params[["where"]], "outFields" = params[["outFields"]], "returnGeometry" = params[["returnGeometry"]], "f" = params[["f"]]), body = NULL, response_policy = "arcgis_monitor_check2_request_arcgis_response", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echogeo.epa.gov/arcgis/rest/services/monitor/ncc_arcgis_check2/MapServer"), auth = list(), parameter_serialization = list(list(name = "returnGeometry", location = "query", schema = list(type = "boolean", default = TRUE), style = "form", explode = TRUE, collection_format = NULL, required = FALSE)))
  result
}
