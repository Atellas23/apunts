all: initmat  tim time_usleep1 time_getpid time_openclose time_forkwait matrix.avx2 matrix.sse2 matrix.sse sigpapi

initmat: initmat.cpp
	g++ -fopt-info -fopenmp -g -O3 -o initmat initmat.cpp rusage.cpp


matrix.avx2: matrix.cpp matrix.h
	g++ -mavx2 -mfma -fopt-info-optimized-vec -fopenmp -g -O3 -o matrix.avx2 matrix.cpp

matrix.sse: matrix.cpp matrix.h
	g++ -msse  -fopt-info-optimized-vec -fopenmp -g -O3 -o matrix.sse matrix.cpp

matrix.sse2: matrix.cpp matrix.h
	g++ -msse2  -fopt-info-optimized-vec -fopenmp -g -O3 -o matrix.sse2 matrix.cpp

tim: tim.c
	gcc -g -O3 -o tim tim.c

time_usleep1: time_usleep1.cpp rusage.cpp
	g++ -O3 -o time_usleep1 time_usleep1.cpp rusage.cpp

time_getpid: time_getpid.cpp rusage.cpp
	g++ -O3 -o time_getpid time_getpid.cpp rusage.cpp

time_openclose: time_openclose.cpp rusage.cpp
	g++ -O3 -o time_openclose time_openclose.cpp rusage.cpp

time_forkwait: time_forkwait.cpp rusage.cpp
	g++ -O3 -o time_forkwait time_forkwait.cpp rusage.cpp

sigpapi: sigpapi.c
	gcc -O3 -o sigpapi sigpapi.c -lpapi

enable_hw_counters:
	sudo sh -c 'echo -1 >/proc/sys/kernel/perf_event_paranoid'

clean:
	rm -f initmat matrix.avx2 matrix.sse2 matrix.sse  \
           tim time_usleep1 time_openclose time_getpid time_forkwait sigpapi
