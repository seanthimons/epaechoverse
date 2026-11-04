# One-time bootstrap of the epaechoverse package with specmill.
#
# Usage, from the project root so .Rprofile activates renv and the build uses the
# specmill release pinned in renv.lock, not whatever is installed in your user
# library:
#   Rscript dev/harvest_schemas.R apis
#   Rscript dev/build_client.R .
#
# This is a one-time bootstrap: it initializes the package and refuses to run
# when DESCRIPTION exists. To regenerate from scratch, move the generated files
# (DESCRIPTION, NAMESPACE, LICENSE, R/ except the client-owned echo_response_policy.R,
# envirofacts_path.R, envirofacts_tidy.R, echo_tidy.R, echo_services.R, echo_formatters.R and
# echo_pages.R, man/, schema/, apis/*.yml, specmill*.yml,
# .specmill/, .Rbuildignore) aside first; tests/ and inst/ stay. To change the
# client afterwards, edit apis/*.yml and run dev/regenerate.R (plan -> apply -> check);
# generation needs the callbacks in dev/callbacks.R.
#
# On a fresh clone run renv::restore() first. It installs specmill from GitHub
# (seanthimons/specmill, pinned in renv.lock) and compiles V8 and yaml12 from
# source, which needs a system libv8 and a Rust toolchain.
#
# The envirofacts API (EPA's DMAP OpenAPI document, 416 tables across 10 programs) is
# generated in full unless envirofacts_programs below names a subset.
#
# Downloaded schemas stay in apis/ exactly as served, next to the hand-written
# ones (rows with source 'hand' in echo_services.csv). Specmill copies them to
# schema/ and writes the per-API YAML next to them.

script_dir <- dirname(normalizePath(sub('^--file=', '', grep('^--file=', commandArgs(FALSE), value = TRUE)[[1L]])))
root <- normalizePath(commandArgs(TRUE)[[1L]], winslash = '/', mustWork = TRUE)
stopifnot(!file.exists(file.path(root, 'DESCRIPTION')))

# prefix, file, API id and source (download or hand) for each schema; the API id
# is the function prefix.
services <- utils::read.csv(file.path(script_dir, 'echo_services.csv'), stringsAsFactors = FALSE)
schemas <- file.path(root, 'apis', services$file)
stopifnot(all(file.exists(schemas)))
source(file.path(script_dir, 'callbacks.R'))
# Column types for the tidy Envirofacts output, written to inst/extdata (reads the
# project root from the first command-line argument, like this script).
source(file.path(script_dir, 'build_column_types.R'), local = new.env())

# Envirofacts programs to generate: NULL for every table, or a character vector such
# as 'sdwis' to generate only those, excluding every other schema.table path with one
# API-level regex.
envirofacts_programs <- NULL
envirofacts_exclude <- if (!is.null(envirofacts_programs)) {
  sprintf('^/(?!(%s)[.])', paste(envirofacts_programs, collapse = '|'))
}

# Route namespace (the first path segment, e.g. sdw_rest_services in
# /sdw_rest_services.get_systems, after sanitizing) -> replacement. '' drops it;
# every namespace seen must be listed. The biosolids route has no tail after its
# namespace, so it keeps its route-derived name.
namespaces <- list(
  ecattaqs = c(ecatt_aqs_rest_services = '', rest_lookups = 'lookups'),
  ecattams = c(ecatt_ams_rest_services = '', rest_lookups = 'lookups'),
  air = c(air_rest_services = ''),
  echo = c(echo_rest_services = ''),
  compscreen = c(comp_screen_services = ''),
  cwa = c(cwa_rest_services = '', rest_lookups = 'lookups'),
  dfr = c(dfr_rest_services = '', air_violation_rest_services = 'air_violation'),
  eff = c(eff_rest_services = '', rest_lookups = 'lookups'),
  ecattems = c(ecatt_ems_rest_services = ''),
  case = c(case_rest_services = '', rest_lookups = 'lookups'),
  nncr = c(nncr_services = ''),
  rcra = c(rcra_rest_services = ''),
  sdw = c(sdw_rest_services = ''),
  wplt = c(dmr_rest_services = '', rest_lookups = 'lookups'),
  caa = c(caa_poll_rpt_rest_services = ''),
  biosolids = character(),
  lookup = c(rest_lookups = ''),
  # Hand-authored schemas (source 'hand' in echo_services.csv).
  cwa_viotrack = c(cwa_viotrack_services = ''),
  rcra_viotrack = c(rcra_viotrack_services = ''),
  air_viotrack = c(air_viotrack_services = ''),
  ecatt_nif = c(ecatt_nif_rest_services = ''),
  dfr_demographics = c(dfr_rest_services = ''),
  micro = c(micro_services = ''),
  pipeline = c(pipeline_rest_services = ''),
  caa_csv = c(caa_poll_rpt_rest_services = ''),
  # Envirofacts (DMAP): paths are /schema.table, so names need no namespace trimming.
  envirofacts = character()
)
stopifnot(setequal(names(namespaces), services$api))

