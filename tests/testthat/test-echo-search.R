summary_results <- function(...) {
  utils::modifyList(list(
    Message = 'Success', Version = 'CWA v2017-10-13 1325', QueryRows = '35', IndianCountryRows = '0',
    SVRows = '3', CVRows = '18', TotalPenalties = '$157,500', BadSystemIDs = NULL, QueryID = '546'
  ), list(...))
}
fac <- function(i) list(FacName = paste('Plant', i), RegistryID = sprintf('1100%08d', i), FacZip = '02840', FacLat = as.character(41 + i / 10), ObjectId = as.character(i))
run <- function(formatter, result, tidy = TRUE) formatter(list(result = result, params = list(tidy = tidy)))

test_that('a search summary is a one-row tibble with numbers for the counters', {
  tidy <- run(echo_tidy_summary_cwa, list(Results = summary_results()))
  expect_s3_class(tidy, 'tbl_df')
  expect_equal(nrow(tidy), 1L)
  expect_equal(tidy$QueryRows, 35)
  expect_equal(tidy$CVRows, 18)
  expect_equal(tidy$TotalPenalties, 157500)
  expect_identical(tidy$QueryID, '546')
  expect_identical(tidy$Message, 'Success')
  expect_true(is.na(tidy$BadSystemIDs))
  expect_null(attr(tidy, 'facilities'))
})

test_that('values in lists are pasted together, not dropped', {
  tidy <- run(echo_tidy_summary_cwa, list(Results = summary_results(BadSystemIDs = list('X1', 'X2'))))
  expect_identical(tidy$BadSystemIDs, 'X1, X2')
})

test_that('tablelist rows ride along as attr "facilities", typed; map output is kept', {
  result <- list(Results = c(summary_results(PageNo = '1'), list(Facilities = list(fac(1), fac(2)), MapOutput = list(Centroid = 'x'))))
  tidy <- run(echo_tidy_summary_cwa, result)
  expect_equal(tidy$PageNo, 1)
  rows <- attr(tidy, 'facilities')
  expect_equal(nrow(rows), 2L)
  expect_equal(rows$FacLat, c(41.1, 41.2))
  expect_identical(attr(tidy, 'map_output'), list(Centroid = 'x'))
  empty <- run(echo_tidy_summary_cwa, list(Results = c(summary_results(), list(Facilities = list()))))
  expect_equal(nrow(attr(empty, 'facilities')), 0L)
})

test_that('summary formatters pass through tidy = FALSE, strings, GeoJSON and bad input', {
  result <- list(Results = summary_results())
  for (formatter in list(echo_tidy_summary_cwa, echo_tidy_info_cwa)) {
    expect_identical(run(formatter, result, tidy = FALSE), result)
    expect_identical(run(formatter, '{"type":"FeatureCollection"}'), '{"type":"FeatureCollection"}')
    geojson <- list(type = 'FeatureCollection', features = list())
    expect_identical(run(formatter, geojson), geojson)
    for (bad in list('yes', NA, NULL, c(TRUE, FALSE))) {
      expect_error(formatter(list(result = result, params = list(tidy = bad))), 'TRUE or FALSE')
    }
    expect_error(run(formatter, list(Results = c(summary_results(), list(Facilities = 'oops')))), 'malformed')
  }
})

test_that('facility info is the matching facilities, with the query in attributes', {
  results <- c(
    summary_results(IconBaseURL = 'https://x/'),
    list(
      QueryParameters = list(list(QP = 'p_st', QV = 'RI'), list(QP = 'p_zip', QV = '02840')),
      Facilities = list(fac(1), fac(2), fac(3))
    )
  )
  tidy <- run(echo_tidy_info_cwa, list(Results = results))
  expect_equal(nrow(tidy), 3L)
  expect_equal(tidy$FacZip, rep('02840', 3))
  expect_equal(tidy$ObjectId, c('1', '2', '3'))
  expect_equal(attr(tidy, 'query')$query_id, '546')
  expect_equal(attr(tidy, 'summary')$QueryRows, 35)
  expect_equal(attr(tidy, 'parameters')$QP, c('p_st', 'p_zip'))
  expect_equal(attr(tidy, 'parameters')$QV, c('RI', '02840'))
})

test_that('a clustered response has no facilities: zero rows, summary and cluster kept', {
  results <- c(summary_results(ClusterRecords = '12'), list(ClusterOutput = list(Clusters = list())))
  expect_warning(tidy <- run(echo_tidy_info_cwa, list(Results = results)), 'clusters, not facilities.*35-row.*echo_qid_all')
  expect_equal(nrow(tidy), 0L)
  expect_equal(attr(tidy, 'summary')$QueryRows, 35)
  expect_identical(attr(tidy, 'cluster_output'), list(Clusters = list()))
  expect_null(attr(tidy, 'parameters'))
})

