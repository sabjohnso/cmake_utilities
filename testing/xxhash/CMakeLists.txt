cmake_minimum_required(VERSION 3.12)
project(xxhash_integration)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../..)
find_package(xxhash REQUIRED)

add_executable(xxhash_integration xxhash_integration.cpp)
