using namespace std;

double *vector(int n) {
	double *b;
	b = new double[n];
	return b;
}

int esborraVector(double *v) {
	delete[](v);
	v = 0;
	return 1;
}

double **matriu(int n,int m) {
	double **a;
	a = new double*[n];
	for (int i = 0; i < n; ++i) a[i] = new double[m];
	return a;
}

int esborraMatriu(double **a, int n) {
	for (int i = 0; i < n; ++i) {
		delete[](a[i]);
		a[i] = 0;
	}
	delete[](a);
	a = 0;
	return 1;
}
