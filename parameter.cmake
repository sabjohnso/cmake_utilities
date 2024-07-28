
function(parameter)
  set(option_keywords ADVANCED)
  set(one_value_keywords NAME DEFAULT TYPE DOC)
  cmake_parse_arguments(PAR "${option_keywords}" "${one_value_keywords}" "" ${ARGN})

  if(NOT PAR_NAME)
    message(FATAL_ERROR "'parameter' is missing the required keyword NAME")
  endif()


  if(NOT PAR_TYPE)
    message(FATAL_ERROR "'parameter' is missing the required keyword TYPE")
  endif()

  if(NOT PAR_DOC)
    set(PAR_DOC "Undocumented")
  endif()

  message(STATUS "Adding parameter ${PAR_NAME}")
  message(STATUS "Default value ${PAR_DEFAULT}")
  message(STATUS "Configured value ${${PAR_NAME}}")

  if(NOT ${PAR_NAME})
    if(ENV:{${PAR_NAME}})
      set(${PAR_NAME} $ENV:{${PAR_NAME}} CACHE ${PAR_TYPE} ${PAR_DOC})
      message(STATUS "Setting parameter ${PAR_NAME} to $ENV:{${PAR_NAME}} from environment variable")
    else()
      set(${PAR_NAME} ${PAR_DEFAULT} CACHE ${PAR_TYPE} ${PAR_DOC})
      message(STATUS "Setting parameter ${PAR_NAME} to default value")
    endif()
  endif()
endfunction()
