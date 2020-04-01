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
	write(1, &n, sizeof(int));
	return 0;
}
