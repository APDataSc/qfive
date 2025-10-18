
<!-- README.md is generated from README.Rmd. Please edit that file -->

# qfive

# Under Five Mortality Rate (u5MR) estimation.

<!-- badges: start -->

<!-- badges: end -->

The goal of `qfive` is to …

## How to load `qfive` package in R?

You can install the development version of qfive like so:

``` r
# install.packages("devtools")

devtools::install_github("APDataSc/qfive")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(qfive)

## basic example code
cmr_data22 <- data.frame(
  agegrp = c(15, 20, 25, 30, 35, 40, 45),
  women = c(725594, 728503, 671987, 623044, 591298, 558825, 476056),
  child_born = c(79100, 389089, 762811, 1069998, 1293875, 1393444, 1287071),
  child_dead = c(1757, 8282, 16627, 25003, 34509, 43514, 49648)
)

"q5 2022 - iussp"
ecu_nac_qx_iussp22 <- u5mr(
  cmr_data22,
  women = "women",
  child_born = "child_born",
  child_dead = "child_dead",
  agegrp = "agegrp",
  model = "CD West", #"UN General" "UN Latin" "UN South_Asian"
  svy_year = 2022+10/12+30/365,
  sex = "both",
  e_0 = 60,
  mac = 27.94587289
)
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
