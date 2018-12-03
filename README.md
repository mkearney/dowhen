
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

### Examples

#### `do_when()`

**DO** something **WHEN** something else is true

``` r
## wait 5 seconds between attempts
do_when(rnorm(10), runif(1) > .5, .s = 5)
#> ↪ Waiting 5 seconds
#> ↪ Waiting 5 seconds
#> ↪ Waiting 5 seconds
#> ↪ Waiting 5 seconds
#> ↪ Waiting 5 seconds
#> ↪ Waiting 5 seconds
#> ↪ Waiting 5 seconds
#> ✔ It's time!
#>  [1]  0.67520151  0.01426928  1.47067596  0.00560803  1.02074094
#>  [6]  1.04324415  1.38571702  0.21097623  0.26727661 -0.83558820
```

#### `do_when_time()`

**DO** something **WHEN** it’s a certain **TIME**

``` r
## set desired time to trigger something
good_time <- Sys.time() + 8

## wait 5 seconds between attempts
do_when_time(rnorm(5), good_time, .s = 5)
#> ↪ Waiting 5 seconds
#> ↪ Waiting 5 seconds
#> ✔ It's time!
#> [1] -1.1685281 -0.9287931 -0.0946983 -2.1862568  1.6562308
```

#### `do_when_file()`

**DO** something **WHEN** a certain **FILE** exists

``` r
## create "test" file
cat("You read my file!", file = "test")

## check for "test" file every minute
do_when_file(tfse::readlines("test"), "test", .s = 60)
#> ✔ It's time!
#> [1] "You read my file!"

## remove test file
unlink("test")
```
