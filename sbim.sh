#!/bin/sh

# sbim.sh

# This file is part of SBim
# http://programandala.net/en.program.sbim.html

# Last modified 201709120145
# See change log at the end of the file

# By Marcos Cruz (programandala.net), 2017

# ==============================================================
# Description

# Command line wrapper for <~/.vim/plugins/sbim.vim>.
#
# Usage:
#
#   sbim inputfile [outputfile]

# ==============================================================
# Error checking

usage(){
  echo "Convert an SBim-format source file to a S*BASIC source"
  echo 'Usage:'
  echo "  ${0##*/} inputfile [outputfile]"
  }

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ] ; then
  usage
  exit 1
fi

if [ ! -e "$1"  ] ; then
  echo "<$1> does not exist"
  exit 1
fi

if [ ! -f "$1"  ] ; then
  echo "<$1> is not a regular file"
  exit 1
fi

if [ ! -r "$1"  ] ; then
  echo "<$1> can not be read"
  exit 1
fi

if [ ! -s "$1"  ] ; then
  echo "<$1> is empty"
  exit 1
fi

# ==============================================================
# Main

# Vim options used:
# -e = Enter Vim in ex mode (in this case, the goal is just
#      preventing Vim from clearing the screen).
# -n = No swap file will be used. This makes it possible
#      to convert a file currently open by other instance of Vim,
#      without asking the user for confirmation.
# -s = Silent mode (does not affect BAS2TAP messages).
# -S = Vim file to be sourced after the first file has been read.
# -c = Vim command to be executed after the first file has been read.

vim -e -n -S ~/.vim/sbim.vim -c "call SBim('$2') | q!" $1
exit $?

# ==============================================================
# Change log

# 2017-09-11: Start, based on Vimclair BASIC.
#
# 2017-09-12: Add configurable output file.

# vim:tw=78:ts=2:sts=2:et:
