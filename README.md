
<!-- README.md is generated from README.Rmd. Please edit that file -->

# p.post

<!-- badges: start -->
<!-- badges: end -->

The goal of p.post is to populate a spreadsheet with the number of
successes required, given number of subjects supplied, relating to the
posterior probability of the underlying success rate, p_post. Thus, it
ensures $P({\sf p\\_post}>p_1)$, where: I do not want \_italic text\_
here

- $N$: **Number of subjects**. The number of successes are calculated
  for a sample size $n = 1,\dots\N$.
- $p_1$: **Threshold for probability of success**.
- $p_2$: **Threshold for posterior probability**.

## Installation

You can install the latest version of p.post from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("reevesj53/p.post")
```

## Example

The code below shows an example of output for a success rate of 0.3, and
a posterior probability of exceeding the success rate ranging from 0.5
to 0.8. Number of required successes are computed for a range of N, from
1 to 80.

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

The data frame can be output to an excel file, with a separate sheet for
each of the success probabilities, \[0.5, 0.6, 0.7, 0.8\]. Run the R
function $\dots$

``` r
excel_out(post_prob)
```

The excel file below will by default be saved in the R working
directory.

![Excel output](/man/figures/excel.png)