# Every GET and POST operation in the schemas is generated, except the duplicated
# lookups excluded below.
expected <- sum(vapply(schemas, function(path) {
  paths <- jsonlite::fromJSON(path, simplifyVector = FALSE)$paths
  sum(vapply(paths, function(item) sum(names(item) %in% c('get', 'post')), numeric(1)))
}, numeric(1)))

catalogue <- specmill::configure_apis(
  root,
  schemas = schemas,
  choices = data.frame(schema = file.path('apis', services$file), api = services$api),
  mode = 'apply'
)
stopifnot(setequal(catalogue$api, services$api), all(catalogue$include))

specmill::initialize_client(
  root,
  catalogue,
  package = 'epaechoverse',
  title = 'Client for the EPA ECHO and Envirofacts Web Services',
  author = list(given = 'Sean', family = 'Thimons', email = 'thimons.sean@gmail.com'),
  license = 'MIT + file LICENSE',
  naming = 'path',
  name_case = 'snake_case'
)

# Retry and error-handling defaults. echo_retry_policy and echo_response_policy live
# in R/echo_response_policy.R, which is client-owned: leave it (and tests/) in place
# when moving generated files aside, because specmill resolves the names from it.
stopifnot(
  file.exists(file.path(root, 'R', 'echo_response_policy.R')),
  file.exists(file.path(root, 'R', 'envirofacts_path.R')),
  file.exists(file.path(root, 'R', 'envirofacts_tidy.R'))
)
config <- file.path(root, 'specmill.yml')
text <- paste(readLines(config, encoding = 'UTF-8'), collapse = '\n')
old_controls <- '  request_controls:\n    timeout: 30\n    max_retries: 0\n    retry_writes: no\n'
stopifnot(grepl(old_controls, text, fixed = TRUE))
text <- sub(
  old_controls,
  paste0(
    "  # ECHO's POST routes are read-only searches, so retrying them is safe. 60 s covers\n",
    '  # slow searches; downloads and large result pages can take longer.\n',
    '  request_controls:\n    timeout: 60\n    max_retries: 2\n    retry_writes: yes\n',
    '    retry_policy: echo_retry_policy\n  response_policy: echo_response_policy\n'
  ),
  text,
  fixed = TRUE
)
writeLines(text, config)

# Drop the namespace segment that route-derived naming leaves in each name
# (sdw_sdw_rest_services_get_systems -> sdw_get_systems). Names live in the
# reviewed `names:` map and generation never re-derives them, so this edit is
# safe before the first apply.
renamed <- 0L
for (api in services$api) {
  path <- file.path(root, 'apis', paste0(api, '.yml'))
  lines <- readLines(path, encoding = 'UTF-8')
  hit <- grepl('^      (GET|POST|PUT|PATCH|DELETE|HEAD|OPTIONS|TRACE) /\\S*: \\S+$', lines)
  map <- namespaces[[api]]
  if (length(map)) {
    old <- sub('^.*: ', '', lines[hit])
    new <- vapply(old, function(name) {
      rest <- sub(paste0('^', api, '_'), '', name)
      for (ns in names(map)) {
        if (startsWith(rest, paste0(ns, '_'))) {
          tail <- substring(rest, nchar(ns) + 2L)
          return(paste(c(api, if (nzchar(map[[ns]])) map[[ns]], tail), collapse = '_'))
        }
      }
      stop('Unmapped namespace in ', name)
    }, character(1))
    lines[hit] <- paste0(sub(': \\S+$', ': ', lines[hit]), new)
    writeLines(lines, path, useBytes = TRUE)
  }
  renamed <- renamed + sum(hit)
}
stopifnot(renamed == expected)

