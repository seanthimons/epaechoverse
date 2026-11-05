test_that('a path is table, optional filters, row range and format', {
  expect_equal(envirofacts_path('/sdwis.water_system'), '/sdwis.water_system/1:100/json')
  expect_equal(
    envirofacts_path('/sdwis.water_system', 'pwsid/beginsWith/RI', 5, 10, 'csv'),
    '/sdwis.water_system/pwsid/beginsWith/RI/5:10/csv'
  )
  expect_equal(
    envirofacts_path('/sdwis.water_system', c('state_code/equals/RI', 'pws_type_code/equals/CWS')),
    '/sdwis.water_system/state_code/equals/RI/and/pws_type_code/equals/CWS/1:100/json'
  )
  expect_equal(envirofacts_path('/sdwis.water_system', character()), '/sdwis.water_system/1:100/json')
})

test_that('row numbers are written in full, never in scientific notation', {
  expect_equal(envirofacts_path('/a.b', first = 190001, last = 2e5), '/a.b/190001:200000/json')
  expect_equal(envirofacts_path('/a.b', first = 1e5, last = 100000L), '/a.b/100000:100000/json')
})

test_that('ranges are validated and capped', {
  expect_error(envirofacts_path('/a.b', first = 5, last = 4), 'greater')
  expect_error(envirofacts_path('/a.b', first = 0), 'whole number')
  expect_error(envirofacts_path('/a.b', first = 1.5), 'whole number')
  expect_error(envirofacts_path('/a.b', last = NA), 'whole number')
  expect_error(envirofacts_path('/a.b', last = Inf), 'whole number')
  expect_error(envirofacts_path('/a.b', first = c(1, 2)), 'whole number')
  expect_error(envirofacts_path('/a.b', last = '5'), 'whole number')
  expect_error(envirofacts_path('/a.b', last = 1e10), 'whole number')
  expect_error(envirofacts_path('/a.b', last = 10001), 'at most 10,000')
  expect_error(envirofacts_path('/a.b', last = 10001, format = 'csv'), 'at most')
  expect_equal(envirofacts_path('/a.b', last = 10000), '/a.b/1:10000/json')
  withr_option <- options(echoverse.max_rows = 20000)
  on.exit(options(withr_option))
  expect_equal(envirofacts_path('/a.b', last = 20000), '/a.b/1:20000/json')
  options(echoverse.max_rows = 'lots')
  expect_error(envirofacts_path('/a.b'), 'echoverse.max_rows')
})

test_that('format and table are validated', {
  expect_error(envirofacts_path('/a.b', format = 'yaml'), 'format')
  expect_error(envirofacts_path('/a.b', format = 'xml'), 'format')
  expect_error(envirofacts_path('/a.b', format = c('json', 'csv')), 'format')
  expect_error(envirofacts_path('a.b'), 'table_path')
  expect_error(envirofacts_path('/a.b/1:2'), 'table_path')
})

test_that('filters cannot add or change path segments', {
  expect_error(envirofacts_path('/a.b', 'col/equals/x/1:999999999'), 'value')
  expect_error(envirofacts_path('/a.b', 'col/equals/..'), 'value')
  expect_error(envirofacts_path('/a.b', 'col/equals/.'), 'value')
  expect_error(envirofacts_path('/a.b', 'col/equals/'), 'value')
  expect_error(envirofacts_path('/a.b', 'col/equals/a%2F1:99'), 'value')
  expect_error(envirofacts_path('/a.b', 'col/equals/a\\b'), 'value')
  expect_error(envirofacts_path('/a.b', 'col/equals/a\nb'), 'value')
  expect_error(envirofacts_path('/a.b', 'col/equals'), 'column/operator/value')
  expect_error(envirofacts_path('/a.b', 'co l/equals/x'), 'plain names')
  expect_error(envirofacts_path('/a.b', 'col/equ-als/x'), 'plain names')
  expect_error(envirofacts_path('/a.b', NA_character_), 'character vector')
  expect_error(envirofacts_path('/a.b', 1), 'character vector')
})

test_that('values are percent-encoded', {
  expect_equal(
    envirofacts_path('/a.b', 'facility_name/like/ST. JOHN\'S & SONS'),
    "/a.b/facility_name/like/ST.%20JOHN%27S%20%26%20SONS/1:100/json"
  )
  expect_equal(envirofacts_path('/a.b', 'zip/equals/02840-1'), '/a.b/zip/equals/02840-1/1:100/json')
})
