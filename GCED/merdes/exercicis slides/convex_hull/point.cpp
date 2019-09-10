#include "point.h"
using namespace std;

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
