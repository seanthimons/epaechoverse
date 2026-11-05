qid_page <- function(records, key = 'Facilities', rows = length(records), page_no = 1, qid = '77') {
  results <- list(Message = 'Working', QueryRows = as.character(rows), QueryID = qid, PageNo = as.character(page_no))
  results[[key]] <- records
  list(Results = results)
}
facility <- function(i) list(FacName = paste('Plant', i), RegistryID = sprintf('1100%08d', i), FacZip = '02840', FacLat = as.character(41 + i / 10))

record_types <- c(FacZip = 'character', FacLat = 'double', SDWDateLastIea = 'date', CWPTotalPenalties = 'double')

test_that('field types come from the metadata map', {
  types <- echo_field_types('echo')
  expect_gt(length(types), 150L)
  expect_true(all(types %in% c('character', 'double', 'date')))
  expect_equal(unname(types[c('FacLat', 'FacZip', 'RegistryID', 'MaxScore')]), c('double', 'character', 'character', 'double'))
  expect_equal(unname(echo_field_types('sdw')['SDWDateLastIea']), 'date')
})

test_that('records are typed: numbers, dates and text; blanks are NA; zip codes keep zeros', {
  records <- list(
    list(FacName = 'A', FacZip = '02840', FacLat = '41.5', SDWDateLastIea = '11/08/2013', Unmapped = '7', CWPTotalPenalties = '$1,250'),
    list(FacName = 'B', FacZip = '90210', FacLat = NULL, SDWDateLastIea = '', Unmapped = 'x', CWPTotalPenalties = '300')
  )
  tidy <- echo_qid_tibble(records, record_types)
  expect_s3_class(tidy, 'tbl_df')
  expect_equal(tidy$FacZip, c('02840', '90210'))
  expect_equal(tidy$FacLat, c(41.5, NA))
  expect_equal(tidy$SDWDateLastIea, as.Date(c('2013-11-08', NA)))
  expect_equal(tidy$CWPTotalPenalties, c(1250, 300))
  expect_equal(tidy$Unmapped, c('7', 'x'))
  expect_equal(nrow(echo_qid_tibble(list(), echo_field_types('cwa'))), 0L)
})

test_that('a column with any value that does not convert stays text, with one warning', {
  records <- list(list(FacLat = '41.5', SDWDateLastIea = '2013-11-08'), list(FacLat = 'n/a', SDWDateLastIea = '11/08/2013'))
  expect_warning(tidy <- echo_qid_tibble(records, record_types), 'FacLat.*n/a.*SDWDateLastIea.*2013-11-08')
  expect_equal(tidy$FacLat, c('41.5', 'n/a'))
  expect_equal(tidy$SDWDateLastIea, c('2013-11-08', '11/08/2013'))
})

test_that('mapped numbers named like identifiers stay text', {
  tidy <- echo_qid_tibble(list(list(PopulationServedCount = '12', SomeCode = '0042')), types = c(PopulationServedCount = 'double', SomeCode = 'double'))
  expect_equal(tidy$PopulationServedCount, 12)
  expect_equal(tidy$SomeCode, '0042')
})

test_that('echo_tidy_qid types a page, keeps the counters, and passes other results through', {
  page <- qid_page(list(facility(1), facility(2)), rows = 5, page_no = 2)
  tidy <- echo_tidy_qid(list(result = page, params = list(tidy = TRUE)), 'cwa')
  expect_equal(nrow(tidy), 2L)
  expect_equal(attr(tidy, 'query'), list(query_id = '77', query_rows = 5, page_no = 2))
  sdw <- echo_tidy_qid(list(result = qid_page(list(list(PWSId = 'RI1', PopulationServedCount = '9')), key = 'WaterSystems'), params = list(tidy = TRUE)), 'sdw')
  expect_equal(sdw$PopulationServedCount, 9)
  expect_identical(echo_tidy_qid(list(result = page, params = list(tidy = FALSE)), 'cwa'), page)
  expect_identical(echo_tidy_qid(list(result = '<xml/>', params = list(tidy = TRUE)), 'cwa'), '<xml/>')
  expect_equal(nrow(echo_tidy_qid(list(result = qid_page(list(), rows = 0), params = list(tidy = TRUE)), 'cwa')), 0L)
  expect_error(echo_tidy_qid(list(result = list(Results = list(Message = 'x')), params = list(tidy = TRUE)), 'cwa'), 'tidy = FALSE')
  for (tidy in list('yes', NA, NULL, c(TRUE, FALSE))) {
    expect_error(echo_tidy_qid(list(result = page, params = list(tidy = tidy)), 'cwa'), 'TRUE or FALSE')
  }
})

# A mocked service: `pages` is a list of record lists, served by the pageno query.
mock_service <- function(pages, rows = sum(lengths(pages)), key = 'Facilities') {
  seen <- new.env()
  seen$requests <- list()
  list(
    seen = seen,
    responder = function(req) {
      query <- httr2::url_parse(req$url)$query
      if (is.null(query$pageno) && !is.null(req$body)) {
        # the POST twins send their parameters as a form body
        data <- req$body$data
        query <- if (is.list(data)) data else as.list(httr2::url_query_parse(if (is.raw(data)) rawToChar(data) else data))
      }
      seen$requests[[length(seen$requests) + 1L]] <- query
      number <- as.integer(query$pageno)
      records <- if (number <= length(pages)) pages[[number]] else list()
      httr2::response_json(body = qid_page(records, key = key, rows = rows, page_no = number, qid = query$qid))
    }
  )
}

