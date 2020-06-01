echo "Indexing(i,j), outer parallel"
echo 1 SW THREADS, 1 HW THREAD
OMP_NUM_THREADS=1 taskset -c 0 ./initmat
echo -----------------------------------
echo 2 SW THREADS, 2 HW THREAD
OMP_NUM_THREADS=2 taskset -c 0,1 ./initmat
echo -----------------------------------
echo 3 SW THREADS, 3 HW THREADS
OMP_NUM_THREADS=3 taskset -c 0,1,2 ./initmat
echo -----------------------------------
echo 4 SW THREADS, 4 HW THREADS
OMP_NUM_THREADS=4 taskset -c 0,1,2,3 ./initmat
echo -----------------------------------

