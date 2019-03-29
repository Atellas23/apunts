using namespace std;
using ui = unsigned int;

double *vector(int);
int eraseVector(double *);

ui mod(int x) {
	if (x < 0) return -x;
	return x;
}

void swap_rows(double *r1,double *r2) {
	double *aux = r1;
	r1 = r2;
	r2 = aux;
}

void swap_ints(int i,int j) {
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

int escalate_rows_and_compare_and_swap(double **a,int perm[],int k,int n,double tol) {
	double *scaled = vector(n-k);
	for (int i = k; i < n; ++i) {
		double max_i = a[i][max_pos(a[i],n)];
		if (max_i < tol) return -1;
		scaled[i] = a[i][k]/max_i;
	}
	int M_pos = max_pos(scaled,n);
	int number = 0;
	if (M_pos != 0) {
		swap_ints(perm[k],perm[M_pos]);
		swap_rows(a[k],a[M_pos]);
		++number;
	}
	eraseVector(scaled);
	return number;
}

int lu(double **a, int n, int perm[], double tol) {
	int total_swaps = 0;
	for (int k = 0; k < n; ++k) {
		int e = escalate_rows_and_compare_and_swap(a,perm,k,n,tol);
		if (e != -1) {
			total_swaps += e;
			for (int i = k+1; i < n; ++i) {
				if (mod(a[k][k]) < tol) return 0;
				double m = a[i][k]/a[k][k];
				for (int j = k; j < n; ++j) {
					a[i][j] -= a[k][j]*m;
				}
				a[k+1][k] = m;
			}
		}
		else return 0;
	}
	if (total_swaps%2 == 1) return -1;
	else return 1;
}
