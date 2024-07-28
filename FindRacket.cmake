#[=====================================================================================[.rst:
FindRacket
----------

Racket is a high-level programming language that provides a wide range
of features, including garbage collection, dynamic typing, and a
powerful macro system. It is also known for its support for
functional programming, which allows developers to write programs
that are concise, modular, and easy to reason about. This module looks
for Racket and some of the tools available in its rich programming
ecosystem.

.. variable:: RACKET_FOUND

  True if the ``racket`` executable was found

.. variable:: RACKET_VERSION

  The version reported by ``racket --version``.

.. versionadded:: 0.1
This module defines ``IMPORTED`` targets for Racket and each component found.
These can be used as part of custom commands, etc.  The following
import targets are defined if their corresponding executable could be
found (the component import targets will only be defined if that
component was requested):

::

  Racket::library
  Racket::drracket
  Racket::gracket
  Racket::gracket-text
  Racket::mred
  Racket::mred-text
  Racket::mzc
  Racket::mzpp
  Racket::mzscheme
  Racket::mztext
  Racket::pdf-slatex
  Racket::plt-games
  Racket::plt-help
  Racket::plt-r5rs
  Racket::plt-r6rs
  Racket::plt-web-server
  Racket::racket
  Racket::raco
  Racket::scribble
  Racket::setup-plt
  Racket::slatex
  Racket::slideshow
  Racket::swindle

Functions
^^^^^^^^^

.. command:: racket_install_package

    .. versionadded:: 0.1

    This function installs a racket package.

    ::

      racket_install_package(packageName
        [packageIndex]
        [user_directory])

Install a package

.. command:: racket_add_executable(executableName sourceName)

.. command:: racket_add_library(libraryName sourceName)

#]=====================================================================================]



set(_racket_programs
  drracket
  gracket
  gracket-text
  mred
  mred-text
  mzc
  mzpp
  mzscheme
  mztext
  pdf-slatex
  plt-games
  plt-help
  plt-r5rs
  plt-r6rs
  plt-web-server
  racket
  raco
  scribble
  setup-plt
  slatex
  slideshow
  swindle)


set(_racket_components ${_racket_programs})

function(_racket_get_version var)
  execute_process(
    COMMAND ${RACKET_EXECUTABLE} -e "(version)"
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
    OUTPUT_VARIABLE _racket_version
    OUTPUT_STRIP_TRAILING_WHITESPACE
    COMMAND_ERROR_IS_FATAL ANY
  )
  set(${var} ${_racket_version} PARENT_SCOPE)
endfunction()

function(_racket_validate_components)
  foreach(comp IN LISTS Racket_FIND_COMPONENTS)
    list(FIND _racket_components ${comp} comp_index)
    if(${comp_index} STREQUAL -1)
      message(FATAL_ERROR "${comp} is not a valid component of Racket")
    endif()
  endforeach()
endfunction()

function(_racket_find_racket_programs)
  macro(find_racket_program program)
    string(TOUPPER ${program} program_upper)
    find_program(${program_upper}_EXECUTABLE NAMES ${program})
    set(${program_upper}_EXECUTABLE ${${program_upper}_EXECUTABLE} PARENT_SCOPE)
    add_executable(Racket::${program} IMPORTED GLOBAL)
    set_target_properties(Racket::${program} PROPERTIES IMPORTED_LOCATION "${${program_upper}_EXECUTABLE}")
  endmacro()

  foreach(program ${_racket_programs})
    find_racket_program(${program})
  endforeach()
endfunction()

function(_racket_find_components)
  foreach(comp IN LISTS Racket_FIND_COMPONENTS)
    if(TARGET Racket::${comp})
      set(Racket_${comp}_FOUND TRUE PARENT_SCOPE)
    endif()
  endforeach()
endfunction()

_racket_validate_components()
_racket_find_racket_programs()
_racket_find_components()

_racket_get_version(RACKET_VERSION)

get_filename_component(RACKET_BIN_DIR ${RACKET_EXECUTABLE} DIRECTORY)
get_filename_component(RACKET_ROOT ${RACKET_BIN_DIR} DIRECTORY CACHE)
set(Racket_ROOT ${RACKET_ROOT})


include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
  Racket
  REQUIRED_VARS RACKET_EXECUTABLE
  VERSION_VAR RACKET_VERSION
  HANDLE_COMPONENTS
)

function(_racket_debug_info)
  include(show)
  message(STATUS)
  message(STATUS "========( FindRacket.cmake debug )============")
  show(RACKET_ROOT)
  show(Racket_ROOT)
  show(_racket_programs)
  show(_racket_components)
  show(Racket_FIND_COMPONENTS)
  foreach(comp IN LISTS Racket_FIND_COMPONENTS)
    show(Racket_${comp}_FOUND)
  endforeach()
  message(STATUS)
endfunction()

if(_Racket_DEBUG_OUTPUT)
  _racket_debug_info()
endif()
