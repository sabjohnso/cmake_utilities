cmake_minimum_required(VERSION 3.12)
project(consume_contextual)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../..)
find_package(contextual REQUIRED)

add_executable(consume_contextual consume_contextual.cpp)
target_link_libraries(consume_contextual
  PRIVATE
    contextual::header
    type_utility::type_utility
    function_utility::function_utility)
  set_target_properties(consume_contextual
    PROPERTIES CXX_STANDARD ${contextual_CXX_STANDARD})
