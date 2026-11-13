# Search for atrazine and DEHP in the selected state and year.
example_dir <- local({
  paths <- vapply(sys.frames(), function(frame) {
    if (is.null(frame$ofile)) '' else frame$ofile
  }, character(1))
  paths <- paths[nzchar(paths)]
  if (!length(paths)) stop('Load this example with source()')
  dirname(normalizePath(tail(paths, 1)))
})
source(file.path(example_dir, 'occurrence_chemicals.R'), local = TRUE)

chemicals <- c('atrazine', '117-81-7')
aqs_scope <- data.frame(state = '26', year = 2002)
results <- run_occurrence(chemical_queries = chemicals, aqs_scope = aqs_scope)
