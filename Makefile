SHELL = /bin/sh

all: secure-pbcopy

.SUFFIXES:
.SUFFIXES: .c .o

.PHONY: all install

CFLAGS = -g
ALL_CFLAGS = -framework AppKit $(CFLAGS)

secure-pbcopy: main.m
	$(CC) $(CPPFLAGS) -o secure-pbcopy $(ALL_CFLAGS) main.m

INSTALL = install
INSTALL_PROGRAM = $(INSTALL)

prefix = /usr/local
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin

install: secure-pbcopy
	$(INSTALL) -d $(DESTDIR)$(bindir)
	$(INSTALL_PROGRAM) secure-pbcopy $(DESTDIR)$(bindir)/secure-pbcopy

clean:
	rm -f secure-pbcopy
