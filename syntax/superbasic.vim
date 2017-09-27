" superbasic.vim
" Vim syntax file
" Language: SuperBASIC and SBASIC (for the QL computer)
" Author:   Marcos Cruz (programandala.net)
" License:  Vim license (GPL compatible)
" URL:      http://programandala.net/en.program.superbasic_vim_syntax_file.html
" Updated:  2017-09-25

" This syntax file is not a complete implementation yet.

" History: See at the end of the file

" -------------------------------------------------------------
" To-do

" - Toolkit 3 keywords.
" Bug: in "xxKEYWORD$", "KEYWORD$" is highlighted.

" -------------------------------------------------------------

" For Vim version 5.x: Clear all syntax items
" For Vim version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if version > 600
  setlocal iskeyword=48-57,65-90,97-122,_,$,%
else
  set iskeyword=48-57,65-90,97-122,_,$,%
endif

syn case ignore

" -------------------------------------------------------------

" Standard QL SuperBASIC keywords

syn keyword superbasicFunction ABS
syn keyword superbasicFunction ACOS
syn keyword superbasicFunction ACOT
syn keyword superbasicProcedure ADATE
syn keyword superbasicStatement AND
syn keyword superbasicProcedure ARC
syn keyword superbasicProcedure ARC_R
syn keyword superbasicFunction ASIN
syn keyword superbasicProcedure AT
syn keyword superbasicFunction ATAN
syn keyword superbasicProcedure AUTO
syn keyword superbasicProcedure BAUD
syn keyword superbasicProcedure BEEP
syn keyword superbasicFunction BEEPING
syn keyword superbasicProcedure BLOCK
syn keyword superbasicProcedure BORDER
syn keyword superbasicProcedure CALL
syn keyword superbasicFunction CHR$
syn keyword superbasicProcedure CIRCLE
syn keyword superbasicProcedure CIRCLE_R
syn keyword superbasicProcedure CLEAR
syn keyword superbasicProcedure CLOSE
syn keyword superbasicProcedure CLS
syn keyword superbasicFunction CODE
syn keyword superbasicProcedure CONTINUE
syn keyword superbasicProcedure COPY
syn keyword superbasicProcedure COPY_N
syn keyword superbasicFunction COS
syn keyword superbasicFunction COT
syn keyword superbasicProcedure CSIZE
syn keyword superbasicProcedure CURSOR
syn keyword superbasicProcedure DATA
syn keyword superbasicFunction DATE
syn keyword superbasicFunction DATE$
syn keyword superbasicFunction DAY$
syn keyword superbasicStatement deffn
syn keyword superbasicStatement DEFine DEF
syn keyword superbasicStatement defproc
syn keyword superbasicFunction DEG
syn keyword superbasicProcedure DELETE
syn keyword superbasicProcedure DIM
syn keyword superbasicFunction DIMN
syn keyword superbasicProcedure DIR
syn keyword superbasicStatement DIV
syn keyword superbasicProcedure DLINE
syn keyword superbasicProcedure EDIT
syn keyword superbasicProcedure ELLIPSE
syn keyword superbasicProcedure ELLIPSE_R
syn keyword superbasicStatement ELSE
syn keyword superbasicStatement END
syn keyword superbasicStatement enddef
syn keyword superbasicStatement endfor
syn keyword superbasicStatement endif
syn keyword superbasicStatement endrep
syn keyword superbasicStatement endsel
syn keyword superbasicStatement endwhen
syn keyword superbasicFunction EOF
syn keyword superbasicFunction ERLIN
syn keyword superbasicFunction ERNUM
syn keyword superbasicFunction ERR_NC
syn keyword superbasicFunction ERR_NJ
syn keyword superbasicFunction ERR_NF
syn keyword superbasicFunction ERR_OM
syn keyword superbasicFunction ERR_OR
syn keyword superbasicFunction ERR_BO
syn keyword superbasicFunction ERR_NO
syn keyword superbasicFunction ERR_EX
syn keyword superbasicFunction ERR_IU
syn keyword superbasicFunction ERR_EF
syn keyword superbasicFunction ERR_DF
syn keyword superbasicFunction ERR_BN
syn keyword superbasicFunction ERR_TE
syn keyword superbasicFunction ERR_FF
syn keyword superbasicFunction ERR_BP
syn keyword superbasicFunction ERR_FE
syn keyword superbasicFunction ERR_XP
syn keyword superbasicFunction ERR_OV
syn keyword superbasicFunction ERR_NI
syn keyword superbasicFunction ERR_RO
syn keyword superbasicFunction ERR_BL
syn keyword superbasicStatement ERRor ERR
syn keyword superbasicProcedure EXEC
syn keyword superbasicProcedure EXEC_W
syn keyword superbasicProcedure EXIT
syn keyword superbasicFunction EXP
syn keyword superbasicProcedure FILL
syn keyword superbasicFunction FILL$
syn keyword superbasicProcedure FLASH
syn keyword superbasicStatement FOR
syn keyword superbasicProcedure FORMAT
syn keyword superbasicStatement FuNction FN
"syn keyword superbasicProcedure GOSUB
syn match superbasicProcedure "GO \?SUB"
"syn keyword superbasicProcedure GOTO
syn match superbasicProcedure "GO \?TO"
syn keyword superbasicStatement IF
syn keyword superbasicProcedure INK
syn keyword superbasicFunction INKEY$
syn keyword superbasicProcedure INPUT
syn keyword superbasicStatement INSTR
syn keyword superbasicFunction INT
syn keyword superbasicFunction KEYROW
syn keyword superbasicProcedure LBYTES
syn keyword superbasicFunction LEN
syn keyword superbasicProcedure LET
syn keyword superbasicProcedure LINE
syn keyword superbasicProcedure LINE_R
syn keyword superbasicProcedure LIST
syn keyword superbasicFunction LN
syn keyword superbasicProcedure LOAD
syn keyword superbasicProcedure LOCal LOC
syn keyword superbasicFunction LOG10
syn keyword superbasicProcedure LRUN
syn keyword superbasicProcedure MERGE
syn keyword superbasicStatement MOD
syn keyword superbasicProcedure MODE
syn keyword superbasicProcedure MOVE
syn keyword superbasicProcedure MRUN
syn keyword superbasicProcedure NET
syn keyword superbasicProcedure NEW
syn keyword superbasicProcedure NEXT
syn keyword superbasicFunction NOT
syn keyword superbasicStatement ON
syn keyword superbasicProcedure OPEN
syn keyword superbasicProcedure OPEN_IN
syn keyword superbasicProcedure OPEN_NEW
syn keyword superbasicStatement OR
syn keyword superbasicProcedure OVER
syn keyword superbasicProcedure PAN
syn keyword superbasicProcedure PAPER
syn keyword superbasicProcedure PAUSE
syn keyword superbasicFunction PEEK
syn keyword superbasicFunction PEEK_L
syn keyword superbasicFunction PEEK_W
syn keyword superbasicProcedure PENDOWN
syn keyword superbasicProcedure PENUP
syn keyword superbasicFunction PI
syn keyword superbasicProcedure POINT
syn keyword superbasicProcedure POINT_R
syn keyword superbasicProcedure POKE
syn keyword superbasicProcedure POKE_L
syn keyword superbasicProcedure POKE_W
syn keyword superbasicProcedure PRINT
syn keyword superbasicStatement PROCedure PROC
syn keyword superbasicFunction RAD
syn keyword superbasicProcedure RANDOMISE
syn keyword superbasicProcedure READ
syn keyword superbasicProcedure RECOL
syn keyword superbasicStatement REMAINDER
syn keyword superbasicProcedure RENUM
syn keyword superbasicStatement REPeat REP
syn keyword superbasicProcedure REPORT
syn keyword superbasicFunction RESPR
syn keyword superbasicProcedure RESTORE
syn keyword superbasicProcedure RETRY
syn keyword superbasicProcedure RETurn RET
syn keyword superbasicFunction RND
syn keyword superbasicProcedure RUN
syn keyword superbasicProcedure SAVE
syn keyword superbasicProcedure SBYTES
syn keyword superbasicProcedure SCALE
syn keyword superbasicProcedure SCROLL
syn keyword superbasicProcedure SDATE
syn keyword superbasicStatement SELect SEL
syn keyword superbasicProcedure SEXEC
syn keyword superbasicFunction SIN
syn keyword superbasicFunction SQRT
syn keyword superbasicStatement STEP
syn keyword superbasicProcedure STOP
syn keyword superbasicProcedure STRIP
syn keyword superbasicFunction TAN
syn keyword superbasicStatement THEN
syn keyword superbasicStatement TO
syn keyword superbasicProcedure TRA
syn keyword superbasicProcedure TURN
syn keyword superbasicProcedure TURNTO
syn keyword superbasicProcedure UNDER
syn keyword superbasicFunction VER$
syn keyword superbasicStatement WHEN
syn keyword superbasicProcedure WIDTH
syn keyword superbasicProcedure WINDOW

