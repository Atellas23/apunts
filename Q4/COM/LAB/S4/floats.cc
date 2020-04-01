#include <stdio.h>
#include <stdlib.h>
#define MEGA 1048576

int main(int argc, char **argv)
{
	int i, j, size;
	float res, op1, op2;
	size = 100*MEGA;
	
	for (j=0;j<10; j++)
		for (i=0; i<size; i++){
			op1 = rand();
			op2 = rand();
			res = (float)op1/(float)op2;
		}

	return 0;
}
