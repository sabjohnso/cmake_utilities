set(inja_FORCE_DOWNLOAD TRUE)
set(inja_GIT_TAG main)

if(NOT inja_FOUND)
  include(dependency)
  set(INJA_BUILD_TESTS OFF)
  git_resolvable_dependency(
    NAME inja
    GIT_REPOSITORY https://github.com/pantor/inja.git
    GIT_TAG main
  )
  set_property(DIRECTORY ${inja_SOURCE_DIR} PROPERTY EXCLUDE_FROM_ALL ON)
endif()
