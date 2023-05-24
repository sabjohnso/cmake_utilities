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
    DEPENDS ${ARG_DEPENDS}
  )
  add_custom_target(${name}_target DEPENDS ${cache_file})
  add_test(
    NAME ${name}
    COMMAND ${CMAKE_COMMAND} --build .
    WORKING_DIRECTORY ${bindir}
  )

endfunction()

cmake_utilities_add_test(contextual ${PROJECT_DIR}/contextual.cmake)
cmake_utilities_add_test(cppzmq ${PROJECT_DIR}/cppzmq.cmake)
cmake_utilities_add_test(ctstring ${PROJECT_DIR}/ctstring.cmake)
cmake_utilities_add_test(easyj ${PROJECT_DIR}/easyj.cmake)
cmake_utilities_add_test(fmt ${PROJECT_DIR}/fmt.cmake)
cmake_utilities_add_test(gtest ${PROJECT_DIR}/gtest.cmake)
cmake_utilities_add_test(integer ${PROJECT_DIR}/integer.cmake)
cmake_utilities_add_test(introspection ${PROJECT_DIR}/introspection.cmake)
cmake_utilities_add_test(libzmq ${PROJECT_DIR}/libzmq.cmake)
cmake_utilities_add_test(lz4 ${PROJECT_DIR}/lz4.cmake)
cmake_utilities_add_test(nlohmann_json_schema_validator
  ${PROJECT_DIR}/nlohmann_json_schema_validator.cmake)
cmake_utilities_add_test(pfr ${PROJECT_DIR}/pfr.cmake)
cmake_utilities_add_test(pybind11 ${PROJECT_DIR}/pybind11.cmake)
cmake_utilities_add_test(rxcpp ${PROJECT_DIR}/rxcpp.cmake)
cmake_utilities_add_test(type_utility ${PROJECT_DIR}/type_utility.cmake)
cmake_utilities_add_test(xxhash ${PROJECT_DIR}/xxhash.cmake)
cmake_utilities_add_test(ZeroMQ ${PROJECT_DIR}/ZeroMQ.cmake)
cmake_utilities_add_test(ZeroMQPP ${PROJECT_DIR}/ZeroMQPP.cmake)
cmake_utilities_add_test(Racket ${PROJECT_DIR}/Racket.cmake)
cmake_utilities_add_test(GUnit DEPENDS ${PROJECT_DIR}/FindGUnit.cmake)
