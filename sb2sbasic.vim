" sb2sbasic.vim

" Copyright (C) 2011 Marcos Cruz (programandala.net)

" This Vim command program provides some functions needed to
" translate customized S*BASIC source code written with Vim
" into an ordinary S*BASIC file ready to be loaded by any
" S*BASIC interpreter.

" 2011-08-13 First version, based on vim2mb.vim (Vim to MasterBASIC)
" 2011-08-16 Added removing of blanks (tabs or spaces) at the end of lines; added start line parameter for renumbering; created alternative shortcut key to create boot files.
" 2011-08-25 Added C style comments, block and inline.
" 2011-09-01 Deprecated. Renamed to sbim2bas.vim.

" To do: remove line number highlighting.

source line_numbers.vim

function! SBCleanCode()

	:set fileencoding=latin1
	:set fileformat=unix
	:%s/^\s*#.*$// " Remove the # line comments
	:%s/\s*\/\/.*$// " Remove the // line comments
  :%s/^\s*\/\*\_.*\*\/// " Remove the /* */ block comments
	:%s/^\s\+// " Remove the empty lines
	:%s/\n\n\+/\r/g " Remove the empty lines
	:%s/^\s*//g " Remove indentation
  :%s/\s\+$//g " Remove ending blanks
	:%s/|\n// " Join the splitted lines (the vertical bar is used, because the backslash is a printing separator is S*BASIC)

endfunction

function! SBfile()
  :write
  " The % substitution does not work with buffers:
  " :bwipe! %_bas
  :split
  :write! %_bas
  :edit %_bas
endfunction

function! SB2sbasic(first_line)

  :call SBfile()
	:set noignorecase
	:call SBCleanCode()
	:set ignorecase
  :call Renum(a:first_line,1)
  :wq

endfunction

" Shortkey ',s' in normal mode
" to create SBASIC file:
nmap <silent> ,s :call SB2sbasic(1)<CR>
" Shortkey ',b' in normal mode
" to create SBASIC boot file:
nmap <silent> ,b :call SB2sbasic(32000)<CR>

