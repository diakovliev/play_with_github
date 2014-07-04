CC	= gcc
LD	= gcc

CFLAGS	= -Wall -Wextra
LDFLAGS	=

ifeq (,$(GIT_VERSION))
	GIT_VERSION:="$(shell git describe)"
	ifeq (,$(GIT_VERSION))
		GIT_VERSION:=no-git
	endif
endif

CFLAGS	+= -DGIT_VERSION="\"$(GIT_VERSION)\""

all: prog

prog: main.o
	$(LD) $(LDFLAGS) -o $@ $<

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	rm -f *.o
	rm -f prog
