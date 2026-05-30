if(NOT webview_FOUND)
  include(dependency)
  git_resolvable_dependency(
    NAME webview
    GIT_REPOSITORY https://github.com/webview/webview.git
    GIT_TAG 0.12.0
  )
endif()
