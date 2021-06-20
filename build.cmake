include(show)
function(build_make SOURCE_DIR BINARY_DIR)
  set(options AUTOGEN CONFIGURE)
  set(one_value_keywords MAKE_COMMAND)
  set(multivalue_keywords BUILD_ENV)
  cmake_parse_arguments(PKG "${options}" "${one_value_keywords}" "${multivalue_keywords}" ${ARGN})

  if(NOT PKG_BUILD_ENV)
    set(CFLAGS ${CMAKE_C_FLAGS})
    set(CXXFLAGS ${CMAKE_CXX_FLAGS})

    if(CMAKE_BUILD_TYPE STREQUAL Release)
      string(APPEND CFLAGS ${CMAKE_C_FLAGS_RELEASE})
      string(APPEND CXXFLAGS ${CMAKE_CXX_FLAGS_RELEASE})

    elseif(CMAKE_BUILD_TYPE STREQUAL Debug)
      string(APPEND CFLAGS ${CMAKE_C_FLAGS_DEBUG})
      string(APPEND CXXFLAGS ${CMAKE_CXX_FLAGS_DEBUG})

    elseif(CMAKE_BUILD_TYPE STREQUAL RelWithDebInfo)
      string(APPEND CFLAGS ${CMAKE_C_FLAGS_RELWITHDEBINFO})
      string(APPEND CXXFLAGS ${CMAKE_CXX_FLAGS_RELWITHDEBINFO})

    elseif(CMAKE_BUILD_TYPE STREQUAL MinSizeRel)
      string(APPEND CFLAGS ${CMAKE_C_FLAGS_MINSIZEREL})
      string(APPEND CXXFLAGS ${CMAKE_CXX_FLAGS_MINSIZEREL})

    endif()
    set(PKG_BUILD_ENV
      "CC=${CMAKE_C_COMPILER} CFLAGS=\"${CFLAGS}\" CXX=${CMAKE_CXX_COMPILER} CXXFLAGS=\"${CXXFLAGS}\"")
  endif()
  show(PKG_BUILD_ENV)
  show(PKG_MAKE_COMMAND)


  if(NOT PKG_MAKE_COMMAND)
    find_program(PKG_MAKE_COMMAND make)
  endif()

  if(NOT PKG_MAKE_FLAGS)
    set(PKG_MAKE_FLAGS -j)
  endif()

  if(PKG_AUTOGEN)
    execute_process(
    COMMAND env  ${SOURCE_DIR}/autogen.sh
    WORKING_DIRECTORY ${SOURCE_DIR})
  endif()

  if(PKG_CONFIGURE)
    execute_process(
    COMMAND env ${SOURCE_DIR}/configure --prefix=${BINARY_DIR}
    WORKING_DIRECTORY ${SOURCE_DIR})
  endif()

  execute_process(
    COMMAND env ${PKG_MAKE_COMMAND} ${PKG_MAKE_FLAGS}
    WORKING_DIRECTORY ${SOURCE_DIR})

  execute_process(
    COMMAND env ${PKG_MAKE_COMMAND} install PREFIX=${BINARY_DIR} ${PKG_MAKE_FLAGS}
    WORKING_DIRECTORY ${SOURCE_DIR})
endfunction()
