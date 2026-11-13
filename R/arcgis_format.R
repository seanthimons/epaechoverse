# Client-owned ArcGIS hooks. Formatting happens after pagination, or immediately
# after a single request. Completion checks always see the native response.
arcgis_format_choices <- function(format) {
  if (!is.character(format) || length(format) != 1L || is.na(format) ||
      !format %in% c('tidy', 'sf', 'geojson', 'raw')) {
    stop('format must be one of tidy, sf, geojson or raw', call. = FALSE)
  }
  format
}

arcgis_validate_format <- function(state) {
  arcgis_format_choices(state$params$format)
  state
}

arcgis_operation <- function(name) {
  prefix <- sub('_(query.*|identify)$', '', name)
  layer <- if (grepl('_layer_[0-9]+$', name))
    as.integer(sub('.*_layer_', '', name)) else NA_integer_
  list(service = sub('^arcgis_', '', prefix), layer = layer,
       helper = paste0(prefix, '_request'))
}

arcgis_hook <- function(name, stage, data) {
  data$operation <- arcgis_operation(name)
  switch(stage,
    pre_request = arcgis_validate_format(data),
    post_response = arcgis_post_response(data),
    post_combine = arcgis_post_combine(data),
    stop('Unknown ArcGIS hook stage', call. = FALSE))
}

arcgis_post_response <- function(state) {
  if (inherits(state$result, 'httr2_request')) return(state$result)
  active <- get(paste0(state$operation$helper, '_batch_state'),
                envir = environment(arcgis_post_response))$active
  if (active) return(state$result)
  arcgis_format_responses(list(state$result), state$params$format, state$operation)
}

arcgis_post_combine <- function(state) {
  if (inherits(state$result, 'httr2_request')) return(state$result)
  if (state$params$format == 'raw') return(state$result)
  pages <- attr(state$result, 'arcgis_pages', exact = TRUE)
  if (is.null(pages)) stop('ArcGIS page metadata was not retained', call. = FALSE)
  arcgis_format_responses(pages, state$params$format, state$operation,
                         attr(state$result, 'pagination', exact = TRUE))
}

# The single-page path has already run the formatting hook; paged requests have
# not. Extraction must leave formatted objects intact.
arcgis_page_items <- function(response) {
  if (!is.null(attr(response, 'arcgis', exact = TRUE))) return(response)
  if ('features' %in% names(response)) return(arcgis_record_array(response$features))
  if ('relatedRecordGroups' %in% names(response)) return(arcgis_record_array(response$relatedRecordGroups))
  stop('ArcGIS response has no record array', call. = FALSE)
}

arcgis_record_array <- function(records) {
  if (!is.list(records) || (!is.null(names(records)) && length(records)) ||
      any(!vapply(records, is.list, logical(1)))) {
    stop('Expected an ArcGIS record array', call. = FALSE)
  }
  records
}

arcgis_scalar_column <- function(values) {
  present <- values[!vapply(values, is.null, logical(1))]
  if (!length(present)) return(rep(NA, length(values)))
  scalar <- vapply(present, function(x) is.atomic(x) && length(x) == 1L, logical(1))
  types <- unique(vapply(present, typeof, character(1)))
  if (!all(scalar) || !(length(types) == 1L || all(types %in% c('integer', 'double')))) {
    return(values)
  }
  missing <- switch(typeof(present[[1L]]), character = NA_character_,
                    integer = NA_integer_, double = NA_real_, logical = NA, NA)
  unlist(lapply(values, function(value) if (is.null(value)) missing else value),
         use.names = FALSE)
}

