#include <stdio.h>
#include <stdlib.h>
#define MEGA 1048576

int main(int argc, char **argv)
{
	int i, size, j;
	size = 100*MEGA;
	char  *buf1, *buf2;
	buf1 = (char *)malloc(size);
	buf2 = (char *)malloc(size);
	
	for (j=0;j<100; j++)
		for (i=1; i<size; i++){
			buf2[size-i]=buf1[i];
		}

	return 0;
}
