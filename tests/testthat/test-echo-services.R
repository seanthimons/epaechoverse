page_of <- function(key, records, ...) {
  list(Results = c(list(Message = 'Working', QueryRows = as.character(length(records)), QueryID = '5', PageNo = '1'), stats::setNames(list(records), key), list(...)))
}
run <- function(formatter, result) formatter(list(result = result, params = list(tidy = TRUE)))

test_that('the services table and the field map agree', {
  fields <- utils::read.csv(system.file('extdata', 'echo-fields.csv', package = 'epaechoverse'), colClasses = 'character')
  expect_named(fields, c('service', 'object', 'type', 'column'))
  expect_setequal(unique(fields$service), names(echo_search_services))
  expect_false(anyDuplicated(fields[c('service', 'object')]) > 0L)
  expect_true(all(fields$type %in% c('character', 'double', 'date')))
  expect_error(echo_field_types('nope'), 'must be one of')
})

test_that('field types are per service: a flag can be text in one and a number in another', {
  expect_equal(unname(echo_field_types('compscreen')['CurrSvFlag']), 'character')
  expect_equal(unname(echo_field_types('cwa')['CurrSvFlag']), 'double')
  expect_equal(unname(echo_field_types('case')['TscaFlag']), 'double')
  expect_equal(unname(echo_field_types('echo')['TscaFlag']), 'character')
  records <- list(list(CurrSvFlag = '1', FacName = 'A'))
  expect_identical(echo_tidy_qid_compscreen(list(result = page_of('Facilities', records), params = list(tidy = TRUE)))$CurrSvFlag, '1')
  expect_identical(echo_tidy_qid_cwa(list(result = page_of('Facilities', records), params = list(tidy = TRUE)))$CurrSvFlag, 1)
})

test_that('case pages use the Cases key, in qid pages and in case info', {
  records <- list(list(CaseNumber = 'RI-1', TscaFlag = '0', FedPenalty = '$1,000'))
  tidy <- run(echo_tidy_qid_case, page_of('Cases', records))
  expect_equal(nrow(tidy), 1L)
  expect_identical(tidy$CaseNumber, 'RI-1')
  expect_equal(tidy$TscaFlag, 0)
  info <- run(echo_tidy_info_case, page_of('Cases', records, JDCRows = '4', MapLocations = '12', QueryParameters = list(list(QP = 'p_state', QV = 'RI'))))
  expect_equal(nrow(info), 1L)
  expect_equal(attr(info, 'summary')$MapLocations, 12)
  expect_equal(attr(info, 'summary')$JDCRows, 4)
  expect_false('Cases' %in% names(attr(info, 'summary')))
  expect_equal(attr(info, 'query')$query_id, '5')
})

test_that('a key ECHO sends twice is kept once, and a disagreeing repeat warns', {
  same <- list(Results = list(QueryRows = '681', VRows = '94', VRows = '94', SNCRows = '16', QueryID = '9'))
  tidy <- run(echo_tidy_summary_compscreen, same)
  expect_named(tidy, c('QueryRows', 'VRows', 'SNCRows', 'QueryID'))
  expect_equal(tidy$VRows, 94)
  differ <- list(Results = list(QueryRows = '681', VRows = '94', VRows = '95', QueryID = '9'))
  expect_warning(tidy <- run(echo_tidy_summary_compscreen, differ), 'VRows.*more than once')
  expect_equal(tidy$VRows, 94)
})

test_that('the air monitoring searches return rows with their column list', {
  results <- list(
    Message = 'Success', QueryRows = '2', QueryID = '960',
    QueryParameters = list(list(QP = 'p_st', QV = 'RI')),
    Columns = list(list(columnID = '1', fieldName = 'AQS_SITE_CODE', tagName = 'AqsSiteCode')),
    Facilities = list(list(ObjectId = '1', AqsSiteCode = '440030002'), list(ObjectId = '2', AqsSiteCode = '440070012'))
  )
  tidy <- run(echo_tidy_info_ecattaqs, list(Results = results))
  expect_equal(nrow(tidy), 2L)
  expect_identical(tidy$AqsSiteCode, c('440030002', '440070012'))
  expect_equal(attr(tidy, 'columns')$tagName, 'AqsSiteCode')
  expect_equal(attr(tidy, 'parameters')$QV, 'RI')
  expect_equal(attr(tidy, 'query')$query_id, '960')
  expect_false('Columns' %in% names(attr(tidy, 'summary')))
})

