macro(show name)
  message(STATUS "${name}: ${${name}}")
endmacro()
