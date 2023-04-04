%{
%}
%%
"<"[^>]*">" fprintf(yyout,"%s",yytext);
[$] return 0;
. ;
%%
int yywrap(){}

int main(int args,char **argv)
{
extern FILE *yyin,*yout;
yyout=fopen("op.txt","w");
yylex();
}
