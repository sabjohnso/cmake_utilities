if(NOT TARGET integer::header)
  include(dependency)
  git_resolvable_dependency(
    NAME integer
    GIT_REPOSITORY https://github.com/sabjohnso/integer.git
    GIT_TAG main)
  if(NOT integer_FOUND)
    add_subdirectory(
      ${integer_SOURCE_DIR}
      ${integer_BINARY_DIR}
      ${integer_EXCLUDE_FROM_ALL})
  endif()
endif()
