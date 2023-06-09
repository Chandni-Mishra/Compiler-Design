%s A B C F 
%% 
<INITIAL>\n printf(" accepted\n");BEGIN INITIAL; 
<INITIAL>a BEGIN A; 
<INITIAL>b BEGIN B; 
<A>a BEGIN INITIAL; 
<A>b BEGIN C; 
<A>\n BEGIN INITIAL; printf(" not accepted\n"); 
<B>a BEGIN C; 
<B>b BEGIN INITIAL; 
<B>\n BEGIN INITIAL; printf(" not accepted\n"); 
<C>a BEGIN B; 
<C>b BEGIN A; 
<C>\n BEGIN INITIAL; printf(" not accepted\n"); 
<A>[^ab\n] BEGIN F; 
<B>[^ab\n] BEGIN F; 
<C>[^ab\n] BEGIN F; 
<INITIAL>[^ab\n] BEGIN F; 
<F>[^\n] BEGIN F; 
<F>[\n] BEGIN INITIAL;printf("Invalid Input\n"); 
END {return 0;}
%% 
int yywrap() {}
int main() 
{ printf( "Enter the String of a and b only:\n "); 
yylex(); 
}
