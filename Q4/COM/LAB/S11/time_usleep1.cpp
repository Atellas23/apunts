#include <stdio.h>
#include <math.h>
#include <time.h>
#include <unistd.h>
#include "rusage.h"

#define HOWMANY (300000)

int main()
{
   int val =0, res, i;
   struct timespec ts0, ts1;

   res = clock_gettime(CLOCK_REALTIME, &ts0);
   if (res < 0) { perror ("clock_gettime"); return 1; }

   for (i=0; i <HOWMANY; i++) {
      usleep(1);
   }

   res = clock_gettime(CLOCK_REALTIME, &ts1);
   if (res < 0) { perror ("clock_gettime"); return 1; }
   printf ("Time of %d usleep(1) is %.9lf ms\n", HOWMANY, 
           timespec_to_ms(&ts1) - timespec_to_ms(&ts0));

   return 0;
}
