/* add.c */
#include <stdio.h>
#include <add_function.h>
#include <stdlib.h>
void usage()
{
    printf("Usage: add num1 num2\n");
    exit(0);
}
void main(int argc,char *argv[])
{
    int num1,num2,result;
    printf("hello world! \n");
    printf("This program add two numbers\n");
    if (argc!=3) usage();
    printf("I’m %s and my arguments are %s and %s\n", argv[0],argv[1],argv[2]);
    num1=atoi(argv[1]); /* First argument */
    num2=atoi(argv[2]); /* Second argument */
    result=add(num1,num2);
    printf("The result is %d\n",result);
}

