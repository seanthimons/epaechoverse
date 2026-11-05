# Download every published ECHO Swagger schema, unchanged, into one directory.
#
# Usage: Rscript dev/harvest_schemas.R [destination directory = apis] [api ids]
#
# Each row of dev/echo_services.csv with source 'download' is fetched from its
# `url` column or, when that is blank, from
#   https://echodata.epa.gov/echo/swaggerx.swagger_json?p_prefix=<prefix>
# and written byte-for-byte. The envirofacts row is EPA's OpenAPI 3 document for
# the Envirofacts (DMAP) service. Naming comma-separated API ids as the second
# argument downloads only those rows and merges them into the existing manifest,
# so adding a service does not re-download (and silently update) the others. The first 14 prefixes are the services linked from
# https://echo.epa.gov/tools/web-services; CAA, BIOSOLIDS and LOOKUP are
# official but unlinked, found by probing prefixes (an unknown prefix returns an
# empty body, which this script rejects). Files are copied into the destination
# only after all of them downloaded. With the default destination the retrieval
# record is written to dev/echo-schema-manifest.json. Run dev/build_client.R
# afterwards. Rows with source 'hand' are hand-authored schemas that already live
# in apis/ (for routes ECHO does not publish a schema for); they are not touched.

script_dir <- dirname(normalizePath(sub('^--file=', '', grep('^--file=', commandArgs(FALSE), value = TRUE)[[1L]])))
args <- commandArgs(TRUE)
default_dest <- file.path(dirname(script_dir), 'apis')
dest <- if (length(args)) args[[1L]] else default_dest
only <- if (length(args) > 1L) strsplit(args[[2L]], ',', fixed = TRUE)[[1L]]
dir.create(dest, showWarnings = FALSE, recursive = TRUE)
dest <- normalizePath(dest, winslash = '/')
staging <- tempfile('echo-schemas-')
dir.create(staging)
on.exit(unlink(staging, recursive = TRUE))

services <- utils::read.csv(file.path(script_dir, 'echo_services.csv'), stringsAsFactors = FALSE, na.strings = character())
services <- services[services$source == 'download', ]
if (!is.null(only)) {
  stopifnot(all(only %in% services$api))
  services <- services[services$api %in% only, ]
}
base_url <- 'https://echodata.epa.gov/echo/swaggerx.swagger_json?p_prefix='

fetch <- function(row) {
  url <- if (nzchar(row$url)) row$url else paste0(base_url, row$prefix)
  tmp <- tempfile(fileext = '.json')
  on.exit(unlink(tmp))
  for (attempt in 1:3) {
    ok <- tryCatch(
      {
        curl::curl_download(url, tmp, quiet = TRUE, handle = curl::new_handle(timeout = 120))
        TRUE
      },
      error = function(e) FALSE
    )
    if (ok && file.size(tmp) > 100) break
    Sys.sleep(2 * attempt)
  }
  if (!file.exists(tmp) || file.size(tmp) <= 100) {
    stop('No schema returned for prefix ', row$prefix, ' (', url, ')')
  }
  document <- jsonlite::fromJSON(tmp, simplifyVector = FALSE)
  swagger2 <- identical(document$swagger, '2.0')
  openapi3 <- is.character(document$openapi) && startsWith(document$openapi, '3.')
  if (!(swagger2 || openapi3) || !length(document$paths)) {
    stop('Not a Swagger 2.0 or OpenAPI 3 document with paths: ', row$prefix)
  }
  target <- file.path(staging, row$file)
  stopifnot(file.copy(tmp, target))
  data.frame(
    file = row$file,
    prefix = row$prefix,
    source_url = url,
    retrieved_utc = format(Sys.time(), '%Y-%m-%dT%H:%M:%SZ', tz = 'UTC'),
    sha256 = unname(tools::sha256sum(target)),
    bytes = file.size(target),
    title = document$info$title,
    paths = length(document$paths),
    definitions = length(if (swagger2) document$definitions else document$components$schemas),
    stringsAsFactors = FALSE
  )
}

records <- lapply(seq_len(nrow(services)), function(i) {
  record <- fetch(services[i, ])
  message(sprintf('%-10s %3d paths  %s', record$prefix, record$paths, record$file))
  record
})
stopifnot(all(file.copy(file.path(staging, services$file), dest, overwrite = TRUE)))
if (identical(normalizePath(dest), normalizePath(default_dest))) {
  manifest_path <- file.path(script_dir, 'echo-schema-manifest.json')
  files <- do.call(rbind, records)
  if (!is.null(only) && file.exists(manifest_path)) {
    previous <- jsonlite::fromJSON(manifest_path)$files
    files <- rbind(previous[!previous$file %in% files$file, names(files)], files)
  }
  manifest <- list(
    description = 'ECHO and Envirofacts schemas (Swagger 2.0 / OpenAPI 3) downloaded unchanged by dev/harvest_schemas.R.',
    files = files
  )
  jsonlite::write_json(
    manifest,
    manifest_path,
    pretty = TRUE,
    auto_unbox = TRUE
  )
}
message('Harvested ', nrow(services), ' schemas into ', dest)
