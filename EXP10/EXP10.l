
%{
#include "y.tab.h"
%}

%%
"for"                       { return FOR; }
"++"                        { return INC; }
"--"                        { return DEC; }

"<="                        { return LE; }
">="                        { return GE; }
"=="                        { return EQ; }
"!="                        { return NE; }
"<"                         { return '<'; }
">"                         { return '>'; }

"="                         { return '='; }
"+"                         { return '+'; }
"-"                         { return '-'; }

[0-9]+                      { return NUM; }
[a-zA-Z_][a-zA-Z0-9_]*      { return ID; }

[(){};]                     { return yytext[0]; }
[ \t\n]+                    ;
.                           { return yytext[0]; }
%%

int yywrap(void)
{
    return 1;
}
