message(STATUS "CMAKE_MAKE_COMMAND: ${CMAKE_MAKE_COMMAND}")
macro(cmake_utilities_add_test name)
  add_test(
    NAME ${name}
    COMMAND ${CMAKE_COMMAND}
    -DTEST_SOURCE_DIR=${CMAKE_CURRENT_SOURCE_DIR}/${name}
    -DTEST_BINARY_DIR=${CMAKE_CURRENT_BINARY_DIR}/${name}
    -DTEST_MAKE_COMMAND=${CMAKE_MAKE_PROGRAM}
    -P ${CMAKE_CURRENT_SOURCE_DIR}/run_test.cmake
  )
endmacro()

cmake_utilities_add_test(contextual)
cmake_utilities_add_test(cppzmq)
cmake_utilities_add_test(ctstring)
cmake_utilities_add_test(easyj)
cmake_utilities_add_test(fmt)
cmake_utilities_add_test(gtest)
cmake_utilities_add_test(integer)
cmake_utilities_add_test(introspection)
cmake_utilities_add_test(libzmq)
cmake_utilities_add_test(lz4)
cmake_utilities_add_test(nlohmann_json_schema_validator)
cmake_utilities_add_test(pfr)
cmake_utilities_add_test(pybind11)
cmake_utilities_add_test(rxcpp)
cmake_utilities_add_test(type_utility)
cmake_utilities_add_test(xxhash)
cmake_utilities_add_test(ZeroMQ)
cmake_utilities_add_test(ZeroMQPP)
