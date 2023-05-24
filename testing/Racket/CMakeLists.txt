cmake_minimum_required(VERSION 3.22)
project(racket_integration)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../..)
find_package(Racket REQUIRED COMPONENTS racket raco)

message(STATUS "RACKET_FOUND: ${RACKET_FOUND}")
message(STATUS "${CMAKE_CURRENT_SOURCE_DIR}/my-script.rkt")
configure_file(my-script.rkt.in my-script.rkt COPYONLY)

if(NOT TARGET Racket::racket)
  message(FATAL_ERROR "Racket::racket is not a target")
endif()


add_custom_command(
  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/output.txt
  COMMAND Racket::racket ${CMAKE_CURRENT_BINARY_DIR}/my-script.rkt > output.txt
  WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
)
add_custom_target(run_racket ALL DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/output.txt)
