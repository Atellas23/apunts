#include <omp.h>
#include <cstdio>
#include <unistd.h>

int main(int argc, char **argv) {
	int a; // declare a
	#pragma omp parallel num_threads(10)
	{
		#pragma omp critical
		{
			a = omp_get_thread_num();
			sleep(1);
			printf("Hello world %d\n", a);
		}
		#pragma omp barrier
		printf("I am done %d\n", (int)omp_get_thread_num());
	}
}
