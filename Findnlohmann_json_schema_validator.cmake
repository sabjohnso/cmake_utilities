if(NOT nlohmann_json_schema_validator_FOUND)
  include(dependency)
  git_resolvable_dependency(
    NAME nlohmann_json_schema_validator
    GIT_REPOSITORY https://github.com/pboettch/json-schema-validator.git)
  if(NOT nlohmann_json_schema_validator_FOUND)
    add_subdirectory(
      ${nlohmann_json_schema_validator_SOURCE_DIR}
      ${nlohmann_json_schema_validator_BINARY_DIR}
      ${nlohmann_json_schema_validator_EXCLUDE_FROM_ALL})

    if(TARGET nlohmann_json_schema_validator)
      set(nlohmann_json_schema_validator_FOUND TRUE)
    else()
      message(FATAL_ERROR "Could not resolve nlohmann_json_schema_validator")
    endif()
  endif()
endif()
