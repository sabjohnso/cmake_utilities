if(NOT unwind_FOUND)
  find_library(unwind_LIBRARY NAMES unwind)
  find_path(unwind_INCLUDE_DIR NAMES libunwind.h)

  if(unwind_LIBRARY AND unwind_INCLUDE_DIR)
    set(unwind_FOUND TRUE)

    if(NOT TARGET unwind::unwind)
      add_library(unwind_unwind SHARED IMPORTED GLOBAL)
      set_target_properties(unwind_unwind PROPERTIES
        IMPORTED_LOCATION ${unwind_LIBRARY}
        INTERFACE_INCLUDE_DIRECTORIES ${unwind_INCLUDE_DIR})
      add_library(unwind::unwind ALIAS unwind_unwind)
    endif()
  else()
    message(FATAL_ERROR "libunwind not found. Install libunwind-dev.")
  endif()
endif()
