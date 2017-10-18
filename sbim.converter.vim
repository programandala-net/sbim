" sbim.converter.vim
" (~/.vim/sbim.vim)

" This file is part of SBim
" http://programandala.net/es.programa.sbim.html

" Last modified 201710181334
" See change log at the end of the file

" ==============================================================
" Description

" This VimL program converts S*BASIC source code written in the
" SBim format to an ordinary S*BASIC file ready to be loaded by
" a S*BASIC interpreter.

" ==============================================================
" Author and license

" Author: Marcos Cruz (programandala.net), 2011, 2012, 2015,
" 2016, 2017

" You may do whatever you want with this work, so long as you
" retain the copyright/authorship/acknowledgment/credit
" notice(s) and this license in all redistributed copies and
" derived works.  There is no warranty.

" ==============================================================

if exists("*SBim")
  " Function `SBim` is already defined.
  finish
endif

" ==============================================================
" Generic functions {{{1

function! Trim(input_string)
  " Remove trailing spaces from a string.
  " Reference:
  " http://stackoverflow.com/questions/4478891/is-there-a-vimscript-equivalent-for-rubys-strip-strip-leading-and-trailing-s
  return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

" ==============================================================
" Cleaning {{{1

function! SBimClean()

  silent %s,\t\+, ,ge " Remove tabs
  echo 'Tabs removed.'

  silent %s,\(^\s*\|\s\+\)'\(\s.*\)\?$,,e " Remove line comments
  echo 'Comments removed.'

  silent %s,^\s*\n,,ge " Remove the empty lines
  echo 'Empty lines removed.'

  silent %s,^\s*\(.\+\)\s*$,\1,e " Remove blanks
  echo 'Indentation and blanks removed.'

  silent %s,\\\s*\n,,e " Join the splitted lines 
  echo 'Splitted lines joined.'

endfunction

" ==============================================================
" Renum

function! SBimRenum()

  " Put line numbers;
  " remove spaces from blank lines;
  " save the file.

  " Call the the nl program (part of the Debian coreutils package):
  execute ":silent %!nl --body-numbering=t --number-format=rn --number-width=5 --number-separator=' ' --starting-line-number=".s:renumLine." --line-increment=1"

  " In older versions of coreutils,
  " -v sets the first line number, and -i sets the line increment.
  " (the long option for -v doesn't work, though the manual mentions it).
  " Modern versions of nl uses the clearer options
  " --first-line and --line-increment, see:
  " http://www.gnu.org/software/coreutils/manual/coreutils.html#nl-invocation

  " Remove all spaces from lines that only contain spaces:
  ":%s/^\s\+$//

  " Remove spaces before line numbers
  "(nl has no option to remove them):
  silent %substitute/^\s*//e

  echo 'Line numbers added.'

endfunction

function! SBimGetRenumLine()

  " Store into s:renumLine the first line number
  " to be used by the final S*BASIC program
  " The directive `#renum` can be used to set
  " the desired line number. Only the first occurence
  " of `#renum` will be used; it can be anywhere
  " in the source but always at the start of a line
  " (with optional indentation).

  let s:renumLine=1 " default value
  
  call cursor(1,1)
  if search('^\s*#renum\s\+[0-9]\+\>','Wc')
    let l:valuePos=matchend(getline('.'),'^\s*#renum\s*')
    let s:renumLine=strpart(getline('.'),l:valuePos)
    call setline('.','')
  endif
  echo 'Renum line: '.s:renumLine

endfunction

" ==============================================================
" #include {{{1

function! SBimInclude()

  " Execute all '#include' directives.

  " Syntax:
  " #include filename

  " Warning: nested including is possible, but no recursion check is made!

  call cursor(1,1) " Go to the top of the file.
  let l:includedFiles=0 " Counter
  while search('^\s*#include\s\+','Wc')
    let l:includedFiles += 1
    let l:filename=matchstr(getline('.'),'\S\+.*',8)
    call setline('.',"' <<< start of included file ".l:filename)
    call append('.',"' >>> end of included file ".l:filename)
    let l:filecontent=readfile(s:sourceFileDir.'/'.l:filename)
    call append('.',l:filecontent)
  endwhile

  if l:includedFiles==0
    echo 'No file included'
  elseif l:includedFiles==1
    echo 'One file included'
  else
    echo l:includedFiles 'files included'
  endif

