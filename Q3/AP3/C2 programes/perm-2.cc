#include <iostream>
#include <vector>
using namespace std;

int n;

void write(vector<int>& s) {
    cout << "(" << s[0];
    for (int i = 1; i < s.size(); ++i) cout << "," << s[i];
    cout << ")" << endl;
}

void gen(int k, vector<int>& s, vector<bool>& perm) {
    int n = s.size();
    if (k == n) write(s);
    else {
      
    }
}

int main() {
    cin >> n;
    vector<int> s(n);
    vector<bool> perm(n+1, false);
    gen(0, s, perm);
}