# The `lookup` API carries every route of ECHO's LOOKUP service. Exclude the copies
# the other services also describe (API-level selection.exclude, a regex over paths);
# lookups only a service describes stay in that service's own API.
count_ops <- function(item) sum(names(item) %in% c('get', 'post'))
lookup_paths <- jsonlite::fromJSON(
  schemas[[which(services$api == 'lookup')]],
  simplifyVector = FALSE
)$paths
duplicate_ops <- 0
for (i in which(services$api != 'lookup')) {
  paths <- jsonlite::fromJSON(schemas[[i]], simplifyVector = FALSE)$paths
  duplicate <- intersect(names(paths)[startsWith(names(paths), '/rest_lookups.')], names(lookup_paths))
  if (!length(duplicate)) {
    next
  }
  duplicate_ops <- duplicate_ops + sum(vapply(paths[duplicate], count_ops, numeric(1)))
  regex <- paste0("'^/rest_lookups[.](", paste(sub('^/rest_lookups[.]', '', duplicate), collapse = '|'), ")$'")
  path <- file.path(root, 'apis', paste0(services$api[[i]], '.yml'))
  lines <- readLines(path, encoding = 'UTF-8')
  start <- which(lines == 'selection:')
  stopifnot(length(start) == 1L)
  # schemas.exclude comes earlier at the same indent and filters filenames.
  target <- start + which(lines[-seq_len(start)] == '  exclude: []')[[1L]]
  lines[target] <- paste0('  exclude: [', regex, ']')
  writeLines(lines, path, useBytes = TRUE)
}
expected_envirofacts <- sum(vapply(
  jsonlite::fromJSON(schemas[[which(services$api == 'envirofacts')]], simplifyVector = FALSE)$paths,
  count_ops, numeric(1)
))
selected <- expected - duplicate_ops

# Callbacks are fingerprinted through callback_files in the project file.
text <- paste(readLines(config, encoding = 'UTF-8'), collapse = '\n')
stopifnot(grepl('callback_files: []', text, fixed = TRUE))
writeLines(sub('callback_files: []', 'callback_files:\n- dev/callbacks.R', text, fixed = TRUE), config)

# Envirofacts: DMAP declares no parameters (filters, the row range and the format
# are path segments), so every table shares one set of inputs and a request whose
# path is built by the dmap_path callback. A complete request.arguments mapping owns
# the whole call, so it must also pass the request controls and response policy.
envirofacts_ops <- jsonlite::fromJSON(
  schemas[[which(services$api == 'envirofacts')]],
  simplifyVector = FALSE
)$paths
envirofacts_selected <- sum(vapply(
  envirofacts_ops[if (is.null(envirofacts_exclude)) TRUE else !grepl(envirofacts_exclude, names(envirofacts_ops), perl = TRUE)],
  count_ops, numeric(1)
))
stopifnot(envirofacts_selected > 0)
path <- file.path(root, 'apis', 'envirofacts.yml')
lines <- readLines(path, encoding = 'UTF-8')
stopifnot(sum(lines == 'defaults: {}') == 1L)
at <- which(lines == 'defaults: {}')
lines <- append(lines[-at], c(
  'defaults:',
  '  inputs:',
  '    filter: {type: character, default: ~, description: "Conditions as column/operator/value, for example pwsid/beginsWith/RI; several are combined with and. Values may not contain a slash, backslash or percent sign, and the service rejected a value containing a dot when tested. NULL for none."}',
  '    first: {type: integer, default: 1, minimum: 1, description: First row to return (1-based).}',
  '    last: {type: integer, default: 100, minimum: 1, description: "Last row to return; at most options(epaechoverse.max_rows) = 10000 rows per call."}',
  '    format: {type: character, default: json, description: "Output format: json or csv."}',
  '    tidy: {type: logical, default: true, description: "Return a tibble with typed columns (the same for json and csv). FALSE returns the service response as sent: a list of records for json, a string for csv."}',
  '  request:',
  '    arguments:',
  '      method: {value: GET}',
  '      path: {callback: dmap_path}',
  '      path_params: {object: {}}',
  '      query: {object: {}}',
  '      body: {value: ~}',
  '      request_controls: {value: {timeout: 120, max_retries: 2, retry_writes: true, retry_policy: echo_retry_policy}}',
  '      response_policy: {callback: dmap_policy}'
), after = at - 1L)
start <- which(lines == 'selection:')
stopifnot(length(start) == 1L)
target <- start + which(lines[-seq_len(start)] == '  exclude: []')[[1L]]
if (!is.null(envirofacts_exclude)) {
  lines[target] <- paste0("  exclude: ['", envirofacts_exclude, "']")
}
writeLines(lines, path, useBytes = TRUE)
selected <- selected - (expected_envirofacts - envirofacts_selected)

