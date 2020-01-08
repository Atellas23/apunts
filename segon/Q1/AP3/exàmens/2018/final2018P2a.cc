#include <iostream>
#include <vector>
using namespace std;

int max_valor (const vector<int>& v, int k) {
	if (k < 0) return 0;
	else if (k == 0) return v[k];
	else return max(v[k] + max_valor(v, k - 2), max_valor(v, k - 1));
}

int main() {
	int n;
	cin >> n;
	vector<int> v(n);
	for (int i = 0; i < n; ++i) cin >> v[i];
	cout << "Valor: " << max_valor(v, n - 1) << endl;
}