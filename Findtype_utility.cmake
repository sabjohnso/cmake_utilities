if(NOT TARGET type_utility::header)
  include(dependency)
  git_resolvable_dependency(
    NAME type_utility
    GIT_REPOSITORY https://github.com/sabjohnso/type_utility.git
    GIT_TAG main)
  if(NOT type_utility_FOUND)
    add_subdirectory(
      ${type_utility_SOURCE_DIR}
      ${type_utility_BINARY_DIR}
      ${type_utility_EXCLUDE_FROM_ALL})
  endif()
endif()
