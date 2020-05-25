#include <omp.h>
#include <vector>
#include <iostream>
#include <algorithm>
#define N 10000
using namespace std;
// #define xivato cout << "estic aquí" << endl;
int nt;

void init_vector(vector<int> &v)
{
#pragma omp parallel for num_threads(nt)
	for (int i = 0; i < (int)v.size(); ++i)
		v[i] = (int)rand();
}

void myswap(int &a, int &b)
{
	int c = a;
	a = b;
	b = c;
}

void parallel_bubble_sort(vector<int> &v)
{
	int n = v.size();
	bool swapped = true;
	while (swapped)
	{
		swapped = false;
#pragma omp parallel num_threads(nt)
#pragma omp for
		for (int i = 1; i < n; ++i)
		{
			if (v[i - 1] > v[i])
			{
				myswap(v[i - 1], v[i]);
				swapped = true;
			}
		}
	}
}

/*void write_vector(const vector<int> &v)
{
	int n = v.size();
	for (int i = 0; i < n; ++i)
		cout << (i ? " " : "") << v[i];
	cout << endl;
}*/

int main(int argc, char **argv)
{
	if (argc != 2)
	{
		cout << "Ús: " << argv[0] << " <number of threads>" << endl;
		exit(1);
	}
	nt = atoi(argv[1]);
	vector<int> v(N, 0);
	init_vector(v);
	// write_vector(v);
	parallel_bubble_sort(v);
	/*vector<int> u(v);
	sort(u.begin(), u.end());
	// testing purposes only
	for (int j = 0; j < N; ++j)
	{
		if (v[j] != u[j])
		{
			cout << "not sorted at " << j << "! :(\n";
			exit(1);
		}
	}
	cout << "sorted!\n";*/
}
