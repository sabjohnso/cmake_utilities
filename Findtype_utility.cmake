if(NOT type_utility_FOUND)
  include(dependency)
  git_resolvable_dependency(
    NAME type_utility
    GIT_REPOSITORY https://github.com/sabjohnso/type_utility.git
    GIT_TAG master)
endif()
