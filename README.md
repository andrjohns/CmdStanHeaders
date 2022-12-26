
<!-- README.md is generated from README.Rmd. Please edit that file -->

# CmdStanHeaders

<!-- badges: start -->
<!-- badges: end -->

## Example

``` r
stan_path <- system.file("examples/bernoulli.stan", package = "CmdStanHeaders", mustWork = TRUE)
data_path <- system.file("examples/bernoulli.data.json", package = "CmdStanHeaders", mustWork = TRUE)

# Compile Stan executable as in-memory R function
bern <- CmdStanHeaders::cmdstan_model(file=stan_path)

# Pass character vector of command-line arguments
bern$cmdstan_main(c("sample", "data", paste0("file=",data_path)))
#> [1] 0

# Read standard CmdStan CSVs using the existing cmdstanr functions
cmdstan_fit <- cmdstanr::as_cmdstan_fit(file="output.csv")
cmdstan_fit$summary()
#> # A tibble: 2 × 10
#>   variable   mean median    sd   mad      q5    q95  rhat ess_bulk ess_tail
#>   <chr>     <dbl>  <dbl> <dbl> <dbl>   <dbl>  <dbl> <dbl>    <dbl>    <dbl>
#> 1 lp__     -7.28  -7.00  0.721 0.338 -8.73   -6.75  1.00      486.     680.
#> 2 theta     0.247  0.226 0.120 0.123  0.0797  0.461 0.999     349.     541.
```
