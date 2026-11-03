# The same three violation rows as the service sends them in each format.
json_rows <- list(
  list(
    compl_per_begin_date = '1986-09-01 00:00:00', epa_region = '06', pwsid = 'OK2005541',
    population_served_count = 25L, rtc_date = NULL, state_mcl = NULL, viol_measure = 41.5,
    originator_code = 'S'
  ),
  list(
    compl_per_begin_date = '2016-04-01 00:00:00', epa_region = '04', pwsid = 'TN0000845',
    population_served_count = 3917L, rtc_date = '2016-12-31 00:00:00', state_mcl = 0, viol_measure = NULL,
    originator_code = ''
  ),
  list(
    compl_per_begin_date = NULL, epa_region = '01', pwsid = 'RI1000010',
    population_served_count = NULL, rtc_date = NULL, state_mcl = NULL, viol_measure = NULL,
    originator_code = NULL
  )
)
csv_rows <- paste(
  'compl_per_begin_date,epa_region,pwsid,population_served_count,rtc_date,state_mcl,viol_measure,originator_code',
  '1986-09-01 00:00:00,06,OK2005541,25,,,41.500000000,S',
  '2016-04-01 00:00:00,04,TN0000845,3917,2016-12-31 00:00:00,0E-9,,',
  ',01,RI1000010,,,,,',
  sep = '\n'
)

test_that('JSON and CSV give identical, typed tibbles', {
  from_json <- envirofacts_tidy(json_rows, 'sdwis.violation')
  from_csv <- envirofacts_tidy(csv_rows, 'sdwis.violation')
  expect_s3_class(from_json, 'tbl_df')
  expect_equal(from_json, from_csv)
  expect_equal(names(from_json), names(from_csv))
  expect_type(from_json$population_served_count, 'integer')
  expect_type(from_json$viol_measure, 'double')
  expect_s3_class(from_json$compl_per_begin_date, 'POSIXct')
  expect_equal(attr(from_json$compl_per_begin_date, 'tzone'), 'UTC')
  expect_equal(format(from_json$compl_per_begin_date[[1L]], '%Y-%m-%d %H:%M:%S'), '1986-09-01 00:00:00')
  expect_equal(from_json$state_mcl, c(NA, 0, NA))
})

test_that('nulls and blanks are NA, leading zeros survive, no field is dropped', {
  tidy <- envirofacts_tidy(json_rows, 'sdwis.violation')
  expect_equal(tidy$epa_region, c('06', '04', '01'))
  expect_equal(tidy$originator_code, c('S', NA, NA))
  expect_equal(tidy$population_served_count, c(25L, 3917L, NA))
  expect_equal(nrow(tidy), 3L)
  expect_true(all(c('rtc_date', 'state_mcl', 'viol_measure') %in% names(tidy)))
})

test_that('line breaks in text agree between JSON and CSV', {
  json <- envirofacts_tidy(list(list(comment_id = 1, comments = 'a\r\n\r\nb\rc')), 'acres.comments')
  csv <- envirofacts_tidy('comment_id,comments\n1,"a\n\nb\nc"\n', 'acres.comments')
  expect_equal(json, csv)
  expect_equal(json$comments, 'a\n\nb\nc')
})

test_that('an empty result is a typed zero-row tibble in every form', {
  for (empty in list(list(), NULL, '', 'ana_num,det_num,duration,run_num,run_start\n')) {
    tidy <- envirofacts_tidy(empty, 'radnet.erm_count')
    expect_equal(nrow(tidy), 0L)
    expect_equal(names(tidy), c('ana_num', 'det_num', 'duration', 'run_num', 'run_start'))
    expect_s3_class(tidy$run_start, 'Date')
    expect_type(tidy$ana_num, 'double')
  }
})

test_that('dates are Dates and a raw CSV body is accepted', {
  tidy <- envirofacts_tidy(charToRaw('ana_num,run_start\n642,1978-10-18\n643,\n'), 'radnet.erm_count')
  expect_equal(tidy$run_start, as.Date(c('1978-10-18', NA)))
  expect_equal(tidy$ana_num, c(642, 643))
})

test_that('a byte-order mark before the CSV header is ignored', {
  tidy <- envirofacts_tidy('\ufeffana_num,run_start\n642,1978-10-18\n', 'radnet.erm_count')
  expect_equal(names(tidy), c('ana_num', 'run_start'))
})

test_that('unknown columns and tables come back as character', {
  tidy <- envirofacts_tidy(list(list(pwsid = 'A', surprise = 3)), 'sdwis.violation')
  expect_equal(tidy$surprise, '3')
  expect_equal(envirofacts_tidy(list(list(a = 1)), 'no.such_table')$a, '1')
})

