include(FetchContent)

option(GTEST_FORCE_DOWNLOAD "Download GTest even if it could be found" ON)
set(GTest_TAG_DEFAULT v1.13.0)
if(NOT GTest_TAG)
  if(ENV{GTEST_TAG})
    set(GTest_TAG $ENV{GTEST_TAG} CACHE STRING "Tag for GTest git repository")
  else()
    set(GTest_TAG ${GTest_TAG_DEFAULT})
  endif()
endif()

if(NOT GTEST_FORCE_DOWNLOAD)
  find_package(GTest CONFIG)
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
    get_target_property(gtest_compile_flags gtest COMPILE_FLAGS)
    string(PREPEND gtest_compile_flags "-Wno-error ")
    set_target_properties(gtest PROPERTIES COMPILE_FLAGS "${gtest_compile_flags}")
  endif()

  set(GTest_FOUND TRUE)

endif()

if((NOT TARGET GTest::gtest) AND GTest_FOUND)
  message(FATAL_ERROR "Installed GTest does not have target GTest::gtest")
elseif(NOT TARGET GTest::gtest)
  message(FATAL_ERROR "GTest dependency was not correctly resolved")
endif()