" Toolkit 2 keywords

syn keyword superbasicProcedure AJOB
syn keyword superbasicProcedure ALARM
syn keyword superbasicFunction ALCHP
syn keyword superbasicProcedure ALTKEY
syn keyword superbasicProcedure BGET
syn keyword superbasicFunction BIN
syn keyword superbasicFunction BIN$
syn keyword superbasicProcedure BPUT
syn keyword superbasicProcedure CALL
syn keyword superbasicFunction CDEC$
syn keyword superbasicProcedure CHAR_USE
syn keyword superbasicProcedure CHAR_INC
syn keyword superbasicProcedure CLCHP
syn keyword superbasicProcedure CLEAR
syn keyword superbasicProcedure CLOCK
syn keyword superbasicProcedure CLOSE
syn keyword superbasicProcedure CONTINUE
syn keyword superbasicProcedure COPY_O
syn keyword superbasicProcedure COPY_H
syn keyword superbasicProcedure COPY_N
syn keyword superbasicProcedure CURSEN
syn keyword superbasicProcedure CURDIS
syn keyword superbasicProcedure DATA_USE
syn keyword superbasicFunction DATAD$
syn keyword superbasicProcedure DDOWN
syn keyword superbasicProcedure DEL_DEFB
syn keyword superbasicProcedure DELETE
syn keyword superbasicProcedure DEST_USE
syn keyword superbasicProcedure DESTD$
syn keyword superbasicProcedure DIR
syn keyword superbasicProcedure DLIST
syn keyword superbasicProcedure DO
syn keyword superbasicProcedure DNEXT
syn keyword superbasicProcedure DUP
syn keyword superbasicProcedure ED
syn keyword superbasicFunction ERR_DF
syn keyword superbasicProcedure ET
syn keyword superbasicProcedure EX
syn keyword superbasicProcedure EXEC
syn keyword superbasicProcedure EXEC_W
syn keyword superbasicProcedure EXTRAS
syn keyword superbasicProcedure EW
syn keyword superbasicFunction FDAT
syn keyword superbasicFunction FDEC$
syn keyword superbasicFunction FEXP$
syn keyword superbasicFunction FLEN
syn keyword superbasicProcedure FLUSH
syn keyword superbasicFunction FNAME$
syn keyword superbasicFunction FOP_DIR
syn keyword superbasicFunction FOP_IN
syn keyword superbasicFunction FOP_NEW
syn keyword superbasicFunction FOP_OVER
syn keyword superbasicFunction FOPEN
syn keyword superbasicFunction FPOS
syn keyword superbasicFunction FREE_MEM
syn keyword superbasicProcedure FSERVE
syn keyword superbasicFunction FTEST
syn keyword superbasicFunction FTYP
syn keyword superbasicFunction FUPDT
syn keyword superbasicFunction FXTRA
syn keyword superbasicProcedure GET
syn keyword superbasicFunction HEX
syn keyword superbasicFunction HEX$
syn keyword superbasicFunction IDEC$
syn keyword superbasicFunction JOB$
syn keyword superbasicProcedure JOBS
syn keyword superbasicProcedure LBYTES
syn keyword superbasicProcedure LOAD
syn keyword superbasicProcedure LRESPR
syn keyword superbasicProcedure LRUN
syn keyword superbasicProcedure MERGE
syn keyword superbasicProcedure MRUN
syn keyword superbasicProcedure NEW
syn keyword superbasicProcedure NFS_USE
syn keyword superbasicFunction NXJOB
syn keyword superbasicFunction OJOB
syn keyword superbasicProcedure OPEN
syn keyword superbasicProcedure OPEN_DIR
syn keyword superbasicProcedure OPEN_IN
syn keyword superbasicProcedure OPEN_NEW
syn keyword superbasicProcedure OPEN_OVER
syn keyword superbasicFunction PARNAM$
syn keyword superbasicFunction PARSTR$
syn keyword superbasicFunction PARTYP
syn keyword superbasicFunction PARUSE
syn keyword superbasicFunction PJOB
syn keyword superbasicProcedure PRINT_USING
syn keyword superbasicProcedure PROG_USE
syn keyword superbasicFunction PROGD$
syn keyword superbasicProcedure PUT
syn keyword superbasicProcedure RECHP
syn keyword superbasicProcedure RENAME
syn keyword superbasicProcedure RETRY
syn keyword superbasicProcedure RJOB
syn keyword superbasicProcedure RUN
syn keyword superbasicProcedure SAVE
syn keyword superbasicProcedure SAVE_O
syn keyword superbasicProcedure SBYTES
syn keyword superbasicProcedure SBYTES_O
syn keyword superbasicProcedure SEXEC_O
syn keyword superbasicProcedure SPJOB
syn keyword superbasicProcedure SPL
syn keyword superbasicProcedure SPL_USE
syn keyword superbasicProcedure SPLF
syn keyword superbasicProcedure STAT
syn keyword superbasicProcedure STOP
syn keyword superbasicProcedure TK2_EXT
syn keyword superbasicProcedure TRUNCATE
syn keyword superbasicProcedure VIEW
syn keyword superbasicProcedure WCOPY
syn keyword superbasicProcedure WDEL
syn keyword superbasicProcedure WDIR
syn keyword superbasicProcedure WMON
syn keyword superbasicProcedure WREN
syn keyword superbasicProcedure WSTAT
syn keyword superbasicProcedure WTV

