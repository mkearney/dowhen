
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dowhen

[![Build
status](https://travis-ci.org/mkearney/dowhen.svg?branch=master)](https://travis-ci.org/mkearney/dowhen)
[![CRAN
status](https://www.r-pkg.org/badges/version/dowhen)](https://cran.r-project.org/package=dowhen)
[![Coverage
Status](https://codecov.io/gh/mkearney/dowhen/branch/master/graph/badge.svg)](https://codecov.io/gh/mkearney/dowhen?branch=master)

<!--#![Downloads](https://cranlogs.r-pkg.org/badges/dowhen)
#![Downloads](https://cranlogs.r-pkg.org/badges/grand-total/dowhen)-->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

> An R package for doing thing when something else happens

## Installation

Install the development version from Github with:

``` r
## install remotes pkg if not already
if (!requireNamespace("remotes")) {
  install.packages("remotes")
}

## install from github
remotes::install_github("mkearney/dowhen")
```

## Example

Keep checking every two minutes until a file appears and then perform
expression

``` r
## when this file appears, do this expression
d <- do_when_file(
  "~/Dropbox/pre-11-07.rds",
  ~ {
    rt <- readRDS(.x)
    d <- h.rtweet::lookup_all_tweets(rt$status_id)
    saveRDS(d, "~/Dropbox/pre-11-07-data-dowhen.rds")
    d
  },
  wait_time = 120
)
#> ↪ Waiting 120 seconds
#> ↪ Waiting 120 seconds
#> ↪ Waiting 120 seconds
#> ✔ Found it!
```
