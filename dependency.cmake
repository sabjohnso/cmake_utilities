include(parameter)
include(FetchContent)
include(show)

macro(git_resolvable_dependency)
  set(one_value_keywords NAME GIT_REPOSITORY GIT_TAG)
  cmake_parse_arguments(DEP "" ${one_value_keywords} "" ${ARGN})

  if(NOT DEP_NAME)
    message(FATAL_ERROR "git_resolvable_dependency is missing required keyword NAME")
  endif()

  if(NOT DEP_GIT_REPOSITORY)
    message(FATAL_ERROR "git_resolvable_dependency is missing required keyword GIT_REPOSITORY")
  endif()
  show(DEP_NAME)
  show(DEP_GIT_REPOSITORY)
  show(DEP_GIT_TAG)

  parameter(
    NAME ${DEP_NAME}_GIT_REPOSITORY
    DEFAULT ${DEP_GIT_REPOSITORY}
    TYPE "STRING"
    DOC "Repository URL for ${DEP_NAME}")

  parameter(
    NAME ${DEP_NAME}_GIT_TAG
    DEFAULT "${DEP_GIT_TAG}"
    TYPE "STRING"
    DOC "git tag for ${DEP_NAME}")

  if(NOT ${DEP_NAME}_FORCE_DOWNLOAD)
    message(STATUS "Searching for installed ${DEP_NAME}")
    find_package(${DEP_NAME} CONFIG QUIET)
  else()
    message(STATUS "Forcing download of ${DEP_NAME}")
  endif()

  if(NOT ${DEP_NAME}_FOUND)
    message(STATUS "DEP_NAME: ${DEP_NAME}")
    message(STATUS "${DEP_NAME}_GIT_REPOSITORY: ${${DEP_NAME}_GIT_REPOSITORY}")
    message(STATUS "${DEP_NAME}_GIT_TAG: ${${DEP_NAME}_GIT_TAG}")

    FetchContent_Declare(${DEP_NAME}
      EXCLUDE_FROM_ALL
      SYSTEM
      GIT_REPOSITORY ${${DEP_NAME}_GIT_REPOSITORY}
      GIT_TAG "${${DEP_NAME}_GIT_TAG}")
    if(NOT ${DEP_NAME}_POPULATED)
      FetchContent_MakeAvailable(${DEP_NAME})
    endif()
  endif()
endmacro()
