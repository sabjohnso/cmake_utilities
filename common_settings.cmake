set(common_cxx_standard 20)
add_library(common_compiler_settings INTERFACE)
set_target_properties(common_compiler_settings
  PROPERTIES
    CXX_STANDARD ${common_cxx_standard}
    CXX_STANDARD_REQUIRED TRUE
)
