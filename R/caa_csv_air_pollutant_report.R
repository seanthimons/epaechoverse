#' Air pollutant report as CSV
#' 
#' @noMd
#' @param p_id FRS registry ID, e.g. 110000381989.
#' @return Decoded response returned by the client request helper.
#' @family Air Pollutant Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
caa_csv_get_caa_csv <- function(p_id) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("p_id" = p_id), list(p_id = list(name = "p_id", description = "FRS registry ID, e.g. 110000381989.", type = "string", "in" = "query")), .api_validation$body_value, c(p_id = "query"))
  params <- base::list("p_id" = p_id)
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  result <- caa_csv_request(method = "GET", path = "/caa_poll_rpt_rest_services.get_caa_csv", path_params = base::list(), query = base::list("p_id" = params[["p_id"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' Air pollutant report as CSV
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Pollutant Report endpoints
#' @export
# Generated with specmill; do not edit by hand.
caa_csv_get_caa_csv_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(p_id = list(description = "FRS registry ID, e.g. 110000381989.", type = "string")), required = list("p_id")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- caa_csv_request(method = "POST", path = "/caa_poll_rpt_rest_services.get_caa_csv", path_params = base::list(), query = base::list(), body = params[["body"]], request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(p_id = list()), form_schema = list(type = "object", properties = list(p_id = list(description = "FRS registry ID, e.g. 110000381989.", type = "string")), required = list("p_id")))
  result
}
