cmake_minimum_required(VERSION 3.13)

project(tlaplus_integration)
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../../..)

find_package(tlaplus REQUIRED)

enable_testing()

add_test(
  NAME tlaplus_sany_help
  COMMAND tlaplus::sany -help)

add_test(
  NAME tlaplus_tlc_help
  COMMAND tlaplus::tlc -h)

add_test(
  NAME tlaplus_pcal_help
  COMMAND tlaplus::pcal -help)

add_test(
  NAME tlaplus_parse_spec
  COMMAND tlaplus::sany ${CMAKE_CURRENT_SOURCE_DIR}/Counter.tla)
