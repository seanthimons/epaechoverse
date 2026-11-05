occurrence_aqs_adapter <- function() {
  skip_if_not_installed('dplyr')
  env <- new.env()
  sys.source(system.file('examples', 'occurrence_aqs.R', package = 'echoverse', mustWork = TRUE), envir = env)
  env$aqs_fetch
}

with_occurrence_aqs_credentials <- function(code) {
  previous <- Sys.getenv('AQS_KEY', unset = NA_character_)
  on.exit(if (is.na(previous)) Sys.unsetenv('AQS_KEY') else Sys.setenv(AQS_KEY = previous))
  Sys.setenv(AQS_KEY = 'offline-test-key')
  force(code)
}

test_that('aqsually receives integer dates and code strings; records retain qualifiers', {
  fetch <- occurrence_aqs_adapter()
  with_occurrence_aqs_credentials({
    original_options <- getOption('aqsually.request')
    client <- function(email, param, state, bdate, edate) {
      expect_identical(param, '16770')
      expect_identical(state, '01')
      expect_identical(bdate, 20020101L)
      expect_identical(edate, 20021231L)
      expect_equal(getOption('aqsually.request')$timeout, 120)
      list(Header = list(list(status = 'Success', rows = 2L)),
           Data = list(list(state_code = '01', sample_measurement = 0.1, qualifier = NULL, mdl = 0.2, null_data_code = NULL),
                       list(state_code = '01', sample_measurement = 0.3, qualifier = 'J', mdl = 0.2, null_data_code = NULL)))
    }
    x <- fetch('16770', '01', 2002, pause = 0, email = 'test@example.org', request_fn = client)
    expect_identical(x$state_code, c('01', '01'))
    expect_identical(x$qualifier, c(NA_character_, 'J'))
    expect_equal(x$mdl, c(0.2, 0.2))
    expect_true('null_data_code' %in% names(x))
    expect_true(all(is.na(x$null_data_code)))
    expect_identical(getOption('aqsually.request'), original_options)
  })
})

test_that('AQS no-data responses are distinguished from service errors', {
  fetch <- occurrence_aqs_adapter()
  with_occurrence_aqs_credentials({
    no_data <- function(...) list(Header = list(list(status = 'No data matched your selection', rows = 0)), Data = list())
    expect_message(expect_null(fetch('16770', '26', 2002, pause = 0,
                   email = 'test@example.org', request_fn = no_data)), 'no records')
    rejected <- function(...) list(Header = list(list(status = 'Failed')), Data = list())
    expect_error(fetch('16770', '26', 2002, pause = 0, email = 'test@example.org',
                       request_fn = rejected), 'unsuccessful status')
    incomplete <- function(...) list(Header = list(list(status = 'Success', rows = 1)), Data = list())
    expect_error(fetch('16770', '26', 2002, pause = 0, email = 'test@example.org',
                       request_fn = incomplete), 'missing reported records')
  })
})

test_that('the default adapter delegates samples and annual summaries to aqsually', {
  skip_if_not_installed('aqsually')
  fetch <- occurrence_aqs_adapter()
  response <- function(route) list(Header = list(list(status = 'Success', rows = 1L)),
                                    Data = list(list(route = route, state_code = '01')))
  testthat::local_mocked_bindings(
    sample_data_by_state = function(...) response('sample'),
    annual_data_by_state = function(...) response('annual'),
    .package = 'aqsually'
  )
  with_occurrence_aqs_credentials({
    samples <- fetch('16770', '01', 2002, pause = 0, email = 'test@example.org')
    annual <- fetch('16770', '01', 2002, service = 'annualData', pause = 0,
                    email = 'test@example.org')
    expect_identical(samples$route, 'sample')
    expect_identical(annual$route, 'annual')
  })
})
