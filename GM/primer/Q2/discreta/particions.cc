//aquest programa calcula el nombre total de particions d'un conjunt d'n elements en k parts
#include <iostream>
using namespace std;
using ll = long long;

ll parti(ll n,ll k) {
	if (k == n or k == 1) return 1;
	else return parti(n-1,k-1)+k*parti(n-1,k);
}

int main() {
	ll n,k;
    cout << "particions d'n elements en k parts" << endl
    << "n:";
	cin >> n;
    cout << "k:";
    cin >> k;
	cout << parti(n,k) << endl;
}
