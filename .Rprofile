# renv keeps a package project's library under the user cache, but only while
# DESCRIPTION exists; dev/build_client.R runs without one. Pin the root so the
# library does not move (unless you already set it).
if (!nzchar(Sys.getenv('RENV_PATHS_LIBRARY_ROOT'))) {
  Sys.setenv(RENV_PATHS_LIBRARY_ROOT = file.path(tools::R_user_dir('renv', 'cache'), 'library'))
}
source('renv/activate.R')
