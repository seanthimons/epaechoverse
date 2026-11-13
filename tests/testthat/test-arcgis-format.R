arcgis_format_mock <- function(value) httr2::response(
  status_code = 200L, headers = list(`Content-Type` = 'application/json'),
  body = charToRaw(jsonlite::toJSON(value, auto_unbox = TRUE, null = 'null')))

arcgis_format_fixture <- function() list(
  geometryType = 'esriGeometryPoint',
  spatialReference = list(wkid = 102100, latestWkid = 3857),
  fields = list(list(name = 'CODE', type = 'esriFieldTypeString')),
  exceededTransferLimit = FALSE,
  features = list(
    list(attributes = list(CODE = '001', amount = 2.5, active = TRUE),
         geometry = list(x = -7900000, y = 5100000)),
    list(attributes = list(CODE = '002', amount = NULL, extra = list(a = 'b')),
         geometry = NULL)))

arcgis_format_call <- function(response, format = 'tidy') {
  httr2::with_mocked_responses(function(req) {
    expect_false('format' %in% names(httr2::url_parse(req$url)$query))
    arcgis_format_mock(response)
  }, arcgis_facilities_query_layer_0(all_pages = FALSE, format = format))
}

test_that('ArcGIS default tidy output preserves types, missing values and native metadata', {
  native <- arcgis_format_fixture()
  result <- arcgis_format_call(native)
  expect_s3_class(result, 'tbl_df')
  expect_identical(result$CODE, c('001', '002'))
  expect_equal(result$amount, c(2.5, NA_real_))
  expect_equal(result$.geometry[[1]]$x, -7900000)
  expect_null(result$.geometry[[2]])
  expect_equal(result$.layer, c(0L, 0L))
  expect_equal(attr(result, 'arcgis')$pages[[1]]$spatialReference$latestWkid, 3857)
  expect_equal(attr(result, 'arcgis')$pages[[1]]$fields, native$fields)
  expect_equal(arcgis_format_call(native, 'raw'), native$features)
})

test_that('ArcGIS sf and GeoJSON transform actual source coordinates and keep null geometries', {
  native <- arcgis_format_fixture()
  result <- arcgis_format_call(native, 'sf')
  expect_s3_class(result, 'sf')
  expect_equal(sf::st_crs(result)$epsg, 4326L)
  expected <- sf::st_transform(sf::st_sfc(sf::st_point(c(-7900000, 5100000)), crs = 3857), 4326)
  expect_equal(sf::st_coordinates(sf::st_geometry(result)[1]), sf::st_coordinates(expected))
  expect_equal(sf::st_is_empty(result), c(FALSE, TRUE))
  json <- jsonlite::fromJSON(arcgis_format_call(native, 'geojson'), simplifyVector = FALSE)
  expect_equal(json$type, 'FeatureCollection')
  expect_length(json$features, 2)
  expect_equal(unlist(json$features[[1]]$geometry$coordinates),
               as.numeric(sf::st_coordinates(expected)), tolerance = 1e-6)
  expect_null(json$features[[2]]$geometry)
  expect_identical(json$features[[1]]$properties$CODE, '001')
  expect_equal(json$arcgis$pages[[1]]$spatialReference$latestWkid, 3857)
})

test_that('ArcGIS hooks preserve empty-page CRS and combine metadata across pages', {
  pages <- 0L
  result <- httr2::with_mocked_responses(function(req) {
    pages <<- pages + 1L
    native <- arcgis_format_fixture()
    if (pages == 1L) native$features <- list()
    native$exceededTransferLimit <- pages == 1L
    arcgis_format_mock(native)
  }, arcgis_facilities_query_layer_0(resultRecordCount = 2L, max_pages = 3L, format = 'sf'))
  expect_equal(pages, 2L)
  expect_equal(nrow(result), 2L)
  expect_s3_class(result, 'sf')
  expect_length(attr(result, 'arcgis')$pages, 2L)
  expect_equal(attr(result, 'pagination')$requests, 2L)
  empty <- arcgis_format_fixture()
  empty$features <- list()
  for (format in c('tidy', 'sf', 'geojson')) {
    result <- arcgis_format_call(empty, format)
    if (format == 'geojson') expect_length(jsonlite::fromJSON(result)$features, 0L) else
      expect_equal(nrow(result), 0L)
    expect_equal(attr(result, 'arcgis')$pages[[1]]$spatialReference$latestWkid, 3857)
  }
})

