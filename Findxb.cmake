if(NOT xb_FOUND)
  include(dependency)
  git_resolvable_dependency(
    NAME xb
    GIT_REPOSITORY https://github.com/sabjohnso/xb.git
    GIT_TAG main
  )
  if(NOT xb_FOUND)
    add_subdirectory(
      ${xb_SOURCE_DIR}
      ${xb_BINARY_DIR}
      ${xb_EXCLUDE_FROM_ALL})
  endif()
endif()