test_that('every formatter a generated function looks up exists', {
  ns <- asNamespace('epaechoverse')
  wanted <- unique(unlist(lapply(ls(ns, pattern = sprintf('^(%s)_', paste(c(names(echo_search_services), 'wplt', 'dfr', 'caa', 'eff'), collapse = '|'))), function(name) {
    fun <- get(name, ns)
    if (!is.function(fun)) return(character())
    text <- paste(deparse(body(fun)), collapse = ' ')
    regmatches(text, gregexpr('echo_tidy_((qid|summary|info|report|download)_[a-z_]+|nested)', text))[[1L]]
  })))
  expect_gt(length(wanted), 20L)
  for (name in wanted) {
    expect_true(is.function(get0(name, ns)), info = name)
  }
  for (key in unique(echo_report_routes$key)) {
    expect_true(echo_report_formatter(key) %in% wanted, info = key)
  }
  expect_true('echo_tidy_nested' %in% wanted)
  for (name in c('dfr_get_dfr', 'caa_get_caapr', 'eff_get_effluent_chart')) {
    expect_match(paste(deparse(body(get(name, ns))), collapse = ' '), 'echo_tidy_nested', info = name)
  }
  # the map and spatial-metadata routes stay as they are (mapping is on hold)
  for (name in c('dfr_get_map', 'caa_get_map', 'caa_get_spatial_metadata')) {
    if (exists(name, ns)) {
      expect_false(grepl('echo_tidy_nested', paste(deparse(body(get(name, ns))), collapse = ' ')), info = name)
    }
  }
  # each route kind a service has is wired to its own service's shim
  for (service in names(echo_search_services)) {
    expect_true(sprintf('echo_tidy_qid_%s', service) %in% wanted, info = service)
    entry <- echo_search_services[[service]]
    expect_equal(sprintf('echo_tidy_summary_%s', service) %in% wanted, !is.na(entry$summary), info = service)
    expect_equal(sprintf('echo_tidy_info_%s', service) %in% wanted, !is.na(entry$info), info = service)
    expect_true(sprintf('echo_tidy_download_%s', service) %in% wanted, info = service)
  }
})

test_that('echo_qid_all pages a case or compscreen search and takes an info tibble', {
  records <- list(list(CaseNumber = 'A', TscaFlag = '1'), list(CaseNumber = 'B', TscaFlag = '0'))
  responder <- function(req) {
    query <- httr2::url_parse(req$url)$query
    page <- if (identical(query$pageno, '1')) page_of('Cases', records) else page_of('Cases', list())
    page$Results$QueryRows <- '2'
    httr2::response_json(body = page)
  }
  all <- httr2::with_mocked_responses(responder, echo_qid_all('5', 'case'))
  expect_equal(nrow(all), 2L)
  expect_equal(all$TscaFlag, c(1, 0))
  info <- run(echo_tidy_info_case, page_of('Cases', records))
  again <- httr2::with_mocked_responses(responder, echo_qid_all(info, 'case'))
  expect_equal(nrow(again), 2L)
  # a one-row rows tibble with a QueryID column uses its query attribute
  one <- tibble::tibble(QueryID = 'wrong')
  attr(one, 'query') <- list(query_id = '5')
  expect_equal(nrow(httr2::with_mocked_responses(responder, echo_qid_all(one, 'case'))), 2L)
})

test_that('search records accept empty arrays and arrays of plain values; lookups stay strict', {
  records <- list(
    list(FacName = 'A', CaseDefendants = list(), AirIDs = list('X1', 2)),
    list(FacName = 'B', CaseDefendants = list(), AirIDs = list())
  )
  tidy <- echo_qid_tibble(records, c(FacName = 'character'))
  expect_identical(tidy$CaseDefendants, c(NA_character_, NA_character_))
  expect_identical(tidy$AirIDs, c('X1, 2', NA))
  # objects, even inside an array, are still an error
  expect_error(echo_qid_tibble(list(list(A = list(list(b = 1)))), c(A = 'character')), 'nested value')
  expect_error(echo_qid_tibble(list(list(A = list(b = 1))), c(A = 'character')), 'nested value')
  expect_error(echo_text_columns(list(list(A = list(1, 2)))), 'nested value')
})

