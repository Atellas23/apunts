#ifndef POLYG_H
#define POLYG_H

#include <vector>
#include <algorithm>
#include <string>
#include <math.h>
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
  // Returns if a point is the same as another one
  bool operator == (const Point& p) const;
private:
  double x, y;
  // Coordinates of the point
};

class Polygon {
public:
  // Constructor
  Polygon(string name, vector<Point> punts = {}, vector<double> colorRGB = vector<double>(3,0));
  // Gets the perimeter of the polygon using the distance function
  double perimeter() const;
  // Gets the area of the polygon
  double area() const;
  // Return the identifier of the polygon
  string getName() const {
    return id;
  }
  // Return the points vector
  vector<Point> getPoints() const {
    return points;
  }
  // Set the polygon RGB color
  void setcol(vector<double> color);
  // Returns the RGB color vector of this
  vector<double> getcolor() const {
    return col;
  }
  // Returns the centroid of the polygon
  Point centroid() const;
  // Return the size of the points vector
  int getSize() const {
    return points.size();
  }
  /*
  // Creates a polygon result of the polygon intersection
  Polygon operator * (const Polygon& p) const;
  */
private:
  string id;
  vector<Point> points;
  vector<double> col;
};

#endif
