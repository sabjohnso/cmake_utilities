
if(NOT GUnit_FOUND)
  include(dependency)
  include(show)

  git_resolvable_dependency(
  NAME gunit
  GIT_REPOSITORY https://github.com/cpp-testing/GUnit.git)

  set_property(DIRECTORY ${gunit_SOURCE_DIR}
    PROPERTY COMPILE_FLAGS "-Wno-implicit-int-float-conversion")

  add_library(GUnit INTERFACE)
  target_include_directories(GUnit INTERFACE ${gunit_SOURCE_DIR}/include)

  get_target_property(gtest_compile_flags gtest COMPILE_FLAGS)
  string(REPLACE "-Wno-implicit-int-float-conversion" "" gtest_compile_flags ${gtest_compile_flags})
  string(REPLACE "  " " " gtest_compile_flags ${gtest_compile_flags})
  string(APPEND gtest_compile_flags " -Wno-implicit-int-float-conversion")
  set_target_properties(gtest
    PROPERTIES COMPILE_FLAGS "${gtest_compile_flags}")
  target_link_libraries(GUnit INTERFACE gtest gmock gherkin-cpp::gherkin-cpp)

  add_library(GUnit::header ALIAS GUnit)
  set(GUnit_FOUND TRUE)
endif()
