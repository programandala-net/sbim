" sbim.ftdetect.vim
" (~/.vim/ftdetect/sbim.vim)

" Vim filetype detect for SBim (S*BASIC improved)

" This file is part of SBim
" http://programandala.net/es.programa.sbim.html

" Author: Marcos Cruz (programandala.net), 2015, 2016

" License:

" You may do whatever you want with this work, so long as you
" retain the copyright/authorship/acknowledgment/credit
" notice(s) and this license in all redistributed copies and
" derived works.  There is no warranty.

" History:

" 2015-12-26: Start.
" 2016-01-19: Updated header.

autocmd BufNewFile,BufRead *_sbim setlocal filetype=sbim
autocmd BufNewFile,BufRead *_sbim runtime sbim.vim

autocmd BufNewFile,BufRead *.sbim setlocal filetype=sbim
autocmd BufNewFile,BufRead *.sbim runtime sbim.vim
