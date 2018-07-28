#' Retrieve an OONI measurement
#'
#' @md
#' @param measurement_id the id of the measurement to retrieve
#' @export
ooni_get_measurement <- function(measurement_id) {

  httr::GET(
    url = sprintf("https://api.ooni.io/api/v1/measurement/%s", measurement_id)
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text", encoding = "UTF-8")

  out <- jsonlite::fromJSON(out)

  out

}