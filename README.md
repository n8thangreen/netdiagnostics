
<!-- README.md is generated from README.Rmd. Please edit that file -->
netdiagnostics
==============

![](badges/lifecycle-experimental-orange.svg) ![](badges/license-MIT-blue.svg) [![Build Status](https://travis-ci.org/n8thangreen/netdiagnostics.svg?branch=master)](https://travis-ci.org/n8thangreen/netdiagnostics)

The goal of `netdiagnostics` is to combine multiple test results to form an equivalent single test with respect to sensitivity and specificity.

Installation
------------

You can install the development version from [GitHub](https://github.com/n8thangreen/netdiagnostics) with:

``` r
# install.packages("devtools")
devtools::install_github("n8thangreen/netdiagnostics")
```

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
library(netdiagnostics)
net_sensspec(pos_threshold = 2,
             sens = c(0.1,0.2,0.3,0.4),
             spec = c(0.1,0.2,0.3,0.4))
#> $net_sens
#> [1] 0.2572
#> 
#> $net_spec
#> [1] 0.0428
```
