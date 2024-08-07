cmake_minimum_required(VERSION 3.12)
project(consume_contextual)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../../..)
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
