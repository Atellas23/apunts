#include <iostream>
#include <sstream>
#include <bits/stdc++.h>
using namespace std;

int main() {
	stringstream command;
	for (int i = 0; i < 4; ++i) {
		command.str(string());
		command << "g++ -Wall -o progO";
		command << i << " -O" << i << " program.cc maths.cc inout.cc";
		string c1 = command.str();
		cout << c1 << endl;
		system(c1.c_str());
		command.str(string());
		command << "objdump -dC progO" << i << " > outO" << i << ".asm";
		string c2 = command.str();
		cout << c2 << endl;
		system(c2.c_str());
	}
	cout << "success!" << endl;
}
