CXXFLAGS = -Wall -std=c++11 -O2

all: main

clean:
	rm -f main *.o

main: main.o rational.o
	$(CXX) $^ -o $@

main.o: main.cpp rational.h
rational.o: rational.cpp rational.h
