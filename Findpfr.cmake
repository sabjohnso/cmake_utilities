if(NOT pfr_FOUND)
  include(dependency)
  git_resolvable_dependency(
    NAME pfr
    GIT_REPOSITORY https://github.com/apolukhin/pfr_non_boost
    GIT_TAG master)

  if(TARGET pfr::pfr AND NOT TARGET pfr::header)
    add_library(pfr::header INTERFACE IMPORTED GLOBAL)
    set_target_properties(pfr::header PROPERTIES
      INTERFACE_LINK_LIBRARIES pfr::pfr)
  endif()
endif()
