#include <vector>
using namespace std;
using type = float;
using v = vector<type>;
using vv = vector<v>;

type operator*(const v &a, const v &b) {
	type s = 0;
	int n = a.size();
	for (int i = 0; i < n; ++i) s += a[i]*b[i];
	return s;
}

inline v row(const vv& A, int idx) {
	return A[idx];
}

v col(const vv& A, int idx) {
	v temp(A.size());
	for (int j = 0; j < (int)A.size(); ++j)
		temp[j] = A[idx][j];
	return temp;
}
