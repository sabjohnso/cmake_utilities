if(NOT tlaplus_FOUND)
  include(parameter)

  parameter(
    NAME JAVA_HOME
    DEFAULT "$ENV{JAVA_HOME}"
    TYPE PATH
    DOC "Path to Java installation")

  find_package(Java 11 REQUIRED COMPONENTS Development)
  find_program(ANT_EXECUTABLE ant REQUIRED)

  set(tlaplus_JAVA_EXECUTABLE ${Java_JAVA_EXECUTABLE})

  include(dependency)
  git_resolvable_dependency(
    NAME tlaplus
    GIT_REPOSITORY https://github.com/tlaplus/tlaplus.git
    GIT_TAG master)

  set(tlaplus_TOOLS_DIR
    ${tlaplus_SOURCE_DIR}/tlatools/org.lamport.tlatools)
  set(tlaplus_JAR
    ${tlaplus_TOOLS_DIR}/dist/tla2tools.jar)

  file(GLOB_RECURSE tlaplus_JAVA_SOURCES
    ${tlaplus_TOOLS_DIR}/src/*.java)

  add_custom_command(
    OUTPUT ${tlaplus_JAR}
    COMMAND ${CMAKE_COMMAND} -E make_directory ${tlaplus_TOOLS_DIR}/test-class
    COMMAND ${CMAKE_COMMAND} -E env "JAVA_HOME=${JAVA_HOME}"
            ${ANT_EXECUTABLE} -f customBuild.xml
            -Dnoclean=true compile dist
    WORKING_DIRECTORY ${tlaplus_TOOLS_DIR}
    DEPENDS ${tlaplus_JAVA_SOURCES}
    COMMENT "Building TLA+ command line tools with ant")

  set(tlaplus_BIN_DIR ${tlaplus_BINARY_DIR}/bin)
  file(MAKE_DIRECTORY ${tlaplus_BIN_DIR})

  set(tlaplus_TOOLS
    sany    tla2sany.SANY
    tlc     tlc2.TLC
    repl    tlc2.REPL
    pcal    pcal.trans
    tlatex  tla2tex.TLA)

  add_custom_target(tlaplus_tools ALL
    DEPENDS ${tlaplus_JAR})

  list(LENGTH tlaplus_TOOLS tlaplus_TOOLS_LENGTH)
  math(EXPR tlaplus_TOOLS_LAST "${tlaplus_TOOLS_LENGTH} - 1")

  foreach(index RANGE 0 ${tlaplus_TOOLS_LAST} 2)
    math(EXPR class_index "${index} + 1")
    list(GET tlaplus_TOOLS ${index} tool_name)
    list(GET tlaplus_TOOLS ${class_index} tool_class)

    set(script_path ${tlaplus_BIN_DIR}/tla-${tool_name})

    file(WRITE ${script_path}
      "#!/bin/sh\nexec \"${tlaplus_JAVA_EXECUTABLE}\" -cp \"${tlaplus_JAR}\" ${tool_class} \"$@\"\n")
    file(CHMOD ${script_path}
      PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE
                  GROUP_READ GROUP_EXECUTE
                  WORLD_READ WORLD_EXECUTE)

    add_executable(tlaplus::${tool_name} IMPORTED GLOBAL)
    set_target_properties(tlaplus::${tool_name}
      PROPERTIES
        IMPORTED_LOCATION ${script_path})
  endforeach()

  set(tlaplus_FOUND TRUE)
endif()
