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
callbacks <- new.env(parent = emptyenv())
callbacks$dmap_path <- function(operation) {
  bquote(envirofacts_path(.(operation$path), params$filter, params$first, params$last, params$format))
}
