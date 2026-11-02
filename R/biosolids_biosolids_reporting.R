#' Placeholder
#' 
#' @noMd
#' @param p_id p_id
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Biosolids Reporting endpoints
#' @export
# Generated with specmill; do not edit by hand.
biosolids_npdes_biosolids_services <- function(p_id, callback = NULL) {
  if (base::is.null(p_id)) base::stop("Required input: p_id")
  .api_validation$parameter_values(base::list("p_id" = p_id, "callback" = callback), list(p_id = list(name = "p_id", "in" = "query", default = "AL0032310", type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(p_id = "query", callback = "query"))
  params <- base::list("p_id" = p_id, "callback" = callback)
  if (base::is.character(params[["p_id"]]) && base::any(!base::nzchar(params[["p_id"]]))) base::stop("Empty query parameter: p_id")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- biosolids_request(method = "GET", path = "/biosolids/npdes_biosolids_services/", path_params = base::list(), query = base::list("p_id" = params[["p_id"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}
