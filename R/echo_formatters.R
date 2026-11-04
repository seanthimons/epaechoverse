# Client-owned per-service result formatters. A specmill result_formatter receives only
# list(result, params), not the route or service, so each service gets one-line shims
# that name it (dev/build_client.R writes the matching result_formatter into each
# operation, and tests/testthat/test-echo-services.R checks that every name a
# generated function looks up exists). The table of services is R/echo_services.R:
# a service has a summary shim where it has a summary route, an info shim where it has
# a rows route, and always a qid shim. Report routes (echo_report_routes) get one shim
# per record key. Every search service also has a download shim.

echo_tidy_qid_sdw <- function(data) echo_tidy_qid(data, 'sdw')
echo_tidy_qid_cwa <- function(data) echo_tidy_qid(data, 'cwa')
echo_tidy_qid_rcra <- function(data) echo_tidy_qid(data, 'rcra')
echo_tidy_qid_air <- function(data) echo_tidy_qid(data, 'air')
echo_tidy_qid_echo <- function(data) echo_tidy_qid(data, 'echo')
echo_tidy_qid_compscreen <- function(data) echo_tidy_qid(data, 'compscreen')
echo_tidy_qid_case <- function(data) echo_tidy_qid(data, 'case')
echo_tidy_qid_ecattaqs <- function(data) echo_tidy_qid(data, 'ecattaqs')
echo_tidy_qid_ecattams <- function(data) echo_tidy_qid(data, 'ecattams')
echo_tidy_qid_ecattems <- function(data) echo_tidy_qid(data, 'ecattems')
echo_tidy_qid_cwa_viotrack <- function(data) echo_tidy_qid(data, 'cwa_viotrack')
echo_tidy_qid_rcra_viotrack <- function(data) echo_tidy_qid(data, 'rcra_viotrack')

echo_tidy_summary_sdw <- function(data) echo_tidy_summary(data, 'sdw')
echo_tidy_summary_cwa <- function(data) echo_tidy_summary(data, 'cwa')
echo_tidy_summary_rcra <- function(data) echo_tidy_summary(data, 'rcra')
echo_tidy_summary_air <- function(data) echo_tidy_summary(data, 'air')
echo_tidy_summary_echo <- function(data) echo_tidy_summary(data, 'echo')
echo_tidy_summary_compscreen <- function(data) echo_tidy_summary(data, 'compscreen')
echo_tidy_summary_case <- function(data) echo_tidy_summary(data, 'case')
echo_tidy_summary_cwa_viotrack <- function(data) echo_tidy_summary(data, 'cwa_viotrack')
echo_tidy_summary_rcra_viotrack <- function(data) echo_tidy_summary(data, 'rcra_viotrack')

echo_tidy_info_cwa <- function(data) echo_tidy_info(data, 'cwa')
echo_tidy_info_rcra <- function(data) echo_tidy_info(data, 'rcra')
echo_tidy_info_air <- function(data) echo_tidy_info(data, 'air')
echo_tidy_info_echo <- function(data) echo_tidy_info(data, 'echo')
echo_tidy_info_case <- function(data) echo_tidy_info(data, 'case')
echo_tidy_info_ecattaqs <- function(data) echo_tidy_info(data, 'ecattaqs')
echo_tidy_info_ecattams <- function(data) echo_tidy_info(data, 'ecattams')
echo_tidy_info_ecattems <- function(data) echo_tidy_info(data, 'ecattems')

echo_tidy_report_facilities <- function(data) echo_tidy_report(data, 'Facilities')
echo_tidy_report_results <- function(data) echo_tidy_report(data, 'Results')
echo_tidy_report_chemicals <- function(data) echo_tidy_report(data, 'Chemicals')
echo_tidy_report_industries <- function(data) echo_tidy_report(data, 'Industries')
echo_tidy_report_parameters <- function(data) echo_tidy_report(data, 'Parameters')
echo_tidy_report_permit_limits <- function(data) echo_tidy_report(data, 'PermitLimits')
echo_tidy_report_monitoring_data <- function(data) echo_tidy_report(data, 'MonitoringData')

echo_tidy_download_sdw <- function(data) echo_tidy_download(data, 'sdw')
echo_tidy_download_cwa <- function(data) echo_tidy_download(data, 'cwa')
echo_tidy_download_rcra <- function(data) echo_tidy_download(data, 'rcra')
echo_tidy_download_air <- function(data) echo_tidy_download(data, 'air')
echo_tidy_download_echo <- function(data) echo_tidy_download(data, 'echo')
echo_tidy_download_compscreen <- function(data) echo_tidy_download(data, 'compscreen')
echo_tidy_download_case <- function(data) echo_tidy_download(data, 'case')
echo_tidy_download_ecattaqs <- function(data) echo_tidy_download(data, 'ecattaqs')
echo_tidy_download_ecattams <- function(data) echo_tidy_download(data, 'ecattams')
echo_tidy_download_ecattems <- function(data) echo_tidy_download(data, 'ecattems')
echo_tidy_download_cwa_viotrack <- function(data) echo_tidy_download(data, 'cwa_viotrack')
echo_tidy_download_rcra_viotrack <- function(data) echo_tidy_download(data, 'rcra_viotrack')
