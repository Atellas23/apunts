#include <iostream>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
using namespace std;

int main() {
	int status = 0;
	int pp = getpid();
	fork();
	if (getpid() != pp) waitpid(getpid(), &status, 0);
	return 0;
}
