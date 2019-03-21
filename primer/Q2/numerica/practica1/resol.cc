using namespace std;

void resol(double **a, double x[], double b[], int n, int perm[]) {
    x[n] = b[n]/a[n][n];
    for (int i = 0; i < n; ++i) {
        double res = b[i];
        for (int j = i+1; j < n; ++j) res -= a[i][j]*x[j];
        res /= a[i][i];
        x[i] = res;
    }
}
