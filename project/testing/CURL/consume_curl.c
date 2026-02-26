#include <curl/curl.h>
#include <stdio.h>

int
main(void) {
  curl_global_init(CURL_GLOBAL_DEFAULT);
  CURL *handle = curl_easy_init();
  if (!handle) {
    curl_global_cleanup();
    return 1;
  }
  printf("curl %s\n", curl_version());
  curl_easy_cleanup(handle);
  curl_global_cleanup();
  return 0;
}