# ECHO tidy output (R/echo_tidy.R). Every /rest_lookups.* operation returns
# Results$LuValues, so its group gets a `tidy` input, return documentation and the
# echo_tidy_lookup result_formatter, which specmill only accepts on individual
# operations. The operations come from a plan, because the `names:` maps still list
# routes that API-level selection.exclude removes.
stopifnot(file.exists(file.path(root, 'R', 'echo_tidy.R')))
planned <- specmill::generate_client(root, config = 'specmill.yml', mode = 'plan', callbacks = callbacks)
lookup_ops <- Filter(function(op) startsWith(op$path, '/rest_lookups.'), planned$operations)
stopifnot(length(lookup_ops) > 0L)
lookup_groups <- split(lookup_ops, vapply(lookup_ops, function(op) op$service, character(1)))
for (group in names(lookup_groups)) {
  stopifnot(endsWith(group, '_lookups'))
  # A tidied group must hold nothing but lookup routes.
  stopifnot(sum(vapply(planned$operations, function(op) identical(op$service, group), logical(1))) == length(lookup_groups[[group]]))
  path <- file.path(root, 'apis', paste0(sub('_lookups$', '', group), '.yml'))
  lines <- readLines(path, encoding = 'UTF-8')
  start <- which(lines == paste0('  ', group, ':'))
  stopifnot(length(start) == 1L)
  later <- which(grepl('^  [A-Za-z0-9_]+:$', lines) & seq_along(lines) > start)
  end <- if (length(later)) later[[1L]] - 1L else length(lines)
  block <- lines[start:end]
  family <- which(grepl('^          family: ', block))
  empty <- which(block == '    operations: {}')
  # The new keys go straight after the one-line family tag, before `operations`.
  stopifnot(length(family) == 1L, length(empty) == 1L, empty == family + 1L)
  group_ops <- lookup_groups[[group]]
  group_ops <- group_ops[order(vapply(group_ops, function(op) op$key, character(1)))]
  block <- c(
    block[seq_len(family)],
    '        return: "A tibble of text columns (tidy = TRUE, the default for JSON output) or the decoded response (tidy = FALSE)."',
    '      extra_parameters:',
    '        tidy: {type: logical, default: true, description: "Return a tibble of text columns (blank values are NA). FALSE returns the decoded response. Non-JSON output formats are always returned as sent."}',
    '    operations:',
    unlist(lapply(group_ops, function(op) c(
      paste0('      ', op$key, ':'),
      # `tidy` is an extra input; keep the request body first so positional calls still work.
      if (!is.null(op$body)) '        parameter_order: [body]',
      '        result_formatter: echo_tidy_lookup'
    ))),
    block[-seq_len(empty)]
  )
  writeLines(c(lines[seq_len(start - 1L)], block, lines[-seq_len(end)]), path, useBytes = TRUE)
}

