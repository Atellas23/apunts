all: processes writer processes2 processes3 processes4


processes: processes.cpp
	g++ -Wall -O -o processes processes.cpp
writer: writer.cpp
	g++ -Wall -O -o writer writer.cpp
processes2: processes2.cpp
	g++ -Wall -O -o processes2 processes2.cpp
processes3: processes3.cpp
	g++ -Wall -O -o processes3 processes3.cpp
processes4: processes4.cpp
	g++ -Wall -O -o processes4 processes4.cpp


clean:
	rm -f processes processes.o \
	        writer writer.o \
		processes2 processes2.o \
		processes3 processes3.o \
		processes4 processes4.o
	       
