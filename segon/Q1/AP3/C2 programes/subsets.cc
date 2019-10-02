#include <iostream>
#include <vector>
using namespace std;

vector<string> s;

void write(const vector<int>& seq) {
  cout << '{';
  string aux = "";
  for (int i = 0; i < seq.size(); ++i)
    if (seq[i]) {
      cout << aux << s[i];
      aux = ",";
    }
  cout << '}' << endl;
}

void gen(int k, vector<int>& seq) {
  if (k == seq.size()) write(seq);
  else {
    seq[k] = 0; gen(k+1, seq);
    seq[k] = 1; gen(k+1, seq);
  }
}

int main() {
  int n;
  cin >> n;
  s = vector<string>(n);
  for (auto& si : s) cin >> si;
  vector<int> seq(n);
  gen(0, seq);
}
