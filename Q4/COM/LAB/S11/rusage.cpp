#include <stdio.h>
#include <time.h>
#include <math.h>
#include "rusage.h"

int get_resource_usage(struct rusage *r)
{
   int res = getrusage(RUSAGE_SELF, r);
   if (res < 0)
      perror("getrusage(RUSAGE_SELF)");
   return res;
}

double timeval_to_ms(struct timeval *tv)
{
   return (double)tv->tv_sec * 1000.0 + (double)tv->tv_usec / 1000.0;
}

double timespec_to_ms(struct timespec *ts)
{
   return (double)ts->tv_sec * 1000.0 + (double)ts->tv_nsec / 1000000.0;
}
