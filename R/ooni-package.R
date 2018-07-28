#' Tools to Access the Open Observatory of Network Interference ('OONI')
#'
#' The 'Open Observatory of Network Interference' (<http://ooni.io/>) is
#' a free software, global observation network for detecting censorship,
#' surveillance and traffic manipulation on the internet. Tools are provided to
#' query the 'API' and download both bulk metadata and test observation data
#' files.
#'
#' The OONI API is nice for cursory analysis or some integrations with other
#' systems (e.g. OONI Explorer relies on it), but it’s currently not possible to
#' run any dataset scan that runs for more than a minute using the OONI API. So
#' the API is not the best option if the query does heavy scanning of metadata.
#' Also, implementation of pagination in the OONI API next_url is far from perfect
#' and may fail with greater than zero offsets.
#'
#' @md
#' @name ooni
#' @docType package
#' @author Bob Rudis (bob@@rud.is)
#' @import httr
#' @importFrom jsonlite fromJSON toJSON unbox
NULL
