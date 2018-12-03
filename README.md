
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dowhen <img src="man/figures/logo.png" align="right" height=160/>

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
do_when(rnorm(10), runif(1) > .25, .s = 5)
#> ✔ It's time!
#>  [1] -1.14834822 -0.13355004 -0.00667972  0.78728776 -0.64064666
#>  [6] -0.72742693  0.77617354  0.81115401  0.22888682 -0.04896746
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
#> [1]  0.763136  0.599533 -0.691657 -0.836801  0.934215
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
