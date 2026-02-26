#include <expat.h>
#include <stdio.h>
#include <string.h>

static void
start_element(void *data, const XML_Char *name, const XML_Char **attrs) {
  (void)data;
  (void)attrs;
  printf("%s\n", name);
}

int
main(void) {
  const char *xml = "<greeting>hello</greeting>";
  XML_Parser parser = XML_ParserCreate(NULL);
  XML_SetStartElementHandler(parser, start_element);
  if (XML_Parse(parser, xml, (int)strlen(xml), 1) == XML_STATUS_ERROR) {
    XML_ParserFree(parser);
    return 1;
  }
  XML_ParserFree(parser);
  return 0;
}
