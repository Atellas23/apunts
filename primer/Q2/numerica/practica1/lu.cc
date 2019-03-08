using namespace std;
using ui = unsigned int;

double *vector(int);
int eraseVector(double *);

ui abs(int x) {
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

int max_pos(double *v,int n) {
	int pos = 0;
	double max = v[pos];
	for (int i = 1; i < n; ++i) {
		if (v[i] > max) {
			max = v[i];
			pos = i;
		}
	}
	return pos;
}

int lu(double **a, int n, int perm[], double tol) {
	for (int pas = 0; pas < n; ++pas) {
		//swap corresponding rows and members of *perm (avoid close-to-zero elements)
		double *maxs = vector(n);
	}
}
