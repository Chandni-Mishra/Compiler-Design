%{
int ch=0, bl=0, ln=0, wr=0;
%}
%%
["\n"] {ln++;wr++;}
["\t"] {bl++;wr++;}
[" "] {bl++;wr++;}
[^\n\t] {ch++;}
END {return 0;}
%%
int yywrap(){}
int main(int argc, char *argv[])
{
	yylex();
	printf("LINES : %d WORDS : %d  CHARACTERS: %d  BLANK:  %d",ln,wr,ch,bl);
	return 0;

}
