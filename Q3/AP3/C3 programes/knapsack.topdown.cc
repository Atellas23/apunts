#include <iostream>
#include <vector>

using namespace std;

int n, W;
vector<int> v, w;
vector<vector<int>> m;

const int UNDEF = -1;

int opt(int k, int W) {
  int& res = m[k][W];
  if (res != UNDEF) return res;
  if (k == 0) return res = 0;
  if (w[k-1] > W) return res = opt(k-1, W);
  else            return res = max(v[k-1] + opt(k-1, W - w[k-1]), opt(k-1, W)); 
}

int main() {
  cin >> n >> W;
  v = w = vector<int>(n);
  m = vector<vector<int>>(n+1, vector<int>(W+1, -1));
  for (int& x : v) cin >> x;
  for (int& x : w) cin >> x;
  cout << opt(n, W) << endl;
}
