#' Clean Air Act (CAA) Get Air Violation Report
#' 
#' @noMd
#' @param p_viol_activity_id p_viol_activity_id
#' @return Decoded response returned by the client request helper.
#' @family Violation Report CAA endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_air_violation_get_air_violation_rpt <- function(p_viol_activity_id = NULL) {
  .api_validation$parameter_values(base::list("p_viol_activity_id" = p_viol_activity_id), list(p_viol_activity_id = list(name = "p_viol_activity_id", "in" = "query", type = "string")), .api_validation$body_value, c(p_viol_activity_id = "query"))
  params <- base::list("p_viol_activity_id" = p_viol_activity_id)
  if (base::is.character(params[["p_viol_activity_id"]]) && base::any(!base::nzchar(params[["p_viol_activity_id"]]))) base::stop("Empty query parameter: p_viol_activity_id")
  result <- dfr_request(method = "GET", path = "/air_violation_rest_services.get_air_violation_rpt", path_params = base::list(), query = base::list("p_viol_activity_id" = params[["p_viol_activity_id"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Clean Air Act (CAA) Get Air Violation Report
#' 
#' @noMd
#' @param p_viol_activity_id p_viol_activity_id
#' @return Decoded response returned by the client request helper.
#' @family Violation Report CAA endpoints
#' @export
# Generated with specmill; do not edit by hand.
dfr_air_violation_get_air_violation_rpt_post <- function(p_viol_activity_id = NULL) {
  .api_validation$parameter_values(base::list("p_viol_activity_id" = p_viol_activity_id), list(p_viol_activity_id = list(name = "p_viol_activity_id", "in" = "query", type = "string")), .api_validation$body_value, c(p_viol_activity_id = "query"))
  params <- base::list("p_viol_activity_id" = p_viol_activity_id)
  if (base::is.character(params[["p_viol_activity_id"]]) && base::any(!base::nzchar(params[["p_viol_activity_id"]]))) base::stop("Empty query parameter: p_viol_activity_id")
  result <- dfr_request(method = "POST", path = "/air_violation_rest_services.get_air_violation_rpt", path_params = base::list(), query = base::list("p_viol_activity_id" = params[["p_viol_activity_id"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}
