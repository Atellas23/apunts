#include <sys/time.h>
#include <time.h>
#include <stdio.h>

int main()
{
 struct timespec ts1;
 struct timeval tv1;
 struct timezone tz;
 time_t t, t1;
 int res1, res2;

   res1 = gettimeofday(&tv1, &tz);
   t1 = time(&t);
   res2 = clock_gettime(CLOCK_REALTIME, &ts1);
   if (res1 < 0) perror("gettimeofday");
   if (t1==-1) perror("time");
   if (t != t1) printf ("t1 %ld t %ld differ!!\n", t1, t);
   if (res2 < 0) perror ("clock_gettime");

   fprintf (stderr, "time: %ld s  gtod %ld %ld spec %ld %ld\n",
      t, tv1.tv_sec, tv1.tv_usec, ts1.tv_sec, ts1.tv_nsec);

   res2 = clock_getres(CLOCK_REALTIME, &ts1);
   if (res2 < 0) perror ("clock_getres");
   fprintf (stderr, " res(REALTIME): %ld %ld\n", 
                   ts1.tv_sec, ts1.tv_nsec);
   
   res2 = clock_getres(CLOCK_MONOTONIC, &ts1);
   if (res2 < 0) perror ("clock_getres");
   fprintf (stderr, " res(MONOTONIC): %ld %ld\n", 
                   ts1.tv_sec, ts1.tv_nsec);
   
   res2 = clock_getres(CLOCK_REALTIME_COARSE, &ts1);
   if (res2 < 0) perror ("clock_getres");
   fprintf (stderr, " res(REALTIME_COARSE): %ld %ld\n", 
                   ts1.tv_sec, ts1.tv_nsec);
   
   res2 = clock_getres(CLOCK_MONOTONIC_COARSE, &ts1);
   if (res2 < 0) perror ("clock_getres");
   fprintf (stderr, " res(MONOTONIC_COARSE): %ld %ld\n", 
                   ts1.tv_sec, ts1.tv_nsec);
   
   res2 = clock_getres(CLOCK_MONOTONIC_RAW, &ts1);
   if (res2 < 0) perror ("clock_getres");
   fprintf (stderr, " res(MONOTONIC_RAW): %ld %ld\n", 
                   ts1.tv_sec, ts1.tv_nsec);
   
   res2 = clock_getres(CLOCK_BOOTTIME, &ts1);
   if (res2 < 0) perror ("clock_getres");
   fprintf (stderr, " res(BOOTTIME): %ld %ld\n", 
                   ts1.tv_sec, ts1.tv_nsec);
   
   res2 = clock_getres(CLOCK_PROCESS_CPUTIME_ID, &ts1);
   if (res2 < 0) perror ("clock_getres");
   fprintf (stderr, " res(PROCESS_CPUTIME): %ld %ld\n", 
                   ts1.tv_sec, ts1.tv_nsec);
   
   res2 = clock_getres(CLOCK_THREAD_CPUTIME_ID, &ts1);
   if (res2 < 0) perror ("clock_getres");
   fprintf (stderr, " res(THREAD_CPUTIME): %ld %ld\n", 
                   ts1.tv_sec, ts1.tv_nsec);
   

   fprintf (stderr, "tz: minuteswest %d    dsttime %d\n",
              tz.tz_minuteswest, tz.tz_dsttime);

   return 0;

}
