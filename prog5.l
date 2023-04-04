%{
    int ln = 0,sp=0,wr=0,total=0;
%}
%%
["\n"] {ln++;wr++;}
["\t"] {sp++;wr++;}
[" "] {sp++;wr++;}
[^\n\t] {total++;}
EOF {return 0;}
%%
int yywrap() {}
int main()
{
    extern FILE *yyin;
    yyin = fopen("Input.txt","r");
    yylex();
    printf("Total character:%d\nTotal lines:%d\nTotal spaces:%d\nTotal WORDS:%d",total,ln,sp,wr);
    return 0;
}
