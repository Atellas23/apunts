echo 1 THREAD:
OMP_NUM_THREADS=1 taskset -c 0 ./initmat
echo --------------------------------------- 
echo 2 THREADS:
OMP_NUM_THREADS=2 taskset -c 0-1 ./initmat
echo --------------------------------------- 
echo 4 THREADS:
OMP_NUM_THREADS=4 taskset -c 0-3 ./initmat
echo --------------------------------------- 
echo 8 THREADS:
OMP_NUM_THREADS=8 taskset -c 0-7 ./initmat
echo --------------------------------------- 

