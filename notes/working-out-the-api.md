library(httr)
library(tidyverse)

httr::GET(
  url = "https://explorer.ooni.torproject.org/api/reports/vendors"
) -> res

out <- httr::content(res, as = "text")

jsonlite::fromJSON(out) %>%
  tbl_df() -> vendors


httr::GET(
  url = "https://explorer.ooni.torproject.org/api/reports/countByCountry"
) -> res

out <- httr::content(res, as = "text")

jsonlite::fromJSON(out) %>%
  tbl_df() -> count_by_country

# factbook
httr::GET(
  url = "https://explorer.ooni.torproject.org/data/factbook/it.json"
) -> res

out <- httr::content(res, as = "text")

jsonlite::fromJSON(out) -> country_factbook

https://explorer.ooni.torproject.org/api/countries/findOne?filter=%7B%22where%22:%7B%22iso_alpha2%22:%22IT%22%7D,%22include%22:%5B%22censorship_methods%22%5D%7D
filter	{"where":{"iso_alpha2":"IT"},"include":["censorship_methods"]}

https://explorer.ooni.torproject.org/api/reports/blockpageCount?probe_cc=IT
probe_cc	IT

https://explorer.ooni.torproject.org/api/reports/blockpageList?probe_cc=IT
probe_cc	IT

https://explorer.ooni.torproject.org/api/reports/vendors?probe_cc=IT
probe_cc	IT

https://explorer.ooni.torproject.org/api/reports/findMeasurements?order=test_start_time+DESC&page_number=0&page_size=100&probe_cc=IT
order	test_start_time+DESC
page_number	0
page_size	100
probe_cc	IT

tps://explorer.ooni.torproject.org/data/squid.json

https://explorer.ooni.torproject.org/api/nettests

https://explorer.ooni.torproject.org/api/reports/findMeasurements?order=test_start_time+DESC&page_number=0&page_size=100
order	test_start_time+DESC
page_number	0
page_size	100

https://explorer.ooni.torproject.org/api/reports/total

