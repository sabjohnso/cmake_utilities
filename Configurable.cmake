#
# Define configurable parameters
#
macro(configurable name envname default docstring)
  if(NOT ${name})
    if(ENV{${envname})
      set(${name}_SELECTION $ENV{$envname})
    else()
      set(${name}_SELECTION ${default})
    endif()
    set(${name} ${${name}_SELECTION} CACHE STRING ${docstring} FORCE)
  endif()
endmacro()
