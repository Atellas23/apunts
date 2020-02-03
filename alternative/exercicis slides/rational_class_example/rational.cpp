#include "rational.h"
using namespace std;


Rational::Rational(int num, int den) : num(num), den(den) {
  simplify();
}

void Rational::simplify() {
  assert(den != 0); // We will discuss assertions later
  if (den < 0) {
    num = -num;
    den = -den;
  }
  // Divide by the gcd of num and den
  int d = gcd(abs(num), den);
  num /= d;
  den /= d;
}

Rational& Rational::operator += (const Rational& r) {
  num = getNum()*r.getDen() + getDen()*r.getNum();
  den = getDen()*r.getDen();
  simplify();
  return *this;
}

Rational Rational::operator + (const Rational& r) const {
  Rational result = *this; // A copy of this object
  result += r;
  return result;
}

Rational& Rational::operator *= (const Rational& r) {
  num = getNum()*r.getNum();
  den = getDen()*r.getDen();
  simplify();
  return *this;
}

Rational Rational::operator * (const Rational& r) const {
  Rational result = *this;
  result *= r;
  return result;
}

Rational& Rational::operator /= (const Rational& r) {
  Rational aux = r.inverse();
  num = getNum()*aux.getNum();
  den = getDen()*aux.getDen();
  simplify();
  return *this;
}

Rational Rational::operator / (const Rational& r) const {
  Rational result = *this;
  result /= r;
  return result;
}

bool Rational::operator == (const Rational& r) {
  return getNum() == r.getNum() and getDen() == r.getDen();
}

bool Rational::operator != (const Rational& r) {
  return not operator ==(r);
}

bool Rational::operator > (const Rational& r) {
  return getNum()*r.getDen() > getDen()*r.getNum();
}

bool Rational::operator >= (const Rational& r) {
  return not operator <(r);
}

bool Rational::operator < (const Rational& r) {
  return not operator >(r) and operator !=(r);
}

bool Rational::operator <= (const Rational& r) {
  return operator >(r);
}

string Rational::to_str() const {
  string s(to_string(getNum()));
  if (not isInteger()) s += "/" + to_string(getDen());
  return s;
}

Rational Rational::inverse() const {
  assert(num != 0);
  Rational result(den,num);
  return result;
}

int gcd(int a, int b) {
  int r = a;
  while (r > 0) {
    r = a % b;
    a = b;
    b = r;
  }
  return a;
}
