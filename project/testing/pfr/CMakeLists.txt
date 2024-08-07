cmake_minimum_required(VERSION 3.12)
project(consume_pfr)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../../..)
find_package(pfr REQUIRED)

add_executable(consume_pfr consume_pfr.cpp)
target_link_libraries(consume_pfr
  PRIVATE Boost::pfr
)
