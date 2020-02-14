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
    t = vector<vector<lint>>(m, vector<lint>(m));
    for (int i = m-1; i >= 0; i--) {
      t[i][i] = 0;
      for (int j = i+1; j < m; j++) {
	t[i][j] = +oo;
	for (int k = i+1; k <= j; ++k) 
	  t[i][j] = min(t[i][j], t[i][k-1] + t[k][j] + n[i] * n[k] * n[j+1]);
      }
    }
    cout << t[0][m-1] << endl;
  }
}
