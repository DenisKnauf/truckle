#!/bin/sh
# vi:set filetype=makefile
NULL=0  exec make "CALL=$0" "EXE=`which $0`" -f "`which $0`" -- "$@"

PREFIX := /usr/local
BIN_PREFIX := $(PREFIX)/bin
CAVE_COMMANDS_PREFIX := $(PREFIX)/libexec/cave/commands
SYS_CONF_DIR := /etc
PROFILE_DIR := $(SYS_CONF_DIR)/profile.d
SUDOERS_DIR := $(SYS_CONF_DIR)/sudoers.d
D += /

all: truckle
	@echo 'Nothing to do :)'
	@echo 'Please run "make install" to install.'

install_truckle: truckle
	mkdir -p $(D)$(BIN_PREFIX)
	install -m 0755 truckle $(D)$(BIN_PREFIX)/truckle
	for c in `./truckle --list-commands`; do ln -fs truckle $(D)$(BIN_PREFIX)/truckle-$${c} ; done
	for c in trdo tresume tretry; do ln -fs truckle $(D)$(BIN_PREFIX)/$${c} ; done

install_cave_commands:
	mkdir -p $(D)$(CAVE_COMMANDS_PREFIX)
	install -m 0755 -o root -g root -t $(D)$(CAVE_COMMANDS_PREFIX) cave_commands/*

install_configs:
	mkdir -p $(D)$(PROFILE_DIR) $(D)$(SUDOERS_DIR)
	install -m 0644 -o root -g root configs/profile.sh $(D)$(PROFILE_DIR)/cave.sh
	install -m 0440 -o root -g root configs/sudoers $(D)$(SUDOERS_DIR)/cave

install: install_truckle install_cave_commands install_configs

README.md: truckle README.pre.md
	( cat README.pre.md ; ./truckle --help ) > README.md.tmp
	mv README.md.tmp README.md

release: README.md
