#include <stdio.h>
#include <string.h>
char grade = 'D';
char Name[128];
/*
 * vulnerable - vulnerable functions
 */
void vulnerable3(char *buffer) {
  printf (buffer);
  return;
}

void vulnerable2(char *buffer) {
  vulnerable3(buffer);
  return;
}

void vulnerable1(char *buffer) {
  vulnerable2(buffer);
  return;
}

int main(int argc, char *argv[]) {
  char buf[128] = "";
  fgets(buf, 100, stdin);
  fgets(Name, 100, stdin);
  Name[strlen(Name) - 1] = '\0';
  vulnerable1(buf);
  printf("Thank you, %s.\n", Name);
  printf("I recommend that you get a grade of %c on this assignment.\n", grade);

  return 0;

}
