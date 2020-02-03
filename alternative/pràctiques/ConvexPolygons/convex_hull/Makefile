CXXFLAGS = -Wall -std=c++11 -O2

all: main

clean:
	rm -f main *.o

main: main.o point.o
	$(CXX) $^ -o $@

main.o: main.cpp point.h
point.o: point.cpp point.h
