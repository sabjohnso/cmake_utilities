if(NOT nlohmann_json_schema_validator_FOUND)
  include(dependency)
  git_resolvable_dependency(
    NAME nlohmann_json_schema_validator
    GIT_REPOSITORY https://github.com/pboettch/json-schema-validator.git)
  if(TARGET nlohmann_json_schema_validator)
    set(nlohmann_json_schema_validator_FOUND TRUE)
  else()
    message(FATAL_ERROR "Could not resolve nlohmann_json_schema_validator")
  endif()
  # set_property(DIRECTORY ${nlohmann_json_schema_validator_SOURCE_DIR} PROPERTY EXCLUDE_FROM_ALL ON)
  # set_property(TARGET nlohmann_json_schema_validator PROPERTY EXCLUDE_FROM_ALL ON)
endif()
