include(dependency)
git_resolvable_dependency(
  NAME LuaSource
  GIT_REPOSITORY https://github.com/lua/lua.git
  GIT_TAG v${lua_version})

set(Lua_SOURCE_FILES
  ${luasource_SOURCE_DIR}/lapi.c
  ${luasource_SOURCE_DIR}/lcode.c
  ${luasource_SOURCE_DIR}/ldblib.c
  ${luasource_SOURCE_DIR}/ldump.c
  ${luasource_SOURCE_DIR}/linit.c
  ${luasource_SOURCE_DIR}/lmathlib.c
  ${luasource_SOURCE_DIR}/lobject.c
  ${luasource_SOURCE_DIR}/lparser.c
  ${luasource_SOURCE_DIR}/lstrlib.c
  ${luasource_SOURCE_DIR}/ltests.c
  ${luasource_SOURCE_DIR}/lundump.c
  ${luasource_SOURCE_DIR}/lzio.c
  ${luasource_SOURCE_DIR}/lauxlib.c
  ${luasource_SOURCE_DIR}/lcorolib.c
  ${luasource_SOURCE_DIR}/ldebug.c
  ${luasource_SOURCE_DIR}/lfunc.c
  ${luasource_SOURCE_DIR}/liolib.c
  ${luasource_SOURCE_DIR}/lmem.c
  ${luasource_SOURCE_DIR}/lopcodes.c
  ${luasource_SOURCE_DIR}/lstate.c
  ${luasource_SOURCE_DIR}/ltable.c
  ${luasource_SOURCE_DIR}/ltm.c
  ${luasource_SOURCE_DIR}/lutf8lib.c
  ${luasource_SOURCE_DIR}/onelua.c
  ${luasource_SOURCE_DIR}/lbaselib.c
  ${luasource_SOURCE_DIR}/lctype.c
  ${luasource_SOURCE_DIR}/ldo.c
  ${luasource_SOURCE_DIR}/lgc.c
  ${luasource_SOURCE_DIR}/llex.c
  ${luasource_SOURCE_DIR}/loadlib.c
  ${luasource_SOURCE_DIR}/loslib.c
  ${luasource_SOURCE_DIR}/lstring.c
  ${luasource_SOURCE_DIR}/ltablib.c
  ${luasource_SOURCE_DIR}/lua.c
  ${luasource_SOURCE_DIR}/lvm.c)

add_library(lua_shared SHARED ${Lua_SOURCE_FILES})
target_include_directories(lua_shared PUBLIC ${luasource_SOURCE_DIR})

add_library(lua_static STATIC ${Lua_SOURCE_FILES})
target_include_directories(lua_static PUBLIC ${luasource_SOURCE_DIR})
