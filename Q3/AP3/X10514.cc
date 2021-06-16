#include <iostream>
#include <vector>

using namespace std;
using vi = vector<int>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;

int n, b, a;
vi p, m, c;

int main() {
  while (cin >> n >> b >> a) {
    c = p = m = vi(n);
    vvvi dp(n + 1, vvi(b + 1, vi(a + 1, 0)));
    for (int i = 0; i < n; ++i)
      cin >> p[i] >> c[i] >> m[i];

    for (int i = 1; i <= n; ++i) {
      for (int j = 0; j <= b; ++j) {
        for (int k = 0; k <= a; ++k) {
          if (k >= m[i - 1] and j >= c[i - 1])
            dp[i][j][k] = max(p[i - 1] + dp[i - 1][j - c[i - 1]][k - m[i - 1]],
                              dp[i - 1][j][k]);
          else
            dp[i][j][k] = dp[i - 1][j][k];
        }
      }
    }
    cout << dp[n][b][a] << endl;
  }
}
