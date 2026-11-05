# Client-owned table of the ECHO services whose searches return tidy tibbles. One
# constant feeds echo_qid_all(), the per-service formatters (R/echo_formatters.R) and
# the dev scripts (dev/build_client.R and dev/build_echo_fields.R source this file),
# so the lists cannot drift apart.
#
#  namespace  the route namespace of the service (the part before the dot in
#             /<namespace>.get_qid), also the name of its `metadata` route;
#  summary    the route that returns only a query summary and a QueryID, or NA;
#  info       the route that returns the summary and the matching rows, or NA;
#  metadata   whether the service has a `metadata` route that describes its field
#             types. Without one (ecattems) the types are frozen from a reviewed live
#             sample by dev/build_echo_fields.R.
# Every service also has get_qid, which returns the rows 500 to 5,000 at a time.

echo_search_services <- list(
  sdw = list(namespace = 'sdw_rest_services', summary = 'get_systems', info = NA_character_, metadata = TRUE),
  cwa = list(namespace = 'cwa_rest_services', summary = 'get_facilities', info = 'get_facility_info', metadata = TRUE),
  rcra = list(namespace = 'rcra_rest_services', summary = 'get_facilities', info = 'get_facility_info', metadata = TRUE),
  air = list(namespace = 'air_rest_services', summary = 'get_facilities', info = 'get_facility_info', metadata = TRUE),
  echo = list(namespace = 'echo_rest_services', summary = 'get_facilities', info = 'get_facility_info', metadata = TRUE),
  compscreen = list(namespace = 'comp_screen_services', summary = 'get_facilities', info = NA_character_, metadata = TRUE),
  case = list(namespace = 'case_rest_services', summary = 'get_cases', info = 'get_case_info', metadata = TRUE),
  # The two air monitoring services answer their search with the rows themselves.
  ecattaqs = list(namespace = 'ecatt_aqs_rest_services', summary = NA_character_, info = 'get_facilities', metadata = TRUE),
  ecattams = list(namespace = 'ecatt_ams_rest_services', summary = NA_character_, info = 'get_facilities', metadata = TRUE),
  # No metadata route: the search returns rows and a column list without types.
  ecattems = list(namespace = 'ecatt_ems_rest_services', summary = NA_character_, info = 'get_ems', metadata = FALSE),
  # The violation trackers (hand-written schemas, apis/*.handwritten.swagger.json).
  cwa_viotrack = list(namespace = 'cwa_viotrack_services', summary = 'get_facilities', info = NA_character_, metadata = TRUE),
  rcra_viotrack = list(namespace = 'rcra_viotrack_services', summary = 'get_facilities', info = NA_character_, metadata = TRUE)
)

# What a record list is called in a search response.
.echo_record_keys <- c('Facilities', 'WaterSystems', 'Cases', 'FacilityAggregatedEmissions')

# Report routes of the water pollutant loading tool (api `wplt`, namespace
# dmr_rest_services) that return scalar summary fields beside ONE flat list of records,
# under `key`. They are tidied to an all-text tibble (R/echo_tidy.R, echo_tidy_report;
# the swagger declares every field a string and there is no metadata route), with the
# scalars in attr(, 'summary'). The loading tool's other routes and the effluent
# charts return nested reports; they go through echo_tidy_nested (R/echo_tidy.R) in
# dfr, caa and eff only, so the loading tool's nested reports stay lists.
echo_report_routes <- data.frame(
  api = 'wplt',
  namespace = 'dmr_rest_services',
  route = c(
    'get_all_dmr_facilities', 'get_all_tri_facilities', 'get_custom_data_annual',
    'get_custom_data_facility', 'get_custom_data_monitor_pd', 'get_dashboard_chemicals',
    'get_dashboard_facilities', 'get_dashboard_npdes', 'get_dashboard_industries',
    'get_loading_tool_params', 'get_permit_limits', 'get_monitoring_data_csv',
    'get_watershed_facilities'
  ),
  key = c(
    'Facilities', 'Facilities', 'Results', 'Results', 'Results', 'Chemicals', 'Facilities',
    'Chemicals', 'Industries', 'Parameters', 'PermitLimits', 'MonitoringData', 'Facilities'
  ),
  stringsAsFactors = FALSE
)

# The formatter name of a record key: Facilities -> echo_tidy_report_facilities.
echo_report_formatter <- function(key) {
  paste0('echo_tidy_report_', tolower(gsub('([a-z])([A-Z])', '\\1_\\2', key)))
}
