%{
#include<stdio.h>
#include "y.tab.h"
%}
%%
[0-9]+ {yylval=atoi(yytext);return NUMBER;}
[-+*/\n] return *yytext;
. ;
%%
int yywrap(){
return 1;
}
