all: is utf16 utf16-in-c valsfp32 valsfp64 #ustring

is: is.cc
	g++ -O -o is is.cc -licuio -licutu -licuuc

utf16: utf16.cc
	g++ -O -o utf16 utf16.cc -licuio -licutu -licuuc

utf16-in-c: utf16-in-c.c
	gcc -O -o utf16-in-c utf16-in-c.c -licuio -licutu -licuuc

ustring: ustring.cc
	g++ -O -o ustring ustring.cc  -licuio -licutu -licuuc

valsfp32: valsfp32.c
	gcc -O -o valsfp32 valsfp32.c

valsfp64: valsfp64.c
	gcc -O -o valsfp64 valsfp64.c

clean:
	rm -f is utf16 utf16-in-c valsfp32 valsfp64 #ustring
