#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

char buffer[2];
char command[256];

int main (int argc, char * argv[])
{
   int res;

   // system call
   res = read (0, buffer, 2);


   unsigned long long i;
   for (i=0; i < 10*1024*1024*1024L; i++) {
	   ;
   }

   if (res > 0) {
      // system call
      write (1, buffer, res);
   }

   sprintf (command, "cat /proc/%d/status", getpid());
   system(command);

   // exception
   res = res - 2;

   // possible exception ... divide by 0
   printf ("result %d\n", 8/res);

   return 0;
}
