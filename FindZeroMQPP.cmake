include(dependency)
include(show)

find_package(ZeroMQ REQUIRED)

git_resolvable_dependency(
  NAME ZeroMQPP
  GIT_REPOSITORY https://github.com/zeromq/zmqpp.git)

if(NOT ZeroMQPP_FOUND)

  include_directories(${ZEROMQ_INCLUDE})

  add_subdirectory(
    ${zeromqpp_SOURCE_DIR}
    ${zeromqpp_BINARY_DIR}
    ${zeromqpp_EXCLUDE_FROM_ALL})

  target_include_directories(zmqpp
    PRIVATE ${ZEROMQ_INCLUDE})

  target_include_directories(zmqpp-static
    PRIVATE ${ZEROMQ_INCLUDE})

  set(ZeroMQPP_FOUND)
endif()
