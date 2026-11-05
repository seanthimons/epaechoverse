# Measured concentrations / detections for chemicals selected by CASRN.
# Select chemical names or CASRNs with options(occurrence.chemicals = c(...)).
# Set occurrence.aqs_scope to a state/year data frame, or use occurrence_aqs_scope.csv.
# Catalogs are cached for seven days; options(occurrence.refresh_catalogs = TRUE)
# forces a refresh. Set occurrence.mapping_only = TRUE to discover mappings only.
#
# Sources
#   Drinking water  SDWIS via epaechoverse: violation records (viol_measure is the
#                   reported violation measure, possibly a compliance aggregate;
#                   not an individual sample concentration).
#                   EPA Six-Year Review 4 compliance data: the all-sample record
#                   (state monitoring results, 2012-2019), downloaded as a ZIP.
#   Ambient air     EPA AQS Data API via aqsually (samples by state/year).
#   Both media      CompTox Monitoring Media Database (MMDB) via ComptoxR.
#
# Needs (set in ~/.Renviron):
#   ctx_api_key   CompTox API key (email ccte_api@epa.gov)
#   AQS_EMAIL     e-mail registered with AQS
#   AQS_KEY       AQS API key
# Missing packages are installed automatically with pak. epaechoverse, aqsually
# and ComptoxR come from GitHub; the other dependencies come from CRAN.
#
# Live validation: SYR4 and AQS returned samples on 2026-11-04. MMDB returned
# records earlier that day; subsequent CompTox lookups returned HTTP 503.
# No returned data means no records in the requested scope, not proof of zero concentration.
# Community systems include public and private owners; they are not necessarily
# municipally owned. MMDB drinking-water records are not restricted to CWS.

# Bootstrap pak, then install only missing dependencies. Existing installations
# are retained; this does not force package upgrades each time data are queried.
if (!requireNamespace('pak', quietly = TRUE))
  utils::install.packages('pak', repos = 'https://cloud.r-project.org')
occurrence_packages <- c(
  epaechoverse = 'github::seanthimons/epaechoverse',
  aqsually = 'github::seanthimons/aqsually',
  ComptoxR = 'github::seanthimons/ComptoxR',
  dplyr = 'dplyr', purrr = 'purrr', httr2 = 'httr2', tibble = 'tibble'
)
missing_packages <- !vapply(names(occurrence_packages), requireNamespace,
                            quietly = TRUE, FUN.VALUE = logical(1))
if (any(missing_packages))
  pak::pkg_install(unname(occurrence_packages[missing_packages]), ask = FALSE, upgrade = FALSE)

library(dplyr)
library(purrr)
library(httr2)
library(epaechoverse)

# Example: options(occurrence.chemicals = c('atrazine', '117-81-7', 'benzene'))
# No source codes or filenames are required. The optional chemical CSV is retained
# for existing callers; only its name and casrn columns are used.
script_path <- sys.frame(1)$ofile
example_dir <- if (is.null(script_path)) 'inst/examples' else dirname(normalizePath(script_path))
source(file.path(example_dir, 'occurrence_mapping.R'), local = TRUE)
source(file.path(example_dir, 'occurrence_aqs.R'), local = TRUE)
source(file.path(example_dir, 'occurrence_sdwis.R'), local = TRUE)
chemical_file <- Sys.getenv('OCCURRENCE_CHEMICALS')
scope_file <- Sys.getenv('OCCURRENCE_AQS_SCOPE',
                        unset = file.path(example_dir, 'occurrence_aqs_scope.csv'))
syr4_dir <- Sys.getenv('OCCURRENCE_CACHE',
                       unset = file.path(tools::R_user_dir('epaechoverse', 'cache'), 'occurrence'))
dir.create(syr4_dir, recursive = TRUE, showWarnings = FALSE)

