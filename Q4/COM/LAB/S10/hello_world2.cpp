#include <omp.h>
#include <cstdio>
#include <unistd.h>

int main(int argc, char **argv) {
	int a; // declare a
	#pragma omp parallel num_threads(10) shared(a)
	{
		#pragma omp for
		for (int i = 0; i < 10; ++i) {
			// critical section starts here
			#pragma omp critical
			{
				a = i;
				sleep(1);
				printf("Hello world %d vs %d by %d\n", i, a, (int)omp_get_thread_num());
			}
		}
	}
}
