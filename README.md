# epaechoverse

An R client for the web services of the U.S. EPA's
[Enforcement and Compliance History Online (ECHO)](https://echo.epa.gov/tools/web-services)
and, in progress, for [Envirofacts](https://enviro.epa.gov/). It has 579 ECHO
functions covering every route in ECHO's published Swagger schemas (duplicate
lookup routes are folded together) plus a few routes ECHO uses but does not
document, and 21 `envirofacts_sdwis_*` table functions (the other Envirofacts
programs will follow). The wrappers are generated
with [specmill](https://github.com/seanthimons/specmill) and need no API key.

This is an unofficial client, not affiliated with or endorsed by the EPA. It is
a development version (`0.0.0.9000`): names can still change.

## Install

```r
# install.packages('remotes')
remotes::install_github('seanthimons/epaechoverse')
```

## Quick start

ECHO searches are two-step. A search returns a query ID and a row count; you
then page through the results with the query ID, or download them all as CSV.

```r
library(epaechoverse)

# Drinking-water systems in Rhode Island
res <- sdw_get_systems(p_st = 'RI')
res$Results$QueryRows
qid <- res$Results$QueryID          # a string, as ECHO returns it

page1 <- sdw_get_qid(qid = qid, pageno = 1)
csv <- sdw_get_download(qid = qid)  # CSV as a character string
systems <- utils::read.csv(text = csv)

# Code lookups
lookup_states()
```

Responses are plain R lists (JSON) or strings (CSV, XML). Query parameters are
the function arguments; see `?sdw_get_systems` for the ones a route accepts.
Routes that accept POST (all but the NNCR and biosolids routes) also have a
`_post` variant that usually takes its parameters as `body = list(...)`; a few
take named arguments or none, so check the help page.

To see the request without sending it:

```r
epaechoverse_dry_run(TRUE)
req <- cwa_get_facilities(p_st = 'RI', p_maj = 'Y')  # an httr2 request
epaechoverse_dry_run(FALSE)
```

`epaechoverse_run_verbose(TRUE)` prints each method and response status.

## Envirofacts tables

Envirofacts serves one function per table through EPA's DMAP service, named
`envirofacts_<program>_<table>`. So far these are the drinking-water (SDWIS)
tables, for example `envirofacts_sdwis_water_system`.

```r
# Community water systems in Rhode Island: the first 5 rows
rows <- envirofacts_sdwis_water_system(
  c('state_code/equals/RI', 'pws_type_code/equals/CWS'),
  first = 1, last = 5
)

csv <- envirofacts_sdwis_violation('pwsid/equals/RI1000010', last = 50, format = 'csv')
```

- `filter` is a character vector of `column/operator/value` conditions that must
  all hold. Operators include `equals`, `beginsWith` and `contains`; the service
  names a bad column or operator in its error. Values may not contain
  `/`, `\` or `%`, and the service rejected a value containing a dot when
  tested.
- `first` and `last` are 1-based row numbers (default `1` and `100`). The service
  returns a whole table when no range is given, so the range is always sent and
  one call is limited to 10,000 rows. Raise the limit with
  `options(epaechoverse.max_rows = 50000)`. For more rows, page with
  consecutive ranges.
- `format` is `'json'` (a list of records), `'csv'` (a string) or `'xml'` (a raw
  vector; use `rawToChar()`).
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
| `envirofacts` | Envirofacts tables, `envirofacts_<program>_<table>` (SDWIS so far) | 21 |

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
`options(epaechoverse.request = list(timeout = 120, max_retries = 0))`.

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
- `set_api_token()` and `api_token()` are generated but unused: ECHO needs no key.

## Development

The schemas in `apis/` are downloaded unchanged from ECHO and EPA
(`dev/harvest_schemas.R`, with source URLs and SHA-256 in
`dev/echo-schema-manifest.json`) or written by hand. `dev/build_client.R`
bootstraps the package from them; afterwards `dev/regenerate.R` plans, applies or
checks the generated code. The Envirofacts wrappers need a generation-time
callback (`dev/callbacks.R`) that builds each table's request path with
`envirofacts_path()`, because DMAP declares no parameters. specmill is pinned to a GitHub release in
`renv.lock` so a local development install cannot change the build; run
`renv::restore()` first. See the headers of both scripts for the details.

Shared workflows come from [seanthimons/baseline](https://github.com/seanthimons/baseline):
R CMD check, commit lint, secret scanning and workflow lint.

## License

MIT. ECHO data is public information of the U.S. EPA.
