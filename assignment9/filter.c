#include <stdio.h>
#include <string.h>

int main(int argc, char* argv[])
{
    int ch;
    while((ch = fgetc(stdin)) != '\n') {
        printf("%02x", ch);
    }

    return 0;
}
