#include <iostream>

#include <ctstring/macros.hpp>

int
main(int, char**){
  constexpr auto value = HOIST_STRING("Hello, World!");
  std::cout << value << std::endl;
  return 0;
}
