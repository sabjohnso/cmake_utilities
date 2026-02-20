if(NOT lz4_FOUND)
  include(dependency)
  git_resolvable_dependency(
    NAME lz4
    GIT_REPOSITORY https://github.com/lz4/lz4.git
    GIT_TAG dev)

    set(lz4_BUILD_ENV CC=${CMAKE_C_COMPILER} CXX=${CMAKE_CXX_COMPILER})

    execute_process(
      COMMAND env ${lz4_BUILD_ENV} make -j
      WORKING_DIRECTORY ${lz4_SOURCE_DIR})

    execute_process(
      COMMAND env ${lz4_BUILD_ENV} make  PREFIX=${lz4_BINARY_DIR} install
      WORKING_DIRECTORY ${lz4_SOURCE_DIR})

    add_library(lz4::lz4_SHARED IMPORTED SHARED GLOBAL)
    set_target_properties(lz4::lz4_SHARED
      PROPERTIES
        IMPORTED_LOCATION ${lz4_BINARY_DIR}/lib/${CMAKE_SHARED_LIBRARY_PREFIX}lz4${CMAKE_SHARED_LIBRARY_SUFFIX}
        IMPORTED_GLOBAL TRUE
        INTERFACE_INCLUDE_DIRECTORIES ${lz4_BINARY_DIR}/include)

    add_library(lz4::lz4_STATIC IMPORTED STATIC GLOBAL)
    set_target_properties(lz4::lz4_STATIC
      PROPERTIES
        IMPORTED_LOCATION ${lz4_BINARY_DIR}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}lz4${CMAKE_STATIC_LIBRARY_SUFFIX}
        IMPORTED_GLOBAL TRUE
        INTERFACE_INCLUDE_DIRECTORIES ${lz4_BINARY_DIR}/include)

    add_executable(lz4::lz4 IMPORTED GLOBAL)
    set_target_properties(lz4::lz4
      PROPERTIES
        IMPORTED_LOCATION ${lz4_BINARY_DIR}/bin/lz4)

      if(NOT lz4_EXCLUDE_FROM_ALL)
        install(CODE "execute_process(COMMAND env ${lz4_BUILD_ENV} make PREFIX=${CMAKE_INSTALL_PREFIX} install -j  WORKING_DIRECTORY ${lz4_SOURCE_DIR})")

  endif()
endif()
