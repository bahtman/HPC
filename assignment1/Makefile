TARGET	= libmatmult.so
LIBSRCS	= matmult_lib.c matmult_nat.c matmult_blk.c
LIBOBJS	= matmult_lib.o matmult_nat.o matmult_blk.o

OPT	= -g -Ofast -funroll-loops
PIC	= -fPIC

CC	= gcc
CFLAGS= $(OPT) $(PIC) $(XOPTS)

SOFLAGS = -shared 
XLIBS	= -L /usr/lib64/atlas -lsatlas

$(TARGET): $(LIBOBJS)
	$(CC) -o $@ $(SOFLAGS) $(CFLAGGS) $(LIBOBJS) $(XLIBS)

clean:
	@/bin/rm -f core core.* $(LIBOBJS) 
