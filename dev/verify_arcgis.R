# Bounded read-only smoke checks; run from the package root.
pkgload::load_all('.', quiet = TRUE)
checks <- list()
for (service in c('facilities', 'stormwater', 'wqi', 'monitor_checks', 'monitor_check2', 'sample_cities')) {
  prefix <- paste0('arcgis_', service)
  functions <- grep(paste0('^', prefix, '_query_layer_'), getNamespaceExports('echoverse'), value = TRUE)
  for (name in functions) {
    fun <- getExportedValue('echoverse', name)
    args <- list(where = '1=0')
    if ('all_pages' %in% names(formals(fun))) args <- c(args, list(all_pages = FALSE, resultRecordCount = 1L))
    checks[[name]] <- tryCatch({
      out <- do.call(fun, args)
      list(status = 'ok', rows = if ('all_pages' %in% names(formals(fun))) length(out) else length(out$features))
    }, error = function(e) list(status = 'error', message = conditionMessage(e)))
  }
  related <- grep(paste0('^', prefix, '_query_related_records_layer_'), getNamespaceExports('echoverse'), value = TRUE)
  for (name in related) {
    checks[[name]] <- tryCatch({
      out <- getExportedValue('echoverse', name)(objectIds = '-1', relationshipId = 0L,
        resultRecordCount = 1L, max_pages = 2L)
      list(status = 'ok', groups = length(out))
    }, error = function(e) list(status = 'error', message = conditionMessage(e)))
  }
  name <- paste0(prefix, '_identify')
  checks[[name]] <- tryCatch({
    out <- getExportedValue('echoverse', name)(geometry = '0,0', tolerance = 1L,
       mapExtent = '-10,-10,10,10', imageDisplay = '100,100,96')
    list(status = 'ok', rows = length(out$results))
  }, error = function(e) list(status = 'error', message = conditionMessage(e)))
}
# Exercise an actual next page with a bounded nonempty filter.
checks$facilities_two_pages <- tryCatch({
  out <- suppressWarnings(arcgis_facilities_query_layer_0(where = "FAC_STATE = 'RI'",
    resultRecordCount = 1L, max_pages = 2L))
  list(status = 'ok', rows = length(out), pagination = attr(out, 'pagination'),
       first_geometry = out[[1]]$geometry)
}, error = function(e) list(status = 'error', message = conditionMessage(e)))
checks$native_output_sr <- tryCatch({
  page <- arcgis_query_page('facilities', 0, where = "REGISTRY_ID = '110000381989'",
    outFields = 'REGISTRY_ID', outSR = 4326, resultRecordCount = 1L)
  stopifnot(page$spatialReference$wkid == 4326, length(page$features) == 1)
  list(status = 'ok', spatialReference = page$spatialReference,
       geometry = page$features[[1]]$geometry)
}, error = function(e) list(status = 'error', message = conditionMessage(e)))
jsonlite::write_json(list(retrieved = format(Sys.time(),tz='UTC',usetz=TRUE), checks = checks),
  'dev/arcgis/live-checks.json', auto_unbox = TRUE, pretty = TRUE, null = 'null')
print(table(vapply(checks, function(x) x$status, character(1))))

stopifnot(all(vapply(checks, function(x) x$status == "ok", logical(1))))