read_chemicals <- function(path) {
  x <- read.csv(path, colClasses = 'character', na.strings = '', check.names = FALSE)
  if (!all(c('name', 'casrn') %in% names(x)) || !nrow(x))
    stop('Chemical CSV must contain name and casrn columns and at least one row')
  x$casrn <- trimws(x$casrn)
  valid_cas <- function(cas) {
    if (is.na(cas) || !grepl('^[0-9]{2,7}-[0-9]{2}-[0-9]$', cas)) return(FALSE)
    digits <- as.integer(strsplit(gsub('-', '', cas), '')[[1]])
    sum(rev(head(digits, -1L)) * seq_len(length(digits) - 1L)) %% 10 == tail(digits, 1L)
  }
  if (!all(vapply(x$casrn, valid_cas, logical(1)))) stop('Invalid CASRN in chemical CSV')
  if (anyDuplicated(x$casrn)) stop('Duplicate CASRN in chemical CSV')
  if (any(is.na(x$name) | !nzchar(trimws(x$name)))) stop('Each chemical needs a name')
  tibble::as_tibble(x)
}
read_aqs_scope <- function(path) {
  x <- if (is.data.frame(path)) as.data.frame(lapply(path, as.character)) else
    read.csv(path, colClasses = 'character')
  if (!all(c('state', 'year') %in% names(x)) || !nrow(x))
    stop('AQS scope CSV must contain state and year columns and at least one row')
  if (anyNA(x[c('state', 'year')]) ||
      any(!grepl('^[0-9]{2}$', x$state)) || any(!grepl('^[0-9]{4}$', x$year)))
    stop('Use two-digit state FIPS and four-digit years in AQS scope CSV')
  distinct(tibble::as_tibble(x[c('state', 'year')]))
}
chemical_queries <- getOption('occurrence.chemicals')
if (is.null(chemical_queries))
  chemical_queries <- if (nzchar(chemical_file)) read_chemicals(chemical_file)$casrn else
    c('1912-24-9', '117-81-7')
if (!is.character(chemical_queries) || !length(chemical_queries) ||
    anyNA(chemical_queries) || any(!nzchar(trimws(chemical_queries))))
  stop('occurrence.chemicals must be a nonempty character vector of names or CASRNs')
chemical_queries <- unique(trimws(chemical_queries))
aqs_scope <- read_aqs_scope(getOption('occurrence.aqs_scope', scope_file))
run_sdwis <- identical(Sys.getenv('OCCURRENCE_RUN_SDWIS'), 'true')
aqs_pause  <- 6                  # AQS allows ~10 requests/minute

`%||%` <- function(x, y) if (is.null(x)) y else x

safely_run <- function(label, expr) {
  tryCatch(expr, error = function(e) {
    http_status <- regmatches(conditionMessage(e), regexpr('HTTP [0-9]{3}', conditionMessage(e)))
    message('[', label, '] failed', if (length(http_status)) paste0(': ', http_status) else
              ' (check configuration, service availability and credentials)')
    NULL
  })
}

# ---- 1. Resolve identity, synonyms and source-specific mappings ---------------
mapping_status <- tibble::tibble(stage = character(), query = character(), status = character())
mapping_attempt <- function(stage, query, expr) {
  value <- safely_run(paste(stage, query), expr)
  mapping_status <<- bind_rows(mapping_status, tibble::tibble(
    stage = stage, query = query,
    status = if (is.null(value)) 'unresolved' else if (is.data.frame(value) && !nrow(value))
      'no_match' else 'resolved'))
  value
}
lookup <- cached_chemical_lookup(syr4_dir)
chemicals <- map_dfr(chemical_queries, function(query) {
  identity <- mapping_attempt('identity', query, resolve_chemical_identity(query, lookup))
  # A known CASRN still permits AQS discovery if CompTox is unavailable.
  if (is.null(identity)) tibble::tibble(query = query, name = query,
    casrn = if (grepl('^[0-9]{2,7}-[0-9]{2}-[0-9]$', query)) query else NA_character_,
    dtxsid = NA_character_) else identity
}) |>
  distinct(casrn, dtxsid, name, .keep_all = TRUE)
aliases <- map_dfr(seq_len(nrow(chemicals)), function(i) {
  identity <- chemicals[i, ]
  if (is.na(identity$dtxsid)) return(NULL)
  synonyms <- mapping_attempt('synonyms', identity$casrn,
    cached_catalog(file.path(syr4_dir, paste0(identity$dtxsid, '-synonyms.rds')),
                   function() ComptoxR::ct_chemical_synonym_search(identity$dtxsid)))
  chemical_aliases(identity, synonyms)
})
# Keep a typed empty table if no identity could be resolved.
if (!ncol(aliases)) aliases <- tibble::tibble(casrn = character(), dtxsid = character(),
                                             alias = character(), key = character())
sdwis_catalog <- mapping_attempt('SDWIS catalog', 'CONTAMINANT_CODE',
  cached_catalog(file.path(syr4_dir, 'sdwis-contaminants-v1.rds'), function() {
    out <- occurrence_sdwis_fetch()
    if (!nrow(out) || !all(c('value_code', 'value_description') %in% names(out)))
      stop('SDWIS reference catalog is empty or malformed')
    if (nrow(out) >= 10000) stop('SDWIS reference catalog was truncated')
    out
  }))
