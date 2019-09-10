#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main() {
  int k;
  vector<int> v;
  while (cin >> k) v.push_back(k);
  sort(v.begin(), v.end());
  vector<int>::iterator it;
  for (it = v.begin(); it != v.end(); ++it) cout << *it << ' ';
  cout << endl;
}
