#include <stdio.h>
#include <unistd.h>
#include <string.h>

int main(int argc, char **argv) {
	char buf[256]; int num;
	for (int i = 0; i < (int)strlen(argv[1]); ++i) {
		num = sprintf(buf, "%c -> (ASCII) %d\n", argv[1][i], argv[1][i]);
		write(1, buf, num);
	}
}
