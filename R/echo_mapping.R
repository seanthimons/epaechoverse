# Shared response hook for non-Esri ECHO maps. The callback binds the route and
# client-only format before the request; API errors still pass through the normal
# ECHO policy. Esri services use a separate protocol and are not handled here.
echo_map_policy <- function(path, format, output) {
  choices <- if (grepl('get_spatial_metadata$', path)) c('tidy', 'raw') else c('tidy', 'sf', 'geojson', 'raw')
  if (!is.character(format) || length(format) != 1L || is.na(format) || !format %in% choices) {
    stop('`format` must be one of: ', paste(choices, collapse = ', '), '.', call. = FALSE)
  }
  if (format != 'raw' && !is.null(output) && !identical(output, 'JSON')) {
    stop('Formatted maps require output = "JSON"; use format = "raw" for XML or JSONP.', call. = FALSE)
  }
  if (format == 'sf' && !requireNamespace('sf', quietly = TRUE)) {
    stop('Install the optional `sf` package to use format = "sf".', call. = FALSE)
  }
  force(path)
  force(format)
  function(response, context, decode) {
    value <- echo_response_policy(response, context, decode)
    if (format == 'raw') return(value)
    echo_map_format(value, path, format)
  }
}

echo_map_format <- function(value, path, format) {
  if (!is.list(value)) stop('Expected an ECHO JSON map response; use format = "raw" to inspect it.', call. = FALSE)
  root <- if ('MapOutput' %in% names(value)) value else if ('Results' %in% names(value)) value[['Results']] else value
  if (!is.list(root)) stop('Unexpected ECHO map envelope; use format = "raw" to inspect it.', call. = FALSE)
  if (grepl('get_spatial_metadata$', path)) {
    spatial <- root[['SpatialMetadata']]
    if (is.null(spatial)) stop('Missing SpatialMetadata; use format = "raw" to inspect it.', call. = FALSE)
    records <- if (!length(spatial)) list() else list(spatial)
    result <- echo_map_records(records)
    attr(result, 'map') <- root[setdiff(names(root), 'SpatialMetadata')]
    return(result)
  }
  map <- root[['MapOutput']]
  if (!is.list(map)) stop('Missing MapOutput; use format = "raw" to inspect it.', call. = FALSE)
  layers <- intersect(c('MapData', 'MapDataFacilities'), names(map))
  if (!length(layers)) stop('Missing map record arrays; use format = "raw" to inspect it.', call. = FALSE)
  records <- list()
  layer_names <- character()
  for (layer in layers) {
    rows <- map[[layer]]
    if (is.null(rows)) rows <- list()
    if (!is.list(rows) || (!is.null(names(rows)) && length(rows))) {
      stop('Expected a map record array; use format = "raw" to inspect it.', call. = FALSE)
    }
    records <- c(records, rows)
    layer_names <- c(layer_names, rep(layer, length(rows)))
  }
  result <- echo_map_records(records)
  if ('.layer' %in% names(result)) stop('Reserved map column `.layer` already exists.', call. = FALSE)
  result[['.layer']] <- layer_names
  problems <- list()
  for (name in c('LAT', 'LON')) {
    source <- result[[name]]
    if (is.null(source)) source <- rep(NA_character_, nrow(result))
    if (is.list(source)) stop('Map coordinates must be scalar values.', call. = FALSE)
    source <- as.character(source)
    missing <- is.na(source) | !nzchar(trimws(source))
    number <- suppressWarnings(as.numeric(source))
    limit <- if (name == 'LAT') 90 else 180
    bad <- !missing & (!is.finite(number) | abs(number) > limit)
    if (any(bad)) problems[[name]] <- list(rows = which(bad), values = source[bad])
    number[missing | bad] <- NA_real_
    result[[name]] <- number
  }
  if (length(problems)) warning('Invalid map coordinates became NA; original values are in attr(x, "coordinate_problems").', call. = FALSE)
  metadata <- c(root[setdiff(names(root), 'MapOutput')], list(MapOutput = map[setdiff(names(map), layers)]))
  attr(result, 'map') <- metadata
  attr(result, 'coordinate_problems') <- problems
  # The search schemas describe map LAT/LON as WGS84. Use the same map-output
  # convention for report maps; do not apply this to Latitude83/Longitude83 in
  # spatial metadata, whose source datum is not specified by these schemas.
  attr(result, 'crs') <- 'EPSG:4326'
  if (format == 'tidy') return(result)
  valid <- is.finite(result$LAT) & is.finite(result$LON)
  if (format == 'sf') {
    points <- lapply(seq_len(nrow(result)), function(i) {
      if (valid[[i]]) sf::st_point(c(result$LON[[i]], result$LAT[[i]])) else sf::st_point()
    })
    geometry <- if (length(points)) sf::st_sfc(points, crs = 4326) else sf::st_sfc(sf::st_point(), crs = 4326)[FALSE]
    spatial <- sf::st_sf(result, geometry = geometry)
    attr(spatial, 'map') <- metadata
    attr(spatial, 'coordinate_problems') <- problems
    return(spatial)
  }
  features <- lapply(seq_len(nrow(result)), function(i) {
    properties <- lapply(result, function(column) column[[i]])
    list(type = 'Feature', geometry = if (valid[[i]]) {
      list(type = 'Point', coordinates = c(result$LON[[i]], result$LAT[[i]]))
    } else NULL, properties = properties)
  })
  jsonlite::toJSON(list(type = 'FeatureCollection', features = features,
                       echo = list(map = metadata, coordinate_problems = problems)),
                   auto_unbox = TRUE, null = 'null', na = 'null', digits = NA)
}

# Keep all identifiers and unfamiliar scalars as text, nested values as list
# columns, and heterogeneous rows aligned by name. Coordinates are converted by
# the map adapter only; provenance strings remain unchanged.
echo_map_records <- function(records) {
  if (!is.list(records) || !all(vapply(records, function(row) {
    is.list(row) && !is.null(names(row)) && !anyDuplicated(names(row))
  }, logical(1)))) stop('Malformed map records; use format = "raw" to inspect them.', call. = FALSE)
  fields <- unique(unlist(lapply(records, names), use.names = FALSE))
  columns <- lapply(stats::setNames(fields, fields), function(name) {
    values <- lapply(records, function(row) row[[name]])
    if (any(vapply(values, function(x) is.list(x) || length(x) > 1L, logical(1)))) return(values)
    vapply(values, function(x) if (is.null(x) || !length(x)) NA_character_ else as.character(x), character(1))
  })
  tibble::as_tibble(columns, .name_repair = 'minimal')
}
