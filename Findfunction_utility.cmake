
if(NOT TARGET function_utility::header)
  include(dependency)
  git_resolvable_dependency(
    NAME function_utility
    GIT_REPOSITORY https://github.com/sabjohnso/function_utility.git
    GIT_TAG main)
  if(NOT function_utility_FOUND)
    add_subdirectory(
      ${function_utility_SOURCE_DIR}
      ${function_utility_BINARY_DIR}
      ${function_utility_EXCLUDE_FROM_ALL})
  endif()
endif()
