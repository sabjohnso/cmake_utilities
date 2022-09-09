//
// ... standard header files
//
#include <iostream>

//
// ... introspection header files
//
#include <introspection/introspection.hpp>
#include <introspection/macros.hpp>

namespace introspection::integration {

  struct point
  {
    double x;
    double y;
  };
  INTROSPECTION_DATA(point, x, y);

} // end of namespace introspection::integration

int
main(int, char**)
{
  using namespace introspection::integration;
  std::cout << introspection::bare_type_name<point> << std::endl;
  return 0;
}
