# AQS sample/annual requests use aqsually; sourcing this file makes no requests.
# request_fn is injectable for offline adapter tests.
aqs_fetch <- function(param, state, year, service = c('sampleData', 'annualData'),
                      pause = 6, email = Sys.getenv('AQS_EMAIL'), request_fn = NULL) {
  service <- match.arg(service)
  if (!nzchar(email) || !nzchar(Sys.getenv('AQS_KEY'))) stop('Missing AQS credentials')
  if (is.null(request_fn)) {
    if (!requireNamespace('aqsually', quietly = TRUE))
      stop('Install aqsually from seanthimons/aqsually to retrieve AQS records')
    request_fn <- switch(service, sampleData = aqsually::sample_data_by_state,
                         annualData = aqsually::annual_data_by_state)
  }
  old_controls <- options(aqsually.request = utils::modifyList(
    getOption('aqsually.request', list()), list(timeout = 120)))
  on.exit(options(old_controls))
  Sys.sleep(pause)
  # aqsually handles authentication. Do not pass or print the key or request URL.
  resp <- request_fn(email = email, param = param, state = state,
                     bdate = as.integer(paste0(year, '0101')),
                     edate = as.integer(paste0(year, '1231')))
  if (inherits(resp, 'httr2_request')) stop('Disable AQSUALLY_DRY_RUN for occurrence queries')
  if (!is.list(resp) || is.null(resp$Header)) stop('Unexpected AQS response structure')
  headers <- dplyr::bind_rows(resp$Header)
  status <- headers$status
  if (!length(status) || anyNA(status) ||
      any(!grepl('^success|^no data', status, ignore.case = TRUE)))
    stop('AQS returned an unsuccessful status')
  if (is.null(resp$Data) || !length(resp$Data)) {
    if (any(headers$rows > 0, na.rm = TRUE)) stop('AQS response is missing reported records')
    message('AQS: no records for parameter ', param, ', state ', state, ', year ', year)
    return(NULL)
  }
  # aqsually returns unsimplified JSON records. Binding retains qualifiers,
  # detection limits and leading zeroes in code fields; JSON null becomes NA.
  records <- lapply(resp$Data, function(record) {
    lapply(record, function(value) if (is.null(value)) NA else value)
  })
  dplyr::bind_rows(records)
}
