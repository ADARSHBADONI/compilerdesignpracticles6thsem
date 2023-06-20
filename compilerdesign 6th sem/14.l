Program-14
Objective: Design YACC/LEX code to evaluate arithmetic expression with
operator +,-* and / without operator precedence grammar and with operator
precedence grammar
Source Code:
LEX File
%{
#include "y.tab.h"
extern int yylval;
%}
%%
[0-9]+ {yylval = atoi(yytext); return num;}
[-+\/*] {return yytext[0];}
[ \t] ;
[\n] {return 0;}
. {printf("Invalid character '%c'\n", yytext[0]); }
%%
int yywrap()
{
return 1;
}
YACC File with operator precedence grammar
%{
#include <stdio.h>
%}
%token num
%left '+' '-'
%left '*' '/'
%%
S:E {printf("Result: %d\n", $1); return 0;}
E:E '+' E { $$ = $1 + $3; }
| E '-' E { $$ = $1 - $3; }
| E '*' E { $$ = $1 * $3; }
| E '/' E { $$ = $1 / $3; }
| num { $$ = $1; }
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
😃️YACC File without operator precedence grammar
%{
#include <stdio.h>
%}
%token num
%%
S:E {printf("Result: %d\n", $1); return 0;}
E: E '+' T { $$ = $1 + $3; }
| E '-' T { $$ = $1 - $3; }
| T { $$ = $1; }
;
T: T '*' F { $$ = $1 * $3; }
| T '/' F { $$ = $1 / $3; }
| F { $$ = $1; }
;
F: num { $$ = $1; }
| '(' E ')' { $$ = $2; }
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
