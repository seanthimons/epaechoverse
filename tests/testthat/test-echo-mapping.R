map_fixture <- function() list(MapOutput = list(
  QueryID = '123', IconBaseURL = 'https://example.test/icons/',
  MapData = list(
    list(LAT = '41.5', LON = '-71.2', TYPE = 'Facility', PUV = '000123', NAME = 'Plant'),
    list(LAT = '42', LON = '-72', TYPE = 'ZIP', PUV = '20', NAME = 'Cluster')
  )
))
map_mock <- function(value) function(req) httr2::response_json(body = value)

test_that('map adapter preserves layers, identifiers, clusters and metadata', {
  x <- map_fixture()
  x$MapOutput$MapDataFacilities <- list(list(LAT = '40', LON = '-70', PUV = '000456', EXTRA = list(a = 'b')))
  result <- echo_map_format(x, '/x.get_map', 'tidy')
  expect_s3_class(result, 'tbl_df')
  expect_type(result$LAT, 'double')
  expect_equal(result$PUV, c('000123', '20', '000456'))
  expect_equal(result$.layer, c('MapData', 'MapData', 'MapDataFacilities'))
  expect_equal(result$TYPE, c('Facility', 'ZIP', NA))
  expect_equal(result$EXTRA[[3]], list(a = 'b'))
  expect_equal(attr(result, 'map')$MapOutput$QueryID, '123')
  expect_equal(attr(result, 'crs'), 'EPSG:4326')
})

test_that('bad and absent coordinates retain rows with explicit diagnostics', {
  x <- map_fixture()
  x$MapOutput$MapData <- list(
    list(LAT = 'bad', LON = '-71'), list(LAT = '91', LON = '181'),
    list(LAT = '', LON = NULL), list(NAME = 'No location'),
    list(LAT = '0', LON = '0'), list(LAT = 'Inf', LON = 'NaN')
  )
  expect_warning(result <- echo_map_format(x, '/x.get_map', 'tidy'), 'Invalid map coordinates')
  expect_equal(nrow(result), 6L)
  expect_equal(result$LAT, c(NA, NA, NA, NA, 0, NA))
  expect_equal(result$LON, c(-71, NA, NA, NA, 0, NA))
  expect_equal(attr(result, 'coordinate_problems')$LAT$values, c('bad', '91', 'Inf'))
  expect_warning(geo <- echo_map_format(x, '/x.get_map', 'geojson'), 'Invalid map coordinates')
  parsed <- jsonlite::fromJSON(geo, simplifyVector = FALSE)
  expect_null(parsed$features[[1]]$geometry)
  expect_null(parsed$features[[4]]$geometry)
  expect_equal(unlist(parsed$features[[5]]$geometry$coordinates), c(0, 0))
})

test_that('GeoJSON is a FeatureCollection with arrays, metadata and numeric coordinates', {
  x <- map_fixture()
  x$MapOutput$MapData <- x$MapOutput$MapData[1]
  geo <- echo_map_format(x, '/x.get_map', 'geojson')
  expect_true(jsonlite::validate(geo))
  parsed <- jsonlite::fromJSON(geo, simplifyVector = FALSE)
  expect_identical(parsed$type, 'FeatureCollection')
  expect_length(parsed$features, 1)
  expect_equal(parsed$features[[1]]$geometry$type, 'Point')
  expect_equal(unlist(parsed$features[[1]]$geometry$coordinates), c(-71.2, 41.5))
  expect_equal(parsed$features[[1]]$properties$PUV, '000123')
  expect_equal(parsed$echo$map$MapOutput$QueryID, '123')
  x$MapOutput$MapData <- list()
  empty <- echo_map_format(x, '/x.get_map', 'tidy')
  expect_equal(nrow(empty), 0)
  expect_type(empty$LAT, 'double')
  expect_type(empty$LON, 'double')
  geo <- echo_map_format(x, '/x.get_map', 'geojson')
  expect_match(as.character(geo), '"features":\\[\\]')
})

