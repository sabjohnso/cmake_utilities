if(NOT nlohmann_json_FOUND)
  include(dependency)
  git_resolvable_dependency(
    NAME nlohmann_json
    GIT_REPOSITORY https://github.com/nlohmann_json.git)
  if(NOT nlohmann_json_FOUND)
    if(nlohmann_json_POPULATED)
      set(nlohmann_json_FOUND TRUE)
    else()
      message(FATAL_ERROR "Could not resolve nlohmann_json")
    endif()
  endif()
endif()
