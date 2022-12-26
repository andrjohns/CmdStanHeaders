
<!-- README.md is generated from README.Rmd. Please edit that file -->

# CmdStanHeaders

<!-- badges: start -->
<!-- badges: end -->

## Example

``` r
library(CmdStanHeaders)
stan_path <- system.file("examples/bernoulli.stan", package = "CmdStanHeaders", mustWork = TRUE)
data_path <- system.file("examples/bernoulli.data.json", package = "CmdStanHeaders", mustWork = TRUE)

# Compile Stan executable as in-memory R function
bern <- cmdstan_model(file=stan_path)

# Pass character vector of command-line arguments
bern$cmdstan_main(c("sample", "data", paste0("file=",data_path)))
#> [1] 0

# Read standard CmdStan CSVs using the existing cmdstanr functions
cmdstan_fit <- cmdstanr::as_cmdstan_fit(file="output.csv")
cmdstan_fit$summary()
#> # A tibble: 2 × 10
#>   variable   mean median    sd   mad      q5    q95  rhat ess_bulk ess_tail
#>   <chr>     <dbl>  <dbl> <dbl> <dbl>   <dbl>  <dbl> <dbl>    <dbl>    <dbl>
#> 1 lp__     -7.34  -6.97  0.906 0.306 -9.10   -6.75   1.01     404.     380.
#> 2 theta     0.250  0.235 0.125 0.118  0.0654  0.483  1.02     243.     303.
```