sdwis_mappings <- tibble::tibble(casrn = character(), dtxsid = character(),
                                 contaminant_code = character(), source_name = character())
if (!is.null(sdwis_catalog)) {
  candidates <- match_sdwis_candidates(aliases, sdwis_catalog)
  sdwis_mappings <- bind_rows(sdwis_mappings, map_dfr(seq_len(nrow(candidates)), function(i) {
    mapping_attempt('SDWIS identity verification', candidates$source_name[i],
                    verify_sdwis_candidate(candidates[i, ], lookup))
  }))
}
# Directory reads transfer only ZIP footers. The inventory includes failed
# archives explicitly so a partial catalog is not presented as complete coverage.
inventory <- mapping_attempt('SYR4 inventory', 'EPA download page', syr4_inventory(syr4_dir))
syr4_sources <- tibble::tibble(casrn = character(), dtxsid = character(), url = character(),
                               zip = character(), member = character())
if (!is.null(inventory))
  syr4_sources <- match_syr4_candidates(aliases, inventory, sdwis_mappings)
syr4_sources <- inner_join(select(chemicals, chemical = name, casrn), syr4_sources, by = 'casrn')

# Exact CASRN matching avoids name/synonym ambiguity. Retain ALL matching AQS
# parameters, including historic codes; phase, units and validity stay visible.
match_aqs_parameters <- function(chemicals, catalog) {
  required <- c('CAS Number', 'Parameter Code', 'Parameter', 'Standard Units', 'Still Valid')
  if (!all(required %in% names(catalog))) stop('Unexpected AQS parameter catalog columns')
  catalog <- tibble::as_tibble(catalog) |>
    transmute(casrn = trimws(.data[['CAS Number']]),
              aqs_param = .data[['Parameter Code']],
              parameter_name = Parameter, parameter_units = .data[['Standard Units']],
              still_valid = .data[['Still Valid']])
  inner_join(select(chemicals, name, casrn), catalog, by = 'casrn') |>
    distinct()
}
# This public CSV provides the CASRN crosswalk; aqsually's parameter-by-class
# lookup does not replace that catalog. All sample/annual API requests below
# are handled by aqsually.
aqs_parameters <- safely_run('AQS parameter catalog', {
  catalog <- cached_catalog(file.path(syr4_dir, 'aqs-parameters-v1.rds'), function() {
    response <- request('https://aqs.epa.gov/aqsweb/documents/codetables/parameters.csv') |>
      req_timeout(60) |> req_perform()
    read.csv(text = resp_body_string(response), colClasses = 'character', check.names = FALSE)
  })
  match_aqs_parameters(chemicals, catalog)
})
source_coverage <- chemicals |>
  transmute(name, casrn, dtxsid, mmdb_resolved = !is.na(dtxsid),
            aqs_catalog_loaded = !is.null(aqs_parameters),
            aqs_mapped = casrn %in% aqs_parameters$casrn,
            sdwis_catalog_loaded = !is.null(sdwis_catalog),
            sdwis_mapped = casrn %in% sdwis_mappings$casrn,
            syr4_inventory_complete = !is.null(inventory) && all(inventory$inventory_ok),
            syr4_candidate_found = casrn %in% syr4_sources$casrn)

# Mapping-only mode discovers identifiers and file candidates without sample
# downloads. SYR4 candidates become verified mappings only after header validation.
sdwis_exceedances <- syr4 <- syr4_community <- syr4_finished <- NULL
syr4_summary <- syr4_concentrations <- air_samples <- mmdb_water_air <- NULL
syr4_mappings <- tibble::tibble(casrn = character(), syr4_url = character(),
                               syr4_member = character(), ANALYTE_CODE = character())
