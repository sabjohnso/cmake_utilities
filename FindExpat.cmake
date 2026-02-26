if(NOT expat_FOUND)
  include(parameter)
  include(FetchContent)

  parameter(
    NAME expat_GIT_REPOSITORY
    DEFAULT "https://github.com/libexpat/libexpat.git"
    TYPE "STRING"
    DOC "Repository URL for expat")

  parameter(
    NAME expat_GIT_TAG
    DEFAULT "master"
    TYPE "STRING"
    DOC "git tag for expat")

  if(NOT expat_FORCE_DOWNLOAD)
    message(STATUS "Searching for installed expat")
    find_package(expat CONFIG QUIET)
  endif()

  if(NOT expat_FOUND)
    set(EXPAT_BUILD_TOOLS OFF)
    set(EXPAT_BUILD_EXAMPLES OFF)
    set(EXPAT_BUILD_TESTS OFF)
    set(EXPAT_BUILD_DOCS OFF)
    set(EXPAT_ENABLE_INSTALL OFF)

    # CMakeLists.txt lives in the expat/ subdirectory, not the repo root.
    FetchContent_Declare(expat
      EXCLUDE_FROM_ALL
      SYSTEM
      GIT_REPOSITORY ${expat_GIT_REPOSITORY}
      GIT_TAG "${expat_GIT_TAG}"
      SOURCE_SUBDIR expat)
    FetchContent_MakeAvailable(expat)
    set(expat_FOUND TRUE)
  endif()
endif()
