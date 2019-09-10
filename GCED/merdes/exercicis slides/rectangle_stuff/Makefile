CXXFLAGS = -Wall -std=c++11 -O2

all: main

clean:
	rm -f main *.o

main: main.o rectangle.o
	$(CXX) $^ -o $@

main.o: main.cpp rectangle.h
rectangle.o: rectangle.cpp rectangle.h
