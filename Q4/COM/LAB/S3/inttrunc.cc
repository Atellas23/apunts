#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char **argv) 
{
    	if (argc != 2) {
		char buf[200];
		sprintf(buf, "Us: %s <integer>\n", argv[0]);
		write(2, buf, strlen(buf));
		exit(1);
	}
	int n = atoi(argv[1]);
	char c = (char)n;
	char buf[200];
	sprintf(buf, "%c, %x\n", c, n);
	write(1, buf, strlen(buf));
	return 0;
}
