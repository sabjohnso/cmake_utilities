cmake_minimum_required(VERSION 3.12)
project(introspection_integration)
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../../..)

find_package(introspection REQUIRED)

set(CMAKE_CXX_STANDARD ${introspection_CXX_STANDARD})

add_executable(introspection_integration introspection_integration.cpp)
target_link_libraries(introspection_integration PRIVATE introspection::header)
