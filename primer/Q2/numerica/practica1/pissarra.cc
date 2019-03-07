#include <iostream>
#include <fstream>
using namespace std;

int main(int argc, char *argv[]) {
    ifstream fitxerDades;
    fitxerDades.open(argv[1],ifstream::in);
    if(fitxerDades.fail()) {
        cerr << "Error 404: logic not found." << endl;
        exit(-1);
    }
    int n,m,j,k;
    double x;
    fitxerDades >> n >> m;
    cout << n << ' ' << m << endl;
	double **a;
	a = (double**)malloc(sizeof(double*)*n);
	for (int i = 0; i < n; ++i) a[i] = (double*)malloc(sizeof(double)*n);
    for (int i = 0; i < m; ++i) {
        fitxerDades >> j >> k >> x;
		a[j][j] = x;
        cout << i << ' ' << j << ' ' << k << ' ' << x << endl;
    }
}
