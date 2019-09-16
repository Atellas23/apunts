#include "point.h"
#include <vector>
#include <iostream>
using namespace std;

// A polygon (an ordered set of vertices)
using Polygon = vector<Point>;

bool abans(Point a, Point b) {
  if (a.getX() != b.getX()) return a.getX() > b.getX();
  else return a.getY() > b.getY();
}

void resort(vector<Point>& points) {
  // search for min x (and min y in case of a tie)
  int idx = 0;
  int min_x = points[idx].getX(), min_y = points[idx].getY();
  int n = points.size();
  for (int i = 1; i < n; ++i) {
	if (points[i].getX() < min_x) {
	  min_x = points[i].getX();
	  idx = i;
    }
    else if (points[i].getX() == min_x) {
	  if (points[i].getY() < min_y) {
		min_y = points[i].getY();
		idx = i;
	  }
    }
  }
  if (idx == 0) return;	// if nothing has to be changed, return the original vector unchanged
  // reorder in cyclical order
  vector<Point> aux;
  for (int j = idx; j < n; ++j) {
	aux.push_back(points[idx]);
	points.erase(points.begin()+idx);
  }
  for (int j = 0; j < idx; ++j) {
	aux.push_back(points[j]);
  }
  points.clear();
  points = aux;
  aux.clear();
}

bool leftof(Point p1, Point p2, Point p3) {
  return (p2.getX()-p1.getX())*(p3.getY()-p1.getY()) >= (p2.getY()-p1.getY())*(p3.getX()-p1.getX());
}

vector<Point> convexHull(vector<Point> points) {
  int n = points.size();
  sort(points.begin(), points.end(), abans);
  vector<Point> Q;
  Q.push_back(points[0]); Q.push_back(points[1]); Q.push_back(points[2]);
  int m = 2;
  for (int k = 3; k < n; ++k) {
    while (m > 0 and leftof(Q[m-1],Q[m],points[k])) m = m - 1;
    m = m + 1;
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
  vector<Point> Q = convexHull(punts);
  int n = Q.size();
  cout.setf(ios::fixed);
  cout.precision(3);
  resort(Q);
  for (int i = 0; i < n; ++i) cout << Q[i].getX() << ' ' << Q[i].getY() << endl;
}