test_that('nulls in arrays, a query attribute without an ID, and a malformed Results are handled', {
  tidy <- echo_qid_tibble(list(list(AirIDs = list(NULL, 'X1'), B = list(NULL))), c(B = 'character'))
  expect_identical(tidy$AirIDs, 'X1')
  expect_identical(tidy$B, NA_character_)
  noid <- tibble::tibble(QueryID = '5')
  attr(noid, 'query') <- list(query_rows = 2)
  responder <- function(req) httr2::response_json(body = page_of('Cases', list()))
  expect_error(httr2::with_mocked_responses(responder, echo_qid_all(noid, 'case')), NA)
  expect_error(run(echo_tidy_summary_cwa, list(Results = list('a', 'b'))), 'without names')
  expect_error(run(echo_tidy_info_cwa, list(Results = list('a', 'b'))), 'without names')
})

test_that('the emission screener has rows under its own key, a QueryId, and sample-frozen types', {
  records <- list(list(SearchYear = '2020', FacLat = '41.4', FacZip = '02836', CaaEvaluationCount = '2', FacilityMonitorDistanceKm = '.6'))
  results <- list(Message = 'Success', QueryId = '934', QueryRows = '1', QueryRowsPage = '1', Columns = list(list(columnID = '1', fieldName = 'X', tagName = 'Y')))
  info <- run(echo_tidy_info_ecattems, list(Results = c(results, list(FacilityAggregatedEmissions = records))))
  expect_identical(info$SearchYear, '2020')
  expect_identical(info$FacZip, '02836')
  expect_equal(info$FacLat, 41.4)
  expect_equal(info$FacilityMonitorDistanceKm, 0.6)
  expect_equal(attr(info, 'query')$query_id, '934')
  expect_equal(attr(info, 'summary')$QueryId, '934')
  expect_equal(attr(info, 'columns')$tagName, 'Y')
  page <- run(echo_tidy_qid_ecattems, page_of('FacilityAggregatedEmissions', records))
  expect_equal(page$CaaEvaluationCount, 2)
  expect_equal(echo_query_id(list(Results = list(QueryId = '7'))), '7')
})

test_that('a flat report route is an all-text tibble with its summary in an attribute', {
  results <- list(
    Message = 'Success', QueryRows = '2', PageCount = '1', PageNo = '1', StartRec = '1', EndRec = '2',
    Facilities = list(
      list(ExternalPermitNmbr = 'RI0100005', DmrPounds = '10.50', City = 'A\r\nB', Blank = ''),
      list(ExternalPermitNmbr = 'RI0100013', DmrPounds = NULL, City = 'C', Blank = '')
    )
  )
  tidy <- run(echo_tidy_report_facilities, list(Results = results))
  expect_s3_class(tidy, 'tbl_df')
  expect_identical(tidy$DmrPounds, c('10.50', NA))
  expect_identical(tidy$City, c('A\nB', 'C'))
  expect_identical(tidy$Blank, c(NA_character_, NA_character_))
  expect_equal(attr(tidy, 'summary')$QueryRows, 2)
  expect_equal(attr(tidy, 'summary')$EndRec, 2)
  expect_false('Facilities' %in% names(attr(tidy, 'summary')))
  none <- results
  none$Facilities <- list()
  empty <- run(echo_tidy_report_facilities, list(Results = none))
  expect_equal(nrow(empty), 0L)
  expect_error(run(echo_tidy_report_chemicals, list(Results = results)), 'no `Chemicals`')
  expect_error(run(echo_tidy_report_facilities, list(Results = c(results[names(results) != 'Facilities'], list(Facilities = 'x')))), 'not a list of records')
  expect_identical(echo_tidy_report_facilities(list(result = list(Results = results), params = list(tidy = FALSE)))$Results, results)
})

