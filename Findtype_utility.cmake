include(FetchContent)

if(NOT DEFINED type_utility_REPOSITORY)
  if(ENV{TYPE_UTILITY_REPOSITORY})
    set(type_utility_REPOSITORY $ENV{TYPE_UTILITY_REPOSITORY} CACHE STRING
      "Repository for the type_utility library")
  else()
    set(type_utility_REPOSITORY https://github.com/sabjohnso/type_utility CACHE STRING
      "Repository for the type_utility library")
  endif()
endif()

if(NOT DEFINED type_utility_TAG)
  if(ENV{TYPE_UTILITY_TAG})
    set(type_utility_TAG $ENV{TYPE_UTILITY_TAG} CACHE STRING "Tag for the type_utility repository")
  else()
    set(type_utility_TAG master CACHE STRING "Tag for the type_utility repository")
  endif()
endif()

if(NOT DEFINED type_utility_FORCE_DOWNLOAD)
  if(ENV{TYPE_UTILITY_FORCE_DOWNLOAD})
    set(type_utility_FORCE_DOWNLOAD $ENV{TYPE_UTILITY_FORCE_DOWNLOAD} CACHE BOOL
      "Download and use the type_utility library even if it could be found")
  else()
    set(type_utility_FORCE_DOWNLOAD FALSE CACHE BOOL
      "Download and use the type_utility library even if it could be found")
  endif()
endif()

if(NOT DEFINED type_utility_EXCLUDE_FROM_ALL)
  if(ENV{TYPE_UTILITY_EXCLUDE_FROM_ALL})
    set(type_utility_EXCLUDE_FROM_ALL $ENV{TYPE_UTILITY_EXCLUDE_FROM_ALL} CACHE BOOL
      "Do not install the type utility library")
  else()
    set(type_utility_EXCLUDE_FROM_ALL FALSE CACHE BOOL
      "Do not install the type utility library")
  endif()
endif()

mark_as_advanced(FORCE
  type_utility_REPOSITORY
  type_utility_TAG
  type_utility_FORCE_DOWNLOAD
  type_utility_EXCLUDE_FROM_ALL)

if(NOT type_utility_FORCE_DOWNLOAD)
  find_package(type_utility CONFIG QUIET)
endif()


if(NOT type_utility_FOUND)
  FetchContent_Declare(type_utility
    GIT_REPOSITORY ${type_utility_REPOSITORY}
    GIT_TAG ${type_utility_TAG})
  FetchContent_GetProperties(type_utility)
  if(NOT type_utility_POPULATED)
    FetchContent_Populate(type_utility)
    if(type_utility_EXCLUDE_FROM_ALL)
      add_subdirectory(${type_utility_SOURCE_DIR} ${type_utility_BINARY_DIR} EXCLUDE_FROM_ALL)
    else()
      add_subdirectory(${type_utility_SOURCE_DIR} ${type_utility_BINARY_DIR})
    endif()
  endif()
endif()