arcgis_format_responses <- function(pages, format, operation, pagination = NULL) {
  arcgis_format_choices(format)
  if (format == 'raw') return(pages[[1L]])
  records <- geometries <- references <- geometry_types <- dimensions <- record_metadata <- list()
  layers <- parents <- list()
  metadata <- lapply(pages, function(page) {
    groups <- page$relatedRecordGroups
    c(page[setdiff(names(page), c('features', 'results', 'relatedRecordGroups'))],
      if (!is.null(groups)) list(related_groups = lapply(groups, function(group)
        group[setdiff(names(group), 'relatedRecords')])))
  })
  append_record <- function(record, page, parent = NULL, group = NULL) {
    n <- length(records) + 1L
    records[n] <<- list(if (is.null(record$attributes)) list() else record$attributes)
    geometries[n] <<- list(record$geometry)
    reference <- record$geometry$spatialReference
    if (is.null(reference)) reference <- record$spatialReference
    if (is.null(reference)) reference <- page$spatialReference
    references[n] <<- list(reference)
    geometry_types[n] <<- list(if (!is.null(record$geometryType))
      record$geometryType else page$geometryType)
    dimensions[n] <<- list(list(hasZ = page$hasZ, hasM = page$hasM))
    layers[n] <<- list(if (!is.null(record$layerId)) record$layerId else operation$layer)
    parents[n] <<- list(parent)
    details <- record[setdiff(names(record), c('attributes', 'geometry'))]
    if (!is.null(reference)) details$spatialReference <- reference
    record_metadata[n] <<- list(c(details, if (!is.null(group)) list(group = group)))
  }
  for (page in pages) {
    if (!is.null(page$error)) stop('ArcGIS response contains an API error', call. = FALSE)
    if ('features' %in% names(page) || 'results' %in% names(page)) {
      rows <- if ('features' %in% names(page)) page$features else page$results
      for (row in arcgis_record_array(rows)) append_record(row, page)
    } else if ('relatedRecordGroups' %in% names(page)) {
      for (group in arcgis_record_array(page$relatedRecordGroups)) {
        for (row in arcgis_record_array(group$relatedRecords)) append_record(row, page, group$objectId,
          group[setdiff(names(group), 'relatedRecords')])
      }
    } else stop('ArcGIS response has no recognized record array; use format = "raw"', call. = FALSE)
  }
  declarations <- unlist(lapply(pages, function(page) page$fields), recursive = FALSE)
  declared_names <- vapply(declarations, function(field) if (is.null(field$name)) '' else field$name, character(1))
  fields <- unique(c(declared_names[nzchar(declared_names)],
                     unlist(lapply(records, names), use.names = FALSE)))
  reserved <- c('.service', '.layer', '.parent_id', '.metadata', '.geometry')
  if (any(fields %in% reserved)) stop('ArcGIS attributes conflict with reserved columns', call. = FALSE)
  columns <- stats::setNames(lapply(fields, function(field) {
    values <- lapply(records, function(record) record[[field]])
    if (any(!vapply(values, is.null, logical(1)))) return(arcgis_scalar_column(values))
    index <- match(field, declared_names)
    declaration <- if (!is.na(index)) declarations[[index]] else list()
    type <- declaration$type
    if (is.null(type)) type <- 'unknown'
    prototype <- switch(type, esriFieldTypeSmallInteger = integer(), esriFieldTypeInteger = integer(),
      esriFieldTypeOID = double(), esriFieldTypeBigInteger = double(),
      esriFieldTypeSingle = double(), esriFieldTypeDouble = double(),
      esriFieldTypeDate = double(), esriFieldTypeString = character(),
      esriFieldTypeGUID = character(), esriFieldTypeGlobalID = character(), logical())
    prototype[rep(NA_integer_, length(records))]
  }), fields)
  out <- tibble::as_tibble(columns, .rows = length(records))
  out$.service <- rep(operation$service, length(records))
  out$.layer <- arcgis_scalar_column(layers)
  out$.parent_id <- arcgis_scalar_column(parents)
  out$.metadata <- record_metadata
  out$.geometry <- geometries
  info <- list(format = format, pages = metadata, pagination = pagination)
  if (format == 'tidy') {
    attr(out, 'arcgis') <- info
    if (!is.null(pagination)) attr(out, 'pagination') <- pagination
    return(out)
  }
  if (any(vapply(pages, function(page) !is.null(page$transform), logical(1)))) {
    stop('Quantized ArcGIS geometry requires an unquantized request; use tidy or raw to inspect it', call. = FALSE)
  }
  measured <- any(vapply(dimensions, function(x) isTRUE(x$hasM), logical(1))) ||
    any(vapply(geometries, function(x) !is.null(x$m) || isTRUE(x$hasM), logical(1)))
  if (measured) stop('Measured ArcGIS geometry requires tidy or raw output to retain M values', call. = FALSE)
  geometry <- arcgis_geometry(geometries, references, geometry_types, dimensions)
  if (format == 'sf') {
    out$.geometry <- geometry
    out <- sf::st_as_sf(out, sf_column_name = '.geometry')
    attr(out, 'arcgis') <- info
    if (!is.null(pagination)) attr(out, 'pagination') <- pagination
    return(out)
  }
  arcgis_geojson(out, geometry, info)
}

