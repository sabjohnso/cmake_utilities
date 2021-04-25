include(dependency)
include(show)

if(NOT ctstring_FOUND)

  git_resolvable_dependency(
    NAME ctstring
    GIT_REPOSITORY https://github.com/sabjohnso/ctstring.git)

  if(NOT ctstring_FOUND)
    show(ctstring_SOURCE_DIR)
    show(ctstring_BINARY_DIR)
    add_subdirectory(${ctstring_SOURCE_DIR} ${ctstring_BINARY_DIR} ${ctstring_EXCLUDE_FROM_ALL})
    set(ctstring_FOUND TRUE)
  endif()
  
endif()
