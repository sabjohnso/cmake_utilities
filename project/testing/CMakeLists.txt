message(STATUS "CMAKE_MAKE_COMMAND: ${CMAKE_MAKE_COMMAND}")

get_filename_component(CMAKE_UTILITIES_ROOT
  "${CMAKE_CURRENT_SOURCE_DIR}/../.." ABSOLUTE)

set(SHARED_CMAKE_MODULES
  ${CMAKE_UTILITIES_ROOT}/dependency.cmake
  ${CMAKE_UTILITIES_ROOT}/parameter.cmake
  ${CMAKE_UTILITIES_ROOT}/show.cmake
  ${CMAKE_UTILITIES_ROOT}/imported.cmake
  ${CMAKE_UTILITIES_ROOT}/build.cmake
  ${CMAKE_UTILITIES_ROOT}/Configurable.cmake
)

function(cmake_utilities_add_test name)

  set(boolean_keywords)
  set(single_value_keywords)
  set(multivalue_keywords DEPENDS SOURCES LABELS)

  cmake_parse_arguments(ARGS
    "${boolean_keywords}"
    "${single_value_keywords}"
    "${multivalue_keywords}"
    ${ARGN}
  )

  set(source_dir ${CMAKE_CURRENT_SOURCE_DIR}/${name})
  set(binary_dir ${CMAKE_CURRENT_BINARY_DIR}/${name})
  set(stamp_file ${binary_dir}/.build.stamp)

  # Auto-discover test source files if none explicitly provided
  if(ARGS_SOURCES)
    set(test_sources ${ARGS_SOURCES})
  else()
    file(GLOB test_sources
      ${source_dir}/*.cpp
      ${source_dir}/*.c
      ${source_dir}/*.h
      ${source_dir}/*.hpp
    )
  endif()

  set(all_depends
    ${source_dir}/CMakeLists.txt
    ${SHARED_CMAKE_MODULES}
    ${ARGS_DEPENDS}
    ${test_sources}
  )

  add_custom_command(
    OUTPUT ${stamp_file}
    COMMAND ${CMAKE_COMMAND} -B ${binary_dir} -S ${source_dir}
    COMMAND ${CMAKE_COMMAND} --build ${binary_dir}
    COMMAND ${CMAKE_COMMAND} -E touch ${stamp_file}
    DEPENDS ${all_depends}
    COMMENT "Building test: ${name}"
  )

  add_custom_target(${name}_target DEPENDS ${stamp_file})

  add_test(
    NAME ${name}
    COMMAND ${CMAKE_COMMAND} --build . --target ${name}_target
    WORKING_DIRECTORY ${PROJECT_BINARY_DIR}
  )

  # Assign labels for selective test execution
  set(test_labels ${ARGS_LABELS})
  if(test_labels)
    set_tests_properties(${name} PROPERTIES LABELS "${test_labels}")
  endif()

  # Per-test clean target
  add_custom_target(${name}_clean
    COMMAND ${CMAKE_COMMAND} -E rm -rf ${binary_dir}
    COMMENT "Cleaning test: ${name}"
  )

endfunction()

cmake_utilities_add_test(contextual
  DEPENDS ${CMAKE_UTILITIES_ROOT}/Findcontextual.cmake)

cmake_utilities_add_test(cppzmq
  DEPENDS ${CMAKE_UTILITIES_ROOT}/Findcppzmq.cmake
          ${CMAKE_UTILITIES_ROOT}/FindZeroMQ.cmake
  LABELS zmq)

cmake_utilities_add_test(ctstring
  DEPENDS ${CMAKE_UTILITIES_ROOT}/Findctstring.cmake)

cmake_utilities_add_test(easyj
  DEPENDS ${CMAKE_UTILITIES_ROOT}/Findeasyj.cmake)

cmake_utilities_add_test(fmt
  DEPENDS ${CMAKE_UTILITIES_ROOT}/Findfmt.cmake)

cmake_utilities_add_test(gtest
  DEPENDS ${CMAKE_UTILITIES_ROOT}/FindGTest.cmake)

cmake_utilities_add_test(highfive
  DEPENDS ${CMAKE_UTILITIES_ROOT}/FindHighFive.cmake)

# cmake_utilities_add_test(integer
#   DEPENDS ${CMAKE_UTILITIES_ROOT}/Findinteger.cmake)

cmake_utilities_add_test(introspection
  DEPENDS ${CMAKE_UTILITIES_ROOT}/Findintrospection.cmake)

# cmake_utilities_add_test(libzmq
#   DEPENDS ${CMAKE_UTILITIES_ROOT}/FindZeroMQ.cmake
#   LABELS zmq)

cmake_utilities_add_test(lz4
  DEPENDS ${CMAKE_UTILITIES_ROOT}/Findlz4.cmake)

cmake_utilities_add_test(nlohmann_json_schema_validator
  DEPENDS ${CMAKE_UTILITIES_ROOT}/Findnlohmann_json_schema_validator.cmake
          ${CMAKE_UTILITIES_ROOT}/Findnlohmann_json.cmake)

cmake_utilities_add_test(pfr
  DEPENDS ${CMAKE_UTILITIES_ROOT}/Findpfr.cmake)

cmake_utilities_add_test(pybind11
  DEPENDS ${CMAKE_UTILITIES_ROOT}/Findpybind11.cmake)

# cmake_utilities_add_test(rxcpp
#   DEPENDS ${CMAKE_UTILITIES_ROOT}/Findrxcpp.cmake)

cmake_utilities_add_test(type_utility
  DEPENDS ${CMAKE_UTILITIES_ROOT}/Findtype_utility.cmake)

cmake_utilities_add_test(xxhash
  DEPENDS ${CMAKE_UTILITIES_ROOT}/Findxxhash.cmake)

cmake_utilities_add_test(ZeroMQ
  DEPENDS ${CMAKE_UTILITIES_ROOT}/FindZeroMQ.cmake
  LABELS zmq)

cmake_utilities_add_test(ZeroMQPP
  DEPENDS ${CMAKE_UTILITIES_ROOT}/FindZeroMQPP.cmake
          ${CMAKE_UTILITIES_ROOT}/FindZeroMQ.cmake
  LABELS zmq)

cmake_utilities_add_test(Racket
  DEPENDS ${CMAKE_UTILITIES_ROOT}/FindRacket.cmake)

cmake_utilities_add_test(GUnit
  DEPENDS ${CMAKE_UTILITIES_ROOT}/FindGUnit.cmake)

cmake_utilities_add_test(unwind
  DEPENDS ${CMAKE_UTILITIES_ROOT}/Findunwind.cmake)

cmake_utilities_add_test(json-commander
  DEPENDS ${CMAKE_UTILITIES_ROOT}/Findjson-commander.cmake
          ${CMAKE_UTILITIES_ROOT}/Findnlohmann_json.cmake
          ${CMAKE_UTILITIES_ROOT}/Findnlohmann_json_schema_validator.cmake)

cmake_utilities_add_test(Expat
  DEPENDS ${CMAKE_UTILITIES_ROOT}/FindExpat.cmake)

cmake_utilities_add_test(CURL
  DEPENDS ${CMAKE_UTILITIES_ROOT}/FindCURL.cmake)

cmake_utilities_add_test(xb
  DEPENDS ${CMAKE_UTILITIES_ROOT}/Findxb.cmake)

# Global target to clean all tests
set(all_test_names
  contextual cppzmq ctstring easyj fmt gtest highfive
  introspection lz4 nlohmann_json_schema_validator pfr pybind11
  type_utility xxhash ZeroMQ ZeroMQPP Racket GUnit unwind
  json-commander Expat CURL xb)

set(all_clean_targets)
foreach(test_name IN LISTS all_test_names)
  list(APPEND all_clean_targets ${test_name}_clean)
endforeach()

add_custom_target(clean_all_tests DEPENDS ${all_clean_targets})
