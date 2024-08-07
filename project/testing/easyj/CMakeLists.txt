cmake_minimum_required(VERSION 3.18)

project(easyj_integration)
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../../..)

find_package(easyj REQUIRED)
find_package(pfr REQUIRED)

set(CMAKE_CXX_STANDARD ${easyj_CXX_STANDARD})

add_executable(easyj_integration easyj_integration.cpp)
target_link_libraries(easyj_integration PRIVATE easyj::header)
