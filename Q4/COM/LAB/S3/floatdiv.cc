#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char **argv) 
{
	if (argc != 3) {
		char buf[200];
		sprintf(buf, "Us: %s <integer1> <integer2>\n", argv[0]);
		write(2, buf, strlen(buf));
		exit(1);
	}
	int n1 = atoi(argv[1]), n2 = atoi(argv[2]);
	float result = (float)n1 / n2;
	write(1, &result, sizeof(float));
	return 0;
}
