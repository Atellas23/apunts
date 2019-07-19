all: main

main: main.o matrius.o pr.o
	g++ -O2 main.o matrius.o pr.o -o main

main.0: main.cc
	g++ -O2 -c main.cc

matrius.o: matrius.cc
	g++ -O2 -c matrius.cc

pr.o: pr.cc
	g++ -O2 -c pr.cc

clean:
	rm -f *.o *~

mrproper: clean
	rm -f main

.PHONY: all clean mrproper
