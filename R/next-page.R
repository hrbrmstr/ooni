#' Retrieve the next page of results from an OONI paginated API endpoint
#'
#' @md
#' @param res return value from a paginated OONI API call
#' @family pagination helpers
#' @export
ooni_next_pg <- function(res) {

  next_url <- attr(x, "pagination_info")$next_url
  method <- attr(x, "pagination_info")$method

  next_res <- httr::GET(next_url)

  switch(
    method,
    `ooni_list_files` = .process_list_files_results(next_res),
    `ooni_list_measurements` = .process_list_measurements_results(next_res)
  )

}

#' Retrieve pagination metadata for a current request result object
#'
#' @md
#' @param res return value from a paginated OONI API call
#' @return list containing the API method, total record count, current page,
#'         page results limit, offset and total number of pages. If `count` or
#'         `pages` is `-1` then there are a larger number of results and you
#'         should consider using better search filters.
#' @export
ooni_pg_info <- function(res) {

  return(
    attr(
      x = x,
      which = "pagination_info"
    )[c("method", "count", "current_page", "limit", "offset", "pages")]
  )

}