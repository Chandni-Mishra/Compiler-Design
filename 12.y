%{
  #include<stdio.h>
  #include<stdlib.h>
  void yyerror(char *);
  int yylex();
  int yywrap();
%}
%token NUMBER
%left '+' '-'
%left '*' '/'
%%
S: S E '\n' {$$=$2; printf("Output: %d\n",$$);}
  | ;
E: E'+'E {$$=$1+$3;}
   | E'-'E {$$=$1-$3;}
   | E'*'E {$$=$1*$3;}
   | E'/'E {if($3==0) {yyerror("Error...Division by Zero\n");} 
            else {$$=$1/$3;}}
   |NUMBER {$$=$1;}
   ;
%%
void yyerror(char *msg)
{
printf("\n%s",msg);
printf("Arithematic Expression is invalid\n");
exit(0);
}
int yywrap(){ return 1;}
int main(){
yyparse();
return 0;
}
