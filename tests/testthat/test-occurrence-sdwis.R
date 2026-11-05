test_that('SDWIS fallback uses bounded catalog and community-system requests', {
  skip_if_not_installed('dplyr')
  env <- new.env()
  sys.source(test_path('..', '..', 'inst', 'examples', 'occurrence_sdwis.R'), envir = env)
  fetch <- env$occurrence_sdwis_fetch
  catalog <- fetch(request_fn = function(url, timeout) {
    expect_match(url, '/sdwis.ref_code_value/value_type/equals/CONTAMINANT_CODE/1:10000/json', fixed = TRUE)
    expect_equal(timeout, 120)
    list(list(value_code = '2050', value_description = 'Atrazine'))
  })
  expect_identical(catalog$value_code, '2050')
  violations <- fetch('2050', request_fn = function(url, timeout) {
    expect_match(url, '/contaminant_code/equals/2050/and/pws_type_code/equals/CWS/1:10000/json', fixed = TRUE)
    expect_equal(timeout, 900)
    list(list(pwsid = 'OH0000001', viol_measure = NULL))
  })
  expect_true(is.na(violations$viol_measure))
  expect_error(fetch('../bad', request_fn = function(...) stop('must not send')), 'four digits')
  expect_error(fetch(request_fn = function(...) list(error = 'unavailable')), 'Unexpected')
})
