#include <iostream>
#include <vector>
#include <algorithm> // For random_shuffle(), srand()
#include <numeric>   // For iota()
#include <time.h>    // For time()
#include <assert.h>  

using namespace std;

int n, W;
vector<int> v, w;

// Returns a random number in the interval [l, u].
int random(int l, int u) { return l + rand() % (u-l+1); }

int value(const vector<int>& s) {
  int cur_v = 0;
  for (int k = 0; k < n; ++k)
    if (s[k]) 
      cur_v += v[k];
  return cur_v;
}  

int weight(const vector<int>& s) {
  int cur_w = 0;
  for (int k = 0; k < n; ++k)
    if (s[k]) 
      cur_w += w[k];
  return cur_w;
}  

vector<int> generateInitialSolution() {
  vector<int> s(n, 0), p(n);
  iota(p.begin(), p.end(), 0);        // p = {0, 1, 2, ..., n-1}
  random_shuffle(p.begin(), p.end()); // p = random_permutation(p)
  int left = W;
  for (int k = 0; k < n; ++k) 
    if (w[p[k]] <= left) {
      s[p[k]] = 1;
      left -= w[p[k]];
    }
  assert(weight(s) <= W);
  return s;
}

// Returns true if s was improved, false otherwise
bool improve1(vector<int>& s) {
  vector<int> sup;
  int cur_w = weight(s);
  int cur_v =  value(s);
  for (int k = 0; k < n; ++k)
    if (s[k]) 
      sup.push_back(k);

  assert(cur_w <= W);
  assert(not sup.empty());
  int i = sup[random(0, sup.size()-1)]; // Object to replace.
  assert(s[i]);
  bool found = false;

  // First improvement
  for (int j = 0; j < n and not found; ++j) {
    if (not s[j] and cur_w - w[i] + w[j] <= W and v[i] < v[j]) {
      found = true;
      s[i] = 0;
      s[j] = 1;
      cout << "Found solution with value "  << cur_v - v[i] + v[j] << endl;
    }
  }
  
  // // Best improvement
  // int b = i;
  // for (int j = 0; j < n; ++j) {
  //   if (not s[j] and cur_w - w[i] + w[j] <= W and v[b] < v[j]) {
  //     found = true;
  //     b = j;
  //     cout << "Found solution with value "  << cur_v - v[i] + v[j] << endl;
  //   }
  // }
  // s[i] = 0;
  // s[b] = 1;

  if (found) cout << endl;
  assert(weight(s) <= W);
  return found;
}


// Returns true if s was improved, false otherwise
bool improve2(vector<int>& s) {
  vector<int> sup;
  int cur_w = weight(s);
  int cur_v =  value(s);
  for (int k = 0; k < n; ++k)
    if (s[k]) 
      sup.push_back(k);

  assert(cur_w <= W);
  assert(not sup.empty());
  int i = sup[random(0, sup.size()-1)]; // Object to replace.
  assert(s[i]);
  bool found = false;

  // First improvement
  for (int j = 0; j < n and not found; ++j) {
    for (int k = j+1; k < n and not found; ++k) {
      if (not s[j] and
          not s[k] and
          cur_w - w[i] + w[j] + w[k] <= W
          and v[i] < v[j] + v[k]) {
        found = true;
        s[i] = 0;
        s[j] = 1;
        s[k] = 1;
        cout << "Found solution with value "  << cur_v - v[i] + v[j] + v[k] << endl;
      }
    }
  }

  if (found) cout << endl;
  assert(weight(s) <= W);
  return found;
}


bool improve(vector<int>& s) {
  return improve1(s) /*or improve2(s)*/;
}

int basicLocalSearch() {
  vector<int> s = generateInitialSolution();
  while (improve(s)) ;
  return value(s);
}

int main() {
  int rs = time(NULL); // Number of secs since 00:00 Jan 1, 1970
                       // This will be different for every execution
  srand(rs);           // Sets random seed to rs, so random generation
                       // will behave differently at each execution.
  cin >> n >> W;
  v = w = vector<int>(n);
  for (int& x : v) cin >> x;
  for (int& x : w) cin >> x;
  cout << basicLocalSearch() << endl;
}