# Let GDAL's ESRIJSON driver handle points, multipoints, paths and polygon rings
# (including holes). A synthetic row ID keeps conversion separate from attributes.
arcgis_geometry <- function(geometries, references, geometry_types, dimensions) {
  n <- length(geometries)
  result <- rep(list(sf::st_geometrycollection()), n)
  present <- which(vapply(geometries, function(x) !is.null(x) && length(x) > 0L, logical(1)))
  if (length(present)) {
    if (any(vapply(references[present], is.null, logical(1)))) {
      stop('ArcGIS geometry has no reported spatial reference; use tidy or raw', call. = FALSE)
    }
    keys <- vapply(present, function(i) as.character(jsonlite::toJSON(
      list(reference = references[[i]], type = geometry_types[[i]], dimensions = dimensions[[i]]), auto_unbox = TRUE)), character(1))
    for (group in split(present, keys)) {
      first <- group[[1L]]
      payload <- list(geometryType = geometry_types[[first]],
        hasZ = dimensions[[first]]$hasZ, hasM = dimensions[[first]]$hasM,
        spatialReference = references[[first]],
        fields = list(list(name = 'arcgis_row', type = 'esriFieldTypeInteger')),
        features = lapply(group, function(i) list(attributes = list(arcgis_row = i),
                                                  geometry = geometries[[i]])))
      json <- as.character(jsonlite::toJSON(payload, auto_unbox = TRUE, null = 'null', digits = NA))
      converted <- sf::st_read(json, drivers = 'ESRIJSON', quiet = TRUE)
      if (nrow(converted) != length(group) || !setequal(converted$arcgis_row, group)) {
        stop('ArcGIS geometry conversion changed record identities', call. = FALSE)
      }
      if (is.na(sf::st_crs(converted))) stop('Unsupported ArcGIS spatial reference', call. = FALSE)
      if (any(sf::st_is_empty(converted))) stop('Invalid ArcGIS geometry; use tidy or raw to inspect it', call. = FALSE)
      converted <- sf::st_transform(converted, 4326)
      if (any(sf::st_is_empty(converted))) {
        stop('ArcGIS geometry could not be transformed; use tidy or raw', call. = FALSE)
      }
      xy <- sf::st_coordinates(converted)[, c('X', 'Y'), drop = FALSE]
      if (any(!is.finite(xy)) ||
          any(abs(xy[, 'X']) > 180) || any(abs(xy[, 'Y']) > 90)) {
        stop('ArcGIS geometry could not be transformed to valid WGS84 coordinates; use tidy or raw', call. = FALSE)
      }
      for (i in seq_len(nrow(converted))) result[[converted$arcgis_row[[i]]]] <- sf::st_geometry(converted)[[i]]
    }
  }
  if (!n) return(sf::st_sfc(sf::st_geometrycollection(), crs = 4326)[FALSE])
  sf::st_sfc(result, crs = 4326)
}

arcgis_geojson <- function(table, geometry, metadata) {
  shapes <- rep(list(NULL), nrow(table))
  valid <- which(!sf::st_is_empty(geometry))
  if (length(valid)) {
    path <- tempfile(fileext = '.geojson')
    on.exit(unlink(path))
    spatial <- sf::st_sf(arcgis_row = valid, geometry = geometry[valid])
    sf::st_write(spatial, path, driver = 'GeoJSON', quiet = TRUE,
                 layer_options = 'RFC7946=YES')
    parsed <- jsonlite::fromJSON(path, simplifyVector = FALSE)
    for (feature in parsed$features) shapes[feature$properties$arcgis_row] <- list(feature$geometry)
  }
  properties <- table[setdiff(names(table), '.geometry')]
  features <- lapply(seq_len(nrow(table)), function(i) list(type = 'Feature',
    geometry = shapes[[i]], properties = lapply(properties, function(column) column[[i]])))
  out <- as.character(jsonlite::toJSON(list(type = 'FeatureCollection', features = features,
    arcgis = metadata), auto_unbox = TRUE, null = 'null', na = 'null', digits = NA))
  attr(out, 'arcgis') <- metadata
  if (!is.null(metadata$pagination)) attr(out, 'pagination') <- metadata$pagination
  out
}
