cmake_minimum_required(VERSION 3.13)

if(NOT TEST_SOURCE_DIR)
  message(FATAL_ERROR "TEST_SOURCE_DIR is not defined")
endif()

if(NOT TEST_BINARY_DIR)
  message(FATAL_ERROR "TEST_BINARY_DIR is not defined")
endif()

if(NOT TEST_MAKE_COMMAND)
  message(FATAL_ERROR "TEST_MAKE_COMMAND is not defined")
endif()


if(NOT EXISTS ${TEST_BINARY_DIR}/CMakeCache.txt)
  execute_process(
    COMMAND ${CMAKE_COMMAND} -E make_directory ${TEST_BINARY_DIR})
  execute_process(
    COMMAND ${CMAKE_COMMAND} ${TEST_SOURCE_DIR}
    WORKING_DIRECTORY ${TEST_BINARY_DIR}
    COMMAND_ERROR_IS_FATAL ANY)
endif()

execute_process(
  COMMAND ${TEST_MAKE_COMMAND}
  WORKING_DIRECTORY ${TEST_BINARY_DIR}
  COMMAND_ERROR_IS_FATAL ANY
)
