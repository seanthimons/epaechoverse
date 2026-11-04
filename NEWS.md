# epaechoverse 0.0.0.9000

## Breaking changes

* The 81 lookup functions and the searches of `sdw`, `cwa`, `rcra`, `air`, `echo`,
  `compscreen`, `case`, `ecattaqs`, `ecattams`, `ecattems`, `cwa_viotrack` and `rcra_viotrack`
  (`ecattems_get_ems`, `*_get_facilities`,
  `sdw_get_systems`, `case_get_cases`, `*_get_facility_info`, `case_get_case_info`,
  `*_get_qid`, and their `_post` twins) return tibbles by default instead of the
  decoded list. Use `tidy = FALSE` for the list. For a search
  (`*_get_facilities`, `sdw_get_systems`) `res$Results$QueryID` is now
  `res$QueryID`; for `*_get_facility_info` the summary is `attr(res, 'summary')`
  and the query ID `attr(res, 'query')$query_id`; `*_get_qid` returns the rows
  themselves; `ecattaqs_get_facilities` and `ecattams_get_facilities` return the rows
  too. In the `_post` twins `body` stays the first argument and `tidy`
  follows. Thirteen flat `wplt_*` report routes (listed in the README) and their
  `_post` twins return a tibble of text columns too. The report routes of `dfr`, `caa` and
  `eff` return a named list of tibbles, and every `*_get_download` returns a typed
  tibble from the CSV.

## New

* `echo_qid_all()` fetches every page of a search (twelve services). Field types come
  from each service's own metadata.
* Envirofacts (DMAP) tables: 416 `envirofacts_<program>_<table>()` functions that
  return typed tibbles from `format = 'json'` or `'csv'`.
