include(dependency)
git_resolvable_dependency(
  NAME sml
  GIT_REPOSITORY https://github.com/boost-ext/sml.git
  GIT_TAG master)

IF(NOT sml_FOUND)
  include(GNUInstallDirs)

  add_library(sml_header INTERFACE)

  target_include_directories(sml_header
    INTERFACE
    $<BUILD_INTERFACE:${sml_SOURCE_DIR}/include
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)

  add_library(sml::header ALIAS sml_header)
  if(NOT sml_EXCLUDE_FROM_ALL)

    install(
      DIRECTORY ${sml_SOURCE_DIR}/include/boost
      DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
      FILES_MATCHING PATTERN "*.hpp")

  endif()
  set(sml_FOUND TRUE)
endif()
