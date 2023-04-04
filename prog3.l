%{

%}

DIGIT [0-9]

%%
{DIGIT}* {ECHO;printf(" is an Integer");}
{DIGIT}*?\.{DIGIT}* {ECHO;printf(" is Float");}
%%

int yywrap() {}
 
int main()
{
    yylex();
    return 0;
}
