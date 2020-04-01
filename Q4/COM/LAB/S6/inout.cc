#include <iostream>

using namespace std;

void outmsg(const char *str, int *num){
	if (num == NULL){
		cout << str;
	} else {
		cout << str << *num << "\n";
	}
}

void input(int *integer){
	cin >> *integer;
}