" Turbo Toolkit keywords

syn keyword superbasicFunction TURBO_DUMMY$
syn keyword superbasicFunction TURBO_DUMMY%
syn keyword superbasicFunction TURBO_DUMMYF
syn keyword superbasicProcedure TURBO_DUMMYP
syn keyword superbasicFunction ALLOCATION
syn keyword superbasicFunction BASIC_B%
syn keyword superbasicFunction BASIC_F
syn keyword superbasicFunction BASIC_INDEX%
syn keyword superbasicFunction BASIC_L
syn keyword superbasicFunction BASIC_NAME$
syn keyword superbasicFunction BASIC_POINTER
syn keyword superbasicFunction BASIC_TYPE%
syn keyword superbasicFunction BASIC_W%
syn keyword superbasicFunction CHANNEL_ID
syn keyword superbasicFunction COMPILED
syn keyword superbasicFunction DATASPACE
syn keyword superbasicFunction DEVICE_SPACE
syn keyword superbasicFunction DEVICE_STATUS
syn keyword superbasicFunction EDIT$
syn keyword superbasicFunction EDIT%
syn keyword superbasicFunction EDITF
syn keyword superbasicFunction ERLIN%
syn keyword superbasicFunction ERNUM%
syn keyword superbasicFunction FLOAT$
syn keyword superbasicFunction FREE_MEMORY
syn keyword superbasicFunction FWINDOW%
syn keyword superbasicFunction GET$
syn keyword superbasicFunction GET%
syn keyword superbasicFunction GETF
syn keyword superbasicFunction INPUT$
syn keyword superbasicFunction INTEGER$
syn keyword superbasicFunction LONGINTEGER
syn keyword superbasicFunction LONGINTEGER$
syn keyword superbasicFunction OPTION_CMD$
syn keyword superbasicFunction PC_FREEMEM
syn keyword superbasicFunction PEEK$
syn keyword superbasicFunction PEEK_F
syn keyword superbasicFunction POKE$
syn keyword superbasicFunction POSITION
syn keyword superbasicFunction SEARCH_MEMORY
syn keyword superbasicFunction STRING$
syn keyword superbasicFunction STRING%
syn keyword superbasicFunction STRINGF
syn keyword superbasicFunction SYS_VARS
syn keyword superbasicFunction TURBO_P
syn keyword superbasicProcedure CATNAP
syn keyword superbasicProcedure CHARGE
syn keyword superbasicProcedure COMMAND_LINE
syn keyword superbasicProcedure CONNECT
syn keyword superbasicProcedure CURSOR_OFF
syn keyword superbasicProcedure CURSOR_ON
syn keyword superbasicProcedure DATA_AREA
syn keyword superbasicProcedure DEALLOCATE
syn keyword superbasicProcedure DEBUG
syn keyword superbasicProcedure DEBUG_LEVEL
syn keyword superbasicProcedure DEFAULT_DEVICE
syn keyword superbasicProcedure END_CMD
syn keyword superbasicProcedure EXECUTE
syn keyword superbasicProcedure EXECUTE_A
syn keyword superbasicProcedure EXECUTE_W
syn keyword superbasicProcedure EXTERNAL
syn keyword superbasicProcedure GLOBAL
syn keyword superbasicProcedure GetHEAD
syn keyword superbasicProcedure IMPLICIT$
syn keyword superbasicProcedure IMPLICIT%
syn keyword superbasicProcedure LINK_LOAD
syn keyword superbasicProcedure LINK_LOAD_A
syn keyword superbasicProcedure LINK_LOAD_W
syn keyword superbasicProcedure LIST_TASKS
syn keyword superbasicProcedure MANIFEST
syn keyword superbasicProcedure MOVE_MEMORY
syn keyword superbasicProcedure POKE_F
syn keyword superbasicProcedure REFERENCE
syn keyword superbasicProcedure RELEASE_TASK
syn keyword superbasicProcedure REMOVE_TASK
syn keyword superbasicProcedure SET_CHANNEL
syn keyword superbasicProcedure SET_FONT
syn keyword superbasicProcedure SET_POSITION
syn keyword superbasicProcedure SET_PRIORITY
syn keyword superbasicProcedure SNOOZE
syn keyword superbasicProcedure SUSPEND_TASK
syn keyword superbasicProcedure SetHEAD
syn keyword superbasicProcedure TURBO_buffersz
syn keyword superbasicProcedure TURBO_diags
syn keyword superbasicProcedure TURBO_list
syn keyword superbasicProcedure TURBO_locstr
syn keyword superbasicProcedure TURBO_model
syn keyword superbasicProcedure TURBO_objdat
syn keyword superbasicProcedure TURBO_objfil
syn keyword superbasicProcedure TURBO_objstk
syn keyword superbasicProcedure TURBO_optim
syn keyword superbasicProcedure TURBO_ref
syn keyword superbasicProcedure TURBO_repfil
syn keyword superbasicProcedure TURBO_sound
syn keyword superbasicProcedure TURBO_struct
syn keyword superbasicProcedure TURBO_taskn
syn keyword superbasicProcedure TURBO_windo
syn keyword superbasicProcedure TYPE_IN
syn keyword superbasicStatement END_WHEN
syn keyword superbasicStatement RETRY_HERE
syn keyword superbasicStatement TURBO_F
syn keyword superbasicStatement TURBO_V
syn keyword superbasicStatement WHEN_ERROR

