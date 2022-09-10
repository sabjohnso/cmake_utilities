
find_program(XSD_EXE name xsdcxx)

include(XSDOptions)


function(XSD_TREE)
  cmake_parser_arguments(ARGS "${options}" "{one_value_args}" "${multivalue_args}" ${ARGN})
endfunction()
