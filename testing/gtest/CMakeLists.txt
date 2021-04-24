cmake_minimum_required(VERSION 3.12)
project(consume_gtest)

list(INSERT CMAKE_MODULE_PATH 0 ${PROJECT_SOURCE_DIR}/../..)
find_package(GTest REQUIRED)

add_executable(consume_gtest consume_gtest.cpp)
target_link_libraries(consume_gtest PRIVATE GTest::gtest_main)