source_coverage$syr4_verified <- NA
if (isTRUE(getOption('occurrence.mapping_only', FALSE))) {
  print(source_coverage)
} else {

# ---- 2. Optional SDWIS violation measures (not individual samples) ------------
# Use only code/name candidates that were verified against the same DTXSID.
sdwis_exceedances <- if (run_sdwis) safely_run('sdwis', {
  old_options <- options(epaechoverse.request = list(timeout = 900))
  joined <- inner_join(select(chemicals, name, casrn), sdwis_mappings, by = 'casrn')
  pmap_dfr(select(joined, name, casrn, contaminant_code), function(name, casrn, contaminant_code) {
    out <- safely_run(paste('sdwis', casrn, contaminant_code), occurrence_sdwis_fetch(contaminant_code))
    if (is.null(out) || !nrow(out)) return(NULL)
    if (nrow(out) >= 10000) warning('SDWIS row cap reached for ', contaminant_code, '; pagination needed')
    out |>
      filter(!is.na(viol_measure)) |>
      select(pwsid, violation_code, viol_measure, unit_of_measure,
             compl_per_begin_date, compl_per_end_date, primacy_agency_code) |>
      mutate(chemical = name, casrn = casrn, contaminant_code = contaminant_code)
  })
}) else NULL
if (run_sdwis) options(old_options)

# ---- 3. Drinking water: Six-Year Review 4 compliance results -----------------
# State compliance-monitoring results for regulated chemicals, 2012-2019, one tab-
# delimited SUMMARY_ANALYTE_<name>.txt per analyte inside phase-chemical ZIPs listed
# on https://www.epa.gov/node/288409 (user guide linked there). Each row is one
# sample: DETECT (0 = not detected), VALUE and UNIT (detects only), DETECTION_LIMIT_*,
# SYSTEM_TYPE (C = community water system), PWSID, STATE_CODE, SAMPLE_COLLECTION_DATE.
# ~95 MB and ~81 MB downloads; cached in syr4_dir.
syr4_read <- function(chemical, casrn, dtxsid, url, zip, member) {
  if (basename(zip) != zip || !grepl('\\.zip$', zip) || basename(member) != member)
    stop('SYR4 mappings must use ZIP and member filenames, not paths')
  path <- file.path(syr4_dir, zip)
  if (!file.exists(path)) {
    partial <- tempfile(tmpdir = syr4_dir, fileext = '.part')
    on.exit(unlink(partial), add = TRUE)
    old_timeout <- options(timeout = 3600)
    on.exit(options(old_timeout), add = TRUE)
    download.file(url, partial, mode = 'wb', quiet = TRUE)
    if (!file.rename(partial, path)) stop('Could not cache downloaded SYR4 archive')
  }
  expected_codes <- sdwis_mappings$contaminant_code[sdwis_mappings$casrn == casrn]
  validate_syr4_member(path, member, expected_codes)
  utils::read.delim(
    unz(path, member), quote = '"', stringsAsFactors = FALSE, check.names = FALSE,
    colClasses = 'character'
  ) |>
    tibble::as_tibble() |>
    mutate(chemical = chemical, casrn = casrn, syr4_url = url, syr4_member = member)
}

syr4 <- safely_run('syr4', {
  raw <- pmap_dfr(syr4_sources, function(chemical, casrn, dtxsid, url, zip, member) {
    safely_run(paste('SYR4', casrn), syr4_read(chemical, casrn, dtxsid, url, zip, member))
  })
  if (!nrow(raw)) NULL else raw |>
    mutate(
      detected = case_when(DETECT == '1' ~ TRUE, DETECT == '0' ~ FALSE, TRUE ~ NA),
      value = suppressWarnings(as.numeric(VALUE)),
      detection_limit = suppressWarnings(as.numeric(DETECTION_LIMIT_VALUE)),
      date = as.Date(SAMPLE_COLLECTION_DATE, format = '%d-%b-%y')
    )
})

syr4_mappings <- if (!is.null(syr4)) distinct(syr4, casrn, syr4_url, syr4_member, ANALYTE_CODE) else
  tibble::tibble(casrn = character(), syr4_url = character(), syr4_member = character(), ANALYTE_CODE = character())
source_coverage$syr4_verified <- source_coverage$casrn %in% syr4_mappings$casrn
print(source_coverage)

# Detection rates use finished-water community-system samples, including nondetects whose
# UNIT is blank. Concentrations remain separated by their reported units.
syr4_community <- if (!is.null(syr4)) filter(syr4, SYSTEM_TYPE == 'C') else NULL
# Exclude raw water and unknown treatment status. Keep all CWS records separately
# so callers can inspect excluded/unknown sampling locations.
syr4_finished <- if (!is.null(syr4_community))
  filter(syr4_community, SOURCE_TYPE_CODE == 'FN',
         !SAMPLING_POINT_TYPE %in% c('RW', 'SR'), SAMPLE_TYPE_CODE != 'FB') else NULL
syr4_summary <- if (!is.null(syr4_finished)) safely_run('syr4 summary', {
  syr4_finished |>
    group_by(chemical, casrn) |>
    summarise(samples = n(), known_detection = sum(!is.na(detected)),
              detects = sum(detected, na.rm = TRUE),
              pct_detect = 100 * mean(detected, na.rm = TRUE),
              systems_with_detect = n_distinct(PWSID[detected %in% TRUE]),
              .groups = 'drop')
}) else NULL
syr4_concentrations <- if (!is.null(syr4_finished)) safely_run('syr4 concentrations', {
  syr4_finished |>
    filter(detected %in% TRUE, is.finite(value), nzchar(UNIT)) |>
    group_by(chemical, casrn, UNIT) |>
    summarise(median_detect = median(value),
              p95_detect = quantile(value, 0.95, names = FALSE),
              max_detect = max(value), .groups = 'drop')
}) else NULL
print(syr4_summary)
print(syr4_concentrations)

# ---- 4. Ambient air: AQS individual samples ------------------------------------
# aqs_fetch() delegates authentication, request construction and HTTP handling
# to aqsually. AQS_KEY is read from the environment on each client request.

air_samples <- safely_run('aqs', {
  if (is.null(aqs_parameters) || !nrow(aqs_parameters)) stop('No mapped AQS parameters')
  grid <- merge(select(aqs_parameters, name, casrn, aqs_param), aqs_scope, by = NULL)
  pmap_dfr(grid, function(name, casrn, aqs_param, state, year) {
    out <- safely_run(paste('aqs', name, state, year), aqs_fetch(aqs_param, state, year, pause = aqs_pause))
    if (is.null(out)) NULL else mutate(out, chemical = name, casrn = casrn)
  })
})
# Retain sample_measurement, units_of_measure, detection_limit, qualifier,
# and any null_data_code/mdl fields supplied by the service, along with
# method, sample_duration and site/date fields. Do not infer detections simply
# from a positive value: retain reporting qualifiers and detection limits.
# Annual summaries are available with aqs_fetch(..., service = 'annualData').

# ---- 5. Both media: CompTox MMDB ---------------------------------------------
mmdb <- safely_run('mmdb', {
  ids <- stats::na.omit(chemicals$dtxsid)
  if (!length(ids)) stop('no resolved DTXSIDs; MMDB skipped')
  map_dfr(ids, function(id) {
    safely_run(paste('MMDB', id), ComptoxR::ct_exposure_mmdb_single_sample(id))
  })
})
# MMDB is supplementary; its drinking-water records are not restricted to CWS.
mmdb_water_air <- NULL
if (!is.null(mmdb) && all(c('dtxsid', 'harmonizedMedium') %in% names(mmdb))) {
  print(count(mmdb, dtxsid, harmonizedMedium, sort = TRUE), n = 40)
  mmdb_water_air <- filter(mmdb, harmonizedMedium %in% c('drinking water', 'ambient air'))
}

} # end sample retrieval