test_that('values that do not parse become NA with one warning', {
  expect_warning(
    tidy <- envirofacts_tidy(list(list(compl_per_begin_date = 'soon', population_served_count = 'many')), 'sdwis.violation'),
    'compl_per_begin_date.*population_served_count'
  )
  expect_true(is.na(tidy$compl_per_begin_date))
  expect_warning(
    whole <- envirofacts_tidy(list(list(population_served_count = 1.5)), 'sdwis.violation'),
    'not whole numbers'
  )
  expect_equal(whole$population_served_count, 1.5)
  expect_no_warning(envirofacts_tidy(list(list(population_served_count = 2)), 'sdwis.violation'))
})

test_that('numbers in text columns are written in full', {
  expect_equal(envirofacts_tidy(list(list(pwsid = 1e5, zip_code = 2840.5, city_name = NULL)), 'sdwis.water_system')$pwsid, '100000')
  expect_equal(envirofacts_tidy(list(list(pwsid = 1e5)), 'sdwis.water_system'), envirofacts_tidy('pwsid\n100000\n', 'sdwis.water_system'))
})

test_that('impossible times are NA with a warning, not midnight', {
  expect_warning(
    tidy <- envirofacts_tidy(list(list(compl_per_begin_date = '2016-12-31 25:99:00')), 'sdwis.violation'),
    'compl_per_begin_date'
  )
  expect_true(is.na(tidy$compl_per_begin_date))
  expect_equal(
    format(envirofacts_tidy(list(list(compl_per_begin_date = '2016-12-31')), 'sdwis.violation')$compl_per_begin_date),
    '2016-12-31'
  )
})

test_that('a CSV row with more fields than the header is an error, not shifted data', {
  expect_error(envirofacts_tidy('pwsid,pws_name\nA,B,C\n', 'sdwis.water_system'))
})

test_that('unexpected shapes error instead of guessing', {
  expect_error(envirofacts_tidy(list(list(pwsid = list(1, 2))), 'sdwis.water_system'), 'nested value')
  expect_error(envirofacts_tidy(list(a = 1), 'sdwis.violation'), 'tidy = FALSE')
  expect_error(envirofacts_tidy(1:3, 'sdwis.violation'), 'tidy = FALSE')
})

test_that('the response policy tidies, still raises service errors, and honors tidy = FALSE', {
  response_of <- function(body, status = 200L, type = 'application/json') {
    httr2::response(status_code = status, headers = list(`Content-Type` = type), body = charToRaw(body))
  }
  run <- function(response, policy) envirofacts_request_decode(response, 'GET', policy, NULL, FALSE)
  policy <- envirofacts_response_policy('radnet.erm_count', TRUE)
  json <- run(response_of('[{"ana_num": 642, "run_start": "1978-10-18"}]'), policy)
  expect_s3_class(json, 'tbl_df')
  expect_equal(json$run_start, as.Date('1978-10-18'))
  csv <- run(response_of('ana_num,run_start\n642,1978-10-18\n', type = 'text/csv'), policy)
  expect_equal(csv, json)
  expect_equal(nrow(run(response_of('[]'), policy)), 0L)
  expect_equal(nrow(run(response_of('', type = 'text/csv'), policy)), 0L)
  expect_error(
    run(response_of('{"error": "The column, radnet.erm_count.nope does not exist"}', status = 500L), policy),
    'nope does not exist',
    class = 'echo_error'
  )
  expect_identical(envirofacts_response_policy('radnet.erm_count', FALSE), 'echo_response_policy')
  expect_equal(run(response_of('[{"a": 1}]'), echo_response_policy), list(list(a = 1L)))
})

test_that('tidy must be TRUE or FALSE, even in a dry run', {
  expect_error(envirofacts_response_policy('radnet.erm_count', 'yes'), 'TRUE or FALSE')
  expect_error(envirofacts_response_policy('radnet.erm_count', NA), 'TRUE or FALSE')
  expect_error(envirofacts_response_policy('radnet.erm_count', c(TRUE, FALSE)), 'TRUE or FALSE')
  epaechoverse_dry_run(TRUE)
  on.exit(epaechoverse_dry_run(FALSE))
  expect_error(envirofacts_radnet_erm_count(tidy = 'yes'), 'TRUE or FALSE')
  expect_s3_class(envirofacts_radnet_erm_count(tidy = FALSE), 'httr2_request')
})

test_that('every table in the schema has column types', {
  columns <- envirofacts_columns()
  expect_equal(length(columns), 416L)
  expect_true(all(unlist(columns) %in% c('character', 'integer', 'double', 'date', 'datetime')))
  expect_true(all(c('sdwis.water_system', 'tri.tri_facility', 'frs.frs_facility_site') %in% names(columns)))
})
