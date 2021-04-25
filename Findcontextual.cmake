if(NOT contextual_FOUND)
  include(dependency)
  git_resolvable_dependency(
    NAME contextual
    GIT_REPOSITORY https://github.com/sabjohnso/contextual.git
    GIT_TAG main)
  if(NOT contextual_FOUND)
    add_subdirectory(
      ${contextual_SOURCE_DIR}
      ${contextual_BINARY_DIR}
      ${contextual_EXCLUDE_FROM_ALL})
  endif()
endif()
      
