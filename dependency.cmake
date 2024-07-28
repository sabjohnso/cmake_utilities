include(parameter)
include(FetchContent)

macro(git_resolvable_dependency)
  set(one_value_keywords NAME GIT_REPOSITORY GIT_TAG)
  cmake_parse_arguments(DEP "" ${one_value_keywords} "" ${ARGN})

  if(NOT DEP_NAME)
    message(FATAL_ERROR "git_resolvable_dependency is missing required keyword NAME")
  endif()

  if(NOT DEP_GIT_REPOSITORY)
    message(FATAL_ERROR "git_resolvable_dependency is missing required keyword GIT_REPOSITORY")
  endif()

  parameter(
    NAME ${DEP_NAME}_GIT_REPOSITORY
    DEFAULT ${DEP_GIT_REPOSITORY}
    TYPE "STRING"
    DOC "Repository URL for ${DEP_NAME}")

  parameter(
    NAME ${DEP_NAME}_GIT_TAG
    DEFAULT ${DEP_GIT_TAG}
    TYPE "STRING"
    DOC "git tag for ${DEP_NAME}")

  if(NOT ${DEP_NAME}_FORCE_DOWNLOAD)
    find_package(${DEP_NAME} CONFIG QUIET)
  endif()

  if(NOT ${DEP_NAME}_FOUND)
    FetchContent_Declare(${DEP_NAME}
      SYSTEM
      EXCLUDE_FROM_ALL
      GIT_REPOSITORY ${DEP_GIT_REPOSITORY}
      GIT_TAG ${DEP_GIT_TAG})
    if(NOT ${DEP_NAME}_POPULATED)
      FetchContent_MakeAvailable(${DEP_NAME})
    endif()
  endif()
endmacro()
