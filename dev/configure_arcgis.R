# Add reviewed ArcGIS captures to the existing client. Run once after capture/review;
# subsequent regeneration uses dev/regenerate.R. Existing runtime/config files stay.
stopifnot(as.character(packageVersion('specmill')) == '0.3.1')
root <- normalizePath('.')
stage <- tempfile('echoverse-arcgis-')
dir.create(stage)
local({
  on.exit(unlink(stage, recursive = TRUE))
  file.copy('dev/arcgis/directory.json', stage)
  file.copy('dev/arcgis/services', stage, recursive = TRUE)
  names <- utils::read.csv('dev/arcgis/service-names.csv')
  catalog <- suppressWarnings(specmill::configure_apis(stage,
    schemas = file.path(stage, 'directory.json'), review = FALSE, mode = 'plan'))
  catalog$api <- names$api[match(catalog$base_url, names$url)]
  stopifnot(!anyNA(catalog$api))
  specmill::initialize_client(stage, catalog, package = 'echoverse',
    title = 'Client for EPA ArcGIS services',
    author = list(given = 'Sean', family = 'Thimons', email = 'thimons.sean@gmail.com'),
    license = 'MIT')
  for (directory in c('apis', 'schema', 'R', '.specmill/helpers')) {
    files <- list.files(file.path(stage, directory), pattern = '^arcgis_', full.names = TRUE)
    for (file in files) {
      target <- file.path(root, directory, basename(file))
      if (!file.exists(target)) file.copy(file, target)
    }
  }
  project <- yaml::read_yaml('specmill.yml')
  additions <- yaml::read_yaml(file.path(stage, 'specmill.yml'))
  project$services <- as.list(unique(c(unlist(project$services), unlist(additions$services))))
  project$authentication <- modifyList(project$authentication, additions$authentication)
  yaml::write_yaml(project, 'specmill.yml')
  existing <- yaml::read_yaml('specmill-apis.yml')
  schemas <- vapply(existing$apis, function(api) api$schema, character(1))
  choices <- catalog[c('schema', 'api', 'base_url', 'include', 'format')]
  choices$schema <- paste0('dev/arcgis/', choices$schema)
  suppressWarnings(specmill::configure_apis(root,
    schemas = unique(c(schemas, file.path(root, 'dev/arcgis/directory.json'))),
    choices = choices, review = FALSE, mode = 'apply'))
})
