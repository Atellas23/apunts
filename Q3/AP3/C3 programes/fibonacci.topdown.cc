#include <iostream>
#include <vector>

using namespace std;

const int UNDEF = -1;

vector<int> f;

int fib(int k) {
  int& res = f[k];
  if (res != UNDEF) return res;
  if (k <= 1) return res = 1;
  return res = fib(k-2) + fib(k-1);
}

int main() {
  int n;
  cin >> n;
  f = vector<int>(n+1, UNDEF);
  cout << fib(n) << endl;
}