# The search services listed in R/echo_services.R (sdw, cwa, rcra, air, echo, compscreen,
# case, ecattaqs, ecattams) share three route kinds, each with its own per-service
# result_formatter (R/echo_formatters.R, built on R/echo_tidy.R), selected per operation
# because a group also holds routes that stay as they are (downloads, maps, metadata):
#   get_qid                one page of records    -> echo_tidy_qid_<service>
#   summary route          the query summary      -> echo_tidy_summary_<service>
#   info route             matching rows          -> echo_tidy_info_<service>
#   get_download           the rows as CSV        -> echo_tidy_download_<service>
# which routes a service has is in the table. Each op gets a `tidy` input, and POST twins
# keep `body` first. echo_qid_all() in R/echo_pages.R pages through a whole search.
stopifnot(
  file.exists(file.path(root, 'R', 'echo_pages.R')),
  file.exists(file.path(root, 'R', 'echo_formatters.R'))
)
source(file.path(root, 'R', 'echo_services.R'), local = TRUE)
source(file.path(root, 'R', 'echo_formatters.R'), local = TRUE)
# route -> (service, formatter kind) for every route of the table
search_routes <- do.call(rbind, lapply(names(echo_search_services), function(service) {
  entry <- echo_search_services[[service]]
  kinds <- c(qid = 'get_qid', summary = entry$summary, info = entry$info, download = 'get_download')
  kinds <- kinds[!is.na(kinds)]
  data.frame(
    service = service,
    kind = names(kinds),
    path = sprintf('/%s.%s', entry$namespace, kinds),
    formatter = sprintf('echo_tidy_%s_%s', names(kinds), service),
    stringsAsFactors = FALSE
  )
}))
stopifnot(!anyDuplicated(search_routes$path), all(vapply(search_routes$formatter, exists, logical(1))))
search_ops <- Filter(function(op) op$path %in% search_routes$path, planned$operations)
# GET and POST for every route
stopifnot(length(search_ops) == 2L * nrow(search_routes))
search_return <- c(
  qid = 'A tibble of one page of records, typed from ECHO metadata (tidy = TRUE, the default for JSON output) or the decoded response (tidy = FALSE). Use echo_qid_all() for every page.',
  summary = "A one-row tibble of the query summary (counters as numbers, QueryID as text; with tablelist = 'Y' the first page of rows is in attr(, 'facilities')), or the decoded response (tidy = FALSE).",
  download = 'A tibble of the query rows read from the CSV, typed like the get_qid pages (tidy = TRUE, the default for the CSV output) or the CSV text as sent (tidy = FALSE).',
  info = 'A tibble of the matching rows, typed from ECHO metadata, with the query summary, query ID and query parameters in attributes (tidy = TRUE, the default for JSON output), or the decoded response (tidy = FALSE).'
)
route_of <- function(op) search_routes[match(op$path, search_routes$path), ]
for (group in unique(vapply(search_ops, function(op) op$service, character(1)))) {
  group_ops <- Filter(function(op) identical(op$service, group), search_ops)
  group_ops <- group_ops[order(vapply(group_ops, function(op) op$key, character(1)))]
  api <- unique(vapply(group_ops, function(op) route_of(op)$service, character(1)))
  stopifnot(length(api) == 1L)
  path <- file.path(root, 'apis', paste0(api, '.yml'))
  lines <- readLines(path, encoding = 'UTF-8')
  start <- which(lines == paste0('  ', group, ':'))
  stopifnot(length(start) == 1L)
  later <- which(grepl('^  [A-Za-z0-9_]+:$', lines) & seq_along(lines) > start)
  end <- if (length(later)) later[[1L]] - 1L else length(lines)
  empty <- which(lines == '    operations: {}' & seq_along(lines) >= start & seq_along(lines) <= end)
  stopifnot(length(empty) == 1L)
  entry <- function(op) c(
    paste0('      ', op$key, ':'),
    '        docs:',
    paste0('          return: "', search_return[[route_of(op)$kind]], '"'),
    if (!is.null(op$body)) '        parameter_order: [body]',
    '        extra_parameters:',
    if (route_of(op)$kind == 'download') {
      '          tidy: {type: logical, default: true, description: "Return a tibble (typed from ECHO metadata like get_qid: numbers, dates and text; codes and IDs stay text). FALSE returns the CSV text as sent."}'
    } else {
      '          tidy: {type: logical, default: true, description: "Return a tibble (typed from ECHO metadata: numbers, dates and text; codes and IDs stay text). FALSE returns the decoded response. Non-JSON output formats and GeoJSON are always returned as sent."}'
    },
    paste0('        result_formatter: ', route_of(op)$formatter)
  )
  lines <- c(lines[seq_len(empty - 1L)], '    operations:', unlist(lapply(group_ops, entry)), lines[-seq_len(empty)])
  writeLines(lines, path, useBytes = TRUE)
}

