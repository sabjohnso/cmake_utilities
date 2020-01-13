include(FetchContent)

option( FORCE_DOWNLOAD_GTEST "Download GTesT even if it is installed" ON)

if(NOT FORCE_DOWNLOAD_GTEST)
  find_package(GTest)
endif()

if(NOT GTest_TAG)
  if(ENV{GTEST_TAG})
    set(GTest_TAG $ENV{GTEST_TAG} CACHE STRING "Tag for GTest git repository")
  endif()
endif()

if(NOT GTest_FOUND)

  if(GTest_TAG)
    FetchContent_Declare(googletest
      GIT_REPOSITORY https://github.com/google/googletest
      GIT_TAG ${GTest_TAG})
  else()
    FetchContent_Declare(googletest
      GIT_REPOSITORY https://github.com/google/googletest)
  endif()

  FetchContent_GetProperties(googletest)
  if(NOT googletest_POPULATED)
    FetchContent_Populate(googletest)
    add_subdirectory(${googletest_SOURCE_DIR} ${googletest_BINARY_DIR} EXCLUDE_FROM_ALL)
  endif()

  add_library(GTest::gtest ALIAS gtest)
  add_library(GTest::gtest_main ALIAS gtest_main)
  add_library(GTest::gmock ALIAS gmock)
  add_library(GTest::gmock_main ALIAS gmock_main)

endif()

if((NOT TARGET GTest::gtest) AND GTest_FOUND)
  message(FATAL_ERROR "Installed GTest does not have target GTest::gtest")
elseif(NOT TARGET GTest::gtest)
  message(FATAL_ERROR "GTest dependency was not correctly resolved")
endif()

