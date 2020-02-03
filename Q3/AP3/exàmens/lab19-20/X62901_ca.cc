#include <iostream>
#include <vector>

using namespace std;

int n, m;
vector<int> e, p, sol;

const int NO = 0;
const int XX = 1;
const int SI = 2;

const int lb_p =    0;
const int ub_p = 1000;

void escriu() {
  vector<int> pos;
  int mx = 0;
  for (int j = 0; j < n; ++j)
    if (sol[j] == SI) {
      if (mx < e[j]) {
	pos = {j};
	mx = e[j];
      }
      else if (mx == e[j])
	pos.push_back(j);
    }
  cout << "President de";
  for (int k = 0; k < pos.size(); ++k) 
    cout << " " << pos[k];
  cout << endl;
    
  vector<string> header = {"En contra", "Abstencio", "A favor"};
  for (int k = SI; k >= NO; --k) {
    cout << header[k];
    for (int j = 0; j < n; ++j)
      if (sol[j] == k) {
	cout << " " << j;
      }
    cout << endl;
  }
  cout << endl;
}

void bt(int i, int sf, int sc, int sr, int mi, int mx) {
  if (sf + sr <= sc) return;
  if (mx - mi > m) return;
  if (i == n) {
    return escriu();
  }
  sol[i] = NO; bt(i+1, sf,        sc + e[i],  sr - e[i], mi,            mx);
  sol[i] = XX; bt(i+1, sf,        sc,         sr - e[i], min(mi, p[i]), max(mx, p[i]));
  sol[i] = SI; bt(i+1, sf + e[i], sc,         sr - e[i], min(mi, p[i]), max(mx, p[i]));
}

int main() {
  cin >> n;
  e = p = sol = vector<int>(n);
  int sum = 0;
  for (int i = 0; i < n; ++i) {
    cin >> e[i] >> p[i];
    sum += e[i];
  }
  cin >> m;
  bt(0, 0, 0, sum, ub_p, lb_p);
}
