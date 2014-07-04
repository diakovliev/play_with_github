CC	= gcc
LD	= gcc

CFLAGS	= -Wall -Wextra
LDFLAGS	=

ifeq (,$(GIT_VERSION))
	CFLAGS	+= -DGIT_VERSION="\"no-git\""
else
	CFLAGS	+= -DGIT_VERSION="\"$(GIT_VERSION)\""
endif

all: prog

prog: main.o
	$(LD) $(LDFLAGS) -o $@ $<

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	rm -f *.o
	rm -f prog
