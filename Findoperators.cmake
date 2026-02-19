if(NOT operators_FOUND)
  include(dependency)
  git_resolvable_dependency(
    NAME operators
    GIT_REPOSITORY https://github.com/sabjohnso/operators
    GIT_TAG master)
endif()
