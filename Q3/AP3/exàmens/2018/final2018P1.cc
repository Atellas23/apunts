#include <iostream>
#include <vector>
using namespace std;

void write_solution(vector<int>& sol) {
	for (int i = 0; i < (int)sol.size(); ++i) cout << (i ? " " : "") << sol[i];
	cout << endl;
}

int sum_last_k(const vector<int>& v, int k) {
	int res = 0;
	for (int i = 0; i < k; ++i) res += v[v.size() - 1 - i];
	return res;
}

void write_perm_max(int n, int k, int s, vector<int>& sol, vector<bool>& used) {
	if (sol.size() == n) write_solution(sol);
	else {
		for (int i = 1; i <= n; ++i) {
			if (not used[i]) {
				sol.push_back(i);
				used[i] = true;
				if (sol.size() >= k) {
					if (sum_last_k(sol, k) > s) {
						sol.pop_back();
						used[i] = false;
						return;
					}
				}
				write_perm_max(n, k, s, sol, used);
				used[i] = false;
				sol.pop_back();
			}
		}
	}
}

void write_perm_max(int n, int k, int s) {
	vector<bool> used(n+1, false);
	vector<int> sol; // Inicialment buit
	write_perm_max(n, k, s, sol, used);
}

int main() {
	int n, k, s;
	cin >> n >> k >> s;
	write_perm_max(n, k, s);
}