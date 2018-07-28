
\[WIP\]

# ooni

Tools to Access the Open Observatory of Network Interference (‘OONI’)

## Description

The ‘Open Observatory of Network Interference’ (<http://ooni.io/>) is a
free software, global observation network for detecting censorship,
surveillance and traffic manipulation on the internet. Tools are
provided to query the ‘API’ and download both bulk metadata and test
observation data files.

## What’s Inside The Tin

The following functions are implemented:

  - `ooni_get_measurement` Retrieve an OONI measurement
  - `ooni_list_files` List measurement files
  - `ooni_list_measurements` List measurements
  - `ooni_next_pg` Retrieve the next page of results from an OONI
    paginated API endpoint
  - `ooni_pg_info` Retrieve pagination metadata for a current request
    result object

## Installation

``` r
devtools::install_github("hrbrmstr/ooni")
# OR
devtools::install_git("git://gitlab.com/hrbrmstr/ooni")
```

## Usage

``` r
library(ooni)

# current verison
packageVersion("ooni")
```

    ## [1] '0.1.0'
