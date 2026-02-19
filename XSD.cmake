
find_program(XSD_EXE NAMES xsdcxx)

include(XSDOptions)


function(XSD_TREE)
  cmake_parse_arguments(ARGS "${options}" "${one_value_args}" "${multivalue_args}" ${ARGN})
endfunction()
