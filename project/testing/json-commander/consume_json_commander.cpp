#include <json_commander/cmd.hpp>

#include <iostream>

int
main() {
  json_commander::model::Root root;
  root.name = "test";
  root.doc = {"A test tool."};
  auto spec = json_commander::cmd::make(root);
  std::cout << spec.name << std::endl;
  return spec.name == "test" ? 0 : 1;
}
