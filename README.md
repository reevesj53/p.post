
<!-- README.md is generated from README.Rmd. Please edit that file -->

# p.post

<!-- badges: start -->
<!-- badges: end -->

The goal of p.post is to populate a spreadsheet with the number of
successes required for a range of parameters:

- n
- p1
- p2

## Installation

You can install the latest version of p.post from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("reevesj53/p.post")
```

## Example

The code below shows an example of output for a success rate of 0.3, and
a posterior probability of exceeding the success rate ranfing from 0.5
to 0.8.

``` r
library(p.post)
p1 <- 0.3
p2 <- seq(0.5, 0.8, 0.1)
post_prob <- calc_post(80, p1, p2)
```

The resulting data frame is shown below.

``` r
post_prob
#> # A tibble: 320 × 5
#>        n  rate  prob   res post_prob
#>    <int> <dbl> <dbl> <int>     <dbl>
#>  1     1   0.3   0.5     1     0.91 
#>  2     2   0.3   0.5     1     0.784
#>  3     3   0.3   0.5     1     0.652
#>  4     4   0.3   0.5     1     0.528
#>  5     5   0.3   0.5     2     0.744
#>  6     6   0.3   0.5     2     0.647
#>  7     7   0.3   0.5     2     0.552
#>  8     8   0.3   0.5     3     0.730
#>  9     9   0.3   0.5     3     0.650
#> 10    10   0.3   0.5     3     0.570
#> # ℹ 310 more rows
```

The excel file is below.

![Excel
output](C:/Users/JohnR/OneDrive%20-%20HUTCHMED/Documents/p.post/man/figures/README-excel.png)
