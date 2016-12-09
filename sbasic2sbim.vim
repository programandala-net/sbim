" sbasic2sbim.vim
"
" Convert a S*BASIC program to the SBim format.

" This file is part of SBim
" http://programandala.net/en.program.sbim.html

" Author: Marcos Cruz (programandala.net), 2016

" License:

" You may do whatever you want with this work, so long as you
" retain the copyright/authorship/acknowledgment/credit
" notice(s) and this license in all redistributed copies and
" derived works.  There is no warranty.

" History:

" 2016-01-17: Start.
" 2016-01-19: Add filetype.
" 2016-12-09: Add this converter to SBim. Add usage comment.

" Usage:

" 1. Open your S*BASIC program in Vim.
" 2. Execute this converter with the `source` ex command of Vim.
" 3. Write the converted source with different filename.

" ==============================================================

" Remove line numbers:
%s@^\d\+ @@

" Remove colon separators:
%s@^\s*:\s*$@@c

" Short and lowercase keywords:
%s@DEFine PROCedure@defproc@e
%s@DEFine FuNction@deffn@e
%s@END DEFine@enddef@ge
%s@END IF@endif@ge
%s@END REPeat@endrep@ge
%s@END SELect@endsel@ge
%s@REMark@rem@ge
%s@LOCal@loc@ge
%s@REPeat@rep@ge
%s@RETurn@ret@ge
%s@SELect@sel@ge
%s@ THEN @:@ge
%s@ THEN$@@
%s@GO TO@goto@ge
%s@GO SUB@gosub@ge

" Lowercase keywords:
%s@\<\([A-Z_]\+[$%]\?\)\>@\L\1\E@ge

setlocal filetype=sbim