endfunction

" ==============================================================
" Conditional conversion {{{1

function! SBimDefine()

  " Search and execute all '#define' directives.

  " There can be any number of '#define' directives, but they
  " must be alone on their own source lines (with optional
  " indentation).

  call cursor(1,1) " Go to the top of the file
  while search('^\s*#define\s\+','Wc')
    let l:definition=getline('.')
    let l:tagPos=matchend(l:definition,'^\s*#define\s\+')
    let l:tag=strpart(l:definition,l:tagPos)
    if !empty(l:tag)
      call add(s:definedTags,l:tag)
    endif
    call setline('.','')
  endwhile

  let l:tags=len(s:definedTags)
  if l:tags==1
    echo l:tags.' #define directive'
  elseif l:tags>1
    echo l:tags.' #define directives'
  endif

endfunction

function! SBimDefined(needle)

  " Is _needle_ a defined tag?

"  echo "XXX About to search for the <".a:needle."> tag!"
  let l:found=0 " XXX needed, but why? Otherwise, error: undefined variable
  for l:tag in s:definedTags
"      echo 'XXX tag: '.l:tag
      let l:found=(l:tag==a:needle)
      if l:found
          break
      endif
  endfor
  return l:found

endfunction

function! SBimConditionalConversion()

  " Parse and interpret all conditional conversion directives.

  " XXX TODO -- Make the structure nestable.

  " Syntax:
  "
  "   #if[n]def tag
  "     ...
  "   #else
  "     ...
  "   #endif

  " Note: The conditions can not be nested.

  call cursor(1,1)

  let l:unresolvedCondition=0 " flag

  while search('^\s*#if\(n\)\?def\s\+.\+$','Wc')

    let l:else=0 " flag

"    echo 'XXX first #if[n]def found'

    while line('.')<line('$') " not at the end of the file?

      let l:currentLine=getline('.')

      if l:currentLine=~'^\s*#ifdef\s\+.\+'
        " #IFDEF
"        echo 'XXX #ifdef found'
        if l:unresolvedCondition
          echoerr '`#if[n]def` structures can not be nested'
          break
        else
          call SBimIfdef()
          let l:unresolvedCondition=1
        endif
      elseif l:currentLine=~'^\s*#ifndef\s\+.\+'
        " #IFNDEF
"        echo 'XXX #ifndef found ----------------------'
        if l:unresolvedCondition
          echoerr '`#ifndef` structures can not be nested'
          break
        else
          call SBimIfdef()
          let l:unresolvedCondition=1
        endif
"      elseif l:currentLine=~'^\s*#elseifdef\s\+.\+'
"        " #ELSEIFDEF
"        call setline('.','')
"        if !l:unresolvedCondition
"          " XXX TODO
"        endif
"      elseif l:currentLine=~'^\s*#elseifndef\s\+.\+'
"        " #ELSEIFNDEF
"        call setline('.','')
"        if !l:unresolvedCondition
"          " XXX TODO
"        endif
      elseif l:currentLine=~'^\s*#else\s*$'
        " #ELSE
"        echo 'XXX #else found'
        if l:else
          echoerr 'More than one `#else` in a `#if[n]def` structure'
          break
        else
          let l:else=1
          call setline('.','')
          let s:keepSource=!s:keepSource
        endif
      elseif l:currentLine=~'^\s*#endif\s*$'
        " #ENDIF
"        echo 'XXX #endif found'
        call setline('.','')
        let l:unresolvedCondition=0
        break
      else
        if l:unresolvedCondition && !s:keepSource
            call setline('.','')
        endif
      endif

      call cursor(line('.')+1,1) " go to the next line

    endwhile

    if l:unresolvedCondition
      echoerr '`#if[n]def` or `#endif` at line '.l:ifLineNumber
    endif

  endwhile

  echo 'Conditional conversion done'

