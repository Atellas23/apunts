#include "Polygon.h"
using namespace std;

vector<double> default_color(3,0);

Point::Point(double x_coord, double y_coord) :
x(x_coord), y(y_coord) {}

double Point::getX() const {
  return x;
}

double Point::getY() const {
  return y;
}

double Point::distance(const Point& p) const {
  double dx = getX() - p.getX(); // Better getX() than x
  double dy = getY() - p.getY();
  return sqrt(dx*dx + dy*dy);
}

double Point::radius() const {
  return sqrt(getX()*getX() + getY()*getY());
}

double Point::angle() const {
  if (getX() == 0 and getY() == 0) return 0;
  return atan(getY()/getX());
}

Point Point::operator + (const Point& p) const {
  return Point(getX() + p.getX(), getY() + p.getY());
}

bool Point::operator == (const Point& p) const {
  return getX() == p.getX() and getY() == p.getY();
}

Polygon::Polygon(string name, vector<Point> punts, vector<double> colorRGB) :
id(name), points(punts), col(colorRGB) {}

double Polygon::area() const {
  double area = 0.0;
  int n = points.size();
  // Calculate value of shoelace formula
  int j = n - 1;
  for (int i = 0; i < n; ++i) {
    area += (points[j].getX() + points[i].getX()) * (points[j].getY() - points[i].getY());
    j = i;  // j is previous vertex to i
  }
  // Return absolute value
  return abs(area / 2.0);
}

double Polygon::perimeter() const {
  int n = points.size();
  double perim = 0.0;
  for (int i = 0; i < n; ++i) {
    if (i == n-1) perim += points[i].distance(points[0]);
    else perim += points[i].distance(points[i+1]);
  }
  return perim;
}

void Polygon::setcol(vector<double> color) {
  col = color;
}

Point Polygon::centroid() const {
  int n = points.size();
  double o_x = 0.0, o_y = 0.0;
  for (int i = 0; i < n; ++i) {
    o_x += points[i].getX();
    o_y += points[i].getY();
  }
  Point o(o_x/n,o_y/n);
  return o;
}
