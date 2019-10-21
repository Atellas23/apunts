#include <iostream>

using namespace std;

int fib(int k) {
  if (k <= 1) return 1;
  return fib(k-2) + fib(k-1);
}

int main() {
  int n;
  cin >> n;
  cout << fib(n) << endl;
}
