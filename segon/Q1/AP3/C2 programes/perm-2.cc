#include <iostream>
#include <vector>

using namespace std;

void write(vector<int>& s) {
    cout << "(" << s[0];
    for (int i = 1; i < s.size(); ++i)
      cout << "," << s[i];
    cout << ")" << endl;
}

void gen(int k, vector<int>& s, vector<bool>& mkd) {
  int n = s.size();
  if (k == n) /*write(s)*/;
  else {
    for (int v = 1; v <= n; ++v) {
      if (not mkd[v]) {
	mkd[v] = true;
	s[k] = v;
        gen(k+1, s, mkd);
	mkd[v] = false;
      }
    }
  }
}

int main() {
  int n;
  cin >> n;
  vector<int> s(n);
  vector<bool> mkd(n+1, false);
  gen(0, s, mkd);
}

