# Idempotent generation configuration for the non-Esri mapping routes. Called by
# the one-time bootstrap and directly after schema refreshes.
configure_mapping <- function(root) {
  services <- c('air', 'cwa', 'rcra', 'echo', 'case', 'ecattams', 'ecattaqs', 'dfr', 'caa')
  for (api in services) {
    schema_path <- file.path(root, 'schema', paste0(api, '.json'))
    schema <- jsonlite::fromJSON(schema_path, simplifyVector = FALSE)
    # The original schemas mark p_id required even for QID-only maps. Live GET
    # and POST checks on 2026-11-05 confirmed it is optional in these four APIs.
    if (api %in% c('air', 'cwa', 'rcra', 'echo')) {
      lines <- readLines(schema_path)
      starts <- grep('[.]get_map":', lines)
      for (start in starts) {
        next_path <- which(grepl('^   ,"', lines) & seq_along(lines) > start)
        end <- if (length(next_path)) min(next_path) - 1L else length(lines)
        refs <- which(grepl('"\\$ref".*[.]p_id"', lines) & seq_along(lines) > start & seq_along(lines) <= end)
        for (i in refs) {
          key <- if (grepl('q.p_id', lines[[i]], fixed = TRUE)) 'q.p_id' else 'f.p_id'
          param <- schema$parameters[[key]]
          param$required <- FALSE
          text <- as.character(jsonlite::toJSON(param, auto_unbox = TRUE))
          lines[[i]] <- paste0('                ', substr(text, 2L, nchar(text) - 1L))
        }
      }
      writeLines(lines, schema_path)
    }
    config_path <- file.path(root, 'apis', paste0(api, '.yml'))
    config <- yaml::read_yaml(config_path)
    for (group in names(config$groups)) {
      entry <- config$groups[[group]]
      ops <- grep('[.](get_map|get_rpt_map|get_spatial_metadata)$', entry$selection$include, value = TRUE)
      for (op in ops) {
        metadata <- grepl('get_spatial_metadata$', op)
        entry$operations[[op]] <- list(
          docs = list(return = if (metadata) 'A provenance tibble (format = "tidy") or decoded response (format = "raw").' else 'A map tibble, sf points, GeoJSON FeatureCollection string, or decoded response, selected by format. Map coordinates use EPSG:4326; clusters are representative points.'),
          extra_parameters = list(format = list(type = 'string', default = 'tidy', description = if (metadata) 'Client result format: tidy or raw. Coordinate provenance is not converted to geometry.' else 'Client result format: tidy (default), sf (optional sf package), geojson (string), or raw. Formatted output requires JSON. Metadata is retained in the map attribute (GeoJSON: echo member); .layer distinguishes record arrays. Missing coordinates yield empty geometries.')),
          request = list(arguments = list(
            method = list(value = sub(' .*$', '', op)),
            path = list(value = sub('^[^ ]+ ', '', op)),
            path_params = list(callback = 'map_empty'),
            query = list(callback = 'map_query'),
            body = list(callback = 'map_body'),
            form_schema = list(callback = 'map_form_schema'),
            body_encoding = list(callback = 'map_body_encoding'),
            body_media = list(value = if (startsWith(op, 'POST ')) 'application/x-www-form-urlencoded' else 'application/json'),
            request_controls = list(value = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = 'echo_retry_policy')),
            response_policy = list(callback = 'map_policy')
          ))
        )
        if (startsWith(op, 'POST ')) entry$operations[[op]]$parameter_order <- list('body')
      }
      config$groups[[group]] <- entry
    }
    # Keep the existing hand-maintained YAML; insert only map operation blocks.
    lines <- readLines(config_path)
    for (group in names(config$groups)) {
      entry <- config$groups[[group]]
      ops <- grep('[.](get_map|get_rpt_map|get_spatial_metadata)$', entry$selection$include, value = TRUE)
      if (!length(ops)) next
      start <- match(paste0('  ', group, ':'), lines)
      later <- which(grepl('^  [A-Za-z0-9_]+:$', lines) & seq_along(lines) > start)
      end <- if (length(later)) min(later) - 1L else length(lines)
      for (op in ops) {
        old <- which(lines == paste0('      ', op, ':') & seq_along(lines) > start & seq_along(lines) <= end)
        if (length(old)) {
          following <- which(grepl('^      (GET|POST) /', lines) & seq_along(lines) > old & seq_along(lines) <= end)
          last <- if (length(following)) min(following) - 1L else end
          lines <- lines[-seq.int(old, last)]
          end <- end - (last - old + 1L)
        }
      }
      empty <- which(lines == '    operations: {}' & seq_along(lines) > start & seq_along(lines) <= end)
      if (length(empty)) lines[empty] <- '    operations:'
      block <- yaml::as.yaml(entry$operations[ops], indent.mapping.sequence = TRUE)
      block <- paste0('      ', strsplit(block, '\n', fixed = TRUE)[[1L]])
      lines <- append(lines, block, after = end)
    }
    writeLines(lines, config_path)
  }
}
