include(dependency)
include(show)

find_package(zmq REQUIRED)

git_resolvable_dependency(
  NAME cppzmq
  GIT_REPOSITORY https://github.com/zeromq/cppzmq.git)

if(NOT cppzmq_FOUND)

  add_library(cppzmq_header INTERFACE)

  show(cppzmq_SOURCE_DIR)
  target_link_libraries(cppzmq_header
    INTERFACE
    zmq::libzmq_STATIC)
  target_include_directories(cppzmq_header
    INTERFACE
    $<BUILD_INTERFACE:${cppzmq_SOURCE_DIR}>)



  add_library(cppzmq::header ALIAS cppzmq_header)

  set(cppzmq_FOUND TRUE)
endif()
