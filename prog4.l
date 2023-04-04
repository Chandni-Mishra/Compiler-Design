%{
#include<stdio.h>
#include<string.h>
int key=0,sp=0,op=0,iden=0,n=0;
%}
%%
auto|break|while|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while|main {printf("keyword:%s\n",yytext);key++;}
[{};,()]  {printf("separators:%s\n",yytext);sp++; }
[a-zA-Z_][a-zA-Z0-9_]*  {printf("identifier:%s\n",yytext);iden++; }
"<="|"=="|"="|"++"|"-"|"*"|"+""("|")"|","  {printf("Operators:%s\n",yytext);op++; }
-?[0-9]+"."[0-9]+ {n++;printf("Float: %s\n",yytext);}
-?[0-9]+ {n++;printf("Integer: %s\n",yytext);}
[$] {return 0;}
%%
int yywrap() {}
int main()
{
    printf("Enter the input:\n");
    yylex();
    printf("\nKeywords:%d\n",key);
    printf("\nIdentifer:%d\n",iden);
    printf("\nSeparator:%d\n",sp);
    printf("Operators:%d\n",op);
    return 0;
}
