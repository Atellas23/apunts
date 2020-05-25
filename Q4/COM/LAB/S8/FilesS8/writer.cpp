
# include <iostream>
# include <cstdlib>
# include <unistd.h>
# include <sys/types.h>
# include <sys/wait.h>

int main (int argc, char ** argv)
{

   int id;

   if (argc < 2) {
      std::cerr << "Us: " << argv[0] << " <id>" << std::endl;
      return(1);
   }

   sleep(5);

   id = atoi(argv[1]);

   std::cout << "New Hello World (from pid " << getpid() << " with parameter " << id << ")" << std::endl;

   return 0;
}


