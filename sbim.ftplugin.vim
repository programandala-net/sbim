" sbim.ftplugin.vim
" (~/.vim/ftplugin/sbim.vim)

" Vim filetype plugin for SBim (S*BASIC improved)

" This file is part of SBim
" http://programandala.net/es.programa.sbim.html

" Author: Marcos Cruz (programandala.net), 2012, 2016, 2017

" License:

" You may do whatever you want with this work, so long as you
" retain the copyright/authorship/acknowledgment/credit
" notice(s) and this license in all redistributed copies and
" derived works.  There is no warranty.

" History:

" 2012-12-16: First version.
" 2016-01-21: Add `formatoptions` and `commentstring`.
" 2017-09-13: Add single-quote line comments.
" 2017-09-20: Remove C-style and Bash-style comments.

setlocal comments=b:'
setlocal expandtab
setlocal foldmethod=marker
setlocal ignorecase
setlocal shiftwidth=2
setlocal smartcase
setlocal smartindent
setlocal softtabstop=0
setlocal tabstop=2

setlocal formatoptions=cqorj
" Note: The "j" flag removes a comment leader when joining lines.
" See ":help fo-table".

" Used by the Vim-Commentary plugin:
setlocal commentstring='%s
