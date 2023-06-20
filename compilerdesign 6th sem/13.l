13.Objective: Design YACC/LEX code to recognize valid arithmetic expression
   with operators +,-,*and /.
Source Code:
😀️LEX File
%{
#include "y.tab.h"
%}
%%
[a-zA-Z]+ {return id;}
[0-9]+ {return num;}
[-+\/*=] {return yytext[0];}
[ \t] ;
[\n] {return 0;}
. {printf("Invalid character '%c'\n", yytext[0]);}
%%
int yywrap()
{
return 1;
}
😃️YACC File
%{
#include <stdio.h>
%}
%token num id
%left '+' '-'
%left '*' '/'
%%
S:E {printf("Valid arithmetic expression\n"); return 0; }
|E'='E {printf("Valid arithmetic expression\n"); return 0; }
E:E'+'E
|E'-'E
|E'*'E
|E'/'E
|num
|id
;
%%
int main()
{
printf("Enter the expression: ");
yyparse();
return 0;
}
int yyerror(char *s)
{
printf("Error: %s\n", s);
return 0;
}

