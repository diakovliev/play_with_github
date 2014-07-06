OBJS	= gitver.o
LIBNAME	= libgitver.so
CFLAGS	+= -fPIC

all: $(LIBNAME)
	mkdir -p $(EXPORT_DIR)/include
	mkdir -p $(EXPORT_DIR)/lib
	cp -f *.h $(EXPORT_DIR)/include/
	cp -f *.so $(EXPORT_DIR)/lib/

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

$(LIBNAME): $(OBJS)
	$(LD) $(LDFLAGS) -fPIC -shared -o $(LIBNAME) $(OBJS)

clean:
	rm -f $(OBJS)
	rm -f $(LIBNAME)
