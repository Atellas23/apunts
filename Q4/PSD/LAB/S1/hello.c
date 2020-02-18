/* hello.c */
#include <stdio.h>  /* printf */
#include <stdlib.h> /* exit */
#include <string.h> /* strlen */
void main(int argc,char *argv[])
{
    if (argc!=2) exit(1);
    /* Using libc printf */
    printf("hello world! , I'm %s and my argument is %s \n",argv[0],argv[1]);

    /* Using write system call */
    char my_text[256];
    sprintf(my_text,"hello world! , I'm %s and my argument is %s \n",argv[0],argv[1]);
    write(1,my_text,strlen(my_text));
}

