#include <iostream>
#include <fstream>
using namespace std;

double *vector(int);
int esborraVector(double *);
double **matriu(int,int);
int esborraMatriu(double **, int);
int pr(double **, double *, double *, int);

int main(int argc,char *argv[]) {
	cout.setf(ios::fixed);
	cout.precision(5);
	ifstream infile;
	infile.open(argv[1],ifstream::in);
	if (infile.fail()) {
		cerr << "Fatal error: file doesn't exist in directory" << endl;
		exit(-1);
	}
	int n,k,i,j;
	double x;
	infile >> n >> k;
	double **a;
	a = matriu(n);
	for (int h = 0; h < k; ++h) {
		infile >> i >> j >> x;
		a[i][j] = x;
	}
	int q,s;
	infile >> q >> s;
	if (q != n) {
		cerr << "Data error: vector dimension can not be different from matrix dimension." << endl;
		exit(-1);
	}
	double *b = vector(q);
	for (int o = 0; o < s; ++o){
		cin >> i >> x;
		b[i] = x;
	}
		
	ofstream outfile;
	outfile.open("result.dat");
	for (int e = 0; e < n; ++e) outfile << e+1 << ' ' << c[e] << endl;
}
