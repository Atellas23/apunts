BINARIES=add suma hello
all:add
add:add.o add_function.o
gcc -o add add.o 
add.o:add.c
gcc -Wimplicit-function-declaration -I. -c add.c
add_function.o:add_function.c
gcc -Wimplicit-function-declaration  -c add_function.c
clean:
rm *.o $(BINARIES)
