include(FetchContent)

if(NOT DEFINED operators_REPOSITORY)
  if(ENV{OPERATORS_REPOSITORY})
    set(operators_REPOSITORY $ENV{OPERATORS_REPOSITORY} CACHE STRING
      "Repository for the operators library")
  else()
    set(operators_REPOSITORY https://github.com/sabjohnso/operators CACHE STRING
      "Repository for the operators library")
  endif()
endif()

if(NOT DEFINED operators_TAG)
  if(ENV{OPERATORS_TAG})
    set(operators_TAG $ENV{OPERATORS_TAG} CACHE STRING "Tag for the operators repository")
  else()
    set(operators_TAG master CACHE STRING "Tag for the operators repository")
  endif()
endif()

if(NOT DEFINED operators_FORCE_DOWNLOAD)
  if(ENV{OPERATORS_FORCE_DOWNLOAD})
    set(operators_FORCE_DOWNLOAD $ENV{OPERATORS_FORCE_DOWNLOAD} CACHE BOOL
      "Download and use the operators library even if it could be found")
  else()
    set(operators_FORCE_DOWNLOAD FALSE CACHE BOOL
      "Download and use the operators library even if it could be found")
  endif()
endif()

if(NOT DEFINED operators_EXCLUDE_FROM_ALL)
  if(ENV{OPERATORS_EXCLUDE_FROM_ALL})
    set(operators_EXCLUDE_FROM_ALL $ENV{OPERATORS_EXCLUDE_FROM_ALL} CACHE BOOL
      "Do not install the type utility library")
  else()
    set(operators_EXCLUDE_FROM_ALL FALSE CACHE BOOL
      "Do not install the type utility library")
  endif()
endif()

mark_as_advanced(FORCE
  operators_REPOSITORY
  operators_TAG
  operators_FORCE_DOWNLOAD
  operators_EXCLUDE_FROM_ALL)

if(NOT operators_FORCE_DOWNLOAD)
  find_package(operators CONFIG QUIET)
endif()


if(NOT operators_FOUND)
  FetchContent_Declare(operators
    GIT_REPOSITORY ${operators_REPOSITORY}
    GIT_TAG ${operators_TAG})
  FetchContent_GetProperties(operators)
  if(NOT operators_POPULATED)
    FetchContent_Populate(operators)
    if(operators_EXCLUDE_FROM_ALL)
      add_subdirectory(${operators_SOURCE_DIR} ${operators_BINARY_DIR} EXCLUDE_FROM_ALL)
    else()
      add_subdirectory(${operators_SOURCE_DIR} ${operators_BINARY_DIR})
    endif()
  endif()

endif()
