guess <- function(x, name = 'Value') echo_guess_column(x, name)

test_that('whole numbers and plain decimals are converted', {
  expect_identical(guess(c('2023', '2022', NA)), c(2023L, 2022L, NA))
  expect_identical(guess(c('0', '12', '-5')), c(0L, 12L, -5L))
  expect_identical(guess(c('1.5', '2', '0.25')), c(1.5, 2, 0.25))
  expect_type(guess(c('1234567890', '5')), 'double')
})

test_that('nothing is converted when conversion could lose information', {
  for (x in list(c('007', '8'), c('01', '02'), '+5', '-0', c('1.50', '2'), '1.0', '1E5', '1e-3', ' 5',
                 '12345678901234567', '1,000', '5%', 'N/A', c('12', 'AL'))) {
    expect_type(guess(x), 'character')
    expect_identical(guess(x), x)
  }
})

test_that('dates need one strict format throughout', {
  expect_equal(guess(c('2024-01-31', NA)), as.Date(c('2024-01-31', NA)))
  expect_equal(guess(c('01/31/2024', '12/01/2023')), as.Date(c('2024-01-31', '2023-12-01')))
  expect_type(guess(c('2024-01-31', '01/31/2024')), 'character')
  expect_type(guess('2024-13-45'), 'character')
  expect_type(guess('1/31/2024'), 'character')
})

test_that('identifier-named columns stay text even when every value is digits', {
  digits <- c('45001', '22001')
  expect_identical(guess(digits, 'ValueCode'), digits)
  for (name in c('RegistryID', 'FacZip', 'CountyFIPS', 'ValueSubCode', 'PermitNumber', 'CASNumber', 'NAICSCodes', 'SIC', 'IdPassed', 'IdReturned')) {
    expect_identical(guess(digits, name), digits)
  }
  expect_identical(guess(digits, 'ValueDescription'), c(45001L, 22001L))
  expect_identical(guess('110000308397', 'IdReturned'), '110000308397')
  expect_identical(guess(c('5', '6'), 'Idle'), c(5L, 6L))
})

test_that('blanks and nulls are NA and line breaks are normalized', {
  expect_identical(guess(c('a', '', NA)), c('a', NA, NA))
  expect_identical(guess(c('', NA)), c(NA_character_, NA_character_))
  expect_identical(guess('a\r\nb\rc'), 'a\nb\nc')
})

lookup_result <- function(...) list(Results = list(Message = 'Success', LuValues = list(...)))

test_that('echo_tidy_lookup makes a text tibble from Results$LuValues', {
  result <- lookup_result(
    list(ValueCode = 'AL', ValueDescription = 'Alabama'),
    list(ValueCode = 'WA', ValueDescription = NULL)
  )
  tidy <- echo_tidy_lookup(list(result = result, params = list(tidy = TRUE)))
  expect_s3_class(tidy, 'tbl_df')
  expect_equal(tidy$ValueCode, c('AL', 'WA'))
  expect_equal(tidy$ValueDescription, c('Alabama', NA))
  years <- echo_tidy_lookup(list(
    result = lookup_result(list(ValueCode = '2023', ValueDescription = '2023'), list(ValueCode = '2022', ValueDescription = '2022')),
    params = list(tidy = TRUE)
  ))
  # lookups are labels: nothing is guessed, however numeric the values look
  expect_identical(years$ValueDescription, c('2023', '2022'))
  expect_identical(years$ValueCode, c('2023', '2022'))
  ids <- echo_tidy_lookup(list(
    result = lookup_result(list(ValueCode = 'x', ValueDescription = '11995.50'), list(ValueCode = 'y', ValueDescription = '')),
    params = list(tidy = TRUE)
  ))
  expect_identical(ids$ValueDescription, c('11995.50', NA))
  numeric <- echo_tidy_lookup(list(result = lookup_result(list(ValueCode = 7, ValueDescription = 1e5)), params = list(tidy = TRUE)))
  expect_identical(numeric$ValueCode, '7')
  expect_identical(numeric$ValueDescription, '100000')
  crlf <- echo_tidy_lookup(list(result = lookup_result(list(ValueCode = 'a', ValueDescription = 'p\r\nq')), params = list(tidy = TRUE)))
  expect_identical(crlf$ValueDescription, 'p\nq')
})

test_that('a lone record sent as an object still tidies', {
  result <- list(Results = list(Message = 'Success', LuValues = list(ValueCode = 'AL', ValueDescription = 'Alabama')))
  tidy <- echo_tidy_lookup(list(result = result, params = list(tidy = TRUE)))
  expect_equal(nrow(tidy), 1L)
  expect_equal(tidy$ValueCode, 'AL')
})

test_that('tidy = FALSE, non-JSON output and requests pass through; bad input errors', {
  result <- lookup_result(list(ValueCode = 'AL', ValueDescription = 'Alabama'))
  expect_identical(echo_tidy_lookup(list(result = result, params = list(tidy = FALSE))), result)
  expect_identical(echo_tidy_lookup(list(result = 'a,b\n1,2', params = list(tidy = TRUE))), 'a,b\n1,2')
  expect_equal(nrow(echo_tidy_lookup(list(result = lookup_result(), params = list(tidy = TRUE)))), 0L)
  for (tidy in list('yes', NA, c(TRUE, FALSE), NULL)) {
    expect_error(echo_tidy_lookup(list(result = result, params = list(tidy = tidy))), 'TRUE or FALSE')
  }
  expect_error(echo_tidy_lookup(list(result = list(Results = list(Message = 'x')), params = list(tidy = TRUE))), 'tidy = FALSE')
  expect_error(
    echo_tidy_lookup(list(result = lookup_result(list(ValueCode = list(1, 2))), params = list(tidy = TRUE))),
    'nested value'
  )
})

test_that('echo_records_tibble guesses only when asked', {
  records <- list(list(Year = '2023', Name = 'a'), list(Year = '2022', Name = 'b'))
  expect_identical(echo_records_tibble(records)$Year, c(2023L, 2022L))
  expect_identical(echo_records_tibble(records, guess = FALSE)$Year, c('2023', '2022'))
})

test_that('wrappers tidy by default, with no network', {
  body <- lookup_result(
    list(ValueCode = 'AL', ValueDescription = 'Alabama'),
    list(ValueCode = 'AK', ValueDescription = 'Alaska')
  )
  mock <- function(req) httr2::response_json(body = body)
  tidy <- httr2::with_mocked_responses(mock, lookup_states())
  expect_s3_class(tidy, 'tbl_df')
  expect_equal(tidy$ValueDescription, c('Alabama', 'Alaska'))
  raw <- httr2::with_mocked_responses(mock, lookup_states(tidy = FALSE))
  expect_equal(raw$Results$LuValues[[1L]]$ValueCode, 'AL')
  post <- httr2::with_mocked_responses(mock, lookup_states_post())
  expect_s3_class(post, 'tbl_df')
  epaechoverse_dry_run(TRUE)
  on.exit(epaechoverse_dry_run(FALSE))
  expect_s3_class(lookup_states(), 'httr2_request')
})

test_that('ECHO errors still raise echo_error before tidying', {
  mock <- function(req) httr2::response_json(body = list(Results = list(Error = list(ErrorMessage = 'Bad query'))))
  expect_error(httr2::with_mocked_responses(mock, lookup_states()), 'Bad query', class = 'echo_error')
})
