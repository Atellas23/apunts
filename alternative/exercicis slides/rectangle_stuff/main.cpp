#include "rectangle.h"
#include <iostream>
using namespace std;

int main() {
  Rectangle R1(Point(2,3), Point(6,8));
  double areaR1 = R1.area(); // areaR1 = 20
  cout << areaR1 << endl;
  Rectangle R2(Point(3,5), Point(5,9)); // LL=(3,5) UR=(5,9)
  // Check whether the point (4,7) is inside the
  // intersection of R1 and R2.
  bool in = (R1*R2).isPointInside(Point(4,7));
  cout << in << endl;
  // The object R1*R2 is “destroyed” after the assignment.
  R2.rotate(false);
  R2 *= R1;
}
