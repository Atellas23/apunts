using namespace std;

double *vector(int);

void swap_doubles(double a,double b) {
	double aux = a;
	a = b;
	b = aux;
}

void permutate(double b[], int perm[], int n) {
	for (int i = 0; i < n; ++i) swap_doubles(b[i],b[perm[i]]);
}

void resol(double **a, double x[], double b[], int n, int perm[]) {
<<<<<<< HEAD
	x[n] = b[n]/a[n][n];
	for (int i = 0; i < n; ++i) {
		double res = b[i];
		for (int j = i+1; j < n; ++j) res -= a[i][j]*x[j];
		res /= a[i][i];
		x[i] = res;
	}
=======
	//resolem LUx=Pb en dues parts, Ly=Pb i Ux=y:
    permutate(b,perm,n);
    //part triangular inferior, Ly=Pb
    double *y = vector(n);
    y[0] = b[0];
    for (int i = 1; i < n; ++i) {
		double resy = b[i];
		for (int j = 0; j < i; ++j) resy -= a[i][j]*y[j];
		y[i] = resy;
	}
    //part triangular superior, Ux=y
    x[n-1] = y[n-1]/a[n-1][n-1];
    for (int i = n-2; i > 0; --i) {
        double resx = y[i];
        for (int j = n-1; j > i; --j) resx -= a[i][j]*x[j];
        resx /= a[i][i];
        x[i] = resx;
    }
>>>>>>> 3a0978da98e6ac959ce5ed6db1947e96aefec8f6
}
