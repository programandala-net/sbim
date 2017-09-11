#!/bin/sh

# UNINSTALL.sh

# This file is part of SBim
# http://programandala.net/es.programa.sbim.html

# ==============================================================
# Description

# SBim uninstaller.
#
# Usage:
#
#   ./UNINSTALL.sh

# ==============================================================
# Author and license

# Author: Marcos Cruz (programandala.net), 2015, 2016, 2017

# You may do whatever you want with this work, so long as you
# retain the copyright/authorship/acknowledgment/credit
# notice(s) and this license in all redistributed copies and
# derived works.  There is no warranty.

# ==============================================================

rm -f ~/.vim/sbim.vim
rm -f ~/.vim/ftdetect/sbim.vim
rm -f ~/.vim/ftplugin/sbim.vim
rm -f ~/.vim/syntax/sbim.vim
rm -f ~/.vim/syntax/superbasic.vim

exit 0

# ==============================================================
# Change log

# 2015-12-26: First version.
#
# 2016-01-19: Update header.
#
# 2016-01-25: Add <ftplugin/sbim.vim>.
#
# 2016-12-09: Add syntax files.
#
# 2017-09-11: Remove <CONFIG.sh>. Use <~/.vim>.
