%{
#include <stdio.h>
int num_chars = 1;
%}

RANGE05 (7[8-9a-f]|[8-9a-f][0-9a-f])05
RANGE06 ([0-9a-f][0-9a-f])06
RANGE07 ([0-4][0-9a-f]|5[0-4])07
RANGE {RANGE05}|{RANGE06}|{RANGE07}

%%
.{2,2}                   { num_chars++; }
bc{RANGE}000031363126    {
                             printf("WARNING! Wahoo virus: byte number: %d\n", num_chars);
                             printf("%s\n\n", yytext);
                             num_chars+=9;
                         }

%%
int main()
{
    yylex();
    return 0;
}
