CC	= gcc
t = 4
OPT	= -g -O3 #-ftree-parallelize-loops=$(t) -ffast-math
CHIP	= 
ISA	= 
LIBS	= -lm
CFLAGS  = $(OPT) $(CHIP) $(ISA) $(DEFS) $(XOPT)

SOURCES = pi.c main.c xtime.c
OBJECTS = $(SOURCES:.c=.o)

TARGET = pi.$(CC)

all: 
	$(MAKE) $(MAKEFLAGS) clean
	$(MAKE) $(MAKEFLAGS) $(TARGET)

$(TARGET): clean $(OBJECTS)
	$(CC) -o $@ $(CFLAGS) $(OBJECTS) $(LIBS)


clean:
	@/bin/rm -f $(OBJECTS) core

realclean: clean
	@/bin/rm -f $(TARGET)


# DO NOT DELETE

main.o: pi.h xtime.h
