#include <iostream>
#include <vector>
#include <cfloat> // For DBL_MAX == +oo

using namespace std;

void line(const vector<pair<double,double>>& P, int i, int j,
          double& a, double& b, double& e) {
  double sum_x = 0;
  double sum_y = 0;
  double sum_xx = 0;
  double sum_xy = 0;
  for (int k = i; k <= j; ++k) {
    double x = P[k].first;
    double y = P[k].second;
    sum_x += x;
    sum_y += y;
    sum_xx += x*x;
    sum_xy += x*y;
  }
  int n = j - i + 1;
  a = (n * sum_xy - sum_x * sum_y) / (n * sum_xx - sum_x * sum_x);
  b = (sum_y - a * sum_x) / n;

  e = 0;
  for (int k = i; k <= j; ++k) {
    double x = P[k].first;
    double y = P[k].second;
    e += (y - a*x - b) * (y - a*x - b);
  }
}

double error(const vector<pair<double,double>>& P, int i, int j) {
  double a, b, e;
  line(P, i, j, a, b, e);
  return e;
}

const double C = 0.05;

int main() {
  int n;
  cin >> n;                           // Assume n > 1
  vector<pair<double,double>> P(n+1); // Position 0 not used
  for (int k = 1; k <= n; ++k) 
    cin >> P[k].first >> P[k].second; // Assume by increasing order of 1st component

  vector<vector<double>> E(n+1, vector<double>(n+1, DBL_MAX));
  for (int i = 1; i <= n; ++i) 
    for (int j = i+1; j <= n; ++j) 
      E[i][j] = error(P, i, j);

  vector<double> opt(n+1, DBL_MAX);
  vector<int>    idx(n+1);
  opt[0] = 0;
  for (int j = 1; j <= n; ++j) 
    for (int i = 1; i <= j; ++i) {
      double cost = E[i][j] + C + opt[i-1];
      if (cost < opt[j]) {
        opt[j] = cost;
        idx[j] = i;
      }
    }
  int j = n;
  while (j != 0) {
    int i = idx[j];
    cout << "Segment from point #" << i << " to point #" << j << ": ";
    double a, b, e;
    line(P, i, j, a, b, e);
    cout << "a = " << a << ", b = " << b << endl;
    j = i - 1;
  }
}
