cmake\_utilities
================

A collection of CMake Find modules that automate resolution of external
C++ dependencies. Each module attempts to find a system-installed
package first, then falls back to downloading and building from source
via Git and FetchContent.

## Quick Start

Add this repository to your project's `CMAKE_MODULE_PATH`, then use
standard `find_package` calls:

```cmake
list(APPEND CMAKE_MODULE_PATH /path/to/cmake_utilities)
find_package(fmt REQUIRED)
find_package(GTest REQUIRED)

target_link_libraries(my_target PRIVATE fmt::fmt GTest::gtest)
```

CMake minimum version: **3.13**

## How Dependency Resolution Works

Most modules use the `git_resolvable_dependency()` macro from
`dependency.cmake`, which follows this strategy:

1. If `<NAME>_FORCE_DOWNLOAD` is set, skip the system search.
2. Otherwise, try `find_package(<NAME> CONFIG QUIET)`.
3. If not found, download from Git via `FetchContent_Declare` /
   `FetchContent_MakeAvailable`.

Every dependency automatically gets two overridable cache variables
(also settable via environment variables):

- `<NAME>_GIT_REPOSITORY` -- the Git URL to fetch from
- `<NAME>_GIT_TAG` -- the branch, tag, or commit to check out

## Available Find Modules

### Testing

