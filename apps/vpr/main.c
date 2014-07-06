#include <stdio.h>
#include <stdlib.h>

#include "gitver.h"

int main(int argc, char *argv[])
{
  printf("Hi, I'm %s with argc = %d\n", argv[0], argc);
  printf("My version is %s\n", git_version());
  return 0;
}
