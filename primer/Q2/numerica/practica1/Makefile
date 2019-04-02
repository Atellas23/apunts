all: main

main: main.o sistema.o lu.o resol.o
	g++ -O2 main.o sistema.o lu.o resol.o -o main

main.o: main.cc
	g++ -O2 -c main.cc

sistema.o: sistema.cc
	g++ -O2 -c sistema.cc

lu.o: lu.cc
	g++ -O2 -c lu.cc

resol.o: resol.cc
	g++ -O2 -c resol.cc

clean:
	rm -f *.o *~

mrproper: clean
	rm -f main

.PHONY: all clean mrproper
