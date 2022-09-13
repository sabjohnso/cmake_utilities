if(NOT TARGET pybind11::headers)
  include(dependency)
  git_resolvable_dependency(
    NAME pybind11
    GIT_REPOSITORY https://github.com/pybind/pybind11.git)
  if(NOT pybind11_FOUND)
    add_subdirectory(
      ${pybind11_SOURCE_DIR}
      ${pybind11_BINARY_DIR}
      ${pybind11_EXCLUDE_FROM_ALL})
  endif()
endif()
