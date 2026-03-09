if(NOT json-commander_FOUND)
  include(dependency)

  git_resolvable_dependency(
    NAME json-commander
    GIT_REPOSITORY https://github.com/JSON-Commander/json-commander.git
    GIT_TAG main)
endif()
