# Plan, apply or check the generated client after editing apis/*.yml, a schema or
# dev/callbacks.R. Run from the project root so renv activates:
#   Rscript dev/regenerate.R [plan|apply|check]   (default: check)
script_dir <- dirname(normalizePath(sub('^--file=', '', grep('^--file=', commandArgs(FALSE), value = TRUE)[[1L]])))
args <- commandArgs(TRUE)
mode <- if (length(args)) args[[1L]] else 'check'
stopifnot(mode %in% c('plan', 'apply', 'check'), file.exists('DESCRIPTION'))
source(file.path(script_dir, 'callbacks.R'))
result <- specmill::generate_client('.', config = 'specmill.yml', mode = mode, callbacks = callbacks)
print(result)
