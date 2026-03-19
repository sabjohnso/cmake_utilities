if(NOT list_processing_FOUND)
  include(dependency)
  git_resolvable_dependency(
    NAME list_processing
    GIT_REPOSITORY https://github.com/sabjohnso/list_processing
    GIT_TAG master)
  if(NOT list_processing_FOUND)
    add_subdirectory(
      ${list_processing_SOURCE_DIR}
      ${list_processing_BINARY_DIR}
      ${list_processing_EXCLUDE_FROM_ALL})
  endif()
endif()
