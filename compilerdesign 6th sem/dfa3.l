%{
#include<stdio.h>
%}
%s q1 q2 q3 DEAD
%%
<INITIAL>[0-9]+ BEGIN q1;
<INITIAL>[0-9]+[.][0-9]+ BEGIN q2;
<INITIAL>[a-zA_Z_][a-zA_Z0-9_]* BEGIN q3;
<INITIAL>[^\n] DEAD;
<INITIAL>\n BEGIN INITIAL; {printf("Not accepted\n");}
<q1>[^\n] BEGIN DEAD;
<q1>\n BEGIN INITIAL; {printf("This is an Interger\n");}
<q2>[^\n] BEGIN DEAD;
<q2>\n BEGIN INITIAL; {printf("This is a float Constant\n");}
<q3>[^\n] BEGIN DEAD;
<q3>\n BEGIN INITIAL; {printf("This is an identifier\n");}
<DEAD>[^\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL; {printf("Invalid\n");}
%%
int yywrap()
{
return 1;
}
int main()
{
printf("Enter input:\n");
yylex();
return 0;
}
