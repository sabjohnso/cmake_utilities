cmake_minimum_required(VERSION 3.12)
project(libzmq_integration)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../..)
find_package(zmq REQUIRED)

add_executable(zmq_integration zmq_integration.cpp)
target_link_libraries(zmq_integration
  PRIVATE zmq::libzmq_STATIC)
