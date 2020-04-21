include(FetchContent)

if(NOT DEFINED list_processing_REPOSITORY)
  if(ENV{LIST_PROCESSING_REPOSITORY})
    set(list_processing_REPOSITORY $ENV{LIST_PROCESSING_REPOSITORY} CACHE STRING
      "Repository for the list_processing library")
  else()
    set(list_processing_REPOSITORY https://github.com/sabjohnso/list_processing CACHE STRING
      "Repository for the list_processing library")
  endif()
endif()

if(NOT DEFINED list_processing_TAG)
  if(ENV{LIST_PROCESSING_TAG})
    set(list_processing_TAG $ENV{LIST_PROCESSING_TAG} CACHE STRING "Tag for the list_processing repository")
  else()
    set(list_processing_TAG master CACHE STRING "Tag for the list_processing repository")
  endif()
endif()

if(NOT DEFINED list_processing_FORCE_DOWNLOAD)
  if(ENV{LIST_PROCESSING_FORCE_DOWNLOAD})
    set(list_processing_FORCE_DOWNLOAD $ENV{LIST_PROCESSING_FORCE_DOWNLOAD} CACHE BOOL
      "Download and use the list_processing library even if it could be found")
  else()
    set(list_processing_FORCE_DOWNLOAD FALSE CACHE BOOL
      "Download and use the list_processing library even if it could be found")
  endif()
endif()

if(NOT DEFINED list_processing_EXCLUDE_FROM_ALL)
  if(ENV{LIST_PROCESSING_EXCLUDE_FROM_ALL})
    set(list_processing_EXCLUDE_FROM_ALL $ENV{LIST_PROCESSING_EXCLUDE_FROM_ALL} CACHE BOOL
      "Do not install the list processing library")
  else()
    set(list_processing_EXCLUDE_FROM_ALL FALSE CACHE BOOL
      "Do not install the list processing library")
  endif()
endif()

mark_as_advanced(FORCE
  list_processing_REPOSITORY
  list_processing_TAG
  list_processing_FORCE_DOWNLOAD
  list_processing_EXCLUDE_FROM_ALL)

if(NOT list_processing_FORCE_DOWNLOAD)
  find_package(list_processing CONFIG QUIET)
endif()


if(NOT list_processing_FOUND)
  FetchContent_Declare(list_processing
    GIT_REPOSITORY ${list_processing_REPOSITORY}
    GIT_TAG ${list_processing_TAG})
  FetchContent_GetProperties(list_processing)
  if(NOT list_processing_POPULATED)
    FetchContent_Populate(list_processing)
    if(list_processing_EXCLUDE_FROM_ALL)
      add_subdirectory(${list_processing_SOURCE_DIR} ${list_processing_BINARY_DIR} EXCLUDE_FROM_ALL)
    else()
      add_subdirectory(${list_processing_SOURCE_DIR} ${list_processing_BINARY_DIR})
    endif()
  endif()

endif()
