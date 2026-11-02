# One-time bootstrap of the epaechoverse package with specmill.
#
# Usage:
#   Rscript dev/harvest_schemas.R <project root>/apis
#   Rscript dev/build_client.R <project root>
#
# The schemas stay in apis/ exactly as downloaded; specmill copies them to
# schema/ and writes the per-API YAML next to them. This script initializes the
# package, so it cannot be re-run on an existing client. To change the client
# afterwards, edit apis/*.yml and use specmill::generate_client() in
# plan -> apply -> check mode.

script_dir <- dirname(normalizePath(sub('^--file=', '', grep('^--file=', commandArgs(FALSE), value = TRUE)[[1L]])))
root <- normalizePath(commandArgs(TRUE)[[1L]], winslash = '/', mustWork = TRUE)
stopifnot(!file.exists(file.path(root, 'DESCRIPTION')))

# prefix, file and API id for each schema (the API id is the function prefix).
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
  lookup = c(rest_lookups = '')
)
stopifnot(setequal(names(namespaces), services$api))

# Every GET and POST operation in the schemas is generated.
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
  author = list(given = 'Sean', family = 'Thimons', email = 'sxthi@outlook.com'),
  license = 'MIT + file LICENSE',
  naming = 'path',
  name_case = 'snake_case'
)

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

# Package description and build ignores (apis/ and the root YAML/JSON are already
# ignored by the scaffold; keep dev/ out of builds too).
description <- file.path(root, 'DESCRIPTION')
text <- paste(readLines(description, encoding = 'UTF-8'), collapse = '\n')
text <- sub(
  'Description:.*?\nLicense',
  paste0(
    'Description: Generated client for the U.S. EPA Enforcement and Compliance\n',
    '    History Online (ECHO) web service APIs (', nrow(services), ' APIs, ',
    expected, ' operations),\n',
    '    built with specmill from local Swagger schemas.\nLicense'
  ),
  text
)
writeLines(text, description)
ignore <- file.path(root, '.Rbuildignore')
rules <- readLines(ignore)
stopifnot('^apis$' %in% rules)
writeLines(c(rules, '^dev$'), ignore)

plan <- specmill::generate_client(root, config = 'specmill.yml', mode = 'plan')
stopifnot(length(plan$operations) == expected, !length(plan$diagnostics))
names_all <- vapply(plan$operations, function(op) op$name, character(1))
stopifnot(!anyDuplicated(names_all), all(grepl('^[a-z][a-z0-9_]*$', names_all)))
specmill::generate_client(root, config = 'specmill.yml', mode = 'apply')
specmill::generate_client(root, config = 'specmill.yml', mode = 'check')
cat('epaechoverse generated:', length(names_all), 'operations\n')
