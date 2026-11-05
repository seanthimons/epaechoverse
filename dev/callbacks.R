# Development callbacks for specmill generation. Callbacks cannot be declared in
# YAML, so every generate_client() call must be given this environment:
# dev/build_client.R and dev/regenerate.R do. specmill.yml lists this file under
# callback_files, which fingerprints it (it does not source it).
#
# dmap_path is bound to the `path` argument of every envirofacts_* wrapper (see
# defaults.request.arguments in apis/envirofacts.yml). specmill calls it once per
# operation at generation time; it returns the R code the wrapper runs, here a
# call to the client-owned envirofacts_path() in R/envirofacts_path.R with the
# table's original route.
#
# dmap_policy is bound to `response_policy`: envirofacts_response_policy() (in
# R/envirofacts_tidy.R) validates `tidy` and returns either the plain ECHO policy or
# one that also turns the result into a tibble typed for that table.
callbacks <- new.env(parent = emptyenv())
callbacks$dmap_policy <- function(operation) {
  bquote(envirofacts_response_policy(.(sub('^/', '', operation$path)), params$tidy))
}
callbacks$dmap_path <- function(operation) {
  bquote(envirofacts_path(.(operation$path), params$filter, params$first, params$last, params$format))
}

# Validate the client format before any HTTP work, then format decoded maps.
callbacks$map_policy <- function(operation) {
  output <- if (is.null(operation$body)) quote(params$output) else quote(params$body$output)
  bquote(echo_map_policy(.(operation$path), params$format, .(output)))
}

callbacks$map_query <- function(operation) {
  if (is.null(operation$body)) quote(params[base::setdiff(base::names(params), 'format')]) else quote(base::list())
}
callbacks$map_body <- function(operation) {
  if (is.null(operation$body)) quote(NULL) else quote(params$body)
}

callbacks$map_empty <- function(operation) quote(base::list())

callbacks$map_form_schema <- function(operation) operation$body
callbacks$map_body_encoding <- function(operation) operation$body_encoding