endfunction

function! SBimIfdef()

    let l:ifLineNumber=line('.')
    let l:tagPos=matchend(getline('.'),'^\s*#if\(n\)\?def\s\+')
    let l:tag=Trim(strpart(getline('.'),l:tagPos))
"    echo 'XXX l:tag='.l:tag
    let l:tagMustBeDefined=(getline('.')=~'^\s*#ifdef')
"    echo 'XXX l:tagMustBeDefined='.l:tagMustBeDefined
    let l:tagIsDefined=SBimDefined(l:tag)
"    echo 'XXX l:tagIsDefined='.l:tagIsDefined
    let s:keepSource=(l:tagMustBeDefined && l:tagIsDefined) || (!l:tagMustBeDefined && !l:tagIsDefined)
"    echo 'XXX s:keepSource='.s:keepSource
    call setline('.','')

endfunction

" ==============================================================
" Labels

function! SBimLabels()

  " Translate the line labels.

  " Join lonely labels to the next line:
  silent! %substitute,^\s*\(\(label\s\+\)\?@[0-9a-zA-Z_]\+\)\s*\n,\1:,ei

  " Create an empty dictionary to store the line numbers of the
  " labels; the labels will be used as keys:
  let l:lineNumber={}
  " Go to the top of the file:
  normal gg
  " Store every label into the dictionary:
  while search('\(^\|:\)\s*\(label\s\+\)\?@[0-9a-zA-Z_]\+\>','Wc')
    " Store the label in the 'l' register:
    normal "l2yw
    " Debug message:
    " echo 'Raw label found: <' . getreg('l',1) . '>'
    " If the label is the second one in a line, remove the semicolon:
"     if stridx(getreg('l',1),':')==0
"      call setreg('l',strpart(getreg('l',1),1))
"    endif
    " If 'label' is present, go to the next word and repeat:
    if tolower(getreg('l',1))=='label @'
      normal w"l2yw
      " Debug message:
      " echo 'Actual raw label found: <' . getreg('l',1) . '>'
    endif
    " Remove possible ending spaces:
    let l:label=tolower(substitute(getreg('l',1),' ','','g'))
    " Debug message:
    "echo 'Clean label: <' . l:label . '>'
    " Use the label as the key to store the line number:
    let l:lineNumber[l:label]=line('.')+s:renumLine-1
    " Go to the next word:
    normal w
  endwhile
  
  " Debug message:
  "echo l:lineNumber

  " Remove the label definitions:
  silent! %substitute/^\s*\(label\s\+\)\?@[0-9a-zA-Z_]\+\s*:\?\s*//ei

  " Substitute every label reference with its line number:
  for l:label in keys(l:lineNumber)
    " Go to the top of the file:
    normal gg
    " Debug message:
    "echo 'About to translate label '.l:label
    " Do the subtitution:
    while search(l:label,'W')
      " Debug message:
      "echo 'Label '.l:label.' found'
      "execute "silent! substitute,".l:label."\\>,".l:lineNumber[l:label].","
      silent! execute "substitute,".l:label."\\>,".l:lineNumber[l:label].","
      " Debug message:
      "echo l:label.' --> '.l:lineNumber[l:label]
    endwhile
  endfor

  echo 'Labels translated.'

endfunction

" ==============================================================
" Output file

function! SBimOutputFile(outputFile)

  if empty(a:outputFile)
    let l:outputFile=expand('%').'_bas'
  else
    let l:outputFile=a:outputFile
  endif

  " Filename of the source file, without path
  "let s:sourceFilename=fnamemodify(expand('%'),':t')

  " Absolute directory of the source file
  let s:sourceFileDir=fnamemodify(expand('%'),':p:h')

  silent update " Write the current SBim file if needed
  split " Split the window

  " Save a copy of the input file as output file:
  silent execute 'write! '.l:outputFile

  " Open the output file for editing:
  silent execute 'edit '.l:outputFile
  set fileencoding=latin1
  set fileformat=unix " Force NL (char 10) as end of line
  
  echo 'S*BASIC file created.'

endfunction

" ==============================================================
" Main

