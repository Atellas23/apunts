#include "rectangle.h"
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

Rectangle::Rectangle(Point ll, Point ur) :
_ll(ll), _ur(ur) {}

Rectangle& Rectangle::operator *= (const Rectangle& R) {
  // Calculate the new ll and ur coordinates
  Point Rll = R.getLL();
  _ll = Point(max(_ll.getX(), Rll.getX()), max(_ll.getY(), Rll.getY()));
  Point Rur = R.getUR();
  _ur = Point(min(_ur.getX(), Rur.getX()), min(_ur.getY(), Rur.getY()));
  return *this;
}

Rectangle Rectangle::operator * (const Rectangle& R) const {
  Rectangle result = *this; // Make a copy of itself
  result *= R;
  return result;
}

Point Rectangle::getLL() const {
  return _ll;
}

double Rectangle::area() const {
  return getWidth()*getHeight();
}

Point Rectangle::getUR() const {
  return _ur;
}

// Notice: not a const method
void Rectangle::scale(double s) {
  _ur = _ll + Point((_ur.getX()-_ll.getX())*s,(_ur.getY()-_ll.getY())*s);
}

double Rectangle::getWidth() const {
  return _ur.getX()-_ll.getX();
}

double Rectangle::getHeight() const {
  return _ur.getY()-_ll.getY();
}

bool Rectangle::empty() const {
  return getWidth() <= 0 or getHeight() <= 0;
}

void Rectangle::rotate(bool clockwise) {
  if (clockwise) {
    _ll = _ll + Point(0,-getWidth());
    _ur = _ll + Point(getHeight(),0);
  }
  else {
    _ll = _ll + Point(-getHeight(),0);
    _ur = _ll + Point(0,getWidth());
  }
}

void Rectangle::flip(bool horizontally) {
  if (horizontally) {
    _ll = _ll + Point(-getWidth(),0);
    _ur = _ll + Point(0,getHeight());
  }
  else {
    _ll = _ll + Point(0,-getHeight());
    _ur = _ll + Point(getWidth(),0);
  }
}

bool Rectangle::isPointInside(const Point& P) const {
  return (P.getX() >= getLL().getX() and P.getY() >= getLL().getY() and P.getX() <= getUR().getX() and P.getY() <= getUR().getY());
}
