if(NOT GTest_FOUND)
  include(dependency)
  git_resolvable_dependency(
    NAME GTest
    GIT_REPOSITORY https://github.com/google/googletest
    GIT_TAG v1.13.0)

  if(TARGET gtest)
    target_compile_options(gtest PRIVATE -Wno-error)
  endif()
endif()

if(NOT TARGET GTest::gtest)
  message(FATAL_ERROR "GTest dependency was not correctly resolved")
endif()
