#' Clean Air Act (CAA) Get Air Violation Report
#' 
#' @noMd
#' @param p_viol_activity_id p_viol_activity_id
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Violation Report CAA endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_air_violation_get_air_violation_rpt <- function(p_viol_activity_id = NULL, tidy = TRUE) {
  .api_validation$parameter_values(base::list("p_viol_activity_id" = p_viol_activity_id), list(p_viol_activity_id = list(name = "p_viol_activity_id", "in" = "query", type = "string")), .api_validation$body_value, c(p_viol_activity_id = "query"))
  params <- base::list("p_viol_activity_id" = p_viol_activity_id, "tidy" = tidy)
  if (base::is.character(params[["p_viol_activity_id"]]) && base::any(!base::nzchar(params[["p_viol_activity_id"]]))) base::stop("Empty query parameter: p_viol_activity_id")
  result <- dfr_request(method = "GET", path = "/air_violation_rest_services.get_air_violation_rpt", path_params = base::list(), query = base::list("p_viol_activity_id" = params[["p_viol_activity_id"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' Clean Air Act (CAA) Get Air Violation Report
#' 
#' @noMd
#' @param p_viol_activity_id p_viol_activity_id
#' @param tidy Return the report as a named list of tibbles. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A named list of tibbles, one per table in the report (text columns; nested values stay list-columns), or the decoded response (tidy = FALSE).
#' @family Violation Report CAA endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_air_violation_get_air_violation_rpt_post <- function(p_viol_activity_id = NULL, tidy = TRUE) {
  .api_validation$parameter_values(base::list("p_viol_activity_id" = p_viol_activity_id), list(p_viol_activity_id = list(name = "p_viol_activity_id", "in" = "query", type = "string")), .api_validation$body_value, c(p_viol_activity_id = "query"))
  params <- base::list("p_viol_activity_id" = p_viol_activity_id, "tidy" = tidy)
  if (base::is.character(params[["p_viol_activity_id"]]) && base::any(!base::nzchar(params[["p_viol_activity_id"]]))) base::stop("Empty query parameter: p_viol_activity_id")
  result <- dfr_request(method = "POST", path = "/air_violation_rest_services.get_air_violation_rpt", path_params = base::list(), query = base::list("p_viol_activity_id" = params[["p_viol_activity_id"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_nested", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}
