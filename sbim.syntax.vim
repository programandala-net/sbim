" sbim.vim
" Vim syntax file
" Language:    SBim (S*BASIC improved) for the QL computer
" Author:      Marcos Cruz (programandala.net)
" License:     Vim license (GPL compatible)
" URL:         http://programandala.net/es.programa.sbim_vim_syntax_file.html
" Updated:     2016-01-12

" This syntax file is not a complete implementation yet.

" ----------------------------------------------

" History:

" 2011-08-13 First version.
" 2011-08-25 C style comments added, block in inline.
" 2011-09-01 Renamed to SBim (formerly SB).
" 2012-01-25 Labels added.
" 2012-01-26 The character to split lines now is backslash instead of the vertical bar.
" 2012-01-27 Fixed. The backslash was not highlighted when a line comment followed it. 
" 2012-01-27 Fixed. The hash was not properly highlighted when it was the only character in the line. 
" 2012-01-27 Modifed. "sbimMetaComment" is not highlighted apart anymore; "sbimCommentedOut" is used in all cases.
" 2012-12-16 The edit options are moved to <~/.vim/ftplugin/sbim.vim>.
" 2015-02-26: Vim license.
" 2016-01-12: Added `#firstline`; replaced the old the to-do mark with new ones.
" 2016-01-25: Added `#include`.

" ----------------------------------------------

" SBim is an improved format for QL's S*BASIC source code.

" Features:

" Tabs can be used for indentation. All indentation is removed.
" Line comments with # (it must be the first non-empty char in the line).
" Line comments with // (anywhere in the line, even at the end of splitted lines; any spaces or tabs before the mark are removed too).
" Block comments with /* */ (the opening mark must be the first non-empty char in the line).
" Empty lines.
" Lines splitted with \.

" Planned features:

" Labels.

" ----------------------------------------------

" This syntax file simply loads the standard
" S*BASIC syntax file, adds the highlights for the new
" comments and sets the tabs and text folding preferences.

" The sbim2bas.vim program is used to convert
" the SBim format source code
" into the standard S*BASIC format.

" ----------------------------------------------

:runtime! syntax/superbasic.vim " Include the standard S*BASIC syntax file

" Line numbers are not used:
syntax clear superbasicLineNumber	

syn keyword sbimTodo contained todo fixme xxx

syn region sbimLabel start="^\s*\(label\s\+\)\?@[a-zA-Z0-9_]\+" end="\>"

" syn region sbimMetaComment start="^\s*#[# ]*" end="$" contains=sbimTodo
"syn region sbimCommentedOut start="^#[^# ]" end="$" contains=sbimTodo 
syn match sbimCommentedOut "^\s*#.*$"
syn region sbimLineComment start="//" end="$" contains=sbimTodo
syn region sbimBlockComment start="^\s*/\*" end="\*/" contains=sbimTodo 

syn match sbimPreProc "^#firstline\s\+\d\+"
syn match sbimPreProc "^#include\s\+\S\+"

" old format (vertical bar to split the lines):
"syn match sbimSplittedLine "|\s*\(//.*\)*$" contains=sbimLineComment
" new format (backslash to split the lines):
syn match sbimSplittedLine "\\\s*\(//.*\)\?$" contains=sbimLineComment

hi def link sbimMetaComment Comment
"hi def link sbimCommentedOut Ignore
hi def link sbimCommentedOut Comment
hi def link sbimLineComment Comment
hi def link sbimBlockComment Comment
"hi def link sbimSplittedLine Ignore
hi def link sbimSplittedLine Comment
hi def link sbimTodo Todo
hi def link sbimLabel Comment
hi def link sbimPreProc PreProc

let b:current_syntax = "sbim"
