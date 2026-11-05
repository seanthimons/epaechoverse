# Keep examples usable with main and with echoverse's optional SDWIS wrappers.
# The fallback is limited to two known tables and a bounded 10,000-row request.
occurrence_sdwis_fetch <- function(contaminant_code = NULL, request_fn = NULL) {
  catalog <- is.null(contaminant_code)
  if (!catalog && (length(contaminant_code) != 1L || is.na(contaminant_code) ||
                   !grepl('^[0-9]{4}$', contaminant_code)))
    stop('SDWIS contaminant code must contain four digits')
  operation <- if (catalog) 'envirofacts_sdwis_ref_code_value' else 'envirofacts_sdwis_violation'
  filters <- if (catalog) 'value_type/equals/CONTAMINANT_CODE' else
    c(paste0('contaminant_code/equals/', contaminant_code), 'pws_type_code/equals/CWS')
  if (is.null(request_fn) && requireNamespace('echoverse', quietly = TRUE) &&
      operation %in% getNamespaceExports('echoverse')) {
    return(getExportedValue('echoverse', operation)(filters, last = 10000))
  }
  table <- if (catalog) 'sdwis.ref_code_value' else 'sdwis.violation'
  url <- paste0('https://data.epa.gov/dmapservice/', table, '/',
                paste(filters, collapse = '/and/'), '/1:10000/json')
  if (is.null(request_fn)) request_fn <- function(url, timeout) {
    httr2::request(url) |> httr2::req_timeout(timeout) |>
      httr2::req_perform() |> httr2::resp_body_json(simplifyVector = FALSE)
  }
  records <- request_fn(url, timeout = if (catalog) 120 else 900)
  if (!is.list(records) || (!is.null(names(records)) && length(records)))
    stop('Unexpected SDWIS response structure')
  records <- lapply(records, function(row) {
    lapply(row, function(value) if (is.null(value)) NA else value)
  })
  dplyr::bind_rows(records)
}
