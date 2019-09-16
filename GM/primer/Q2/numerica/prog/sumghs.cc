#include <iostream>
#include <cmath>
using namespace std;

int main() {
    cout.setf(ios::fixed);
    cout.precision(6);
    float n_sum = 0;
    for (int i = 1; i < 16; ++i) {
        n_sum += 1000.0/(i*i);   //natural order
        n_sum = trunc(n_sum);
        cout << i << ": " << trunc(1000.0/(i*i)) << endl;
    }
    cout << endl;
    float inv_sum = 0;
    for (int j = 15; j > 0; --j) {
        inv_sum += 1000.0/(j*j);   //inverse order
        inv_sum = trunc(inv_sum);
        cout << j << ": " << trunc(1000.0/(j*j)) << endl;
    }
    cout << "natural order: " << float(n_sum)/1000 << endl << "inverse order: " << float(inv_sum)/1000 << endl;
}
