using namespace std;

double pr(double **a, double *b, double *c, int n) {
	for (int i = 0; i < n; ++i) {
		for (int j = 0; j < n; ++j) {
			c[i] += a[i][j]*b[j];
	}	}
	return c;
}
