#' ECATT Air Monitoring Station (AMS) CAP Search Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_site_code Enter the AQS Site Code(s) for the monitoring stations. Provide multiple values as a comma-delimited list.
#' @param p_year Year. Enter LAST5 or a single calendar year to filter results. Available values: LAST10, LAST5, or a single calendar year
#' @param p_reg EPA Region Filter. Provide a single value of 01 thru 10 to restrict results to a single EPA region.
#' @param p_rpo EPA Regional Planning Organization filter. Available values: WRAP, CENRAP, MIDRPO, MAN-VU, VISTAS
#' @param p_st Air Monitoring Station State and State-Equivalent Filter. Provide one or more USPS postal abbreviations for states and state-equivalents to filter results. Provide multiple values as a comma-delimited list.
#' @param p_zip 5-Digit ZIP Code Filter. Provide one or more 5-digit postal zip codes to filter results.  May contain multiple comma-separated values.
#' @param p_fips FIPS Code Filter.  Enter a single 5-character Federal Information Processing Standards (FIPS) state + county value to restrict results.  E.g. to limit results to Kenosha County, Wisconsin, use 55059.
#' @param p_ct Air Monitoring Station County Filter. Enter a single case-insensitive county name  in combination with a state value provided via p_st.
#' @param p_loc Location type filter. Enter a single location type to restrict results based on population density and land usage. Available values: RURAL, URBAN, SUBURBAN
#' @param p_naa_located Monitor located in a Nonattainment Area filter.  Enter to filter results not in nonattainment areas, in nonattainment areas, or in maintenance areas. Available values: NA, MA,
#' @param p_naa_pol Nonattainment Area Pollutant filter. Enter a single pollutant in nonattainment to filter results.
#' @param p_naa_cl Nonattainment Area Classification filter. Enter a severity classification to filter results. The classifications to filter on are dependant on p_naa_pol.
#' @param p_name Pollutant Name Filter. Enter an AQS Pollutant code to filter results.
#' @param p_std Pollutant Standard filter. Enter a pollutant standard defined by AQS to filter results. The pollutant standards to filter on are dependent on p_name
#' @param p_naaq_std NAAQ Standard filter. Available values:  P,S
#' @param p_trend Air Concentration Trend Filter. Enter to filter results with increasing or decreasing pollutant concentrations. Available Values: "INC", "DEC"
#' @param p_naaq_comp Ambient Air Quality Monitoring Comparison to NAAQS filter.
#' @param p_naaq_exceed Number of NAAQS Exceedances filter.
#' @param p_tribedist Proximity to tribal land limiter. Enter an amount of mile between 0 and 25 to filter results.  This parameter is only evaluated if p_tribeid is populated.
#' @param p_pd Population Density Limiter (per sq mile). Enter a value to limit results to facilities located in area of a given population density.
#' - NONE = 0 population density per square mile
#' - GT100 = More than 100 population density per square mile
#' - GT500 = More than 500 population density per square mile
#' - GT1000 = More than 1000 population density per square mile
#' - GT5000 = More than 5000 population density per square mile
#' - GT10000 = More than 10000 population density per square mile
#' - GT20000 = More than 20000 population density per square mile
#' @param p_pctlowinc Percent Low Income filter. Enter a value to restrict results to facilities with a given percentage of low income population within 3-mile radius.
#' @param p_pm Percent People of Color Limiter.  Enter a value to restrict results to facilities with a given percentage of people of color within 3-mile radius.
#' - NONE = 0\%
#' - GTx = greater than x\%
#' - GTEx = greater than or equal to x\%
#' @param xmax Maximum longitude value in decimal degrees.
#' @param ymax Maximum latitude value in decimal degrees.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param qcolumns Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.
#' @param queryset Query Limiter.  Enter a value to limit the number of records returned for each query. Value cannot exceed 70,000.
#' @param responseset Response Set Limiter. Enter a value to limit the number of records per page. Value cannot exceed 1,000.
#' @param p_pretty_print Optional flag to request GeoJSON formatted results to be pretty printed.  Only provide a numeric value when the output needs to be human readable as pretty printing has a performance cost.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Criteria Air Pollutant Search Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_get_facilities <- function(output = NULL, p_site_code = NULL, p_year = "LAST10", p_reg = NULL, p_rpo = NULL, p_st = NULL, p_zip = NULL, p_fips = NULL, p_ct = NULL, p_loc = NULL, p_naa_located = NULL, p_naa_pol = NULL, p_naa_cl = NULL, p_name = NULL, p_std = NULL, p_naaq_std = NULL, p_trend = NULL, p_naaq_comp = NULL, p_naaq_exceed = NULL, p_tribedist = NULL, p_pd = NULL, p_pctlowinc = NULL, p_pm = NULL, xmax = NULL, ymax = NULL, callback = NULL, qcolumns = NULL, queryset = NULL, responseset = NULL, p_pretty_print = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "p_site_code" = p_site_code, "p_year" = p_year, "p_reg" = p_reg, "p_rpo" = p_rpo, "p_st" = p_st, "p_zip" = p_zip, "p_fips" = p_fips, "p_ct" = p_ct, "p_loc" = p_loc, "p_naa_located" = p_naa_located, "p_naa_pol" = p_naa_pol, "p_naa_cl" = p_naa_cl, "p_name" = p_name, "p_std" = p_std, "p_naaq_std" = p_naaq_std, "p_trend" = p_trend, "p_naaq_comp" = p_naaq_comp, "p_naaq_exceed" = p_naaq_exceed, "p_tribedist" = p_tribedist, "p_pd" = p_pd, "p_pctlowinc" = p_pctlowinc, "p_pm" = p_pm, "xmax" = xmax, "ymax" = ymax, "callback" = callback, "qcolumns" = qcolumns, "queryset" = queryset, "responseset" = responseset, "p_pretty_print" = p_pretty_print), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(name = "p_site_code", "in" = "query", description = "Enter the AQS Site Code(s) for the monitoring stations. Provide multiple values as a comma-delimited list.", 
    type = "string"), p_year = list(name = "p_year", "in" = "query", description = "Year. Enter LAST5 or a single calendar year to filter results. Available values: LAST10, LAST5, or a single calendar year", default = "LAST10", type = "string"), p_reg = list(name = "p_reg", "in" = "query", description = "EPA Region Filter. Provide a single value of 01 thru 10 to restrict results to a single EPA region.", enum = list("01", "02", "03", "04", "05", "06", "07", "08", "09", "10"), type = "string"), p_rpo = list(
    name = "p_rpo", "in" = "query", description = "EPA Regional Planning Organization filter. Available values: WRAP, CENRAP, MIDRPO, MAN-VU, VISTAS", type = "string"), p_st = list(name = "p_st", "in" = "query", description = "Air Monitoring Station State and State-Equivalent Filter. Provide one or more USPS postal abbreviations for states and state-equivalents to filter results. Provide multiple values as a comma-delimited list.", type = "string"), p_zip = list(name = "p_zip", "in" = "query", description = "5-Digit ZIP Code Filter. Provide one or more 5-digit postal zip codes to filter results.  May contain multiple comma-separated values.", 
    type = "string"), p_fips = list(name = "p_fips", "in" = "query", description = "FIPS Code Filter.  Enter a single 5-character Federal Information Processing Standards (FIPS) state + county value to restrict results.  E.g. to limit results to Kenosha County, Wisconsin, use 55059.", type = "string"), p_ct = list(name = "p_ct", "in" = "query", description = "Air Monitoring Station County Filter. Enter a single case-insensitive county name  in combination with a state value provided via p_st.", type = "string"), 
    p_loc = list(name = "p_loc", "in" = "query", description = "Location type filter. Enter a single location type to restrict results based on population density and land usage. Available values: RURAL, URBAN, SUBURBAN", type = "string"), p_naa_located = list(name = "p_naa_located", "in" = "query", description = "Monitor located in a Nonattainment Area filter.  Enter to filter results not in nonattainment areas, in nonattainment areas, or in maintenance areas. Available values: NA, MA,", type = "string"), 
    p_naa_pol = list(name = "p_naa_pol", "in" = "query", description = "Nonattainment Area Pollutant filter. Enter a single pollutant in nonattainment to filter results.", type = "string"), p_naa_cl = list(name = "p_naa_cl", "in" = "query", description = "Nonattainment Area Classification filter. Enter a severity classification to filter results. The classifications to filter on are dependant on p_naa_pol.", type = "string"), p_name = list(name = "p_name", "in" = "query", description = "Pollutant Name Filter. Enter an AQS Pollutant code to filter results.", 
        type = "string"), p_std = list(name = "p_std", "in" = "query", description = "Pollutant Standard filter. Enter a pollutant standard defined by AQS to filter results. The pollutant standards to filter on are dependent on p_name", type = "string"), p_naaq_std = list(name = "p_naaq_std", "in" = "query", description = "NAAQ Standard filter. Available values:  P,S", type = "string"), p_trend = list(name = "p_trend", "in" = "query", description = "Air Concentration Trend Filter. Enter to filter results with increasing or decreasing pollutant concentrations. Available Values: \"INC\", \"DEC\"", 
        type = "string"), p_naaq_comp = list(name = "p_naaq_comp", "in" = "query", description = "Ambient Air Quality Monitoring Comparison to NAAQS filter.", type = "string"), p_naaq_exceed = list(name = "p_naaq_exceed", "in" = "query", description = "Number of NAAQS Exceedances filter.", type = "number"), p_tribedist = list(name = "p_tribedist", "in" = "query", description = "Proximity to tribal land limiter. Enter an amount of mile between 0 and 25 to filter results.  This parameter is only evaluated if p_tribeid is populated.", 
        type = "number"), p_pd = list(name = "p_pd", "in" = "query", description = "Population Density Limiter (per sq mile). Enter a value to limit results to facilities located in area of a given population density.\n- NONE = 0 population density per square mile\n- GT100 = More than 100 population density per square mile\n- GT500 = More than 500 population density per square mile\n- GT1000 = More than 1000 population density per square mile\n- GT5000 = More than 5000 population density per square mile\n- GT10000 = More than 10000 population density per square mile\n- GT20000 = More than 20000 population density per square mile", 
        enum = list("NONE", "GT100", "GT500", "GT1000", "GT5000", "GT10000", "GT20000"), type = "string"), p_pctlowinc = list(name = "p_pctlowinc", "in" = "query", description = "Percent Low Income filter. Enter a value to restrict results to facilities with a given percentage of low income population within 3-mile radius.", type = "string"), p_pm = list(name = "p_pm", "in" = "query", description = "Percent People of Color Limiter.  Enter a value to restrict results to facilities with a given percentage of people of color within 3-mile radius.\n- NONE = 0%\n- GTx = greater than x%\n- GTEx = greater than or equal to x%", 
        enum = list("NONE", "GT5", "GE5", "GT10", "GE10", "GT25", "GE25", "GT50", "GE50", "GT75", "GE75"), type = "string"), xmax = list(name = "xmax", "in" = "query", description = "Maximum longitude value in decimal degrees.", type = "number"), ymax = list(name = "ymax", "in" = "query", description = "Maximum latitude value in decimal degrees.", type = "number"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
        type = "string"), qcolumns = list(name = "qcolumns", "in" = "query", description = "Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.", type = "string"), queryset = list(name = "queryset", "in" = "query", description = "Query Limiter.  Enter a value to limit the number of records returned for each query. Value cannot exceed 70,000.", 
        type = "number"), responseset = list(name = "responseset", "in" = "query", description = "Response Set Limiter. Enter a value to limit the number of records per page. Value cannot exceed 1,000.", type = "number"), p_pretty_print = list(name = "p_pretty_print", "in" = "query", description = "Optional flag to request GeoJSON formatted results to be pretty printed.  Only provide a numeric value when the output needs to be human readable as pretty printing has a performance cost.", type = "number")), .api_validation$body_value, c(output = "query", p_site_code = "query", p_year = "query", p_reg = "query", p_rpo = "query", p_st = "query", p_zip = "query", p_fips = "query", p_ct = "query", p_loc = "query", p_naa_located = "query", p_naa_pol = "query", p_naa_cl = "query", p_name = "query", p_std = "query", p_naaq_std = "query", p_trend = "query", p_naaq_comp = "query", p_naaq_exceed = "query", p_tribedist = "query", p_pd = "query", p_pctlowinc = "query", p_pm = "query", xmax = "query", ymax = "query", callback = "query", qcolumns = "query", 
queryset = "query", responseset = "query", p_pretty_print = "query"))
  params <- base::list("output" = output, "p_site_code" = p_site_code, "p_year" = p_year, "p_reg" = p_reg, "p_rpo" = p_rpo, "p_st" = p_st, "p_zip" = p_zip, "p_fips" = p_fips, "p_ct" = p_ct, "p_loc" = p_loc, "p_naa_located" = p_naa_located, "p_naa_pol" = p_naa_pol, "p_naa_cl" = p_naa_cl, "p_name" = p_name, "p_std" = p_std, "p_naaq_std" = p_naaq_std, "p_trend" = p_trend, "p_naaq_comp" = p_naaq_comp, "p_naaq_exceed" = p_naaq_exceed, "p_tribedist" = p_tribedist, "p_pd" = p_pd, "p_pctlowinc" = p_pctlowinc, "p_pm" = p_pm, "xmax" = xmax, "ymax" = ymax, "callback" = callback, "qcolumns" = qcolumns, "queryset" = queryset, "responseset" = responseset, "p_pretty_print" = p_pretty_print)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_site_code"]]) && base::any(!base::nzchar(params[["p_site_code"]]))) base::stop("Empty query parameter: p_site_code")
  if (base::is.character(params[["p_year"]]) && base::any(!base::nzchar(params[["p_year"]]))) base::stop("Empty query parameter: p_year")
  if (base::is.character(params[["p_reg"]]) && base::any(!base::nzchar(params[["p_reg"]]))) base::stop("Empty query parameter: p_reg")
  if (base::is.character(params[["p_rpo"]]) && base::any(!base::nzchar(params[["p_rpo"]]))) base::stop("Empty query parameter: p_rpo")
  if (base::is.character(params[["p_st"]]) && base::any(!base::nzchar(params[["p_st"]]))) base::stop("Empty query parameter: p_st")
  if (base::is.character(params[["p_zip"]]) && base::any(!base::nzchar(params[["p_zip"]]))) base::stop("Empty query parameter: p_zip")
  if (base::is.character(params[["p_fips"]]) && base::any(!base::nzchar(params[["p_fips"]]))) base::stop("Empty query parameter: p_fips")
  if (base::is.character(params[["p_ct"]]) && base::any(!base::nzchar(params[["p_ct"]]))) base::stop("Empty query parameter: p_ct")
  if (base::is.character(params[["p_loc"]]) && base::any(!base::nzchar(params[["p_loc"]]))) base::stop("Empty query parameter: p_loc")
  if (base::is.character(params[["p_naa_located"]]) && base::any(!base::nzchar(params[["p_naa_located"]]))) base::stop("Empty query parameter: p_naa_located")
  if (base::is.character(params[["p_naa_pol"]]) && base::any(!base::nzchar(params[["p_naa_pol"]]))) base::stop("Empty query parameter: p_naa_pol")
  if (base::is.character(params[["p_naa_cl"]]) && base::any(!base::nzchar(params[["p_naa_cl"]]))) base::stop("Empty query parameter: p_naa_cl")
  if (base::is.character(params[["p_name"]]) && base::any(!base::nzchar(params[["p_name"]]))) base::stop("Empty query parameter: p_name")
  if (base::is.character(params[["p_std"]]) && base::any(!base::nzchar(params[["p_std"]]))) base::stop("Empty query parameter: p_std")
  if (base::is.character(params[["p_naaq_std"]]) && base::any(!base::nzchar(params[["p_naaq_std"]]))) base::stop("Empty query parameter: p_naaq_std")
  if (base::is.character(params[["p_trend"]]) && base::any(!base::nzchar(params[["p_trend"]]))) base::stop("Empty query parameter: p_trend")
  if (base::is.character(params[["p_naaq_comp"]]) && base::any(!base::nzchar(params[["p_naaq_comp"]]))) base::stop("Empty query parameter: p_naaq_comp")
  if (base::is.character(params[["p_naaq_exceed"]]) && base::any(!base::nzchar(params[["p_naaq_exceed"]]))) base::stop("Empty query parameter: p_naaq_exceed")
  if (base::is.character(params[["p_tribedist"]]) && base::any(!base::nzchar(params[["p_tribedist"]]))) base::stop("Empty query parameter: p_tribedist")
  if (base::is.character(params[["p_pd"]]) && base::any(!base::nzchar(params[["p_pd"]]))) base::stop("Empty query parameter: p_pd")
  if (base::is.character(params[["p_pctlowinc"]]) && base::any(!base::nzchar(params[["p_pctlowinc"]]))) base::stop("Empty query parameter: p_pctlowinc")
  if (base::is.character(params[["p_pm"]]) && base::any(!base::nzchar(params[["p_pm"]]))) base::stop("Empty query parameter: p_pm")
  if (base::is.character(params[["xmax"]]) && base::any(!base::nzchar(params[["xmax"]]))) base::stop("Empty query parameter: xmax")
  if (base::is.character(params[["ymax"]]) && base::any(!base::nzchar(params[["ymax"]]))) base::stop("Empty query parameter: ymax")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["qcolumns"]]) && base::any(!base::nzchar(params[["qcolumns"]]))) base::stop("Empty query parameter: qcolumns")
  if (base::is.character(params[["queryset"]]) && base::any(!base::nzchar(params[["queryset"]]))) base::stop("Empty query parameter: queryset")
  if (base::is.character(params[["responseset"]]) && base::any(!base::nzchar(params[["responseset"]]))) base::stop("Empty query parameter: responseset")
  if (base::is.character(params[["p_pretty_print"]]) && base::any(!base::nzchar(params[["p_pretty_print"]]))) base::stop("Empty query parameter: p_pretty_print")
  result <- ecattaqs_request(method = "GET", path = "/ecatt_aqs_rest_services.get_facilities", path_params = base::list(), query = base::list("output" = params[["output"]], "p_site_code" = params[["p_site_code"]], "p_year" = params[["p_year"]], "p_reg" = params[["p_reg"]], "p_rpo" = params[["p_rpo"]], "p_st" = params[["p_st"]], "p_zip" = params[["p_zip"]], "p_fips" = params[["p_fips"]], "p_ct" = params[["p_ct"]], "p_loc" = params[["p_loc"]], "p_naa_located" = params[["p_naa_located"]], "p_naa_pol" = params[["p_naa_pol"]], "p_naa_cl" = params[["p_naa_cl"]], "p_name" = params[["p_name"]], "p_std" = params[["p_std"]], "p_naaq_std" = params[["p_naaq_std"]], "p_trend" = params[["p_trend"]], "p_naaq_comp" = params[["p_naaq_comp"]], "p_naaq_exceed" = params[["p_naaq_exceed"]], "p_tribedist" = params[["p_tribedist"]], "p_pd" = params[["p_pd"]], "p_pctlowinc" = params[["p_pctlowinc"]], "p_pm" = params[["p_pm"]], "xmax" = params[["xmax"]], "ymax" = params[["ymax"]], "callback" = params[["callback"]], "qcolumns" = params[["qcolumns"]], "queryset" = params[["queryset"]], "responseset" = params[["responseset"]], "p_pretty_print" = params[["p_pretty_print"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECATT Air Monitoring Station (AMS) CAP Search Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Criteria Air Pollutant Search Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_get_facilities_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(description = "Enter the AQS Site Code(s) for the monitoring stations. Provide multiple values as a comma-delimited list.", 
    type = "string"), p_year = list(description = "Year. Enter LAST5 or a single calendar year to filter results. Available values: LAST10, LAST5, or a single calendar year", default = "LAST10", type = "string"), p_reg = list(description = "EPA Region Filter. Provide a single value of 01 thru 10 to restrict results to a single EPA region.", enum = list("01", "02", "03", "04", "05", "06", "07", "08", "09", "10"), type = "string"), p_rpo = list(description = "EPA Regional Planning Organization filter. Available values: WRAP, CENRAP, MIDRPO, MAN-VU, VISTAS", 
    type = "string"), p_st = list(description = "Air Monitoring Station State and State-Equivalent Filter. Provide one or more USPS postal abbreviations for states and state-equivalents to filter results. Provide multiple values as a comma-delimited list.", type = "string"), p_zip = list(description = "5-Digit ZIP Code Filter. Provide one or more 5-digit postal zip codes to filter results.  May contain multiple comma-separated values.", type = "string"), p_fips = list(description = "FIPS Code Filter.  Enter a single 5-character Federal Information Processing Standards (FIPS) state + county value to restrict results.  E.g. to limit results to Kenosha County, Wisconsin, use 55059.", 
    type = "string"), p_ct = list(description = "Air Monitoring Station County Filter. Enter a single case-insensitive county name  in combination with a state value provided via p_st.", type = "string"), p_loc = list(description = "Location type filter. Enter a single location type to restrict results based on population density and land usage. Available values: RURAL, URBAN, SUBURBAN", type = "string"), p_naa_located = list(description = "Monitor located in a Nonattainment Area filter.  Enter to filter results not in nonattainment areas, in nonattainment areas, or in maintenance areas. Available values: NA, MA,", 
    type = "string"), p_naa_pol = list(description = "Nonattainment Area Pollutant filter. Enter a single pollutant in nonattainment to filter results.", type = "string"), p_naa_cl = list(description = "Nonattainment Area Classification filter. Enter a severity classification to filter results. The classifications to filter on are dependant on p_naa_pol.", type = "string"), p_name = list(description = "Pollutant Name Filter. Enter an AQS Pollutant code to filter results.", type = "string"), p_std = list(
    description = "Pollutant Standard filter. Enter a pollutant standard defined by AQS to filter results. The pollutant standards to filter on are dependent on p_name", type = "string"), p_naaq_std = list(description = "NAAQ Standard filter. Available values:  P,S", type = "string"), p_trend = list(description = "Air Concentration Trend Filter. Enter to filter results with increasing or decreasing pollutant concentrations. Available Values: \"INC\", \"DEC\"", type = "string"), p_naaq_comp = list(
    description = "Ambient Air Quality Monitoring Comparison to NAAQS filter.", type = "string"), p_naaq_exceed = list(description = "Number of NAAQS Exceedances filter.", type = "number"), p_tribedist = list(description = "Proximity to tribal land limiter. Enter an amount of mile between 0 and 25 to filter results.  This parameter is only evaluated if p_tribeid is populated.", type = "number"), p_pd = list(description = "Population Density Limiter (per sq mile). Enter a value to limit results to facilities located in area of a given population density.\n- NONE = 0 population density per square mile\n- GT100 = More than 100 population density per square mile\n- GT500 = More than 500 population density per square mile\n- GT1000 = More than 1000 population density per square mile\n- GT5000 = More than 5000 population density per square mile\n- GT10000 = More than 10000 population density per square mile\n- GT20000 = More than 20000 population density per square mile", 
    enum = list("NONE", "GT100", "GT500", "GT1000", "GT5000", "GT10000", "GT20000"), type = "string"), p_pctlowinc = list(description = "Percent Low Income filter. Enter a value to restrict results to facilities with a given percentage of low income population within 3-mile radius.", type = "string"), p_pm = list(description = "Percent People of Color Limiter.  Enter a value to restrict results to facilities with a given percentage of people of color within 3-mile radius.\n- NONE = 0%\n- GTx = greater than x%\n- GTEx = greater than or equal to x%", 
    enum = list("NONE", "GT5", "GE5", "GT10", "GE10", "GT25", "GE25", "GT50", "GE50", "GT75", "GE75"), type = "string"), xmax = list(description = "Maximum longitude value in decimal degrees.", type = "number"), ymax = list(description = "Maximum latitude value in decimal degrees.", type = "number"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string"), qcolumns = list(description = "Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.", 
    type = "string"), queryset = list(description = "Query Limiter.  Enter a value to limit the number of records returned for each query. Value cannot exceed 70,000.", type = "number"), responseset = list(description = "Response Set Limiter. Enter a value to limit the number of records per page. Value cannot exceed 1,000.", type = "number"), p_pretty_print = list(description = "Optional flag to request GeoJSON formatted results to be pretty printed.  Only provide a numeric value when the output needs to be human readable as pretty printing has a performance cost.", 
    type = "number")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- ecattaqs_request(method = "POST", path = "/ecatt_aqs_rest_services.get_facilities", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_site_code = list(), p_year = list(), p_reg = list(), p_rpo = list(), p_st = list(), p_zip = list(), p_fips = list(), p_ct = list(), p_loc = list(), p_naa_located = list(), p_naa_pol = list(), p_naa_cl = list(), p_name = list(), p_std = list(), p_naaq_std = list(), p_trend = list(), p_naaq_comp = list(), p_naaq_exceed = list(), p_tribedist = list(), p_pd = list(), p_pctlowinc = list(), p_pm = list(), xmax = list(), ymax = list(), callback = list(), qcolumns = list(), queryset = list(), 
    responseset = list(), p_pretty_print = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(description = "Enter the AQS Site Code(s) for the monitoring stations. Provide multiple values as a comma-delimited list.", 
    type = "string"), p_year = list(description = "Year. Enter LAST5 or a single calendar year to filter results. Available values: LAST10, LAST5, or a single calendar year", default = "LAST10", type = "string"), p_reg = list(description = "EPA Region Filter. Provide a single value of 01 thru 10 to restrict results to a single EPA region.", enum = list("01", "02", "03", "04", "05", "06", "07", "08", "09", "10"), type = "string"), p_rpo = list(description = "EPA Regional Planning Organization filter. Available values: WRAP, CENRAP, MIDRPO, MAN-VU, VISTAS", 
    type = "string"), p_st = list(description = "Air Monitoring Station State and State-Equivalent Filter. Provide one or more USPS postal abbreviations for states and state-equivalents to filter results. Provide multiple values as a comma-delimited list.", type = "string"), p_zip = list(description = "5-Digit ZIP Code Filter. Provide one or more 5-digit postal zip codes to filter results.  May contain multiple comma-separated values.", type = "string"), p_fips = list(description = "FIPS Code Filter.  Enter a single 5-character Federal Information Processing Standards (FIPS) state + county value to restrict results.  E.g. to limit results to Kenosha County, Wisconsin, use 55059.", 
    type = "string"), p_ct = list(description = "Air Monitoring Station County Filter. Enter a single case-insensitive county name  in combination with a state value provided via p_st.", type = "string"), p_loc = list(description = "Location type filter. Enter a single location type to restrict results based on population density and land usage. Available values: RURAL, URBAN, SUBURBAN", type = "string"), p_naa_located = list(description = "Monitor located in a Nonattainment Area filter.  Enter to filter results not in nonattainment areas, in nonattainment areas, or in maintenance areas. Available values: NA, MA,", 
    type = "string"), p_naa_pol = list(description = "Nonattainment Area Pollutant filter. Enter a single pollutant in nonattainment to filter results.", type = "string"), p_naa_cl = list(description = "Nonattainment Area Classification filter. Enter a severity classification to filter results. The classifications to filter on are dependant on p_naa_pol.", type = "string"), p_name = list(description = "Pollutant Name Filter. Enter an AQS Pollutant code to filter results.", type = "string"), p_std = list(
    description = "Pollutant Standard filter. Enter a pollutant standard defined by AQS to filter results. The pollutant standards to filter on are dependent on p_name", type = "string"), p_naaq_std = list(description = "NAAQ Standard filter. Available values:  P,S", type = "string"), p_trend = list(description = "Air Concentration Trend Filter. Enter to filter results with increasing or decreasing pollutant concentrations. Available Values: \"INC\", \"DEC\"", type = "string"), p_naaq_comp = list(
    description = "Ambient Air Quality Monitoring Comparison to NAAQS filter.", type = "string"), p_naaq_exceed = list(description = "Number of NAAQS Exceedances filter.", type = "number"), p_tribedist = list(description = "Proximity to tribal land limiter. Enter an amount of mile between 0 and 25 to filter results.  This parameter is only evaluated if p_tribeid is populated.", type = "number"), p_pd = list(description = "Population Density Limiter (per sq mile). Enter a value to limit results to facilities located in area of a given population density.\n- NONE = 0 population density per square mile\n- GT100 = More than 100 population density per square mile\n- GT500 = More than 500 population density per square mile\n- GT1000 = More than 1000 population density per square mile\n- GT5000 = More than 5000 population density per square mile\n- GT10000 = More than 10000 population density per square mile\n- GT20000 = More than 20000 population density per square mile", 
    enum = list("NONE", "GT100", "GT500", "GT1000", "GT5000", "GT10000", "GT20000"), type = "string"), p_pctlowinc = list(description = "Percent Low Income filter. Enter a value to restrict results to facilities with a given percentage of low income population within 3-mile radius.", type = "string"), p_pm = list(description = "Percent People of Color Limiter.  Enter a value to restrict results to facilities with a given percentage of people of color within 3-mile radius.\n- NONE = 0%\n- GTx = greater than x%\n- GTEx = greater than or equal to x%", 
    enum = list("NONE", "GT5", "GE5", "GT10", "GE10", "GT25", "GE25", "GT50", "GE50", "GT75", "GE75"), type = "string"), xmax = list(description = "Maximum longitude value in decimal degrees.", type = "number"), ymax = list(description = "Maximum latitude value in decimal degrees.", type = "number"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string"), qcolumns = list(description = "Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.", 
    type = "string"), queryset = list(description = "Query Limiter.  Enter a value to limit the number of records returned for each query. Value cannot exceed 70,000.", type = "number"), responseset = list(description = "Response Set Limiter. Enter a value to limit the number of records per page. Value cannot exceed 1,000.", type = "number"), p_pretty_print = list(description = "Optional flag to request GeoJSON formatted results to be pretty printed.  Only provide a numeric value when the output needs to be human readable as pretty printing has a performance cost.", 
    type = "number")), required = list()))
  result
}

#' ECATT Air Monitoring Station (AMS) CAP Search Paginated Results Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param qid Query ID Selector.  Enter the QueryID number from a previously run query.
#' @param pageno Indicates the number of the page to display. It is used only when the results are paginated.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @param newsort Output Sort Column.  Enter the number of the column on which the data will be sorted. If unpopulated results will sort on the first column.
#' @param descending Output Sort Column Descending Flag.  Enter Y to column identified in the newsort parameter descending.  Enter N to use ascending sort order. Used only when newsort parameter is populated.
#' @param qcolumns Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Criteria Air Pollutant Search Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_get_qid <- function(output = NULL, qid, pageno = 1, callback = NULL, newsort = NULL, descending = NULL, qcolumns = NULL) {
  if (base::is.null(qid)) base::stop("Required input: qid")
  .api_validation$parameter_values(base::list("output" = output, "qid" = qid, "pageno" = pageno, "callback" = callback, "newsort" = newsort, "descending" = descending, "qcolumns" = qcolumns), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), qid = list(name = "qid", "in" = "query", description = "Query ID Selector.  Enter the QueryID number from a previously run query.", 
    type = "string"), pageno = list(name = "pageno", "in" = "query", description = "Indicates the number of the page to display. It is used only when the results are paginated.", default = 1L, type = "number"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string"), newsort = list(name = "newsort", "in" = "query", description = "Output Sort Column.  Enter the number of the column on which the data will be sorted. If unpopulated results will sort on the first column.", 
    type = "number"), descending = list(name = "descending", "in" = "query", description = "Output Sort Column Descending Flag.  Enter Y to column identified in the newsort parameter descending.  Enter N to use ascending sort order. Used only when newsort parameter is populated.", enum = list("Y", "N"), type = "string"), qcolumns = list(name = "qcolumns", "in" = "query", description = "Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.", 
    type = "string")), .api_validation$body_value, c(output = "query", qid = "query", pageno = "query", callback = "query", newsort = "query", descending = "query", qcolumns = "query"))
  params <- base::list("output" = output, "qid" = qid, "pageno" = pageno, "callback" = callback, "newsort" = newsort, "descending" = descending, "qcolumns" = qcolumns)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["qid"]]) && base::any(!base::nzchar(params[["qid"]]))) base::stop("Empty query parameter: qid")
  if (base::is.character(params[["pageno"]]) && base::any(!base::nzchar(params[["pageno"]]))) base::stop("Empty query parameter: pageno")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  if (base::is.character(params[["newsort"]]) && base::any(!base::nzchar(params[["newsort"]]))) base::stop("Empty query parameter: newsort")
  if (base::is.character(params[["descending"]]) && base::any(!base::nzchar(params[["descending"]]))) base::stop("Empty query parameter: descending")
  if (base::is.character(params[["qcolumns"]]) && base::any(!base::nzchar(params[["qcolumns"]]))) base::stop("Empty query parameter: qcolumns")
  result <- ecattaqs_request(method = "GET", path = "/ecatt_aqs_rest_services.get_qid", path_params = base::list(), query = base::list("output" = params[["output"]], "qid" = params[["qid"]], "pageno" = params[["pageno"]], "callback" = params[["callback"]], "newsort" = params[["newsort"]], "descending" = params[["descending"]], "qcolumns" = params[["qcolumns"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECATT Air Monitoring Station (AMS) CAP Search Paginated Results Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Criteria Air Pollutant Search Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_get_qid_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), qid = list(description = "Query ID Selector.  Enter the QueryID number from a previously run query.", type = "string"), 
    pageno = list(description = "Indicates the number of the page to display. It is used only when the results are paginated.", default = 1L, type = "number"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string"), newsort = list(description = "Output Sort Column.  Enter the number of the column on which the data will be sorted. If unpopulated results will sort on the first column.", 
        type = "number"), descending = list(description = "Output Sort Column Descending Flag.  Enter Y to column identified in the newsort parameter descending.  Enter N to use ascending sort order. Used only when newsort parameter is populated.", enum = list("Y", "N"), type = "string"), qcolumns = list(description = "Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.", 
        type = "string")), required = list("qid")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- ecattaqs_request(method = "POST", path = "/ecatt_aqs_rest_services.get_qid", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), qid = list(), pageno = list(), callback = list(), newsort = list(), descending = list(), qcolumns = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), qid = list(description = "Query ID Selector.  Enter the QueryID number from a previously run query.", type = "string"), 
    pageno = list(description = "Indicates the number of the page to display. It is used only when the results are paginated.", default = 1L, type = "number"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string"), newsort = list(description = "Output Sort Column.  Enter the number of the column on which the data will be sorted. If unpopulated results will sort on the first column.", 
        type = "number"), descending = list(description = "Output Sort Column Descending Flag.  Enter Y to column identified in the newsort parameter descending.  Enter N to use ascending sort order. Used only when newsort parameter is populated.", enum = list("Y", "N"), type = "string"), qcolumns = list(description = "Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.", 
        type = "string")), required = list("qid")))
  result
}

