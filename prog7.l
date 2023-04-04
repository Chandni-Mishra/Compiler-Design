%{
%}
%%
"//"[^\n]*    ;
"/*"([^*]|[*]+[^/])*[*]+"/"      ;
. fprintf(yyout,"%s",yytext);
%%
int yywrap() {}
int main()
{
    extern FILE *yyin,*yyout;
    yyin = fopen("inp.txt","r");
    yyout = fopen("out.txt","w");
    yylex();
    return 0;
}
