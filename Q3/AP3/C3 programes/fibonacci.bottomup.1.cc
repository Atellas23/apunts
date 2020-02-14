#include <iostream>
#include <vector>

using namespace std;

vector<int> f;

int main() {
  int n;
  cin >> n;
  f = vector<int>(n+1);
  f[0] = f[1] = 1;
  for (int k = 2; k <= n; ++k) 
    f[k] = f[k-2] + f[k-1];
  
  cout << f[n] << endl;
}
