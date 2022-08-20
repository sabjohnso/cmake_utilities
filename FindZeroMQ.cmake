if(NOT TARGET ZeroMQ::libzmq)

  include(dependency)

  git_resolvable_dependency(
    NAME ZeroMQ
    GIT_REPOSITORY https://github.com/zeromq/libzmq.git
    GIT_TAG master)

  if(NOT ZeroMQ_FOUND)
    set(ZMQ_BUILD_TESTS OFF CACHE INTERNAL "")
    set(ZEROMQ_INCLUDE ${ZeroMQ_SOURCE_DIR}/include)
    set(ZEROMQ_LIBRARY_SHARED ${ZeroMQ_BINARY_DIR}/lib/libzmq.so)
    set(ZEROMQ_LIBRARY_STATIC ${ZeroMQ_BINARY_DIR}/lib/libzmq.a)
    add_subdirectory(
      ${zeromq_SOURCE_DIR}
      ${zeromq_BINARY_DIR}
      ${ZeroMQ_EXCLUDE_FROM_ALL})
    set(ZeroMQ_FOUND TRUE)

    add_library(ZeroMQ::libzmq ALIAS libzmq)
    add_library(ZeroMQ::libzmq-static ALIAS libzmq-static)

  endif()
endif()