summary_body <- function(rows_key = NULL, rows = NULL) {
  body <- list(Results = summary_results())
  if (!is.null(rows_key)) body$Results[[rows_key]] <- rows
  body
}

test_that('search wrappers, POST twins and tidy = FALSE through mocked responses', {
  mock <- function(req) httr2::response_json(body = summary_body())
  tidy <- httr2::with_mocked_responses(mock, cwa_get_facilities(p_st = 'RI'))
  expect_s3_class(tidy, 'tbl_df')
  expect_equal(tidy$QueryRows, 35)
  expect_equal(httr2::with_mocked_responses(mock, cwa_get_facilities_post(list(p_st = 'RI')))$QueryID, '546')
  expect_equal(httr2::with_mocked_responses(mock, sdw_get_systems(p_st = 'RI'))$QueryID, '546')
  raw <- httr2::with_mocked_responses(mock, cwa_get_facilities(p_st = 'RI', tidy = FALSE))
  expect_equal(raw$Results$QueryRows, '35')
  info_mock <- function(req) httr2::response_json(body = summary_body('Facilities', list(fac(1))))
  info <- httr2::with_mocked_responses(info_mock, echo_get_facility_info(p_st = 'RI'))
  expect_equal(nrow(info), 1L)
  expect_equal(nrow(httr2::with_mocked_responses(info_mock, echo_get_facility_info_post(list(p_st = 'RI')))), 1L)
  epaechoverse_dry_run(TRUE)
  on.exit(epaechoverse_dry_run(FALSE))
  expect_s3_class(cwa_get_facilities(p_st = 'RI'), 'httr2_request')
})

test_that('echo_qid_all takes a summary tibble or a tibble of rows that carries its query', {
  pages <- list(list(fac(1), fac(2)), list(fac(3)))
  responder <- function(req) {
    query <- httr2::url_parse(req$url)$query
    number <- as.integer(query$pageno)
    records <- if (number <= length(pages)) pages[[number]] else list()
    httr2::response_json(body = list(Results = list(Message = 'Working', QueryRows = '3', QueryID = query$qid, PageNo = as.character(number), Facilities = records)))
  }
  summary <- run(echo_tidy_summary_cwa, list(Results = summary_results(QueryID = '99', QueryRows = '3')))
  all <- httr2::with_mocked_responses(responder, echo_qid_all(summary, 'cwa'))
  expect_equal(nrow(all), 3L)
  expect_equal(attr(all, 'query')$query_id, '99')
  rows <- run(echo_tidy_info_cwa, list(Results = c(summary_results(QueryID = '55'), list(Facilities = list(fac(1))))))
  again <- httr2::with_mocked_responses(responder, echo_qid_all(rows, 'cwa'))
  expect_equal(attr(again, 'query')$query_id, '55')
  expect_error(echo_qid_all(tibble::tibble(a = 1), 'cwa'), 'query ID')
  expect_error(echo_qid_all(tibble::tibble(QueryID = c('1', '2')), 'cwa'), 'query ID')
})

test_that('null record lists, a lone parameters object and mixed summary lists are handled', {
  null_rows <- run(echo_tidy_info_cwa, list(Results = c(summary_results(), list(Facilities = NULL, QueryParameters = NULL))))
  expect_equal(nrow(null_rows), 0L)
  lone <- run(echo_tidy_info_cwa, list(Results = c(summary_results(), list(
    Facilities = list(fac(1)), QueryParameters = list(QP = 'p_st', QV = 'RI')
  ))))
  expect_equal(attr(lone, 'parameters')$QP, 'p_st')
  odd <- run(echo_tidy_info_cwa, list(Results = c(summary_results(), list(
    Facilities = list(fac(1)), QueryParameters = list(list(QP = list(1, 2), QV = 'x'))
  ))))
  expect_equal(nrow(odd), 1L)
  expect_null(attr(odd, 'parameters'))
  mixed <- run(echo_tidy_summary_cwa, list(Results = summary_results(BadSystemIDs = list(1e6, 'a'))))
  expect_identical(mixed$BadSystemIDs, '1000000, a')
  expect_equal(nrow(run(echo_tidy_qid_cwa, list(Results = list(QueryRows = '0', QueryID = '1', Facilities = NULL)))), 0L)
})