" MegaToolkit keywords

syn keyword superbasicFunction ACCESS
syn keyword superbasicFunction ANDL
syn keyword superbasicFunction AREG
syn keyword superbasicFunction BASIC
syn keyword superbasicFunction BASLIN%
syn keyword superbasicFunction BAUD%
syn keyword superbasicFunction BORDER_C
syn keyword superbasicFunction BORDER_W
syn keyword superbasicProcedure BOX
syn keyword superbasicFunction BPEEK
syn keyword superbasicFunction BPEEK_$
syn keyword superbasicFunction BPEEK_F
syn keyword superbasicFunction BPEEK_L
syn keyword superbasicFunction BPEEK_W
syn keyword superbasicProcedure BPOKE
syn keyword superbasicProcedure BPOKE_$
syn keyword superbasicProcedure BPOKE_F
syn keyword superbasicProcedure BPOKE_L
syn keyword superbasicProcedure BPOKE_W
syn keyword superbasicFunction BTAG
syn keyword superbasicFunction CAPS%
syn keyword superbasicProcedure CAPS_OFF
syn keyword superbasicProcedure CAPS_ON
syn keyword superbasicFunction CATTR
syn keyword superbasicFunction CHAN_ID
syn keyword superbasicFunction CHAR_H
syn keyword superbasicFunction CHAR_SIZE
syn keyword superbasicFunction CHAR_W
syn keyword superbasicFunction CHAR_X
syn keyword superbasicFunction CHAR_Y
syn keyword superbasicFunction CHBAS
syn keyword superbasicProcedure CLEARBUFF
syn keyword superbasicFunction CLOSED
syn keyword superbasicProcedure COLOUR
syn keyword superbasicFunction CPEEK
syn keyword superbasicFunction CPEEK_F
syn keyword superbasicFunction CPEEK_L
syn keyword superbasicFunction CPEEK_W
syn keyword superbasicProcedure CURMOV
syn keyword superbasicProcedure CURSOR_ON%
syn keyword superbasicFunction DEFINED
syn keyword superbasicProcedure DEXT
syn keyword superbasicProcedure DEXT
syn keyword superbasicProcedure DIR_LIST
syn keyword superbasicProcedure DIR_SET
syn keyword superbasicFunction DREG
syn keyword superbasicFunction ENDED
syn keyword superbasicFunction FALSE
syn keyword superbasicFunction FILE_LEN
syn keyword superbasicFunction FILL%
syn keyword superbasicFunction FIND_WOTSIT
syn keyword superbasicFunction FLOAT
syn keyword superbasicFunction FONT1
syn keyword superbasicFunction FONT2
syn keyword superbasicProcedure FONT_USE
syn keyword superbasicProcedure FRAME
syn keyword superbasicFunction FREECHAN
syn keyword superbasicFunction FREESEC
syn keyword superbasicProcedure FREEZE
syn keyword superbasicFunction FREE_K
syn keyword superbasicFunction FROZEN
syn keyword superbasicFunction GETKEY$
syn keyword superbasicFunction GETKEY%
syn keyword superbasicFunction GET_$
syn keyword superbasicFunction GET_B
syn keyword superbasicFunction GET_DATA
syn keyword superbasicFunction GET_F
syn keyword superbasicFunction GET_L
syn keyword superbasicFunction GET_POS
syn keyword superbasicFunction GET_TYPE
syn keyword superbasicFunction GET_W
syn keyword superbasicFunction GRAB
syn keyword superbasicFunction GRABLEN
syn keyword superbasicFunction GRABOWNER
syn keyword superbasicFunction GRAB_WOTSIT
syn keyword superbasicFunction GRA_X
syn keyword superbasicFunction GRA_Y
syn keyword superbasicFunction HERE
syn keyword superbasicFunction INK%
syn keyword superbasicFunction INTEGER
syn keyword superbasicProcedure INVERT
syn keyword superbasicFunction IPCINF
syn keyword superbasicFunction ISBASIC
syn keyword superbasicFunction ISGRAB
syn keyword superbasicFunction ISJOB
syn keyword superbasicFunction ISROM
syn keyword superbasicFunction JOBID
syn keyword superbasicFunction JOBKEY%
syn keyword superbasicFunction JOBTAG
syn keyword superbasicFunction JOB_BASE
syn keyword superbasicFunction KEYDOWN
syn keyword superbasicFunction KEYPRESS
syn keyword superbasicProcedure KEYSET
syn keyword superbasicProcedure KILL_WOTSIT
syn keyword superbasicFunction LINENUM%
syn keyword superbasicProcedure LINKIN
syn keyword superbasicProcedure LIST_WOTSITS
syn keyword superbasicFunction LNUM
syn keyword superbasicProcedure LOAD_STATUS
syn keyword superbasicFunction MED_NAME$
syn keyword superbasicProcedure MEGA_EXT
syn keyword superbasicProcedure MOVE_POS
syn keyword superbasicProcedure MSCROLL
syn keyword superbasicFunction MYID
syn keyword superbasicFunction MegaVER$
syn keyword superbasicFunction NAND
syn keyword superbasicFunction NETNUM%
syn keyword superbasicFunction NOR
syn keyword superbasicProcedure NO_TK2
syn keyword superbasicFunction NXOR
syn keyword superbasicFunction OPENTYPE
syn keyword superbasicFunction OPEN_DATA
syn keyword superbasicFunction OPEN_PROG
syn keyword superbasicFunction ORG_X
syn keyword superbasicFunction ORG_Y
syn keyword superbasicFunction ORL
syn keyword superbasicFunction PAPER%
syn keyword superbasicFunction PEEK_$
syn keyword superbasicFunction PEEK_F
syn keyword superbasicFunction PEND
syn keyword superbasicProcedure PIXMOV
syn keyword superbasicProcedure POKE_$
syn keyword superbasicProcedure POKE_F
syn keyword superbasicFunction POS_X
syn keyword superbasicFunction POS_Y
syn keyword superbasicFunction PRIORITY
syn keyword superbasicProcedure PUT_$
syn keyword superbasicProcedure PUT_B
syn keyword superbasicProcedure PUT_F
syn keyword superbasicProcedure PUT_L
syn keyword superbasicProcedure PUT_W
syn keyword superbasicFunction QDOS$
syn keyword superbasicFunction QFREE
syn keyword superbasicFunction QIN
syn keyword superbasicFunction QIN$
syn keyword superbasicFunction QPTR$
syn keyword superbasicFunction QSIZE
syn keyword superbasicFunction QUSED
syn keyword superbasicFunction RAMSIZE
syn keyword superbasicProcedure RELEASE
syn keyword superbasicProcedure RJOBS
syn keyword superbasicProcedure ROM_INIT
syn keyword superbasicFunction ROM_NAME$
syn keyword superbasicFunction ROTATE
syn keyword superbasicProcedure R_HEAD
syn keyword superbasicFunction R_HEAD$
syn keyword superbasicProcedure SAVE_STATUS
syn keyword superbasicFunction SCRADDR
syn keyword superbasicProcedure SETQ
syn keyword superbasicProcedure SET_DATA
syn keyword superbasicProcedure SET_JOBKEY
syn keyword superbasicProcedure SET_POS
syn keyword superbasicProcedure SET_TYPE
syn keyword superbasicFunction SHIFT
syn keyword superbasicFunction SIZE_X
syn keyword superbasicFunction SIZE_Y
syn keyword superbasicProcedure SLOAD
syn keyword superbasicProcedure SLOADQ
syn keyword superbasicFunction SMODE%
syn keyword superbasicFunction SPAC$
syn keyword superbasicFunction SPEEK
syn keyword superbasicFunction SPEEK_L
syn keyword superbasicFunction SPEEK_W
syn keyword superbasicProcedure SPOKE
syn keyword superbasicProcedure SPOKE_L
syn keyword superbasicProcedure SPOKE_W
syn keyword superbasicProcedure SSAVE
syn keyword superbasicFunction STIPPLE
syn keyword superbasicFunction STRIP%
syn keyword superbasicFunction SUSPENDED
syn keyword superbasicFunction SYSTEM
syn keyword superbasicProcedure S_HEAD
syn keyword superbasicProcedure S_HEAD$
syn keyword superbasicProcedure THAW
syn keyword superbasicFunction TIME
syn keyword superbasicFunction TPEEK
syn keyword superbasicFunction TPEEK_$
syn keyword superbasicFunction TPEEK_F
syn keyword superbasicFunction TPEEK_L
syn keyword superbasicFunction TPEEK_W
syn keyword superbasicProcedure TPOKE
syn keyword superbasicProcedure TPOKE_$
syn keyword superbasicProcedure TPOKE_F
syn keyword superbasicProcedure TPOKE_L
syn keyword superbasicProcedure TPOKE_W
syn keyword superbasicFunction TRAP1
syn keyword superbasicFunction TRAP2
syn keyword superbasicFunction TRAP3
syn keyword superbasicFunction TRAP4
syn keyword superbasicFunction TRAPC
syn keyword superbasicFunction TRUE
syn keyword superbasicFunction TTAG
syn keyword superbasicFunction TURTLE
syn keyword superbasicProcedure UNFLASH
syn keyword superbasicProcedure UNTRAP
syn keyword superbasicProcedure VDU
syn keyword superbasicFunction VTYPE
syn keyword superbasicProcedure WAIT
syn keyword superbasicProcedure WINDO
syn keyword superbasicProcedure WINDO_C
syn keyword superbasicProcedure WINS
syn keyword superbasicFunction WIN_DEF
syn keyword superbasicFunction WIN_MOD
syn keyword superbasicFunction WMAN$
syn keyword superbasicFunction XORL
syn keyword superbasicProcedure _1
syn keyword superbasicProcedure _2
syn keyword superbasicProcedure _3
syn keyword superbasicProcedure _4
syn keyword superbasicProcedure _5
syn keyword superbasicProcedure _6
syn keyword superbasicProcedure _7
syn keyword superbasicProcedure _8
syn keyword superbasicProcedure _CLONE
syn keyword superbasicProcedure _CLOSE
syn keyword superbasicProcedure _D
syn keyword superbasicFunction _D$
syn keyword superbasicProcedure _DATA
syn keyword superbasicFunction _DELETE
syn keyword superbasicFunction _DIR$
syn keyword superbasicProcedure _ERROR
syn keyword superbasicFunction _FORMAT
syn keyword superbasicFunction _LBYTES
syn keyword superbasicFunction _P$
syn keyword superbasicProcedure _PROG
syn keyword superbasicFunction _SBYTES
syn keyword superbasicFunction _SCALE

