%{
#include "y.tab.h"
extern int yylval;
%}
%%
[a-zA-Z]+ { yylval=*yytext; return id; }
[0-9]+ {yylval = atoi(yytext); return num;}
[-+\/*()] {return (int)yytext[0];}
[ \t] ;
[\n] {return 0;}
. {printf("Invalid character '%c'\n", yytext[0]); }
%%
int yywrap()
{
return 1;
}
YACC File
%{
#include<stdio.h>
%}
%token num id
%left '+' '-'
%left '*' '/'
%%
S: E {printf("\n");}
;
E: E '+' E {printf("+");}
| E '*' E {printf("*");}
| E '-' E {printf("-");}
| E '/' E {printf("/");}
| '(' E ')'
| num {printf("%d", yylval);}
| id {printf("%c", yylval);}
;
%%
int main()
{
printf("Enter the arithmetic expression: ");
yyparse();
return 0;
}
int yyerror(char *s)
{
printf("Error: %s\n", s);
return 0;
}
