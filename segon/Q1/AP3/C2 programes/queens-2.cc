#include <iostream>
#include <vector>

using namespace std;

int n;
vector<int> t, mc, md1, md2;

void write() {
  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < n; ++j)
      cout << (t[i] == j ? "Q" : ".");
    cout << endl;
  }
  cout << endl;
}

int diag1(int i, int j) { return i+j; }
int diag2(int i, int j) { return i-j + n-1; }

void reines(int i) {
  if (i == n) write();
  else
    for (int j = 0; j < n; ++j)
      if (not mc[j] and not md1[diag1(i, j)] and not md2[diag2(i, j)]) {
	t[i] = j;
	mc[j] = md1[diag1(i, j)] = md2[diag2(i, j)] = true;
	reines(i+1);
	mc[j] = md1[diag1(i, j)] = md2[diag2(i, j)] = false;
      }
}

int main() {
  cin >> n;
  t = vector<int>(n);
  mc = vector<int>(n, false);
  md1 = md2 = vector<int>(2*n-1, false);
  reines(0);
}
