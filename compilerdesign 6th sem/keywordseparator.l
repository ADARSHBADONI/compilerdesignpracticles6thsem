%{
#include<stdio.h>
%}
%%
auto|double|int|signed|unsigned|else|long|switch|break|if|for|void|return|continue|while printf("\nkeyword\n");
[{};,()] printf("\nseperator\n");
[+-/=*%] printf("\noperator\n");
[a-zA-Z_][a-zA-Z0-9_]* printf("\nidentifier\n");
.|\n; printf("  ");
%%
int yywrap(){
return 1;
}
int main(){
yylex();
return 0;
}

