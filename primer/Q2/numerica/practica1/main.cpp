#include <iostream>
#include <fstream>
using namespace std;

int sistema(double **,double *,double *,int,double);

void swap_doubles(double& a,double& b) {
	double aux = a;
	a = b;
	b = aux;
}

void test(double **a, double *b, int n) {
	ofstream test;
	test.open("test.dat",ofstream::out);
	if (test.fail()) {
		cerr << "Error: could not open file." << endl;
		exit(-1);
	}
	for (int i = 0; i < n; ++i) {
		test << a[i][0];
		for (int j = 1; j < n; ++j) {
			test << ' ' << a[i][j];
		}
		test << "   ----   " << b[i] << endl;
	}
	test.close();
}

double *vector(int n) {
	double *b;
	b = new double[n];
	for (int i = 0; i < n; ++i) b[i] = 0;
	return b;
}

int eraseVector(double *v) {
	delete[](v);
	v = 0;
	return 1;
}

double **matrix(int n,int m) {
	double **a;
	a = new double*[n];
	for (int i = 0; i < n; ++i) {
		a[i] = new double[m];
		for (int j = 0; j < m; ++j) a[i][j] = 0;
	}
	return a;
}

int eraseMatrix(double **a, int n) {
	for (int i = 0; i < n; ++i) {
		delete[](a[i]);
		a[i] = 0;
	}
	delete[](a);
	a = 0;
	return 1;
}


int main(int argc, char *argv[]) {
	ifstream fitxerDades;
	fitxerDades.open(argv[1],ifstream::in);
    if(fitxerDades.fail()) {
		cerr << "Error: data file does not exist in directory." << endl;
		exit(-1);
	}
	cout << "Reading file..." << endl;
	int n,m,i,j;
	fitxerDades >> n >> m;
	double **a = matrix(n,n);
	for (int l = 0; l < m; ++l)
		fitxerDades >> i >> j >> a[i][j];
	int q;
	double *b = vector(n);
	fitxerDades >> q;
	for (int l = 0; l < q; ++l)
		fitxerDades >> j >> b[j];
	fitxerDades.close();
	cout << "File read!" << endl;
	//test(a,b,n);
	double *x = vector(n);
    double tol = 1e-12;
    cout << "Performing decomposition..." << endl << "..." << endl;
    int solved = sistema(a,x,b,n,tol);
	if (solved == 0) {
		cerr << "Matrix is singular!" << endl;
		exit(-1);
	}
	cout << "Decomposition finished and system solved successfully!" << endl << "Writing results to res.dat..." << endl;
	//out
	ofstream results;
	results.open("res.dat",ofstream::out);
	if (results.fail()) {
		cerr << "Error: could not open file." << endl;
		exit(-1);
	}
	results.setf(ios::scientific);
	results.precision(15);
	for (int l = 0; l < n; ++l)
		results << l << ' ' << x[l] << endl;
	results.close();
	test(a,b,n);
	eraseMatrix(a,n);
	eraseVector(b);
	eraseVector(x);
	cout << "Results written successfully!" << endl << "Exiting program." << endl;
}
