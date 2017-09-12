# Makefile

# This file is part of SBim
# http://programandala.net/es.programa.sbim.html

# Author: Marcos Cruz (programandala.net), 2017

# Last modified 201709130015
# See change log at the end of the file

# ==============================================================
# User config

# Default:
BINDIR = ~/bin

# Possible alternative:
# BINDIR = ~/.local/bin

# ==============================================================

MAKEFLAGS = --no-print-directory

.ONESHELL:

.PHONY: all
all:
	@echo "SBim (un)installler"
	@echo
	@echo "Usage:"
	@echo
	@echo "  make install"
	@echo "  make uninstall"
	@echo
	@echo "Edit <Makefile> to config the local binary directory."
	@echo "Default: <~/bin>."

.PHONY: install
install:
	install -D --m 644 sbim.converter.vim ~/.vim/sbim.vim
	install -D --m 644 sbim.ftdetect.vim ~/.vim/ftdetect/sbim.vim
	install -D --m 644 sbim.ftplugin.vim ~/.vim/ftplugin/sbim.vim
	install -D --m 644 syntax/sbim.vim ~/.vim/syntax/sbim.vim
	install -D --m 644 syntax/superbasic.vim ~/.vim/syntax/superbasic.vim
	install -D --m 755 sbim.sh $(BINDIR)/sbim

.PHONY: uninstall
uninstall:
	rm -f ~/.vim/sbim.vim
	rm -f ~/.vim/ftdetect/sbim.vim
	rm -f ~/.vim/ftplugin/sbim.vim
	rm -f ~/.vim/syntax/sbim.vim
	rm -f ~/.vim/syntax/superbasic.vim
	rm -f $(BINDIR)/sbim

# ==============================================================
# Change log

# 2017-09-12: First version, to replace <INSTALL.sh> and
# <UNINSTALL.sh>.
#
# 2017-09-13: Update paths.