" Pointer Environment and Hotkey keywords

" In PTR_GEN

syn keyword superbasicProcedure CKEYOFF
syn keyword superbasicProcedure CKEYOFF

" In WMAN (only in version 2.00 onward)

syn keyword superbasicProcedure WM_PAPER
syn keyword superbasicProcedure WM_INK
syn keyword superbasicProcedure WM_STRIP
syn keyword superbasicProcedure WM_BLOCK
syn keyword superbasicProcedure WM_BORDER
syn keyword superbasicProcedure WM_MOVEMODE
syn keyword superbasicProcedure SP_RESET
syn keyword superbasicProcedure SP_GET
syn keyword superbasicProcedure SP_SET
syn keyword superbasicProcedure SP_JOBPAL
syn keyword superbasicProcedure SP_JOBOWNPAL
syn keyword superbasicFunction SP_GETCOUNT

" In HOT_REXT (Hotkey System II)

syn keyword superbasicProcedure ERT
syn keyword superbasicProcedure EXEP
syn keyword superbasicFunction HOT_CHP
syn keyword superbasicFunction HOT_CHP1
syn keyword superbasicFunction HOT_CMD
syn keyword superbasicProcedure HOT_DO
syn keyword superbasicProcedure HOT_GO
syn keyword superbasicFunction HOT_KEY
syn keyword superbasicProcedure HOT_LIST
syn keyword superbasicFunction HOT_LOAD
syn keyword superbasicFunction HOT_LOAD1
syn keyword superbasicFunction HOT_NAME$
syn keyword superbasicFunction HOT_OFF
syn keyword superbasicFunction HOT_PICK
syn keyword superbasicFunction HOT_REMV
syn keyword superbasicFunction HOT_RES
syn keyword superbasicFunction HOT_RES1
syn keyword superbasicFunction HOT_SET
syn keyword superbasicFunction HOT_STOP
syn keyword superbasicProcedure HOT_STUFF
syn keyword superbasicFunction HOT_THING
syn keyword superbasicFunction HOT_THING1
syn keyword superbasicFunction HOT_TYPE
syn keyword superbasicFunction HOT_WAKE
syn keyword superbasicProcedure TH_FIX

