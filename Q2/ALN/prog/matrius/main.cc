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
		cerr << "Error: file doesn't exist in directory" << endl;
		exit(-1);
	}
	int n,m,i,j;
	double x;
	infile >> n >> m;
	double **a = matriu(n,n);
	for (int k = 0; k < m; ++k) infile >> i >> j >> a[i][j];
	infile >> m;
	double *b = vector(n);
	for (int k = 0; k < m; ++k){
		infile >> i >> b[i];
	}
	infile.close();
	double *c = vector(n);
	pr(a,b,c,n);
	ofstream outfile;
	outfile.open("result.dat",ofstream::out);
	if (outfile.fail()) {
		cerr << "Error: output file could not be opened." << endl;
		exit (-1);
	}
	for (int e = 0; e < n; ++e) outfile << e+1 << ' ' << c[e] << endl;
	esborraMatriu(a,n);
	esborraVector(b);
	esborraVector(c);
	outfile.close();
	return 0;
}
