if(NOT nlohmann_json_FOUND)
  include(dependency)
  git_resolvable_dependency(
    NAME nlohmann_json
    GIT_REPOSITORY https://github.com/nlohmann/json.git)
endif()
