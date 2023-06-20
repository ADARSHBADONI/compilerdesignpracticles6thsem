%{
#include<stdio.h>
int tspace=0,tword=0,tchar=0;
%}
%%
" " tspace++;tword++;
[\n\t] tword++;
[^\n\t] tchar++;
%%
int yywrap(){
return 1;
}
int main(){
yyin=fopen("N.txt","r");
yylex();
printf("Number of characters:%d\nNumber of words:%d\n Number of spaces:%d",tchar,tword,tspace);
return 0;
}
