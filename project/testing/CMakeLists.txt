message(STATUS "CMAKE_MAKE_COMMAND: ${CMAKE_MAKE_COMMAND}")

function(cmake_utilities_add_test name)

  set(boolean_keywords)
  set(single_value_keywords)
  set(multivalue_keywords DEPENDS)

  cmake_parse_arguments(ARGS
    "${boolean_keywords}"
    "${single_value_keywords}"
    "${multivalue_keywords}"
  )

  set(source_dir ${CMAKE_CURRENT_SOURCE_DIR}/${name})
  set(binary_dir ${CMAKE_CURRENT_BINARY_DIR}/${name})
  set(cache_file ${binary_dir}/CMakeCache.txt)

  add_custom_command(
    OUTPUT ${cache_file}
    COMMAND ${CMAKE_COMMAND} -E rm -f ${cache_file}
    COMMAND ${CMAKE_COMMAND} -B ${binary_dir} -S ${source_dir}
    COMMAND ${CMAKE_COMMAND} --build ${binary_dir}
    DEPENDS ${ARG_DEPENDS} ${source_dir}/CMakeLists.txt
  )
  add_custom_target(${name}_target DEPENDS ${cache_file})
  add_test(
    NAME ${name}
    COMMAND ${CMAKE_COMMAND}  --build . --target ${name}_target
    WORKING_DIRECTORY ${PROJECT_BINARY_DIR}
  )

endfunction()

cmake_utilities_add_test(contextual DEPENDS ${PROJECT_DIR}/contextual.cmake)
cmake_utilities_add_test(cppzmq DEPENDS ${PROJECT_DIR}/cppzmq.cmake)
cmake_utilities_add_test(ctstring DEPENDS ${PROJECT_DIR}/ctstring.cmake)
cmake_utilities_add_test(easyj DEPENDS ${PROJECT_DIR}/easyj.cmake)
cmake_utilities_add_test(fmt DEPENDS ${PROJECT_DIR}/fmt.cmake)
cmake_utilities_add_test(gtest DEPENDS ${PROJECT_DIR}/gtest.cmake)
cmake_utilities_add_test(highfive DEPENDS ${PROJECT_DIR}/FindHighFive.cmake)
# cmake_utilities_add_test(integer DEPENDS ${PROJECT_DIR}/integer.cmake)
cmake_utilities_add_test(introspection DEPENDS ${PROJECT_DIR}/introspection.cmake)
# cmake_utilities_add_test(libzmq DEPENDS ${PROJECT_DIR}/libzmq.cmake)
cmake_utilities_add_test(lz4 DEPENDS ${PROJECT_DIR}/lz4.cmake)
cmake_utilities_add_test(nlohmann_json_schema_validator
  DEPENDS ${PROJECT_DIR}/nlohmann_json_schema_validator.cmake)
cmake_utilities_add_test(pfr DEPENDS ${PROJECT_DIR}/pfr.cmake)
cmake_utilities_add_test(pybind11 DEPENDS ${PROJECT_DIR}/pybind11.cmake)
cmake_utilities_add_test(rxcpp DEPENDS ${PROJECT_DIR}/rxcpp.cmake)
cmake_utilities_add_test(type_utility DEPENDS ${PROJECT_DIR}/type_utility.cmake)
cmake_utilities_add_test(xxhash DEPENDS ${PROJECT_DIR}/xxhash.cmake)
cmake_utilities_add_test(ZeroMQ DEPENDS ${PROJECT_DIR}/ZeroMQ.cmake)
cmake_utilities_add_test(ZeroMQPP DEPENDS ${PROJECT_DIR}/ZeroMQPP.cmake)
cmake_utilities_add_test(Racket DEPENDS ${PROJECT_DIR}/Racket.cmake)
cmake_utilities_add_test(GUnit DEPENDS ${PROJECT_DIR}/FindGUnit.cmake)
cmake_utilities_add_test(unwind DEPENDS ${PROJECT_DIR}/unwind.cmake)
