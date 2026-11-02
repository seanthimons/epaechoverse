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
# (DESCRIPTION, NAMESPACE, LICENSE, R/ except echo_response_policy.R, man/, schema/,
# apis/*.yml, specmill*.yml, .specmill/, .Rbuildignore) aside first; tests/ stays. To change the client afterwards, edit
# apis/*.yml and use specmill::generate_client() in plan -> apply -> check mode.
#
# On a fresh clone run renv::restore() first. It installs specmill from GitHub
# (seanthimons/specmill, pinned in renv.lock) and compiles V8 and yaml12 from
# source, which needs a system libv8 and a Rust toolchain.
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
  caa_csv = c(caa_poll_rpt_rest_services = '')
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
  title = 'Client for the EPA ECHO Web Services',
  author = list(given = 'Sean', family = 'Thimons', email = 'thimons.sean@gmail.com'),
  license = 'MIT + file LICENSE',
  naming = 'path',
  name_case = 'snake_case'
)

# Retry and error-handling defaults. echo_retry_policy and echo_response_policy live
# in R/echo_response_policy.R, which is client-owned: leave it (and tests/) in place
# when moving generated files aside, because specmill resolves the names from it.
stopifnot(file.exists(file.path(root, 'R', 'echo_response_policy.R')))
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
selected <- expected - duplicate_ops

# Package description and build ignores (apis/ and the root YAML/JSON are already
# ignored by the scaffold; keep dev/ out of builds too).
description <- file.path(root, 'DESCRIPTION')
text <- paste(readLines(description, encoding = 'UTF-8'), collapse = '\n')
text <- sub(
  'Description:.*?\nLicense',
  paste0(
    'Description: Generated client for the U.S. EPA Enforcement and Compliance\n',
    '    History Online (ECHO) web service APIs (', nrow(services), ' APIs, ',
    selected, ' operations),\n',
    '    built with specmill from local Swagger schemas.\nLicense'
  ),
  text
)
writeLines(text, description)
ignore <- file.path(root, '.Rbuildignore')
rules <- readLines(ignore)
stopifnot('^apis$' %in% rules)
if (file.exists(file.path(root, 'renv.lock'))) {
  rules <- c(rules, '^renv$', '^renv\\.lock$', '^\\.Rprofile$')
}
writeLines(c(rules, '^dev$', '^\\.github$', '^\\.gitleaks\\.toml$', '^\\.gitattributes$'), ignore)

plan <- specmill::generate_client(root, config = 'specmill.yml', mode = 'plan')
stopifnot(length(plan$operations) == selected, !length(plan$diagnostics))
names_all <- vapply(plan$operations, function(op) op$name, character(1))
stopifnot(!anyDuplicated(names_all), all(grepl('^[a-z][a-z0-9_]*$', names_all)))
specmill::generate_client(root, config = 'specmill.yml', mode = 'apply')
specmill::generate_client(root, config = 'specmill.yml', mode = 'check')
cat('epaechoverse generated:', length(names_all), 'operations\n')
