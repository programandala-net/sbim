" sbasic2sbim.vim
"
" Convert a S*BASIC program to the SBim format.
"
" Author: Marcos Cruz (http://programandala.net)
"
" 2016-01-17: Start.
" 2016-01-19: Added filetype.

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
