#include <iostream>
#include <vector>
#include <algorithm>
#include <cmath>
using namespace std;

void write_solution(vector<pair<double, int>>& sol) {
	int n = sol.size();
	double a = 0;
	cout << "Ordre:";
	for (int i = 0; i < n; ++i) {
		cout << " " << sol[i].second;
		a += 100*pow(sol[i].first, i);
	}
	cout << endl << "Total value: " << a << endl;
}


void write_perm(int n, vector<pair<double, int>>& sol, vector<bool>& used, const vector<pair<double, int>>& r) {
	if ((int)sol.size() == n) write_solution(sol);
	else {
		for (int i = 0; i < n; ++i) {
			if (not used[i]) {
				sol.push_back(r[i]);
				used[i] = true;
				write_perm(n, sol, used, r);
				used[i] = false;
				sol.pop_back();
			}
		}
	}
}

void write_perm(vector<pair<double, int>> r) {
	int n = r.size();
	vector<bool> used(n, false);
	vector<pair<double, int>> sol; // Inicialment buit
	write_perm(n, sol, used, r);
}

/*void order(vector<pair<double, int>>& rates) {
	sort(rates.begin(), rates.end());
	reverse(rates.begin(), rates.end());
	for (auto& d: rates) cout << " " << d.second;
	cout << endl;
}*/

int main() {
	int n;
	cin >> n;
	vector<pair<double, int>> r(n);
	for (int i = 0; i < n; ++i) {
		cin >> r[i].first;
		r[i].second = i + 1;
	}
	write_perm(r);
}