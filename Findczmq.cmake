if(NOT TARGET czmq::czmq)
  set_package(czmq_PACKAGE
    NAMESPACE czmq
    BINDIR bin
    LIBDIR lib
    INCLUDEDIR include
    EXECUTABLES zmakecert
    STATIC_LIBRARIES libczmq.a
    SHARED_LIBRARIES libczmq.so)


  find_path(czmq_INCLUDE_DIR czmq.h)

  if(czmq_INCLUDE_DIR)
  endif()

endif()
