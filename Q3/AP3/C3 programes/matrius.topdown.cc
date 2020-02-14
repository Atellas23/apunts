// Problema P11455

#include <iostream>
#include <vector>
#include <limits>

using namespace std;

typedef long long lint;

typedef vector<lint> VL;
typedef vector< VL > VVL;

const int UNDEF = -1;
const lint oo = numeric_limits<lint>::max();

int m;
VL n;
VVL t;

lint cost(int i, int j) {
  lint& r = t[i][j];
  if (r == UNDEF) {
    if (j == i) r = 0;
    else {
      r = +oo;
      for (int k = i+1; k <= j; ++k) {
	lint c = cost(i, k-1) + cost(k, j) + n[i] * n[k] * n[j+1];
	if (c < r) 
	  r = c;
      }
    }
  }
  return r;
}

int main() {
  while (cin >> m) {
    n = VL(m+1);
    for (auto& x : n) cin >> x;

    t = VVL(m, VL(m, UNDEF));
    cout << cost(0, m-1) << endl;
  }
}
