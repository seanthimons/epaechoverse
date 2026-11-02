# ECHO routes with no published schema

Observed 2026-11-02. The echo.epa.gov front end calls these, but no Swagger
spec for them is served by `swaggerx.swagger_json`, so specmill cannot generate
them. They have no published contract and may change without notice.

- `cwa_viotrack_services`: `metadata`, `get_facilities`, `get_qid`, `get_download`
- `rcra_viotrack_services`: `metadata`, `get_facilities`, `get_qid`, `get_download`
- `caa_poll_rpt_rest_services.get_caa_csv` (returns CSV)
- `dfr_rest_services.get_demographics_by_id`
- `micro_services`: `get_frs_id`, `get_ama_sites_5k`
- `pipeline_rest_services`: `get_pipeline_air`, `get_pipeline_rcra`

`air_viotrack_services.*` and `ecatt_nif_rest_services.*` returned 404 and look
retired. The detailed facility report schema also contains two empty path items
(`get_acsx_demographics`, `get_sab_acs_demographics_by_id`) that generate nothing.
