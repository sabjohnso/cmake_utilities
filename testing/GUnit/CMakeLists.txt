cmake_minimum_required(VERSION 3.22)
project(consume_gunit)
list(INSERT CMAKE_MODULE_PATH 0 ${PROJECT_SOURCE_DIR}/../..)
find_package(GUnit REQUIRED)
add_executable(consume_gunit consume_gunit.cpp)
target_link_libraries(consume_gunit PRIVATE
  GUnit::header
  gtest_main)
