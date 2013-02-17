#!/bin/sh
# vi:set filetype=makefile
NULL=0  exec make "CALL=$0" "EXE=`which $0`" -f "`which $0`" -- "$@"

D := /
PREFIX := /usr/local
BIN_PREFIX := $(PREFIX)/bin

all: truckle
	@echo 'Nothing to do :)'
	@echo 'Please run "make install" to install.'

install: truckle
	mkdir -p $(D)$(BIN_PREFIX)
	install -m 0755 truckle $(D)$(BIN_PREFIX)/truckle
	for c in `./truckle --list-commands`; do ln -fs truckle $(D)$(BIN_PREFIX)/truckle-$${c} ; done
	for c in trdo tresume tretry; do ln -fs truckle $(D)$(BIN_PREFIX)/$${c} ; done

README.md: truckle README.pre.md
	( cat README.pre.md ; ./truckle --help ) > README.md.tmp
	mv README.md.tmp README.md

release: README.md