test_that('wrappers return a typed page by default and the raw list with tidy = FALSE', {
  service <- mock_service(list(list(facility(1), facility(2))))
  tidy <- httr2::with_mocked_responses(service$responder, cwa_get_qid(qid = '77'))
  expect_s3_class(tidy, 'tbl_df')
  expect_equal(service$seen$requests[[1L]]$pageno, '1')
  raw <- httr2::with_mocked_responses(service$responder, cwa_get_qid(qid = '77', tidy = FALSE))
  expect_equal(raw$Results$Facilities[[1L]]$FacName, 'Plant 1')
  post <- httr2::with_mocked_responses(service$responder, cwa_get_qid_post(list(qid = '77', pageno = 1)))
  expect_s3_class(post, 'tbl_df')
  expect_equal(as.character(service$seen$requests[[length(service$seen$requests)]]$pageno), '1')
  expect_equal(as.character(service$seen$requests[[length(service$seen$requests)]]$qid), '77')
  echoverse_dry_run(TRUE)
  on.exit(echoverse_dry_run(FALSE))
  expect_s3_class(cwa_get_qid(qid = '77'), 'httr2_request')
})

test_that('echo_qid_all pages until the reported rows are in, typed together', {
  service <- mock_service(list(list(facility(1), facility(2)), list(facility(3), facility(4)), list(facility(5))))
  all <- httr2::with_mocked_responses(service$responder, echo_qid_all('77', 'cwa'))
  expect_equal(nrow(all), 5L)
  expect_equal(all$FacLat, 41 + (1:5) / 10)
  expect_length(service$seen$requests, 3L)
  expect_equal(vapply(service$seen$requests, function(q) q$pageno, ''), c('1', '2', '3'))
  expect_equal(attr(all, 'query'), list(query_id = '77', query_rows = 5, rows = 5L, pages = 3L))
})

test_that('echo_qid_all accepts a search result, forwards options, and stops at an empty page', {
  service <- mock_service(list(list(facility(1)), list(facility(2))), rows = 99)
  search <- list(Results = list(QueryID = '88', QueryRows = '99'))
  all <- httr2::with_mocked_responses(service$responder, echo_qid_all(search, 'sdw', qcolumns = '1,2'))
  expect_equal(nrow(all), 2L)
  expect_equal(service$seen$requests[[1L]]$qid, '88')
  expect_equal(service$seen$requests[[1L]]$qcolumns, '1,2')
  expect_length(service$seen$requests, 3L)
})

test_that('echo_qid_all warns with the rows left when max_pages stops it', {
  service <- mock_service(list(list(facility(1)), list(facility(2)), list(facility(3))), rows = 3)
  expect_warning(
    all <- httr2::with_mocked_responses(service$responder, echo_qid_all('77', 'rcra', max_pages = 2)),
    'Stopped after 2 page.*2 of 3 rows'
  )
  expect_equal(nrow(all), 2L)
  expect_length(service$seen$requests, 2L)
})

test_that('pages with different fields are bound with NA and typed together', {
  page1 <- list(list(FacName = 'A', FacLat = '41.5'), list(FacName = 'B', FacLat = '42'))
  page2 <- list(list(FacName = 'C', FacLat = '43', FacZip = '02840'))
  service <- mock_service(list(page1, page2))
  all <- httr2::with_mocked_responses(service$responder, echo_qid_all('77', 'cwa'))
  expect_equal(all$FacLat, c(41.5, 42, 43))
  expect_equal(all$FacZip, c(NA, NA, '02840'))
  expect_equal(all$FacName, c('A', 'B', 'C'))
})

test_that('echo_qid_all copes with no QueryRows, a numeric qid and a lone record object', {
  responder <- function(req) {
    number <- as.integer(httr2::url_parse(req$url)$query$pageno)
    records <- if (number == 1L) list(facility(1)) else list()
    httr2::response_json(body = list(Results = list(Message = 'Working', Facilities = records)))
  }
  all <- httr2::with_mocked_responses(responder, echo_qid_all(77, 'cwa'))
  expect_equal(nrow(all), 1L)
  expect_true(is.na(attr(all, 'query')$query_rows))
  expect_warning(
    httr2::with_mocked_responses(responder, echo_qid_all('77', 'cwa', max_pages = 1)),
    'Stopped after 1 page\\(s\\) with 1 rows'
  )
  lone <- list(Results = list(Facilities = facility(1)))
  expect_equal(nrow(echo_tidy_qid(list(result = lone, params = list(tidy = TRUE)), 'cwa')), 1L)
})

test_that('echo_qid_all checks its inputs and unexpected pages', {
  expect_error(echo_qid_all(NULL, 'cwa'), 'query ID')
  expect_error(echo_qid_all(c('1', '2'), 'cwa'), 'query ID')
  expect_error(echo_qid_all('77'), '`service` is required')
  expect_error(echo_qid_all(list(Results = list()), 'cwa'), 'query ID')
  expect_error(echo_qid_all('77', 'nope'))
  expect_error(echo_qid_all('77', 'cwa', max_pages = 0), 'max_pages')
  expect_error(echo_qid_all('77', 'cwa', pageno = 3), 'set by echo_qid_all')
  expect_error(echo_qid_all('77', 'cwa', output = 'XML'), 'set by echo_qid_all')
  expect_error(echo_qid_all('77', 'cwa', max_pages = 2, 'unnamed'), 'named')
  bad <- function(req) httr2::response_json(body = list(Results = list(Message = 'x', QueryRows = '1')))
  expect_error(httr2::with_mocked_responses(bad, echo_qid_all('77', 'cwa')), 'Unexpected ECHO search page')
  echoverse_dry_run(TRUE)
  on.exit(echoverse_dry_run(FALSE))
  expect_error(echo_qid_all('77', 'cwa'), 'dry-run')
})
