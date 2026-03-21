if(NOT CTestDeps_FOUND)
  include(dependency)
  git_resolvable_dependency(
    NAME CTestDeps
    GIT_REPOSITORY https://github.com/sabjohnso/ctest_deps.git
    GIT_TAG master)
endif()
