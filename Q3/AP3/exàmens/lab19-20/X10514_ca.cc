#include <iostream>
#include <vector>
#include <climits>

using namespace std;

using   VI = vector<int>;
using  VVI = vector<VI>;
using VVVI = vector<VVI>;

const int    oo = INT_MAX;
const int UNDEF = -1;

int n;
VI p, c, m;
VVVI t;

int max_productivity(int i, int b, int a) {
  if (b < 0 or a < 0) return -oo;
  int& res = t[i][b][a];
  if (res != UNDEF) return res;
  if (i == 0) return res = 0;
  res = max(max_productivity(i-1, b - c[i-1], a - m[i-1]) + p[i-1],
	    max_productivity(i-1, b, a));
  return res;
}

int main() {
  int b, a; 
  while (cin >> n >> b >> a) {
    p = c = m = VI(n);
    for (int i = 0; i < n; ++i) 
      cin >> p[i] >> c[i] >> m[i];

    t = VVVI(n+1, VVI(b+1, VI(a+1, UNDEF)));
    cout << max_productivity(n, b, a) << endl;
  }
}
