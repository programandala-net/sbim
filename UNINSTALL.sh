#!/bin/sh

# UNINSTALL.sh

# This file is part of SBim
# http://programandala.net/es.programa.sbim.html

# ##############################################################
# Author and license

# Author: Marcos Cruz (programandala.net), 2015, 2016

# You may do whatever you want with this work, so long as you
# retain the copyright/authorship/acknowledgment/credit
# notice(s) and this license in all redistributed copies and
# derived works.  There is no warranty.

# ##############################################################
# Description

# This program uninstalls SBim.
#
# Edit <CONFIG.sh> first to suit your system.

# ##############################################################
# Usage

#   UNINSTALL.sh

# ##############################################################
# History

# 2015-12-26: First version.
# 2016-01-19: Update header.
# 2016-01-25: Add <ftplugin/sbim.vim>.
# 2016-12-09: Add syntax files.

# ##############################################################

. ./CONFIG.sh

rm -f $VIMDIR/sbim.vim
rm -f $VIMDIR/ftdetect/sbim.vim
rm -f $VIMDIR/ftplugin/sbim.vim
rm -f $VIMDIR/syntax/sbim.vim
rm -f $VIMDIR/syntax/superbasic.vim

