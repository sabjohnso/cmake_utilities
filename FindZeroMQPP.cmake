if(NOT ZeroMQPP_FOUND)
  include(dependency)

  find_package(ZeroMQ REQUIRED)

  git_resolvable_dependency(
    NAME ZeroMQPP
    GIT_REPOSITORY https://github.com/zeromq/zmqpp.git)

  if(TARGET zmqpp AND DEFINED ZEROMQ_INCLUDE)
    target_include_directories(zmqpp
      PRIVATE ${ZEROMQ_INCLUDE})
  endif()

  if(TARGET zmqpp-static AND DEFINED ZEROMQ_INCLUDE)
    target_include_directories(zmqpp-static
      PRIVATE ${ZEROMQ_INCLUDE})
  endif()
endif()
