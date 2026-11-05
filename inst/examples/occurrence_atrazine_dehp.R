# Compatibility entry point. Set options(occurrence.chemicals = c(...)) to change chemicals.
entry <- sys.frame(1)$ofile
example_dir <- if (is.null(entry)) 'inst/examples' else dirname(normalizePath(entry))
source(file.path(example_dir, 'occurrence_chemicals.R'))
