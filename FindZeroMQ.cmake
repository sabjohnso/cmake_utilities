if(NOT TARGET ZeroMQ::libzmq)

  include(dependency)

  git_resolvable_dependency(
    NAME ZeroMQ
    GIT_REPOSITORY https://github.com/zeromq/libzmq.git
    GIT_TAG master)

  set(ZMQ_BUILD_TESTS OFF CACHE INTERNAL "")

  if(TARGET libzmq AND NOT TARGET ZeroMQ::libzmq)
    add_library(ZeroMQ::libzmq ALIAS libzmq)
  endif()

  if(TARGET libzmq-static AND NOT TARGET ZeroMQ::libzmq-static)
    add_library(ZeroMQ::libzmq-static ALIAS libzmq-static)
  endif()

endif()
