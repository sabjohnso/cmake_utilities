if(NOT TARGET pybind11::headers)
  include(dependency)
  git_resolvable_dependency(
    NAME pybind11
    GIT_REPOSITORY https://github.com/pybind/pybind11.git)
  if(NOT pybind11_FOUND)
    set(PYBIND11_INSTALL ON CACHE BOOL "")
    add_subdirectory(
      ${pybind11_SOURCE_DIR}
      ${pybind11_BINARY_DIR}
      ${pybind11_EXCLUDE_FROM_ALL})
    include(GNUInstallDirs)
    set(pybind11_INSTALL_INCLUDEDIR ${CMAKE_INSTALL_INCLUDEDIR})
    install(DIRECTORY
      ${pybind11_SOURCE_DIR}/include/
      DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
      FILES_MATCHING PATTERN "*.h")
    install(TARGETS pybind11_headers
      EXPORT pybin11_EXPORTS)
  endif()
endif()
