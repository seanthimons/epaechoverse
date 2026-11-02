# ECHO routes with no published schema

Observed 2026-11-02. The echo.epa.gov front end calls these, but no Swagger
spec for them is served by `swaggerx.swagger_json`, so specmill cannot generate
them from a download. They have no published contract and may change without
notice. Schemas for them are hand-written in `apis/*.handwritten.swagger.json`
(rows with source `hand` in `echo_services.csv`); each states what was verified
live and what was not.

| Route | Hand-written schema | Notes |
|---|---|---|
| `cwa_viotrack_services`: `metadata`, `get_facilities`, `get_qid`, `get_download` | `echo-cwa-violation-tracker` | Filters that changed the result when probed: `p_st`, `p_ptype`, `p_maj`, `p_ico`. Other CWA facility-search filters (such as `p_zip`, `p_co`, `p_act`) did not. |
| `rcra_viotrack_services`: same four | `echo-rcra-violation-tracker` | Filters that changed the result when probed: `p_st`, `p_ico`. |
| `air_viotrack_services`: `metadata`, `get_cases`, `get_qid`, `get_download` | `echo-air-violation-tracker` | Kept at `/echo`, where it 404s. It looks access-controlled rather than down: ECHO's front end sends government and EPA users to `/echogov`, `/echoepa` and `/echoes`, and anonymous requests there are redirected to EPA SAML single sign-on. Filters unknown. |
| `ecatt_nif_rest_services`: `get_facilities`, `get_qid` | `echo-ecatt-nif` | Same situation as above. |
| `micro_services`: `get_frs_id`, `get_ama_sites_5k` | `echo-microservices` | `p_id` verified. `get_frs_id` returns malformed JSON for an id with no match. |
| `pipeline_rest_services`: `get_pipeline_air`, `get_pipeline_rcra` | `echo-pipeline` | `p_id` verified. Returns invalid JSON (trailing comma) when the id has no records. |
| `dfr_rest_services.get_acs2023x_demographics_by_id` | `echo-dfr-demographics` | Works, and is not in EPA's DFR schema (which lists `get_acs2023x_demographics` with lat/long/radius instead). |
| `dfr_rest_services.get_demographics_by_id` | `echo-dfr-demographics` | Unversioned name the front end uses. Returns HTTP 500 for every id tried. |
| `caa_poll_rpt_rest_services.get_caa_csv` | `echo-air-pollutant-report-csv` | CSV of the air pollutant table, `p_id` is an FRS registry ID. Added because `get_caapr` rejects `output=CSV` and no other route returns this table as CSV. The DFR `get_csv` route (takes a system id and a section name but declares no parameters) returned HTTP 500 for every combination tried. |

The two empty DFR path items (`get_acsx_demographics`,
`get_sab_acs_demographics_by_id`) generate nothing and were left out.

## Found but not added

- `rest_lookups`: `ecatt_cas_pgm`, `fyfq_13quarters`, `mgp_id_lu`, `npdes_5y_insp_types`
  are called by the front end but are in no schema.
- `facility_document_links.get_case_caed_documents` is served from
  `ofmpub.epa.gov`, not `echodata.epa.gov`.
