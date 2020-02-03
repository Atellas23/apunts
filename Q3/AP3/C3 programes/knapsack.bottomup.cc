#include <iostream>
#include <vector>

using namespace std;

int n, W;
vector<int> v, w;

int main() {
  cin >> n >> W;
  v = w = vector<int>(n);
  vector<vector<int>> m(n+1, vector<int>(W+1, 0));
  for (int& x : v) cin >> x;
  for (int& x : w) cin >> x;
  for (int i = 1; i <= n; ++i) {
    for (int j = 0; j <= W; ++j)
      if (j >= w[i-1])
	m[i][j] = max(v[i-1] + m[i-1][j-w[i-1]], m[i-1][j]);
      else
	m[i][j] = m[i-1][j];
  }
  cout << m[n][W] << endl;
}
