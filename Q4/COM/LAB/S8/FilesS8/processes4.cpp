# include <iostream>
# include <cstdlib>
# include <unistd.h>
# include <sys/types.h>
# include <sys/wait.h>
using namespace std;

int main (int argc, char ** argv)
{

	int number;

	if (argc < 2) {
		cerr << "Us: " << argv[0] << " <number>" << endl;
		return(1);
	}

	number = atoi(argv[1]);

	cout << "Will create " << number << " processes" << endl;
	sleep(1);

	int pids[number], i, status = 0;
	int ppid = getpid();

	for (i=0; i < number; i++) {

		// el vostre codi va aquí...
		//    ja teniu la taula de "pids" i el bucle fet 
		//
		//
		//
		fork();
		if (getpid() != ppid) {
			pids[i] = getpid();
			char buf[128];
			sprintf(buf, "%d", i);
			execlp("./writer", "./writer", buf, NULL);
			return(45);
		}
		else waitpid(pids[i], &status, 0);
		//
		// final del codi que afegiu vosaltres
	}

	// parent enters an infinite loop
	while(waitpid(-1, &status, 0) != -1) ;

	return 0;
}


