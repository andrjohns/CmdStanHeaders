#include <cmdstan/command.hpp>
#include <stan/services/error_codes.hpp>
#include "RcppEigen.h"

// [[Rcpp::export]]
int cmdstan_main(Rcpp::CharacterVector options) {
    int argc = 1 + options.size();
    char** argv = new char*[argc];

    // Read in the name
    std::string name = "\0";
    argv[0] = new char[name.size() + 1];
    strcpy(argv[0], name.c_str());

    if(options.size() > 0) {


        // internal counter
        int counter = 1;

        // Read List into vector of char arrays
        for (int i = 0; i < options.size(); ++i) {

            std::string val = std::string(options[i]);
            argv[counter] = new char[val.size() + 1];
            strcpy(argv[counter++], val.c_str());
        }

    }

    const char** argv2 = const_cast<const char**>(argv);

  try {
    int err_code = cmdstan::command(argc, argv2);
    if (err_code == 0)
      return cmdstan::return_codes::OK;
    else
      return cmdstan::return_codes::NOT_OK;
  } catch (const std::exception &e) {
    std::cerr << e.what() << std::endl;
    return cmdstan::return_codes::NOT_OK;
  }
}
