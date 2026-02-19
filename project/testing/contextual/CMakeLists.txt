cmake_minimum_required(VERSION 3.12)
project(consume_contextual)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../../..)

# Upstream contextual bundles its own cmake_utilities which has wrong branch
# names for these dependencies. Pre-set the correct tags here so the fetched
# cmake_utilities respects them via the parameter() cache variable mechanism.
set(type_utility_GIT_TAG master CACHE STRING "")
set(function_utility_GIT_TAG master CACHE STRING "")

find_package(contextual REQUIRED)
find_package(type_utility REQUIRED)
find_package(function_utility REQUIRED)

add_executable(consume_contextual consume_contextual.cpp)
target_link_libraries(consume_contextual
  PRIVATE
    contextual::header
    type_utility::header
    function_utility::function_utility)
  set_target_properties(consume_contextual
    PROPERTIES CXX_STANDARD ${contextual_CXX_STANDARD})
