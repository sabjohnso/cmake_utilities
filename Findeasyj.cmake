if(NOT TARGET easyj::header)
  include(dependency)
  git_resolvable_dependency(
    NAME easyj
    GIT_REPOSITORY https://github.com/sabjohnso/easyj.git
    GIT_TAG main)
  if(NOT easyj_FOUND)
    add_subdirectory(
      ${easyj_SOURCE_DIR}
      ${easyj_BINARY_DIR}
      ${easyj_EXCLUDE_FROM_ALL})
  endif()
endif()