# Report routes with one flat record list (echo_report_routes in R/echo_services.R): an
# all-text tibble through echo_tidy_report_<key>. The record key of each route is
# checked against the schema, which declares it as an array property of the route's
# Results object.
report_routes <- echo_report_routes
report_routes$path <- sprintf('/%s.%s', report_routes$namespace, report_routes$route)
report_routes$formatter <- vapply(report_routes$key, echo_report_formatter, character(1))
stopifnot(all(vapply(report_routes$formatter, exists, logical(1))), !anyDuplicated(report_routes$path))
for (api in unique(report_routes$api)) {
  schema <- jsonlite::fromJSON(schemas[[which(services$api == api)]], simplifyVector = FALSE)
  for (i in which(report_routes$api == api)) {
    ref <- schema$paths[[report_routes$path[[i]]]]$get$responses[['200']]$schema$properties$Results[['$ref']]
    results <- schema$definitions[[sub('^#/definitions/', '', ref)]]
    stopifnot(identical(results$properties[[report_routes$key[[i]]]]$type, 'array'))
  }
}
report_ops <- Filter(function(op) op$path %in% report_routes$path, planned$operations)
stopifnot(length(report_ops) == 2L * nrow(report_routes))
report_route_of <- function(op) report_routes[match(op$path, report_routes$path), ]
for (group in unique(vapply(report_ops, function(op) op$service, character(1)))) {
  group_ops <- Filter(function(op) identical(op$service, group), report_ops)
  group_ops <- group_ops[order(vapply(group_ops, function(op) op$key, character(1)))]
  api <- unique(vapply(group_ops, function(op) report_route_of(op)$api, character(1)))
  stopifnot(length(api) == 1L)
  path <- file.path(root, 'apis', paste0(api, '.yml'))
  lines <- readLines(path, encoding = 'UTF-8')
  start <- which(lines == paste0('  ', group, ':'))
  stopifnot(length(start) == 1L)
  later <- which(grepl('^  [A-Za-z0-9_]+:$', lines) & seq_along(lines) > start)
  end <- if (length(later)) later[[1L]] - 1L else length(lines)
  empty <- which(lines == '    operations: {}' & seq_along(lines) >= start & seq_along(lines) <= end)
  stopifnot(length(empty) == 1L)
  entry <- function(op) c(
    paste0('      ', op$key, ':'),
    '        docs:',
    paste0('          return: "A tibble of the records (all text columns, blank values NA; the summary fields are in attr(, \'summary\')) (tidy = TRUE, the default for JSON output) or the decoded response (tidy = FALSE)."'),
    if (!is.null(op$body)) '        parameter_order: [body]',
    '        extra_parameters:',
    '          tidy: {type: logical, default: true, description: "Return the records as a tibble of text columns. FALSE returns the decoded response. Non-JSON output formats are always returned as sent."}',
    paste0('        result_formatter: ', report_route_of(op)$formatter)
  )
  lines <- c(lines[seq_len(empty - 1L)], '    operations:', unlist(lapply(group_ops, entry)), lines[-seq_len(empty)])
  writeLines(lines, path, useBytes = TRUE)
}

