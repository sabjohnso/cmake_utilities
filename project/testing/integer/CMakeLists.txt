cmake_minimum_required(VERSION 3.12)
project(integer_integration)
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../../..)

find_package(integer REQUIRED)

set(CMAKE_CXX_STANDARD ${integer_CXX_STANDARD})

add_executable(integer_integration integer_integration.cpp)
target_link_libraries(integer_integration PRIVATE integer::header)
