#include <stdio.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
	char buf[256]; int num;

	num = sprintf(buf, "Hello World!\n");
	
	write(1, buf, num);
}
