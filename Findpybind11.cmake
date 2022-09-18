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

    set(pybind11_INSTALL_BINDIR ${CMAKE_INSTALL_BINDIR})
    set(pybind11_INSTALL_LIBDIR ${CMAKE_INSTALL_LIBDIR})
    set(pybind11_INSTALL_INCLUDEDIR ${CMAKE_INSTALL_INCLUDEDIR})
    set(pybind11_INSTALL_CONFDIR ${pybind11_INSTALL_LIBDIR}/cmake/pybind11-${PROJECT_VERSION})

    install(DIRECTORY
      ${pybind11_SOURCE_DIR}/include/
      DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
      FILES_MATCHING PATTERN "*.h")

    target_link_libraries(pybind11_headers
      INTERFACE
      $<INSTALL_INTERFACE:${pfr_INSTALL_INCLUDEDIR})

    install(TARGETS pybind11_headers
      EXPORT pybin11_EXPORTS)

     configure_file(${CMAKE_CURRENT_LIST_DIR}/pybind11-config.cmake.in pybind11-config.cmake)
     install(FILES ${PROJECT_BINARY_DIR}/pybind11-config.cmake
       DESTINATION ${pybind11_INSTALL_CONFDIR})

  endif()
endif()
