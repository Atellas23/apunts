#include "rational.h"
#include <iostream>
using namespace std;

int main() {
  Rational R1(3); // R1 = 3
  Rational R2(5, 4);  // R2 = 5/4
  Rational R3(8, -10);  // R3 = -4/5
  R3 += R1 + Rational(-1, 5); // R3 = 2
  if (R3 >= Rational(2)) R3 = -R1*R2;  // R3 = -15/4
  cout << R3.to_str() << endl;
}
