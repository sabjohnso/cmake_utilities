//
// ... external header files
//
#include <pybind11/pybind11.h>

struct Point
{
  double x;
  double y;
};
namespace py = pybind11;

PYBIND11_MODULE(example, m)
{
  py::class_<Point>(m, "Point")
    .def(py::init<double, double>())
    .def_readwrite("x", &Point::x)
    .def_readwrite("y", &Point::y);
}