test_that('identify and related records keep layer identity, parent IDs and provenance', {
  identify <- list(results = list(list(layerId = 8L, layerName = 'Stations',
    displayFieldName = 'CODE', value = '001', attributes = list(CODE = '001'),
    geometryType = 'esriGeometryPoint', geometry = list(x = 1, y = 2,
      spatialReference = list(wkid = 4326)))))
  out <- httr2::with_mocked_responses(function(req) arcgis_format_mock(identify),
    arcgis_wqi_identify(geometry = '1,2', tolerance = 1, mapExtent = '0,0,3,3',
      imageDisplay = '100,100,96', format = 'sf'))
  expect_equal(out$.layer, 8L)
  expect_equal(out$.metadata[[1]]$layerName, 'Stations')
  expect_equal(out$.metadata[[1]]$spatialReference$wkid, 4326)
  expect_equal(as.numeric(sf::st_coordinates(out)), c(1, 2))
  related <- list(fields = list(list(name = 'sample')), relatedRecordGroups = list(
    list(objectId = 9L, relatedRecords = list(list(attributes = list(sample = 'a')))),
    list(objectId = 10L, relatedRecords = list())))
  out <- httr2::with_mocked_responses(function(req) arcgis_format_mock(related),
    arcgis_wqi_query_related_records_layer_0(objectIds = '9,10', relationshipId = 0L,
      all_pages = FALSE, format = 'sf'))
  expect_equal(nrow(out), 1L)
  expect_equal(out$.parent_id, 9L)
  expect_true(sf::st_is_empty(out)[[1]])
  expect_length(attr(out, 'arcgis')$pages[[1]]$related_groups, 2L)
})

test_that('native query helper uses the same formatter and rejects unknown CRS without guessing', {
  native <- arcgis_format_fixture()
  result <- httr2::with_mocked_responses(function(req) arcgis_format_mock(native),
    arcgis_query_page('facilities', format = 'sf'))
  expect_s3_class(result, 'sf')
  native$spatialReference <- NULL
  expect_s3_class(arcgis_format_call(native), 'tbl_df')
  expect_error(arcgis_format_call(native, 'sf'), 'no reported spatial reference')
  expect_error(arcgis_format_call(native, 'geojson'), 'no reported spatial reference')
  expect_error(arcgis_format_call(native, 'nonsense'), 'format')
  native$transform <- list(scale = c(1, 1), translate = c(0, 0))
  expect_error(arcgis_format_call(native, 'sf'), 'Quantized')
})

test_that('GDAL handles multipoints, lines and polygon holes without flattening geometry', {
  geometry <- list(
    esriGeometryMultipoint = list(points = list(c(1, 2), c(3, 4))),
    esriGeometryPolyline = list(paths = list(list(c(1, 2), c(3, 4)))),
    esriGeometryPolygon = list(rings = list(
      list(c(0, 0), c(0, 4), c(4, 4), c(4, 0), c(0, 0)),
      list(c(1, 1), c(3, 1), c(3, 3), c(1, 3), c(1, 1)))))
  for (type in names(geometry)) {
    native <- list(geometryType = type, spatialReference = list(wkid = 4326),
      features = list(list(attributes = list(ID = 'one'), geometry = geometry[[type]])))
    out <- arcgis_format_call(native, 'sf')
    expect_equal(nrow(out), 1L)
    expect_false(sf::st_is_empty(out)[[1]])
    if (type == 'esriGeometryPolygon') expect_equal(length(sf::st_geometry(out)[[1]]), 2L)
  }
})

test_that('ArcGIS Z is retained and measured geometry is never silently stripped', {
  native <- list(geometryType = 'esriGeometryPoint', hasZ = TRUE,
    spatialReference = list(wkid = 4326), features = list(list(
      attributes = list(ID = 'z'), geometry = list(x = 1, y = 2, z = 3))))
  expect_equal(as.numeric(sf::st_coordinates(arcgis_format_call(native, 'sf'))), c(1, 2, 3))
  native$hasM <- TRUE
  native$features[[1]]$geometry$m <- 4
  expect_equal(arcgis_format_call(native)$.geometry[[1]]$m, 4)
  expect_error(arcgis_format_call(native, 'sf'), 'retain M values')
  expect_error(arcgis_format_call(native, 'geojson'), 'retain M values')
})

test_that('multiple GeoJSON pages become one collection and missing values keep declared types', {
  requests <- 0L
  result <- httr2::with_mocked_responses(function(req) {
    requests <<- requests + 1L
    native <- arcgis_format_fixture()
    native$features <- native$features[1]
    native$exceededTransferLimit <- requests == 1L
    arcgis_format_mock(native)
  }, arcgis_facilities_query_layer_0(resultRecordCount = 1L, max_pages = 3L, format = 'geojson'))
  parsed <- jsonlite::fromJSON(result, simplifyVector = FALSE)
  expect_length(parsed$features, 2L)
  expect_length(parsed$arcgis$pages, 2L)
  expect_equal(parsed$arcgis$pagination$requests, 2L)
  expect_equal(attr(result, 'pagination')$requests, 2L)
  native <- arcgis_format_fixture()
  native$fields[[2]] <- list(name = 'missing', type = 'esriFieldTypeDouble')
  result <- arcgis_format_call(native)
  expect_type(result$missing, 'double')
  expect_true(all(is.na(result$missing)))
})
