
D := /
PREFIX := /usr/local
BIN_PREFIX := $(PREFIX)/bin

all: truckle
	@echo 'Nothing to do :)'

install: truckle
	install -m 0755 truckle $(D)$(BIN_PREFIX)/truckle
	for c in `./truckle --list-commands`; do ln -fs truckle $(D)$(BIN_PREFIX)/truckle-$${c} ; done
