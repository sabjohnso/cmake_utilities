if(NOT HighFive_FOUND)
  include(dependency)
  git_resolvable_dependency(
    NAME HighFive
    GIT_REPOSITORY https://github.com/BlueBrain/HighFive.git
  )
endif()
