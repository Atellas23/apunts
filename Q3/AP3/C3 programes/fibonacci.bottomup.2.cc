#include <iostream>
#include <vector>

using namespace std;

int main() {
  int n;
  cin >> n;
  if (n <= 1) cout << 1 << endl;

  int p = 1;
  int f = 1;
  for (int k = 2; k <= n; ++k) {
    int t = p;
    p = f;
    f += t;
  }
  cout << f << endl;
}