" Common disk interface keywords

syn keyword superbasicProcedure AUTO_DIS
syn keyword superbasicProcedure AUTO_TK2F1
syn keyword superbasicProcedure AUTO_TK2F2
syn keyword superbasicProcedure CACHE_OFF
syn keyword superbasicProcedure CACHE_ON
syn keyword superbasicProcedure DEV_LIST
syn keyword superbasicFunction DEV_NEXT
syn keyword superbasicProcedure DEV_USE
syn keyword superbasicFunction DEV_USE$
syn keyword superbasicFunction FBKDT
syn keyword superbasicProcedure FLP_DENSITY
syn keyword superbasicProcedure FLP_JIGGLE
syn keyword superbasicProcedure FLP_SEC
syn keyword superbasicProcedure FLP_START
syn keyword superbasicProcedure FLP_STEP
syn keyword superbasicProcedure FLP_TRACK
syn keyword superbasicProcedure FLP_USE
syn keyword superbasicFunction FMAKE_DIR
syn keyword superbasicFunction FVERS
syn keyword superbasicProcedure MAKE_DIR
syn keyword superbasicProcedure PAR_USE
syn keyword superbasicProcedure PROT_DATE
syn keyword superbasicProcedure PRT_ABT
syn keyword superbasicProcedure PRT_USE
syn keyword superbasicProcedure RAM_USE
syn keyword superbasicProcedure RES_128
syn keyword superbasicProcedure RES_SIZE
syn keyword superbasicProcedure SCR2DIS
syn keyword superbasicProcedure SCR2EN
syn keyword superbasicProcedure SDP_DEV
syn keyword superbasicProcedure SDP_KEY
syn keyword superbasicProcedure SDP_SET
syn keyword superbasicProcedure SDUMP
syn keyword superbasicProcedure SER_USE
syn keyword superbasicProcedure SET_FBKDT
syn keyword superbasicProcedure SET_FUPDT
syn keyword superbasicProcedure SET_FVERS
syn keyword superbasicProcedure SLUG
syn keyword superbasicProcedure WIN_EXT
syn keyword superbasicProcedure WIN2
syn keyword superbasicProcedure WIN_USE

" QPAC2 button frame keywords

syn keyword superbasicProcedure BT_EXEC
syn keyword superbasicProcedure BT_HOTKEY
syn keyword superbasicProcedure BT_SLEEP
syn keyword superbasicProcedure BT_WAKE

" Menu extension QMENU keywords (from Jochen Merz)

syn keyword superbasicFunction BUTTON_SELECT
syn keyword superbasicProcedure BUTTON_WAIT
syn keyword superbasicFunction CHAR_SELECT$
syn keyword superbasicFunction DIR_SELECT$
syn keyword superbasicFunction EXT_SELECT$
syn keyword superbasicFunction FILE_ERROR
syn keyword superbasicFunction FILE_SELECT$
syn keyword superbasicFunction GET_DEFAULT$
syn keyword superbasicFunction ITEM_SELECT
syn keyword superbasicFunction LIST_SELECT
syn keyword superbasicFunction READ_STRING$
syn keyword superbasicProcedure REPORT_ERROR
syn keyword superbasicProcedure SCRAP_CLEAR
syn keyword superbasicFunction SCRAP_CNT
syn keyword superbasicFunction SCRAP_GET
syn keyword superbasicFunction SCRAP_GET$
syn keyword superbasicFunction SCRAP_LEN
syn keyword superbasicProcedure SCRAP_PUT
syn keyword superbasicFunction SCRAP_TYPE
syn keyword superbasicProcedure VIEW_FILE

" SMSQ and SBASIC keywords

syn keyword superbasicFunction DEVTYPE
syn keyword superbasicProcedure EPROM_LOAD
syn keyword superbasicProcedure IO_PRIORITY
syn keyword superbasicProcedure JOB_NAME
syn keyword superbasicProcedure KBD_TABLE
syn keyword superbasicProcedure LANG_USE
syn keyword superbasicFunction LANGUAGE
syn keyword superbasicFunction LANGUAGE$
syn keyword superbasicProcedure QLOAD
syn keyword superbasicProcedure QLRUN
syn keyword superbasicProcedure QMERGE
syn keyword superbasicProcedure QMRUN
syn keyword superbasicProcedure QSAVE
syn keyword superbasicProcedure QSAVE_O
syn keyword superbasicProcedure QUIT
syn keyword superbasicProcedure SBASIC

" SMSQ/E and SBASIC keywords

