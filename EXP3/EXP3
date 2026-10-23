%{
#include <stdio.h>
int count = 0;
//
%}

%%
[Aa][a-zA-Z]*    { count++; }       /* Words starting with A or a */
[a-zA-Z]+        ;                  /* Ignore other words */
[ \t\n]+         ;                  /* Ignore whitespace */
.                ;                  /* Ignore punctuation/symbols */
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter text (Press Ctrl+D on Linux/Mac or Ctrl+Z on Windows to end):\n");
    yylex();
    printf("Number of words starting with 'A': %d\n", count);
    return 0;
}
