# echoverse

An R client for the web services of the U.S. EPA's
[Enforcement and Compliance History Online (ECHO)](https://echo.epa.gov/tools/web-services)
and for [Envirofacts](https://enviro.epa.gov/). It has 579 ECHO functions
covering every route in ECHO's published Swagger schemas (duplicate lookup routes
are folded together) plus a few routes ECHO uses but does not document, and 416
`envirofacts_*` functions, one per table in EPA's published Envirofacts (DMAP)
OpenAPI document. The wrappers are generated
with [specmill](https://github.com/seanthimons/specmill) and need no API key.

This is an unofficial client, not affiliated with or endorsed by the EPA. It is
a development version (`0.0.0.9000`): names can still change.

## Install

```r
# install.packages('remotes')
remotes::install_github('seanthimons/epaechoverse')
```

## Quick start

ECHO searches are two-step. A search returns a summary with a query ID and a row
count; you then fetch the rows with the query ID, or download them all as CSV.

```r
library(echoverse)

# Drinking-water systems in Rhode Island
res <- sdw_get_systems(p_st = 'RI')  # a one-row tibble: QueryRows, QueryID, counters
res$QueryRows
systems <- echo_qid_all(res, 'sdw')  # every row, as a tibble

downloaded <- sdw_get_download(qid = res$QueryID)  # all rows from the CSV, typed like echo_qid_all()

# Code lookups
lookup_states()
```

Responses are plain R lists (JSON) or strings (CSV, XML), except the lookup
functions, the searches (`*_get_facilities`, `*_get_systems`, `*_get_facility_info`,
`*_get_qid`, `*_get_download`) of twelve services, 13 `wplt_*` report routes and the
`dfr_*`, `caa_*` and `eff_*` reports, which return tibbles or lists of tibbles (see
below). Pass `tidy = FALSE` to any of them for the plain list or text.
Query parameters are the function arguments; see `?sdw_get_systems` for the ones a route accepts.
Routes that accept POST (all but the NNCR and biosolids routes) also have a
`_post` variant that usually takes its parameters as `body = list(...)`; a few
take named arguments or none, so check the help page.

To see the request without sending it:

```r
echoverse_dry_run(TRUE)
req <- cwa_get_facilities(p_st = 'RI', p_maj = 'Y')  # an httr2 request
echoverse_dry_run(FALSE)
```

`echoverse_run_verbose(TRUE)` prints each method and response status.

## Search results as tibbles

For the searches of `sdw`, `cwa`, `rcra`, `air`, `echo`, `compscreen`, `case`,
`ecattaqs`, `ecattams`, `ecattems` and the `cwa_viotrack` and `rcra_viotrack`
violation trackers,
up to three kinds of function return tibbles:

- **The search** (`*_get_facilities`, `sdw_get_systems`, `case_get_cases`) returns
  the query *summary* as a one-row tibble: the row counters as numbers
  (`QueryRows`, `CVRows`, ...), `TotalPenalties` as a number (`"$157,500"` is
  `157500`), `QueryID` as text. With `tablelist = 'Y'` the first page of facilities
  is in `attr(, 'facilities')` (the cases, for `case_get_cases`). The air monitoring searches
  (`ecattaqs_get_facilities`, `ecattams_get_facilities`) and the emission screener
  (`ecattems_get_ems`) answer with the rows instead, like `get_facility_info`.
- **`get_qid`** returns one page of rows (500 to 5,000, depending on the service),
  and **`echo_qid_all()`** fetches every page.
- **`*_get_facility_info`** (`case_get_case_info` for cases; not `sdw` or
  `compscreen`) returns the matching rows as a tibble,
  with `attr(, 'query')`, `attr(, 'summary')` (the summary tibble) and
  `attr(, 'parameters')` (the search as ECHO read it) and, for the air monitoring
  services, `attr(, 'columns')` (ECHO's column list). ECHO answers a large query
  with clusters instead of facilities (110 clusters for the 22,508 facilities in
  Rhode Island): the tibble then has no rows, the clusters are in
  `attr(, 'cluster_output')`, and the call warns. Use `echo_qid_all()` for the rows
  of such a query.

```r
search <- cwa_get_facilities(p_st = 'RI', p_maj = 'Y')
search$QueryRows                    # 25
rows <- echo_qid_all(search, 'cwa') # a tibble with all 25 rows
attr(rows, 'query')                 # query ID, rows ECHO reports, rows returned, pages

page <- cwa_get_qid(qid = search$QueryID, pageno = 2)  # one page, also a tibble
cwa_get_qid(qid = search$QueryID, tidy = FALSE)        # the decoded list

info <- cwa_get_facility_info(p_st = 'RI', p_zip = '02840')
attr(info, 'summary')$QueryRows
```

Attributes are lost by operations such as `dplyr::bind_rows()`, so read them first.
Other `output` formats (CSV, XML, GeoJSON) are always returned as sent.

Columns are typed from ECHO's own `metadata` routes, service by service
(`inst/extdata/echo-fields.csv`, written by `dev/build_echo_fields.R`; the services
disagree about some fields, such as `CurrSvFlag`, a number in most and text in
`compscreen`): numbers (counts, amounts, coordinates) are
doubles, dates (`MM/DD/YYYY`) are `Date`s, and everything else, including IDs, zip
codes and FIPS codes, stays text, so `"02840"` keeps its zero. Pages are typed
together, so a column cannot change type between them. A `$` and thousands commas
are dropped from numbers. If any value in a numeric or date column does not
convert, the whole column stays text and the call warns, so nothing is lost. A
field the metadata does not describe stays text (the emission screener has no
metadata route, so its types were frozen from a reviewed live sample by the same
script), and so does an array of plain
values in a record, which is pasted together with `, `. `echo_qid_all()` stops when the
rows ECHO reports are in, at an empty page, or after `max_pages` (default 20,
which is 100,000 rows) with a warning that says how many rows were left. Arguments
such as `qcolumns` (fewer columns) or `newsort` are passed on.

## Water pollutant loading tool reports

Thirteen `wplt_*` routes return one flat list of records beside a few summary
fields (`wplt_get_all_dmr_facilities`, `wplt_get_all_tri_facilities`,
`wplt_get_custom_data_annual`, `_facility` and `_monitor_pd`,
`wplt_get_dashboard_chemicals`, `_facilities`, `_npdes` and `_industries`,
`wplt_get_loading_tool_params`, `wplt_get_permit_limits`,
`wplt_get_monitoring_data_csv` and `wplt_get_watershed_facilities`, and their
`_post` twins). They return the records as a tibble with the summary fields in
`attr(, 'summary')`. Every column is text, blank values are `NA`: the service
declares every field a string and has no metadata route, so nothing is guessed.
The other loading tool reports (facility reports, loads, multi-year detail) are nested
objects and stay lists. `tidy = FALSE` returns the decoded list.

## Nested reports (`dfr`, `caa`) and CSV downloads

The detailed facility report (`dfr_*`), air pollutant report (`caa_*`) and effluent
chart (`eff_*`) routes that return a JSON report return a **named list of tibbles**, one per table in the
report: an array of records is a table, the plain values of an object are a one-row
table, and names are the path through the report (`ComplianceSummary.Source`); the
plain values at the top are `summary`. Columns are text, blank values are `NA`, and
a record's own nested values stay list-columns, so nothing is lost. The formatter
does not fail on an unfamiliar shape. The `eff_*` routes answer in JSONP unless you
pass `output = 'JSON'`, and JSONP is returned as text. The CSV and ZIP file routes and the map
and spatial-metadata routes (mapping is on hold) stay as they are.

Each search service's `*_get_download(qid = )` returns the query's rows as a tibble
typed like `get_qid` (`tidy = FALSE` returns the CSV text). The download has its own
default column set, and the CSV can differ from the JSON in small ways (leading
spaces, `0` versus empty), because the service renders them separately; a few
services head their CSV with database column names, which are renamed to the field
names.

## Tidy lookups

The 81 lookup functions (`lookup_*`, `wplt_lookups_*`, `cwa_lookups_*`,
`ecattaqs_lookups_*`, `ecattams_lookups_*`, and their `_post` twins) return a
tibble by default:

```r
lookup_states()
lookup_ghg_years()
lookup_states(tidy = FALSE)  # the decoded list, as ECHO sent it
```

Every column is text: lookups are code and description labels (a year such as
`"2023"` is a label, and codes like `"01"` must keep their zeros), and ECHO sends
every value as a string, so nothing is converted. Blank strings and nulls are
`NA`, and line breaks inside text are `\n`. With another `output` format (JSONP or
XML) the response is returned undecoded, as a string or raw vector. The other ECHO functions still return lists.

## Envirofacts tables

Envirofacts serves one function per table through EPA's DMAP service, named
`envirofacts_<program>_<table>`, for example `envirofacts_sdwis_water_system`.
The programs and their table counts are ACRES (110), ICIS (96), RCRA (89), TRI
(35), SDWIS (21), FRS (20), NEI (18), RadNet (17), NGGS (8) and SEMS (2).

```r
# Community water systems in Rhode Island: the first 5 rows, as a tibble
systems <- envirofacts_sdwis_water_system(
  c('state_code/equals/RI', 'pws_type_code/equals/CWS'),
  first = 1, last = 5
)

violations <- envirofacts_sdwis_violation('pwsid/beginsWith/RI', last = 50)
violations$compl_per_begin_date  # POSIXct, not text
```

- `filter` is a character vector of `column/operator/value` conditions that must
  all hold. Operators include `equals`, `beginsWith` and `contains`; the service
  names a bad column or operator in its error. Values may not contain
  `/`, `\` or `%`, and the service rejected a value containing a dot when
  tested.
- `first` and `last` are 1-based row numbers (default `1` and `100`). The service
  returns a whole table when no range is given, so the range is always sent and
  one call is limited to 10,000 rows. Raise the limit with
  `options(echoverse.max_rows = 50000)`. For more rows, page with
  consecutive ranges.
- `format` is `'json'` (the default) or `'csv'`. Both give the same tibble.
- `tidy = TRUE` (the default) returns a tibble whose columns have the types in
  EPA's schema: integer, double, `Date`, `POSIXct` (the service gives timestamps
  without a time zone; they are labelled UTC) and character. Nulls and blank
  strings are both `NA`, and line breaks inside text are `\n`. Columns come in the
  order the service sends them, and an empty result is a zero-row tibble with all
  the table's columns. With `tidy = FALSE` you get the service response as sent:
  a list of records for `'json'`, a string for `'csv'`.
- Tables and columns are listed in EPA's
  [DMAP OpenAPI document](https://data.epa.gov/api-cache/metadata/openapi_swagger.json),
  kept unchanged in `apis/`; see `?envirofacts_sdwis_water_system`.

## Function names

Names are `<api>_<route>`, for example `sdw_get_systems`, `dfr_get_dfr` or
`lookup_naics_codes`. The prefix is the ECHO service:

| Prefix | Service | Functions |
|---|---|---|
| `air`, `cwa`, `rcra`, `sdw`, `echo` | Facility search: Clean Air Act, Clean Water Act, RCRA hazardous waste, drinking water, all data | 16, 18, 16, 8, 16 |
| `dfr` | Detailed facility report | 124 |
| `case` | Enforcement cases | 20 |
| `compscreen` | Corporate compliance screener | 22 |
| `eff` | Effluent charts | 6 |
| `nncr` | NPDES noncompliance report | 4 |
| `wplt` | Water pollutant loading tool | 80 |
| `ecattaqs`, `ecattams`, `ecattems` | Air monitoring stations (criteria, hazardous pollutants) and emission screener | 30, 46, 6 |
| `caa` | Air pollutant report | 12 |
| `biosolids` | Biosolids reporting | 1 |
| `lookup` | Code lookup tables | 112 |
| `cwa_viotrack`, `rcra_viotrack` | Violation trackers | 8, 8 |
| `dfr_demographics` | Demographics by facility ID | 4 |
| `micro`, `pipeline` | Microservices (FRS ID lookup, monitoring sites) and enforcement pipeline | 4, 4 |
| `caa_csv` | Air pollutant report as CSV | 2 |
| `air_viotrack`, `ecatt_nif` | Government-only services (see below) | 8, 4 |
| `envirofacts` | Envirofacts tables, `envirofacts_<program>_<table>` | 416 |

Lookups that only one service describes keep that service's prefix (for example
`wplt_lookups_dmr_watersheds`). Lookups that the `lookup` API also covers exist
only as `lookup_*`.

## Errors and retries

ECHO reports most errors as HTTP 200 with the message in the body. This client
turns those into R errors of class `echo_error`, so `tryCatch()` sees them.
HTTP failures keep their usual classes and, when ECHO sent a message, also gain
the `echo_error` class and that message.

Envirofacts reports errors as `{"error": ...}` with HTTP 404 or 500; those become
`echo_error` conditions carrying the service's message too.

ECHO requests time out after 60 seconds (Envirofacts: 120) and retry up to twice on 408, 429, 502, 503
and 504. HTTP 500 is not retried: ECHO answers a query it cannot process with a
500 every time. Override per session with
`options(echoverse.request = list(timeout = 120, max_retries = 0))`.

## Known quirks

- **Government-only routes.** `air_viotrack_*` and `ecatt_nif_*` are not served
  on ECHO's public path (they return HTTP 404). ECHO's own site sends government
  and EPA users to `/echogov`, behind EPA single sign-on, which this client cannot
  do. They are included for completeness.
- **Malformed JSON from ECHO.** The `pipeline_*` routes and `micro_get_frs_id`
  return invalid JSON when an ID has no records. The client repairs those two
  cases.
- **`dfr_demographics_get_demographics_by_id`** is the unversioned route name
  the ECHO site uses and currently returns HTTP 500. Use
  `dfr_demographics_get_acs2023x_demographics_by_id`.
- **Routes without a schema.** The violation trackers, microservices, pipeline,
  demographics and CSV routes have no schema published by EPA. Their schemas in
  `apis/*.handwritten.swagger.json` were written from live behavior, list only
  parameters that were tested, and can lag the service. See
  `dev/undocumented-routes.md`.
- **`envirofacts_acres_ref_contact_type_old`** is in EPA's OpenAPI document but
  the service answers HTTP 404 ("table not found"). It is kept so the client
  matches the document. The other 415 tables answered a one-row check (14 of
  them returned no rows).
- **Envirofacts coverage follows EPA's OpenAPI document.** The service's own
  application lists more programs (for example GHGRP, ICIS-AIR and PCS) than the
  10 in that document; those have no functions yet.
- `set_api_token()` and `api_token()` are generated but unused: ECHO needs no key.

## Development

The schemas in `apis/` are downloaded unchanged from ECHO and EPA
(`dev/harvest_schemas.R`, with source URLs and SHA-256 in
`dev/echo-schema-manifest.json`) or written by hand. `dev/build_client.R`
bootstraps the package from them; afterwards `dev/regenerate.R` plans, applies or
checks the generated code; `dev/build_column_types.R` writes the Envirofacts column
types (`inst/extdata/envirofacts-columns.csv`) and `dev/build_echo_fields.R` the
ECHO field types (`inst/extdata/echo-fields.csv`, needs the network) that tidy
output uses. The Envirofacts wrappers need a generation-time
callback (`dev/callbacks.R`) that builds each table's request path with
`envirofacts_path()`, because DMAP declares no parameters. specmill is pinned to a GitHub release in
`renv.lock` so a local development install cannot change the build; run
`renv::restore()` first. See the headers of both scripts for the details.

specmill records a hash of the client-owned `R/echo_response_policy.R`,
`R/envirofacts_path.R`, `R/envirofacts_tidy.R`, `R/echo_tidy.R` and `R/echo_pages.R`: after editing one, run
`Rscript dev/regenerate.R apply` (its `check` reports stale output until then).

Shared workflows come from [seanthimons/baseline](https://github.com/seanthimons/baseline):
R CMD check, commit lint, secret scanning and workflow lint.

## License

MIT. ECHO data is public information of the U.S. EPA.
