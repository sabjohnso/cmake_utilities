include(FetchContent)
include(Configurable)

option(benchmark_FORCE_DOWNLOAD
  "Download benchmark even if it could be found"
  ON)

configurable(benchmark_TAG BENCHMARK_TAG v1.8.0
  "Tag to use for the google benchmark repository")

configurable(benchmark_REPOSITORY BENCHMARK_REPOSITORY https://github.com/google/benchmark.git
  "URL of the benchmark repository")

if(NOT benchmark_FORCE_DOWNLOAD)
  find_package(benchmark CONFIG QUIET)
endif()

if(NOT benchmark_FOUND)

  message(STATUS "benchmark_REPOSITORY: ${benchmark_REPOSITORY}")

  FetchContent_Declare(bench
    GIT_REPOSITORY ${benchmark_REPOSITORY}
    GIT_TAG ${benchmark_TAG})
  FetchContent_GetProperties(bench)
  if(NOT bench_POPULATED)
    set(BENCHMARK_ENABLE_TESTING OFF CACHE INTERNAL "")
    FetchContent_MakeAvailable(bench)
  endif()
  set(benchmark_FOUND TRUE)
endif()
