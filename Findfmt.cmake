if(NOT fmt_FOUND)
  include(dependency)
  git_resolvable_dependency(
    NAME fmt
    GIT_REPOSITORY https://github.com/fmtlib/fmt.git
  )
  if(NOT fmt_FOUND)
    add_subdirectory(
      ${fmt_SOURCE_DIR}
      ${fmt_BINARY_DIR}
      ${fmt_EXCLUDE_FROM_ALL})
  endif()
endif()
