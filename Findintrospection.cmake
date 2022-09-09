if(NOT TARGET introspection::header)
  include(dependency)
  git_resolvable_dependency(
    NAME introspection
    GIT_REPOSITORY https://github.com/sabjohnso/introspection.git
    GIT_TAG main)
  if(NOT introspection_FOUND)
    add_subdirectory(
      ${introspection_SOURCE_DIR}
      ${introspection_BINARY_DIR}
      ${introspection_EXCLUDE_FROM_ALL})
  endif()
endif()
