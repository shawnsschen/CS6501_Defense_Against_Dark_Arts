#include <stdio.h>
#include <string.h>

int main(int argc, char* argv[])
{
    FILE *ptr_s, *ptr_d;
    int ch;
    char buf1[] = "\x68\x61\x85\x04\x08\xc3";
    char buf2[] = "\x68\x72\x85\x04\x08\xe8\x85\xfd\xff\xff\x58\x68\x00\x86\x04\x08\xc3\x43\x61\x76\x6d\x61\x6e\x20\x76\x69\x72\x75\x73\x20\x61\x63\x74\x69\x76\x61\x74\x69\x6e\x67\x21";
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
        fseek(ptr_d, 0x543, SEEK_SET);
        fwrite(buf1, sizeof(char), sizeof(buf1), ptr_d);
        fseek(ptr_d, 0x561, SEEK_SET);
        fwrite(buf2, sizeof(char), sizeof(buf2), ptr_d);
        fclose(ptr_s);
        fclose(ptr_d);
    }
    return 0;
}
