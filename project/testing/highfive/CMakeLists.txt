cmake_minimum_required(VERSION 3.12)
project(high_five_integration)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../../..)

find_package(HighFive REQUIRED)

add_executable(high_five_integration high_five_integration.cpp)
target_link_libraries(high_five_integration PRIVATE HighFive)
