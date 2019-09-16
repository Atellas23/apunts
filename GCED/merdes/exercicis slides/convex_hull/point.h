#ifndef PNT_N
#define PNT_H

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

#endif
