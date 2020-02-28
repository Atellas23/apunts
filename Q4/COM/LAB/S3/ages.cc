#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>

struct person_data {
	char name[256];
	int        age;
};

int main(int argc, char **argv) {
	person_data people[256];
	char buf[512];
	
	for (int i = 0; i < (argc - 1) / 2; ++i) {
		sprintf(people[i].name, argv[2*i + 1]);
		people[i].age = atoi(argv[2*i + 2]);
	}
	for (int i = 0; i < (argc - 1) / 2; ++i) {
		sprintf(buf, "person %d:  %s  %d\n", i, people[i].name, people[i].age);
		write(1, buf, strlen(buf));
	}
}
