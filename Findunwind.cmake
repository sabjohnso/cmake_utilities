parameter(
  NAME unwind_FORCE_DOWNLOAD
  DEFAULT OFF
  TYPE BOOL
  DOC "Force fresh download and compilation of libunwind instead of using installed libraries"
)

if(NOT unwind_FORCE_DOWNLOAD)



else()


    parameter(NAME unwind_RELEASE_URL_PATTERN
      DEFAULT https://github.com/libunwind/libunwind/releases/download/v<version>/libunwind-<version>.tar.gz
      TYPE STRING
      DOC "The URL pattern for releases of libunwind"
    )

    parameter(
      NAME unwind_VERSION
      DEFAULT 1.8.1
      TYPE STRING
      DOC "The version of of libunwind"
    )

    parameter(
      NAME unwind_HASH
      DEFAULT ""
      TYPE STRING
      DOC "The SHA256 sum of the release to download"
    )

    set(unwind_hash_1_8_1 ddf0e32dd5fafe5283198d37e4bf9decf7ba1770b6e7e006c33e6df79e6a6157)
    set(unwind_hash_1_8_0 b6b3df40a0970c8f2865fb39aa2af7b5d6f12ad6c5774e266ccca4d6b8b72268)
    set(unwind_hash_1_7_2 a18a6a24307443a8ace7a8acc2ce79fbbe6826cd0edf98d6326d0225d6a5d6e6)




    string(REPLACE <version> ${unwind_VERSION} ${unwind_RELEASE_URL_PATTERN} unwind_URL)



    FetchContent_Declare(unwind
      URL ${unwind_URL}
      URL_HASH SHA256=ddf0e32dd5fafe5283198d37e4bf9decf7ba1770b6e7e006c33e6df79e6a6157








endif()
