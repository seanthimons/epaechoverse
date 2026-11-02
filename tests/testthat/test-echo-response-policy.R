response_of <- function(body, status = 200L, type = 'application/json') {
  httr2::response(
    status_code = status,
    headers = list(`Content-Type` = type),
    body = charToRaw(body)
  )
}

# Runs the policy through the generated helper's real decode(), so these tests
# follow specmill's contract (content-type handling, check_status, error classes).
run_policy <- function(response, preserve_errors = FALSE) {
  sdw_request_decode(response, 'GET', echo_response_policy, NULL, preserve_errors)
}

test_that('successful results pass through unchanged', {
  response <- response_of('{"Results":{"Message":"Success","QueryRows":"3"}}')
  expect_equal(run_policy(response)$Results$QueryRows, '3')
})

test_that('CSV and text bodies are returned as strings, untouched', {
  csv <- response_of('a,b\n1,2\n', type = 'text/csv')
  expect_equal(run_policy(csv), 'a,b\n1,2\n')
})

test_that('an ECHO error envelope sent with HTTP 200 becomes an R error', {
  response <- response_of(
    '{"Results":{"Error":{"ErrorMessage":"110000000001 is not a valid FRS ID."}}}'
  )
  expect_error(run_policy(response), 'not a valid FRS ID', class = 'echo_error')
})

test_that('status error and fail envelopes become R errors', {
  expect_error(
    run_policy(response_of('{"status":"error","message":"-1: Either p_registry_id or p_source_id is required."}')),
    'p_registry_id',
    class = 'echo_error'
  )
  expect_error(
    run_policy(response_of('{"status":"fail","data":{"npdes_id":"TX0000000 is not a valid NPDES ID."}}')),
    'not a valid NPDES ID',
    class = 'echo_error'
  )
})

test_that('unusual JSON shapes are not mistaken for errors or crash the policy', {
  expect_equal(run_policy(response_of('{"Results":"No data"}'))$Results, 'No data')
  expect_equal(run_policy(response_of('{"statusCode":500,"Results":{}}'))$statusCode, 500L)
  expect_equal(run_policy(response_of('[1,2,3]')), list(1L, 2L, 3L))
})

test_that('a trailing comma from the pipeline routes is repaired', {
  body <- '{\n"Results":{\n"Message":"Success",\n"Pipeline":{\n"cnt":"0",\n"PipelineFlag":"N",\n}\n}\n}\n'
  expect_equal(run_policy(response_of(body))$Results$Pipeline$cnt, '0')
})

test_that('the unclosed array from get_frs_id is repaired to an empty list', {
  result <- run_policy(response_of('{\n"Results":{\n"Message":"Success",\n"FRSIds":[\n}\n}'))
  expect_equal(result$Results$FRSIds, list())
})

test_that('malformed JSON that cannot be repaired still errors', {
  expect_error(run_policy(response_of('{"Results": nope')), 'JSON')
})

test_that("an HTTP error carries ECHO's message and keeps the native classes", {
  response <- response_of(
    '{"Results":{"Error":{"ErrorMessage":"We could not process your query."}}}',
    status = 500L
  )
  expect_error(run_policy(response), 'HTTP 500.*could not process', class = 'echo_error')
  expect_error(run_policy(response, preserve_errors = TRUE), class = 'httr2_http_500')
  unauthorized <- response_of('{"Results":{"Error":{"ErrorMessage":"Not authorized."}}}', status = 401L)
  expect_error(run_policy(unauthorized), 'Not authorized', class = 'specmill_call_error')
})

test_that('HTTP errors without an ECHO message are the native error', {
  html <- response_of('<html>404</html>', status = 404L, type = 'text/html')
  err <- tryCatch(run_policy(html), error = identity)
  expect_match(conditionMessage(err), 'HTTP 404 text/html response')
  expect_false(inherits(err, 'echo_error'))
  # a 200 HTML page (for example an SSO login) is returned as text, not repaired
  expect_null(echo_repair_json(response_of('<html></html>', type = 'text/html')))
})

test_that('only transient statuses are retried', {
  retry <- function(status) echo_retry_policy(response_of('{}', status = status))
  expect_true(all(vapply(c(408L, 429L, 502L, 503L, 504L), retry, logical(1))))
  expect_false(any(vapply(c(200L, 400L, 404L, 500L), retry, logical(1))))
})
