if(NOT list_processing_FOUND)
  include(dependency)
  git_resolvable_dependency(
    NAME list_processing
    GIT_REPOSITORY https://github.com/sabjohnso/list_processing
    GIT_TAG master)
endif()
