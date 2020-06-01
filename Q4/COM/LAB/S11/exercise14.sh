OMP_NUM_THREADS=1 ./matrix.sse2 2> sse2.1
OMP_NUM_THREADS=1 ./matrix.avx2 2> avx2.1
./matrix.sse2 2> sse2.any
./matrix.avx2 2> avx2.any
