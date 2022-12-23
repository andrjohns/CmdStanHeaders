#' @export
cmdstan_model <- function(file = NULL, model_code = NULL) {
  if (!is.null(file)) {
    model_code <- paste(readLines(file), collapse = "\n")
  }
  hpp <- stanc(model_code = model_code)

  cpp_to_compile <- paste(c(
    hpp,
    readLines(system.file("cpp/main.cpp", package = "cmdstandev", mustWork = TRUE))
  ), collapse = "\n")

  env <- new.env()

  withr::with_makevars(
    c(
      USE_CXX14 = 1,
      PKG_CXXFLAGS = cxxflags(),
      PKG_LDFLAGS = libflags()
    ),
    Rcpp::sourceCpp(code = cpp_to_compile, rebuild = TRUE, env = env)
  )

  env
}
