#include <iostream>
#include <cfloat>
using namespace std;

int main() {
    float feps = 1.0;
    while (float(1.0)+feps > float(1.0)) feps /= 2;
    cout << "(float)" << endl << "experimental epsilon = " << 2*feps << endl << "machine epsilon = " << FLT_EPSILON << endl;
    double deps = 1.0;
    while (double(1.0)+deps > double(1.0)) deps /= 2;
    cout << "(double)" << endl << "experimental epsilon = " << 2*deps << endl << "machine epsilon = " << DBL_EPSILON << endl;
}
