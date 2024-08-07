#include <highfive/H5Easy.hpp>

int
main(int, char**){
  H5Easy::File file("example.h5", H5Easy::File::Overwrite);

  int A =  7;
  H5Easy::dump(file, "/path/to/A", A);

  A = H5Easy::load<int>(file, "/path/to/A");
  return 0;
}
