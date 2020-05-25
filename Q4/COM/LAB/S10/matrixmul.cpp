#include <omp.h>
#include <iostream>
#include <vector>
#include "func.h"
using namespace std;
using vf = vector<float>;
using matrix = vector<vf>;

int size;
int nt;

matrix parallel_mult(const matrix &A, const matrix &B)
{
	matrix C(size, vf(size, 0)); // we initialize the result matrix with zeroes
#pragma omp parallel for collapse(2) num_threads(nt)
	for (int i = 0; i < size; ++i)
	{
		for (int j = 0; j < size; ++j)
			C[i][j] = row(A, i) * col(B, j); // row, col and * overloading for vectors are defined in func.h
	}
	return C;
}

void rand_init(matrix &M)
{
	srand(time(NULL));
#pragma omp parallel for collapse(2) num_threads(nt)
	for (int i1 = 0; i1 < size; ++i1)
	{
		for (int i2 = 0; i2 < size; ++i2)
			M[i1][i2] = (float)rand();
	}
}

void write_matrix(const matrix &M)
{
	for (int i = 0; i < size; ++i)
	{
		for (int j = 0; j < size; ++j)
			cout << (j ? " " : "")
				 << M[i][j]
				 << (j == size - 1 ? "\n" : "");
	}
}

int main(int argc, char **argv)
{
	if (argc < 3)
	{
		cout << "Ús: " << argv[0] << " <num_threads> <size_of_matrix>\n";
		exit(1);
	}
	nt = atoi(argv[1]);
	size = atoi(argv[2]);
	matrix A(size, vf(size, 0)), B(size, vf(size, 0));
	rand_init(A);
	rand_init(B);
	clock_t start = clock();
	matrix C = parallel_mult(A, B);
	double elapsed = double(clock() - start) / CLOCKS_PER_SEC;
	cout << elapsed << endl;
	// write_matrix(C);
}
