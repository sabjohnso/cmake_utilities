cmake_minimum_required(VERSION 3.12)
project(consume_fmt)
list(INSERT CMAKE_MODULE_PATH 0 ${PROJECT_SOURCE_DIR}/../../..)
find_package(fmt REQUIRED)
add_executable(consume_fmt consume_fmt.cpp)
target_link_libraries(consume_fmt
  PRIVATE
    fmt::fmt
)