#' ECATT Air Monitoring Station (AMS) CAP Report Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param p_site_code Enter the AQS Site Code(s) for the monitoring stations. Provide multiple values as a comma-delimited list.
#' @param p_std Pollutant Standard filter. Enter a pollutant standard defined by AQS to filter results. The pollutant standards to filter on are dependent on p_name
#' @param p_year Year. Enter LAST5 or a single calendar year to filter results. Available values: LAST10, LAST5, or a single calendar year
#' @param p_map_facs p_map_facs
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Criteria Air Pollutant Search Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_get_rpt <- function(output = NULL, p_site_code = NULL, p_std = NULL, p_year = "LAST10", p_map_facs = NULL, callback = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "p_site_code" = p_site_code, "p_std" = p_std, "p_year" = p_year, "p_map_facs" = p_map_facs, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(name = "p_site_code", "in" = "query", description = "Enter the AQS Site Code(s) for the monitoring stations. Provide multiple values as a comma-delimited list.", 
    type = "string"), p_std = list(name = "p_std", "in" = "query", description = "Pollutant Standard filter. Enter a pollutant standard defined by AQS to filter results. The pollutant standards to filter on are dependent on p_name", type = "string"), p_year = list(name = "p_year", "in" = "query", description = "Year. Enter LAST5 or a single calendar year to filter results. Available values: LAST10, LAST5, or a single calendar year", default = "LAST10", type = "string"), p_map_facs = list(name = "p_map_facs", 
    "in" = "query", type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", type = "string")), .api_validation$body_value, c(output = "query", p_site_code = "query", p_std = "query", p_year = "query", p_map_facs = "query", callback = "query"))
  params <- base::list("output" = output, "p_site_code" = p_site_code, "p_std" = p_std, "p_year" = p_year, "p_map_facs" = p_map_facs, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["p_site_code"]]) && base::any(!base::nzchar(params[["p_site_code"]]))) base::stop("Empty query parameter: p_site_code")
  if (base::is.character(params[["p_std"]]) && base::any(!base::nzchar(params[["p_std"]]))) base::stop("Empty query parameter: p_std")
  if (base::is.character(params[["p_year"]]) && base::any(!base::nzchar(params[["p_year"]]))) base::stop("Empty query parameter: p_year")
  if (base::is.character(params[["p_map_facs"]]) && base::any(!base::nzchar(params[["p_map_facs"]]))) base::stop("Empty query parameter: p_map_facs")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- ecattaqs_request(method = "GET", path = "/ecatt_aqs_rest_services.get_rpt", path_params = base::list(), query = base::list("output" = params[["output"]], "p_site_code" = params[["p_site_code"]], "p_std" = params[["p_std"]], "p_year" = params[["p_year"]], "p_map_facs" = params[["p_map_facs"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECATT Air Monitoring Station (AMS) CAP Report Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Criteria Air Pollutant Search Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_get_rpt_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(description = "Enter the AQS Site Code(s) for the monitoring stations. Provide multiple values as a comma-delimited list.", 
    type = "string"), p_std = list(description = "Pollutant Standard filter. Enter a pollutant standard defined by AQS to filter results. The pollutant standards to filter on are dependent on p_name", type = "string"), p_year = list(description = "Year. Enter LAST5 or a single calendar year to filter results. Available values: LAST10, LAST5, or a single calendar year", default = "LAST10", type = "string"), p_map_facs = list(type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- ecattaqs_request(method = "POST", path = "/ecatt_aqs_rest_services.get_rpt", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), p_site_code = list(), p_std = list(), p_year = list(), p_map_facs = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), p_site_code = list(description = "Enter the AQS Site Code(s) for the monitoring stations. Provide multiple values as a comma-delimited list.", 
    type = "string"), p_std = list(description = "Pollutant Standard filter. Enter a pollutant standard defined by AQS to filter results. The pollutant standards to filter on are dependent on p_name", type = "string"), p_year = list(description = "Year. Enter LAST5 or a single calendar year to filter results. Available values: LAST10, LAST5, or a single calendar year", default = "LAST10", type = "string"), p_map_facs = list(type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), required = list()))
  result
}

#' ECATT Air Monitoring Station (AMS) CAP Search Download Data Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param qid Query ID Selector.  Enter the QueryID number from a previously run query.
#' @param qcolumns Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.
#' @param p_pretty_print Optional flag to request GeoJSON formatted results to be pretty printed.  Only provide a numeric value when the output needs to be human readable as pretty printing has a performance cost.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Criteria Air Pollutant Search Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_get_download <- function(output = NULL, qid, qcolumns = NULL, p_pretty_print = NULL) {
  if (base::is.null(qid)) base::stop("Required input: qid")
  .api_validation$parameter_values(base::list("output" = output, "qid" = qid, "qcolumns" = qcolumns, "p_pretty_print" = p_pretty_print), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), qid = list(name = "qid", "in" = "query", description = "Query ID Selector.  Enter the QueryID number from a previously run query.", 
    type = "string"), qcolumns = list(name = "qcolumns", "in" = "query", description = "Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.", type = "string"), p_pretty_print = list(name = "p_pretty_print", "in" = "query", description = "Optional flag to request GeoJSON formatted results to be pretty printed.  Only provide a numeric value when the output needs to be human readable as pretty printing has a performance cost.", 
    type = "number")), .api_validation$body_value, c(output = "query", qid = "query", qcolumns = "query", p_pretty_print = "query"))
  params <- base::list("output" = output, "qid" = qid, "qcolumns" = qcolumns, "p_pretty_print" = p_pretty_print)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["qid"]]) && base::any(!base::nzchar(params[["qid"]]))) base::stop("Empty query parameter: qid")
  if (base::is.character(params[["qcolumns"]]) && base::any(!base::nzchar(params[["qcolumns"]]))) base::stop("Empty query parameter: qcolumns")
  if (base::is.character(params[["p_pretty_print"]]) && base::any(!base::nzchar(params[["p_pretty_print"]]))) base::stop("Empty query parameter: p_pretty_print")
  result <- ecattaqs_request(method = "GET", path = "/ecatt_aqs_rest_services.get_download", path_params = base::list(), query = base::list("output" = params[["output"]], "qid" = params[["qid"]], "qcolumns" = params[["qcolumns"]], "p_pretty_print" = params[["p_pretty_print"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECATT Air Monitoring Station (AMS) CAP Search Download Data Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Criteria Air Pollutant Search Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_get_download_post <- function(body) {
  if (base::missing(body)) base::stop("Required body")
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), qid = list(description = "Query ID Selector.  Enter the QueryID number from a previously run query.", type = "string"), 
    qcolumns = list(description = "Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.", type = "string"), p_pretty_print = list(description = "Optional flag to request GeoJSON formatted results to be pretty printed.  Only provide a numeric value when the output needs to be human readable as pretty printing has a performance cost.", 
        type = "number")), required = list("qid")), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- ecattaqs_request(method = "POST", path = "/ecatt_aqs_rest_services.get_download", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), qid = list(), qcolumns = list(), p_pretty_print = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), qid = list(description = "Query ID Selector.  Enter the QueryID number from a previously run query.", type = "string"), 
    qcolumns = list(description = "Used to customize service output.  A list of comma-separated column IDs of output objects that will be returned in the service query object or download.  Use the metadata service endpoint for a complete list of Ids and definitions.", type = "string"), p_pretty_print = list(description = "Optional flag to request GeoJSON formatted results to be pretty printed.  Only provide a numeric value when the output needs to be human readable as pretty printing has a performance cost.", 
        type = "number")), required = list("qid")))
  result
}

