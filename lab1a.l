%{
    #include<stdio.h>
    #include<string.h>
    int nooper=0,nooperand=0,i=0,j=0,valid=0;
    char oper[10][10],operand[10][10];
%}
%%
"(" valid++;
")" valid--;
[0-9]+ {nooperand++;strcpy(operand[i++],yytext);}
"+"|"*" {nooper++;strcpy(oper[j++],yytext);}
[^+*]"("[^0-9] YYFAIL();
. YYFAIL();
%%
void main()
{
    int k;
    printf("Enter the expression:");
    yylex();
    if(valid==0 && (nooperand-nooper)==1)
    {
        printf("\n The expression is valid");
        printf("The number of operators are %d",nooper);
        printf("\n The operators are \n");
        for(k=0;k<j;k++)
            printf("%s\n",oper[k]);
        printf("The number of operands are %d",nooperand);
        printf("\n The operands are \n");
        for(k=0;k<i;k++)
            printf("%s\n",operand[k]);
    }
    else
        printf("The expression is invalid");
}

int YYFAIL()
{
    printf("Invalid\n");
    exit(0);
}