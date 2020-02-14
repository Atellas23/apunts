#include <iostream>
#include <vector>

using namespace std;

void write(vector<int>& s) {
    cout << "(" << s[0];
    for (int i = 1; i < s.size(); ++i)
      cout << "," << s[i];
    cout << ")" << endl;
}

bool legal(vector<int>& s, int k) {
  for (int i = 0; i < k; ++i)
    if (s[i] == s[k])
      return false;
  return true;
}

void gen(int k, vector<int>& s) {
  int n = s.size();
  if (k == n) /*write(s)*/;
  else {
    for (int v = 1; v <= n; ++v) {
      s[k] = v;
      if (legal(s, k)) {
        gen(k+1, s);
      }
    }
  }
}

int main() {
  int n;
  cin >> n;
  vector<int> s(n);
  gen(0, s);
}

