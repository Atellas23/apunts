#include "point.h"
#include <vector>
#include <iostream>
using namespace std;

// A polygon (an ordered set of vertices)
using Polygon = vector<Point>;

bool abans(Point a, Point b) {
  if (a.getX() != b.getX()) return a.getX() < b.getX();
  else return a.getY() < b.getY();
}

bool leftof(Point p1, Point p2, Point p3) {
  if (p2.getX() == p1.getX()) return false;
  else if (p3.getX() == p1.getX()) return true;
  else return (p2.getX()-p1.getX())*(p3.getY()-p1.getY()) > (p2.getY()-p1.getY())*(p3.getX()-p1.getX());
}

Polygon convexHull(vector<Point> points) {
  int n = points.size();
  sort(points.begin(), points.end(), abans);
  Polygon Q;
  Q.push_back(points[0]); Q.push_back(points[1]); Q.push_back(points[2]);
  int m = 2;
  for (int k = 0; k < n; ++k) {
    while (leftof(Q[m-1],Q[m],points[k])) --m;
    ++m;
    int s = Q.size();
    if (m < s) Q[m] = points[k];
    else Q.push_back(points[k]);
  }
  return Q;
}

int main() {
  vector<Point> punts;
  double a,b;
  while (cin >> a >> b) {
    Point p(a,b);
    punts.push_back(p);
  }
  Polygon Q = convexHull(punts);
  int n = Q.size();
  cout.setf(ios::fixed);
  cout.precision(3);
  for (int i = 0; i < n; ++i) cout << Q[i].getX() << ' ' << Q[i].getY() << endl;
}
