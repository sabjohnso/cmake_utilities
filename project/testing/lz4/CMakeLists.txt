cmake_minimum_required(VERSION 3.12)
project(lz4_integration)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../../..)

find_package(lz4 REQUIRED)

add_executable(lz4_integration lz4_integration.cpp)
target_link_libraries(lz4_integration
  PRIVATE
    lz4::lz4_STATIC)
