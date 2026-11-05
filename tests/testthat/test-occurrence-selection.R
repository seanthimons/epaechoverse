# Load only pure selection helpers; do not execute example network requests.
occurrence_selection_helpers <- function() {
  skip_if_not_installed('dplyr')
  path <- system.file('examples', 'occurrence_chemicals.R', package = 'echoverse', mustWork = TRUE)
  env <- new.env(parent = asNamespace('dplyr'))
  sys.source(system.file('examples', 'occurrence_mapping.R', package = 'echoverse', mustWork = TRUE), envir = env)
  wanted <- c('read_chemicals', 'read_aqs_scope', 'match_aqs_parameters')
  for (expr in parse(path)) {
    if (is.call(expr) && identical(expr[[1]], as.name('<-')) &&
        is.symbol(expr[[2]]) && as.character(expr[[2]]) %in% wanted) eval(expr, env)
  }
  env
}

test_that('chemical selection accepts new CASRNs without source-specific mappings', {
  h <- occurrence_selection_helpers()
  path <- tempfile(fileext = '.csv')
  on.exit(unlink(path))
  write.csv(data.frame(name = 'benzene', casrn = '71-43-2'), path, row.names = FALSE)
  chemicals <- h$read_chemicals(path)
  expect_equal(chemicals$casrn, '71-43-2')
  expect_setequal(names(chemicals), c('name', 'casrn'))
  write.csv(data.frame(name = 'typo', casrn = '71-43-0'), path, row.names = FALSE)
  expect_error(h$read_chemicals(path), 'Invalid CASRN')
  write.csv(rbind(chemicals, chemicals), path, row.names = FALSE)
  expect_error(h$read_chemicals(path), 'Duplicate CASRN')
})

test_that('AQS mapping uses exact CASRN and keeps multiple parameter codes', {
  h <- occurrence_selection_helpers()
  chemicals <- data.frame(name = c('benzene', 'unmapped'), casrn = c('71-43-2', '58-08-2'))
  catalog <- data.frame('CAS Number' = c('71-43-2', '71-43-2', '171-43-2'),
                        'Parameter Code' = c('45201', '99999', '00000'),
                        Parameter = c('benzene', 'another phase', 'different chemical'),
                        'Standard Units' = c('ppb', 'ng/m3', 'ppb'),
                        'Still Valid' = c('YES', 'NO', 'YES'), check.names = FALSE)
  mapping <- h$match_aqs_parameters(chemicals, catalog)
  expect_setequal(mapping$aqs_param, c('45201', '99999'))
  expect_true(all(mapping$casrn == '71-43-2'))
  expect_false('unmapped' %in% mapping$name)
})

test_that('identity resolution rejects ambiguity and mismatching CASRNs', {
  h <- occurrence_selection_helpers()
  lookup <- function(query) data.frame(casrn = c(query, query), dtxsid = c('A', 'B'),
                                       preferredName = c('first', 'second'))
  expect_error(h$resolve_chemical_identity('71-43-2', lookup), 'ambiguous')
  lookup <- function(query) data.frame(casrn = c('58-08-2', query), dtxsid = c('B', 'A'),
                                       preferredName = c('caffeine', 'benzene'))
  expect_identical(h$resolve_chemical_identity('71-43-2', lookup)$dtxsid, 'A')
  lookup <- function(query) data.frame(casrn = c('71-43-2', '58-08-2'), dtxsid = c('A', 'B'),
                                       preferredName = c('benzene', 'caffeine'))
  expect_error(h$resolve_chemical_identity('ambiguous name', lookup), 'ambiguous')
})

test_that('source names generate candidates but cannot override chemical identity', {
  h <- occurrence_selection_helpers()
  identity <- tibble::tibble(query = '117-81-7', name = 'Di(2-ethylhexyl) phthalate',
                            casrn = '117-81-7', dtxsid = 'DEHP')
  aliases <- h$chemical_aliases(identity, data.frame(valid = 'Di(2-ethylhexyl) phthalate',
               good = 'Bis(2-ethylhexyl) phthalate', deleted = 'Di-n-octyl phthalate'))
  catalog <- data.frame(value_code = c('2039', '2298', '2006'),
                       value_description = c('Di(2-ethylhexyl) phthalate',
                                             'Bis(2-ethylhexyl) phthalate', 'Desethylatrazine'))
  candidates <- h$match_sdwis_candidates(aliases, catalog)
  expect_setequal(candidates$contaminant_code, c('2039', '2298'))
  lookup <- function(query) data.frame(dtxsid = 'OTHER', casrn = '84-74-2', preferredName = query)
  expect_error(h$verify_sdwis_candidate(candidates[1, ], lookup), 'different chemical')
  inventory <- tibble::tibble(url = 'https://www.epa.gov/example.zip', zip = 'example.zip',
       member = c('SUMMARY_ANALYTE_DI_2-ETHYLHEXYL_PHTHALATE.txt',
                  'SUMMARY_ANALYTE_DESETHYLATRAZINE.txt'), inventory_ok = TRUE)
  selected <- h$match_syr4_candidates(aliases, inventory, candidates)
  expect_equal(selected$member, 'SUMMARY_ANALYTE_DI_2-ETHYLHEXYL_PHTHALATE.txt')
  expect_equal(nrow(h$match_syr4_candidates(aliases, inventory, candidates[0, ])), 0L)
})

test_that('remote ZIP directory parser agrees with a real ZIP and rejects truncation', {
  skip_if(Sys.which('zip') == '', 'zip executable unavailable')
  h <- occurrence_selection_helpers()
  directory <- tempfile()
  dir.create(directory)
  on.exit(unlink(directory, recursive = TRUE))
  member <- file.path(directory, 'SUMMARY_ANALYTE_BENZENE.txt')
  writeLines(c('ANALYTE_CODE\tVALUE', '2990\t0.1'), member)
  archive <- file.path(directory, 'samples.zip')
  utils::zip(archive, member, flags = '-jq')
  bytes <- readBin(archive, 'raw', n = file.info(archive)$size)
  expect_equal(h$parse_zip_members(bytes), utils::unzip(archive, list = TRUE)$Name)
  expect_error(h$parse_zip_members(tail(bytes, 22)), 'exceeds downloaded footer')
  expect_error(h$zip_directory_info(head(bytes, -10)), 'Missing ZIP end record')
  expect_identical(h$validate_syr4_member(archive, basename(member), '2990'), '2990')
  expect_error(h$validate_syr4_member(archive, basename(member), '2050'), 'does not match')
})

test_that('SYR4 archive URLs come from the EPA page rather than chemical-specific filenames', {
  h <- occurrence_selection_helpers()
  html <- paste0('<a href="/system/files/other-files/syr4_example.zip">ZIP</a>',
                 '<a href="https://other.example/syr4.zip">Other</a>')
  expect_equal(h$syr4_archive_urls(html, 'https://www.epa.gov/page'),
               'https://www.epa.gov/system/files/other-files/syr4_example.zip')
})
