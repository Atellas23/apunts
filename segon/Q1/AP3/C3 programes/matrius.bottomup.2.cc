// Problema P11455

#include <iostream>
#include <vector>
#include <limits>

using namespace std;

typedef long long lint;

const lint oo = numeric_limits<lint>::max();

vector<lint> n;
vector<vector<lint>> t;

int main() {
  int m;
  while (cin >> m) {
    n = vector<lint>(m+1);
    for (auto& x : n) cin >> x;
    t = vector<vector<lint>>(m, vector<lint>(m, 0));
    for (int l = 2; l <= m; ++l) {     // j = i+l-1
      for (int i = m-l; i >= 0; i--) { // i <= m-l  iff  j <= m-1 
	int j = i + l - 1;
	t[i][j] = +oo;
	for (int k = i+1; k <= j; ++k) {
	  t[i][j] = min(t[i][j], t[i][k-1] + t[k][j] + n[i] * n[k] * n[j+1]);
	}
      }
    }
    cout << t[0][m-1] << endl;
  }
}
