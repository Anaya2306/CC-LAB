
%{
#include <stdio.h>

int yylex(void);
int yyerror(char *);
%}

%token FOR ID NUM INC DEC
%token LE GE EQ NE

%%
stmt:
    FOR '(' init ';' condition ';' update ')' body
    {
        printf("Valid for loop\n");
    }
    ;

init:
    ID '=' NUM
    ;

condition:
    ID relop NUM
    ;

relop:
    '<'
    | '>'
    | LE
    | GE
    | EQ
    | NE
    ;

update:
    ID INC
    | ID DEC
    | ID '=' ID '+' NUM
    | ID '=' ID '-' NUM
    ;

body:
    '{' '}'
    | '{' statements '}'
    | /* empty */
    ;

statements:
    statement
    | statements statement
    ;

statement:
    ID INC ';'
    | ID DEC ';'
    | ID '=' NUM ';'
    ;

%%

int main(void)
{
    printf("Enter a for loop:\n");
    yyparse();
    return 0;
}

int yyerror(char *s)
{
    printf("Invalid for loop\n");
    return 0;
}
