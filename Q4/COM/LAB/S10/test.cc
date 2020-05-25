#include <omp.h>
#include <iostream>
using namespace std;

int main(int argc, char **argv) {
	#pragma omp parallel num_threads(10)
	{
		int id = omp_get_thread_num();
		printf("Hi, I'm thread number %d!\n", id);
	}
}
