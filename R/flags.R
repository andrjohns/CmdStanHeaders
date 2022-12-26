#' @export
libflags <- function() {
  paste(
    paste0("-L", shQuote(dirname(RcppParallel::tbbLibraryPath("tbb")))),
    "-ltbb",
    paste0("-Wl,-rpath,", shQuote(RcppParallel::tbbLibraryPath("tbb"))),
    paste0("-L", shQuote(dirname(RcppParallel::tbbLibraryPath("tbbmalloc")))),
    "-ltbbmalloc",
    paste0("-Wl,-rpath,", shQuote(RcppParallel::tbbLibraryPath("tbbmalloc"))),
    "-L", shQuote(system.file("", package = "sundialr")),
    "-lsundials_all"
  )
}

#' @export
cxxflags <- function() {
  paste(
    paste0("-I", shQuote(system.file("include", package = "CmdStanHeaders", mustWork = TRUE))),
    paste0("-I", shQuote(system.file("include", package = "Rcpp", mustWork = TRUE))),
    paste0("-I", shQuote(system.file("include", package = "RcppEigen", mustWork = TRUE))),
    paste0("-I", shQuote(system.file("include", package = "RcppParallel", mustWork = TRUE))),
    paste0("-I", shQuote(system.file("include", package = "BH", mustWork = TRUE))),
    paste0("-I", shQuote(system.file("include", package = "sundialr", mustWork = TRUE))),
    paste0("-I", shQuote(system.file("include", package = "rapidjsonr", mustWork = TRUE))),
    "-D_REENTRANT",
    "-DRCPP_PARALLEL_USE_TBB=1",
    "-DTBB_INTERFACE_NEW",
    "-DSTAN_THREADS",
    "-DEIGEN_PERMANENTLY_DISABLE_STUPID_WARNINGS",
    "-Wno-deprecated-builtins",
    "-Wno-deprecated-declarations",
    "-Wno-unknown-attributes",
    "-Wno-ignored-attributes",
    "-Wno-sign-compare",
    "-Wno-parentheses",
    "-Wno-unused-but-set-variable",
    "-Wno-unused-variable",
    "-Wno-unknown-warning-option"
  )
}
