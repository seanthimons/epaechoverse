# Three bounded one-page reads plus a two-request formatting/pagination check.
pkgload::load_all('.', quiet = TRUE)
checks <- list()
for (result_format in c('tidy', 'sf', 'geojson')) {
  result <- arcgis_facilities_query_layer_0(where = "FAC_STATE = 'RI'",
    outFields = 'REGISTRY_ID,FAC_STATE', resultRecordCount = 2L,
    all_pages = FALSE, format = result_format)
  if (result_format == 'tidy') stopifnot(inherits(result, 'tbl_df'), nrow(result) == 2L)
  if (result_format == 'sf') stopifnot(inherits(result, 'sf'), nrow(result) == 2L,
                                sf::st_crs(result)$epsg == 4326L)
  if (result_format == 'geojson') {
    decoded <- jsonlite::fromJSON(result, simplifyVector = FALSE)
    stopifnot(decoded$type == 'FeatureCollection', length(decoded$features) == 2L)
  }
  checks[[result_format]] <- list(status = 'ok', records = 2L,
    source_crs = attr(result, 'arcgis')$pages[[1]]$spatialReference)
}
paged <- suppressWarnings(arcgis_facilities_query_layer_0(where = "FAC_STATE = 'RI'",
  resultRecordCount = 1L, max_pages = 2L, format = 'sf'))
stopifnot(nrow(paged) == 2L, attr(paged, 'pagination')$requests == 2L,
          length(attr(paged, 'arcgis')$pages) == 2L, sf::st_crs(paged)$epsg == 4326L)
checks$paged_sf <- list(status = 'ok', records = nrow(paged),
                        pagination = attr(paged, 'pagination'))
for (result_format in c('sf', 'geojson')) {
  polygon <- arcgis_sample_cities_query_layer_1(resultRecordCount = 1L,
    all_pages = FALSE, format = result_format)
  if (result_format == 'sf') stopifnot(nrow(polygon) == 1L, !sf::st_is_empty(polygon)[[1]])
  if (result_format == 'geojson') stopifnot(
    length(jsonlite::fromJSON(polygon, simplifyVector = FALSE)$features) == 1L)
  checks[[paste0('polygon_', result_format)]] <- list(status = 'ok', records = 1L)
}
table <- arcgis_wqi_query_layer_8(resultRecordCount = 1L, all_pages = FALSE, format = 'sf')
stopifnot(nrow(table) == 1L, sf::st_is_empty(table)[[1]])
checks$nonspatial_table <- list(status = 'ok', records = 1L)
jsonlite::write_json(list(retrieved = format(Sys.time(), tz = 'UTC', usetz = TRUE),
  checks = checks), 'dev/arcgis/format-checks.json', auto_unbox = TRUE,
  pretty = TRUE, null = 'null')
