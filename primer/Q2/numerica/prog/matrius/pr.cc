using namespace std;

int pr(double **a, double *b, double *c, int n) {
	for (int i = 0; i < n; ++i) {
		c[i] = 0;
		for (int j = 0; j < n; ++j) {
			c[i] += a[i][j]*b[j];
	}	}
	return -1;
}
