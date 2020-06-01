#include <stdio.h>
#include <math.h>
#include <time.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/wait.h>
#include "rusage.h"

#define HOWMANY (30000)

int main() {
   int val = 0, res, i;
   struct timespec ts0, ts1, ts2, ts3;

   res = clock_gettime(CLOCK_REALTIME, &ts0);
   if (res < 0) { perror ("clock_gettime"); return 1; }
   double avg_ms = 0;
   for (i = 0; i < HOWMANY; i++) {
      res = clock_gettime(CLOCK_REALTIME, &ts2);
      int pid = fork();
      if (pid < 0) { perror ("fork"); return 1; }
      else if (pid == 0) exit(0);
      else { int wstatus; int w = waitpid(pid, &wstatus, 0); if (w < 0) { perror ("waitpid"); return 1; } }
      res = clock_gettime(CLOCK_REALTIME, &ts3);
      avg_ms += timespec_to_ms(&ts3) - timespec_to_ms(&ts2);
   }
   avg_ms /= HOWMANY;

   res = clock_gettime(CLOCK_REALTIME, &ts1);
   if (res < 0) { perror ("clock_gettime"); return 1; }
   printf ("Time of %d open+close is %.9lf ms\n", HOWMANY, 
           timespec_to_ms(&ts1) - timespec_to_ms(&ts0));
   printf("Also, average time of %d open+close is %.9lf ms, which translates roughly to %.9lf us\n", HOWMANY, avg_ms, avg_ms*1000);
   return 0;
}
