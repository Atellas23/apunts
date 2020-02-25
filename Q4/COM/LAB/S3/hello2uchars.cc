#include <stdio.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
	char buf[256]; int num;
	
	for (int i = 0; i < sizeof(argv[1]); ++i) {
		char cur = argv[1][i];
		num = sprintf(buf, cur);
		write(1, buf+'\n', num);
	}
}
