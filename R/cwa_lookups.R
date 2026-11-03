#' ECHO MSGP Annual Report Years Lookup Servicve
#' 
#' @noMd
#' @param ascending Output Sort Column Ascending Flag.  Enter Y to sort results in ascending order.
#' @param tidy Return a tibble. Types are guessed from the values: whole numbers, decimals and dates are converted, identifier columns (ID, Code, ...) stay text. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A tibble with guessed column types (tidy = TRUE, the default for JSON output) or the decoded response (tidy = FALSE).
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_lookups_msgp_years <- function(ascending = NULL, tidy = TRUE) {
  .api_validation$parameter_values(base::list("ascending" = ascending), list(ascending = list(name = "ascending", "in" = "query", description = "Output Sort Column Ascending Flag.  Enter Y to sort results in ascending order.", enum = list("Y"), type = "string")), .api_validation$body_value, c(ascending = "query"))
  params <- base::list("ascending" = ascending, "tidy" = tidy)
  if (base::is.character(params[["ascending"]]) && base::any(!base::nzchar(params[["ascending"]]))) base::stop("Empty query parameter: ascending")
  result <- cwa_request(method = "GET", path = "/rest_lookups.msgp_years", path_params = base::list(), query = base::list("ascending" = params[["ascending"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_lookup", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}

#' ECHO MSGP Annual Report Years Lookup Servicve
#' 
#' @noMd
#' @param ascending Output Sort Column Ascending Flag.  Enter Y to sort results in ascending order.
#' @param tidy Return a tibble. Types are guessed from the values: whole numbers, decimals and dates are converted, identifier columns (ID, Code, ...) stay text. FALSE returns the decoded response. Non-JSON output formats are always returned as sent.
#' @return A tibble with guessed column types (tidy = TRUE, the default for JSON output) or the decoded response (tidy = FALSE).
#' @family Lookups endpoints
#' @export
# Generated with specmill; do not edit by hand.
cwa_lookups_msgp_years_post <- function(ascending = NULL, tidy = TRUE) {
  .api_validation$parameter_values(base::list("ascending" = ascending), list(ascending = list(name = "ascending", "in" = "query", description = "Output Sort Column Ascending Flag.  Enter Y to sort results in ascending order.", enum = list("Y"), type = "string")), .api_validation$body_value, c(ascending = "query"))
  params <- base::list("ascending" = ascending, "tidy" = tidy)
  if (base::is.character(params[["ascending"]]) && base::any(!base::nzchar(params[["ascending"]]))) base::stop("Empty query parameter: ascending")
  result <- cwa_request(method = "POST", path = "/rest_lookups.msgp_years", path_params = base::list(), query = base::list("ascending" = params[["ascending"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
  if (base::inherits(result, "httr2_request")) base::return(result)
  base::get("echo_tidy_lookup", envir = base::parent.env(base::environment()), mode = "function", inherits = FALSE)(base::list(result = result, params = params))
}
