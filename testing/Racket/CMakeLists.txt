cmake_minimum_required(VERSION 3.22)
project(racket_integration)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../..)
find_package(Racket REQUIRED COMPONENTS racket raco)

message(STATUS "RACKET_FOUND: ${RACKET_FOUND}")
message(STATUS "${CMAKE_CURRENT_SOURCE_DIR}/my-script.rkt")
execute_process(
  COMMAND Racket::racket ${CMAKE_CURRENT_SOURCE_DIR}/my-script.rkt
  OUTPUT_VARIABLE SCRIPT_OUTPUT
  ERROR_VARIABLE SCRIPT_ERROR
  RESULT_VARIABLE SCRIPT_RESULT
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

message(STATUS "SCRIPT_OUTPUT ${SCRIPT_OUTPUT}")
message(STATUS "SCRIPT_ERROR ${SCRIPT_ERROR}")
message(STATUS "SCRIPT_RESULT ${SCRIPT_RESULT}")

if(SCRIPT_RESULT)
  message(FATAL_ERROR "Racket returned a nonzero result with error:\n${SCRIPT_ERROR}")
endif()


if(SCRIPT_OUTPUT STREQUAL "Hello, World!")
else()
    message(FATAL_ERROR "Racket did not execute the script correctly: ${SCRIPT_OUTPUT}")
endif()
