# Identifier and source discovery helpers. Sourcing this file makes no requests.
# Matching names only generates candidates. SDWIS candidates must resolve back to
# the same DTXSID; SYR4 imports must contain an independently verified SDWIS code.

chemical_name_key <- function(x) tolower(gsub('[^[:alnum:]]', '', x))

resolve_chemical_identity <- function(query, lookup = ComptoxR::ct_chemical_search_equal) {
  hits <- lookup(query)
  if (!all(c('dtxsid', 'casrn', 'preferredName') %in% names(hits)))
    stop('Chemical lookup returned no usable identifiers')
  if (grepl('^[0-9]{2,7}-[0-9]{2}-[0-9]$', query))
    hits <- hits[!is.na(hits$casrn) & hits$casrn == query, , drop = FALSE]
  ids <- unique(hits[c('dtxsid', 'casrn')])
  ids <- ids[!is.na(ids$dtxsid) & !is.na(ids$casrn), , drop = FALSE]
  if (nrow(ids) != 1L) stop('Chemical lookup is absent or ambiguous')
  hit <- hits[which(hits$dtxsid == ids$dtxsid & hits$casrn == ids$casrn)[1], ]
  tibble::tibble(query = query, name = as.character(hit$preferredName),
                 casrn = as.character(hit$casrn), dtxsid = as.character(hit$dtxsid))
}

cached_catalog <- function(path, fetch, max_age_days = 7) {
  fresh <- file.exists(path) &&
    as.numeric(difftime(Sys.time(), file.info(path)$mtime, units = 'days')) < max_age_days
  if (fresh && !isTRUE(getOption('occurrence.refresh_catalogs', FALSE))) return(readRDS(path))
  value <- fetch()  # Failed refreshes do not overwrite a previously successful cache.
  dir.create(dirname(path), recursive = TRUE, showWarnings = FALSE)
  saveRDS(value, path)
  value
}

# Cache each successful lookup, keyed by its complete query string.
cached_chemical_lookup <- function(cache_dir, lookup = ComptoxR::ct_chemical_search_equal) {
  path <- file.path(cache_dir, 'chemical-lookups-v1.rds')
  entries <- if (file.exists(path)) readRDS(path) else list()
  function(query) {
    entry <- entries[[query]]
    if (!is.null(entry) && !isTRUE(getOption('occurrence.refresh_catalogs', FALSE)) &&
        as.numeric(difftime(Sys.time(), entry$time, units = 'days')) < 7) return(entry$value)
    value <- lookup(query)
    entries[[query]] <<- list(time = Sys.time(), value = value)
    dir.create(cache_dir, recursive = TRUE, showWarnings = FALSE)
    saveRDS(entries, path)
    value
  }
}

chemical_aliases <- function(identity, synonyms) {
  # CompTox's valid/good fields are semicolon-delimited; deleted/other names and
  # alternate CASRNs are deliberately excluded from candidate generation.
  values <- unlist(synonyms[intersect(c('valid', 'good'), names(synonyms))], use.names = FALSE)
  aliases <- unique(trimws(c(identity$name, identity$query,
                             unlist(strsplit(values[!is.na(values)], ';', fixed = TRUE)))))
  aliases <- aliases[!is.na(aliases) & nzchar(aliases)]
  tibble::tibble(casrn = identity$casrn, dtxsid = identity$dtxsid,
                 alias = aliases, key = chemical_name_key(aliases)) |>
    dplyr::filter(nzchar(key)) |>
    dplyr::distinct()
}

match_sdwis_candidates <- function(aliases, catalog) {
  if (!all(c('value_code', 'value_description') %in% names(catalog)))
    stop('Unexpected SDWIS reference catalog columns')
  codes <- dplyr::transmute(catalog, contaminant_code = as.character(value_code),
                           source_name = value_description,
                           key = chemical_name_key(value_description))
  dplyr::inner_join(aliases, codes, by = 'key', relationship = 'many-to-many') |>
    dplyr::distinct(casrn, dtxsid, contaminant_code, source_name)
}

verify_sdwis_candidate <- function(candidate, lookup) {
  identity <- resolve_chemical_identity(candidate$source_name, lookup)
  if (!identical(identity$dtxsid, candidate$dtxsid) || !identical(identity$casrn, candidate$casrn))
    stop('SDWIS candidate resolves to a different chemical')
  candidate
}

# Read the standard ZIP central directory, not the compressed sample files.
# ZIP64/multipart or malformed archives fail explicitly rather than being guessed.
zip_directory_info <- function(bytes) {
  uint <- function(pos, n) {
    if (pos < 1 || pos + n - 1 > length(bytes)) stop('Truncated ZIP directory')
    sum(as.integer(bytes[seq.int(pos, length.out = n)]) * 256^(0:(n - 1)))
  }
  if (length(bytes) < 22) stop('Missing ZIP end record')
  ends <- which(bytes == as.raw(0x50))
  ends <- rev(ends[ends <= length(bytes) - 21])
  for (pos in ends) {
    if (!identical(bytes[pos + 0:3], as.raw(c(0x50, 0x4b, 5, 6)))) next
    if (pos + 21 + uint(pos + 20, 2) != length(bytes)) next
    count <- uint(pos + 10, 2)
    size <- uint(pos + 12, 4)
    offset <- uint(pos + 16, 4)
    if (uint(pos + 4, 2) != 0 || uint(pos + 6, 2) != 0 ||
        uint(pos + 8, 2) != count || count == 65535 ||
        size == 4294967295 || offset == 4294967295)
      stop('ZIP64 or multipart archives are not supported')
    return(list(position = pos, count = count, size = size, offset = offset))
  }
  stop('Missing ZIP end record')
}

