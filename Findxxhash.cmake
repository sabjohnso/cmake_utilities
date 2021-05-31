if(NOT xxhash_FOUND)
  include(dependency)

  git_resolvable_dependency(
    NAME xxhash
    GIT_REPOSITORY https://github.com/Cyan4973/xxHash.git
    GIT_TAG dev)

  if(NOT xxhash_FOUND)

    set(xxhash_BUILD_ENV CC=${CMAKE_C_COMPILER} CXX=${CMAKE_CXX_COMPILER})

    execute_process(
      COMMAND env ${xxhash_BUILD_ENV} make -j
      WORKING_DIRECTORY ${xxhash_SOURCE_DIR})

    execute_process(
      COMMAND env ${xxhash_BUILD_ENV} make  PREFIX=${xxhash_BINARY_DIR} install
      WORKING_DIRECTORY ${xxhash_SOURCE_DIR})

    add_library(xxhash::xxhash_SHARED IMPORTED SHARED)
    set_target_properties(xxhash::xxhash_SHARED
      PROPERTIES
        IMPORTED_LOCATION ${xxhash_BINARY_DIR}/lib/libxxhash.so
        IMPORTED_GLOBAL TRUE
        INTERFACE_INCLUDE_DIRECTORIES ${xxhash_BINARY_DIR}/include)

    add_library(xxhash::xxhash_STATIC IMPORTED STATIC)
    set_target_properties(xxhash::xxhash_STATIC
      PROPERTIES
        IMPORTED_LOCATION ${xxhash_BINARY_DIR}/lib/libxxhash.a
        IMPORTED_GLOBAL TRUE
        INTERFACE_INCLUDE_DIRECTORIES ${xxhash_BINARY_DIR}/include)

    add_executable(xxhash::xxhsum IMPORTED)
    set_target_properties(xxhash::xxhsum
      PROPERTIES
        IMPORTED_LOCATION ${xxhash_BINARY_DIR}/bin/xxhsum)

    if(NOT xxhash_EXCLUDE_FROM_ALL)
      install(CODE "execute_process(COMMAND env ${xxhash_BUILD_END} make PREFIX=${CMAKE_INSTALL_PREFIX} install -j  WORKING_DIRECTORY ${xxhash_SOURCE_DIR})")
    endif()

  endif()
endif()
