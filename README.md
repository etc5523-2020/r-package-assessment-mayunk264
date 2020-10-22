
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ozcovid

<!-- badges: start -->

<!-- badges: end -->

The goal of ozcovid is to allow the user to explore Australia’s
coronavirus data through the interactive Shiny application ‘Coronavirus
in Australia’ and the dataset ‘oz\_covid\_data’

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("etc5523-2020/r-package-assessment-mayunk264")
```

## Example

This is a basic example which shows you how to download the
‘oz\_covid\_data’ dataset.

``` r
library(ozcovid)

#download the dataset
ozcovid::oz_covid_data
#> # A tibble: 192 x 7
#>    date       `Daily Confirme… `Daily Death` `Daily Recovere… `Cumulative Con…
#>    <date>                <int>         <int>            <int>            <int>
#>  1 2020-01-22                0             0                0                0
#>  2 2020-01-23                0             0                0                0
#>  3 2020-01-24                0             0                0                0
#>  4 2020-01-25                0             0                0                0
#>  5 2020-01-26                4             0                0                4
#>  6 2020-01-27                1             0                0                5
#>  7 2020-01-28                0             0                0                5
#>  8 2020-01-29                1             0                0                6
#>  9 2020-01-30                3             0                2                9
#> 10 2020-01-31                0             0                0                9
#> # … with 182 more rows, and 2 more variables: `Cumulative Deaths` <int>,
#> #   `Cumulative Recovered` <int>
```