#' ECATT Air Monitoring Station (AMS) CAP Search Metadata Service
#' 
#' @noMd
#' @param output Output Format Flag.  Enter one of the following keywords:
#' - JSON = Data model formatted as Javascript Object Notation (default).
#' - JSONP = Data model formatted as Javascript Object Notation with Padding.  
#' - XML = Data model formatted as Extensible Markup Language.
#' @param callback JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Criteria Air Pollutant Search Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_metadata <- function(output = NULL, callback = NULL) {
  .api_validation$parameter_values(base::list("output" = output, "callback" = callback), list(output = list(name = "output", "in" = "query", description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(name = "callback", "in" = "query", description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), .api_validation$body_value, c(output = "query", callback = "query"))
  params <- base::list("output" = output, "callback" = callback)
  if (base::is.character(params[["output"]]) && base::any(!base::nzchar(params[["output"]]))) base::stop("Empty query parameter: output")
  if (base::is.character(params[["callback"]]) && base::any(!base::nzchar(params[["callback"]]))) base::stop("Empty query parameter: callback")
  result <- ecattaqs_request(method = "GET", path = "/ecatt_aqs_rest_services.metadata", path_params = base::list(), query = base::list("output" = params[["output"]], "callback" = params[["callback"]]), body = NULL, response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list())
  result
}

#' ECATT Air Monitoring Station (AMS) CAP Search Metadata Service
#' 
#' @noMd
#' @param body Request body.
#' @return Decoded response returned by the client request helper.
#' @family Air Monitoring Station Criteria Air Pollutant Search Services endpoints
#' @export
# Generated with specmill; do not edit by hand.
ecattaqs_metadata_post <- function(body = NULL) {
  if (!base::missing(body)) {
    body <- .api_validation$form_value(body, list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), required = list()), .api_validation$body_value, TRUE)
  }
  params <- base::list("body" = body)
  result <- ecattaqs_request(method = "POST", path = "/ecatt_aqs_rest_services.metadata", path_params = base::list(), query = base::list(), body = params[["body"]], response_policy = "echo_response_policy", request_controls = list(timeout = 60L, max_retries = 2L, retry_writes = TRUE, retry_policy = "echo_retry_policy"), server = list(url = "https://echodata.epa.gov/echo"), auth = list(), body_media = "application/x-www-form-urlencoded", body_encoding = list(output = list(), callback = list()), form_schema = list(type = "object", properties = list(output = list(description = "Output Format Flag.  Enter one of the following keywords:\n- JSON = Data model formatted as Javascript Object Notation (default).\n- JSONP = Data model formatted as Javascript Object Notation with Padding.  \n- XML = Data model formatted as Extensible Markup Language.", enum = list("JSONP", "JSON", "XML"), type = "string"), callback = list(description = "JSONP Callback.  For use with JSONP and GEOJSONP output only.  Enter a name of the function in which to wrap the JSON response.", 
    type = "string")), required = list()))
  result
}
