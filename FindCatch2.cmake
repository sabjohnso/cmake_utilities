if(NOT catch2_FOUND)
  include(dependency)
  git_resolvable_dependency(
    NAME catch2
    GIT_REPOSITORY https://github.com/catchorg/Catch2.git)
  if(NOT catch2_FOUND)
    set_property(DIRECTORY ${catch2_SOURCE_DIR} PROPERTY EXCLUDE_FROM_ALL ON)
  endif()
endif()
