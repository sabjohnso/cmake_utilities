cmake_minimum_required(VERSION 3.12)
project(cppzmq_integration)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../..)
find_package(cppzmq REQUIRED)

add_executable(cppzmq_integration cppzmq_integration.cpp)
target_link_libraries(cppzmq_integration
  PRIVATE cppzmq::header)
