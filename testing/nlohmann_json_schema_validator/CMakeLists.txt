cmake_minimum_required(VERSION 3.12)
project(nlohmann_json_schema_validator_integration)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../..)

find_package(nlohmann_json REQUIRED)
find_package(nlohmann_json_schema_validator REQUIRED)

add_executable(nlohmann_json_schema_validator_integration
  nlohmann_json_schema_validator_integration.cpp)

target_link_libraries(nlohmann_json_schema_validator_integration
  PRIVATE
    nlohmann_json::nlohmann_json
    nlohmann_json_schema_validator)