| Module                | Dependency       | Repository                                                |
|-----------------------|------------------|-----------------------------------------------------------|
| `FindCatch2.cmake`    | Catch2           | [catchorg/Catch2](https://github.com/catchorg/Catch2)     |
| `FindGTest.cmake`     | Google Test      | [google/googletest](https://github.com/google/googletest) |
| `FindGUnit.cmake`     | GUnit (BDD)      | [cpp-testing/GUnit](https://github.com/cpp-testing/GUnit) |
| `Findbenchmark.cmake` | Google Benchmark | [google/benchmark](https://github.com/google/benchmark)   |

### JSON

| Module                                     | Dependency            | Repository                                                                          |
|--------------------------------------------|-----------------------|-------------------------------------------------------------------------------------|
| `Findnlohmann_json.cmake`                  | nlohmann/json         | [nlohmann/json](https://github.com/nlohmann/json)                                   |
| `Findnlohmann_json_schema_validator.cmake` | JSON Schema Validator | [pboettch/json-schema-validator](https://github.com/pboettch/json-schema-validator) |
| `Findeasyj.cmake`                          | easyj                 | [sabjohnso/easyj](https://github.com/sabjohnso/easyj)                               |

### Messaging (ZeroMQ)

| Module               | Dependency | Repository                                        |
|----------------------|------------|---------------------------------------------------|
| `FindZeroMQ.cmake`   | libzmq     | [zeromq/libzmq](https://github.com/zeromq/libzmq) |
| `FindZeroMQPP.cmake` | zmqpp      | [zeromq/zmqpp](https://github.com/zeromq/zmqpp)   |
| `Findcppzmq.cmake`   | cppzmq     | [zeromq/cppzmq](https://github.com/zeromq/cppzmq) |

### Compression & Hashing

| Module             | Dependency | Repository                                            |
|--------------------|------------|-------------------------------------------------------|
| `Findlz4.cmake`    | LZ4        | [lz4/lz4](https://github.com/lz4/lz4)                 |
| `Findxxhash.cmake` | xxHash     | [Cyan4973/xxHash](https://github.com/Cyan4973/xxHash) |

### Reflection & Introspection

| Module                    | Dependency       | Repository                                                              |
|---------------------------|------------------|-------------------------------------------------------------------------|
| `Findpfr.cmake`           | PFR (standalone) | [apolukhin/pfr\_non\_boost](https://github.com/apolukhin/pfr_non_boost) |
| `Findintrospection.cmake` | introspection    | [sabjohnso/introspection](https://github.com/sabjohnso/introspection)   |

### Formatting & Strings

| Module               | Dependency | Repository                                                  |
|----------------------|------------|-------------------------------------------------------------|
| `Findfmt.cmake`      | fmt        | [fmtlib/fmt](https://github.com/fmtlib/fmt)                 |
| `Findctstring.cmake` | ctstring   | [sabjohnso/ctstring](https://github.com/sabjohnso/ctstring) |

### Metaprogramming & Functional

| Module                       | Dependency        | Repository                                                                   |
|------------------------------|-------------------|------------------------------------------------------------------------------|
| `Findtype_utility.cmake`     | type\_utility     | [sabjohnso/type\_utility](https://github.com/sabjohnso/type_utility)         |
| `Findfunction_utility.cmake` | function\_utility | [sabjohnso/function\_utility](https://github.com/sabjohnso/function_utility) |
| `Findoperators.cmake`        | operators         | [sabjohnso/operators](https://github.com/sabjohnso/operators)                |
| `Findlist_processing.cmake`  | list\_processing  | [sabjohnso/list\_processing](https://github.com/sabjohnso/list_processing)   |
| `Findcontextual.cmake`       | contextual        | [sabjohnso/contextual](https://github.com/sabjohnso/contextual)              |
| `Findinteger.cmake`          | integer           | [sabjohnso/integer](https://github.com/sabjohnso/integer)                    |

### Reactive & State Machines

| Module            | Dependency | Repository                                            |
|-------------------|------------|-------------------------------------------------------|
| `Findrxcpp.cmake` | RxCpp      | [ReactiveX/RxCpp](https://github.com/ReactiveX/RxCpp) |
| `Findsml.cmake`   | SML        | [boost-ext/sml](https://github.com/boost-ext/sml)     |

### Templating & Code Generation

| Module                           | Dependency | Repository                                    |
|----------------------------------|------------|-----------------------------------------------|
| `Findinja.cmake`                 | Inja       | [pantor/inja](https://github.com/pantor/inja) |
| `XSD.cmake` / `XSDOptions.cmake` | xsdcxx     | XSD/C++ code generator                        |

### Data & I/O

| Module                | Dependency        | Repository                                                  |
|-----------------------|-------------------|-------------------------------------------------------------|
| `FindHighFive.cmake`  | HighFive          | [BlueBrain/HighFive](https://github.com/BlueBrain/HighFive) |
| `FindLuaSource.cmake` | Lua (from source) | [lua/lua](https://github.com/lua/lua)                       |

### System

| Module               | Dependency | Description                                                   |
|----------------------|------------|---------------------------------------------------------------|
| `Findunwind.cmake`   | libunwind  | Finds system-installed libunwind                              |
| `FindRacket.cmake`   | Racket     | Finds system-installed Racket                                 |
| `Findpybind11.cmake` | pybind11   | [pybind/pybind11](https://github.com/pybind/pybind11)         |
| `Findxsimd.cmake`    | xsimd      | [xtensor-stack/xsimd](https://github.com/xtensor-stack/xsimd) |

## Utility Modules

These are included by the Find modules and can be used directly in
your projects.

| Module                  | Function / Macro                                                                | Purpose                                                          |
|-------------------------|---------------------------------------------------------------------------------|------------------------------------------------------------------|
| `dependency.cmake`      | `git_resolvable_dependency()`                                                   | Core abstraction: system find with Git/FetchContent fallback     |
| `parameter.cmake`       | `parameter()`                                                                   | Create typed cache variables with environment variable overrides |
| `imported.cmake`        | `add_imported_executable()`, `add_imported_library()`, `add_imported_package()` | Helpers for creating IMPORTED targets from pre-built binaries    |
| `build.cmake`           | `build_make()`                                                                  | Run external make-based builds                                   |
| `show.cmake`            | `show()`                                                                        | Debug helper that prints `"name: ${name}"`                       |
| `Configurable.cmake`    | `configurable()`                                                                | Environment-aware cached parameter                               |
| `common_settings.cmake` | `common_compiler_settings` target                                               | Interface target with shared compiler settings                   |

## Overriding Defaults

Override the Git repository or tag for any dependency via cache
variables or environment variables:

```bash
# Use a fork
cmake -B build -S . -Dfmt_GIT_REPOSITORY=https://github.com/myfork/fmt

# Pin a specific version
cmake -B build -S . -DGTest_GIT_TAG=v1.14.0

# Force download even if system package is available
cmake -B build -S . -DGTest_FORCE_DOWNLOAD=ON

# Or via environment variables
export fmt_GIT_TAG=10.2.0
cmake -B build -S .
```

## Running Tests

Each test is a standalone CMake project that downloads and builds a
dependency, so the first run is slow.

```bash
cmake -B build -S project
cmake --build build
cd build && ctest

# Run a single test
ctest -R fmt
```

## Writing a New Find Module

Follow the standard pattern using `git_resolvable_dependency()`:

```cmake
if(NOT <name>_FOUND)
  include(dependency)
  git_resolvable_dependency(
    NAME <name>
    GIT_REPOSITORY <url>
    GIT_TAG <tag>)
endif()
```

If post-fetch target setup is needed (aliases, compile options, etc.),
add it after the `git_resolvable_dependency` call:

```cmake
if(NOT <name>_FOUND)
  include(dependency)
  git_resolvable_dependency(
    NAME <name>
    GIT_REPOSITORY <url>
    GIT_TAG <tag>)

  if(TARGET <raw_target> AND NOT TARGET <name>::<name>)
    add_library(<name>::<name> ALIAS <raw_target>)
  endif()
endif()
```

## License

See individual dependency licenses. This repository contains only CMake
module code for dependency resolution.
