#include <nlohmann/json-schema.hpp>
#include <nlohmann/json.hpp>

constexpr char document[] = R"(
{
  "x": 1,
  "y": 2
}
)";

constexpr char schema[] = R"schema(
{
  "type" : "object",
  "properties" : {
    "x" : {"type" : "number"},
    "y" : {"type" : "number"}
  },
  "required" : ["x", "y"],
  "additionalProperties" : false
}
)schema";

int
main(int, char**)
{
  using nlohmann::json;
  using nlohmann::json_schema::json_validator;
  auto doc = json::parse(document);
  auto sch = json::parse(schema);

  json_validator validator;
  validator.set_root_schema(sch);
  validator.validate(doc);

  return 0;
}
