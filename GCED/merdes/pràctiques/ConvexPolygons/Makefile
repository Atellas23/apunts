
CXXFLAGS = -Wall -std=c++11 -O2

all: main

clean:
	rm -f main *.o

main: main.o Polygon.o
	$(CXX) $^ -o $@

main.o: main.cpp Polygon.h
Polygon.o: Polygon.cpp Polygon.h