test_that('report adapters keep neighbors, center and coordinate provenance', {
  root <- map_fixture()
  root$MapOutput$CenterLatitude <- '41.5'
  root$Message <- 'Success'
  root$QueryParameters <- list(list(QP = 'p_site_code', QV = '001'))
  result <- echo_map_format(list(Results = root), '/dfr_rest_services.get_map', 'tidy')
  expect_equal(nrow(result), 2)
  expect_equal(attr(result, 'map')$MapOutput$CenterLatitude, '41.5')
  expect_equal(attr(result, 'map')$QueryParameters, root$QueryParameters)
  meta <- list(Results = list(Message = 'Success', SpatialMetadata = list(
    RegistryID = '0001', Latitude83 = '41.5', CalculatedAccuracy = '30 Meters'
  )))
  result <- echo_map_format(meta, '/dfr_rest_services.get_spatial_metadata', 'tidy')
  expect_equal(result$RegistryID, '0001')
  expect_equal(result$Latitude83, '41.5')
  expect_null(attr(result, 'crs'))
})

test_that('unexpected envelopes and record shapes fail with raw escape hatch', {
  expect_error(echo_map_format(list(Results = list()), '/x.get_map', 'tidy'), 'Missing MapOutput')
  expect_error(echo_map_format('text', '/x.get_map', 'tidy'), 'JSON map')
  expect_error(echo_map_format(list(MapOutput = list(Other = 1)), '/x.get_map', 'tidy'), 'Missing map record')
  expect_error(echo_map_format(list(MapOutput = list(MapData = list(NAME = 'wrong'))), '/x.get_map', 'tidy'), 'record array')
  expect_error(echo_map_records(list(list(1))), 'Malformed')
})

test_that('format and API output are checked before HTTP work, including dry runs', {
  for (bad in list(NULL, NA_character_, character(), c('tidy', 'raw'), TRUE, 'other')) {
    expect_error(cwa_get_map(qid = '123', format = bad), '`format`')
  }
  expect_error(cwa_get_map(qid = '123', output = 'XML'), 'require output')
  expect_error(cwa_get_map_post(list(qid = '123', output = 'JSONP')), 'require output')
  expect_error(dfr_get_spatial_metadata(p_id = '001', format = 'geojson'), '`format`')
  echoverse_dry_run(TRUE)
  on.exit(echoverse_dry_run(FALSE))
  req <- cwa_get_map(qid = '123', format = 'geojson')
  expect_s3_class(req, 'httr2_request')
  expect_false(grepl('format=', req$url, fixed = TRUE))
  expect_s3_class(cwa_get_map(qid = '123', output = 'XML', format = 'raw'), 'httr2_request')
})

test_that('every map wrapper uses the hook and QID maps no longer require p_id', {
  services <- c('air', 'cwa', 'rcra', 'echo', 'case', 'ecattams')
  for (service in services) {
    get <- base::get(paste0(service, '_get_map'), mode = 'function')
    post <- base::get(paste0(service, '_get_map_post'), mode = 'function')
    result <- httr2::with_mocked_responses(map_mock(map_fixture()), get(qid = '123'))
    expect_s3_class(result, 'tbl_df')
    result <- httr2::with_mocked_responses(map_mock(map_fixture()), post(list(qid = '123'), format = 'geojson'))
    expect_equal(jsonlite::fromJSON(result)$type, 'FeatureCollection')
    expect_equal(httr2::with_mocked_responses(map_mock(map_fixture()), get(qid = '123', format = 'raw')), map_fixture())
  }
  for (service in c('dfr', 'caa')) {
    for (suffix in c('', '_post')) {
      fun <- base::get(paste0(service, '_get_map', suffix), mode = 'function')
      args <- if (suffix == '') list(p_id = '001') else list(body = list(p_id = '001'))
      expect_s3_class(httr2::with_mocked_responses(map_mock(list(Results = map_fixture())), do.call(fun, args)), 'tbl_df')
      fun <- base::get(paste0(service, '_get_spatial_metadata', suffix), mode = 'function')
      meta <- list(Results = list(SpatialMetadata = list(RegistryID = '001')))
      expect_equal(httr2::with_mocked_responses(map_mock(meta), do.call(fun, args))$RegistryID, '001')
    }
  }
  for (service in c('ecattams', 'ecattaqs')) {
    for (suffix in c('', '_post')) {
      fun <- base::get(paste0(service, '_get_rpt_map', suffix), mode = 'function')
      args <- if (suffix == '') list(p_site_code = '001') else list(body = list(p_site_code = '001'))
      expect_s3_class(httr2::with_mocked_responses(map_mock(list(Results = map_fixture())), do.call(fun, args)), 'tbl_df')
    }
  }
})

