
%{
#include "prog12.tab.h"
#include<stdio.h>
#include<stdlib.h>
%}

%%
[a-z] {yylval=*yytext-'a'; return id;}
[0-9]+ {yylval=atoi(yytext); return digit;}
[-+()=/*\n] {return *yytext;}
[ \t] ;
. {printf("Invalid character\n"); exit(0);}
%%

int yywrap(){
return 1;
}
