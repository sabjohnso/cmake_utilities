if(NOT TARGET xsimd)
  include(dependency)
  git_resolvable_dependency(
    NAME easyj
    GIT_REPOSITORY https://github.com/xtensor-stack/xsimd.git
    GIT_TAG master)
  )
  if(NOT xsimd_FOUND)
    add_subdirectory(
      ${xsimd_SOURCE_DIR}
      ${xsimd_BINARY_DIR}
      ${xsimd_EXCLUDE_FROM_ALL}
    )
endif()