test_that('API errors are raised before conversion and raw preserves non-JSON', {
  error <- list(Results = list(Error = list(ErrorMessage = 'Expired query')))
  expect_error(httr2::with_mocked_responses(map_mock(error), cwa_get_map(qid = '123')), 'Expired query', class = 'echo_error')
  xml <- function(req) httr2::response(200, headers = list('content-type' = 'application/xml'), body = charToRaw('<map/>'))
  expect_equal(httr2::with_mocked_responses(xml, cwa_get_map(qid = '123', output = 'XML', format = 'raw')), charToRaw('<map/>'))
})

test_that('sf produces EPSG:4326 points, empty geometries, and preserves metadata', {
  skip_if_not_installed('sf')
  x <- map_fixture()
  x$MapOutput$MapData[[2]]$LAT <- NULL
  result <- echo_map_format(x, '/x.get_map', 'sf')
  expect_s3_class(result, 'sf')
  expect_equal(sf::st_crs(result)$epsg, 4326)
  expect_equal(unname(sf::st_coordinates(result)[1, ]), c(-71.2, 41.5))
  expect_equal(sf::st_is_empty(result), c(FALSE, TRUE))
  expect_equal(result$PUV, c('000123', '20'))
  expect_equal(attr(result, 'map')$MapOutput$QueryID, '123')
  x$MapOutput$MapData <- list()
  empty <- echo_map_format(x, '/x.get_map', 'sf')
  expect_s3_class(empty, 'sf')
  expect_equal(nrow(empty), 0)
  expect_equal(sf::st_crs(empty)$epsg, 4326)
  expect_s3_class(httr2::with_mocked_responses(map_mock(map_fixture()), cwa_get_map(qid = '123', format = 'sf')), 'sf')
})

test_that('missing optional sf dependency gives an actionable error', {
  if (requireNamespace('sf', quietly = TRUE)) skip('sf is installed')
  expect_error(cwa_get_map(qid = '123', format = 'sf'), 'Install the optional `sf`')
})


test_that('POST maps keep form encoding and client formats stay off the wire', {
  check <- function(req) {
    expect_identical(req$method, 'POST')
    expect_identical(req$body$content_type, 'application/x-www-form-urlencoded')
    expect_match(req$body$data, 'qid=123', fixed = TRUE)
    expect_false(grepl('format=', req$body$data, fixed = TRUE))
    httr2::response_json(body = map_fixture())
  }
  expect_s3_class(httr2::with_mocked_responses(check, cwa_get_map_post(list(qid = '123'))), 'tbl_df')
})


test_that('map records are not capped and sibling Results metadata survives', {
  x <- map_fixture()
  x$MapOutput$MapData <- rep(x$MapOutput$MapData[1], 719)
  x$Results <- list(Facilities = list(list(FacName = 'Plant')))
  result <- echo_map_format(x, '/x.get_map', 'tidy')
  expect_equal(nrow(result), 719L)
  expect_equal(attr(result, 'map')$Results, x$Results)
})
