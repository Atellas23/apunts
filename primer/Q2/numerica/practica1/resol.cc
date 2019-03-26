using namespace std;

void swap_doubles(double a,double b) {
	double aux = a;
	a = b;
	b = aux;
}

void permutate(double b[], int perm[], int n) {
	for (int i = 0; i < n; ++i) swap_doubles(b[i],b[perm[i]]);
}

void resol(double **a, double x[], double b[], int n, int perm[]) {
    permutate(b,perm,n);
    x[n] = b[n]/a[n][n];
    for (int i = 0; i < n; ++i) {
        double res = b[i];
        for (int j = i+1; j < n; ++j) res -= a[i][j]*x[j];
        res /= a[i][i];
        x[i] = res;
    }
}
