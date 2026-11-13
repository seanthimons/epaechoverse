# Idempotent formatting policy for all captured ArcGIS operations. Call after
# configure_arcgis.R, then regenerate. Runtime collectors retain native page
# envelopes until the shared post-combine hook has formatted the whole result.
configure_arcgis_format <- function(root = '.') {
  configs <- list.files(file.path(root, 'apis'), '^arcgis_.*[.]yml$', full.names = TRUE)
  for (path in configs) {
    config <- yaml::read_yaml(path, handlers = list(seq = function(x) x))
    for (id in names(config$groups)) {
      group <- config$groups[[id]]
      group$hook_callback <- 'arcgis_hook'
      group$hooks <- list()
      for (key in names(group$names)) {
        name <- group$names[[key]]
        operation <- group$operations[[key]]
        if (is.null(operation)) operation <- list()
        operation$extra_parameters$format <- list(type = 'string', default = 'tidy',
          description = 'Client result: tidy tibble (default), sf, geojson string, or raw. Spatial output is transformed from the reported CRS to EPSG:4326; tidy retains native geometry. Metadata and pagination are retained.')
        group$hooks[[name]] <- list(pre_request = list('arcgis_validate_format'),
                                    post_response = list('arcgis_post_response'))
        if (!is.null(operation$pagination)) {
          operation$pagination$items <- 'arcgis_page_items'
          group$hooks[[name]]$post_combine <- list('arcgis_post_combine')
        }
        operation$docs$return <- 'A tibble, sf object in EPSG:4326, GeoJSON FeatureCollection string, or native response/record list, selected by format. Metadata is retained in the arcgis attribute and GeoJSON arcgis member.'
        group$operations[[key]] <- operation
      }
      config$groups[[id]] <- group
    }
    yaml::write_yaml(config, path)
    helper <- file.path(root, 'R', paste0(config$helper, '.R'))
    code <- readLines(helper)
    if (!any(grepl('native_arcgis_pages <-', code, fixed = TRUE))) {
      start <- grep(paste0('^', config$helper, '_pages <- function'), code)
      stopifnot(length(start) == 1L)
      code <- append(code, c(
        '  native_arcgis_pages <- base::list()',
        '  native_arcgis_send <- send',
        '  send <- function(...) {',
        '    value <- native_arcgis_send(...)',
        '    if (!base::inherits(value, "httr2_request")) native_arcgis_pages[base::length(native_arcgis_pages) + 1L] <<- base::list(value)',
        '    value',
        '  }'), after = start)
      end <- which(seq_along(code) > start & grepl('^}', code))[1L]
      result <- which(seq_along(code) < end & seq_along(code) > start & code == '  result')
      stopifnot(length(result) == 1L)
      code <- append(code, '  base::attr(result, "arcgis_pages") <- native_arcgis_pages', after = result - 1L)
      writeLines(code, helper)
    }
  }
  invisible(NULL)
}
