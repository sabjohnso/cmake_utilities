cmake_minimum_required(VERSION 3.12)
project(ZeroMQIntegration)

list(INSERT CMAKE_MODULE_PATH 0 ${PROJECT_SOURCE_DIR}/../..)
find_package(ZeroMQ REQUIRED)

add_executable(ZeroMQIntegration ZeroMQIntegration.cpp)
target_link_libraries(ZeroMQIntegration
  PRIVATE libzmq)
