%{
#include<stdio.h>
#include<stdlib.h>
void yyerror(char *);
int yylex();
int sym[26]={0};
%}
%token id digit
%left '+' '-'
%left '*' '/'
%%
P: P S '\n'
| ;
S: E  {printf("Output: %d\n",$1);}
	| id '=' E {sym[$1]=$3;}
E: digit {$$=$1;}
    |id {$$=sym[$1];}
    |E '+' E {$$=$1+$3;}
    |E '-' E {$$=$1-$3;}
    |E '' E {$=$1$3;}
    |E '/' E {if($3) $$=$1/$3;
              else{yyerror("Error.. Division By Zero!!\n");}}
    | '(' E ')'  {$$=$2;}
    ;
%%

int main()
{
  yyparse();
  return 0;
}
void yyerror(char *msg)
{
   fprintf(stderr,"%s\n", msg);
   exit(0);
}
