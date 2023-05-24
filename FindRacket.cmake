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

macro(_Racket_find_racket)
  # Find the racket executable
  find_program(
    RACKET_EXECUTABLE
    NAMES racket
  )
  mark_as_advanced(RACKET_EXECUTABLE)

  if(RACKET_EXECUTABLE)

    # Get the racket version
    execute_process(
      COMMAND "${RACKET_EXECUTABLE}" --version
      OUTPUT_VARIABLE RACKET_VERSION
      OUTPUT_STRIP_TRAILING_WHITESPACE
      RESULT_VARIABLE _racket_version_result
    )
    if(_racket_version_result)
      message(WARNING "Unable to determin racket version: ${_racket_version_result}")
    endif()

    # Create an imported target for Racket
    if(NOT TARGET Racket::racket)
      add_executable(Racket::racket IMPORTED GLOBAL)
      set_target_properties(Racket::racket PROPERTIES IMPORTED_LOCATION "${RACKET_EXECUTABLE}")
    endif()
  endif()
endmacro()

macro(_Racket_find_raco)
  find_program(RACO_EXECUTABLE NAMES raco)
  mark_as_advanced(RACO_EXECUTABLE)
  if(RACO_EXECUTABLE)
    if(NOT TARGET Racket::raco)
      add_executable(Racket::raco IMPORTED GLOBAL)
      set_target_properties(Racket::racket PROPERTIES IMPORTED_LOCATION "${RACO_EXECUTABLE}")
    endif()
  endif()
endmacro()

foreach(_comp IN LISTS Racket_FIND_COMPONENTS)
  if(_comp STREQUAL "racket")
  elseif(_comp STREQUAL "raco")
  else()
    message(FATAL_ERROR "${_comp} is not a valid Racket component")
  endif()

  if(TARGET Racket::${_comp})
    set(Racket_${_comp}_FOUND TRUE)
  else()
    set(Racket_${_comp}_FOUND FALSE)
  endif()
endforeach()
unset(_comp)

#
#  ... Verify find results
#
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
  Racket
  REQUIRED_VARS RACKET_EXECUTABLE
  VERSION_VAR RACKET_VERSION
  HANDLE_COMPONENTS
)
