#include <easyj/easyj.hpp>
#include <iostream>
#include <nlohmann/json.hpp>

namespace example {

  struct Point
  {
    double x;
    double y;
  };

  using easyj::to_json;

} // end of namespace example

int
main(int, char**)
{
  using example::Point;
  using nlohmann::json;

  Point p{.x = 3.0, .y = 4.0};
  json pjson = p;
  std::cout << pjson << std::endl;
  return 0;
}
