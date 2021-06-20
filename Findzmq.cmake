include(dependency)
include(imported)
include(build)

set_package(zmq_PKG
  NAMESPACE zmq
  BINDIR bin
  LIBDIR lib
  INCLUDEDIR include
  EXECUTABLES curve_keygen
  STATIC_LIBRARIES libzmq.a
  SHARED_LIBRARIES libzmq.so)

if(NOT zmq_FORCE_DOWNLOAD)

  find_path(zmq_INCLUDE_DIRS zmq.h)

  if(zmq_INCLUDE_DIRS)

    get_filename_component(zmq_ROOT ${zmq_INCLUDE_DIRS} DIRECTORY)
    validate_package(zmq_VALID ROOT ${zmq_ROOT} ${zmq_PKG})

    if(zmq_VALID)
      add_imported_package(ROOT ${zmq_ROOT} ${zmq_PKG})
      set(zmq_FOUND TRUE)
    endif()

  endif()
endif()

if(NOT zmq_FOUND)

  git_resolvable_dependency(
    NAME zmq
    GIT_REPOSITORY https://github.com/zeromq/libzmq.git
    GIT_TAG master)
  if(NOT EXISTS ${zmq_BINARY_DIR}/bin)
    build_make(${zmq_SOURCE_DIR} ${zmq_BINARY_DIR} AUTOGEN CONFIGURE)
  endif()
  add_imported_package(ROOT ${zmq_BINARY_DIR} ${zmq_PKG})

endif()
