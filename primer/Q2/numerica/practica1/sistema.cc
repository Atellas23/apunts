#include <fstream>
using namespace std;

int sistema(double **a, double x[], double b[], int n, double tol) {
	int *perm;
	perm = new int[n];
	for (int i = 0; i < n; ++i) perm[i] = i;
    if (lu(a,n,perm[],tol) == 0) return 0;
}
