#include "inout"
#include "maths"
#include <cstddef>

using namespace std;

int main(int argc, char **argv){
	int op1, op2, op3, result;

	outmsg("Introduce first value\n", NULL);
	input(&op1);

	outmsg("Introduce second value\n", NULL);
	input(&op2);

	outmsg("Introduce third value\n", NULL);
	input(&op3);
	
	result = mathloop(op1, op2, op3);

	outmsg("Final result ", &result);

	return 0;
}
