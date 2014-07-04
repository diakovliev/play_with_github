#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
  printf("Hi, I'm %s with argc = %d\n", argv[0], argc);
  printf("My version is %s\n", GIT_VERSION);
  return 0;
}
