cmake_minimum_required(VERSION 3.18)

project(easyj_integration)
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../../..)

# Upstream easyj bundles its own cmake_utilities which defaults pfr to
# boostorg/pfr.  Pre-set cache variables to use the standalone pfr_non_boost
# which provides the <pfr/core.hpp> headers and pfr:: namespace that easyj expects.
set(pfr_GIT_REPOSITORY https://github.com/apolukhin/pfr_non_boost CACHE STRING "")
set(pfr_GIT_TAG master CACHE STRING "")

find_package(easyj REQUIRED)
find_package(pfr REQUIRED)

set(CMAKE_CXX_STANDARD ${easyj_CXX_STANDARD})

add_executable(easyj_integration easyj_integration.cpp)
target_link_libraries(easyj_integration PRIVATE easyj::header)