syn keyword superbasicProcedure COLOUR_NATIVE
syn keyword superbasicProcedure COLOUR_PAL
syn keyword superbasicProcedure COLOUR_QL
syn keyword superbasicProcedure COLOUR_24
syn keyword superbasicProcedure BGCOLOUR_QL
syn keyword superbasicProcedure BGCOLOUR_24
syn keyword superbasicProcedure BGIMAGE
syn keyword superbasicProcedure CHAR_DEF
syn keyword superbasicProcedure CHK_HEAP
syn keyword superbasicProcedure DEV_NEXT$
syn keyword superbasicProcedure DEV_USEN
syn keyword superbasicProcedure DISP_BLANK
syn keyword superbasicProcedure DISP_COLOUR
syn keyword superbasicProcedure DISP_INVERSE
syn keyword superbasicProcedure DISP_RATE
syn keyword superbasicProcedure DISP_SIZE
syn keyword superbasicFunction DISP_TYPE
syn keyword superbasicFunction DMEDIUM_NAME$
syn keyword superbasicFunction DMEDIUM_DRIVE$
syn keyword superbasicFunction DMEDIUM_RDONLY
syn keyword superbasicFunction DMEDIUM_REMOVE
syn keyword superbasicFunction DMEDIUM_DENSITY
syn keyword superbasicFunction DMEDIUM_FORMAT
syn keyword superbasicFunction DMEDIUM_TYPE
syn keyword superbasicFunction DMEDIUM_TOTAL
syn keyword superbasicFunction DMEDIUM_FREE
syn keyword superbasicProcedure ET
syn keyword superbasicProcedure HGET
syn keyword superbasicProcedure HOME_CSET
syn keyword superbasicFunction HOME_CURR$
syn keyword superbasicFunction HOME_DEF$
syn keyword superbasicFunction HOME_DIR$
syn keyword superbasicFunction HOME_FILE$
syn keyword superbasicProcedure HOME_SET
syn keyword superbasicFunction HOME_VER$
syn keyword superbasicProcedure HPUT
syn keyword superbasicProcedure LGET
syn keyword superbasicProcedure LPUT
syn keyword superbasicProcedure INSTR_CASE
syn keyword superbasicFunction MACHINE
syn keyword superbasicProcedure MOUSE_SPEED
syn keyword superbasicProcedure MOUSE_STUFF
syn keyword superbasicProcedure OUTLN
syn keyword superbasicProcedure PALETTE_8
syn keyword superbasicProcedure PALETTE_QL
syn keyword superbasicProcedure PAR_BUFF
syn keyword superbasicProcedure PAR_CLEAR
syn keyword superbasicProcedure PAR_ABORT
syn keyword superbasicProcedure PAR_PULSE
syn keyword superbasicProcedure PAR_WAIT
syn keyword superbasicFunction PEEK$
syn keyword superbasicProcedure POKE$
syn keyword superbasicFunction PROCESSOR
syn keyword superbasicProcedure PRT_BUFF
syn keyword superbasicProcedure PRT_CLEAR
syn keyword superbasicProcedure PRT_ABORT
syn keyword superbasicFunction PRT_USE$
syn keyword superbasicProcedure RESET
syn keyword superbasicFunction SCR_XLIM
syn keyword superbasicFunction SCR_YLIM
syn keyword superbasicFunction SCR_BASE
syn keyword superbasicFunction SCR_LLEN
syn keyword superbasicProcedure SEND_EVENT
syn keyword superbasicProcedure SER_BUFF
syn keyword superbasicProcedure SER_CDEOF
syn keyword superbasicProcedure SER_CLEAR
syn keyword superbasicProcedure SER_ABORT
syn keyword superbasicProcedure SER_FLOW
syn keyword superbasicProcedure SER_SETPORT
syn keyword superbasicFunction SCR_GETPORT$
syn keyword superbasicProcedure SER_PAUSE
syn keyword superbasicProcedure SER_ROOM
syn keyword superbasicProcedure UPUT
syn keyword superbasicFunction WAIT_EVENT
syn keyword superbasicProcedure WGET
syn keyword superbasicProcedure WPUT
syn keyword superbasicProcedure WIN_DRIVE
syn keyword superbasicFunction WIN_DRIVE$
syn keyword superbasicProcedure WIN_FORMAT
syn keyword superbasicProcedure WIN_WRMV
syn keyword superbasicProcedure WIN_SLUG
syn keyword superbasicProcedure WIN_START
syn keyword superbasicProcedure WIN_STOPW
syn keyword superbasicProcedure WIN_WP

" Used in QL emulators for Atari

syn keyword superbasicFunction PEEKS
syn keyword superbasicFunction PEEKS_W
syn keyword superbasicFunction PEEKS_L
syn keyword superbasicFunction PEEKS$
syn keyword superbasicProcedure POKES
syn keyword superbasicProcedure POKES_W
syn keyword superbasicProcedure POKES_L
syn keyword superbasicProcedure POKES$
syn keyword superbasicProcedure PROT_MEM

" UQLX emulator keywords

syn keyword superbasicProcedure Kill_UQLX
syn keyword superbasicFunction UQLX_RELEASE$
syn keyword superbasicFunction getXenv$
syn keyword superbasicFunction Fork_UQLX
syn keyword superbasicFunction getXargC
syn keyword superbasicFunction getXarg$
syn keyword superbasicFunction getXres
syn keyword superbasicFunction getYres

" SMSQmulator keywords

syn keyword superbasicFunction flp_drive$
syn keyword superbasicProcedure flp_drive
syn keyword superbasicProcedure mem_use
syn keyword superbasicProcedure nfa_use
syn keyword superbasicProcedure sfa_use
syn keyword superbasicFunction win_use$
syn keyword superbasicFunction nfa_use$
syn keyword superbasicFunction sfa_use$

" Some undocumented keywords (as of 2011-08-16)
" found in SBASIC (QPC2)

syn keyword superbasicFunction DAY%
syn keyword superbasicFunction MONTH%
syn keyword superbasicFunction YEAR%

" QPC2 emulator keywords

syn keyword superbasicFunction CD_ALLTIME
syn keyword superbasicFunction CD_HOUR
syn keyword superbasicFunction CD_HSG2RED
syn keyword superbasicFunction CD_ISCLOSED
syn keyword superbasicFunction CD_ISINSERTED
syn keyword superbasicFunction CD_ISPLAYING
syn keyword superbasicFunction CD_LENGTH
syn keyword superbasicFunction CD_MINUTE
syn keyword superbasicFunction CD_PLAY
syn keyword superbasicFunction CD_RED2HSG
syn keyword superbasicFunction CD_SECOND
syn keyword superbasicFunction CD_TRACK
syn keyword superbasicFunction CD_TRACKLENGTH
syn keyword superbasicFunction CD_TRACKSTART
syn keyword superbasicFunction CD_TRACKTIME
syn keyword superbasicFunction DOS_DRIVE$
syn keyword superbasicFunction PAR_DEFAULTPRINTER$
syn keyword superbasicFunction PAR_GETFILTER
syn keyword superbasicFunction PAR_GETPRINTER$
syn keyword superbasicFunction PAR_PRINTERCOUNT
syn keyword superbasicFunction PAR_PRINTERNAME$
syn keyword superbasicFunction QPC_CMDLINE$
syn keyword superbasicFunction QPC_HOSTOS
syn keyword superbasicFunction QPC_NETNAME$
syn keyword superbasicFunction QPC_QLSCREMU$
syn keyword superbasicProcedure CD_CLOSE
syn keyword superbasicProcedure CD_EJECT
syn keyword superbasicProcedure CD_FIRSTTRACK
syn keyword superbasicProcedure CD_INIT
syn keyword superbasicProcedure CD_LASTTRACK
syn keyword superbasicProcedure CD_RESUME
syn keyword superbasicProcedure CD_STOP
syn keyword superbasicProcedure DOS_DRIVE
syn keyword superbasicProcedure DOS_USE
syn keyword superbasicProcedure PAR_SETFILTER
syn keyword superbasicProcedure PAR_SETPRINTER
syn keyword superbasicProcedure QPC_EXEC
syn keyword superbasicProcedure QPC_EXIT
syn keyword superbasicProcedure QPC_MAXIMIZE
syn keyword superbasicProcedure QPC_MINIMIZE
syn keyword superbasicProcedure QPC_MSSPEED
syn keyword superbasicProcedure QPC_RESTORE
syn keyword superbasicProcedure QPC_SYNCSCRAP
syn keyword superbasicFunction QPC_VER$
syn keyword superbasicProcedure QPC_WINDOWTITLE

