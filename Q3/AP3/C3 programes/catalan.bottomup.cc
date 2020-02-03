#include <iostream>
#include <vector>

using namespace std;

int main() {
  int n;
  cin >> n;

  vector<int> t(n+1, 0); // t[i] == #parenthesizations of length i
                           // I.e., (i/2)-th Catalan number
  t[0] = 1;                                   // Empty word. 
  for (int i = 1; i <= n; ++i)                // Rule "(E1) E2".
    for (int len1 = 0; len1 <= i-2; ++len1) { // |E1|, |E2| >= 0.
      int len2 = i-2-len1;                    // |E1| + |E2| + 2 = i.
      t[i] += t[len1] * t[len2];
    }

  cout << t[n] << endl;
}
