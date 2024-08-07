cmake_minimum_required(VERSION 3.12)
project(pybind11_integration)

list(INSERT CMAKE_MODULE_PATH 0 ${PROJECT_SOURCE_DIR}/../../..)
find_package(Python3 REQUIRED  COMPONENTS Interpreter Development.Module)
find_package(pybind11 REQUIRED)

add_library(pybind11_integration pybind11_integration.cpp)
target_link_libraries(pybind11_integration
  PRIVATE Python3::Module pybind11::headers
)

set_target_properties(pybind11_integration
  PROPERTIES
    CXX_STANDARD 20
)
