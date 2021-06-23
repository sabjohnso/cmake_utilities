
include(dependency)
git_resolvable_dependency(
  NAME rxcpp
  GIT_REPOSITORY https://github.com/ReactiveX/RxCpp.git)

if(NOT rxcpp_FOUND)
  include(GNUInstallDirs)
  add_library(rxcpp_header INTERFACE)
  target_include_directories(rxcpp_header
    INTERFACE
    $<BUILD_INTERFACE:${rxcpp_SOURCE_DIR}/Rx/v2/src>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)
  add_library(rxcpp::header ALIAS rxcpp_header)

  if(NOT rxcpp_EXCLUDE_FROM_ALL)
    install(
      DIRECTORY
      ${rxcpp_SOURCE_DIR}/Rx/v2/src/rxcpp

      DESTINATION
      ${CMAKE_INSTALL_INCLUDEDIR}

      FILES_MATCHING PATTERN
      "*.hpp")
  endif()
  set(rxcpp_FOUND TRUE)
endif()