# Nested reports (dfr, caa and the effluent charts): every route that returns a JSON
# `Results` object goes through echo_tidy_nested, a total formatter that returns a list
# of tibbles. The routes the schemas declare as files (CSV and ZIP downloads) stay as
# they are, and so do the map and spatial-metadata routes (mapping is on hold).
nested_apis <- c('dfr', 'caa', 'eff')
nested_paths <- unlist(lapply(nested_apis, function(api) {
  paths <- jsonlite::fromJSON(schemas[[which(services$api == api)]], simplifyVector = FALSE)$paths
  keep <- vapply(names(paths), function(path) {
    schema <- paths[[path]]$get$responses[['200']]$schema
    !is.null(schema$properties$Results) && !grepl('[.](get_map|get_spatial_metadata)$', path)
  }, logical(1))
  stats::setNames(rep(api, sum(keep)), names(paths)[keep])
}))
source(file.path(root, 'R', 'echo_tidy.R'), local = TRUE)
stopifnot(exists('echo_tidy_nested'))
nested_ops <- Filter(function(op) {
  basename(unlist(op$source)[[1L]]) %in% paste0(nested_apis, '.json') && op$path %in% names(nested_paths)
}, planned$operations)
stopifnot(length(nested_ops) > 0L, all(vapply(nested_ops, function(op) !is.null(nested_paths[[op$path]]), logical(1))))
for (group in unique(vapply(nested_ops, function(op) op$service, character(1)))) {
  group_ops <- Filter(function(op) identical(op$service, group), nested_ops)
  group_ops <- group_ops[order(vapply(group_ops, function(op) op$key, character(1)))]
  api <- unique(nested_paths[vapply(group_ops, function(op) op$path, character(1))])
  stopifnot(length(api) == 1L)
  path <- file.path(root, 'apis', paste0(api, '.yml'))
  lines <- readLines(path, encoding = 'UTF-8')
  start <- which(lines == paste0('  ', group, ':'))
  stopifnot(length(start) == 1L)
  later <- which(grepl('^  [A-Za-z0-9_]+:$', lines) & seq_along(lines) > start)
  end <- if (length(later)) later[[1L]] - 1L else length(lines)
  empty <- which(lines == '    operations: {}' & seq_along(lines) >= start & seq_along(lines) <= end)
  stopifnot(length(empty) == 1L)
  # A group may also hold file routes: they simply get no entry.
  entry <- function(op) c(
    paste0('      ', op$key, ':'),
    '        docs:',
    '          return: "A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE)."',
    if (!is.null(op$body)) '        parameter_order: [body]',
    '        extra_parameters:',
    '          tidy: {type: logical, default: true, description: "Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent."}',
    '        result_formatter: echo_tidy_nested'
  )
  lines <- c(lines[seq_len(empty - 1L)], '    operations:', unlist(lapply(group_ops, entry)), lines[-seq_len(empty)])
  writeLines(lines, path, useBytes = TRUE)
}

# Package description and build ignores (apis/ and the root YAML/JSON are already
# ignored by the scaffold; keep dev/ out of builds too).
description <- file.path(root, 'DESCRIPTION')
text <- paste(readLines(description, encoding = 'UTF-8'), collapse = '\n')
text <- sub(
  'Description:.*?\nLicense',
  paste0(
    'Description: Generated client for the U.S. EPA Enforcement and Compliance\n',
    '    History Online (ECHO) web service APIs and the Envirofacts (DMAP) data\n',
    '    tables (', nrow(services), ' APIs, ', selected, ' operations),\n',
    '    built with specmill from local Swagger and OpenAPI schemas.\nLicense'
  ),
  text
)
stopifnot(grepl('Imports: httr2, jsonlite, curl\n', text, fixed = TRUE))
text <- sub('Imports: httr2, jsonlite, curl\n', 'Imports: httr2, jsonlite, curl, tibble\n', text, fixed = TRUE)
writeLines(text, description)
ignore <- file.path(root, '.Rbuildignore')
rules <- readLines(ignore)
stopifnot('^apis$' %in% rules)
extra <- c('^dev$', '^\\.github$', '^\\.gitleaks\\.toml$', '^\\.gitattributes$')
if (file.exists(file.path(root, 'renv.lock'))) {
  extra <- c('^renv$', '^renv\\.lock$', '^\\.Rprofile$', extra)
}
# specmill adds the renv rules itself when renv.lock exists; add only what is missing.
writeLines(c(rules, setdiff(extra, rules)), ignore)

plan <- specmill::generate_client(root, config = 'specmill.yml', mode = 'plan', callbacks = callbacks)
stopifnot(length(plan$operations) == selected, !length(plan$diagnostics))
names_all <- vapply(plan$operations, function(op) op$name, character(1))
stopifnot(sum(startsWith(names_all, 'envirofacts_')) == envirofacts_selected)
stopifnot(!anyDuplicated(names_all), all(grepl('^[a-z][a-z0-9_]*$', names_all)))
specmill::generate_client(root, config = 'specmill.yml', mode = 'apply', callbacks = callbacks)
specmill::generate_client(root, config = 'specmill.yml', mode = 'check', callbacks = callbacks)
cat('epaechoverse generated:', length(names_all), 'operations\n')
