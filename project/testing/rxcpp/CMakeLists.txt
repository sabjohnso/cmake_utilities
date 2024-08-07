cmake_minimum_required(VERSION 3.12)
project(rxcpp_integration)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../../..)
find_package(rxcpp REQUIRED)

add_executable(rxcpp_integration rxcpp_integration.cpp)
target_link_libraries(rxcpp_integration
  PRIVATE rxcpp::header)

set_target_properties(rxcpp_integration
  PROPERTIES CXX_STANDARD 20)
