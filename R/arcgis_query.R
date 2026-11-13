#' Request and format one ArcGIS query response
#'
#' Query a captured public EPA MapServer layer or table. This single-request
#' helper never paginates. Choose format = 'raw' to retain the complete JSON
#' envelope including spatialReference, fields, features and exceededTransferLimit.
#' Formatted output retains metadata; sf and GeoJSON transform the reported
#' coordinate system to EPSG:4326. No source CRS is guessed.
#'
#' @param service One of facilities, stormwater, wqi, monitor_checks,
#'   monitor_check2 or sample_cities. The last three are monitoring/demo services.
#' @param layer Captured numeric layer or table ID. See the installed
#'   extdata/arcgis-layers.csv inventory, or the ArcGIS service directory.
#' @param where ArcGIS SQL filter. The default selects no records.
#' @param format Client output: tidy, sf, geojson or raw. Spatial output uses EPSG:4326.
#' @param ... Named native ArcGIS query arguments, for example outFields,
#'   resultRecordCount, outSR, geometry, geometryType, inSR or spatialRel.
#'   Supply geometry as JSON text, not an sf object. The response format is JSON.
#'   Offset and page-size controls work only on layers that advertise pagination.
#' @return A tibble, sf object, GeoJSON string, native response with format = 'raw',
#'   or a prepared httr2 request when
#'   echoverse_dry_run(TRUE) is active. Check exceededTransferLimit before treating
#'   one page as a complete extract. Root ArcGIS service errors raise R errors.
#' @examples
#' \dontrun{
#' page <- arcgis_query_page('facilities', 0, where = "FAC_STATE = 'RI'",
#'                           outFields = 'REGISTRY_ID', resultRecordCount = 5,
#'                           outSR = 4326, format = 'raw')
#' page$spatialReference
#' }
#' @export
arcgis_query_page <- function(service, layer = 0L, where = '1=0', ..., format = 'tidy') {
  arcgis_format_choices(format)
  service <- match.arg(service, c('facilities', 'stormwater', 'wqi',
                                  'monitor_checks', 'monitor_check2', 'sample_cities'))
  if (!is.numeric(layer) || length(layer) != 1L || is.na(layer) ||
      !is.finite(layer) || layer < 0 || layer != trunc(layer)) {
    stop('layer must be a captured nonnegative integer ID', call. = FALSE)
  }
  inventory <- utils::read.csv(system.file('extdata', 'arcgis-layers.csv',
                                           package = 'echoverse', mustWork = TRUE))
  if (!any(inventory$service == service & inventory$layer == layer)) {
    stop('Layer is not in the captured service inventory', call. = FALSE)
  }
  if (!is.character(where) || length(where) != 1L || is.na(where) || !nzchar(where)) {
    stop('where must be one nonempty ArcGIS SQL string', call. = FALSE)
  }
  extra <- list(...)
  if (length(extra) && (is.null(names(extra)) || any(!nzchar(names(extra))) ||
                         anyDuplicated(names(extra)) || any(names(extra) %in% c('f', 'where')))) {
    stop('Supply unique named query arguments; f and where are set by this helper', call. = FALSE)
  }
  helper <- paste0('arcgis_', service, '_request')
  transport <- get(helper, envir = environment(arcgis_query_page), mode = 'function')
  policy <- get(paste0(helper, '_arcgis_response'),
                envir = environment(arcgis_query_page), mode = 'function')
  result <- transport(method = 'GET', path = paste0('/', layer, '/query'), path_params = list(), body = NULL,
            query = c(list(f = 'json', where = where), extra), response_policy = policy,
            request_controls = list(timeout = 60, max_retries = 2))
  if (inherits(result, "httr2_request")) return(result)
  arcgis_format_responses(list(result), format, list(service = service, layer = layer))
}
