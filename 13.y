%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
void yyerror(char *);
%}
%token digit


%%
S:S E '\n' {$$=$2;printf("Output=%d\n",$$);}
| ;
E:E'+'T {$$=$1+$3;}
|E'-'T {$$=$1-$3;}
|T {$$=$1;}
 ;
T:T'*'F {$$=$1*$3;}
|T'/'F {if($3==0) yyerror("Division by Zero!!") ; 
        else $$=$1/$3;}
|F {$$=$1;}
 ;
F:digit {$$=$1;}
%%
int main(){
yyparse();
return 0;
}
void yyerror(char *msg)
{
printf("%s\n",msg);
printf("Arithematic Expression is invalid\n");
exit(1);
}
