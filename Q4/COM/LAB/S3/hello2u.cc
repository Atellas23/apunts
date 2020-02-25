#include <stdio.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
	char buf[256]; int num;

	num = sprintf(buf, "Hello %s!\n", argv[1]);
	
	write(1, buf, num);
}
