cmake_minimum_required(VERSION 3.12)
project(sml_integration)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../..)
find_package(sml REQUIRED)

add_executable(sml_integration sml_integration.cpp)
set_target_properties(sml_integration
  PROPERTIES
  CXX_STANDARD 20)
target_link_libraries(sml_integration PRIVATE sml::header)
