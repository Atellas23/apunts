#include <iostream>
#include <vector>

using namespace std;

int n, m;

void write(const vector<int>& v) {
  for (int x : v) cout << x;
  cout << endl;
}

void gen(int k, vector<int>& seq, int u) {
  if (u > m) return;
  if (k == seq.size()) write(seq);
  else {
    seq[k] = 0; gen(k+1, seq, u);
    seq[k] = 1; gen(k+1, seq, u+1);
} }

int main() {
  cin >> n >> m;
  vector<int> seq(n);
  gen(0, seq, 0); }
