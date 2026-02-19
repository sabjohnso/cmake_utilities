cmake_minimum_required(VERSION 3.12)
project(consume_ctstring)

list(INSERT CMAKE_MODULE_PATH 0 ${PROJECT_SOURCE_DIR}/../../..)

# Upstream ctstring bundles its own cmake_utilities which has wrong branch
# name for type_utility. Pre-set the correct tag here.
set(type_utility_GIT_TAG master CACHE STRING "")

find_package(ctstring REQUIRED)

add_executable(consume_ctstring consume_ctstring.cpp)
target_link_libraries(consume_ctstring PRIVATE ctstring::header)
set_target_properties(consume_ctstring PROPERTIES CXX_STANDARD ${ctstring_CXX_STANDARD})
