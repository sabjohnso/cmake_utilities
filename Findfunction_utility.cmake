include(FetchContent)

if(NOT DEFINED function_utility_REPOSITORY)
  if(ENV{FUNCTION_UTILITY_REPOSITORY})
    set(function_utility_REPOSITORY $ENV{FUNCTION_UTILITY_REPOSITORY} CACHE STRING
      "Repository for the function_utility library")
  else()
    set(function_utility_REPOSITORY https://github.com/sabjohnso/function_utility CACHE STRING
      "Repository for the function_utility library")
  endif()
endif()

if(NOT DEFINED function_utility_TAG)
  if(ENV{FUNCTION_UTILITY_TAG})
    set(function_utility_TAG $ENV{FUNCTION_UTILITY_TAG} CACHE STRING "Tag for the function_utility repository")
  else()
    set(function_utility_TAG master CACHE STRING "Tag for the function_utility repository")
  endif()
endif()

if(NOT DEFINED function_utility_FORCE_DOWNLOAD)
  if(ENV{FUNCTION_UTILITY_FORCE_DOWNLOAD})
    set(function_utility_FORCE_DOWNLOAD $ENV{FUNCTION_UTILITY_FORCE_DOWNLOAD} CACHE BOOL
      "Download and use the function_utility library even if it could be found")
  else()
    set(function_utility_FORCE_DOWNLOAD FALSE CACHE BOOL
      "Download and use the function_utility library even if it could be found")
  endif()
endif()

if(NOT DEFINED function_utility_EXCLUDE_FROM_ALL)
  if(ENV{FUNCTION_UTILITY_EXCLUDE_FROM_ALL})
    set(function_utility_EXCLUDE_FROM_ALL $ENV{FUNCTION_UTILITY_EXCLUDE_FROM_ALL} CACHE BOOL
      "Do not install the type utility library")
  else()
    set(function_utility_EXCLUDE_FROM_ALL FALSE CACHE BOOL
      "Do not install the type utility library")
  endif()
endif()

mark_as_advanced(FORCE
  function_utility_REPOSITORY
  function_utility_TAG
  function_utility_FORCE_DOWNLOAD
  function_utility_EXCLUDE_FROM_ALL)

if(NOT function_utility_FORCE_DOWNLOAD)
  find_package(function_utility CONFIG QUIET)
endif()


if(NOT function_utility_FOUND)
  FetchContent_Declare(function_utility
    GIT_REPOSITORY ${function_utility_REPOSITORY}
    GIT_TAG ${function_utility_TAG})
  FetchContent_GetProperties(function_utility)
  if(NOT function_utility_POPULATED)
    FetchContent_Populate(function_utility)
    if(function_utility_EXCLUDE_FROM_ALL)
      add_subdirectory(${function_utility_SOURCE_DIR} ${function_utility_BINARY_DIR} EXCLUDE_FROM_ALL)
    else()
      add_subdirectory(${function_utility_SOURCE_DIR} ${function_utility_BINARY_DIR})
    endif()
  endif()

endif()
