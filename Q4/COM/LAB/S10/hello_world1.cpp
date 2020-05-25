#include <omp.h>
#include <cstdio>

int main(int argc, char **argv) {
	#pragma omp parallel num_threads(10)
	printf("Hi, I'm thread number %d!\n", (int)omp_get_thread_num());
}
