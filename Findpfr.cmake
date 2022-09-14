if(NOT pfr_FOUND)
  include(dependency)
  git_resolvable_dependency(NAME pfr GIT_REPOSITORY https://github.com/apolukhin/pfr_non_boost.git)
  if(NOT pfr_FOUND)
    add_subdirectory(${pfr_SOURCE_DIR} ${pfr_BINARY_DIR} ${pfr_EXCLUDE_FROM_ALL})
    include(GNUInstallDirs)

    set(pfr_INSTALL_BINDIR ${CMAKE_INSTALL_BINDIR})
    set(pfr_INSTALL_LIBDIR ${CMAKE_INSTALL_LIBDIR})
    set(pfr_INSTALL_INCLUDEDIR ${CMAKE_INSTALL_INCLUDEDIR})
    set(pfr_INSTALL_CONFDIR ${pfr_INSTALL_LIBDIR}/cmake/pfr-${PROJECT_VERSION})

    add_library(pfr_header INTERFACE)
    target_include_directories(pfr_header
      INTERFACE
      $<BUILD_INTERFACE:${pfr_SOURCE_DIR/include}>
      $<INSTALL_INTERFACE:${pfr_INSTALL_INCLUDEDIR}>)

    add_library(pfr::header ALIAS pfr_header)

    install(TARGETS pfr_header
      EXPORT pfr_EXPORTS
      RUNTIME DESTINATION ${pfr_INSTALL_BINDIR}
      LIBRARY DESTINATION ${pfr_INSTALL_LIBDIR}
      ARCHIVE DESTINATION ${pfr_INSTALL_LIBDIR})

    target_include_directories(pfr_header
      INTERFACE
      $<BUILD_INTERFACE:${pfr_SOURCE_DIR}/include>
      $<INSTALL_INTERFACE:${pfr_INSTALL_INCLUDEDIR}/include>)

     install(DIRECTORY ${pfr_SOURCE_DIR}/include
       DESTINATION ${pfr_INSTALL_INCLUDEDIR}/introspection
       FILES_MATCHING PATTERN "*.hpp")

     install(EXPORT pfr_EXPORTS
       NAMESPACE pfr::
       FILE pfr-exports.cmake
       DESTINATION ${pfr_INSTALL_CONFDIR})

     configure_file(${CMAKE_CURRENT_LIST_DIR}/pfr-config.cmake.in pfr-config.cmake)
     install(FILES ${PROJECT_BINARY_DIR}/pfr-config.cmake
       DESTINATION ${pfr_INSTALL_CONFDIR})
  endif()
endif()
