#include <iostream>
using namespace std;

double *vector(int);
int eraseVector(double *);
void swap_doubles(double& ,double&);

double mod(double x) {
	if (x < 0) return -x;
	return x;
}

void swap_ints(int& i,int& j) {
	int aux = i;
	i = j;
	j = aux;
}

int max_pos(double *row,int n) {
	int pos = 0;
	double max = mod(row[pos]);
	for (int j = 1; j < n; ++j) {
		if (mod(row[j]) > max) {
			max = mod(row[j]);
			pos = j;
		}
	}
	return pos;
}

int escalate_rows_and_compare_and_swap(double **a,int *perm,int k,int n,double tol) {
	double *scaled = vector(n-k);
	for (int i = k; i < n; ++i) {
		double max_i = a[i][max_pos(a[i],n)];
		if (max_i <= tol) {
			cout << "HERE1" << endl;
			return -1;
		}
		scaled[i-k] = a[i][k]/max_i;
	}
	for (int i = 0; i < n-k; ++i) cout << i << ' ' << scaled[i] << endl;
	int M_pos = max_pos(scaled,n);
	cout << scaled[M_pos] << endl;
	if (scaled[M_pos] < tol) {
		cout << "HERE2" << endl;
		return -1;
	}
	int number = 0;
	if (M_pos != 0) {
		swap_ints(perm[k],perm[M_pos]);
		for (int i = k; i < n; ++i) swap_doubles(a[k][i],a[M_pos][i]);
		++number;
	}
	eraseVector(scaled);
	return number;
}

int lu(double **a, int n, int *perm, double tol) {
	int total_swaps = 0;
	for (int k = 0; k < n; ++k) {
		int e = escalate_rows_and_compare_and_swap(a,perm,k,n,tol);
		if (e >= 0) {
			total_swaps += e;
			if (a[k][k] <= tol) {
				cout << "HERE3" << endl;
				return 0;
			}
			for (int i = k+1; i < n; ++i) {
                //~ cout << a[k][k] << endl;
				double m = a[i][k]/a[k][k];
				for (int j = k; j < n; ++j) a[i][j] = a[i][j] - a[k][j]*m;
				a[i][k] = m;
			}
		}
		else return 0;
	}
	if (total_swaps%2 == 1) return -1;
	else return 1;
}
