# CONFIG.sh 

# This file is part of SBim
# http://programandala.net/en.program.sbim.html

# ##############################################################
# Author and license

# Copyright (C) 2015 Marcos Cruz (programandala.net)

# You may do whatever you want with this work, so long as you
# retain the copyright notice(s) and this license in all
# redistributed copies and derived works. There is no warranty.

# ##############################################################
# Description

# This program configures the installation of SBim.
#
# Change it to suit your system.

# ##############################################################
# History

# 2015-12-26: First version.

# ##############################################################
# Installation directories

# Current user installation:

VIMDIR=~/.vim

# System-wide installation:

#VIMDIR=/usr/share/vim/vimcurrent/

# ##############################################################
# Intallation command

# Create hard links:

#INSTALLCMD="ln -f "

# Create symbolic links:

INSTALLCMD="ln -s -f $(pwd)/"

# Copy the files:

#INSTALLCMD="cp -f -p "

