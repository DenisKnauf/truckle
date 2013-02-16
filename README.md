truckle and cave
================

`cave` is very powerful package mangler.  If you do not know it, you will not know exherbo, too.  So you should try exherbo or you never will need `truckle`.

`truckle` will do thing, which `cave` will never do, for example uses a pager automaticaly for longer output.  Useful if you want to install many packages.  And will use `sudo` if needed.

Why did not `cave` provide these things?  It's unclean and it should be clean.  While `cave` is a very powerful package mangler, `truckle` is a smart tool for often used functions of `cave`

Usage
=====

truckle *PREARGS Command *ARGS

Arguments
=========

Precede the command, it's possible to set some arguments.
These Arguments really must precede the command.

- `-C|--list-commands` will list all possible commands and exit.
- `-h|--help` will print this help and exit.
- `-n|--dummy` will print the shellcode, which will be executed, if not --dummy.
- `-s|--sudo on|off|auto` will use (or not) sudo if you are not root.
- `-c|--color|--colour on|off|auto` will control the colorfull output of `cave`.
- `-L|--log-level LOGLEVEL` will control the log-level of `cave`.
- `-p|--pager PAGER` will change the pager to display.

Instead of on|off you can use 0|true or 1|false too.  Default is everytime auto.

Environment
===========

- `DUMMY=1` will print the shellcode, which will be executed, like `--dummy`.
- `NOSUDO=1` will prevent of using sudo, if you are not root, like `--sudo off`.
- `PAGER=more` will change the pager to more, instead of less, like `--pager more`.

Commands
========

Most commands are like by cave.

- `search` is pagered.
- `show` is pagered.
- `resolve` is pagered and resumable. Do *not* use `-x`! Use `resume`.
- `install` is resumable and like `cave resolve -x`.
- `upgrade` is pagered and resumable and like `cave resolve -c world`. Do *not* use `-x`! Use `resume`.
- `remove` is pagered, resumable and like `cave uninstall`. Do *not* use `-x`! Use `resume`.
- `uninstall` is resumable and like `cave uninstall -x`.
- `fix-linkage` is pagered and resumable.
- `do` and `resume` are resumable and will resume or execute the last command.

Resumable
=========

You do not need to set a resume-file. truckle will determine it automaticaly. First, you can give a first argument for tagging. Tag must be numerical!

	truckle 321 resolve netcat6
	truckle 321 do

If you do not give a tag, truckle will use the actual terminal-device-number. If it isn't possible to determine terminal, the parent-pid will be used.

Like cave but different
=======================

Some commands will be displayed by a pager, so you can scroll up and down like

	truckle resolve WHAT    # cave -cy resolve WHAT | less -R
	truckle remove WHAT     # cave -cy uninstall WHAT | less -R

Some commands are not displayed by a pager, but will execute:

	truckle install WHAT    # cave -cy resolve -x WHAT
	truckle uninstall WHAT  # cave -cy uninstall -x WHAT

«do» and «resume» are special, to execute the last command:

	truckle resume # | do   # cave resume
	trdo # | tresume        # shortcuts