test_that('a nested report becomes a list of tibbles and never errors on its shape', {
  results <- list(
    Message = 'Success',
    ComplianceSummary = list(
      ProgramDates = list(list(Program = 'CWA', StartDate = '01/01/2020', EndDate = '')),
      Source = list(list(Statute = 'CWA', SourceID = 'RI1', Detail = list(list(a = 1)), Num = 5)),
      Header = list(Qtr1Start = '10/01/2020', Count = 3L),
      Empty = list(),
      Tags = list('x', 'y', NULL)
    )
  )
  tidy <- echo_tidy_nested(list(result = list(Results = results), params = list(tidy = TRUE)))
  expect_named(tidy, c('summary', 'ComplianceSummary.ProgramDates', 'ComplianceSummary.Source', 'ComplianceSummary.Header', 'ComplianceSummary.Empty', 'ComplianceSummary.Tags'))
  expect_identical(tidy$summary$Message, 'Success')
  expect_identical(tidy$ComplianceSummary.ProgramDates$EndDate, NA_character_)
  expect_identical(tidy$ComplianceSummary.Source$Num, '5')
  expect_type(tidy$ComplianceSummary.Source$Detail, 'list')
  expect_identical(tidy$ComplianceSummary.Header$Count, '3')
  expect_equal(nrow(tidy$ComplianceSummary.Empty), 0L)
  expect_identical(tidy$ComplianceSummary.Tags$value, c('x', 'y', NA))
  expect_identical(echo_tidy_nested(list(result = list(Results = list()), params = list(tidy = TRUE))), list())
  expect_identical(echo_tidy_nested(list(result = list(Results = results), params = list(tidy = FALSE)))$Results, results)
  expect_identical(echo_tidy_nested(list(result = 'a,b', params = list(tidy = TRUE))), 'a,b')
  # an unnamed Results is passed through; arrays of arrays and mixed arrays are kept; repeated keys survive
  odd <- list(result = list(Results = list('a', 'b')), params = list(tidy = TRUE))
  expect_identical(echo_tidy_nested(odd), odd$result)
  kept <- echo_tidy_nested(list(result = list(Results = list(
    Coords = list(list(1, 2), list(3, 4)), Mixed = list(list(a = 1), 'x'),
    Part = list(list(k = '1')), Part = list(list(k = '2'))
  )), params = list(tidy = TRUE)))
  expect_type(kept$Coords$value, 'list')
  expect_type(kept$Mixed$value, 'list')
  expect_named(kept, c('Coords', 'Mixed', 'Part', 'Part_1'))
  expect_identical(kept$Part_1$k, '2')
})

test_that('CSV downloads are typed like pages, with database column headers renamed', {
  csv <- function(...) list(result = paste0(..., collapse = ''), params = list(tidy = TRUE))
  tidy <- echo_tidy_download(csv('"CWPName","FacLat","SubmittedDate"\n"A",41.7,03/04/2020\n"B",,\n'), 'cwa')
  expect_s3_class(tidy, 'tbl_df')
  expect_equal(tidy$FacLat, c(41.7, NA))
  expect_s3_class(tidy$SubmittedDate, 'Date')
  # a database-column header is renamed to its field, which then gets the field's type
  snake <- echo_tidy_download(csv('facility_case_name,curr_sv_flag\nX,Y\n'), 'compscreen')
  expect_named(snake, c('FacilityCaseName', 'CurrSvFlag'))
  expect_identical(snake$CurrSvFlag, 'Y')
  # an unknown header stays text under its own name; empty and non-CSV results pass
  expect_identical(echo_tidy_download(csv('Mystery\n007\n'), 'cwa')$Mystery, '007')
  expect_equal(nrow(echo_tidy_download(csv(''), 'cwa')), 0L)
  expect_equal(nrow(echo_tidy_download(csv('CWPName,FacLat\n'), 'cwa')), 0L)
  expect_identical(echo_tidy_download(list(result = '"a"\n1', params = list(tidy = FALSE)), 'cwa'), '"a"\n1')
  expect_identical(echo_tidy_download(csv('x'), 'cwa')$x, character())
  # a rename that would collide is skipped alone: CWPName stays, the other is renamed
  clash <- echo_tidy_download(csv('cwp_name,source_id,CWPName\nA,B,C\n'), 'cwa')
  expect_named(clash, c('cwp_name', 'SourceID', 'CWPName'))
  expect_error(echo_tidy_download(csv('a,b\n1\n'), 'cwa'), 'different numbers')
  expect_error(echo_tidy_download(list(result = 'a', params = list(tidy = NA)), 'cwa'), 'TRUE or FALSE')
})
