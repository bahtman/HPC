clean:
	@rm -f *.o core




excer1: data.o main.o io.o
	cc data.o main.o io.o -o excer1
data.o: data.c data.h
	cc -c data.c
main.o: data.h main.c io.h
	cc -c main.c
io.o: io.h io.c
	cc -c io.c
