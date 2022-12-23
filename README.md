
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cmdstandev

<!-- badges: start -->
<!-- badges: end -->

## Example

``` r
library(cmdstandev)
stan_path <- system.file("examples/bernoulli.stan", package = "cmdstandev", mustWork = TRUE)
data_path <- system.file("examples/bernoulli.data.json", package = "cmdstandev", mustWork = TRUE)

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
#> 1 lp__     -7.27  -7.00  0.769 0.344 -8.52   -6.75   1.00     483.     640.
#> 2 theta     0.246  0.228 0.119 0.118  0.0876  0.468  1.00     383.     551.
```
