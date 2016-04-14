#include <stdio.h>
#include <string.h>

int main(int argc, char* argv[])
{
    FILE *ptr_s, *ptr_d;
    int ch;
    char buf[] = "\xe8\x17\x00\x00\x00\xc3";
    if (argc != 3) {
        printf("Unexpected input\n");
        return 0;
    }
    ptr_s = fopen(argv[1], "rb");
    ptr_d = fopen(argv[2], "w+b");
    if (ptr_s && ptr_d) {
        while((ch = fgetc(ptr_s)) != EOF) {
            fputc(ch, ptr_d);
        }
        fseek(ptr_d, 0x460, SEEK_SET);
        fwrite(buf, sizeof(char), sizeof(buf), ptr_d);
        fclose(ptr_s);
        fclose(ptr_d);
    }
    return 0;
}
