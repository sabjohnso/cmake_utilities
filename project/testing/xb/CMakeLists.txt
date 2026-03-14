cmake_minimum_required(VERSION 3.21)
project(consume_xb)
list(INSERT CMAKE_MODULE_PATH 0 ${PROJECT_SOURCE_DIR}/../../..)
find_package(xb REQUIRED)
add_executable(consume_xb consume_xb.cpp)
target_compile_features(consume_xb PRIVATE cxx_std_20)
target_link_libraries(consume_xb
  PRIVATE
    xb_header
)
