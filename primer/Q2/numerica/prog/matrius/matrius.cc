using namespace std;

double *vector(int n) {
	double *b;
	b = new double[n];
	return b;
}

int esborraVector(double *v) {
	delete[](v);
	v = NULL;
	return 1;
}

double **matriu(int n) {
	double **a;
	a = new double*[n];
	for (int i = 0; i < n; ++i) a[i] = new double[n];
	return a;
}

int esborraMatriu(double **a, int n) {
	for (int i = 0; i < n; ++i) {
		delete[](a[i]);
		a[i] = NULL;
	}
	delete[](a);
	a = NULL;
	return 1;
}
