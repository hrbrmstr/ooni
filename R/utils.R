from_ooni_timestamp <- function(x) {
  if (is.null(x)) return(x)
  as.POSIXct(x, "%Y-%m-%dT%H:%M:%S", tz="UTC")
}

to_ooni_timestamp <- function(x) {
  if (is.null(x)) return(x)
  format(as.POSIXct(x), "%Y-%m-%dT%H:%M:%SZ")
}

hack_param <- function(x) {
  paste0(tolower(as.character(x)), collapse = ",")
}