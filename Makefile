# Very simple and not very smart :)
# Build all libs and all progs (now only one of each present)
# Very poor dependansy

export CC		= gcc
export LD		= gcc
export CFLAGS		= -Wall -Wextra
export LDFLAGS		=

export PWD		= $(shell pwd)





PACKAGE_PROGS		= apps/vpr

VERY BAD CHANGE

PACKAGE_LIBS		= libs/gitver

ifeq (,$(GIT_VERSION))
	GIT_VERSION:="$(shell git describe)"
	ifeq (,$(GIT_VERSION))
		GIT_VERSION:=no-git
	endif
endif
export CFLAGS		+= -DGIT_VERSION="\"$(GIT_VERSION)\""

export EXPORT_DIR	= $(PWD)/export

export LIBHEADERS	= -I$(EXPORT_DIR)/include
export LIBDIRS		= -L$(EXPORT_DIR)/lib

all: lib bin

$(PACKAGE_PROGS):
	$(MAKE) -C $@

$(PACKAGE_LIBS):
	$(MAKE) -C $@

lib: $(PACKAGE_LIBS)
	for d in $(PACKAGE_LIBS); do \
		$(MAKE) -C $$d ; \
	done

bin: $(PACKAGE_PROGS)
	for d in $(PACKAGE_PROGS); do \
		$(MAKE) -C $$d ; \
	done

clean:
	@for d in $(PACKAGE_LIBS) $(PACKAGE_PROGS); do $(MAKE) -C $$d clean; done
	@rm -rf $(EXPORT_DIR)

.PHONY: $(PACKAGE_LIBS) $(PACKAGE_PROGS)
