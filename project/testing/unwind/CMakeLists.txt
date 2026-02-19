cmake_minimum_required(VERSION 3.12)
project(consume_unwind)
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../../..)
find_package(unwind REQUIRED)

add_executable(consume_unwind consume_unwind.cpp)
target_link_libraries(consume_unwind
  PRIVATE unwind::unwind
  )