" Display Toolkit keywords

syn keyword superbasicFunction ADDRESS
syn keyword superbasicFunction BYTES
syn keyword superbasicFunction DMODE
syn keyword superbasicFunction FLIM_H
syn keyword superbasicFunction FLIM_W
syn keyword superbasicFunction FLIM_X
syn keyword superbasicFunction FLIM_Y
syn keyword superbasicFunction GD2
syn keyword superbasicProcedure MOVEMEM
syn keyword superbasicFunction OS_VER$
syn keyword superbasicFunction PTRVER$
syn keyword superbasicFunction PTR_ENV
syn keyword superbasicFunction SYS_VAR
syn keyword superbasicFunction WIN_MAN
syn keyword superbasicFunction WMAVER$

" DIY Toolkit keywords

syn keyword superbasicFunction MINIMUM
syn keyword superbasicFunction MINIMUM%
syn keyword superbasicFunction MAXIMUM
syn keyword superbasicFunction MAXIMUM%
" ...and many more to come.

" -------------------------------------------------------------

syn keyword superbasicTodo contained TODO FIXME XXX

" -------------------------------------------------------------

"integer number, or floating point number without a dot.
syn match superbasicNumber "\<\d\+\>"
"floating point number, with dot
syn match superbasicNumber "\<\d\+\.\d*\>"
"floating point number, starting with a dot
syn match superbasicNumber "\.\d\+\>"

" String and Character constants
syn match superbasicSpecial contained "\\\d\d\d\|\\."
"syn region superbasicString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=superbasicSpecial
syn region superbasicString start='"' end='"' contains=superbasicSpecial
syn region superbasicString start="'" end="'" contains=superbasicSpecial

syn region superbasicComment start="REMark" end="$" contains=superbasicTodo
syn region superbasicComment start="REM" end="$" contains=superbasicTodo
syn region superbasicMistake start="MISTake" end="$" contains=superbasicTodo
syn region superbasicLineNumber start="^\s*\d" end="\s"
syn match superbasicTypeSpecifier "[a-zA-Z0-9][\$%]"ms=s+1
" Used with OPEN statement
syn match superbasicFilenumber "#\d\+"
syn match superbasicMathsOperator "[<>+\*^/\\=-]| NOT "
" syn match superbasicMathsOperator "-\|=\|[:<>+\*^/\\]\| AND \| OR "

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_superbasic_syntax_inits")
  if version < 508
    let did_superbasic_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  "HiLink superbasicConditional Conditional
  "HiLink superbasicRepeat Repeat
  HiLink superbasicLineNumber Comment
  HiLink superbasicNumber Number
  HiLink superbasicError Error
  HiLink superbasicStatement Statement
  HiLink superbasicProcedure Statement
  HiLink superbasicString String
  HiLink superbasicComment Comment
  HiLink superbasicMistake Todo
  HiLink superbasicSpecial Special
  HiLink superbasicTodo Todo
  HiLink superbasicFunction Identifier
  HiLink superbasicTypeSpecifier Type
  HiLink superbasicFilenumber superbasicTypeSpecifier
  hi superbasicMathsOperator term=bold cterm=bold gui=bold
  "HiLink superbasicMathsOperator Statement "debug check!!!

  delcommand HiLink

endif

let b:current_syntax = "superbasic"

" -------------------------------------------------------------
" History

" 2010-07-06: First version, based on basic.vim
" (mantained by Allan Kelly <allan AT fruitloaf DOT co DOT uk>).
" 2010-08-04: Bug fixed: OR and AND were defined as math operators, and highlighted inside strings.
" Now they are defined as superbasic statements, like INSTR.
" 2010-08-11: UQLX emulator keywords added.
" 2010-08-11: SMSQ (QLX) / SBASIC keywords added.
" 2010-08-20: SMSQ/E (QPC2) / SBASIC keywords added; QPC2 keywords added.
" 2011-02-19: Added WPUT.
" 2011-02-20: Added LGET,LPUT,UPUT,WGET.
" 2011-03-13: Added enddef,endif,endfor,endrep,endsel,defproc,deffn.
" 2011-03-15: All keywords with an ending "$" (e.g INKEY$) were not highlighted. They are changed to "syn match" to fix it.
" 2011-03-16: Added all Turbo Toolkit keywords. Fixed the problem "FIX/FIX$" with a match, but it's not the ideal solution.
" 2011-08-13: "basic" prefix changed to "superbasic".
" 2011-04-06: Added the MegaToolkit keywords. Fixed the "$" problem: iskeyword had to be set! All "match" are changed back to "keyword". Bug fixed: QPC_VER$ was marked as procedure. Added: set fileencoding=latin1.
" 2011-04-21: Added the Display toolkit keywords. Bug fixed: Added digits to iskeyword.
" 2011-05-02: Bug fixed: "ERRorr" was wrongly marked as a function.
" 2011-05-11: Added VER$. Somehow it was missing!
" 2011-08-16: Added DAY%, MONTH% and YEAR%.
" 2011-08-26: Added the first DIY Toolkit keywords: MINIMUM, MINIMUM%, MAXIMUM and MAXIMUM%.
" 2011-08-27: Typo fixed.
" 2011-08-30: Added "GO TO" and "GO SUB" (match with space).
" 2012-01-29: Added TO.
" 2012-09-03: Moved the editing preferences to a filetype plugin.
" 2015-02-26: Vim license.
" 2016-01-12: Completed the to-do marks.
" 2016-01-13: Added some SMSQmulator keywords.
" 2016-01-30: Added two SMSQmulator keywords: flp_drive, flp_drive$.
" 2016-01-31: Added more SMSQmulator keywords.
" 2017-09-25: Add the "home_" family.

