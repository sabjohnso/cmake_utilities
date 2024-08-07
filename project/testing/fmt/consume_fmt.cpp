#include <string>
#include <fmt/core.h>


int
main(int, char**){
  using namespace std::literals;
  const auto x = "Hello"s;
  const auto y = "World"s;
    
  fmt::print("{}, {}!\n", x, y);
  return 0;
}