function! SBim(outputFile)

  let s:ignoreCaseBackup=&ignorecase
  set ignorecase

  let s:definedTags=[] " a list for the '#define' tags

  call SBimOutputFile(a:outputFile)
  call SBimInclude()
  call SBimGetRenumLine()
  call SBimDefine()
  call SBimConditionalConversion()
  call SBimClean()
  call SBimLabels()
  call SBimRenum()

  silent w
  silent bw
  echo 'S*BASIC file saved and closed.'

  if s:ignoreCaseBackup
    set ignorecase
  else
    set noignorecase
  endif

  echo 'Done!'

endfunction

" Shortkey '_bas' in normal mode to create an S*BASIC file:
nmap <silent> _bas :call SBim("")<CR>

" ==============================================================
" Change log

" 2011-08-13: First version, named sb2sbasic.vim, based on
" vim2mb.vim ("Vim to MasterBASIC"), by the same author. [vim2mb
" was the origin of MBim].
"
" 2011-08-16: Added removing of blanks (tabs or spaces) at the
" end of lines; added start line parameter for renumbering;
" created alternative shortcut key to create boot files.
"
" 2011-08-25: Added C style comments, block and inline.
"
" 2011-09-01: Renamed to sbim2bas.vim; own renum function
" instead of using that of line_numbers.vim; all functions
" renamed with the "SBim" prefix.
"
" 2011-09-26: Renamed to sbim2sb.vim; some functions renamed;
" some comments improved.
"
" 2011-10-04: Block comments fixed with '\{-}'; 'silent' added
" to many commands; 'e' flag added to substitutions; custom
" messages added.
"
" 2012-01-25: New function SBimLabels(), based on BBimLabels()
" from BBim.  Fixed: lonely labels had to be joined with the
" next line; optional final ":" removed with labels.
"
" 2012-01-26: The character to split lines now is backslash
" instead of the vertical bar.
"
" 2012-01-28: Improvement: labels are not case sensitive any
" more.
"
" 2012-01-28: New feature: #firstline command to define the
" first line that will be used to renumber the final program in
" S*BASIC.
"
" 2012-01-28: Improvement: The S*BASIC buffer is actually closed
" with "bw" ("wq" kept it on the list).
"
" 2012-01-29: Improvement: Only one regex, simpler and fixed, to
" remove empty lines (the old three regex left the first line of
" the file blank).
"
" 2012-01-29: Fixed: Spaces or tabs at the end of line, after
" the split bar, are ignored.
"
" 2012-02-01: Bug found. The label translation loop doesn't end
" in some cases.
"
" 2012-02-15: Fixed? The 'c' parameter was removed from search()
" in the label translation loop.
"
" 2015-12-26: Changed the layout of the source. Renamed the
" program to "SBim".  Changed the license. 
"
" 2016-01-13: Fixed `SBimGetFirstLine()`: the directive was
" yanked instead of the line number.
"
" 2016-01-19: Typo. Updated header.
"
" 2016-01-25: Added `#include` directive.
"
" 2017-09-12: Make the output file configurable. Improve the
" line comments with one mandatory sourrounding space.  Allow
" Bash-style line comments at the end of the line. Add
" BASIC-style line comments with a single quote.
"
" 2017-09-20: Remove support for C-style and Bash-style
" comments. Fix the call in the map (missing parameter).
"
" 2017-09-21: Replace the C-style comment added by
" `SBimInclude()` with the new BASIC-style comment.
"
" 2017-09-28: Add a check to prevent the code from being loaded
" twice.
"
" 2017-09-29: Prepare implementation of conditional conversion
" (`#define`, `#ifdef`, `#ifndef`) -- code copied from
" Imbastardizer.
"
" 2017-10-17: Fix and tidy Imbastardizer's code about
" conditional conversion.
"
" 2017-10-18: Rename `#firstline` to `#renum`, `s:firstLine` to
" `s:renumLine` and `GetFirstLine` to `GetRenumLine`. Improve
" function `GetRenumLine`.

" vim: textwidth=64:ts=2:sw=2:sts=2:et
