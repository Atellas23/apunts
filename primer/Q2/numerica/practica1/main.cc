#include <iostream>
#include <fstream>
using namespace std;

int main(int argc, char *argv[]) {
	ifstream fitxerDades;
	fitxerDades.open(argv[1],ifstream::in);
    if(fitxerDades.fail()) {
		cerr << "Fatal error: data file doesn't exist in the directory." << endl;
		exit(-1);
	}
	int n,m,j,k;
	double x;
	fitxerDades >> n >> m;
	double **a;
	a = new double*[n];
	for (int i = 0; i < n; ++i) a[i] = new double[n];
	for (int i = 0; i < m; ++i) {
		fitxerDades >> j >> k >> x;
		a[j][k] = x;
	}
	int q;
	double *b;
	fitxerDades >> q;
	b = new double[n];
	for (int i = 0; i < q; ++i) {
		fitxerDades >> j >> x;
		b[j] = x;
	}
	delete[](a);
	a = NULL;
	delete[](b);
	b = NULL;
}
