#include <iostream>
#include <vector>

using namespace std;

int n;
vector<int> t;

void write() {
  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < n; ++j)
      cout << (t[i] == j ? "Q" : ".");
    cout << endl;
  }
  cout << endl;
}

bool legal (int i) {
  for (int k = 0; k < i; ++k)
    if (t[k] == t[i] or t[i]-i == t[k]-k or t[i]+i == t[k]+k)
      return false;
  return true;
}

void reines(int i) {
  if (i == n) write();
  else
    for (int j = 0; j < n; ++j) {
      t[i] = j;
      if (legal(i)) {
	reines(i+1);
      }
    }
}

int main() {
  cin >> n;
  t = vector<int>(n);
  reines(0);
}
