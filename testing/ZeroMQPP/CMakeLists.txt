cmake_minimum_required(VERSION 3.12)
project(ZeroMQPPIntegration)

list(INSERT CMAKE_MODULE_PATH 0 ${PROJECT_SOURCE_DIR}/../..)
find_package(ZeroMQ REQUIRED)
find_package(ZeroMQPP REQUIRED)

add_executable(ZeroMQIntegration ZeroMQPPIntegration.cpp)
target_link_libraries(ZeroMQIntegration
  PRIVATE libzmq-static zmqpp-static)

set_target_properties(ZeroMQIntegration
  PROPERTIES CXX_STANDARD 20)
