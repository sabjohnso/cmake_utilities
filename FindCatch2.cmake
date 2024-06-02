if(NOT catch2_FOUND)
  include(dependency)
  git_resolvable_dependency(
    NAME catch2
    GIT_REPOSITORY https://github.com/catchorg/Catch2.git
    GIT_TAG v3.6.0)
  if(NOT catch2_FOUND)
    add_subdirectory(
      ${catch2_SOURCE_DIR}
      ${catch2_BINARY_DIR}
      ${catch2_EXCLUDE_FROM_ALL})
    set(catch2_FOUND TRUE)
  endif()
endif()
