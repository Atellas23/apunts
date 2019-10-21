#include <iostream>
#include <vector>

using namespace std;

const int UNDEF = -1;

vector<int> t;

int num(int i) {   // Returns #parenthesizations of length i
  int& res = t[i]; // I.e., (i/2)-th Catalan number
  if (res != UNDEF) return res;
  if (i == 0) return res = 1; // Empty word.
  else {                      // Rule "(E1) E2".
    res = 0;
    for (int len1 = 0; len1 <= i-2; ++len1) {
      int len2 = i-2-len1;          // |E1| + |E2| + 2 = i.
      res += num(len1) * num(len2); // Cartesian product.
    }
    return res;
} }

int main() {
  int n;
  cin >> n;
  t = vector<int>(n+1, UNDEF);
  cout << num(n) << endl;}
