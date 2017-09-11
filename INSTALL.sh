#!/bin/sh

# INSTALL.sh

# This file is part of SBim
# http://programandala.net/es.programa.sbim.html

# ==============================================================
# Description

# SBim installer.
#
# Usage:
#
#   ./INSTALL.sh

# ==============================================================
# Author and license

# Author: Marcos Cruz (programandala.net), 2015, 2016, 2017

# You may do whatever you want with this work, so long as you
# retain the copyright/authorship/acknowledgment/credit
# notice(s) and this license in all redistributed copies and
# derived works.  There is no warranty.

# ==============================================================

install -D --m 644 sbim.converter.vim ~/.vim/sbim.vim
install -D --m 644 sbim.ftdetect.vim ~/.vim/ftdetect/sbim.vim
install -D --m 644 sbim.ftplugin.vim ~/.vim/ftplugin/sbim.vim
install -D --m 644 sbim.syntax.vim ~/.vim/syntax/sbim.vim
install -D --m 644 superbasic.syntax.vim ~/.vim/syntax/superbasic.vim

exit 0

# ==============================================================
# Change log

# 2015-12-26: First version.
#
# 2016-01-19: Update header.
#
# 2016-01-25: Add <sbim.ftplugin.vim>.
#
# 2016-12-09: Add syntax files.
#
# 2017-09-11: Fix installation of SuperBASIC syntax file.  Rewrite
# with `install`. Remove <CONFIG.sh>. Use <~/.vim>.
