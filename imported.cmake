
macro(set_package name)
  set(${name} ${ARGN})
endmacro()

function(add_imported_executable name)
  set(options)
  set(one_value_keywords IMPORTED_LOCATION)
  set(multivalue_keywords)
  cmake_parse_arguments(EXE "${options}" "${one_value_keywords}" "${multivalue_keywords}" ${ARGN})

  if(NOT EXE_IMPORTED_LOCATION)
    message(FATAL_ERROR "add_imported_executable called without required keyword IMPORTED_LOCATION")
  endif()

  if(NOT (EXISTS ${EXE_IMPORTED_LOCATION}))
    message(FATAL_ERROR "The imported location for executable ${name} does not exists (${EXE_IMPORTED_LOCATION})")
  endif()

  add_executable(${name} IMPORTED)
  set_target_properties(${name}
    PROPERTIES
    IMPORTED_LOCATION ${EXE_IMPORTED_LOCATION})

endfunction()

function(add_imported_library name)
  set(options SHARED STATIC)
  set(one_value_keywords IMPORTED_LOCATION)
  set(multivalue_keywords INCLUDE)

  cmake_parse_arguments(LIB "${options}" "${one_value_keywords}" "${multivalue_keywords}" ${ARGN})

  if(NOT LIB_IMPORTED_LOCATION)
    message(FATAL_ERROR "add_imported_library called without required keyword IMPORTED_LOCATION")
  endif()

  if(NOT LIB_INCLUDE)
     message(FATAL_ERROR "add_imported_library called without required keyword INCLUDE")
  endif()

  if(NOT LIB_SHARED AND NOT LIB_STATIC)
    message(FATAL_ERROR "add_imported_library is missing required option: STATIC|SHARED")
  elseif(LIB_SHARED AND LIB_STATIC)
    message(FATAL_ERROR "SHARED and STATIC are mutually exclusive options for add_imported_library")
  elseif(LIB_SHARED)
    set(linkage SHARED)
  elseif(LIB_STATIC)
    set(linkage STATIC)
  endif()

  if(NOT EXISTS ${LIB_IMPORTED_LOCATION})
    message(FATAL_ERROR "The imported location for library ${name} does not exists (${LIB_IMPORTED_LOCATION})")
  endif()

  add_library(${name} IMPORTED ${linkage})
  set_target_properties(${name}
    PROPERTIES
      IMPORTED_GLOBAL TRUE
      IMPORTED_LOCATION ${LIB_IMPORTED_LOCATION}
      INTERFACE_INCLUDE_DIRECTORIES ${LIB_INCLUDE})

endfunction()


function(add_imported_package)

  set(options)
  set(one_value_keywords NAMESPACE ROOT BINDIR LIBDIR INCLUDEDIR)
  set(multivalue_keywords EXECUTABLES SHARED_LIBRARIES STATIC_LIBRARIES)
  cmake_parse_arguments(PKG "${options}" "${one_value_keywords}" "${multivalue_keywords}" ${ARGN})

  foreach(EXE ${PKG_EXECUTABLES})
    add_imported_executable(${PKG_NAMESPACE}::${EXE}
      IMPORTED_LOCATION ${PKG_ROOT}/${PKG_BINDIR}/${EXE})
  endforeach()

  foreach(LIB ${PKG_SHARED_LIBRARIES})
    get_filename_component(LIB_NAME ${LIB} NAME_WE)
    add_imported_library(${PKG_NAMESPACE}::${LIB_NAME}_SHARED SHARED
      IMPORTED_LOCATION ${PKG_ROOT}/${PKG_LIBDIR}/${LIB}
      INCLUDE ${PKG_ROOT}/${PKG_INCLUDEDIR})
  endforeach()

  foreach(LIB ${PKG_STATIC_LIBRARIES})
    get_filename_component(LIB_NAME ${LIB} NAME_WE)
    add_imported_library(${PKG_NAMESPACE}::${LIB_NAME}_STATIC STATIC
      IMPORTED_LOCATION ${PKG_ROOT}/${PKG_LIBDIR}/${LIB}
      INCLUDE ${PKG_ROOT}/${PKG_INCLUDEDIR})
  endforeach()

endfunction()


macro(validate_package var)
  set(${var} TRUE)

  set(options)
  set(one_value_keywords NAMESPACE ROOT BINDIR LIBDIR INCLUDEDIR)
  set(multivalue_keywords EXECUTABLES SHARED_LIBRARIES STATIC_LIBRARIES)
  cmake_parse_arguments(PKG "${options}" "${one_value_keywords}" "${multivalue_keywords}" ${ARGN})

  foreach(EXE ${PKG_EXECUTABLES})
    if(NOT EXISTS ${PKG_ROOT}/${PKG_BINDIR}/${EXE})
      set(${var} FALSE)
    endif()
  endforeach()

  foreach(LIB ${PKG_SHARED_LIBRARIES})
    if(NOT EXISTS ${PKG_ROOT}/${PKG_LIBDIR}/${LIB})
      set(${var} FALSE)
    endif()
  endforeach()

  foreach(LIB ${PKG_STATIC_LIBRARIES})
    if(NOT EXISTS ${PKG_ROOT}/${PKG_LIBDIR}/${LIB})
      set(${var} FALSE)
    endif()
  endforeach()
endmacro()
