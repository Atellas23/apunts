#ifndef RECT_H
#define RECT_H

#include <math.h>
#include <algorithm>
using namespace std;

class Point {
public:
  //Constructor
  Point(double x_coord, double y_coord);
  // Gets the x coordinate
  double getX() const;
  // Gets the y coordinate
  double getY() const;
  // Returns the distance to point p
  double distance(const Point& p) const;
  // Returns the radius (distance to the origin)
  double radius() const;
  // Returns the angle of the polar coordinate
  double angle() const;
  // Creates a new point by adding the coordinates of two points
  Point operator + (const Point& p) const;
private:
  double x, y;
  // Coordinates of the point
};

/* ----------------------------------------------------------------- */

class Rectangle {
public:
  // Constructor
  Rectangle(Point ll, Point ur);
  // Returns the area of the rectangle
  double area() const;
  // Scales the rectangle with a factor of s > 0
  void scale(double s);
  // Returns the intersection with another rectangle
  Rectangle operator * (const Rectangle& R) const;

  Rectangle& operator *= (const Rectangle& R);

  Point getLL() const;
  Point getUR() const;
  double getWidth() const;
  double getHeight() const;
  bool empty() const;
  // Implement the following methods:

  // Rotate the rectangle 90 degrees clockwise or
  // counterclockwise, depending on the value of the parameter
  void rotate(bool clockwise);

  // Flip horizontally or vertically, depending on the value
  // of the parameter.
  void flip(bool horizontally);

  // Check whether point p is inside the rectangle
  bool isPointInside(const Point& p) const;
private:
  Point _ll,_ur; // Lower-left and upper-right corners of the rectangle
};

 #endif
