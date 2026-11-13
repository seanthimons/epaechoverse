arcgis_response <- function(ids, more = FALSE) {
  list(spatialReference = list(wkid = 102100, latestWkid = 3857),
       geometryType = 'esriGeometryPoint', exceededTransferLimit = more,
       features = lapply(ids, function(id) list(attributes = list(OBJECTID = id),
                                               geometry = list(x = -7900000, y = 5100000))))
}

test_that('ArcGIS paging obeys server flags, changes offset by page size, and keeps geometry', {
  offsets <- character()
  result <- httr2::with_mocked_responses(function(req) {
    params <- httr2::url_parse(req$url)$query
    offsets <<- c(offsets, params$resultOffset)
    expect_equal(params$resultRecordCount, '2')
    # A sparse page does not stop paging while the server advertises more.
    httr2::response_json(body = arcgis_response(if (length(offsets) == 1) 1L else 2:3,
                                         more = length(offsets) == 1))
  }, arcgis_facilities_query_layer_0(resultRecordCount = 2L, max_pages = 3L))
  expect_equal(offsets, c('0', '2'))
  expect_length(result, 3L)
  expect_equal(result[[1]]$geometry$x, -7900000)
  expect_equal(attr(result, 'pagination')$requests, 2L)
})

test_that('ArcGIS single-page raw helper retains CRS and native query parameters', {
  envelope <- arcgis_response(1L, TRUE)
  result <- httr2::with_mocked_responses(function(req) {
    params <- httr2::url_parse(req$url)$query
    expect_equal(params$outSR, '4326')
    expect_equal(params$geometry, '-72,41,-71,42')
    expect_equal(params$geometryType, 'esriGeometryEnvelope')
    expect_equal(params$f, 'json')
    httr2::response_json(body = envelope)
  }, arcgis_query_page('facilities', 0L, where = "STATE = 'RI'", outSR = 4326,
                       geometry = '-72,41,-71,42', geometryType = 'esriGeometryEnvelope'))
  expect_equal(result$spatialReference$latestWkid, 3857)
  expect_true(result$exceededTransferLimit)
  expect_equal(result$features[[1]]$geometry$x, -7900000)
  expect_error(arcgis_query_page('facilities', 99L), 'captured')
  expect_error(arcgis_query_page('facilities', 0L, f = 'geojson'), 'unique named')
})

test_that('ArcGIS service errors sent as HTTP 200 raise without echoing server messages', {
  expect_error(httr2::with_mocked_responses(function(req) {
    httr2::response_json(body = list(error = list(code = 400L, message = 'private query text')))
  }, arcgis_facilities_query_layer_0(all_pages = FALSE)),
  '^ArcGIS service error \\(400\\)$', class = 'specmill_call_error')
})

test_that('ArcGIS nonpaging layers retain envelopes and omit offset controls', {
  expect_false('all_pages' %in% names(formals(arcgis_monitor_checks_query_layer_0)))
  envelope <- arcgis_response(1L)
  result <- httr2::with_mocked_responses(function(req) httr2::response_json(body = envelope),
                                        arcgis_monitor_checks_query_layer_0())
  expect_equal(result$spatialReference$wkid, 102100)
})

test_that('related-record paging probes a full page without a transfer flag', {
  offsets <- character()
  result <- httr2::with_mocked_responses(function(req) {
    offsets <<- c(offsets, httr2::url_parse(req$url)$query$resultOffset)
    records <- if (length(offsets) == 1L) list(list(attributes = list(SAMPLE = 'a'))) else list()
    httr2::response_json(body = list(relatedRecordGroups = list(
      list(objectId = 7L, relatedRecords = records))))
  }, arcgis_wqi_query_related_records_layer_0(objectIds = '7', relationshipId = 0L,
                                               resultRecordCount = 1L, max_pages = 3L))
  expect_equal(offsets, c('0', '1'))
  expect_equal(result[[1]]$objectId, 7L)
  expect_equal(result[[1]]$relatedRecords[[1]]$attributes$SAMPLE, 'a')
})

test_that('ArcGIS page caps warn rather than silently reporting complete results', {
  expect_warning(result <- httr2::with_mocked_responses(function(req) {
    httr2::response_json(body = arcgis_response(1L, more = TRUE))
  }, arcgis_facilities_query_layer_0(resultRecordCount = 1L, max_pages = 1L)))
  expect_equal(attr(result, 'pagination')$stop_reason, 'max_pages')
})
