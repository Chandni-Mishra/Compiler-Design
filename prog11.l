%{ 
%}
%s A B C D E
%%
<INITIAL>[0-9] BEGIN A;
<INITIAL>[a-zA-Z_] BEGIN B;
<INITIAL>[.] BEGIN C;
<INITIAL>[^a-zA-Z0-9_.\n] BEGIN D;
<INITIAL>\n BEGIN INITIAL; {printf("Not accepted\n");}

<A>[.] BEGIN C;
<A>[a-zA-Z_] BEGIN E;
<A>[0-9] BEGIN A;
<A>\n BEGIN INITIAL; printf("Integer\n");
<A>[^a-zA-Z0-9_.\n] BEGIN D;

<B>[.] BEGIN E;
<B>[a-zA-Z_] BEGIN B;
<B>[0-9] BEGIN B;
<B>\n BEGIN INITIAL; printf("Identifier\n");
<B>[^a-zA-Z0-9_.\n] BEGIN D;

<C>[0-9]* BEGIN C;
<C>[a-zA-Z_] BEGIN E;
<C>[.] BEGIN E;
<C>\n BEGIN INITIAL; printf("Float\n");
<C>[^a-zA-Z0-9_.\n] BEGIN D;

<E>[a-zA-Z0-9_.] BEGIN E;
<E>[^a-zA-Z0-9_.\n] BEGIN D;
<E>\n BEGIN INITIAL; printf("Not accepted\n");

<D>[^\n] BEGIN D;
<D>\n BEGIN INITIAL; printf("Invalid\n");

END return 0;
%%
int yywrap() {}
int main(){
    printf("Enter strings\n");
    yylex();
}
