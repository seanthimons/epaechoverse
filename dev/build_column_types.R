# Write inst/extdata/envirofacts-columns.csv: the type of every column of every
# Envirofacts table, read from the DMAP OpenAPI schemas in
# apis/envirofacts-dmap.openapi.json. R/envirofacts_tidy.R uses it to give the JSON
# and CSV forms of a result the same column types. dev/build_client.R runs this;
# run it again (from the project root) after re-harvesting the schema.
#
# Usage: Rscript dev/build_column_types.R [project root = .]
#
# Types: integer (integer, smallint), double (bigint, numeric, double precision;
# exact up to 2^53), date, datetime (timestamp without time zone, read as UTC) and
# character (text, character varying, character and anything unrecognised).

root <- normalizePath(if (length(commandArgs(TRUE))) commandArgs(TRUE)[[1L]] else '.', winslash = '/', mustWork = TRUE)
document <- jsonlite::fromJSON(file.path(root, 'apis', 'envirofacts-dmap.openapi.json'), simplifyVector = FALSE)
table_schemas <- document$components$schemas

column_type <- function(property) {
  format <- property$format %||% ''
  type <- property$type %||% ''
  if (identical(format, 'date')) {
    'date'
  } else if (identical(format, 'timestamp without time zone')) {
    'datetime'
  } else if (format %in% c('integer', 'smallint')) {
    'integer'
  } else if (type %in% c('integer', 'number')) {
    'double'
  } else {
    'character'
  }
}
`%||%` <- function(x, y) if (is.null(x)) y else x

rows <- lapply(names(table_schemas), function(table) {
  properties <- table_schemas[[table]]$properties
  if (!length(properties)) {
    return(NULL)
  }
  data.frame(
    table = table,
    column = names(properties),
    type = vapply(properties, column_type, character(1)),
    stringsAsFactors = FALSE
  )
})
columns <- do.call(rbind, rows)
stopifnot(nrow(columns) > 0L, !anyDuplicated(columns[c('table', 'column')]))
dir.create(file.path(root, 'inst', 'extdata'), showWarnings = FALSE, recursive = TRUE)
utils::write.csv(columns, file.path(root, 'inst', 'extdata', 'envirofacts-columns.csv'), row.names = FALSE)
message(
  'Wrote ', nrow(columns), ' columns for ', length(unique(columns$table)), ' tables: ',
  paste(names(table(columns$type)), table(columns$type), collapse = ', ')
)
