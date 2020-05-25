#include <stdio.h>
#include <sys/time.h>
#include <malloc.h>
#include <cmath>

#include "rusage.h"

#define SIZE 10240
#define TYPE float
// activate for row-wise accesses
#define ACCESS(i, j) (((i)*SIZE) + (j))
// acivate for column-wise accesses
// #define ACCESS(i, j) (((j)*SIZE) + (i))

int main(int argc, char *argv[])
{
   struct rusage r;
   int res_init = get_resource_usage(&r);
   TYPE *mat = (TYPE *)malloc(SIZE * SIZE * sizeof(TYPE));
   int loop, res, i, j;
   struct timeval tv0, tv1;

   if (mat == NULL)
   {
      perror("malloc");
      return 1;
   }
#pragma omp parallel for
   for (loop = 0; loop < 5; loop++)
   {
      res = gettimeofday(&tv0, NULL);
      if (res < 0)
         perror("gettimeofday");
      for (i = 0; i < SIZE; i++)
      {
         for (j = 0; j < SIZE; j++)
         {
            mat[ACCESS(i, j)] = (TYPE)(1 + i * j);
         }
      }
      res = gettimeofday(&tv1, NULL);
      if (res < 0)
         perror("gettimeofday");
      fprintf(stderr, "ini: %lf us\n",
              tv1.tv_sec * 1000000.0 + tv1.tv_usec -
                  tv0.tv_sec * 1000000.0 - tv0.tv_usec);
   }
   int res_fini = get_resource_usage(&r);
   printf("User mode time: %f\n", timeval_to_ms(&r.ru_utime));
   printf("Maximum resident set size: %ld\n", r.ru_maxrss);
   printf("Number of voluntary context switches: %ld\n", r.ru_nvcsw);
   printf("Number of involuntary context switches: %ld\n", r.ru_nivcsw);
   return 0;
}
