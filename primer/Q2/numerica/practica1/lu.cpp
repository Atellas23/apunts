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

int maxp2(double *v,int n,int k) {
	int res = k;
	double m = mod(v[k]);
	for (int i = k+1; i < n; ++i) if (m < mod(v[i])) {
		res = i;
		m = mod(v[i]);
	}
	return res;
}

int max_pos(double *row,int n) {
	int pos = 0;
	double max = mod(row[pos]);
	for (int j = pos+1; j < n; ++j) {
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
		double max_i = mod(a[i][maxp2(a[i],n,k)]);
		if (max_i <= tol) {
			//cout << "HERE1" << endl;
			return -1;
		}
		scaled[i-k] = mod(a[i][k]/max_i);
	}
	for (int i = 0; i < n; ++i) cout << ' ' << scaled[i] << ';';
	int M_pos = max_pos(scaled,n-k);
	cout << endl << "The max this round is: " << scaled[M_pos] << endl;
	if (scaled[M_pos] < tol) {
		//cout << "HERE2" << endl;
		return -1;
	}
	int number = 0;
	if (M_pos != 0) {
		swap_ints(perm[k],perm[k+M_pos]);
		for (int i = 0; i < n; ++i) swap_doubles(a[k][i],a[k+M_pos][i]);
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
			if (mod(a[k][k]) <= tol) {
				//cout << "HERE3" << endl;
				return 0;
			}
			for (int i = k+1; i < n; ++i) {
				double m = a[i][k]/a[k][k];
				for (int j = k; j < n; ++j) a[i][j] = a[i][j] - a[k][j]*m;
				a[i][k] = m;
			}
		cout << endl;
		}
		else return 0;
	}
	if (total_swaps%2 == 1) return -1;
	else return 1;
}
