CC	= gcc
LD	= gcc

CFLAGS	= -Wall -Wextra
LDFLAGS	=

all: prog

prog: main.o
	$(LD) $(LDFLAGS) -o $@ $<

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	rm -f *.o
	rm -f prog
