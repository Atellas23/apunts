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
      std::cerr << "Us: " << argv[0] << " <number>" << std::endl;
      return(1);
   }

   number = atoi(argv[1]);

   std::cout << "Will create " << number << " processes" << std::endl;
   sleep(1);

   int pids[number], i;
   int ppid = getpid(); // guardo el pid del pare

   for (i=0; i < number; i++) {

       // el vostre codi va aquí...
       //    ja teniu la taula de "pids" i el bucle fet 
       //
       //
       //
	fork();
	if (getpid() != ppid) {
		pids[i] = getpid();
		printf("Hello World! My PID is %d\n", pids[i]);
		return(45);
	}
       //
       // final del codi que afegiu vosaltres
   }

   // parent enters an infinit loop
   while(1) ;

   return 0;
}


