#include <iostream>
#include <vector>
using namespace std;

void write(const vector<int>& v) {
  for (int x : v) cout << x;
  cout << endl;
}

void gen(int k, vector<int>& seq) {
  if (k == seq.size()) write(seq);
  else {
    seq[k] = 0; gen(k+1, seq);
    seq[k] = 1; gen(k+1, seq);
} }

int main() {
  int n;
  cin >> n;
  vector<int> seq(n);
  gen(0, seq); }
