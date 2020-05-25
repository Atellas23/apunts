echo 2 SW THREADS, 1 HW THREAD
OMP_NUM_THREADS=2 taskset -c 0 ./initmat
echo -----------------------------------
echo 4 SW THREADS, 1 HW THREAD
OMP_NUM_THREADS=4 taskset -c 0 ./initmat
echo -----------------------------------
echo 4 SW THREADS, 2 HW THREADS
OMP_NUM_THREADS=4 taskset -c 0-1 ./initmat
echo -----------------------------------
echo 4 SW THREADS, 3 HW THREADS
OMP_NUM_THREADS=4 taskset -c 0-2 ./initmat
echo -----------------------------------