parse_zip_members <- function(bytes, info = zip_directory_info(bytes)) {
  uint <- function(pos, n) {
    if (pos < 1 || pos + n - 1 > length(bytes)) stop('Truncated ZIP directory')
    sum(as.integer(bytes[seq.int(pos, length.out = n)]) * 256^(0:(n - 1)))
  }
  pos <- info$position - info$size
  if (pos < 1) stop('ZIP directory exceeds downloaded footer')
  members <- character(info$count)
  for (i in seq_len(info$count)) {
    if (!identical(bytes[pos + 0:3], as.raw(c(0x50, 0x4b, 1, 2))))
      stop('Invalid ZIP directory entry')
    name_size <- uint(pos + 28, 2)
    extra_size <- uint(pos + 30, 2)
    comment_size <- uint(pos + 32, 2)
    end <- pos + 45 + name_size
    if (!name_size || end >= info$position) stop('Invalid ZIP member name')
    members[i] <- rawToChar(bytes[seq.int(pos + 46, end)])
    pos <- end + 1 + extra_size + comment_size
  }
  if (pos != info$position) stop('Unexpected ZIP directory length')
  members
}

remote_zip_members <- function(url) {
  fetch <- function(size) {
    resp <- httr2::request(url) |>
      httr2::req_headers(Range = paste0('bytes=-', size)) |>
      httr2::req_options(maxfilesize = 16 * 1024^2) |>
      httr2::req_timeout(60) |>
      httr2::req_perform()
    if (httr2::resp_status(resp) != 206) stop('ZIP server did not honor range request')
    httr2::resp_body_raw(resp)
  }
  bytes <- fetch(65557)
  info <- zip_directory_info(bytes)
  if (info$size > info$position - 1) {
    required <- info$size + length(bytes) - info$position + 1
    if (required > 16 * 1024^2) stop('ZIP directory exceeds 16 MB inventory limit')
    bytes <- fetch(required)
    info <- zip_directory_info(bytes)
  }
  parse_zip_members(bytes, info)
}

syr4_archive_urls <- function(html, page_url) {
  links <- regmatches(html, gregexpr('href=["\x27][^"\x27]+\\.zip["\x27]', html,
                                     ignore.case = TRUE))[[1]]
  links <- sub('^href=["\x27]', '', links, ignore.case = TRUE)
  links <- sub('["\x27]$', '', links)
  links <- gsub('&amp;', '&', links, fixed = TRUE)
  links <- vapply(links, function(link) {
    if (startsWith(link, '/')) paste0('https://www.epa.gov', link) else link
  }, character(1))
  unique(links[grepl('^https://www\\.epa\\.gov/.*syr4.*\\.zip$', links, ignore.case = TRUE)])
}

syr4_inventory <- function(cache_dir) {
  page_url <- 'https://www.epa.gov/dwsixyearreview/six-year-review-4-compliance-monitoring-data-2012-2019'
  urls <- cached_catalog(file.path(cache_dir, 'syr4-archive-urls-v1.rds'), function() {
    html <- httr2::request(page_url) |> httr2::req_timeout(60) |>
      httr2::req_perform() |> httr2::resp_body_string()
    links <- syr4_archive_urls(html, page_url)
    if (!length(links)) stop('No SYR4 ZIP links found on EPA download page')
    links
  })
  purrr::map_dfr(urls, function(url) {
    tryCatch({
      members <- cached_catalog(file.path(cache_dir, paste0(basename(url), '.members.rds')),
                                function() remote_zip_members(url))
      tibble::tibble(url = url, zip = basename(url), member = members,
                     inventory_ok = TRUE)
    }, error = function(e) {
      message('SYR4 directory unavailable: ', basename(url))
      tibble::tibble(url = url, zip = basename(url), member = NA_character_, inventory_ok = FALSE)
    })
  })
}

match_syr4_candidates <- function(aliases, inventory, sdwis_mappings) {
  members <- inventory |>
    dplyr::filter(inventory_ok, grepl('^SUMMARY_ANALYTE_.*\\.txt$', basename(member), ignore.case = TRUE)) |>
    dplyr::mutate(key = chemical_name_key(sub('\\.txt$', '',
                               sub('^SUMMARY_ANALYTE_', '', basename(member), ignore.case = TRUE),
                               ignore.case = TRUE)))
  dplyr::inner_join(aliases, members, by = 'key', relationship = 'many-to-many') |>
    dplyr::filter(casrn %in% sdwis_mappings$casrn) |>
    dplyr::distinct(casrn, dtxsid, url, zip, member)
}

validate_syr4_member <- function(path, member, expected_codes) {
  connection <- unz(path, member)
  open(connection, 'r')
  on.exit(close(connection))
  row <- utils::read.delim(connection, nrows = 1, colClasses = 'character', check.names = FALSE)
  if (!nrow(row) || !'ANALYTE_CODE' %in% names(row) ||
      !row$ANALYTE_CODE[1] %in% expected_codes)
    stop('SYR4 analyte code does not match a verified SDWIS mapping')
  row$ANALYTE_CODE[1]
}
