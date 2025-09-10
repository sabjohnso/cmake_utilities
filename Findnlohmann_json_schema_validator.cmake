if(NOT nlohmann_json_schema_validator_FOUND)
  include(dependency)
  git_resolvable_dependency(
    NAME nlohmann_json_schema_validator
    GIT_REPOSITORY https://github.com/pboettch/json-schema-validator.git)

endif()
