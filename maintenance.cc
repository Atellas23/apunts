// maintenance.cc
#include <bits/stdc++.h>
using namespace std;

int main() {
	ofstream out("Makefile");
	out << "all:\n\tgit add --all\n\tgit commit -m update\n\tgit push\n";
	out.close();
	system("make");
	system("rm Makefile");
}