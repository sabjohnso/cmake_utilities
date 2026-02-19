if(NOT contextual_FOUND)
  include(dependency)
  git_resolvable_dependency(
    NAME contextual
    GIT_REPOSITORY https://github.com/sabjohnso/contextual.git
    GIT_TAG main)
endif()
