all: hello_world1 hello_world2 hello_world3 bubblesort matrixmul

hello_world1: hello_world1.cpp
	g++ -Wall -fopenmp -o hello_world1 hello_world1.cpp

hello_world2: hello_world2.cpp
	g++ -Wall -fopenmp -o hello_world2 hello_world2.cpp

hello_world3: hello_world3.cpp
	g++ -Wall -fopenmp -o hello_world3 hello_world3.cpp

bubblesort: bubblesort.cpp
	g++ -Wall -D_GLIBCXX_DEBUG -fopenmp -o bubblesort bubblesort.cpp

matrixmul: matrixmul.cpp
	g++ -Wall -D_GLIBCXX_DEBUG -fopenmp -o matrixmul matrixmul.cpp
clean:
	rm hello_world1 hello_world2 hello_world3 bubblesort matrixmul
