# Download every published ECHO Swagger schema, unchanged, into one directory.
#
# Usage: Rscript dev/harvest_schemas.R [destination directory = apis]
#
# Each row of dev/echo_services.csv with source 'download' is fetched from
#   https://echodata.epa.gov/echo/swaggerx.swagger_json?p_prefix=<prefix>
# and written byte-for-byte. The first 14 prefixes are the services linked from
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
dir.create(dest, showWarnings = FALSE, recursive = TRUE)
dest <- normalizePath(dest, winslash = '/')
staging <- tempfile('echo-schemas-')
dir.create(staging)
on.exit(unlink(staging, recursive = TRUE))

services <- utils::read.csv(file.path(script_dir, 'echo_services.csv'), stringsAsFactors = FALSE)
services <- services[services$source == 'download', ]
base_url <- 'https://echodata.epa.gov/echo/swaggerx.swagger_json?p_prefix='

fetch <- function(row) {
  url <- paste0(base_url, row$prefix)
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
  if (!identical(document$swagger, '2.0') || !length(document$paths)) {
    stop('Not a Swagger 2.0 document with paths: ', row$prefix)
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
    definitions = length(document$definitions),
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
  manifest <- list(
    description = 'ECHO Swagger 2.0 schemas downloaded unchanged by dev/harvest_schemas.R.',
    files = do.call(rbind, records)
  )
  jsonlite::write_json(
    manifest,
    file.path(script_dir, 'echo-schema-manifest.json'),
    pretty = TRUE,
    auto_unbox = TRUE
  )
}
message('Harvested ', nrow(services), ' schemas into ', dest)
