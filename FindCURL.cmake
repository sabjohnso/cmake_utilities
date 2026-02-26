if(NOT CURL_FOUND)
  include(dependency)

  set(BUILD_CURL_EXE OFF CACHE BOOL "" FORCE)
  set(BUILD_TESTING OFF CACHE BOOL "" FORCE)
  set(BUILD_LIBCURL_DOCS OFF CACHE BOOL "" FORCE)
  set(ENABLE_CURL_MANUAL OFF CACHE BOOL "" FORCE)
  set(CURL_DISABLE_INSTALL ON CACHE BOOL "" FORCE)
  set(CURL_USE_LIBPSL OFF CACHE BOOL "" FORCE)

  git_resolvable_dependency(
    NAME CURL
    GIT_REPOSITORY https://github.com/curl/curl.git
    GIT_TAG master)
endif()
