//
// ... Standard header files
//
#include <iostream>
#include <string>

//
// ... External header files
//
#include <pfr.hpp>

struct example
{
  int a;
  double b;
  std::string c;
};

int
main(int, char**)
{
  example value{3, 0.5, "Some text"};
  std::cout << pfr::io(value) << std::endl;
  return 0;
}
