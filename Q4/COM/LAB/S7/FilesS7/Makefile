all: integers floats mems integers-passive

.PHONY: .o .cc

.cc.o:
	g++ -c $< -O0

.o:
	g++ -o $@ $< -lm


integers: integers.o
integers.o: integers.cc
integers-passive: integers-passive.o
integers-passive.o: integers-passive.cc
floats: floats.o
floats.o: floats.cc
mems: mems.o
mems.o: mems.cc

clean:
	rm -f integers.o integers floats.o floats mems.o mems
