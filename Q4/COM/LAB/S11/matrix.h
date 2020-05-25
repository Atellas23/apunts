#include <iostream>
#include <stdlib.h>

template <class T, int d0, int d1>
class matrix {

   public:
     T data[d0][d1];


       // no-argument constructor, initializes the matrix to 0.0
     matrix()
     {
        int i, j;
        std::clog << "matrix constructor" << std::endl;
        for (i=0; i < d0; i++) {
           for (j=0; j < d1; j++) {
              data[i][j] = (T) 0.0;
           }
        }
        std::clog << "matrix constructor ends" << std::endl;
     }

       // seeded constructor, uses the seed to initialize the matrix
       // with random numbers
     matrix(unsigned int seed)
     {
        int i, j;
        srandom(seed);
        std::clog << "matrix constructor" << std::endl;
        for (i=0; i < d0; i++) {
           for (j=0; j < d1; j++) {
              data[i][j] = (T) random() / RAND_MAX;
           }
        }
        std::clog << "matrix constructor ends" << std::endl;
     }

       // matrix product, no blocking
     void product(matrix * A, matrix * B)
     {
        struct timeval tv0, tv1;
        int i, j, k;
        int res;

        res = gettimeofday(&tv0, NULL);
        if (res < 0) perror("gettimeofday");
#pragma omp parallel for private(i, j, k) schedule(static)
        for (i=0; i < d0; i++) {
              for (k=0; k < d1; k++) {
#pragma omp simd
           for (j=0; j < d1; j++) {
                 data[i][j] += A->data[i][k] * B->data[k][j];
              }
           }
        }
        res = gettimeofday(&tv1, NULL);
        if (res < 0) perror("gettimeofday");
        tv1.tv_sec -= tv0.tv_sec;
        tv0.tv_sec =  0;
        double t = tv1.tv_sec*1000000.0 + tv1.tv_usec - tv0.tv_usec;
        fprintf (stderr, "matmul: %lf us %lf GFlops\n",
                             t, 2.0*d0*d1*d1 / t / 1e3);
     }

     void product_transposed(matrix * A, matrix * B)
     {
        struct timeval tv0, tv1;
        int i, j, k;
        int res;

        res = gettimeofday(&tv0, NULL);
        if (res < 0) perror("gettimeofday");
#pragma omp parallel for private(i, j, k) schedule(static)
           for (j=0; j < d1; j++) {
              for (k=0; k < d1; k++) {
#pragma omp simd
        for (i=0; i < d0; i++) {
                 data[j][i] += A->data[i][k] * B->data[k][j];
              }
           }
        }
        res = gettimeofday(&tv1, NULL);
        if (res < 0) perror("gettimeofday");
        tv1.tv_sec -= tv0.tv_sec;
        tv0.tv_sec =  0;
        double t = tv1.tv_sec*1000000.0 + tv1.tv_usec - tv0.tv_usec;
        fprintf (stderr, "matmul: %lf us %lf GFlops\n",
                             t, 2.0*d0*d1*d1 / t / 1e3);
     }

       // matrix product, with blocks BSIZE x BSIZE
       // BSIZE needs to divide d0 and d1
       // with a reduction in k loop
     void product_reduction(matrix * A, matrix * B, int BSIZE)
     {
        struct timeval tv0, tv1;
        int i, j, k, I, J, K;
        int res;

        res = gettimeofday(&tv0, NULL);
        if (res < 0) perror("gettimeofday");
#pragma omp parallel for private(I, J, K, i, j, k) schedule(static)
        for (I=0; I < d0; I += BSIZE) {
           for (J=0; J < d1; J += BSIZE) {
              for (K=0; K < d1; K += BSIZE) {
                for (i=I; i < I+BSIZE; i++) {
                   for (j=J; j < J+BSIZE; j++) {
                      T val = data[i][j];
#pragma omp simd reduction(+:val)
                      for (k=K; k < K+BSIZE; k++) {
                         val += A->data[i][k] * B->data[k][j];
                      }
                      data[i][j] = val;
                   }
                }
              }
           }
        }
        res = gettimeofday(&tv1, NULL);
        if (res < 0) perror("gettimeofday");

        tv1.tv_sec -= tv0.tv_sec;
        tv0.tv_sec =  0;
        double t = tv1.tv_sec*1000000.0 + tv1.tv_usec - tv0.tv_usec;
        fprintf (stderr, "matmul: %lf us %lf GFlops\n",
                             t, 2.0*d0*d1*d1 / t / 1e3);
     }

       // matrix product, with blocks BSIZE x BSIZE
       // BSIZE needs to divide d0 and d1
       // with loop interchange to avoid the reduction
     void product(matrix * A, matrix * B, int BSIZE)
     {
        struct timeval tv0, tv1;
        int i, j, k, I, J, K;
        int res;

        res = gettimeofday(&tv0, NULL);
        if (res < 0) perror("gettimeofday");
#pragma omp parallel for private(I, J, K, i, j, k) schedule(static)
        for (I=0; I < d0; I += BSIZE) {
           for (J=0; J < d1; J += BSIZE) {
              for (K=0; K < d1; K += BSIZE) {
                for (i=I; i < I+BSIZE; i++) {
                      for (k=K; k < K+BSIZE; k++) { // inner loop k moved here
#pragma omp simd
                   for (j=J; j < J+BSIZE; j++) {  // j loop moved as inner-most
                         data[i][j] += A->data[i][k] * B->data[k][j];
                      }
                   }
                }
              }
           }
        }
        res = gettimeofday(&tv1, NULL);
        if (res < 0) perror("gettimeofday");

        tv1.tv_sec -= tv0.tv_sec;
        tv0.tv_sec =  0;
        double t = tv1.tv_sec*1000000.0 + tv1.tv_usec - tv0.tv_usec;
        fprintf (stderr, "matmul: %lf us %lf GFlops\n",
                             t, 2.0*d0*d1*d1 / t / 1e3);
     }


     void display(void)
     {
        int i, j;
        if ( d1*d0 <= 4 ) {
           for (i=0; i < d0; i++) {
              for (j=0; j < d1; j++) {
                 std::clog << data[i][j] << " ";
              }
              std::clog << std::endl;
           }
        }
     }

};
