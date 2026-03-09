if(NOT json-commander_FOUND)
  include(dependency)

  # json-commander's deps file uses install(TARGETS nlohmann_json ...) which
  # requires the non-namespaced target. System-installed nlohmann_json only
  # provides the namespaced IMPORTED target, so we force a FetchContent download.
  set(nlohmann_json_FORCE_DOWNLOAD TRUE)
  find_package(nlohmann_json REQUIRED)
  find_package(nlohmann_json_schema_validator REQUIRED)

  set(json_commander_BUILD_TESTING OFF CACHE BOOL "" FORCE)
  set(json_commander_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
  set(json_commander_BUILD_TOOLS OFF CACHE BOOL "" FORCE)
  set(json_commander_BUILD_C_API OFF CACHE BOOL "" FORCE)

  git_resolvable_dependency(
    NAME json-commander
    GIT_REPOSITORY https://github.com/JSON-Commander/json-commander.git
    GIT_TAG main)
endif()
