# Sample Makefile
CC     = gcc
OPT    = -g -O3
WARN   = -Wall
CFLAGS = $(OPT) $(WARN)    # the C compiler flags
OBJECTS = data.o main.o io.o

excer2 : $(OBJECTS)
	$(CC) $(CFLAGS) -o excer2 $(OBJECTS)

clean:
	@rm -f *.o core

# file dependecies
#data.o : data.c data.h
#main.o : data.h io.h main.c
#io.o   : io.h io.c

# DO NOT DELETE

data.o: data.h
io.o: io.h
main.o: io.h data.h
