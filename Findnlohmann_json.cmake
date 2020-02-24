include(FetchContent)


option(nlohmann_json_FORCE_DOWNLOAD "Download NLohmann JSON even if it could be found" ON)
option(nlohmann_json_INSTALL_MISSING "Install NLohmann JSON if it is missing" ON)
set(nlohmann_json_REPOSITORY https://github.com/nlohmann/json.git
  CACHE STRING "URL for the NLohmann JSON repository")

mark_as_advanced(FORCE nlohmann_json_FORCE_DOWNLOAD nlohmann_json_REPOSITORY)

if(NOT nlohmann_json_TAG)
  if(ENV{NLOHMANN_JSON_TAG})
    set(nlohmann_json_TAG $ENV{NLOHMANN_JSON_TAG} CACHE STRING "Tag for the NLohmann JSON repository")
    mark_as_advanced(FORCE nlohmann_json_TAG)
  endif()
endif()

if(NOT NLOHMANN_JSON_FORCE_DOWNLOAD)
  find_package(nlohmann_json CONFIG)
endif()

if(NOT nlohmann_json_FOUND)

  if(nlohmann_json_TAG)
    FetchContent_Declare(nlohmann_json
      GIT_REPOSITORY ${nlohmann_json_REPOSITORY}
      GIT_TAG ${nlohmann_json_TAG})
  else()
    FetchContent_Declare(nlohmann_json
      GIT_REPOSITORY ${nlohmann_json_REPOSITORY})
  endif()

  FetchContent_GetProperties(nlohmann_json)
  if(NOT nlohmann_json_POPULATED)
    FetchContent_Populate(nlohmann_json)
    set(JSON_BuildTests OFF CACHE INTERNAL "")
    if(nlohmann_json_INSTALL_MISSING)
      add_subdirectory(${nlohmann_json_SOURCE_DIR} ${nlohmann_json_BINARY_DIR})
    else()
      add_subdirectory(${nlohmann_json_SOURCE_DIR} ${nlohmann_json_BINARY_DIR} EXCLUDE_FROM_ALL)
    endif()
  endif()
  
endif()
