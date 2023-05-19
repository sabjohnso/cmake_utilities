set(common_cxx_standard 23)
add_library(common_compiler_settings INTERFACE)
set_target_properties(common_compiler_settings
  PROPERTIES
    CXX_STANDARD 23
    CXX_STANDARD_REQUIRED TRUE
)
