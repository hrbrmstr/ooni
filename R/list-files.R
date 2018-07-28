.process_list_files_results <- function(res) {

  out <- httr::content(res, as = "text", encoding = "UTF-8")

  out <-  jsonlite::fromJSON(out)

  res_df <- out$results

  res_df$test_start_time <- to_ooni_timestamp(res_df$test_start_time)
  class(res_df) <- c("tbl_df", "tbl", "data.frame")

  attr(res_df, "pagination_info") <-
    list(
      method = "ooni_list_files",
      count = out$metadata$count,
      current_page = out$metadata$current_page,
      limit = out$metadata$limit,
      next_url = out$metadata$next_url,
      offset = out$metadata$offset,
      pages = out$metadata$pages
    )

  res_df

}

#' List measurement files
#'
#' @md
#' @param probe_cc two letter country code
#' @param probe_asn autonomous system number in the format "ASXXX"
#' @param test_name name of the test
#' @param since,until start/end dates of when measurements were run. A `POSIXct` object,
#'     `Date` object or character string that can be converted to one of those
#'     objects.
#' @param since_index return results only strictly greater than the provided index
#' @param order_by how the results should be ordered by. One of "`test_start_time`",
#'        "`probe_cc`", "`report_id`", "`probe_asn`", "`test_name`", "`index`",
#'        "`idx`", or "`report_no`". Default is "`test_start_time`".
#' @param ascending should the order be ascending or descending
#' @param offset offset into the paginated result set (default: `0`)
#' @param limit number of records to return (default & max are `100`)
#' @export
ooni_list_files <- function(probe_cc = NULL,
                            probe_asn = NULL,
                            test_name = NULL,
                            since = NULL,
                            until = NULL,
                            since_index = NULL,
                            order_by = c(
                              "test_start_time", "probe_cc", "report_id",
                              "probe_asn", "test_name", "index","idx", "report_no"
                            ),
                            ascending = TRUE,
                            offset = 0L,
                            limit = 100L) {

  match.arg(
    order_by[1],
    c(
      "test_start_time", "probe_cc", "report_id", "probe_asn",
      "test_name", "index","idx", "report_no"
    )
  ) -> order_by

  if ((limit < 1) | (limit > 100)) limit <- 100L
  limit <- as.integer(limit)

  httr::GET(
    url = "https://api.ooni.io/api/v1/files",
    httr::content_type_json(),
    query = list(
      probe_cc = probe_cc,
      probe_asn = probe_asn,
      test_name = test_name,
      since = to_ooni_timestamp(since),
      until = to_ooni_timestamp(until),
      since_index = since_index,
      order_by = order_by,
      order = (if (ascending[1]) "asc" else "desc"),
      offset = as.integer(offset),
      limit = as.integer(limit)
    )
  ) -> res

  httr::stop_for_status(res)

  .process_list_files_results(res)

}