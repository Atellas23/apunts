#ifndef RATIONAL_H
#define RATIONAL_H

#include <algorithm>
#include <string>
#include <cassert>
using namespace std;

class Rational {
private:
  int num, den; // Invariant: den > 0 and gcd(num,den)=1

  // Simplifies the fraction (used after each operation)
  void simplify();

public:
  // Constructor (if some parameter is missing, the default value is taken)
  Rational(int num = 0, int den = 1);

  // Returns the numerator of the fraction
  int getNum() const {
    return num;
  }

  // Returns the denominator of the fraction
  int getDen() const {
    return den;
  }

  // Returns true if the number is integer and false otherwise.
  bool isInteger() const {
    return den == 1;
  }

  // Arithmetic operators
  Rational& operator += (const Rational& r);
  Rational operator + (const Rational& r) const;

  // Similarly for -, * and /
  Rational& operator -= (const Rational& r);
  Rational operator - (const Rational& r) const;
  Rational& operator *= (const Rational& r);
  Rational operator * (const Rational& r) const;
  Rational& operator /= (const Rational& r);
  Rational operator / (const Rational& r) const;

  // Unary operator
  Rational operator - () const {
    return Rational(-getNum(), getDen());
  }

  // Equality comparison
  bool operator == (const Rational& r);

  // Inequality comparisons
  bool operator != (const Rational& r);
  bool operator > (const Rational& r);
  bool operator >= (const Rational& r);
  bool operator < (const Rational& r);
  bool operator <= (const Rational& r);

  // Returns a string representing the rational
  string to_str() const;

  Rational inverse() const;
};

int gcd(int a, int b);

#endif