# ---- Results -----------------------------------------------------------------
# sdwis_exceedances   drinking water, violations only
# syr4_community     all CWS compliance records, including raw/unknown water
# syr4_finished      finished-water CWS records (2012-2019)
# syr4_summary       finished-water detection rates
# syr4_concentrations detected-value quantiles, separated by unit
# air_samples         ambient air, individual samples with qualifiers
# mmdb_water_air      drinking water / ambient air records in MMDB (may be empty), literature/monitoring compilation

# Run with dependencies installed and credentials loaded, for example:
# options(occurrence.chemicals = c('atrazine', '117-81-7', 'benzene'))
# options(occurrence.aqs_scope = data.frame(state = '26', year = 2002))
# options(occurrence.mapping_only = TRUE) # optional: identifiers/file candidates only
# Sys.setenv(OCCURRENCE_OUTPUT = 'occurrence-results')
# source('inst/examples/occurrence_chemicals.R')
# Optional export: set OCCURRENCE_OUTPUT to a directory before sourcing.
output_dir <- Sys.getenv('OCCURRENCE_OUTPUT')
if (nzchar(output_dir)) {
  dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)
  results <- list(chemicals = chemicals, source_coverage = source_coverage,
                  aqs_parameters = aqs_parameters, aqs_scope = aqs_scope,
                  sdwis_mappings = sdwis_mappings, syr4_candidates = syr4_sources,
                  syr4_mappings = syr4_mappings,
                  mapping_status = mapping_status,
                  syr4_community = syr4_community,
                  syr4_finished = syr4_finished,
                  syr4_summary = syr4_summary, syr4_concentrations = syr4_concentrations,
                  air_samples = air_samples, mmdb_water_air = mmdb_water_air,
                  sdwis_exceedances = sdwis_exceedances)
  saveRDS(results, file.path(output_dir, 'occurrence_results.rds'))
  for (name in names(results)) {
    if (is.data.frame(results[[name]]))
      write.csv(results[[name]], file.path(output_dir, paste0(name, '.csv')), row.names = FALSE)
  }
}
