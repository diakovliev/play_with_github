LIBS	= gitver
LDLIBS	= $(foreach l,$(LIBS),-l$(l))
LDFLAGS	+= $(LIBDIRS)
CFLAGS	+= $(LIBHEADERS)

all: prog
	mkdir -p $(EXPORT_DIR)/bin
	cp -f prog $(EXPORT_DIR)/bin/

prog: main.o
	$(LD) $(LDFLAGS) -o $@ $< $(LDLIBS)

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	rm -f *.o
	rm -f prog
