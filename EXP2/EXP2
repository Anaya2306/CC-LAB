%{
#include <stdio.h>
#include <string.h>

int comment_count = 0;
int keyword_count = 0;
int identifier_count = 0;
int word_count = 0;
int line_count = 1;
int space_count = 0;

char *keywords[] = {
    "int","float","char","if","else","while","for","return","void",
    "switch","case","break","continue","do","default","double","long",
    "short","unsigned","signed","const","static","struct","union",
    "enum","typedef","sizeof","goto","auto","register","extern"
};

int isKeyword(char *str)
{
    int i;
    for(i = 0; i < 30; i++)
    {
        if(strcmp(str, keywords[i]) == 0)
            return 1;
    }
    return 0;
}
%}

%%

\/\/.*                      { comment_count++; }

\/\*([^*]|\*+[^*/])*\*+\/   { comment_count++; }

[a-zA-Z_][a-zA-Z0-9_]*      {
                                if(isKeyword(yytext))
                                    keyword_count++;
                                else
                                    identifier_count++;

                                word_count++;
                            }

[0-9]+                      { word_count++; }

" "                         { space_count++; }

\t                          { space_count += 4; }

\n                          { line_count++; }

.                           ;

%%

int main()
{
    freopen("input.txt","r",stdin);

    yylex();

    printf("\n----- Analysis Result -----\n");
    printf("Total Comments    : %d\n", comment_count);
    printf("Total Keywords    : %d\n", keyword_count);
    printf("Total Identifiers : %d\n", identifier_count);
    printf("Total Words       : %d\n", word_count);
    printf("Total Lines       : %d\n", line_count);
    printf("Total Spaces      : %d\n", space_count);

    return 0;
}

int yywrap()
{
    return 1;
}
