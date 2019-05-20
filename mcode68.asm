;Varible Assinments
fNMIOFF  equ $0204
MUXstat  equ $05E4
PrintBuf equ $0680
PBufPtr  equ $0A84
GAINvlu  equ $0ECA
Tmpx     equ $0EDC
MUXset   equ $0E50
A/Ddta   equ $0EC8
GAINexp  equ $0ECC
ACQRmode equ $0ECE
LMPERR   equ $0ED0
flMPERR  equ $0ED2
#LMPERR  equ $0ED4
TRIGerr  equ $OED6
TRIGDLY  equ $0ED8
XPNTR    equ $11E0
Xrd      equ $11E2
Xwrt     equ $11E4
fFAIL    equ $11E6
TMPhrs   equ $11E8
CLKERRcnt equ $11EA
fPM      equ $11EC

;I/O Assignments
;Real Time Clock
RTCControl equ $6010; write
RTCData equ $6011; r/w

;DUART
ModeRegA equ $6020; r/w
StatRegA equ $6021; read
ClkRegA  equ $6021; write
CmdRegA  equ $6022; write
RcvDtaA  equ $6023; read
XmitDtaA equ $6023; write
PortChg  equ $6024; read
ACRA     equ $6024; write
ImaskRgA equ $6025; write
ModeRegB equ $6028; r/w
StatRegB equ $6029; read
ClkRegB  equ $6029; write
CmdRegB  equ $602A; write
RcvDtaB  equ $602B; read
XmitDtaB equ $602B; write
ACRB     equ $602C; write
ImaskRgB equ $602D; write

A/DLowByte equ $7001
A/DHiByte equ $7002
A/DStatus equ $7002
MuxControl equ $7007

;; 'CALC-CHKSUM2
23E5
     $8D; Code
     "'CALC-CHKSUM2"; Name
     $23D2; Backward Link
     $C576
     $23E3
     $8026

;;; "STRNG" "SMPL#     | SAMPLE NUMBER  |
2FE3
     $87; Code
     ""SMPL#"; Name
     $2FCC; Backward Link
SMPL#text:
2FEC $CA33
     $FAC4
     "SAMPLE NUMBER  "
     $00

;;; "STRNG" "UPPM     |  Parts Per Billion|
301F
     $87; Code
     ""UPPM"; Name
     $2FE3; Backward Link
UPPMtext:
3027 $CA33
     $FAC4
     " Parts Per Billion"
     $00

;;; "STRNG" "COMNTS     | Comments:|
303E
     $87; Code
     ""COMNTS"; Name
     $301F; Backward Link
COMNTStext:
3048 $CA33
     $FAC4
     "Comments:"
     $00

;;; "STRNG" "QA1     | <<<  ROMER LABS  >>>|
3056
     $84
     ""QA2"; Name
     $303E; Backward Link
QA1text:
305D $CA33
     $FAC4
     "<<<  ROMER LABS  >>>"
     $00

;;; "STRNG" "QA2     | QA TEST BATTERY         |
3076
     $84; Code
     ""QA2"; Name
     $3056; Backward Link
QA2text:
307D $CA33
     $FAC4
     "QA TEST BATTERY        "
     $00

;;; "STRNG" "QASELF  | SELFTEST FUNCTIONS      |
309A
     $87; Code
     ""QASELF"; Name
     $3076; Backward Link
QASELFtext:
30A4 $CA33
     $FAC4
     "SELFTEST FUNCTIONS     "
     $00

;;; "STRNG" "OSTST1  | OFFSET MEASUREMENT      |
30C1
     $87; Code
     ""OSTST1"; Name
     $309A; Backward Link
OSTST1text:
30CB $CA33
     $FAC4
     "OFFSET MEASUREMENT     "
     $00

;;; "STRNG" "OSHDR1  | OFFSET/GAIN Gain     1    10   100  1000|
30E8
     $87; Code
     ""OSHDR1"; Name
     $30C1; Backward Link
OSHDR1text:
30F2 $CA33
     $FAC4
     "OFFSET/GAIN Gain     1    10   100  1000"
     $00

;;; "STRNG" "LEKTST  | FEEDTHROUGH MEASUREMENT |
311F
     $87; Code
     ""LEKTST"; Name
     $30E8; Backward Link
LEKTSTtext:
3129 $CA33
     $FAC4
     "FEEDTHROUGH MEASUREMENT "
     $00

;;; "STRNG" "OSHDR3  | FEEDTHROUGH Gain     1    10   100  1000|
3146
     $87; Code
     ""OSHDR3"; Name
     $311F; Backward Link
OSHDR3text:
3150 $CA33
     $FAC4
     "FEEDTHROUGH Gain     1    10   100  1000"
     $00

;;; "STRNG" "OSHDR2  |           Counts|
317D
     $87; Code
     ""OSHDR2"; Name
     $3146; Backward Link
OSHDR2text:
3187 $CA33
     $FAC4
     "           Counts"
     $00
     

;;; "STRNG" "QA#1    | <<< QA TEST# |
319C
     $85; Code
     ""QA#1"; Name
     $317D; Backward Link
QA#1text:
31A4 $CA33
     $FAC4
     ">>> "
     $00

;;; "STRNG" "QA#2    |  >>>|
31B6
     $85; Code
     ""QA#2"; Name
     $319C; Backward Link
QA#2:
31BE $CA33
     $FAC4
     " >>>"
     $00

;;; "STRNG" "CALTST  | CALIBRATOR MEASUREMENT  |
31C7
     $87; Code
     ""CALTST"; Name
     $31B6; Backward Link
CALTSTtext:
31D1 $CA33
     $FAC4
     "CALIBRATOR MEASUREMENT  "
     $00

;;; "STRNG" "CVhdr   | CALIBRATOR        Sig   Gain    Ref|
31EE
     $86; Code
     ""CVhdr"; Name
     $31C7; Backward Link
CVhdrtext:
31F7 $CA33
     $FAC4
     "CALIBRATOR        Sig   Gain    Ref"
     $00

;;; "STRNG" "CVhdr1  | SIGNAL LEVELS|
321F
     $87; Code
     ""CVhdr1"; Name
     $31EE; Backward Link
CVhdr1text:
3229 $CA33
     $FAC4
     "SIGNAL LEVELS"
     $00

;;; "STRNG" "QADON1  | QA TESTS COMPLETE       |
323B
     $87; Code
     ""QADON1"; Name
     $321F; Backward Link
QADON1text:
3245 $CA33
     $FAC4
     "QA TESTS COMPLETE       "
     $00   

;;; "STRNG" "QADON2  | POWER OFF/ON TO RESTART |
3262
     $87; Code
     ""QADON2"; Name
     $323B; Backward Link
QADON2text:
326C $CA33
     $FAC4
     "POWER OFF/ON TO RESTART "
     $00

;;; 0 VARIABLE f>MENU ( not in supplied source )
3289
     $86; Code
     "f>MENU"; Name
     $3262; Backward Link
     $C576
     $0E72

;;; ( FX100 KEYPAD SUPPORT
                        08:03 03/08/90 ) 
;;; : UPDATEkeyQ  fTEST @ 0= MONITORkeyQ
	fTEST @ AND IF 711.EXE ENDIF
	F1key @ CALflg @ 0= AND fTEST @ 0= AND
	IF DROP 'RECAL @ EXECUTE TESTrtn ENDIF ;
3296
     $8A; Code
     "UPDATEkeyQ"; Name
     $3289; Backward Link
     COLON
     $F703
     TOGGLEexec
     0=exec
     $FA0E
     $F703
     TOGGLEexec
     ANDexec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0004; Branch Offset
     	$2511
     ENDIF
     $F9FC
     TOGGLEexec
     $2201
     TOGGLEexec
     0=exec
     ANDexec
     $F703
     TOGGLEexec
     0=exec
     ANDexec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $000C; Branch Offset
     	DROPexec; Delete Top of Stack
     	$2336
     	TOGGLEexec
     	$C083
     	$22F3
     ENDIF
     ;Sexec

;;; : PCkey fTEST @ 0= key SWAP
	fTEST @ AND IF 711.EXE ENDIF
	DUP F1 = CALflg @ 0= AND fTEST @ 0= AND
	IF DROP 'RECAL @ EXECUTE TESTrtn ENDIF ;
32DD
     $85; Code
     "PCkey"; Name
     $3296; Backward Link
PCkeyexec:
32E5 COLON
     $F703
     TOGGLEexec
     0=exec
     $F998
     SWAPexec; Swap Top of Stack with Next on Stack
     $F703
     TOGGLEexec
     ANDexec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0004; Branch Offset
     	$2511
     ENDIF
     $F703
     TOGGLEexec
     0=exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0042; Branch Offset
     	DUPexec; Duplicate Top of Stack
     	$F70C
     	=exec
     	$2201
     	TOGGLEexec
     	0=exec
	ANDexec
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$000C; Branch Offset
		DROPexec; Delete Top of Stack
		$2336
		TOGGLEexec
		$C083
		$22F3
     	ENDIF
	DUPexec; Duplicate Top of Stack
	$F70C
	=exec
	OVERexec; Duplicate Second Item at Top of Stack
	$F715
	=exec
	ORexec
	OVERexec; Duplicate Second Item at Top of Stack
	$F71E
	=exec
	ORexec
	$3292
	TOGGLEexec
	ANDexec
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0006; Branch Offset
		DROPexec; Delete Top of Stack
		$22F3
     	ENDIF
     ENDIF
     ;Sexec

;;; : WAIT-ENT "ACK DISPLAY2 w-TYPE BEGIN PCkey 13 ( ENT) = UNTIL ;
3349
     $88; Code
     "WAIT-ENT"; Name
     $32DD; Backward Link
     COLON
     $25E5
     $F4CB
     $F51E
     BEGIN
     	PCkeyexec
     	LITexec
     	$000D
     	=exec
     OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     $FFF6; Branch Offset
     ;Sexec

;;; 0 VARIABLE MINx
336A
     $84; Code
     "MINx"; Name
     $3349; Backward Link
     $C576
     $0E74

;;; 0 VARIABLE MAXx
3375
     $84; Code
     "MAXx"; Name
     $336A; Backward Link
     $C576
     $0E76

;;; 0 VARIABLE INITVLU 6 ALLOT-RAM
3380
     $87; Code
     "INITVLU"; Name
     $3375; Backward Link
     $C576
     $0E78

;;; 3 CONSTANT #DIGITS
338E
     $87; Code
     "#DIGITS"; Name
     $3380; Backward Link
     $C576
     $0003

;;; 0 VARIABLE f+/-#
339C
     $85; Code
     "f+/-#"; Name
     $338E; Backward Link
     $C576
     $0E80

;;; 0 VARIABLE F#SGN
33A8
     $85; Code
     "F#SGN"; Name
     $339C; Backward Link
     $C576
     $0E82

;;; 0 VARIABLE fDPok
33B4
     $82; Code
     "fDPok"; Name
     $33A8; Backward Link
     $C576
     $0E84

;;; 1 CONSTANT DPdigits
33C0
     $88; Code
     "DPdigits"; Name
     $33B4; Backward Link
     $C576
     $0001

;;; 0 VARIABLE fDP
33CF
     $89; Code
     "fDP"; Name
     $33C0; Backward Link
     $C576
     $0E86

;;; 0 VARIABLE fDP0
33D9
     $84
     "fDP0"; Name
     $33CF; Backward Link
     $C576
     $0E88

;;; : N#CNVRT 0 <# #S #> ;
33E4
     $87; Code
     "N#CNVRT"; Name
     $33D9; Backward Link
     COLON
     0refx
     $D5E1
     $D646
     $D5F0
     ;Sexec

;;; : d#CNVRT <# #S #> MAXx @ MIN ;
33FA
     $87; Code
     "d#CNVRT"; Name
     $33E4; Backward Link
     COLON
     $D5E1
     $D646
     $D5F0
     $337C
     TOGGLEexec
     $C827
     ;Sexec

;;; : n#CNVRT ( n -- adr,cnt) 0 d#CNVRT ;
3414
     $87; Code
     "n#CNVRT"; Name
     $33FA; Backward Link 
     COLON
     0refx
     $3404
     ;Sexec

;;; : .1CNVRT ( d --)  <# # 46 HOLD #S #> ;
3426
     $87; Code
     ".1CNVRT"; Name
     $3414; Backward Link
     COLON
     $D5E1
     $D61E
     LITexec
     $002E
     HOLDexec
     $D646
     $D5F0
     ;Sexec

;;; : .2CNVRT ( d --)  <# # # 46 HOLD #S #> ;
3442
     $87; Code
     ".2CNVRT"; Name
     $3426; Backward Link
     COLON
     $D5E1
     $D61E
     $D61E
     LITexec
     $002E
     HOLDexec
     $D646
     $D5F0
     ;Sexec

;;; : .3CNVRT ( d --)  <# # # # 46 HOLD #S #> ;
3460
     $87; Code
     ".3CNVRT"; Name
     $3442; Backward Link
     COLON
     $D5E1
     $D61E
     $D61E
     $D61E
     LITexec
     $002E
     HOLDexec
     $D646
     $D5F0
     ;Sexec
     $3404
     $3430
     $344C
     $346A

;;; CONSTANT CNVRTTBL
3488
     $88
     "CNVRTTBL"; Name
     $3460; Backward Link
     $C576
     $3480

;;; ( FLOATING POINT NUMBER DISPLAY

;;; : F#CNVRT ( d,j--adr,cnt) ABS >R DROP
	( abs j, d->n)   R 4 > IF R 4 DO 10 / LOOP ENDIF
	( If exp < -4 divide data)    R 3 > IF 10 /MOD SWAP 4 > IF 1+ ENDIF ENDIF
	0 R> 3 MIN 2* CNVRTTBL + @ EXECUTE ;
3497
     $87; Code
     "F#CNVRT"; Name
     $3488; Backward Link
     COLON
     $D1F1
     $C3A7
     DROPexec; Delete Top of Stack
     $C3D0
     LITexec
     $0004
     $C7BD
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0014; Branch Offset
     	$C3D0
     	LITexec
     	$0004
     	(DO)exec
     	LITexec
     	$000A
     	$D192
     	(LOOP)exec
     	$FFF8
     ENDIF
     $C3D0
     $C5D1
     $C7BD
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0016; Branch Offset
     	LITexec
     	$000A
     	$D15A
     	SWAPexec; Swap Top of Stack with Next on Stack
     	LITexec
     	$0004
     	$C7BD
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0004; Branch Offset
     	$C71D
     ENDIF
     0refx
     $C3BD
     $C5D1
     $C827
     $D709
     $3493
     +exec; Add Second on Stack To Top of Stack
     TOGGLEexec
     $C083
     ;Sexec

;;; 0 VARIABLE OUTBUF 40 ALLOT-RAM
34F9
     $86; Code
     "OUTBUF"; Name
     $3497; Backward Link
     $C576
     $0E8A

;;; : FORMAT-ANSWER ( d,j -- adr,cnt) OVER >R >R DABS R>
	F#CNVRT OUTBUF 1+ SWAP DUP 1+ >R CMOVE
	R> R> 0< IF 45 ELSE 32 ENDIF OUTBUF C! OUTBUF SWAP ;
3506
     $8A; Code
     ""; Name
     $34F9; Backward Link
     COLON
     OVERexec; Duplicate Second Item at Top of Stack
     $C3A7
     $C3A7
     $D206
     $C3BD
     $34A1
     $3502
     $C71D
     SWAPexec; Swap Top of Stack with Next on Stack
     DUPexec; Duplicate Top of Stack
     $C71D
     $C3A7
     $C285
     $C3BD
     $C3BD
     $C3F1
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $000A; Branch Offset
     	LITexec
     	$002D
     	$C096
     	$0006
     	LITexec
     ENDIF
     $0020
     $3502
     $C516
     $3502
     SWAPexec; Swap Top of Stack with Next on Stack
     ;Sexec    

;;; ( j,d->2DIGIT WITH ROUNDUP

;;; 0 VARIABLE REM
3552
     $83; Code
     "REM"; Name
     $3506; Backward Link
     $C576
     $0EB4

;;; 0 VARIABLE Rsgn 4
355C
     $84; Code
     "Rsgn"; Name
     $3552; Backward Link
     $C576
     $0EB6

;;; 0 VARIABLE 2DIGrslt 6 ALLOT-RAM
3567
     $88; Code
     "2DIGrslt"; Name
     $355C; Backward Link
     $C576
     $0EB8

;;; : j,d>2DIG ( j,d --   j2,d2 saved,  j2&d2 limited to 2 DIGITS)
	0 REM ! DUP Rsgn !  DABS ROT                 ( j,d -- dABS,j)
	>R BEGIN 2DUP 99. D>
	IF 10 M/MOD ROT REM ! R> 1+ >R 0 ELSE 1 ENDIF UNTIL
	REM @ 4 >                  ( Rnd up then ensure 2 digits only)
	IF 1. D+ 2DUP 99. D> IF 10 D/ R> 1+ >R ENDIF ENDIF
	0 >990err ! R> DUP 0>
	IF 3 MIN BEGIN >R 10 D* 2DUP 9900. D> IF -1 >990err ! ENDIF
	R> 1- DUP 0<= UNTIL ENDIF
	>R Rsgn @ 0< IF DMINUS ENDIF 2DIGrslt 2!
	R> [ 2DIGrslt 4 + ] LITERAL ! ;
3576
     $88; Code
     "j,d>2DIG"; Name
     $3567; Backward Link
     COLON
     0refx
     $3558
     !exec
     DUPexec; Duplicate Top of Stack
     $3563
     !exec
     $D206
     $C805
     $C3A7
     $D7C8
     BEGIN
    	LITexec
     	$0063
     	LITexec
     	$0000
     	$DFB8
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$001A; Branch Offset
     		LITexec
     		$000A
     		$D1D5
     		$C805
     		$3558
     		!exec
     		$C3BD
     		$C71D
     		$C3A7
     		0refx
     		$C096
     		$0004
     	ENDIF
     	1refx
     OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     $FFD4; Branch Offset
     $3558
     TOGGLEexec
     LITexec
     $0004
     $C7BD
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0028; Branch Offset
     	LITexec
     	$0001
     	LITexec
     	$0000
     	$C419
     	$D7C8
     	LITexec
     	$0063
     	LITexec
     	$0000
     	$DFB8
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$000E; Branch Offset
     		LITexec
     		$000A
     		$E018
     		$C3BD
     		$C71D
     		$C3A7
	ENDIF
     ENDIF
     0refx
     $22A1
     !exec
     $C3BD
     DUPexec; Duplicate Top of Stack
     $D844
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0032; Branch Offset
     	$C5D1
     	$C827
     	$C3A7
     	BEGIN
     		LITexec
     		$000A
     		$DFE1
     		$D7C8
     		LITexec
     		$26AC
     		LITexec
     		$0000
     		$DFB8
     		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     		$000A; Branch Offset
     			LITexec
     			$FFFF
     			$22A1
     			!exec
        	ENDIF
     		$C3BD
     		$D6F7
     		DUPexec; Duplicate Top of Stack
     		$DF5E
     	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     	$FFD6; Branch Offset
     ENDIF
     $C3A7
     $3563
     TOGGLEexec
     $C3F1
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0004; Branch Offset
     	$C451
     ENDIF
     $3572
     $D74E
     $C3BD
     LITexec
     $0EBC
     !exec
     ;Sexec

;;; : TST2DIG j,d>2DIG 2DIGrslt 2@ 2DIGrslt 4 + @ F#CNVRT  ( **)     CR TYPE ;
3653
     $87; Code
     "TST2DIG"; Name
     $3576; Backward Link
     COLON
     $3581
     $3572
     $D735
     $3572
     LITexec
     $0004
     +exec; Add Second on Stack To Top of Stack
     TOGGLEexec
     $34A1
     CRexec
     $CA72
     ;Sexec

;;; : CLR-OLDDATA  CHRBUF2 ( 1+) BUF2pntr !
	x2 @ 1+ MINx @ ( Clear the display)
	DO 32 I DISPLAY2 wx-emit
	I BUF2pntr @ + C@ 32 = IF LEAVE ENDIF LOOP
	MINx @ x2 !                          ( Reset dsply clmn pntr)
	fDPok @ IF #DIGITS MAXx ! ENDIF  ( Reset max number of digits)
	0 F#SGN ! 0 fDP ! CLR-CHRBUF2 ;
3677
     $8B; Code
     "CLR-OLDDATA"; Name
     $3653; Backward Link
     COLON
     $F21D
     $F23B
     !exec
     $F4DD
     TOGGLEexec
     $C71D
     $3371
     TOGGLEexec
     (DO)exec
     LITexec
     $0020
     $C130
     $F4CB
     $F554
     $C130
     $F23B
     TOGGLEexec
     +exec; Add Second on Stack To Top of Stack
     $C4F6
     LITexec
     $0020
     =exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0004; Branch Offset
     	$C393
     ENDIF
     (LOOP)exec
     $FFDE
     $3371
     TOGGLEexec
     $F4DD
     !exec
     $33BC
     TOGGLEexec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0008; Branch Offset
     	$3398
     	$337C
     	!exec
     ENDIF
     0refx
     $33B0
     !exec
     0refx
     $33D5
     !exec
     $F27B
     ;Sexec

;;; : ENTER-DP -1 fDP ! 1 MAXx +! ;
36E3
     $88; Code
     "ENTER-DP"; Name
     $3677; Backward Link
     COLON
     LITexec
     $FFFF
     $33D5
     !exec
     1refx
     $337C
     $C4B8
     ;Sexec

;;; : ENTER-SGN ( c[-] -- c[0]) F#SGN ! 48 ( 0) 1 MAXx +! ;
3700
     $89; Code
     "ENTER-SGN"; Name
     $36E3; Backward Link
     COLON
     $33B0
     !exec
     LITexec
     $0030
     1refx
     $337C
     $C4B8
     ;Sexec

;;; : LEGAL-DIGIT? ( c -- c,f) 
	( If char is a 0->9 digit, OR if a DP and DPs are allowed)
	47 OVER < OVER 58 < AND OVER 46 = fDPok @ AND fDP @ 0= AND OR
	( OR, if minus sgn AND neg data allowed AND at 1st char entry)
	OVER 45 ( -) = f+/-# @ AND BUF2pntr @ 0= AND OR ;
371E
     $8C; Code
     "LEGAL-DIGIT?"; Name
     $3700; Backward Link
     COLON
     DUPexec; Duplicate Top of Stack
     $F70C
     =exec
     OVERexec; Duplicate Second Item at Top of Stack
     $F715
     =exec
     ORexec
     OVERexec; Duplicate Second Item at Top of Stack
     $F71E
     =exec
     ORexec
     $2201
     TOGGLEexec
     0=exec
     ANDexec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0006; Branch Offset
     	DROPexec; Delete Top of Stack
    	$22F3
     ENDIF
     LITexec
     $002F
     OVERexec; Duplicate Second Item at Top of Stack
     <exec
     OVERexec; Duplicate Second Item at Top of Stack
     LITexec
     $003A
     <exec
     ANDexec
     OVERexec; Duplicate Second Item at Top of Stack
     LITexec
     $002E
     =exec
     $33BC
     TOGGLEexec
     ANDexec
     $33D5
     TOGGLEexec
     0=exec
     ANDexec
     ORexec
     OVERexec; Duplicate Second Item at Top of Stack
     LITexec
     $002D
     =exec
     $33A4
     TOGGLEexec
     ANDexec
     $F23B
     TOGGLEexec
     0=exec
     ANDexec
     ORexec
     ;Sexec

;;; : getF# ( --  CHRBUF2 contains char string)
	BEGIN x2 @ MAXx @ >        ( Display clmn pntr > last clmn ?)
	IF 0 BUF2pntr ! 0 fDP ! ENDIF      ( clear char buffer pntr)
	BEGIN ?KEYPAD UNTIL PCkey
	LEGAL-DIGIT? ( Ensure 0->9 digit, legal DP, or legal - sgn)
	IF BUF2pntr @ 0= IF CLR-OLDDATA ENDIF
	DUP x2 @ DISPLAY2 wx-emit 1 x2 +!   ( Display character)
	( DUP 45 = IF ENTER-SGN ENDIF        ( If -,set sgn,0->dig)
	DUP 46 = IF ENTER-DP ENDIF  ( Enter dp or exit if dp err)
	95 ( _) x2 @ DISPLAY2 wx-emit  ( Display nxt chr prompt)
	DUP BUF2pntr @ C! 1 BUF2pntr +!    ( Enter digit in buf)
	ENDIF
	x2 @ MAXx @ >        ( Display clmn pntr > last clmn ?)
	IF 32 ( sp) x2 @ DISPLAY2 wx-emit ENDIF ( If so, clr prompt)
	ENT = UNTIL ;
3799
     $85; Code
     "getF#"; name
     $371E; Backward Link
     COLON
     BEGIN
     	$F4DD
     	TOGGLEexec
     	$337C
     	TOGGLEexec
     	$C7BD
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$000E; Branch Offset
     		0refx
     		$F23B
     		!exec
     		0refx
     		$33D5
     		!exec
     	ENDIF
     	BEGIN
     		$F912
     	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     	$FFFC; Branch Offset
     	PCkeyexec
     	$372D
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0046; Branch Offset
     	$F23B
     	TOGGLEexec
     	0=exec
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0004; Branch Offset
     		$3685
        ENDIF
     	DUPexec; Duplicate Top of Stack
     	$F4DD
     	TOGGLEexec
     	$F4CB
     	$F554
     	1refx
     	$F4DD
     	$C4B8
     	DUPexec; Duplicate Top of Stack
     	LITexec
     	$002E
     	=exec
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0004; Branch Offset
     		$36EE
	ENDIF
     	LITexec
     	$005F
     	$F4DD
     	TOGGLEexec
     	$F4CB
     	$F554
     	DUPexec; Duplicate Top of Stack
     	$F23B
     	TOGGLEexec
     	$C516
     	1refx
     	$F23B
     	$C4B8
     ENDIF
     $F4DD
     	TOGGLEexec
     	$337C
     	TOGGLEexec
     	$C7BD
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$000E; Branch Offset
     		LITexec
     		$0020
     		$F4DD
     		TOGGLEexec
     		$F4CB
    		$F554
     	ENDIF
     	$F732
     	=exec
     OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     $FF74; Branch Offset
     ;Sexec

;;; 0 VARIABLE NUMLEN
3833
     $86; Code
     "NUMLEN"; Name
     $3799; Backward Link 
     $C576
     $0EC0

;;; : INIT-GET#
	CLR-CHRBUF2                              ( Clear digit buffer)
	0 fDP ! 0 fDP0 !                        ( Clr dp entered flag)
	INITVLU 2@ DUP 0< F#SGN ! DABS INITVLU 4 + @ F#CNVRT
	2DUP OVER + SWAP             ( Check for INITVLU=n.m with m>0)
	DO I C@ DUP 46 ( .) = fDP0 +! 48 > fDP0 @ 0> AND fDP +! LOOP
	( DUP F#SGN @ IF 1+ ENDIF MAXx !
	( Set max num of chars dsplyed DUP NUMLEN ! CHRBUF2 ( 1+) F#SGN @
	IF 45 OVER C! 1 NUMLEN +! 1 MAXx +! 1+ ENDIF
	SWAP DUP MAXx +! CMOVE       ( Put init value strng in buffer)
	CHRBUF2 NUMLEN @ MINx @ DISPLAY2 wx-TYPE  ( Dsply init vlu)
	MAXx @ 1+ x2 ! ;               ( Set dsply clmn > max allowed)
3840
     $89; Code
     "INIT-GET#"; Name
     $3833; Backward Link
     COLON
     $F27B
     0refx
     $33D5
     !exec
     0refx
     $33E0
     !exec
     $338A
     $D735
     DUPexec; Duplicate Top of Stack
     $C3F1
     $33B0
     !exec
     $D206
     $338A
     LITexec
     $0004
     +exec; Add Second on Stack To Top of Stack
     TOGGLEexec
     $34A1
     $D7C8
     OVERexec; Duplicate Second Item at Top of Stack
     +exec; Add Second on Stack To Top of Stack
     SWAPexec; Swap Top of Stack with Next on Stack
     (DO)exec
     $C130
     $C4F6
     DUPexec; Duplicate Top of Stack
     LITexec
     $002E
     =exec
     $33E0
     $C4B8
     LITexec
     $0030
     $C7BD
     $33E0
     TOGGLEexec
     $D844
     ANDexec
     $33D5
     $C4B8
     (LOOP)exec
     $FFDC
     DUPexec; Duplicate Top of Stack
     $383C
     !exec
     $F21D
     $33B0
     TOGGLEexec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0018; Branch Offset
     	LITexec
     	$002D
     	OVERexec; Duplicate Second Item at Top of Stack
     	$C516
     	1refx
     	$383C
     	$C4B8
     	1refx
     	$337C
     	$C4B8
     	$C71D
     ENDIF
     SWAPexec; Swap Top of Stack with Next on Stack
     DUPexec; Duplicate Top of Stack
     $337C
     $C4B8
     $C285
     $F21D
     $383C
     TOGGLEexec
     $3371
     TOGGLEexec
     $F4CB
     $F530
     $337C
     TOGGLEexec
     $C71D
     $F4DD
     !exec
     ;Sexec

;;;: GET[F#] ( -- j,d)
	 #DIGITS MAXx ! -1 fDPok !    ( Init for dp entry allowed)
	INIT-GET# getF#     ( Init digit entry & get float dp number)
	CHRBUF2 1- NUMBER
	( **F#SGN @ IF DMINUS ENDIF**)
	2DUP INITVLU 2! >R >R
	DPL @ 0 MAX MINUS DUP INITVLU 4 + ! R> R> ; 
38F0
     $87; Code
     "GET[F#]"; Name
     $3840; Backward Link
     COLON
     $3398
     $337C
     !exec
     LITexec
     $FFFF
     $33BC
     !exec
     $384C
     $37A1
     $F21D
     $D6F7
     $CD2B
     $D7C8
     $338A
     $D74E
     $C3A7
     $C3A7
     $C6DF
     TOGGLEexec
     0refx
     $C83F
     $C438
     DUPexec; Duplicate Top of Stack
     $338A
     LITexec
     $0004
     +exec; Add Second on Stack To Top of Stack
     !exec
     $C3BD
     $C3BD
     ;Sexec

;;; : GET[n#] ( -- n) 0 fDPok ! ( Init for whole number entry only)
	INIT-GET# getF#      ( Init digit entry & get whole number)
	CHRBUF2 1- NUMBER 2DUP INITVLU 2! DROP >R
	DPL @ 0 MAX MINUS INITVLU 4 + ! R> ;
393A
     $87; Code
     "GET[n#]"; Name
     $38F0; Backward Link
     COLON
     0refx
     $33BC
     !exec
     $384C
     $37A1
     $F21D
     $D6F7
     $CD2B
     $D7C8
     $338A
     $D74E
     DROPexec; Delete Top of Stack
     $C3A7
     $C6DF
     TOGGLEexec
     0refx
     $C83F
     $C438
     $338A
     LITexec
     $0004
     +exec; Add Second on Stack To Top of Stack
     !exec
     $C3BD
     ;Sexec

;;; : D-SPACES ( n --) DUP 0= IF DROP EXIT ENDIF
	0 DO 32 DSPLYwrite LOOP ;
3978
     $88; Code
     "D-SPACES"; Name
     $393A; Backward Link
     COLON
     DUPexec; Duplicate Top of Stack
     0=exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0006; Branch Offset
     	DROPexec; Delete Top of Stack
     	$D6BB
     ENDIF
     0refx
     (DO)exec
     LITexec
     $0020
     $F397
     (LOOP)exec
     $FFF8
     ;Sexec

;;; : TYPE-SEC  CHRBUF2 COUNT 1 DISPLAY2 wx-TYPE \ Dsply init vlu)
	4 CHRBUF2 C@ - 0 MAX D-SPACES 2 CHRBUF2 C@ SETcurser ;
39A1
     $88
     "TYPE-SEC"; Name
     $3978; Backward Link
     COLON
     $F21D
     $CA5F
     1refx
     $F4CB
     $F530
     LITexec
     $0004
     $F21D
     $C4F6
     $C776
     0refx
     $C83F
     $3983
     $C5C9
     $F21D
     $C4F6
     $F3AB
     ;Sexec

;;; : INIT-DLYTME
	CLR-CHRBUF2                              ( Clear digit buffer)
	INITVLU 2@ DABS <# #S #>
	CHRBUF2 C! CHRBUF2 COUNT CMOVE  \ Put init vlu str in buffer
	2 1 SETcurser 5 D-SPACES
	CHRBUF2 COUNT 1 DISPLAY2 wx-TYPE \ Dsply init vlu)
	4 CHRBUF2 C! ;
39D2
     $8B; Code
     "INIT-DLYTME"; Name
     $39A1; Backward Link
INIT-DLYTME:
39E0 COLON
     $F27B
     $338A
     $D735
     $D206
     $D5E1
     $D646
     $D5F0
     $F21D
     C!exec
     $F21D
     $CA5F
     $C285
     2refx
     1refx
     $F3AB
     LITexec
     $0005
     $3983
     $F21D
     $CA5F
     1refx
     $F4CB
     $F530
     LITexec
     $0004
     $F21D
     C!exec
     ;Sexec

;;; ( FLOATING POINT NUMBER ENTRY

;;; : GET[sec] ( -- n) INIT-DLYTME
	BEGIN
	BEGIN ?KEYPAD UNTIL PCkey
	47 OVER < OVER 59 < AND \ 0-9 digit ?
	IF CHRBUF2 C@ 4 >= IF CHRBUF2 5 32 FILL 0 CHRBUF2 C! ENDIF
	DUP CHRBUF2 COUNT + C! 
	CHRBUF2 C@ 1+ CHRBUF2 C!
	TYPE-SEC             \ Display Dly Sec Data
	ENDIF
	ENT = UNTIL
	CHRBUF2 NUMBER 2DUP INITVLU 2! DROP >R
	0 INITVLU 4 + ! R> ;
3A1A
     $88; Code
     GET[sec]; Name
     $39D2; Backward Link
     COLON
     BEGIN
     	INIT-DLYTME
     	BEGIN
     		$F912
     	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     	$FFFC; Branch Offset
     	PCkeyexec
     	LITexec
     	$002F
     	OVERexec; Duplicate Second Item at Top of Stack
     	<exec
     	OVERexec; Duplicate Second Item at Top of Stack
     	LITexec
     	$003B
     	<exec
     	ANDexec
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0038; Branch Offset
     		$F21D
     		C@exec
     		LITexec
     		$0004
     		$D829
     		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     		$0014; Branch Offset
     		$F21D
     		LITexec
     		$0005
     		LITexec
     		$0020
     		$CC21
     		0refx
     		$F21D
     		C!exec
     		DUPexec; Duplicate Top of Stack
     		$F21D
     		$CA5F
     		+exec; Add Second on Stack To Top of Stack
     		C!exec
     		$F21D
     		C@exec
     		$C71D
     		$F21D
     		C!exec
     		$39AC
     	ENDIF
     	$F732
     	=exec
     OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     $FFA6; Branch Offset
     $F21D
     $CD2B
     $D7C8
     $338A
     $D74E
     DROPexec; Delete Top of Stack
     $C3A7
     0refx
     $338A
     LITexec
     $0004
     +exec; Add Second on Stack To Top of Stack
     !exec
     R>exec
     ;Sexec

;; A/DHiByte
3AA3
     $89; Code
     "A/DHiByte"; Name
     $3A1A; Backward Link
     $C596; Processing Routine Token
     A/DHiByte

;; A/DLowByte
3AB3
     $8A; Code
     "A/DLowByte"; Name
     $3AA3; Backward Link
     GetVar; Processing Routine Token
     A/DLowByte

;; A/DStatus
3AC4
     $89; Code
     "A/DStatus"; Name
     $3AB3; Backward Link
     GetVar; Processing Routine Token
     A/DStatus

;; ACQcntrl
3AD4
     $88; Code
     "ACQcntrl"; Name
     $3AC4; Backward Link
     GetVar; Processing Routine Token
     $0EC2

;; VIALSWI/O
3AE3
     $89; Code
     "VIALSWI/O"; Name
     $3AD4; Backward Link
3AEF
VIALSWI/Orefx:
     GetVar; Processing Routine Token
     A/DStatus

;; 20 CONSTANT VIALbit
3AF3
     $87; Code
     "VIALbit"; Name
     $3AE3; Backward Link
     GetVar; Processing Routine Token
     $0020; Constant value

;; ?VIAL-IN
3B01
     $88; Code
     "?VIAL-IN"; Name
     $3AF3; Backward Link
     COLON
     VIALSWI/Orefx
     C@exec
     $3AFD
     ANDexec
     0=exec
     DUPexec; Duplicate Top of Stack
     $2276
     !exec
     ;Sexec    

;; ?VIAL-OUT
3B20
     $89; Code
     "?VIAL-OUT"; Name
     $3B01; Backward Link
     COLON
     VIALSWI/Orefx
     C@exec
     $3AFD
     ANDexec
     DUPexec; Duplicate Top of Stack
     0=exec
     $2276
     !exec
     $DF50
     ;Sexec

;; LMPstat
3B42
     $87; Code
     "LMPstat"; Name
     $3B20; Backward Link
LMPstatrefx:
3B4C GetVar; Processing Routine Token
     $0EC4

;; BTST
3B50
     $84; Code
     "BTST"; Name
     $3B42; Backward Link
     GetVar; Processing Routine Token
     $0EC6

;; A/Ddta
3B5B
     $86; Code
     "A/Ddta"; Name
     $3B50; Backward Link
     GetVar; Processing Routine Token
     $0EC8

;; GAINvlu
3B68
     $87; Code
     "GAINvlu"; Name
     $3B5B; Backward Link
GAINvluexec:
3B72 GetVar; Processing Routine Token
     $0ECA

;; GAINexp
3B76
     $87; Code
     "GAINexp"; Name
     $3B68; Backward Link
     GetVar; Processing Routine Token
     $0ECC

;; X1
3B84
     $82; Code
     "X1"; Name
     $3B76; Backward Link
     GetVar; Processing Routine Token
     $0007

;; X10
3B8D
     $83; Code
     "X10"; Name
     $3B84; Backward Link
     GetVar; Processing Routine Token
     $0006

;; X100
3B97
     $84; Code
     "X100"; Name
     $3B8D; Backward Link
     GetVar; Processing Routine Token
     $0004

;; X1000
3BA2
     $85; Code
     "X1000"; Name
     $3B97; Backward Link
     GetVar; Processing Routine Token
     $0000

;; REFchan
3BAE
     $87; Code
     "REFchan"; Name
     $3BA2; Backward Link
     GetVar; Processing Routine Token
     $0090

;; SIGchan
3BBC
     $87; Code
     "SIGchan"; Name
     $3BAE; Backward Link
     GetVar; Processing Routine Token
     $0050

;; LMPinten
3BCA
     $88; Code
     "LMPinten"; Name
     $3BBC; Backward Link
LMPinten:
3BD5 GetVar; Processing Routine Token
     $0030

;; AGnd
3BD9
     $84; Code
     "AGnd"; Name
     $3BCA; Backward Link
AGnd:
3BE0 GetVar; Processing Routine Token
     $0000

;;; LAMP CONTROL

;;; HEX

;;; 7002 CONSTANT ACQRI/O
3BE4
     $87; Code
     "ACQRI/O"; Name
     $3BD9; Backward Link
ACQRI/O:
3BEE GetVar; Processing Routine Token
     $7002; Constant value

;;; 0 VARIABLE ACQRmode
3BF2
     $88; Code
     "ACQRmode"; Name
     $3BE4; Backward Link
ACQRmode:
3BFD GetVar; Processing Routine Token
     ACQRmode; Var Addr

;;; 0 VARIABLE LMPERR
3C01
     $87; Code
     "LMPERR"; Name
     $3BF2; Backward Link
LMPERR:
3C0A GetVar; Processing Routine Token
     LMPERR; Var Addr

;;; 0 CONSTANT RUNmode
3C0E
     $87; Code    
     "RUNmode"; Name
     $3C01; Backward Link
RUNmode:
3C18 GetVar; Processing Routine Token
     $0000; Constant value

;;; 0 VARIABLE flMPERR
3C1C
     $87; Code
     "flMPERR"; Name
     $3C0E; Backward Link
flMPERR:
3C26 GetVar; Processing Routine Token
     flMPERR; Var Addr

;;; 60 CONSTANT TESTmode
3C2A
     $88; Code
     "TESTmode"; Name
     $3C1C; Backward Link
TESTmode:
3C35 GetVar; Processing Routine Token
     $0060; Constant value

;;; 20 CONSTANT OSmode
3C39
     $86; Code
     "OSmode"; Name
     $3C2A; Backward Link
OSmoderefx:
3C42 GetVar; Processing Routine Token
     $0020; Constant value

;;; 80 CONSTANT STARTacqr
3C46
     $89; Code
     "STARTacqr"; Name
     $3C39; Backward Link
STARTacqrrefx:
3C52 GetVar; Processing Routine Token
     $0080; Constant value

;;; 7F CONSTANT LMPreset
3C56
     $88; Code
     "LMPreset"; Name
     $3C46; Backward Link
LMPreset:
3C61 GetVar; Processing Routine Token
     $007F; Constant value

;;; 0 VARIABLE #LMPERR
3C65
     $87; Code
     "#LMPERR"; Name
     $3C56; Backward Link
#LMPERR:
3C6F GetVar; Processing Routine Token
     #LMPERR; Var Addr

;;; 40 CONSTANT LMPDtaRdy
3C73
     $89; Code
     "LMPDtaRdy"; Name
     $3C65; Backward Link
LMPDtaRdy:
3C7F GetVar; Processing Routine Token
     $0040; Constant value

;;; 0 VARIABLE TRIGerr
3C83
     $87; Code
     "TRIGerr"; Name
     $3C73; Backward Link
TRIGerrrefx:
3C8D GetVar; Processing Routine Token
     TRIGerr; Var Addr

;;; 0 VARIABLE TRIGDLY
3C91
     $87; Code
     "TRIGDLY"; Name
     $3C83; Backward Link
TRIGDLYrefx:
3C9B GetVar; Processing Routine Token
     TRIGDLY; Var Addr
     
;;; DECIMAL

;;; : TRIGER-LAMP @ LMPreset AND ( Set bit for lamp HV reset)
3C9F
     $8B; Code
     "TRIGER-LAMP"; Name
     $3C91; Backward Link
     COLON
     LMPstatrefx
     TOGGLEexec
     $3C61
     ANDexec
     DUPexec; Duplicate Top of Stack
     $3BEE
     C!exec
     TRIGDLYrefx
     TOGGLEexec
     LITexec
     $0032
     $C83F
     $E683
     STARTacqrrefx
     ORexec
     DUPexec; Duplicate Top of Stack
     LMPstatrefx
     !exec
     $3BEE
     C!exec
     ;Sexec

;; : LMPFAIL -1 fABORT ! -1 TRIGerr ! fTEST @ 0=
	IF "LMPFAIL1 DISPLAY1 w-TYPE ( ** WAIT-ENT*) ENDIF ;
3CD9
     $87
     "LMPFAIL"
     $3C9F; Backward Link
     COLON
     LITexec
     $FFFF
     $2227
     !exec
     LITexec
     $FFFF
     TRIGerrrefx
     !exec
     $F703
     TOGGLEexec
     0=exec
     $OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0008; Branch Offset
     	$25C1
     	$F4BC
     	$F51E
     ENDIF
     ;Sexec

;; FIRE-LAMP
3D07
     $89
     "FIRE-LAMP"
     $3CD9; Backward Link
     COLON
     0refx
     $3C0A
     !exec
     LITexec
     $FFFF
     $3C26
     !exec
     $3CAD
     0refx
     $C71D
     DUPexec; Duplicate Top of Stack
     LITexec
     $000A
     $C7BD
     $3AD0
     C@exec
     LITexec
     $00FF
;;;;;;;;;;

org 3DB0
DRError db 'DATA READY ERROR(s)'

;; Rt~
3DC8
     $83
     "Rt~"
     $3D07; Backward Link
     GetVar
     $0EDA

;Gain and Mux Control Assembly Code Subroutine

;; 0 VARIABLE TmpX
3DD2
     $84
     "TmpX"
     $3DC8; Backward Link
     GetVar
     $0EDC

3DDD
;; @GAINCode
     $89
     "@GAINCode"
     $3DD2; Backward Link
     $3DEB

3DEB   GainCode: LDX     #$0000; clear GAINexp
3DEE             STX     $GAINexp   
3DF1             LDX     #$0007; default value
3DF4             CLR B; default value
3DF5             LDA A   GAINvlu+1; get gain request code   
3DF8             CMP A   #$E8; is it 1000?
3DFA             BNE     Gain100; no, try 100   
3DFC   Gain1000: LDX     #$0000; value for 1000
3DFF             LDA B   #$03; value for 1000
3E01   Gain100:  CMP A   #$64; is it 100?
3E03             BNE     Gain10; no, try 10   
3E05             LDX     #$0004; value for 100
3E08             LDA B   #$02; value for 1000
3E0A   Gain10:   CMP A   #$0A; is it 10?
3E0C             BNE     GainDflt; no, use default (1?)   
3E0E             LDX     #$0006; value for 10
3E11             LDA B   #$01; value for 10
3E13   GainDflt: STX     $Tmpx   
3E16             STA B   GAINexp+1   
3E19             LDA A   $Tmpx; gets calculated value stored from x into acc a,b 
3E1C             LDA B   $Tmpx+1   
3E1F             RTS

;; SET-ANALOG-CNTRL
3E20 $90
     SET-ANALOG-CNTRL
     $3DDD; Backward Link
     $3E35 (SetADCtl:)

3E35   SetADCtl: JSR     GainCode   
3E38             ORA B   $MUXset+1   
3E3B             ORA B   #$08; BKLite bit
3E3D             STA B   $MUXstat+1; Store code in image safe   
3E40             STA B   $MuxControl   
3E43             JMP     NEXT


;; SIG[Offset]
3E46 $8B
     "SIG[Offset]"
     $3E20; Backward Link
     GetVar
     $0EDE

;; SVstat
3E58
     $86
     "SVstat"
     $3E46; Backward Link
SVstatrefx:
3E61 GetVar
     $0EE0

;; 'GET[Sig] 
3E65
     $89
     "'GET[Sig]"
     $3E58; Backward Link
'GET[Sig]:
3E71 GetVar
     $0EE2

;; #PRIMES
3E75
     $87
     "#PRIMES"
     $3E65; Backward Link
#PRIMES:
3E7F GetVar
     $0EE4

;; SET[Offset]
3E83
     $8B; Code
     "SET[Offset]"; Name
     $3E75; Backward Link
     COLON
     LMPstatrefx
     TOGGLEexec
     DUPexec; Duplicate Top of Stack
     SVstatrefx
     !exec
     LITexec
     $009F
     ANDexec
     LITexec
     $0020
     ORexec
     LMPstatrefx
     !exec
     ;Sexec

;; SET[Normal]
3EAF
     $8B; Code
     "SET[Normal]"; Name    
     $3E83; Backward Link
     COLON
     SVstatrefx
     TOGGLEexec
     LMPstatrefx
     !exec
     ;Sexec

;; PRIME-LAMP-CONTROL
3EC9
     $92
     "PRIME-LAMP-CONTROL" 
     $3EAF; Backward Link
     COLON
     #PRIMES
     TOGGLEexec
     0refx
     $(DO)exec
     $3CAD  
     (LOOP)exec
     $FFFC
     ;Sexec

;; 0 VARIABLE Temp
3EF0
     $84
     "Temp"
     $3EC9; Backward Link
     GetVar
     $0EE6

;; 0 VARIABLE rtn
3EFB
     $83
     "rtn"
     $3EF0; Backward Link
     GetVar
     $0EE8

;; A/D!
3F05
     $84
     "A/D!"
     $3EFB; Backward Link
     $3F0E

3F0E   A/D!   LDA A   $0EC5   
3F11            AND A   #$F0
3F13            ORA A   A/Ddta   
3F16            STA A   A/DHiByte   
3F19            LDA B   A/Ddta+1   
3F1C            STA B   A/DLowByte   
3F1F            RTS

;; A/D>LMPstat  
3F20
     $8B
     "A/D>LMPstat"
     $3F05; Backward Link
     $3F30
    
3F30   S_3F30   AND A   #$0F
3F32            LDA B   $0EC5   
3F35            AND B   $00F0   
3F37            ABA  
3F38            STA A   $0EC5   
3F3B            RTS

;;; 0 VARIABLE LOOPcntr
3F3C
      $88
      "LOOPcntr"
      $3F20; Backward Link
      GetVar
      $0EEA

;; A/DCNVRT
3F4B
      $88
      "A/DCNVRT"
      $3F3C; Backward Link
      $3F58

3F58   L_3F58   LDA A   #$0C
3F5A            STA A   $0EEA   
3F5D            LDX     #$0800
3F60            STX     $0EC6   
3F63            LDX     #$0000
3F66            STX     A/Ddta   
3F69   L_3F69   LDA A   A/Ddta   
3F6C            LDA B   $0EC9   
3F6F            ORA A   $0EC6   
3F72            ORA B   $0EC7   
3F75            STA A   A/Ddta   
3F78            STA B   $0EC9   
3F7B            JSR     A/D!   
3F7E            LDA A   A/DStatus   
3F81            BMI     L_3F95   
3F83            LDA A   A/Ddta   
3F86            LDA B   $0EC9   
3F89            EOR A   $0EC6   
3F8C            EOR B   $0EC7   
3F8F            STA A   A/Ddta   
3F92            STA B   $0EC9   
3F95   L_3F95   CLC  
3F96            ROR     $0EC6   
3F99            ROR     $0EC7   
3F9C            DEC     $0EEA   
3F9F            LDA A   $0EEA   
3FA2            BNE     L_3F69   
3FA4            LDA A   A/Ddta   
3FA7            LDA B   $0EC9   
3FAA            JMP     PUSHD
     
3FAD   L_3FAD   JSR     S_3F30   
3FB0            JMP     NEXT

*******************************************************

;;; 0 VARIABLE DltaGains
3FB3
     $89; Code
     "DltaGains"; Name
     $3F4B; Backward Link
     $C576
     $0EEC

;;; : SCALE-GAIN ( n -- exp,N) 0 SWAP -4 1000 0 DltaGains @ nF*/ ;  
	Swap 0 and -4 1000 0 Leave DltaGains
3FC3
     $8A; Code
     "SCALE-GAIN"; Name
     $3FB3; Backward Link
     COLON
     0refx
     SWAPexec; Swap Top of Stack with Next on Stack
     LITexec
     $FFFC
     LITexec
     $03E8
     0refx
     $3FBF
     TOGGLEexec
     $E470
     ;Sexec

;;; : DSPLYGc's                ( Display correction factors on CRT)   
	CR ." Gain factors Gc0,Gc1,Gc2,Gc3 "                            
	[ DltaGains 16 + ] LITERAL DltaGains  
 	 LITERAL if compiling, compile stack val n as 16bit literal when executed will leave n on stack                        
	DO ( DUP) I 2@ 0 ROT FORMAT-ANSWER SPACE TYPE 4 +LOOP ;
3FE8
     $89; Code
     "DSPLYGc's"; Name
     $3FC3; Backward Link
     COLON
     CRexec
     $CAD3
     $1D	; Msg Bytes
     " Gain factors Gc0,Gc1,Gc2,Gc3 "
     LITexec
     $0EFC
     $3FBF
     (DO)exec
     $C130
     $D735
     0refx
     $C805
     $3516
     $C819
     $CA72
     LITexec
     $0004
     $C0DF
     $FFEC
     ;Sexec

;;; 0 VARIABLE s0
4038
     $82; Code
     "s0"; Name
     $3FE8; Backward Link
     $C576
     $0F02

;;; : FORMAT-GAIN ( n10 -- adr,cnt) 0 SWAP -2 100 0 s0 @ nF*/
	0 ROT FORMAT-ANSWER ;
4041
     $8B; Code
     "FORMAT-GAIN"; Name 
     $4038; Backward Link
     COLON
     0refx
     SWAPexec; Swap Top of Stack with Next on Stack
     LITexec
     $FFFE
     LITexec
     $0064
     0refx
     $403D
     TOGGLEexec
     $E470
     0refx
     $C805
     $3516
     ;Sexec

;;; : TYPEGAINS ."   GAIN " DUP FORMAT-GAIN TYPE ;
406D
     $89; Code
     "TYPEGAINS"; Name
     $4041; Backward Link
     COLON
     $CAD3
     $07	; Msg Bytes
     "  GAIN "
     DUPexec; Duplicate Top of Stack
     $404F
     $CA72
     ;Sexec

;;; 0 VARIABLE CYCL[n]
408D
     $87; Code
     "CYCL[n]"; Name
     $406D; Backward Link
     $C576
     $0F04

;;; 0 VARIABLE MINSMPL#
409B
     $88; Code
     "MINSMPL#"; Name
     $408D; Backward Link
     $C576
     $0F06

;;; 0 VARIABLE R[Hi]
40AA
     $85; Code
     "R[Hi]:; Name
     $409B; Backward Link
     $C576
     $0F08

;;; 0 VARIABLE R[Lo]
40B6
     $85; Code
     "R[Lo]"; Name
     $40AA; Backward Link
     $C576
     $0F0A

;;; 0 VARIABLE Dlta
40C2
     $84; Code
     "Dlta"; Name
     $40B6; Backward Link
     $C576
     $0F0C

;;; 0 VARIABLE SUM[Rn] 4 ALLOT-RAM
40CD
     $87; Code
     "SUM[Rn]"; Name
     $40C2; Backward Link
     $C576
     $0F0E

;;; 0 VARIABLE 1/Dlta 4 ALLOT-RAM
40DB
     $86; Code
     "1/Dlta; Name
     $40CD
     $C576
     $0F14

;;; 50 CONSTANT #GTRIES
40E8
     $87; Code
     "#GTRIES; Name
     $40DB; Backward Link
     $C576
     $0032

;;; 1000 CONSTANT GLimit
40F6
     $86; Code
     "GLimit"; Name
     $40E8; Backward Link
     $C576
     $03E8

;;; 0 VARIABLE fNFg>Lim
4103
     $88; Code
     "fNFg>Lim; Name
     $40F6; Backward Link
     $C576
     $0F1A

;;; 0 VARIABLE fOffset
4112
     $87; Code
     "fOffset" Name
     $4103; Backward Link
     $C576
     $0F1C

;;; : INIT-SIGFILTER 0. SUM[Rn] 2! 0 R[Hi] ! 32767 R[Lo] ! 0 CYCL[n] ! ;
4120
     $8E; Code
     "INIT-SIGFILTER"
     $4112; Backward Link
     COLON
     LITexec
     $0000
     LITexec
     $0000
     $40D7
     $D74E
     0refx
     $40B2
     !exec
     LITexec
     $7FFF
     $40BE
     !exec
     0refx
     $4097
     !exec
     ;Sexec

;;; : TYPE-%Dlta <# # # 46 HOLD #S #> TYPE ;
4155
     $8A; Code
     "TYPE-%Dlta"; Name
     $4120; Backward Link
     COLON
     $D5E1
     $D61E
     $D61E
     LITexec
     $002E
     HOLDexec
     $D646
     $D5F0
     $CA72
     ;Sexec

;;; : GTYPE-ALL CR SUM[Rn] 2@ CYCL[n] @ 8 * D/                        ." GAINSIG=" D.                                                 
4178
      $89                  
      "GTYPE-ALL"; Name
      $4155; Backward Link
      COLON
      CRexec
      $40D7
      $D735
      $4097
      TOGGLEexec
      LITexec
      $0008
      $D149
      $E018
      $CAD3
      $08	; Msg Bytes
      "GAINSIG="
      $D692
      $CAD3
      $07	; Msg Bytes
      "%DLTA="
      $40C9
      TOGGLEexec
      0refx
      $4162
      ;Sexec

;;; : @TEST-SIG ( -- n Sum of 8 readings0  0   8 0 
	DO FIRE-LAMP A/DCNVRT + LOOP                            
	DUP R[Hi] @ > IF DUP R[Hi] ! ENDIF                               
	DUP R[Lo] @ < IF DUP R[Lo] ! ENDIF 0 ;
41B9
     $89; Code
     "@TEST-SIG"; Name
     $4178; Backward Link
     COLON
     0refx
     LITexec
     $0008
     0refx
     (DO)exec
     $3D13
     $3F56
     +exec; Add Second on Stack To Top of Stack
     (LOOP)exec
     $FFF8
     DUPexec; Duplicate Top of Stack
     $40B2
     TOGGLEexec
     $C7BD
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0008; Branch Offset
     	DUPexec; Duplicate Top of Stack
     	$40B2
     	!exec
     ENDIF
     DUPexec; Duplicate Top of Stack
     $40BE
     TOGGLEexec
     <exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0008; Branch Offset
     	DUPexec; Duplicate Top of Stack
     	$40BE
     	!exec
     ENDIF
     0refx
     ;Sexec

;;; : CHK-GAINok
	1/Dlta 2@ IF DROP 0 ELSE DUP 0< IF DROP 0 ELSE 10000 SWAP 1 MAX / ENDIF
	ENDIF Dlta ! GTYPE-ALL                                           
	CYCL[n] @ #GTRIES > 100 #GTRIES * 0 SUM[Rn] 2@ D< AND           
	IF -1 fNFg>Lim ! 0. SUM[Rn] 2!                                     
	CR ." UNSTABLE GAIN DATA " CR ENDIF ;
4203
     $8A; Code
     "CHK-GAINok"; Name
     $41B9; Backward Link
     COLON
     $40E4
     $D735
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $000A; Branch Offset
     	DROPexec; Delete Top of Stack
     	0refx
     	$C096
     	$001E
     ENDIF
     DUPexec; Duplicate Top of Stack
     $C3F1
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $000A; Branch Offset
     	DROPexec; Delete Top of Stack
     	0refx
     	$C096
     	$000E
     ENDIF
     LITexec
     $2710
     SWAPexec; Swap Top of Stack with Next on Stack
     1refx
     $C83F
     $D192
     $40C9
     !exec
     $4184
     $4097
     TOGGLEexec
     $40F2
     $C7BD
     LITexec
     $0064
     $40F2
     $D149
     0refx
     $40D7
     $D735
     $DFA5
     ANDexec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0030; Branch Offset; *** check this offset ***
     	LITexec
     	$FFFF
     	$410E
     	!exec
     	LITexec
     	$0000
    	LITexec
     	$0000
     	$40D7
     	$D74E
     	CRexec
     	$CAD3
     	$13	; Msg Bytes
     	"UNSTABLE GAIN DATA "
     	CRexec
     ENDIF
     ;Sexec
     
;;; : GET-TEST-SIG ( -- n) INIT-SIGFILTER                             
	SPACE #GTRIES 2+ 0                                              
	DO @TEST-SIG SUM[Rn] 2@ D+ SUM[Rn] 2!                              
	1 CYCL[n] +! CYCL[n] @ DUP . MINSMPL# @ >                       
	IF SUM[Rn] 2@ R[Hi] @ R[Lo] @ - 1 MAX D/ 2DUP 1/Dlta 2!            
	GLimit 0 D> fABORT @ OR                                         
	SUM[Rn] 2@ 400. D< fOffset @ AND OR                             
	IF LEAVE ENDIF ENDIF                                        
	LOOP CHK-GAINok SUM[Rn] 2@ CYCL[n] @ 8 * D/ DROP ;            
4292
     $8C; Code
     "GET-TEST-SIG"; Name
     $4203; Backward Link
     COLON
     $4131
     $C819
     $40F2
     $C72A
     0refx
     (DO)exec
     $41C5
     $40D7
     $D735
     $C419
     $40D7
     $D74E
     1refx
     $4097
     $C4B8
     $4097
     TOGGLEexec
     DUPexec; Duplicate Top of Stack
     $D6A0
     $40A6
     TOGGLEexec
     $C7BD
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0044; Branch Offset
     	$40D7
     	$D735
     	$40B2
     	TOGGLEexec
     	$40BE
     	TOGGLEexec
     	$C776
     	1refx
     	$C83F
     	$E018
     	$D7C8
     	$40E4
     	$D74E
     	$40FF
     	0refx
     	$DFB8
     	$2227
     	TOGGLEexec
     	ORexec
     	$40D7
     	$D735
     	LITexec
     	$0190
     	LITexec
     	$0000
     	$DFA5
     	$411C
     	TOGGLEexec
     	ANDexec
     	ORexec
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0004; Branch Offset
     		$C393
 	ENDIF
     ENDIF
     (LOOP)exec
     $FF98
     $4210
     $40D7
     $D735
     $4097
     TOGGLEexec
     LITexec
     $0008
     $D149
     $E018
     DROPexec; Delete Top of Stack
     ;Sexec

;;; : READtest CR ." Sig " 0 fOffset ! GET-TEST-SIG ;               
432F
     $88; Code
     "READtest" Name
     $4292; Backward Link
     COLON
     CRexec
     $CAD3
     $04	; Msg Bytes
     "Sig "
     0refx
     $411C
     !exec
     $42A1
     ;Sexec

: READoffset CR ." Offset "                                       
	SET[Offset] 7 MINSMPL# ! -1 fOffset !                           
	GET-TEST-SIG SET[Normal] ;
434F
     $8A; Code
     "READoffset"; Name
     $432F; Backward Link
     COLON
     CRexec
     $CAD3
     $07	; Msg Bytes
     "Offset "
     $3E91
     LITexec
     $0007

;;; ( GAIN MEASUREMENT                             08:04 10/23/89 )
;;; : SETtestSIG ( Set test signal input) LMPstat @ TESTmode OR LMPstat ! ;
4382
     $8A; Code
     "SETtestSIG"; Name
     $434F; Backward Link
     COLON
     $3B4C
     TOGGLEexec
     $3C35
     ORexec
     $3B4C
     !exec
     ;Sexec

;;; : SETnormalSIG ( Set normal detector signal input)   LMPstat @ TESTmode 255 XOR AND  LMPstat ! ;
439F
     $8C; Code
     "SETnormalSIG" Name
     $4382; Backward Link
     COLON
     $3B4C
     TOGGLEexec
     $3C35
     LITexec
     $00FF
     $C33C
     ANDexec
     $3B4C
     !exec
     ;Sexec

;;; : @TEST[sig0] SIGchan  7 OR BKLITEbit OR DUP MUXstat ! CHANmux C! 8 1- MINSMPL# ! READtest READoffset - ;
43C4
     $8B; Code
     "@TEST[sig0]"; Name
     $439F; Backward Link
     COLON
     $3BC6
     LITexec
     $0007
     ORexec
     $F0F9
     ORexec
     DUPexec; Duplicate Top of Stack
     $224F
     !exec
     $225D
     $C516
     LITexec
     $0008
     $D6F7
     $40A6
     !exec
     $433A
     $435C
     $C776
     ;Sexec

;;; : @TEST[sig1] MUXstat @ 7 OR 1 XOR DUP MUXstat ! CHANmux C! 3 MINSMPL# ! READtest READoffset - ;                          
43FC
     $8B; Code
     "@TEST[sig1]"; Name
     $43C4; Backward Link
     COLON
     $224F
     TOGGLEexec
     LITexec
     $0007
     ORexec
     1refx
     $C33C
     DUPexec; Duplicate Top of Stack
     $224F
     !exec
     $225D
     $C516
     $C5D1
     $40A6
     !exec
     $433A
     $435C
     $C776
     ;Sexec

;;; ": @TEST[sig2] MUXstat @ 7 OR 2 XOR DUP MUXstat ! CHANmux C! 3 MINSMPL# ! READtest READoffset - ;
4432
     $8B; Code
     "@TEST[sig2]" Name
     $43FC; Backward Link
     COLON
     $224F
     TOGGLEexec
     LITexec
     $0007
     ORexec
     $C5C9
     $C33C
     DUPexec; Duplicate Top of Stack
     $224F
     !exec
     $225D
     $C516
     $C5D1
     $40A6
     !exec
     $433A
     $435C
     $C776
     ;Sexec

;;; : @TEST[sig3] MUXstat @ 7 OR 4 XOR DUP MUXstat ! CHANmux C! 3 MINSMPL# ! READtest READoffset - ;
4468
     $8B
     "@TEST[sig3]; Name
     $4432; Backward Link
     COLON
     $224F
     TOGGLEexec
     LITexec
     $0007
     ORexec
     LITexec
     $0004
     $C33C
     DUPexec; Duplicate Top of Stack
     $224F
     !exec
     $225D
     $C516
     $C5D1
     $40A6
     !exec
     $433A
     $435C
     $C776
     ;Sexec

;;; 0 VARIABLE fGERR
44A0
     $85; Code
     "fGERR"; Name
     $4468; Backward Link
     $C576
     $0F1E

;;; "STRNG" "RNGERR  | GAIN RANGE ERROR        |
44AC
     $87; Code
     "RNGERR"; Name
     $44A0; Backward Link
     "GAIN RANGE ERROR        "
     $00

;;; : Stop "STOPED DISPLAY1 w-TYPE
44D3
     $84; Code
     "STOPED"; Name
     $44AC; Backward Link
     COLON
     $26D5
     $F4BC
     $F51E
     LITexec
     $FFFF
     $2201
     !exec
     $22BF
     $F142
     BEGIN
     	$F18D
     	$32A3
     	0refx
     OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     $FFF8; Branch Offset
     ;Sexec

;;; : EVALGAIN ( n --   fGERR updated) DUP  9 < SWAP 12 > OR fNFg>Lim @ OR fGERR @ OR fGERR ! ;
44FA
     $88; Code
     "EVALGAIN"; Name
     $44D3; Backward Link
     COLON
     DUPexec; Duplicate Top of Stack
     LITexec
     $0009
     <exec
     SWAPexec; Swap Top of Stack with Next on Stack
     LITexec
     $000C
     $C7BD
     ORexec
     $410E
     TOGGLEexec
     ORexec
     $44A8
     TOGGLEexec
     4C32A
     $44A8
     !exec
     ;Sexec

;;; : GAINTEST ( -- f) fGERR @ IF "RNGERR DISPLAY2 w-TYPE Stop ENDIF ;
	IF fGERR True then Send String RNGERR "GAIN RANGE ERROR" to DISPLAY2 w-TYPE STOP
452B
     $88; Code
     "GAINTEST"; Name
     $44FA; Backward Link
     COLON
     $44A8
     TOGGLEexec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $000A; Branch Offset
     	$44B6
     	$F4CB
     	$F51E
     	$44DA
     ENDIF
     ;Sexec

;;; ( GAIN MEASUREMENT                             11:29 09/23/89 )
;;; : CALC-GAINS  0 fGERR ! 0 fNFg>Lim ! PRIME-LAMP-CONTROL           
	SETtestSIG  ( Set test mode)   
	CR ." Test Signals G0,G1,G2,G3 "                                
	@TEST[sig0] DUP >R DUP s0 ! DltaGains !                         
	@TEST[sig1] TYPEGAINS DUP R / EVALGAIN                          
	SCALE-GAIN DltaGains 4 + 2!                  ( Gc10)            
	@TEST[sig2] TYPEGAINS DUP R / EVALGAIN                          
	SCALE-GAIN DltaGains 4 + 2@ -4 10000 nF*/                       
	DltaGains 8 + 2!                            ( Gc100)            
	@TEST[sig3] TYPEGAINS DUP R> / EVALGAIN                         
	SCALE-GAIN DltaGains 8 + 2@ -4 10000 nF*/                       
	DltaGains 12 + 2!                          ( Gc1000)            
	SETnormalSIG                               ( Set normal mode)   
	-4 10000 DltaGains 2! DSPLYGc's   ( Set Gc0=1.0000 & display)   GAINTEST ;
454A
     $8A; Code
     "CALC-GAINS"; Name
     $452B; Backward Link
     COLON
     0refx
     $44A8
     !exec
     0refx
     $410E
     !exec
     $3EDE
     $438F
     CRexec
     $CAD3
     $19	; Msg Bytes
     "Test Signals G0,G1,G2,G3 "
     $43D2
     DUPexec; Duplicate Top of Stack
     $C3A7
     DUPexec; Duplicate Top of Stack
     $403D
     !exec
     $3FBF
     !exec
     $440A
     $4079
     DUPexec; Duplicate Top of Stack
     Rexec
     $D192
     $4505
     $3FD0
     $3FBF
     LITexec
     $0004
     +exec; Add Second on Stack To Top of Stack
     $D74E
     $4440
     $4079
     DUPexec; Duplicate Top of Stack
     Rexec
     $D192
     $4505
     $3FD0
     $3FBF
     LITexec
     $0004
     +exec; Add Second on Stack To Top of Stack
     $D735
     LITexec
     $FFFC
     LITexec
     $2710
     $E470
     $3FBF
     LITexec
     $0008
     +exec; Add Second on Stack To Top of Stack
     $D74E
     $4476
     $4079
     DUPexec; Duplicate Top of Stack
     $C3BD
     $D192
     $4505
     $3FD0
     $3FBF
     LITexec
     $0008
     +exec; Add Second on Stack To Top of Stack
     $D735
     LITexec
     $FFFC
     LITexec
     $2710
     $E470
     $3FBF
     LITexec
     $000C
     +exec; Add Second on Stack To Top of Stack
     $D74E
     $43AE
     LITexec
     $FFFC
     LITexec
     $2710
     $3FBF
     $D74E
     $3FF4
     $4536
     ;Sexec

;;; ( Check that gains OK) 
;;; ( SIGNAL/REFERENCE CHANNEL READ                10:46 10/25/89 ) 
;;; : GET[Sig] ( --n) SIGchan MUXset ! SET-ANALOG-Cntrl A/DCNVRT ;
	' GET[Sig] CFA 'GET[Sig] !                                      
461B
     $88; Code
     "GET[Sig]"; Name
     454A; Backward Link
     COLON
     $3BC6
     $2241
     !exec
     $3E33
     $3F56
     ;Sexec

;;; : GETAVE  0. 10 0 DO FIRE-LAMP GET[Sig] 0 D+                        
	?VIAL-OUT fABORT @ OR IF LEAVE ENDIF LOOP 10 D/ DROP ;
4634
     $86; Code
     "GETAVE"; Name
     $461B; Backward Link
     COLON
     LITexec
     $0000
     LITexec
     $0000
     LITexec
     $000A
     0refx
     (DO)exec
     $3D13
     $4626
     0refx
     $C419
     $3B2C
     $2227
     TOGGLEexec
     ORexec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0004; Branch Offset
     	$C393
     ENDIF
     (LOOP)exec
     $FFE8
     LITexec
     $000A
     $E018
     DROPexec; Delete Top of Stack
     ;Sexec

;;; : UPDATE-OFFSET SET[Offset] GETAVE SET[Normal] SIG[Offset] ! ;  
4673
     $8D; Code
     "UPDATE-OFFSET"; Name
     $4634; Backward Link
     COLON
     $3E91
     $463D
     $3EBD
     $3E54
     !exec
     ;Sexec

;;; : GET[Ref] ( --n) REFchan MUXset ! SET-ANALOG-Cntrl A/DCNVRT ;
4691
     $88; Code
     "GET[Ref]"; Name
     $4673; Backward Link
     COLON
     $3BB8
     $2241
     !exec
     $3E33
     $3F56
     ;Sexec

;;; : AGCGAIN PRIME-LAMP-CONTROL    ( Allow cntrl loop to stablize)     
	CR ." -AGC-  GAIN/SIG " 0 GAINvlu !                             
	BEGIN GAINvlu @ 10 * 1 MAX GAINvlu ! GET[Sig] DROP                    
	GETAVE UPDATE-OFFSET SIG[Offset] @ -                             
	." , " GAINvlu @ . ." / " DUP .                                 
	300 > GAINvlu @ 1000 >= OR                                      
	GAINexp @ GAINlimit @ >= OR fABORT @ OR UNTIL ;      
46AA
     $87; Code
     "AGCGAIN"; Name
     $4691; Backward Link
     COLON
     $3EDE
     CRexec
     $CAD3
     $10	; Msg Bytes
     "-AGC-  GAIN/SIG "
     0refx
     GAINvluexec
     !exec
     BEGIN
     	GAINvluexec
     	TOGGLEexec
     	LITexec
     	$000A
     	$D149
     	1refx
     	$C83F
     	GAINvluexec
     	!exec
     	$4626
     	DROPexec; Delete Top of Stack
     	$463D
     	$4683
     	$3E54
     	TOGGLEexec
     	$C776
     	$CAD3
     	$02;	Msg Bytes
     	", "
     	GAINvluexec
     	TOGGLEexec
     	$D6A0
     	$CAD3
     	$02;	Msg Bytes
     	"/ "
     	DUPexec; Duplicate Top of Stack
     	$D6A0
     	LITexec
     	$012C
     	$C7BD
     	GAINvluexec
     	TOGGLEexec
     	LITexec
     	$03E8
     	$D829
     	ORexec
     	$3B80
     	TOGGLEexec
     	$21D6
     	TOGGLEexec
     	$D829
     	ORexec
     	$2227
     	TOGGLEexec
     	ORexec
     OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     $FFA6; Branch Offset
     ;Sexec

;;; : SETGAIN  ( n -- ) 1 MAX GAINvlu ! SET-ANALOG-Cntrl ;
4731
     $87; Code
     "SETGAIN"; Name
     $46AA; Backward Link
     COLON
     1refx
     $C83F
     GAINvluexec
     !exec
     $3E33
     ;Sexec

;;; ( MIXED DIVIDE AND ROUND                       06:16 10/24/89 ) 
;;; DECIMAL
;;; 0 VARIABLE AVE[S/R] 8 ALLOT-RAM
4749
     $88; Code
     "AVE[S/R]"; Name
     $4731; Backward Link
     $C576
     $0F20

;;; 0 VARIABLE SIG[Ave] 8 ALLOT-RAM
4758
     $88; Code
     "SIG[Ave]"; Name
     $4749; Backward Link
     $C576
     $0F2A

;;; 0 VARIABLE REF[Ave] 8 ALLOT-RAM
4767
     $88; Code
     "REF[Ave]"; Name
     $4758; Backward Link
     $C576
     $0F34

;;; 0 VARIABLE SIG[Ave]/REF[Ave] 8 ALLOT-RAM
4776
     $91; Code
     "SIG[Ave]/REF[Ave]"; Name
     $4767; Backward Link
     $C576
     $0F3E

;;; : /RND ( d,n1 -- n2 rounded)
	DUP >R M/MOD DROP SWAP R> 2/ 1- > IF 1+ ENDIF ;
478E
     $84; Code
     "/RND; Name
     $4776; Backward Link
     COLON
     DUPexec; Duplicate Top of Stack
     $C3A7
     $D1D5
     DROPexec; Delete Top of Stack
     SWAPexec; Swap Top of Stack with Next on Stack
     $C3BD
     $D717
     $D6F7
     $C7BD
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0004; Branch Offset
     	$C71D
     ENDIF
     ;Sexec

;;; ( DATA QUES                                    0 17:23 05/10/81
;;; 100 CONSTANT QSIZ
47B1
     $84; Code
     "QSIZ" name
     $478E; Backward Link
     $C576
     $0064

;;; 0 VARIABLE SIGQUE QSIZ 2* ALLOT-RAM
47BC
     $86; Code
     "SIGQUE"; Name
     $47B1; Backward Link
     $C576
     $0F48

;;; 0 VARIABLE REFQUE QSIZ 2* ALLOT-RAM
47C9
     $86; Code
     "REFQUE"; Name
     $47BC; Backward Link
     $C576
     $1012

;;; 0 VARIABLE S/RQUE QSIZ 2* ALLOT-RAM
47D6
     $86; Code
     "S/RQUE"; Name
     $47C9; Backward Link
     $C576
     $10DC

;;; 0 VARIABLE #SMPLS
47E3
     $86; Code
     "#SMPLS"; Name
     $47D6; Backward Link
     $C576
     $11A6
 
;;; 0 VARIABLE #OUTLYERS
47F0
     $89; Code
     "#OUTLYERS"; Name
     $47E3; Backward Link
     $C576
     $11A8

;;; 0 VARIABLE SMPL#
4800
     $85; Code
     "SMPL#"; Name
     $47F0; Backward Link
     $C576
     $11AA
 
;;; 0 VARIABLE SMPLtotal
480C
     $89; Code
     "SMPLtotal" Name
     $4800; Backward Link
     $C576
     $11AC

;;; 0 VARIABLE SMPLNDX
481C
     $87; Code
     "SMPLNDX"; Name
     $480C; Backward Link
     $C576
     $11AE

;;; 0 VARIABLE NDXlimit
482A
     $88; Code
     "NDXlimit"; Name
     $481C; Backward Link
     $C576
     $11B0

;;; 0 VARIABLE f1stTEST
4839
     $88; Code
     "f1stTEST"; Name
     $482A; Backward Link
     $C576
     $11B2
 
;;; 0 VARIABLE ASMBLY
4848
     $86; Code
     "ASMBLY"; Name
     $4839; Backward Link
     $C576
     $11B4

;;; 0 VARIABLE #SMPLtbl 8 ALLOT-RAM
4855
     $88; Code
     "#SMPLtbl"; Name
     $4848; Backward Link
     $C576
     $11B6

;;; 0 VARIABLE #OUTLYRtbl 8 ALLOT-RAM
4864
     $8A; Code
     "#OUTLYRtbl"; Name
     $4855; Backward Link
     $C576
     $11C0

;;; HERE  2 ,  2 ,  2 ,  2 , CONSTANT #OUTLYRtbl0
4875
     $0002
     $0002
     $0002
     $0002
487D
     $8B; Code
     "#OUTLYRtbl0"; Name
     $4864; Backward Link
     $C576
     $4875

;;; HERE  8 ,  8 ,  8 ,  8 , CONSTANT #SMPLtbl0
488F
     $0008
     $0008
     $0008
     $0008

4897
     $89; Name
     "#SMPLtbl0"; Name
     $487D; Backward Link
     $C576
     $488F

;;; : INIT-FLTRTBLS 8 0 DO #SMPLtbl0 I + @ #SMPLtbl I + !
	#OUTLYRtbl0 I + @ #OUTLYRtbl I + ! 2 +LOOP ;
48A7
     $8D; Code
     "INIT-FLTRTBLS"; Name
     $4897; Backward Link
     COLON
     LITexec
     $0008
     0refx
     (DO)exec
     $48A3
     $C130
     +exec; Add Second on Stack To Top of Stack
     TOGGLEexec
     $4860
     $C130
     +exec; Add Second on Stack To Top of Stack
     !exec
     $488B
     $C130
     +exec; Add Second on Stack To Top of Stack
     TOGGLEexec
     $4871
     $C130
     +exec; Add Second on Stack To Top of Stack
     !exec
     $C5C9
     $C0DF
     $FFDC
     ;Sexec

;;; ( DATA READ                                    1 17:26 05/10/81 
;;; : SET-#SMPLS ( gain --) 2* #SMPLtbl + @ #SMPLS ! ;
48E9
     $8A; Code
     "SET-#SMPLS"; Name
     $48A7; Backward Link
     COLON
     $D709
     $4860
     +exec; Add Second on Stack To Top of Stack
     TOGGLEexec
     $47EC
     !exec
     ;Sexec

: SET-#OUTLYRS ( gain --) 2* #OUTLYRtbl + @ #OUTLYERS ! ;
4906
     $8C; Code
     "SET-#OUTLYRS"; Name
     $48E9; Backward Link
     COLON
     $D709
     $4871
     +exec; Add Second on Stack To Top of Stack
     TOGGLEexec
     $47FC
     !exec
     ;Sexec

;;; : INIT-MEASURE-CYCLE GAINexp @ DUP SET-#SMPLS SET-#OUTLYRS
	#SMPLS @ #OUTLYERS @ 2* +
	DUP SMPLtotal ! 2* NDXlimit ! 0 SMPL# ! 0 SMPLNDX ! ;
4925
     $92; Code
     "INIT-MEASURE-CYCLE"; Name
     $4906; Backward Link
     COLON
     $3B80
     TOGGLEexec
     DUPexec; Duplicate Top of Stack
     $48F6
     $4915
     $47EC
     TOGGLEexec
     $47FC
     TOGGLEexec
     $D709
     +exec; Add Second on Stack To Top of Stack
     DUPexec; Duplicate Top of Stack
     $4818
     !exec
     $D709
     $4835
     !exec
     0refx
     $4808
     !exec
     0refx
     $4826
     !exec
     ;Sexec

;;; ( PRIME-LAMP-CONTROL ;)
;;; : READ-SAMPLE 10000 ( Preload scaler) FIRE-LAMP 
	GET[Sig] SIG[Offset] @ - 1 MAX DUP SIGQUE SMPLNDX @ + !
	GET[Ref] 1 MAX DUP REFQUE SMPLNDX @ + !
	 */ S/RQUE SMPLNDX @ + ! 2 SMPLNDX +! ;
496C
     $8B; Code
     "READ-SAMPLE"; Name
     $4925; Backward Link
     COLON
     LITexec
     $2710
     $3D13
     $4626
     $3E54
     TOGGLEexec
     $C776
     1refx
     $C83F
     DUPexec; Duplicate Top of Stack
     $47C5
     $4826
     TOGGLEexec
     +exec; Add Second on Stack To Top of Stack
     !exec
     $469C
     1refx
     $C83F
     DUPexec; Duplicate Top of Stack
     $47D2
     $4826
     TOGGLEexec
     +exec; Add Second on Stack To Top of Stack
     !exec
     $D1C3
     $47DF
     $4826
     TOGGLEexec
     +exec; Add Second on Stack To Top of Stack
     !exec
     $C5C9
     $4826
     $C4B8
     ;Sexec

;;; : INIT-MEASURE-DATA 
	0. AVE[S/R] 2! 0. SIG[Ave] 2! 0. REF[Ave] 2!
	0. SIG[Ave]/REF[Ave] 2! ;
49C0
     $91; Code
     "INIT-MEASURE-DATA"; Name
     $496C; Backward Link
     COLON
     LITexec
     $0000
     LITexec
     $0000
     $4754
     $D74E
     LITexec
     $0000
     LITexec
     $0000
     $4763
     $D74E
     LITexec
     $0000
     LITexec
     $0000
     $4772
     $D74E
     LITexec
     $0000
     LITexec
     $0000
     $478A
     $D74E
     ;Sexec

;;; ( OUTLYER REJECT                               08:10 05/25/89 ) 
;;; 0 VARIABLE MAXSMPL
4A08
     $87; Code
     "MAXSMPL"; Name
     $49C0; Backward Link
     $C576
     $11CA

;;; 0 VARIABLE MAXNDX
4A16
     $86; Code
     "MAXNDX"; Name
     $4A08; Backward Link
     $C576
     $11CC

;;; 0 VARIABLE MINSMPL
4A23
     $87; Code
     "0 VARIABLE MINSMPL"; Name
     $4A16; Backward Link
     $C576
     $11CE

;;; 0 VARIABLE MINNDX
4A31
     $86; Code
     "MINNDX"; Name
     $4A23; Backward Link
     $C576
     $11D0

;;; : CHK-MIN/MAX ( n,I --) >R 
	DUP MAXSMPL @ > IF DUP MAXSMPL ! R MAXNDX ! ENDIF
	DUP MINSMPL @ < MAXNDX @ R <> AND
	 IF DUP MINSMPL ! R MINNDX ! ENDIF
	R> 2DROP ;
4A3E
     $8B; Code
     "CHK-MIN/MAX"; Name
     $4A31; Backward Link
     COLON
     $C3A7
     DUPexec; Duplicate Top of Stack
     $4A12
     TOGGLEexec
     $C7BD
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $000E; Branch Offset
     	DUPexec; Duplicate Top of Stack
     	$4A12
     	!exec
     	$C3D0
     	$4A1F
     	!exec
     ENDIF
     DUPexec; Duplicate Top of Stack
     $4A2D
     TOGGLEexec
     <exec
     $4A1F
     TOGGLEexec
     $C3D0
     $D7EE
     ANDexec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $000E; Branch Offset
     	DUPexec; Duplicate Top of Stack
     	$4A2D
     	!exec
     	$C3D0
     	$4A3A
     	!exec
     ENDIF
     $C3BD
     $D7B8
     ;Sexec

;;; ( OUTLYER REJECT                               16:10 10/23/89 ) 
;;; ( Each pass through REJECT-OUTLYER marks the data point with    
;;; ( the highest S/R for reject by writing -1 for the S/R value,   
;;; ( the lowest S/R for reject by writing -2 for the S/R value     
;;; : REJECT-OUTLYER 0 MAXSMPL ! 32767 MINSMPL !
	 -1 MAXNDX ! -1 MINNDX ! #OUTLYERS @ 0>
	IF NDXlimit @ 0
	DO S/RQUE I + @ DUP 0>=
	IF I ( n,I--) CHK-MIN/MAX ELSE DROP ENDIF 
	2 +LOOP
	MAXNDX @ DUP 0>= OVER NDXlimit @ < AND
	IF S/RQUE + -1 SWAP ! ELSE DROP ENDIF
	MINNDX @ DUP 0>= OVER NDXlimit @ < AND
	IF S/RQUE + -2 SWAP ! ELSE DROP ENDIF
	ENDIF ; 
4A90
     $8E; Code
     "REJECT-OUTLYER"; Name
     $4A3E; Backward Link
     COLON
     0refx
     $4A12
     !exec
     LITexec
     $7FFF
     $4A2D
     !exec
     LITexec
     $FFFF
     $4A1F
     !exec
     LITexec
     $FFFF
     $4A3A
     !exec
     $47FC
     TOGGLEexec
     $D844
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $007A; Branch Offset
     	$4835
     	TOGGLEexec
     	0refx
     	(DO)exec
     	$47DF
    	$C130
     	+exec; Add Second on Stack To Top of Stack
     	TOGGLEexec
     	DUPexec; Duplicate Top of Stack
     	$DF6E
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$000A; Branch Offset
     		$C130
     		$4A4C
     		$C096
     		$0004
     	ENDIF
     	DROPexec; Delete Top of Stack
     	$C5C9
     	$C0DF
     	$FFE2
     	$4A1F
     	TOGGLEexec
     	DUPexec; Duplicate Top of Stack
     	$DF6E
     	OVERexec; Duplicate Second Item at Top of Stack
     	$4835
     	TOGGLEexec
     	<exec
     	ANDexec
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0012; Branch Offset
     		$47DF
     		+exec; Add Second on Stack To Top of Stack
     		LITexec
     		$FFFF
     		SWAPexec; Swap Top of Stack with Next on Stack
     		!exec
     		$C096
     		$0004
     	ENDIF
     	DROPexec; Delete Top of Stack
     	$4A3A
     	TOGGLEexec
     	DUPexec; Duplicate Top of Stack
     	$DF6E
     	OVERexec; Duplicate Second Item at Top of Stack
     	$4835
     	TOGGLEexec
     	<exec
     	ANDexec
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0012; Branch Offset
     		$47DF
     		+exec; Add Second on Stack To Top of Stack
     		LITexec
     		$FFFE
     		SWAPexec; Swap Top of Stack with Next on Stack
     		!exec
     		$C096
     		$0004
     	ENDIF
     	DROPexec; Delete Top of Stack
     ENDIF
     ;Sexec

;;; : REJECT-OUTLYERS #OUTLYERS @ 0 DO REJECT-OUTLYER LOOP ;
4B45
     $8F; Code
     "REJECT-OUTLYERS"; Name
     $4A90; Backward Link
     COLON
     $47FC
     TOGGLEexec
     0refx
     (DO)exec
     $4AA1
     (LOOP)exec
     $FFFC
     ;Sexec

;;; ( AVERAGE RATIO CALCULATION                    06:29 10/24/89 ) 

;;; 0 VARIABLE %DIF 
4B69
     $84; Code
     "%DIF"; Name
     $4B45; Backward Link
     $C576
     $11D2

;;; 0 VARIABLE S/Rjst
4B74
     $86; Code
     "S/Rjst"; Name
     $4B69; Backward Link
     $C576
     $11D4

;;; : SHFTDATA 
	AVE[S/R] 2@ [ AVE[S/R] 4 + ] LITERAL 2! 
	 SIG[Ave] 2@ [ SIG[Ave] 4 + ] LITERAL 2!
	 REF[Ave] 2@ [ REF[Ave] 4 + ] LITERAL 2!
	SIG[Ave]/REF[Ave] 2@ [ SIG[Ave]/REF[Ave] 4 + ] LITERAL 2! ;
4B81
     $88; Code
     "SHFTDATA"; Name
     $4B74; Backward Link
     COLON
     $4754
     $D735
     LITexec
     $0F24
     $D74E
     $4763
     $D735
     LITexec
     $0F2E
     $D74E
     $4772
     $D735
     LITexec
     $0F38
     $D74E
     $478A
     $D735
     LITexec
     $0F42
     $D74E
     ;Sexec

;;; : @AVE[S/R] ( - J,n) GAINexp @ MINUS AVE[S/R] @ EXIT
	0 [ AVE[S/R] 4 + ] LITERAL @ 0 D+ 2 D/ 0 S/Rjst !
	10 0 DO 2DUP 32767. D>
	IF 1 S/Rjst +! 10 D/ ELSE LEAVE ENDIF LOOP
	DROP GAINexp @ S/Rjst @ + MINUS SWAP ;
4BB8
     $89; Code
     "@AVE[S/R]"; Name
     $4B81; Backward Link
     COLON
     $3B80
     TOGGLEexec
     $C438
     $4754
     TOGGLEexec
     $D6BB
     0refx
     LITexec
     $0F24
     TOGGLEexec
     0refx
     $C419
     $C5C9
     $E018
     0refx
     $4B7D
     !exec
     LITexec
     $000A
     0refx
     (DO)exec
     $D7C8
     LITexec
     $7FFF
     LITexec
     $0000
     $DFB8
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0012; Branch Offset
     	1refx
     	$4B7D
     	$C4B8
     	LITexec
     	$000A
     	$E018
     	$C096
     	$0004
     ENDIF
     $C393
     (LOOP)exec
     $FFDC
     DROPexec; Delete Top of Stack
     $3B80
     TOGGLEexec
     $4B7D
     TOGGLEexec
     +exec; Add Second on Stack To Top of Stack
     $C438
     SWAPexec; Swap Top of Stack with Next on Stack
     ;Sexec

;;; : ?DATA-STABLE ( -- f     Difference < 5%? of AVE or .0015 ABS)
	AVE[S/R] @ [ AVE[S/R] 4 + ] LITERAL @ 2DUP + 2/ >R
	- ABS DUP 15 < SWAP 10000 R> */ DUP %DIF ! 500 < OR ;
4C28
     $8C; Code
     "?DATA-STABLE"; Name
     $4BB8; Backward Link
     COLON
     $4754
     TOGGLEexec
     LITexec
     $0F24
     TOGGLEexec
     $D7C8
     +exec; Add Second on Stack To Top of Stack
     $D717
     $C3A7
     $C776
     $D1F1
     DUPexec; Duplicate Top of Stack
     LITexec
     $000F
     <exec
     SWAPexec; Swap Top of Stack with Next on Stack
     LITexec
     $2710
     $C3BD
     $D1C3
     DUPexec; Duplicate Top of Stack
     $4B70
     !exec
     LITexec
     $01F4
     <exec
     ORexec
     ;Sexec

;;; 0 VARIABLE SIGok
4C71
     $85; code
     "SIGok"; Name
     $4C28; Backward Link
     $C576
     $11D6

;;; 0 VARIABLE REFok
4C7D
     $85; Code
     "REFok"; Name
     $4C71; Backward Link
     $C576
     $11D8

;;; 0 VARIABLE #BADPNTS
4C89
     $88; Code
     "#BADPNTS"; Name
     $4C7D; Backward Link
     $C576
     $11DA

;;; : AVE-DATA ( -- d =sum S/R) 0 #BADPNTS ! 0. NDXlimit @ 0 
	DO S/RQUE I + @ DUP 0< 0=
	IF SIGQUE I + @ DUP SIG[Offset] @ +
	4085 > DUP IF 0 SIGok ! ENDIF ( n1,n2,f 
	 REFQUE I + @ 4085 OVER < OVER 1000 < OR ( n1,n2,f,n3,f2
	DUP IF 0 REFok ! ENDIF ROT OR 0= 
	IF 0 REF[Ave] 2@ D+ REF[Ave] 2! 
	0 SIG[Ave] 2@ D+ SIG[Ave] 2!
	0 D+
	ELSE 2DROP DROP -3 S/RQUE I + ! -1 #BADPNTS +!
	ENDIF
	ELSE DROP ENDIF
	2 +LOOP ;
4C98
     $88; Code
     "AVE-DATA"; Name
     $4C89; Backward Link
     COLON
     0refx
     $4C94
     !exec
     LITexec
     $0000
     LITexec
     $0000
     $4835
     TOGGLEexec
     0refx
     (DO)exec
     $47DF
     $C130
     +exec; Add Second on Stack To Top of Stack
     TOGGLEexec
     DUPexec; Duplicate Top of Stack
     $C3F1
     0=exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0090; Branch Offset
     	$47C5
     	$C130
     	+exec; Add Second on Stack To Top of Stack
     	TOGGLEexec
     	DUPexec; Duplicate Top of Stack
     	$3E54
     	TOGGLEexec
     	+exec; Add Second on Stack To Top of Stack
     	LITexec
     	$0FF5
     	$C7BD
     	DUPexec; Duplicate Top of Stack
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0008; Branch Offset
	     	0refx
     		$4C79
     		!exec
     	ENDIF
     	$47D2
     	$C130
     	+exec; Add Second on Stack To Top of Stack
     	TOGGLEexec
     	LITexec
     	$0FF5
     	OVERexec; Duplicate Second Item at Top of Stack
     	<exec
     	OVERexec; Duplicate Second Item at Top of Stack
     	LITexec
     	$03E8
     	<exec
     	ORexec
     	DUPexec; Duplicate Top of Stack
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0008; Branch Offset
     		0refx
     		$4C85
     		!exec
     	ENDIF
     	$C805
     	ORexec
     	0=exec
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0022; Branch Offset
     		0refx
     		$4772
     		$D735
     		$C419
     		$4772
     		$D74E
     		0refx
     		$4763
     		$D735
     		$C419
     		$4763
     		$D74E
     		0refx
     		$C419
     		$C096
     		$001A
     	ENDIF
     	$D7B8
     	DROPexec; Delete Top of Stack
     	LITexec
     	$FFFD
     	$47DF
     	$C130
     	+exec; Add Second on Stack To Top of Stack
     	!exec
     	LITexec
     	$FFFF
     	$4C94
     	$C4B8
     	$C096
     	$0004
     ENDIF
     DROPexec; Delete Top of Stack
     $C5C9
     $C0DF
     $FF5A
     ;Sexec

;;; (AVERAGE RATIO CALCULATION                    06:29 10/24/89 )
;;; ( CALC[AveS/R] calculates the averages of sig/ref, sig, & ref.  
;;; ( In the process it rejects saturated sig points and points     
;;; ( where the ref is saturated or too low  
;;; : CALC[AveS/R] ( -- n   n = 0->10000 = 0.0->1.0000 )
	0. SIG[Ave] 2! 0. REF[Ave] 2! -1 SIGok ! -1 REFok !
	AVE-DATA                                  ( Rtn with SUM S/R)
	 #SMPLS @ #BADPNTS @ + 1 MAX DUP >R /RND DUP AVE[S/R] !
	10000 SIG[Ave] 2@ R /RND DUP SIG[Ave] !
	REF[Ave] 2@ R> /RND DUP REF[Ave] !
	 */ DUP 0< IF DROP 32000 ENDIF SIG[Ave]/REF[Ave] !
	 #SMPLS @ #BADPNTS @ ABS 1 MAX / 1 >
	IF -1 SIGok ! -1 REFok ! ENDIF ;
4D65
     $8C; Code
     "CALC[AveS/R]; Name
     $4C98; Backward Link
     COLON
     LITexec
     $0000
     LITexec
     $0000
     $4763
     $D74E
     LITexec
     $0000
     LITexec
     $0000
     $4772
     $D74E
     LITexec
     $FFFF
     $4C79
     !exec
     LITexec
     $FFFF
     $4C85
     !exec
     $4CA3
     $47EC
     TOGGLEexec
     $4C94
     TOGGLEexec
     +exec; Add Second on Stack To Top of Stack
     1refx
     $C83F
     DUPexec; Duplicate Top of Stack
     $C3A7
     $4795
     DUPexec; Duplicate Top of Stack 
     $4754
     !exec
     LITexec
     $2710
     $4763
     $D735
     Rexec
     $4795
     DUPexec; Duplicate Top of Stack
     $4763
     !exec
     $4772
     $D735
     R>exec
     $4795
     DUPexec; Duplicate Top of Stack
     $4772
     !exec
     $D1C3
     DUPexec; Duplicate Top of Stack
     0<exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0008; Branch Offset
     	DROPexec; Delete Top of Stack
     	LITexec
     	$7D00
     ENDIF
     $478A
     !exec
     $47EC
     TOGGLEexec
     $4C94
     TOGGLEexec
     $D1F1
     1refx
     $C83F
     $D192
     1refx
     $C7BD
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0012; Branch Offset
     	LITexec
     	$FFFF
     	$4C79
     	!exec
     	LITexec
     	$FFFF
     	$4C85
     	!exec
     ENDIF
     ;Sexec

;;; ( DATA DISPLAY                                 11:44 05/25/89 )

;;; 0 VARIABLE f-
4E18
    $82; Code
     "f-"; Name
     $4D65; Backward Link
f-refx:
4E1D $C576; Processing Routine Token
     $11DC; Var Addr

;;; 0 VARIABLE DTALINE
4E21
     $87; Code
     "DTALINE"; Name
     $4E18; Backward Link
     $C576; Processing Routine Token
     $11DE; Var Addr

;;; : TYPEdata DUP 0< MINUS f- ! ABS 0 <# #S #> 6 OVER - f- @ +
;;;	0 DO 32 EMIT LOOP f- @ IF 45 ( -) EMIT ENDIF TYPE ;
4E2F
     $88; Code
     "TYPEdata"; Name
     $4E21; Backward Link
     COLON
     DUPexec; Duplicate Top of Stack
     0<exec
     MINUSexec
     f-refx
     !exec
     $D1F1
     0refx
     $D5E1
     $D646
     $D5F0
     LITexec
     $0006
     OVERexec; Duplicate Second Item at Top of Stack
     -exec; Subtract Top of Stack From Second on Stack
     f-refx
     TOGGLEexec
     +exec; Add Second on Stack To Top of Stack
     0refx
     (DO)exec
     LITexec
     $0020
     EMITexec
     (LOOP)exec
     $FFF8
     f-refx
     TOGGLEexec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0008; Branch Offset
     	LITexec
     	$002D
     	EMITexec
     ENDIF
     $CA72
     ;Sexec

;;; : DISPLAY-QUES NDXlimit @ 0
	DO CR CR  ." Sig " I 20 + NDXlimit @ MIN I
	DO SIGQUE I + @ TYPEdata 2 +LOOP
	CR  ." Ref " I 20 + NDXlimit @ MIN I
	DO REFQUE I + @ TYPEdata 2 +LOOP
	CR  ." S/R " I 20 + NDXlimit @ MIN I
	DO S/RQUE I + @ TYPEdata 2 +LOOP
	20 +LOOP ;
4E7E
     $8C; Code
     "DISPLAY-QUES"; Name
     $4E2F; Backward Link
     COLON
     $4835
     TOGGLEexec
     0refx
     (DO)exec
     CRexec
     CRexec
     $CAD3
     $04	; Msg bytes
     "Sig "
     $C130
     LITexec
     $0014
     +exec; Add Second on Stack To Top of Stack
     $4835
     TOGGLEexec
     $C827
     $C130
     (DO)exec
     $47C5
     $C130
     +exec; Add Second on Stack To Top of Stack
     TOGGLEexec
     $4E3A
     $C5C9
     $C0DF
     $FFF2
     CRexec
     $CAD3
     $04	; Msg Bytes
     "Ref "
     $C130
     LITexec
     $0014
     +exec; Add Second on Stack To Top of Stack
     $4835
     TOGGLEexec
     $C827
     $C130
     (DO)exec
     $47D2
     $C130
     +exec; Add Second on Stack To Top of Stack
     TOGGLEexec
     $4E3A
     $C5C9
     $C0DF
     $FFF2
     CRexec
     $CAD3
     $04	; Msg Bytes
     "S/R "
     $C130
     LITexec
     $0014
     +exec; Add Second on Stack To Top of Stack
     $4835
     TOGGLEexec
     $C827
     $C130
     (DO)exec
     $47DF
     $C130
     +exec; Add Second on Stack To Top of Stack
     TOGGLEexec
     $4E3A
     $C5C9
     $C0DF
     $FFF2
     LITexec
     $0014
     $C0DF
     $FF77
     ;Sexec

;;; : DISPLAY-DATA                                                   
( If flag not set exit, flag is set/cleared in TEST mode)
	 fDSPLY @ 0= IF EXIT ENDIF
	DISPLAY-QUES
	CR
	." GAIN=" GAINvlu @ .
	."  AVE[S/R]=" AVE[S/R] @ .
	."  %DLTA=" %DIF @ 0 <# # # 46 HOLD #S #> TYPE
	."  BLANK[S/R]=" GAINexp @ 4 * BLANKdata + @ .
	CR
	." AVE[Sig]=" SIG[Ave] @ . 
	."  AVE[Ref]=" REF[Ave] @ . CR CR ;
4F24
     $8C; Code
     "DISPLAY-DATA"; Name
     $4E7E; Backward Link
     COLON
     $226A
     TOGGLEexec
     0=exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0004; Branch Offset
     	$D6BB
     ENDIF
     $4E8D
     CRexec
     $CAD3
     $05	; Msg Bytes
     "GAIN="
     GAINvluexec
     TOGGLEexec
     $D6A0
     $CAD3
     $0A	; Msg Bytes
     "AVE[S/R]=GT"
     TOGGLEexec
     $D6A0
     $CAD3
     $07	; Msg Bytes
     " %DLTA="
     $4B70
     TOGGLEexec
     0refx
     $D5E1
     $D61E
     $D61E
     LITexec
     $002E
     HOLDexec
     $D646
     $D5F0
     $CA72
     $CAD3
     $0C	; Msg Bytes
     $3B80
     TOGGLEexec
     LITexec
     $0004
     $D149
     $21E6
     +exec; Add Second on Stack To Top of Stack
     TOGGLEexec
     $D6A0
     CRexec
     $CAD3
     $09	; Msg Bytes
     "AVE[Sig]="
     $4763
     TOGGLEexec
     $D6A0
     $CAD3
     "<LF> AVE[Ref]="
     $4772
     TOGGLEexec
     $D6A0
     CRexec
     CRexec
     ;Sexec

;;; ( SELF TEST                                    06:52 10/22/89 )

;;; DECIMAL
                                                         
;;; : TSTMSG "BLANK DISPLAY2 w-TYPE 1 DISPLAY2 wx-TYPE ;
4FD6
     $86; Code
     "TSTMSG"; Name
     $4F24; Backward Link
     COLON
     $2598
     $F4CB
     $F51E
     1refx
     $F4CB
     $F530
     ;Sexec

;;; : STOP "STOPED DISPLAY1 w-TYPE 
	-1 CALflg ! SET-TESTrtn  ( Disable RECAL key & force rtn here)
	BKliteON BEGIN ?BKliteOFF UPDATEkeyQ 0 UNTIL ;
4FEF
     $84; Code
     "STOP"; Name
     $4FD6; Backward Link
     COLON
     $26D5
     $F4BC
     $F51E
     LITexec
     $FFFF
     $2201
     !exec
     $22BF
     $F142
     BEGIN
     	$F18D
     	$32A3
     	0refx
     OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     $FFF8; Branch Offset
     ;Sexec

;;; : PASSED "PASED 6 19 DISPLAY2 wx-TYPE 1000 DELAY[ms] ;
5016
     $86; Code
     ""; Name
     $4FEF; Backward Link
     COLON
     $26C0
     LITexec
     $0006
     LITexec
     $0013
     $F4CB
     $F530
     LITexec
     $03E8
     $E683
     ;Sexec

;;; : FAIL "FAIL 4 21 DISPLAY2 wx-TYPE STOP ;
5037
     $84; Code
     "FAIL"; Name
     ;5016; Backward Link
     COLON
     $26AE
     LITexec
     $0004
     LITexec
     $0015
     $F4CB
     $F530
     $4FF6
     ;Sexec

( SELF TEST RAM CHECK                          06:38 02/27/90 ) 
( CKRAM chks between specified limits 2 bytes at a time using   
( bit patterns 55AA & AA55. If error occurs, save X, A, &B      
( Restore origional byte data after check done                  
( On exit, ACCA=FF bytes ok, ACCA=0 read/write problem          
( Skip checking RAM in adr range [S0-32] to S0

;;; HEX

;;; 0 VARAIBLE XPNTR
5052
     $85; Code
     "XPNTR"; Name
     $5037; Backward Link
     GetVar; Processing Routine Token
     XPNTR; Var Addr

;;; 0 VARIABLE Xrd
505E
     $83; Code
     "Xrd"; Name
     $5052; Backward Link
     GetVar; Processing Routine Token
     Xrd; Var Addr

;;; 0 VARIABLE Xwrt
5068 $84; Code
     "Xwrt"; Name
     $505E; Backward Link
     GetVar; Processing Routine Token
     Xwrt; Var Addr

;;; CODE

;;; ERRxab
5073 $86; Code
     "ERRxab" ; Name
     $5068; Backward Link
     $507E

507E   ERRxab:  STA A   Xwrt   
5081            STA B   $11E5   
5084            PUL A
5085            STA A   XPNTR   
5088            PUL A
5089            STA A   XPNTR+1   
508C            PUL A
508D            CLR A
508E            PSH A
508F            LDA A   XPNTR+1   
5092            PSH A
5093            LDA A   XPNTR   
5096            PSH A
5097            STX     XPNTR   
509A            LDA A   $00,X
509C            STA A   Xrd   
509F            LDA A   $01,X
50A1            STA A   $11E3   
50A4            CLR A
50A5            RTS  

;;: CODE WORDchk
50A6
     $87
     "WORDchk"
     $5073; Backward Link
     $50B2

50B2   WORDchk: CPX     #$0410
50B5            BNE     L_50BD   
50B7            LDX     #$0430
50BA            LDA A   #$FF
50BC            RTS
 
50BD   L_50BD   LDA A   $00,X
50BF            LDA B   $01,X
50C1            PSH B
50C2            PSH A
50C3            LDA A   #$FF
50C5            PSH A
50C6            LDA A   #$55
50C8            LDA B   #$AA
50CA            STA A   $00,X
50CC            STA B   $01,X
50CE            CMP A   $00,X
50D0            BEQ     L_50D5   
50D2            JSR     ERRxab   
50D5   L_50D5   TST A
50D6            BEQ     L_50DF   
50D8            CMP B   $01,X
50DA            BEQ     L_50DF   
50DC            JSR     ERRxab   
50DF   L_50DF   TST A
50E0            BEQ     L_50EA   
50E2            LDA A   #$AA
50E4            LDA B   #$55
50E6            STA A   $00,X
50E8            STA B   $01,X
50EA   L_50EA   TST A
50EB            BEQ     L_50F4   
50ED            CMP A   $00,X
50EF            BEQ     L_50F4   
50F1            JSR     ERRxab   
50F4   L_50F4   TST A
50F5            BEQ     L_50FE   
50F7            CMP B   $01,X
50F9            BEQ     L_50FE   
50FB            JSR     ERRxab   
50FE   L_50FE   PUL A
50FF            PUL B
5100            STA B   $00,X
5102            PUL B
5103            STA B   $01,X
5105            RTS

5106   L_5106   JMP     NEXT

;;; FORTH
  
;;; 2000 CONSTANT RAMEND
5109
     $85; Code
     "RAMEND"; Name
     $50A6; Backward Link
     GetVar; Processing Routine Token
     $2000; Constant value

;;; 0000 CONSTANT RMSTRT
5115
     $86; Code
     "RMSTRT"; Name
     $5109; Backward Link
     GetVar; Processing Routine Token
     $0000

;;; CODE

;;; CLR-RAM
5122
     $87; Code
     "CLR-RAM"
     $5115; Backward Link
512C $512E

512E   CLR-RAM: LDX     #$0DDC
5131   L_5131   CLR     $00,X
5133            INX  
5134            CPX     #RAMEND
5137            BNE     L_5131   
5139            JMP     NEXT   

;;; CHKRAM
513C
     $85; Code
     "CHKRAM"; Name
     $5122; Backward Link
5144 $5146

5146   CHKRAM:  LDA A   #$FF
5148            STA A   fNMIOFF; Disable NMI   
514B            LDX     #$0000
514E            LDA A   #$FF
5150            PSH A
5151            PSH A
5152   L_5152   JSR     WORDchk   
5155            TST A
5156            BNE     L_515F   
5158            TSX  
5159            CLR     $00,X
515B            CLR     $01,X
515D            BRA     L_5167  
515F   L_515F   INX  
5160            INX  
5161            CPX     #RAMEND
5164            BNE     L_5167   
5166            CLR A
5167   L_5167   TST A
5168            BNE     L_5152   
516A            CLR     fNMIOFF; Enable printer NMI routine  
516D            JMP     NEXT

;;; DECIMAL

;;; FORTH

; Analog Gain Check

;;; 0 VARIABLE fFAIL
5170
     $85; Code
     "fFAIL"; Name
     $513C; Backward Link
5178 GetVar; Processing Routine Token
     fFAIL; Var Addr

;;; : LMPCHK
	16 #PRIMES ! PRIME-LAMP-CONTROL 50 'TrigDly @ ! 0 #LMPERR !
	0. 10 0 DO 'FIRE-TEST @ EXECUTE GET[Ref] 0 D+
	fLMPERR @ IF 1 #LMPERR +! ENDIF LOOP ;
517C
     $86; Code
     "LMPCHK"; Name
     $5170; Backward Link
     COLON
     LITexec
     $0010
     #PRIMES
     !exec
     $3EDE
     LITexec
     $0032
     $24CD
     TOGGLEexec
     !exec
     0refx
     $3C6F
     !exec
     LITexec
     $0000
     LITexec
     $0000
     LITexec
     $000A
     0refx
     (DO)exec
     $24E0
     TOGGLEexec
     execECUTEexec
     $469C
     0refx
     $C419
     $3C26
     TOGGLEexec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0008
     	1refx
     	$3C6F
     	$C4B8
     ENDIF
     (LOOP)exec
     $FFE4
     ;Sexec

;;; : SELFTEST 0 fABORT ! 0 #LMPERR ! CHK-DSPLS 3 DELAY[sec]
51D1
     $88
     "SELFTEST"; Name
     $517C
     COLON
     0refx
     $2227
     !exec
     0refx
     $3C6F
     !exec
     $F66B
     3refx
     $E6A8
     $2572
     $F4BC
     $F51E
     $260E
     $F4CB
     $F51E
     2refx
     $E6A8
     $2635
     $FACE
     $4FDF
     $23F5
     TOGGLEexec
     EXECUTEexec
     $C71D
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0008; Branch Offset
     	$503E
     	BRANCHexec
     	$0004
     ENDIF
     $501F
     $264E
     $FACE
     $4FDF
     $240B
     TOGGLEexec
     EXECUTEexec
     $C71D
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0008; Branch Offset
     	$503E
     	BRANCHexec
     	$0004
     ENDIF
     $501F
     $512C
     $2666
     $FACE
     $4FDF
     $5144
     0=exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0008; Branch Offset
     	$503E
     	BRANCHexec
     	$0004
     ENDIF
     $501F
     $267E
     LITexec
     $000A
     $4FDF
     $5185
     $D7C8
     CRexec
     $CAD3
     $04	; Msg Bytes
     "REF="
     LITexec
     $000A
     $E018
     $D692
     LITexec
     $03E8
     LITexec
     $0000
     $DFA5
     $3C6F
     TOGGLEexec
     DUPexec; Duplicate Top of Stack
     $CAD3
     $0E	; Msg Bytes
     "LAMP FAILURES="
     $D6A0
     LITexec
     $0005
     $C7BD
     ORexec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0008; Branch Offset
     	$503E
     	BRANCHexec
     	$0004
     ENDIF
     $501F
     ;Sexec

;;; :FXCLOCK
52A2
     $87; Code
     "FXCLOCK"; Name
     $51D1; Backward Link
     COLON
     ;Sexec

;;; 6010 CONSTANT DTAREQI/O
52B0
     $89; Code
     "DTAREQI/O"; Name
     $52A2; Backward Link
     $C576; Processing Routine
     $6010; Constant value

;;; 6011 CONSTANT DTAREGI/O
52C0
     $89; CODE
     "DTAREGI/O"; Name
     $52B0; Backward Link
     $C576; Processing Routine
     $6011; Constant value

;;; 00 CONSTANT RTCsec
52D0
     $86; CODE
     "RTCsec"; Name
     $52C0; Backward Link
     $C576; Processing Routine
     $0000; Constant value

;;; 02 CONSTANT RTCmin
52DD
     $86; CODE
     "RTCmin"; Name
     $52D0; Backward Link
     $C576; Processing Routine
     $0002; Constant value

;;; 04 CONSTANT RTChrs
52EA
     $86; CODE
     "RTChrs"; Name
     $52DD; Backward Link
     $C576; Processing Routine
     $0004; Constant value

;;; 07 CONSTANT RTCday
52F7
     $86; CODE
     "RTCday"; Name
     $52EA; Backward Link
     $C576; Processing Routine
     $0007; Constant value

;;; 08 CONSTANT RTCmonth
5304
     $86; CODE
     "RTCmonth"; Name
     $52F7; Backward Link
     $C576; Processing Routine
     $0008; Constant value

;;; 09 CONSTANT RTCyr
5313
     $85; CODE
     "RTCyr"; Name
     $5304; Backward Link
     $C576; Processing Routine
     $0009; Constant value

;;; 0A CONSTANT UIPreg
531F
     $86; CODE
     "UIPreg"; Name
     $5313; Backward Link
     $C576; Processing Routine
     $000A; Constant value

;;; 80 CONSTANT UIPbit
532C
     $86; CODE
     "UIPbit"; Name
     $531F; Backward Link
     $C576; Processing Routine
     $0080; Constant value

;;; 0B CONSTANT CLKset
5339
     $86; CODE
     "CLKset"; Name
     $532C; Backward Link
     $C576; Processing Routine
     $000B; Constant value

;;; 80 CONSTANT SETbit
5346
     $86; CODE
     "SETbit"; Name
     $5339; Backward Link
     $C576; Processing Routine
     $0080; Constant value

;;; 0A CONSTANT REGA
5353
     $84; CODE
     "REGA"; Name
     $5346; Backward Link
     $C576; Processing Routine
     $000A; Constant value

;;; 0B CONSTANT REGB
535E
     $84; CODE
     "REGB"; Name
     $5353; Backward Link
     $C576; Processing Routine
     $000B; Constant value

;;; 0C CONSTANT REGC
5369
     $84; CODE
     "REGC"; Name
     $535E; Backward Link
     $C576; Processing Routine
     $000C; Constant value

;;; 0D CONSTANT REGD
5374
     $84; CODE
     "REGD"; Name
     $5369; Backward Link
     $C576; Processing Routine
     $000D; Constant value

;;; 23 CONSTANT Ainit
537F
     $85; CODE
     "Ainit"; Name
     $5374; Backward Link
     $C576; Processing Routine
     $0023; Constant value

;;; 0C CONSTANT Binit
538B
     $85; CODE
     "Binit"; Name
     $537F; Backward Link
     $C576; Processing Routine
     $000C; Constant value

;;; 0E CONSTANT DAY0
5397
     $84; CODE
     "DAY0"; Name
     $538B; Backward Link
     $C576; Processing Routine
     $000E; Constant value

;;; 80 CONSTANT VTRbit
53A2
     $86; CODE
     "VTRbit"; Name
     $5397; Backward Link
     $C576; Processing Routine
     $0080; Constant value

;;; 0F CONSTANT MSBSMPL#
53AF
     $88; CODE
     "MSBSMPL#"; Name
     $53A2; Backward Link
     $C576; Processing Routine
     $000F; Constant value

;;; 10 CONSTANT LSBSMPL#
53BE
     $88; CODE
     "LSBSMPL#"; Name
     $53AF; Backward Link
     $C576; Processing Routine
     $0010; Constant value

;;; 3D CONSTANT RUNDLY#
53CD
     $87; CODE
     "RUNDLY#"; Name
     $53BE; Backward Link
     $C576; Processing Routine
     $003D; Constant value

;;; 3F CONSTANT TSTBYTE#
53DB
     $88; CODE
     "TSTBYTE#"; Name
     $53CD; Backward Link
     $C576; Processing Routine
     $003F; Constant value

;;; DECIMAL

;;; 0 VARIABLE TMPhrs
53EA
     $86; CODE
     "TMPhrs"; Name
     $53DB; Backward Link
     $C576; Processing Routine
     $11E8; Var Addr

;;; 0 VARIABLE CLKERRcnt
53F7
     $89; CODE
     "CLKERRcnt"; Name
     $53EA; Backward Link
     $C576; Processing Routine
     $11EA; Var Addr

;;; 0 VARIABLE fPM
5407
     $83; CODE
     "fPM"; Name
     $53F7; Backward Link
     $C576; Processing Routine
     $11EC; Var Addr

;;; ?CLKerr 1 CLKERRcnt +! CLKERRcnt @ 1000 >
       IF CR."CLOCK DATA RDY ERROR" QUIT ENDIF;
5411
     $87; Code
     "?CLKerr"; Name
     $5407; Backward Link
     COLON
     1refx
     $5403
     $C4B8
     $5403
     TOGGLEexec
     LITexec
     $03E8
     $C7BD
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $001D; Branch Offset; *** check this offset ***
     	CRexec
     	$CAD3
     	$14	; Msg Bytes
     	"CLOCK DATA RDY ERROR"
     ENDIF
     $CF86
     ;Sexec

;;; UIPwait
544E
     $87; Code
     "UIPwait"; Name
     $5411; Backward Link
     $545A

;;; CODE

;Real Time clock
545A   UIPWait:  LDA A   #UIPreg
545C             STA A   $RTCControl   
545F             LDA A   $RTCData   
5462             AND A   #UIPbit
5464             BNE     UIPWait   
5466             RTS  

;;; !CLKDTA
5467
     $87; Code
     "!CLKDTA"; Name
     $544E; Backward Link
     $5473

5473   L_5473    JSR     UIPWait   
5476             PUL A
5477             PUL A
5478             STA A   RTCControl   
547B             PUL B
547C             PUL B
547D             STA B   RTCData   
5480             JMP     NEXT

;; @CLKDTA
5483
     $87; Code
     "@CLKDTA"; Name
     $5467; Backward Link
     $548F

548F   L_548F    JSR     UIPWait   
5492             PUL A
5493             PUL B
5494             STA B   RTCControl   
5497             LDA B   RTCData   
549A             CLR A
549B             JMP     PUSHD     
549E   L_549E    JMP     NEXT

;;; : @TSTBYTE ( --n) TSTBYTE# @CLKDTA ;
	' @TSTBYTE CFA '@TSTBYTE !
54A1
     $88; Code
     "@TSTBYTE"; Name
     $5483; Backward Link
     COLON
     $53E6
     $548D
     ;Sexec

;;; : !TSTBYTE ( n--) TSTBYTE# !CLKDTA ;
54B4
     $88; Code
     "!TSTBYTE"; Name
     $54A1; Backward Link
     COLON
     $53E6
     $5471
     ;Sexec
     $87

;;; : @RUNDLY ( --n) RUNDLY# @CLKDTA 256 * RUNDLY# 1+ @CLKDTA OR ;
54C7
     $87; Code
     "@RUNDLY"; Name
     $54B4; Backward Link
     COLON
     $53D7
     $548D
     LITexec
     $0100
     $D149
     $53D7
     $C71D
     $548D
     ORexec
     ;Sexec

;;; : !RUNDLY ( n--) DUP 256 / RUNDLY# !CLKDTA RUNDLY# 1+ !CLKDTA ;
54E7
     $87; Code
     "!RUNDLY"; Name
     $57C7; Backward Link
     COLON
     DUPexec; Duplicate Top of Stack
     LITexec
     $0100
     $D192
     $53D7
     $5471
     $53D7
     $C71D
     $5471
     ;Sexec

;;; ( STOP/START CLOCK FOR RESET

;;; CODE

;; STOPCLK
5507
     $87; Code
     "STOPCLK"; Name
     $54E7; Backward Link
     $5513

5513   L_5513    JSR     UIPWait   
5516             LDA A   #$0B
5518             STA A   RTCControl   
551B             LDA B   RTCData   
551E             ORA B   #$80
5520             STA A   RTCControl   
5523             STA B   RTCData   
5526             JMP     NEXT

;; STRTCLK
5529
     $87; Code
     "STRTCLK"; Name
     $5507; Backward Link
     $5535       

5535   L_5535    JSR     UIPWait   
5538             LDA A   #$0B
553A             STA A   RTCControl  
553D             LDA B   RTCData   
5540             AND B   #$7F
5542             STA A   RTCControl   
5545             STA B   RTCData   
5548             JMP     NEXT

;;; : @SMPL# ( -- n) MSBSMPL# @CLKDTA 256 * LSBSMPL# @CLKDTA OR ;
554B
     $86; Code
     "@SMPL#"; Name
     $5529; Backward Link
     COLON
     $53BA
     $548D
     LITexec
     $0100
     $D149
     $53C9
     $548D
     ORexec
     ;Sexec

;;; : !SMPL# ( n--) 256 /MOD MSBSMPL# !CLKDTA LSBSMPL#
5568
     $86; Code
     "!SMPL#"; Name
     $554B; Backward Link
     COLON
     LITexec
     $0100
     $D15A
     $53BA
     $5471
     $53C9
     $5471
     ;Sexec

;;; : +!SMPL# ( n --) @SMPL# + !SMPL# ;
5583
     $87; Code
     "+!SMPL#"; Name
     $5568; Backward Link
     COLON
     $5554
     +exec; Add Second on Stack To Top of Stack
     $5571
     ;Sexec

;;; : CNVRTdate ( --adr,cnt) RTCmonth @CLKDTA 0 100 D* 
	RTCday @CLKDTA 0 D+ 100 D* RTCyr  @CLKDTA 0 D+
5597
     $89; Code
     "CNVRTdate"; Name
     $5583; Backward Link
     COLON
     $530F
     $548D
     0refx
     LITexec
     $0064
     $DFE1
     $5300
     $548D
     0refx
     $C419
     LITexec
     $0064
     $DFE1
     $531B
     $548D
     0refx
     $C419
     $D5E1
     $D61E
     $D61E
     LITexec
     $002F
     HOLDexec
     $D61E
     $D61E
     LITexec
     $002F
     HOLDexec
     $D646
     $D5F0
     ;Sexec

;;; : CNVRTtime ( --adr,cnt) RTChrs @CLKDTA DUP 127 > fPM !
	127 AND 0 100 D* RTCmin @CLKDTA 0 D+ 100 D*
	RTCsec @CLKDTA 0 D+ <# # # 58 HOLD # # 58 HOLD #S #> ;
55E3
     $89; Code
     "CNVRTtime"; Name
     $5597; Backward Link
     COLON
     $52F3
     $548D
     DUPexec; Duplicate Top of Stack
     LITexec
     $007F
     $C7BD
     $540D
     !exec
     LITexec
     $007F
     ANDexec
     0refx
     LITexec
     $0064
     $DFE1
     $52E6
     $548D
     0refx
     $C419
     LITexec
     $0064
     $DFE1
     $52D9
     $548D
     0refx
     $C419
     $D5E1
     $D61E
     $D61E
     LITexec
     $003A
     HOLDexec
     $D61E
     $D61E
     LITexec
     $003A
     HOLDexec
     $D646
     $D5F0
     ;Sexec

;;; : !CLKBUFx ( c,x-- char saved in CLKBUF at x) CLKBUF + 1- C! ;
5641
     $88
     "!CLKBUFx"; Name
     $55E3; Backward Link
     COLON
     $2234
     +exec; Add Second on Stack To Top of Stack
     $D6F7
     C!exec
     ;Sexec

;;; :GET-SMPL# RTCday @CLKDTA DAY0 @CLKDTA OVER DAY0 !CLKDTA <>
       IF 1 !SMPL# ELSE 1 +!SMPL# ENDIF @SMPL#
5658
     $89; Code
     "GET-SMPL#"; Name
     $5641; Backward Link
     COLON
     $5300
     $548D
     $539E
     $548D
     OVERexec; Duplicate Second Item at Top of Stack
     $539E
     $5471
     $D7EE
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $000A; Branch Offset
     	1refx
     	$5571
     	BRANCHexec
     	$0006
     ENDIF
     1refx
     $558D
     $5554
     ;Sexec     

;;; : CLKTST STRTCLK
	BEGIN CR ." [" CNVRTdate TYPE ."  " CNVRTtime TYPE ." ] "
	14 10 DO 32 EMIT I @CLKDTA 0 HEX <# # # #> DECIMAL TYPE ." H"
	LOOP ?TERMINAL DUP IF DROP KEY 27 = ENDIF UNTIL ;
568A
     $86; Code
     "CLKTST"; Name
     $5658; Backward Link
     COLON
     BEGIN
     	$5533
     	CRexec
     	$CAD3
     	$01	; Msg bytes
     	"["
     	$55A3
     	$CA72
     	$CAD3
     	$01	; Msg bytes
     	" "
     	$55EF
     	$CA72
     	$CAD3
     	$02	; Msg bytes
     	"] "
     	LITexec
     	$000E
     	LITexec
     	$000A
     	(DO)exec
     	LITexec
     	$0020
     	$C238
     	$C130
     	$548D
     	0refx
     	$C9B9
     	$D5E1
     	$D61E
     	$D61E
     	$D5F0
     	$C9CE
     	$CA72
     	$CAD3
     	$01	; Msg bytes
     	"H"
     	(LOOP)exec
     	$FFE0
     	$C267
     	DUPexec; Duplicate Top of Stack
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$000C; Branch Offset
     		DROPexec; Delete Top of Stack
     		$C250
     		LITexec
     		$001B
     		=exec
     	ENDIF
     OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     $FFA9; Branch Offset
     ;Sexec

;;; ( NUMBER ENTRY

;;; : CLR-NUMBER  CLR-CHRBUF2 CHRBUF2 1+ BUF2pntr !
	x2 @ 1+ MINx @ DO 32 I DISPLAY2 wx-emit LOOP    ( Clr digits)
	MINx @ x2 ! ;                        ( Reset dsply clmn pntr)
56F2
     $8A: Code
     "CLR-NUMBER"; Name
     $568A; Backward Link
     COLON
     $F27B
     $F21D
     $C71D
     $F23B
     !exec
     $F4DD
     TOGGLEexec
     $C71D
     $3371
     TOGGLEexec
     (DO)exec
     LITexec
     $0020
     $C130
     $F4CB
     $F554
     (LOOP)exec
     $FFF4
     $3371
     TOGGLEexec
     $F4DD
     !exec
     ;Sexec    

;;; : get[num] ( --  CHRBUF2 contains char string)
	BEGIN x2 @ MAXx @ >        ( Display clmn pntr > last clmn ?)
	IF 0 BUF2pntr ! 0 fDP ! ENDIF      ( clear char buffer pntr)
	BEGIN ?KEYPAD UNTIL PCkey 
	47 OVER < OVER 58 < AND ( 0->9 DIGITS only entered) 
	IF BUF2pntr @ 0= IF CLR-NUMBER ENDIF
	DUP x2 @ DISPLAY2 wx-emit 1 x2 +!   ( Display character)
	95 ( _) x2 @ DISPLAY2 wx-emit  ( Display nxt chr prompt)
	DUP BUF2pntr @ C! 1 BUF2pntr +!    ( Enter digit in buf)
	ENDIF x2 @ MAXx @ >       ( Display clmn pntr > last clmn ?)
	IF 32 ( sp) x2 @ DISPLAY2 wx-emit ENDIF ( If so, clr prompt)
	ENT = UNTIL ;
572F
     $88; Code
     "get[num]"; Name
     $56F2; Backward Link
     COLON
     BEGIN
     	$F4DD
     	TOGGLEexec
     	$337C
     	TOGGLEexec
     	$C7BD
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$000E; Branch Offset
     		0refx
     		$F23B
     		!exec
     		0refx
     		$33D5
     		!exec
     		BEGIN
     			$F912
     		OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     		$FFFC; Branch Offset
     	ENDIF
     	PCkeyexec
     	LITexec
     	$002F
     	OVERexec; Duplicate Second Item at Top of Stack
     	<exec
     	OVERexec; Duplicate Second Item at Top of Stack
     	LITexec
     	$003A
     	<exec
     	ANDexec
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0038; Branch Offset
     		$F23B
     		TOGGLEexec
     		0=exec
     		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     		$0004; Branch Offset
     			$56FF
     		ENDIF
     		DUPexec; Duplicate Top of Stack
     		$F4DD
     		TOGGLEexec
     		$F4CB
     		$F554
     		1refx
     		$F4DD
     		$C4B8
     		LITexec
     		$005F
     		$F4DD
     		TOGGLEexec
     		$F4CB
     		$F554
     		DUPexec; Duplicate Top of Stack
     		$F23B
     		TOGGLEexec
     		C!exec
     		1refx
     		$F23B
     		$C4B8
     	ENDIF
     	$F4DD
     	TOGGLEexec
     	$337C
     	TOGGLEexec
     	$C7BD
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$000E; Branch Offset
     		LITexec
     		$0020
     		$F4DD
     		TOGGLEexec
     		$F4CB
     		$F554
     	ENDIF
     	$F732
     	=exec
     OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     $FF72; Branch Offset
     ;Sexec

;;; : SET-INITVLU ( n--) 0 INITVLU 2! 0 INITVLU 4 + ! ;
57CE
     $8B; Code
     "SET-INITVLU"; Name
     $572F; Backward Link
     COLON
     0refx
     $338A
     $D74E
     0refx
     $338A
     LITexec
     $0004
     +exec; Add Second on Stack To Top of Stack
     !exec
     ;Sexec

;;; : GET[num] ( --n)
	CLR-CHRBUF2                            ( Clear digit buffer)
	0 fDP ! 0 f+/-# !  ( Clr dp entered flag & set POS NUM only)
	0 F#SGN !                               ( Clr neg data sign)
	INITVLU 2@ INITVLU 4 + @ F#CNVRT    ( Get init value string)
	2DUP CHRBUF2 1+ SWAP CMOVE ( Put init value strng in buffer)
	MINx @ DISPLAY2 wx-TYPE                ( Display init value)
	MINx @ 1+ MAXx !                    ( Set for 2 digit input)
	MAXx @ 1+ x2 !               ( Set dsply clmn > max allowed)
	get[num]              ( Init digit entry & get whole number)
	CHRBUF2 NUMBER 2DUP INITVLU 2! DROP >R
	DPL @ 0 MAX MINUS INITVLU 4 + ! R> ;
57F2
     $88; Code
     "GET[num]"; Name
     $57CE; Backward Link
     COLON
     $F27B
     0refx
     $33D5
     !exec
     0refx
     $33A4
     !exec
     0refx
     $33B0
     !exec
     $338A
     $D735
     $338A
     LITexec
     $0004
     +exec; Add Second on Stack To Top of Stack
     TOGGLEexec
     $34A1
     $D7C8
     $F21D
     $C71D
     SWAPexec; Swap Top of Stack with Next on Stack
     $C285
     $3371
     TOGGLEexec
     $F4CB
     $F530
     $3371
     TOGGLEexec
     $C71D
     $337C
     !exec
     $337C
     TOGGLEexec
     $C71D
     $F4DD
     !exec
     $573A
     $F21D
     $CD2B
     $D7C8
     $338A
     $D74E
     DROPexec; Delete Top of Stack
     $C3A7
     $C6DF
     TOGGLEexec
     0refx
     $C83F
     MINUSexec
     $338A
     LITexec
     $0004
     +exec; Add Second on Stack To Top of Stack
     !exec
     R>exec
     ;Sexec

;;; 0 VARIABLE SEC0
5871
     $84; Code
     "SEC0"; Name
     $57F2; Backward Link
     $C576
     $11EE

;;; :DaTmDSPLY (--) STOPCLK ...
587C
     $89; CODE
     "DaTmDSPLY"; Name
     $5871; Backward Link
     COLON
     $5511
     $55A3
     LITexec
     $0006
     LITexec
     $0008
     $F4BC
     $F56E
     $55EF
     LITexec
     $0011
     LITexec
     $0008
     $F4BC
     $F56E
     $5533
     ;Sexec

;;; : ?F3KEY DaTmDSPLY
	BEGIN RTCsec @CLKDTA SEC0 @ OVER SEC0 !
	<> IF DaTmDSPLY ENDIF
	?KEYPAD DUP
	IF DROP PCkey F1 OVER = OVER F3 = OR
	DUP 0= IF SWAP DROP ENDIF ENDIF 
	UNTIL F3 = ;
58AC
     $86; Code
     "?F3KEY"; Name
     $587C; Backward Link
     COLON
     BEGIN
     	$5888
     	$52D9
     	$548D
     	$5878
     	TOGGLEexec
     	OVERexec; Duplicate Second Item at Top of Stack
     	$5878
     	!exec
     	$D7EE
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0004; Branch Offset
     		$5888
     	ENDIF
     	$F912
     	DUPexec; Duplicate Top of Stack
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0020; Branch Offset
     		DROPexec; Delete Top of Stack
     		PCkeyexec
     		$F70C
     		OVERexec; Duplicate Second Item at Top of Stack
     		=exec
     		OVERexec; Duplicate Second Item at Top of Stack
     		$F71E
     		=exec
     		ORexec
     		DUPexec; Duplicate Top of Stack
     		0=exec
     		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     		$0006; Branch Offset
     			SWAPexec; Swap Top of Stack with Next on Stack
     			DROPexec; Delete Top of Stack
     		ENDIF
     	ENDIF
     OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     $FFC2; Branch Offset
     $F71E
     =exec
     ;Sexec

;;; : ?CHNGtime "DaTm3 DISPLAY2 w-TYPE ?F3KEY ;
58FF
     $89; Code
     "?CHNGtime"; Name
     $58AC; Backward Link
     COLON
     $2E76
     $F4CB
     $F51E
     $58B5
     ;Sexec

;;; : ?PM "AM/PM DISPLAY2 w-TYPE ?F3KEY ;
5917
     $83; Code
     "?PM"; Name
     $58FF; Backward Link
     COLON
     $2E9C
     $F4CB
     $F51E
     $58B5
     ;Sexec

;;; : ?DaTmOK "DaTm1 DISPLAY1 w-TYPE
5929
     $87; Code
     "?DatmOK"; Name
     $5917; Backward Link
     COLON
     $2E03
     $F4BC
     $F51E
     $2E50
     $F4CB
     $F51E
     $58B5
     ;Sexec

;;; : NEWTIME STOPCLK 0 RTCsec !CLKDTA
	2 BLANKline
	"HH Count DUP 2+ DUP MINx ! 2+ MAXx ! 1 DISPLAY2 wx-TYPE
	0 BEGIN DROP RTChrs @CLKDTA 127 AND  ( Rd hrs & Clr PM bit) 
	SET-INITVLU GET[num] DUP 13 < UNTIL TMPhrs !
	2 BLANKline
	"MIN Count DUP 2+ DUP MINx ! 2+ MAXx ! 1 DISPLAY2 wx-TYPE 
	0 BEGIN DROP RTCmin @CLKDTA 
	SET-INITVLU GET[num] DUP 60 < UNTIL RTCmin !CLKDTA
	?PM IF 128 ELSE 0 ENDIF TMPhrs @ + RTChrs !CLKDTA STRTCLK ;
5945
     $87; Code
     "NEWTIME"; Name
     $5929; Backward Link
     COLON
     $5511
     0refx
     $52D9
     $5471
     2refx
     $F3DB
     $2EEC
     $FACE
     DUPexec; Duplicate Top of Stack
     $C72A
     DUPexec; Duplicate Top of Stack
     $3371
     !exec
     $C72A
     $337C
     !exec
     1refx
     $F4CB
     $F530
     0refx
     BEGIN
     	DROPexec; Delete Top of Stack
     	$52F3
     	$548D
     	LITexec
     	$007F
     	ANDexec
     	$57DC
     	$57FD
     	DUPexec; Duplicate Top of Stack
     	LITexec
     	$000D
     	<exec
     OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     $FFE6; Branch Offset
     $53F3
     !exec
     2refx
     $F3DB
     $2EFC
     $FACE
     DUPexec; Duplicate Top of Stack
     $C72A
     DUPexec; Duplicate Top of Stack
     $3371
     !exec
     $C72A
     $337C
     !exec
     1refx
     $F4CB
     $F530
     0refx
     BEGIN
     	DROPexec; Delete Top of Stack
     	$52E6
     	$548D
     	$57DC
     	$57FD
     	DUPexec; Duplicate Top of Stack
     	LITexec
     	$003C
     	<exec
     OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     $FFEC; Branch Offset; Branch Offset
     $52E6
     $5471
     $591D
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $000A; Branch Offset
     	LITexec
     	$0080
     	BRANCHexec
     	$0004
     ENDIF
     0refx
     $53F3
     TOGGLEexec
     +exec; Add Second on Stack To Top of Stack
     $52F3
     $5471
     $5533
     ;Sexec

;;; : NEWDATE  STOPCLK
	2 BLANKline
	"MM Count DUP 2+ DUP MINx ! 1+ MAXx ! 1 DISPLAY2 wx-TYPE
	RTCmonth @CLKDTA
	SET-INITVLU GET[num] RTCmonth !CLKDTA
	2 BLANKline
	"DD Count DUP 2+ DUP MINx ! 1+ MAXx ! 1 DISPLAY2 wx-TYPE
	RTCday @CLKDTA 
	SET-INITVLU GET[num] RTCday !CLKDTA
	2 BLANKline
	"YY Count DUP 2+ DUP MINx ! 1+ MAXx ! 1 DISPLAY2 wx-TYPE
	RTCyr @CLKDTA
	SET-INITVLU GET[num] RTCyr !CLKDTA STRTCLK ;
59F1
     $87; Code
     "NEWDATE"; Name
     $5945; Backward Link
     COLON
     $5511
     2refx
     $F3DB
     $2EBF
     $FACE
     DUPexec; Duplicate Top of Stack
     $C72A
     DUPexec; Duplicate Top of Stack
     $3371
     !exec
     $C71D
     $337C
     !exec
     1refx
     $F4CB
     $F530
     $530F
     $548D
     $57DC
     $57FD
     $530F
     $5471
     2refx
     $F3DB
     $2ECF
     $FACE
     DUPexec; Duplicate Top of Stack
     $C72A
     DUPexec; Duplicate Top of Stack
     $3371
     !exec
     $C71D
     $337C
     !exec
     1refx
     $F4CB
     $F530
     $5300
     $548D
     $57DC
     $57FD
     $5300
     $5471
     2refx
     $F3DB
     $2EDD
     $FACE
     DUPexec; Duplicate Top of Stack
     $C72A
     DUPexec; Duplicate Top of Stack
     $3371
     !exec
     $C71D
     $337C
     !exec
     1refx
     $F4CB
     $F530
     $531B
     $548D
     $57DC
     $57FD
     $531B
     $5471
     $5533
     ;Sexec

;;; ( CLOCK INITIALIZE

;;; : INIT-RTC Binit SETbit OR REGB !CLKDTA ( Stop clk & init Reg B)
	Ainit REGA !CLKDTA
	REGC @CLKDTA DROP                ( Clr any pending interrupt)
	1 !SMPL#                      ( Initialize the sample number)
	REGD @CLKDTA DROP                              ( Set VTR bit)
	STRTCLK ;
5A81
     $88; Code
     "INIT-RTC"; Name
     $59F1; Backward Link
     COLON
     $5393
     $534F
     ORexec
     $5365
     $5471
     $5387
     $535A
     $5471
     $5370
     $548D
     DROPexec; Delete Top of Stack
     1refx
     $5571
     $537B
     $548D 
     DROPexec; Delete Top of Stack 
     $5533
     ;Sexec

;;; : ?CLKDTAok REGD @CLKDTA VTRbit AND 0> ;
5AB2
     $89; Code
     "?CLKDTAok"; Name
     $5A81; Backward Link
     COLON
     $537B
     $548D
     $53AB
     ANDexec
     $D844
     ;Sexec 

;;; : DATE/TIME -1 CALflg ! STRTCLK ( Ensure NO RECAL & clk running)
	BEGIN REGD @CLKDTA VTRbit AND                ( Check VTR bit)
	IF ?DaTmOK IF 0 CALflg ! EXIT ENDIF   ( Operator change req)
	?CHNGtime IF NEWTIME ELSE NEWDATE ENDIF
	ELSE INIT-RTC             ( If VRT bad, force operator set)
	"CLKRST DISPLAY1 w-TYPE
	NEWDATE NEWTIME
	ENDIF
	0 UNTIL ;
5ACC
     $89; Code
     "DATE/TIME"; Name
     $5AB2; Backward Link
     COLON
     BEGIN
     	LITEX
     	$FFFF
     	$2201
     	!exec
     	$5533
     	$537B
     	$548D
     	$53AB
     	ANDexec
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0 
     	$0022; Branch Offset
     		$5933
     		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     		$000A; Branch Offset
     		0refx
     		$2201
     		!exec
     		$D6BB
     		$590B
     		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     		$0008; Branch Offset
     			$594F
     			BRANCHexec
     			$0004
     		ENDIF
     		$59FB
     		BRANCHexec
     		$000E
     	$5A8C
     	$2E2A
     	$F4BC
     	$F51E
     	$59FB
     	$594F
     	0refx
     OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     $FFC4; Branch Offset
     ;Sexec

;;;??? 	' DATE/TIME CFA 'DATE/TIME ! ( Addr of DATE/TIME entry routine) 

;;;???	' GET-SMPL# CFA 'GET-SMPL# ! ( Addr of SAMPLE# routine)

;;; CkROM2 (Calculate Checksum)
5B24
     $86; Code
     "CkROM2"; Name
     $5ACC; Backward Link
     $5B2F

5B2F   L_5B2F   LDX     #$2000
5B32            CLR A
5B33            CLR B
5B34   L_5B34   ADD B   $01,X
5B36            ADC A   $00,X
5B38            INX  
5B39            INX  
5B3A            CPX     #$6000
5B3D            BNE     L_5B34   
5B3F            JMP     PUSHD     
5B42   L_5B42   JMP     NEXT

 dw $0121

 db "                                for 2000 ROM checksum 09/96

;;; END OF $2000 ROM (rest is filled with $FF)

********************************************************
********************************************************

AD32   L_AD32   LDA A   $0EC4   
AD35            AND A   #$7F
AD37            STA A   A/DHiByte   
AD3A            LDA B   $13B2   
AD3D            PSH B
AD3E            LDA B   $13B1   
AD41            PSH B
AD42   L_AD42   JMP     NEXT   

;; PLSELMP
AD45
     $87; Code
     "PLSELMP"; Name
     $AD27; Backward Link
     $AD51

AD51   L_AD51   LDA A   $0EC4   
AD54            ORA A   #$80
AD56            STA A   $0EC4   
AD59            STA A   A/DHiByte   
AD5C   L_AD5C   JMP     NEXT   

;; RDYWAIT
AD5F
     $87
     "RDYWAIT"
     $AD45
     $AD6B

AD6B   L_AD6B   CLR B
AD6C   L_AD6C   INC B
AD6D            CMP B   #$64
AD6F            BNE     L_AD7A   
AD71            LDX     #$FFFF
AD74            STX     flMPERR   
AD77   L_AD77   JMP     NEXT   
AD7A   L_AD7A   LDA A   A/DStatus   
AD7D            AND A   #$40
AD7F            BNE     L_AD6C   
AD81            LDX     #$0000
AD84            STX     flMPERR   
AD87   L_AD87   JMP     NEXT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Work to do here

;;; "STRNG" "OPAQOUT  | REMOVE OPAQUE SAMPLE    |
B74A
     $88; Code
     ""OPAQOUT"; Name
     $B723; Backward Link
     $CA33
     $FAC4
     "REMOVE OPAQUE SAMPLE    "
     $00

;;; "STRNG" "BADLMP   | BAD LAMP DETECTION TEST |
B772
     $87; Code
     ""BADLMP"; Name
     $B74A; Backward Link
     $CA33
     $FAC4
     "BAD LAMP DETECTION TEST "
     $00

;;; : LOOP-FIRE  0 10 0 DO FIRE-LAMP LMPERR @ + LOOP ;
B799
     $89; Code
     "LOOP-FIRE"; Name
     $B772; Backward Link
     COLON
     0refx
     LITexec
     $000A
     0refx
     (DO)exec
     $3D13
     $3C0A
     TOGGLEexec
     +exec; Add Second on Stack To Top of Stack
     (LOOP)exec
     $FFF6
     ;Sexec

;;; : BADLMP-DET
	BOLD "BADLMP Count PRINTSTRING PRNTcrlf
	"OPAQIN  DISPLAY1 w-TYPE
	"ACK     DISPLAY2 w-TYPE
	BEGIN PCkey 13 = UNTIL
	LOOP-FIRE 7 < PRNT-FAIL/PASS
	"OPAQOUT DISPLAY2 w-TYPE WAIT[VialOut] ;
B7BF
     $8A; Code
     "BADLMP-DET"; Name
     $B799; Backward Link
     COLON
     $80D5
     $B77C
     $FACE
     $FF17
     $FEF9
     $B72D
     $F4BC
     $F51E
     $25E5
     $F4CB
     $F51E
     BEGIN
     	PCkeyexec
     	LITexec
     	$000D
     	=exec
     OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     $FFF6
     $B7A5
     LITexec
     $0007
     <exec
     $A50C
     $B755
     $F4CB
     $F51E
     $917C
     ;Sexec
 

BE5A   L_BE5A   RTS  
BE5B   L_BE5B   JMP     NEXT

;; EXTIRQ
BE5E
     $86
     "EXTIRQ"
     $BE4F
     $BE69

BE69   L_BE69   RTS
BE6A   L_BE6A   JMP     NEXT   

;; EXTNMI
BE6D
     $86
     "EXTNMI"
     $BE5E
     $BE78

BE78   L_BE78   JSR     S_FCFE   
BE7B            RTS  
BE7C   L_BE7C   JMP     L_C034

;; EXTRST
BE7F
     $86
     "EXTRST"
     $BE6D
     $BE8A

BE8A   L_BE8A   LDX     #$0DDC
BE8D   L_BE8D   CLR     $00,X
BE8F            INX  
BE90            CPX     #$1FFE
BE93            BNE     L_BE8D   
BE95            LDX     #PrintBuf
BE98            STX     $0A82   
BE9B            STX     PBufPtr   
BE9E            LDX     #$0000
BEA1            STX     $0A8A   
BEA4            LDX     #$0C00
BEA7            STX     $067E   
BEAA            LDX     D_8004   
BEAD            STX     $0568   
BEB0            LDX     D_8002   
BEB3            STX     $057E   
BEB6            LDX     D_8000   
BEB9            STX     $0512   
BEBC            LDX     #$9C75
BEBF            STX     $0556   
BEC2            PUL A
BEC3            PUL B
BEC4            DES  
BEC5            TSX  
BEC6            CLR     $00,X
BEC8            PSH B
BEC9            PSH A
BECA            RTS
  
BECB   L_BECB   JMP     NEXT

C000   L_C000   NOP  
C001            JMP     Init1   
C004   L_C004   NOP  
C005            JMP     L_D086

C008            FCB     $68,  $00,  $00,  $01,  $00,  $00,  $00,  $08
C010   D_C010   FCB     $05,  $00
C012   D_C012   FCB     $04,  $30
C014   D_C014   FCB     $04,  $FE,  $04,  $30,  $00,  $1F,  $00,  $00
C01C   D_C01C   FCB     $0A,  $8E
C01E   D_C01E   FCB     $0A,  $8E
C020   D_C020   FCB     $05,  $93
C022   D_C022   FCB     $00,  $50
C024   D_C024   FCB     $00,  $00

C026   CtlLoop: PUL A
C027            PUL B
C028   L_C028   STA A   $00,X
C02A            STA B   $01,X
C02C            BRA     NEXT   
C02E   L_C02E   LDA A   $00,X
C030            LDA B   $01,X
C032   PUSHD:   PSH B
C033            PSH A
C034   NEXT:    LDX     XSafe   
C036   NEXT1:   INX  
C037            INX  
C038            STX     XSafe   
C03A            LDX     $00,X
C03C   Disptch: STX     $00EA   
C03E            LDX     $00,X
C040            JMP     $00,X
C041            NOP

;; ASSEMBLER-RAM
C043
     $8D
     "ASSEMBLER-RAM"
     $0000; First Entry (or seed)?
     $C5A8
     $0042

;; LIT
C057
     $83
     "LIT"
     $C043
LITexec:
C05D $C05F     

C05F   L_C05F   LDX     XSafe   
C061            INX  
C062            INX  
C063            STX     XSafe   
C065            LDA A   $00,X
C067            LDA B   $01,X
C069            JMP     PUSHD   

C06C   L_C06C   SUB B   #$6E
C06E            LDX     XSafe   
C070            INX  
C071            STX     XSafe   
C073            CLR A
C074            LDA B   $01,X
C076            JMP     PUSHD   

;; EXECUTE
C079
     $87
     "EXECUTE"
     $C057
EXECUTEexec:
C083 $C085

C085   L_C085   TSX  
C086            LDX     $00,X
C088            INS  
C089            INS  
C08A            JMP     Disptch

;; BRANCH
C08D
     $86
     "BRANCH"
     $C079
BRANCHexec:
C096 $C0AB

;; OBRANCH; Used for the FORTH 'IF' and 'Until' Statements
C098
     $87
     "OBRANCH"
     $C08D
OBRANCHexec:
C0A2 $C0A4

C0A4   L_C0A4   PUL A
C0A5            PUL B
C0A6            ABA  
C0A7            BNE     L_C0BC; Check to see if TOS<>0 (TRUE)  
C0A9            BCS     L_C0BC   
C0AB   L_C0AB   LDX     XSafe; Get here if TOS=0 (FALSE)  
C0AD            LDA B   $03,X; First Offset Arg Byte
C0AF            LDA A   $02,X; Second Offset Arg Byte
C0B1            ADD B   XSafe+1; Compute amout of code to skip  
C0B3            ADC A   XSafe   
C0B5            STA B   XSafe+1   
C0B7            STA A   XSafe   
C0B9   L_C0B9   JMP     NEXT   
C0BC   L_C0BC   LDX     XSafe   
C0BE            INX  
C0BF            INX  
C0C0            STX     XSafe   
C0C2   L_C0C2   JMP     NEXT   

;; (LOOP)
C0C5
     $86
     "(LOOP)"
     $C098
(LOOP)exec:
C0CE $C0D0

C0D0   L_C0D0   CLR A
C0D1            LDA B   #$01
C0D3            BRA     L_C0E3   

;; (+LOOP)
C0D5
     $87
     "(+LOOP)"
     $C0C5
(+LOOP)exec
C0DF $C0E1

C0E1   L_C0E1   PUL A
C0E2            PUL B
C0E3            TST A
C0E4            BPL     L_C0FC   
C0E6            BSR     S_C0F1   
C0E8            SEC  
C0E9            SBC B   $05,X
C0EB            SBC A   $04,X
C0ED            BPL     L_C0AB   
C0EF            BRA     L_C104
   
C0F1   S_C0F1   LDX     $00EE   
C0F3            ADD B   $03,X
C0F5            ADC A   $02,X
C0F7            STA B   $03,X
C0F9            STA A   $02,X
C0FB            RTS
  
C0FC   L_C0FC   BSR     S_C0F1   
C0FE            SUB B   $05,X
C100            SBC A   $04,X
C102            BMI     L_C0AB   
C104   L_C104   INX  
C105            INX  
C106            INX  
C107            INX  
C108            STX     $00EE   
C10A            BRA     L_C0BC   

;; (DO)
C10C
     $84
     "(DO)"
     $C0D5
(DO)exec:
C113 $C115

C115   L_C115   LDX     $00EE   
C117            DEX  
C118            DEX  
C119            DEX  
C11A            DEX  
C11B            STX     $00EE   
C11D            PUL A
C11E            PUL B
C11F            STA A   $02,X
C121            STA B   $03,X
C123            PUL A
C124            PUL B
C125            STA A   $04,X
C127            STA B   $05,X
C129   L_C129   JMP     NEXT   

;; )
C12C
     $81
     ")"
     $C10C
     $C132

C132   L_C132   LDX     $00EE   
C134            INX  
C135            INX  
C136            JMP     L_C02E   

;; DIGIT
C139
     $85
     "DIGIT"
     $C12C
DIGITexec:
C141 $C143

C143   L_C143   TSX  
C144            LDA A   $03,X
C146            SUB A   #$30
C148            BMI     L_C165   
C14A            CMP A   #$0A
C14C            BMI     L_C158   
C14E            CMP A   #$11
C150            BMI     L_C165   
C152            CMP A   #$2B
C154            BPL     L_C165   
C156            SUB A   #$07
C158   L_C158   CMP A   $01,X
C15A            BPL     L_C165   
C15C            LDA B   #$01
C15E            STA A   $03,X
C160   L_C160   STA B   $01,X
C162   L_C162   JMP     NEXT   
C165   L_C165   CLR B
C166            INS  
C167            INS  
C168            TSX  
C169            STA B   $00,X
C16B            BRA     L_C160

;; (FIND)
C16D
     $86
     "(FIND)"
     $C139
(FIND)exec:
C176 $C178

C178            NOP  
C179            NOP  
C17A            LDX     #$00E0
C17D            LDA B   #$04
C17F   L_C17F   PUL A
C180            STA A   $00,X
C182            INX  
C183            DEC B
C184            BNE     L_C17F   
C186            LDX     $00E0   
C188   L_C188   LDA B   $00,X
C18A            STA B   $00E6   
C18C            AND B   #$3F
C18E            INX  
C18F            STX     $00E0   
C191            LDX     $00E2   
C193            LDA A   $00,X
C195            INX  
C196            STX     $00E4   
C198            CBA  
C199            BNE     L_C1BD   
C19B   L_C19B   LDX     $00E4   
C19D            LDA A   $00,X
C19F            INX  
C1A0            STX     $00E4   
C1A2            LDX     $00E0   
C1A4            LDA B   $00,X
C1A6            INX  
C1A7            STX     $00E0   
C1A9            TST B
C1AA            BPL     L_C1BA   
C1AC            AND B   #$7F
C1AE            CBA  
C1AF            BEQ     L_C1C6   
C1B1   L_C1B1   LDX     $00,X
C1B3            BNE     L_C188   
C1B5            CLR A
C1B6            CLR B
C1B7            JMP     PUSHD 
  
C1BA   L_C1BA   CBA  
C1BB            BEQ     L_C19B   
C1BD   L_C1BD   LDX     $00E0   
C1BF   L_C1BF   LDA B   $00,X
C1C1            INX  
C1C2            BPL     L_C1BF   
C1C4            BRA     L_C1B1   
C1C6   L_C1C6   LDA A   $00E0   
C1C8            LDA B   $00E1   
C1CA            ADD B   #$04
C1CC            ADC A   #$00
C1CE            PSH B
C1CF            PSH A
C1D0            LDA A   $00E6   
C1D2            PSH A
C1D3            CLR A
C1D4            PSH A
C1D5            LDA B   #$01
C1D7            JMP     PUSHD

C1DA   L_C1DA   PSH A
C1DB            CLR A
C1DC            PSH A
C1DD            LDA B   #$01
C1DF            JMP     PUSHD   

;; ENCLOSE
C1E2
     $87
     "ENCLOSE"
     $C16D
ENCLOSEexec:
C1EB $C1EE

C1EE   L_C1EE   INS  
C1EF            PUL B
C1F0            TSX  
C1F1            LDX     $00,X
C1F3            CLR     $00E0   
C1F6   L_C1F6   LDA A   $00,X
C1F8            BEQ     L_C221   
C1FA            CBA  
C1FB            BNE     L_C206   
C1FD            INX  
C1FE            INC     $00E0   
C201            BRA     L_C1F6   
C203   L_C203   JMP     L_C004   
C206   L_C206   LDA A   $00E0   
C208            PSH A
C209            CLR A
C20A            PSH A
C20B   L_C20B   LDA A   $00,X
C20D            BEQ     L_C228   
C20F            CBA  
C210            BEQ     L_C218   
C212            INX  
C213            INC     $00E0   
C216            BRA     L_C20B
   
C218   L_C218   LDA B   $00E0   
C21A            CLR A
C21B            PSH B
C21C            PSH A
C21D            INC B
C21E            JMP     PUSHD
   
C221   L_C221   LDA B   $00E0   
C223            PSH B
C224            PSH A
C225            INC B
C226            BRA     L_C22A   
C228   L_C228   LDA B   $00E0   
C22A   L_C22A   PSH B
C22B            PSH A
C22C            LDA B   $00E0   
C22E            JMP     PUSHD   

;; EMIT
C231
     $84
     "EMIT"
     $C1E2
EMITexec:
C238 $C23A

C23A   L_C23A   PUL A
C23B            PUL A
C23C            JSR     S_D3E3   
C23F            LDX     $00F0   
C241            INC     $1B,X
C243            BNE     L_C247   
C245            INC     $1A,X
C247   L_C247   JMP     NEXT   

;; KEY
C24A
     $83
     "KEY"
     $C231
     $C252

C252   L_C252   JSR     S_D3FC   
C255            PSH A
C256            CLR A
C257            PSH A
C258   L_C258   JMP     NEXT   

;; TERMINAL
C25B
     $89
     "TERMINAL"
     $C24A
     $C269

C269   L_C269   JSR     S_D416   
C26C            CLR B
C26D            JMP     PUSHD   

;; CR
C270
     $82
     "CR"
     $C25B
CRexec:
C275 $C277


C277   L_C277   JSR     S_D423   
C27A   L_C27A   JMP     NEXT   

;; CMOVE
C27D
     $85
     "CMOVE"
     $C270
     $C287

C287   L_C287   LDX     #$00E0
C28A            LDA B   #$06
C28C   L_C28C   PUL A
C28D            STA A   $00,X
C28F            INX  
C290            DEC B
C291            BNE     L_C28C   
C293   L_C293   LDA A   $00E0   
C295            LDA B   $00E1   
C297            SUB B   #$01
C299            SBC A   #$00
C29B            STA A   $00E0   
C29D            STA B   $00E1   
C29F            BCS     L_C2B1   
C2A1            LDX     $00E4   
C2A3            LDA A   $00,X
C2A5            INX  
C2A6            STX     $00E4   
C2A8            LDX     $00E2   
C2AA            STA A   $00,X
C2AC            INX  
C2AD            STX     $00E2   
C2AF            BRA     L_C293   
C2B1   L_C2B1   JMP     NEXT   

;; U)
C2B4
     $82
     "U)"
     $C27D
     $C2BB

C2BB   L_C2BB   BSR     S_C2C2   
C2BD            INS  
C2BE            INS  
C2BF            JMP     PUSHD   
C2C2   S_C2C2   LDA A   #$10
C2C4            PSH A
C2C5            CLR A
C2C6            CLR B
C2C7            TSX  
C2C8   L_C2C8   ROR     $05,X
C2CA            ROR     $06,X
C2CC            DEC     $00,X
C2CE            BMI     L_C2DA   
C2D0            BCC     L_C2D6   
C2D2            ADD B   $04,X
C2D4            ADC A   $03,X
C2D6   L_C2D6   ROR A
C2D7            ROR B
C2D8            BRA     L_C2C8   
C2DA   L_C2DA   INS  
C2DB            RTS  

;; U/
C2DC
     $82
     "U/"
     $C2B4
     $C2E3

C2E3   L_C2E3   LDA A   #$11
C2E5            PSH A
C2E6            TSX  
C2E7            LDA A   $03,X
C2E9            LDA B   $04,X
C2EB   L_C2EB   CMP A   $01,X
C2ED            BHI     L_C2F8   
C2EF            BCS     L_C2F5   
C2F1            CMP B   $02,X
C2F3            BCC     L_C2F8   
C2F5   L_C2F5   CLC  
C2F6            BRA     L_C2FD   
C2F8   L_C2F8   SUB B   $02,X
C2FA            SBC A   $01,X
C2FC            SEC  
C2FD   L_C2FD   ROL     $06,X
C2FF            ROL     $05,X
C301            DEC     $00,X
C303            BEQ     L_C30B   
C305            ROL B
C306            ROL A
C307            BCC     L_C2EB   
C309            BRA     L_C2F8   
C30B   L_C30B   INS  
C30C            INS  
C30D            INS  
C30E            INS  
C30F            INS  
C310            JMP     L_C495   

;; AND
C313
     $83
     "AND"
     $C2DC
ANDexec:
C319 $C31B

C31B   L_C31B   PUL A
C31C            PUL B
C31D            TSX  
C31E            AND B   $01,X
C320            AND A   $00,X
C322            JMP     L_C028   

;; OR
C325
     $82
     "OR"
     $C313
ORexec:
C32A $C32C

C32C   L_C32C   PUL A
C32D            PUL B
C32E            TSX  
C32F            ORA B   $01,X
C331            ORA A   $00,X
C333            JMP     L_C028   

;; XOR
C336
     $83
     "XOR"
     $C325
XORexec:
C33C $C33E

C33E   L_C33E   PUL A
C33F            PUL B
C340            TSX  
C341            EOR B   $01,X
C343            EOR A   $00,X
C345            JMP     L_C028   

;; SP@
C348
     $83
     "SP@"
     $C336
     $C350

C350   L_C350   TSX  
C351            STX     $00E0   
C353            LDX     #$00E0
C356            JMP     L_C02E   

;; SP!
C359
     $83
     "SP!"
     $C348
     $C361

C361   L_C361   LDX     $00F0   
C363            LDX     $06,X
C365            TXS
C366   L_C366   JMP     NEXT   

;; RP!
C369
     $83
     "RP!"
     $C359
     $C371

C371   L_C371   LDX     D_C014   
C374            STX     $00EE   
C376   L_C376   JMP     NEXT   

;; ;S
C379
     $82
     ";S"
     $3BD3
     $C369
;Sexec:
C37E $C380

C380   L_C380   LDX     $00EE   
C382            INX  
C383            INX  
C384            STX     $00EE   
C386            LDX     $00,X
C388            JMP     NEXT1   

;; LEAVE
C38B
     $85
     "LEAVE"
     $C379
     $C395

C395   L_C395   LDX     $00EE   
C397            LDA A   $02,X
C399            LDA B   $03,X
C39B            STA A   $04,X
C39D            STA B   $05,X
C39F   L_C39F   JMP     NEXT   

;; >R
C3A2
     $82
     ">R"
     $C38B
     $C3A9

C3A9   L_C3A9   LDX     $00EE   
C3AB            DEX  
C3AC            DEX  
C3AD            STX     $00EE   
C3AF            PUL A
C3B0            PUL B
C3B1            STA A   $02,X
C3B3            STA B   $03,X
C3B5   L_C3B5   JMP     NEXT   

;; R>
C3B8
     $82; Code
     "R>"; Name
     $C3A2; Backward Link
R>exec:
C3BD $C3Bf

C3BF   L_C3BF   LDX     $00EE   
C3C1            LDA A   $02,X
C3C3            LDA B   $03,X
C3C5            INX  
C3C6            INX  
C3C7            STX     $00EE   
C3C9            JMP     PUSHD

;; R
C3CC
     $81; Code
     "R"; Name
     $C3B8; Backward Link
Rexec:
C3D0 $C3D2

C3D2   L_C3D2   LDX     $00EE   
C3D4            INX  
C3D5            INX  
C3D6            JMP     L_C02E

;; 0=
C3D9
     $82; Code
     "0="; Name
     $C3CC; Backward Link
0=exec:
C3DE $C3E0
     $304F
     $5F

C3E3   L_C3E3   LDX     $00,X
C3E5            BNE     L_C3E8   
C3E7            INC B
C3E8   L_C3E8   TSX  
C3E9            JMP     L_C028   

;; 0<
C3EC
     $82
     "0<"
     $3CD9
0<exec:
C3F1 $C3F3

C3F3   L_C3F3   TSX  
C3F4            LDA A   #$80
C3F6            AND A   $00,X
C3F8            BEQ     L_C400   
C3FA            CLR A
C3FB            LDA B   #$01
C3FD            JMP     L_C028   
C400   L_C400   CLR B
C401            JMP     L_C028   

;; +
C404
     $81
     "+"
     $C3EC
+exec:	Add Second on Stack To Top of Stack
C408 $C40A

C40A   L_C40A   PUL A
C40B            PUL B
C40C            TSX  
C40D            ADD B   $01,X
C40F            ADC A   $00,X
C411            JMP     L_C028   

;; D+
C414
     $82
     "D+"
     $C404
     $C41B

C41B   L_C41B   TSX  
C41C            CLC  
C41D            LDA B   #$04
C41F   L_C41F   LDA A   $03,X
C421            ADC A   $07,X
C423            STA A   $07,X
C425            DEX  
C426            DEC B
C427            BNE     L_C41F   
C429            INS  
C42A            INS  
C42B            INS  
C42C            INS  
C42D   L_C42D   JMP     NEXT   

;; MINUS
C430
     $85
     "MINUS"
     $C414
MINUSexec:
C438 $C43A

C43A   L_C43A   TSX  
C43B            NEG     $01,X
C43D            BCS     L_C443   
C43F            NEG     $00,X
C441            BRA     L_C445   
C443   L_C443   COM     $00,X
C445   L_C445   JMP     NEXT   

;; DMINUS
C448
     $86
     "DMINUS"
     $C430
     $C453

C453   L_C453   TSX  
C454            COM     $00,X
C456            COM     $01,X
C458            COM     $02,X
C45A            NEG     $03,X
C45C            BNE     L_C468   
C45E            INC     $02,X
C460            BNE     L_C468   
C462            INC     $01,X
C464            BNE     L_C468   
C466            INC     $00,X
C468   L_C468   JMP     NEXT   

;; OVER
C46B
     $84
     "OVER"
     $C448
OVERexec:
C472 $C474

C474   L_C474   TSX  
C475            LDA A   $02,X
C477            LDA B   $03,X
C479            JMP     PUSHD   

;; DROP
C47C
     $84
     "DROP"
     $C46B
DROPexec:
C483 $C485

C485   L_C485   INS  
C486            INS  
C487   L_C487   JMP     NEXT   

;; SWAP
C48A
     $84
     "SWAP"
     $C47C
SWAPexec:
C491 $C493

C493   L_C493   PUL A
C494            PUL B
C495            TSX  
C496            LDX     $00,X
C498            INS  
C499            INS  
C49A            PSH B
C49B            PSH A
C49C            STX     $00E0   
C49E            LDX     #$00E0
C4A1            JMP     L_C02E   

;; DUP
C4A4
     $83
     "DUP"
     $C48A
DUPexec:
C4AA $C4AC

C4AC   L_C4AC   PUL A
C4AD            PUL B
C4AE            PSH B
C4AF            PSH A
C4B0            JMP     PUSHD   

;; +!
C4B3
     $82
     "+!"
     $C4A4
     $C4BA

C4BA   L_C4BA   TSX  
C4BB            LDX     $00,X
C4BD            INS  
C4BE            INS  
C4BF            PUL A
C4C0            PUL B
C4C1            ADD B   $01,X
C4C3            STA B   $01,X
C4C5            ADC A   $00,X
C4C7            STA A   $00,X
C4C9   L_C4C9   JMP     NEXT   

;; TOGGLE
TOGGLE:
C4CC
     $86
     "TOGGLE"
     $C4B3
     COLON
     OVERexec; Duplicate Second Item at Top of Stack
     C@exec
     XORexec
     SWAPexec; Swap Top of Stack with Next on Stack
     C!exec
     ;Sexec
     $81C0
     TOGGLE
TOGGLEexec:
C4E7 $C4E9

C4E9   L_C4E9   TSX  
C4EA            LDX     $00,X
C4EC            INS  
C4ED            INS  
C4EE            JMP     L_C02E   

;; C@
C4F1
     $82
     "C@"
     $C4E3
C@exec:
C4F6 $C4F8

C4F8   L_C4F8   TSX  
C4F9            LDX     $00,X
C4FB            CLR A
C4FC            LDA B   $00,X
C4FE            INS  
C4FF            INS  
C500            JMP     PUSHD   

;; !
C503
     $81
     "!"
     $C4F1
!exec:
C507 $C509

C509   L_C509   TSX  
C50A            LDX     $00,X
C50C            INS  
C50D            INS  
C50E            JMP     CtlLoop   

;; C!
C511
     $82
     "C!"
     $C503
C!exec:
C516 $C518

C518   L_C518   TSX  
C519            LDX     $00,X
C51B            INS  
C51C            INS  
C51D            INS  
C51E            PUL B
C51F            STA B   $00,X
C521   L_C521   JMP     NEXT

;; :
C524
     $C1
     ":"         ; COLON
     $C511
COLONexec:
C53A COLON

C53C   COLON:   LDX     $00EE   
C53E            DEX  
C53F            DEX  
C540            STX     $00EE   
C542            LDA A   XSafe   
C544            LDA B   XSafe+1   
C546            STA A   $02,X
C548            STA B   $03,X
C54A            LDX     $00EA   
C54C            JMP     NEXT1

;; ;
C54F
     $C1
     ";"
     $C524
     COLON
;;;;;;;;;;

;; CONSTANT
C561
     $88
     CONSTANT
     $C54F
     COLON
     $CE18
     $C9A8
     $C755
     $C9E3

C576  GetVar:   LDX     $00EA; Points to Processing Routine Token   
C578            LDA A   $02,X; Get 1st byte after Token Addr (VarHi)
C57A            LDA B   $03,X; Get 2nd byte after Token Addr (VarLo)
C57C            JMP     PUSHD; Put them on stack and get Next

;; VARIABLE
C57F
     $88
     "VARIABLE"
     $C561
     COLON
;;;;;;;;;;

;; USER
C59B
     $84
     "USER"
     $C57F
     COLON
;;;;;;;;;;

C5A8   L_C5A8   LDX     $00EA   
C5AA            LDA A   $02,X
C5AC            LDA B   $03,X
C5AE            ADD B   $00F1   
C5B0            ADC A   $00F0   
C5B2            JMP     PUSHD

;;; 0 CONSTANT 0
C5B5
     $81; Code
     "0"; Name
     $C59B; Backward Link
0refx:
C5B9 GetVar; Processing Routine Token
     $0000; Constant value

;;; 1 CONSTANT 1
C5BD
     $81; Code
     "1"; Name
     $C5B5; Backward Link
1refx:
C5C1 GetVar; Processing Routine Token
     $0001; Constant value

;;; 2 CONSTANT 2
C5C5
     $81; Code
     "2"; Name
     $C5BD; Backward Link
2refx:
C5C9 GetVar; Processing Routine Token
     $0002; Constant value
C5D1

;;; 3 CONSTANT 3
C5CD
     $81; Code
     "3"; Name
     $C5C5; Backward Link
3refx:
C5D1 GetVar; Processing Routine Token
     $0003; Constant value

;; BL
C5D5
     $82
     "BL"
     $C5CD
     GetVar
;;;;;;;;;;

;; FIRST
C5DE
     $85
     "FIRST"
     $C5D5
     GetVar
;;;;;;;;;;

;; LIMIT
C5EA
     $85
     "LIMIT"
     $C5DE
     GetVar
;;;;;;;;;;

;; B/BUF
C5F6
     $85
     "B/BUF"
     $C5EA
     GetVar
;;;;;;;;;;

;; B/SCR
C602
     $85
     "B/SCR"
     $C5F6
     GetVar
;;;;;;;;;;

;; +ORIGIN
C60E
     $87
     "+ORIGIN"
     $C602
     COLON
;;;;;;;;;;

;; S0
C622
     $82
     "S0"
     $C60E
;;;;;;;;;;

;; R0
C62B
     $82
     "R0"
     $C622
     $C5A8
;;;;;;;;;;

;; TIB
C634
     $83
     "TIB"
     $C62B
     $C5A8
;;;;;;;;;;

;; WIDTH
C63E
     $85
     "WIDTH"
     $C634
     $C5A8
;;;;;;;;;;

;; WARNING
C64A
     $87
     "WARNING"
     $C63E
     $C5A8
;;;;;;;;;;

;; FENCE
C658
     $85
     "FENCE"
     $C64A
     $C5A8
;;;;;;;;;;

;; DP
C664
     $82
     "DP"
     $C658
     $C5A8
;;;;;;;;;;

;; VOC-LINK
C66D
     $88
     "VOC-LINK"
     $C664
     $C5A8
;;;;;;;;;;

;; BLK
6C7C
     $83
     "BLK"
     $C66D
     $C5A8
;;;;;;;;;;

;; IN
6C86
     $82
     "IN"
     $C67C
     $C5A8
;;;;;;;;;;

;; OUT
6C8F
     $83
     "OUT"
     $C686
     $C5A8
;;;;;;;;;;

;; OFFSET
C699
     $86
     "OFFSET"
     $C68F
     $C5A8
;;;;;;;;;;

;; CONTEXT
C6A6
     $87
     "CONTEXT"
     $C699
     $C5A8
;;;;;;;;;;

;; CURRENT
C6B4
     $87
     "CURRENT"
     $C6A6
     $C5A8
;;;;;;;;;;

;; STATE
C6C2
     $85
     "STATE"
     $C6B4
     $C5A8
;;;;;;;;;;

;; BASE
C6CE
     $84
     "BASE"
     $C6C2
     $C5A8
;;;;;;;;;;

;; DPL
C6D9
     $83
     "DPL"
     $C6CE
     $C5A8
;;;;;;;;;;

;; FLD
C6E3
     $83
     "FLD"
     $C6D9
     $C5A8
;;;;;;;;;;

;; CSP
C6ED
     $83
     "CSP"
     $C6E3
     $C5A8
;;;;;;;;;;

;; R#
C6F7
     $82
     "R#"
     $C6ED
     $C5A8
;;;;;;;;;;

;; HLD
C700
     $83
     "HLD"
     $C6F7
     GetVar
;;;;;;;;;;

;; COLUMNS
C70A
     $87
     "COLUMNS"
     $C700
     $C5A8
;;;;;;;;;;

;; 1+
C718
     $82
     "1+"
     $C70A
     COLON
;;;;;;;;;;

;; 2+
C725
     $82
     "2+"
     $C718
     COLON
;;;;;;;;;;

;; HERE
C732
     $84
     "HERE"
     $C725
     COLON
;;;;;;;;;;

;; 
C741 ALLOT
     $85
     "ALLOT"
     $C732
     COLON
;;;;;;;;;;

;; ,
C751
     $81
     ","
     $C741
     COLON
;;;;;;;;;;

;; C,
C761
     $82
     "C,"
     $C751
     COLON
;;;;;;;;;;

;; -
C772
     $81
     "-"
     $C761
-exec:	; Subtract Top of Stack From Second on Stack
C776 $C778

C778   L_C778   TSX  
C779            LDA A   $02,X
C77B            LDA B   $03,X
C77D            SUB B   $01,X
C77F            SBC A   $00,X
C781            INS  
C782            INS  
C783            TSX  
C784            JMP     L_C028

;; =
C787
     $81
     "="
     $C772
=exec:
C78B $C78D

C78D   L_C78D   PUL A
C78E            PUL B
C78F            TSX  
C790            SUB B   $01,X
C792            SBC A   $00,X
C794            STA B   $01,X
C796            STA A   $00,X
C798            JMP     L_C3E0

;; <
C79B
     $81
     "<"
     $C787
<exec:
C79F $C7A1

C7A1   L_C7A1   PUL A
C7A2            PUL B
C7A3            TSX  
C7A4            CMP A   $00,X
C7A6            INS  
C7A7            BGT     L_C7B2   
C7A9            BNE     L_C7AF   
C7AB            CMP B   $01,X
C7AD            BHI     L_C7B2   
C7AF   L_C7AF   CLR B
C7B0            BRA     L_C7B4   
C7B2   L_C7B2   LDA B   #$01
C7B4   L_C7B4   CLR A
C7B5            INS  
C7B6            JMP     PUSHD

;; >
C7B9
     $81
     ">"
     $C79B
     $C7BF

C7BF   L_C7BF   TSX  
C7C0            LDA A   $00,X
C7C2            LDA B   $02,X
C7C4            STA B   $00,X
C7C6            STA A   $02,X
C7C8            LDA A   $01,X
C7CA            LDA B   $03,X
C7CC            STA A   $03,X
C7CE            STA B   $01,X
C7D0            JMP     L_C7A1

;; U<
C7D3
     $82
     "U<"
     $C7B9
     $C7DA

C7DA   L_C7DA   PUL A
C7DB            PUL B
C7DC            TSX  
C7DD            CMP A   $00,X
C7DF            INS  
C7E0            BHI     L_C7EB   
C7E2            BNE     L_C7E8   
C7E4            CMP B   $01,X
C7E6            BHI     L_C7EB   
C7E8   L_C7E8   CLR B
C7E9            BRA     L_C7ED   
C7EB   L_C7EB   LDA B   #$01
C7ED   L_C7ED   CLR A
C7EE            INS  
C7EF            JMP     PUSHD

;; U>
C7F2
     $82
     "U>"
     $C7D3
     COLON
     SWAPexec; Swap Top of Stack with Next on Stack
     $C7D8
     ;Sexec

;; ROT
C7FF
     $83; Code
     "ROT"; Name
     $C7F2; Backward Link
     COLON
     $C3A7
     SWAPexec; Swap Top of Stack with Next on Stack
     R>exec
     SWAPexec; Swap Top of Stack with Next on Stack
     ;Sexec

;; SPACE
C811
     $85; Code
     "SPACE"; Name
     $C7FF; Backward Link
     COLON
;;;;;;;;;;

;; MIN
C821
     $83; Code
     "MIN"; Name
     $C811; Backward Link
     COLON
;;;;;;;;;;

;; MAX
C839
     $83; Code
     "MAX"; Name
     $C821; Backward Link
     COLON
;;;;;;;;;;

;; -DUP
C851
     $84; Code
     "-DUP"; Name
     $C839; Backward Link
     COLON
;;;;;;;;;;

;; TRAVERSE
C864
     $88; Code
     "TRAVERSE"
     $C851; Backward Link
     COLON
;;;;;;;;;;

;; LATEST
C88A
     $86; Code
     "LATEST"; Name
     $C864; Backward Link
     COLON
     $C6BE
     TOGGLEexec
     TOGGLEexec
     ;Sexec

;; LFA
C89D
     $83; Code
     "LFA"; Name
     $C88A; Backward Link
     COLON
;;;;;;;;;;

;; CFA
C8AC
     $83; Code
     "CFA"; Name
     $C89D; Backward Link
     COLON
;;;;;;;;;;

;; NFA
C8BA
     $83; Code
     "NFA"; Name
     $C8AC; Backward Link
     COLON
;;;;;;;;;;

;;; TRAILING
CA94
     $89; Code
     "-TRAILING"; Name
     $CA6B; Backward Link
     COLON
     DUPexec; Duplicate Top of Stack
     0refx
     (DO)exec
     OVERexec; Duplicate Second Item at Top of Stack
     OVERexec; Duplicate Second Item at Top of Stack
     +exec; Add Second on Stack To Top of Stack
     1refx
     $C776
     $C4F6
     $C5DA
     $C776
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0008; Branch Offset
     	$C393
     	$C096
     	$0006
     ENDIF
     1refx
     $C776
     (LOOP)exec
     $FFE0
     ;Sexec

;;; (.")
CACC
     $84; Code
     "(.")"; Name
     $CA94; Backward Link
     COLON; This is an entry for literal print
CAD3 Rexec
     $C72A
     $CA5F
     DUPexec; Duplicate Top of Stack
     $C71D
     $C3BD
     +exec; Add Second on Stack To Top of Stack
     $C3A7
     $CA72
??????????

;; FILL
CC1A
     $84; Code
     "FILL"; Name
     $CBE2; Backward Link
     $C53C
     $C491
     $C3A7
     $C472
     $C516
     $C4AA
     $C71D
     $C3BD
     1refx
     $C776
     $C285
     ;Sexec

;; ERASE
CC39
     $85; Code
     "ERASE"; Name
     $CC1A; Backward Link
     $C53C
     0refx
     $CC21
     ;Sexec

;; BLANKS
CC49
     $86; Code
     "BLANKS"; Name
     $CC39; Backward Link
     $C53C
     $C5DA
     $CC21
     ;Sexec

;; HOLD
CC5A
     $84; Code
     "HOLD"; Name
     $CC49; Backward Link
HOLDexec:
CC61 $CC49
     $C53C
     $C05D
     $FFFF
     $C706
     $C4B8
     $C706
     $C4E7
     $C516
     ;Sexec

D04D   Init1:   LDX     #Init2
D050            STX     $0000   
D052   BlkMov1: LDS     #$05BD
D055            LDX     #$D12A
D058   MovLop1: DEX  
D059            LDA A   $00,X
D05B            PSH A
D05C            CPX     #$D0BE
D05F            BNE     MovLop1   
D061            LDS     #$050F
D064            LDX     D_C022   
D067            STX     $053C   
D06A            LDX     D_C024   
D06D            STX     $053A   
D070            LDX     D_C020   
D073            STX     $0514   
D076            LDX     D_C01E   
D079            STX     $0512   
D07C            LDX     D_C01C   
D07F            STX     $0510   
D082            LDX     $0000   
D084            JMP     $00,X
D086   Init2:   LDS     #$050F
D089            LDX     #$C01C
D08C   MovLop2: DEX  
D08D            LDA A   $00,X
D08F            PSH A
D090            CPX     #$C012
D093            BNE     MovLop2   
D095            LDX     #$D01B
D098            STX     XSafe   
D09A            BRA     L_D0B0   
D09C   L_D09C   LDS     #$050F
D09F            LDX     #$C01C
D0A2   MovLop3: DEX  
D0A3            LDA A   $00,X
D0A5            PSH A
D0A6            CPX     #$C012
D0A9            BNE     MovLop3   
D0AB            LDX     #$D036
D0AE            STX     XSafe   
D0B0   L_D0B0   LDS     D_C012   
D0B3            LDX     D_C010   
D0B6            STX     $00F0   
D0B8            JSR     Init3   
D0BB            JMP     L_C371   

D0BE            FCB     $05,  $00,  $05,  $00,  $DB,  $C1,  $00,  $00
D0C6            FCB     $C5,  $46,  $4F,  $52,  $54,  $C8,  $DB,  $BA
D0CE            FCB     $CA,  $33,  $CF,  $50,  $81,  $A0,  $FF,  $48
D0D6            FCB     $00,  $00,  $C9,  $41,  $53,  $53,  $45,  $4D
D0DE            FCB     $42,  $4C,  $45,  $D2,  $05,  $5A,  $CA,  $33
D0E6            FCB     $CF,  $50,  $81,  $A0,  $F0,  $D0,  $05,  $6A
D0EE            FCB     $C6,  $45,  $44,  $49,  $54,  $4F,  $D2,  $05
D0F6            FCB     $6C,  $CA,  $33,  $CF,  $50,  $81,  $A0,  $05
D0FE            FCB     $66,  $05,  $80,  $28,  $43,  $29,  $20,  $46
D106            FCB     $6F,  $72,  $74,  $68,  $20,  $49,  $6E,  $74
D10E            FCB     $65,  $72,  $65,  $73,  $74,  $20,  $47,  $72
D116            FCB     $6F,  $75,  $70,  $2C,  $20,  $31,  $39,  $37
D11E            FCB     $39,  $84,  $54,  $41,  $53,  $CB,  $05,  $82
D126            FCB     $C5,  $3C,  $C3,  $7E,  $4A,  $65,  $72,  $72
D12E            FCB     $79,  $48,  $61,  $6E,  $65,  $79,  $84,  $53
D136            FCB     $2D,  $3E,  $C4,  $D0,  $44,  $C5,  $3C,  $C4
D13E            FCB     $AA,  $C3,  $F1,  $C4,  $38,  $C3,  $7E,  $81
D146            FCB     $AA,  $D1,  $34,  $D1,  $4B

D14B   L_D14B   JSR     S_C2C2   
D14E            INS  
D14F            INS  
D150   L_D150   JMP     NEXT

D39F   L_D39F   LDA A   #$20
D3A1            JSR     S_D3E3   
D3A4            LDX     #$D214
D3A7            PUL A
D3A8            PUL B
D3A9            BIT B   #$F0
D3AB            BEQ     L_D3B1   
D3AD            AND B   #$0F
D3AF            ADD B   #$0A
D3B1   L_D3B1   CMP B   #$14
D3B3            BMI     L_D3B7   
D3B5            LDA B   #$13
D3B7   L_D3B7   TST B
D3B8            BEQ     L_D3C5   
D3BA            DEC B
D3BB            LDA A   $00,X
D3BD            ADD A   #$01
D3BF   L_D3BF   INX  
D3C0            DEC A
D3C1            BNE     L_D3BF   
D3C3            BRA     L_D3B7   
D3C5   L_D3C5   LDA B   $00,X
D3C7   L_D3C7   INX  
D3C8            LDA A   $00,X
D3CA            JSR     S_D3E3   
D3CD            DEC B
D3CE            BNE     L_D3C7
D3D0   L_D3D0   JMP     NEXT   

D3D3            FCB     $87,  $4D,  $45,  $53,  $53,  $41,  $47,  $C5
D3DB            FCB     $D1,  $FF,  $C5,  $3C,  $D3,  $9D,  $C3,  $7E

D3E3   S_D3E3   STA B   $00E0   
D3E5            STX     $00E1   
D3E7   L_D3E7   LDA B   $0200   
D3EA            BEQ     L_D3E7   
D3EC            STA A   $0201   
D3EF            CLR     $0200   
D3F2            LDX     $00F0   
D3F4            STA B   $3E,X
D3F6            NOP  
D3F7            LDA B   $00E0   
D3F9            LDX     $00E1   
D3FB            RTS
  
D3FC   S_D3FC   STA B   $00E0   
D3FE            STX     $00E1   
D400   L_D400   LDA B   $0202   
D403            BEQ     L_D400   
D405            LDA A   $0203   
D408            CLR     $0202   
D40B            AND A   #$7F
D40D            LDX     $00F0   
D40F            STA B   $3F,X
D411            LDA B   $00E0   
D413            LDX     $00E1   
D415            RTS  
D416   S_D416   LDA A   $0202   
D419            AND A   #$11
D41B            BEQ     L_D422   
D41D            LDA A   $0203   
D420            LDA A   #$01
D422   L_D422   RTS  
D423   S_D423   LDA A   #$0D
D425            BSR     S_D3E3   
D427            LDA A   #$0A
D429            BSR     S_D3E3   
D42B            LDA A   #$7F
D42D            LDX     $00F0   
D42F            LDA B   $3B,X
D431   L_D431   DEC B
D432            BMI     L_D422   
D434            PSH B
D435            BSR     S_D3E3   
D437            PUL B
D438            BRA     L_D431

DBB7   L_DBB7   JMP     NEXT

;; THEN
D4D7
     $C4; Code
     "THEN"; Name
     $D4BB; Backward Link
D4DE $C53C
     $D4C3
     $C37E      

;; NOON
DBBA
     $84     
     "NOON"
     $DBA0
     $C034
     $00B6
     $DBC3

DCB3   DB 0; This is probably an error in the code
DBC4   Init3:   LDA A   D_DBC3; 0  
DBC7            LDA B   #$FF
DBC9            STA B   D_DBC3; Read Only Loc  
DBCC            LDA B   D_DBC3   
DBCF            STA A   D_DBC3; Read Only Loc   
DBD2            STA B   $021D   
DBD5            STA B   $021C   
DBD8            LDA A   #$25
DBDA            STA A   $CmdRegA   
DBDD            LDA A   #$35
DBDF            STA A   $CmdRegA   
DBE2            LDA A   #$45
DBE4            STA A   $CmdRegA   
DBE7            LDA A   #$55
DBE9            STA A   $CmdRegA   
DBEC            LDA A   #$15
DBEE            STA A   $CmdRegA   
DBF1            LDA A   #$93
DBF3            STA A   $ModeRegA   
DBF6            LDA A   #$07
DBF8            STA A   $ModeRegA   
DBFB            LDA A   #$BB
DBFD            STA A   $ClkRegA   
DC00            CLR A
DC01            STA A   $ImaskRgA   
DC04            LDA A   #$B0
DC06            STA A   $ACRA   
DC09            LDA A   #$03
DC0B            STA A   $602E   
DC0E            LDA A   #$13
DC10            STA A   $6000   
DC13            LDA A   #$11
DC15            STA A   $6000   
DC18            LDA A   #$FF
DC1A            STA A   $0200   
DC1D            CLR     $0201   
DC20            CLR     $0202   
DC23            CLR     $0203   
DC26            CLR     $020A   
DC29            CLR     $020B   
DC2C            CLR     $020C   
DC2F            CLR     $0206   
DC32            CLR     $020D   
DC35            CLR     fNMIOFF; Enable NMI  
DC38            CLR     $0205   
DC3B            LDX     #$1FFE
DC3E            JSR     S_DC42   
DC41            RTS
  
DC42   S_DC42   LDA A   #$AA
DC44            STA A   $01,X
DC46            LDA A   $01,X
DC48            CMP A   #$AA
DC4A            BNE     L_DC5B   
DC4C            LDA A   #$55
DC4E            STA A   $00,X
DC50            LDA A   $00,X
DC52            CMP A   #$55
DC54            BNE     L_DC5B   
DC56            STX     $0213   
DC59            PUL B
DC5A            PUL B
DC5B   L_DC5B   RTS
  
DC5C   NMILOC:  TST     fNMIOFF   
DC5F            BEQ     ProcNMI   
DC61            RTI
  
DC62   ProcNMI: LDX     #$020A
DC65            LDA A   $02,X
DC67            ADD A   #$01
DC69            STA A   $02,X
DC6B            LDA A   $01,X
DC6D            ADC A   #$00
DC6F            STA A   $01,X
DC71            LDA A   $00,X
DC73            ADC A   #$00
DC75            STA A   $00,X
DC77            LDX     $020E   
DC7A            DEX  
DC7B            STX     $020E   
DC7E            BNE     L_DCA3   
DC80            LDX     #$03E8
DC83            STX     $020E   
DC86            INC     $0212   
DC89            LDA A   $0212   
DC8C            CMP A   #$3C
DC8E            BMI     L_DCA3   
DC90            CLR     $0212   
DC93            INC     $0211   
DC96            LDA A   $0211   
DC99            CMP A   #$3C
DC9B            BMI     L_DCA3   
DC9D            CLR     $0211   
DCA0            INC     $0210   
DCA3   L_DCA3   LDA A   $0206   
DCA6            BEQ     L_DCAC   
DCA8            INC     $020D   
DCAB            RTI
  
DCAC   L_DCAC   COM     $0206   
DCAF            TST     $021C   
DCB2            BEQ     L_DCC2   
DCB4            JSR     S_DCCB   
DCB7            LDA A   $021D   
DCBA            BNE     L_DCC8   
DCBC            JSR     S_DD33   
DCBF            JMP     L_DD47   
DCC2   L_DCC2   JSR     S_DD09   
DCC5            JSR     S_DCF5   
DCC8   L_DCC8   JMP     L_DD47   
DCCB   S_DCCB   LDA B   $6000   
DCCE            BIT B   #$01
DCD0            BEQ     L_DCDD   
DCD2            LDA B   $6001   
DCD5   L_DCD5   STA B   $0203   
DCD8            LDA B   #$FF
DCDA            STA B   $0202   
DCDD   L_DCDD   LDA B   $6000   
DCE0            BIT B   #$02
DCE2            BEQ     L_DCF4   
DCE4            LDA B   $0200   
DCE7            BNE     L_DCF4   
DCE9            LDA B   $0201   
DCEC            STA B   $6001   
DCEF            LDA B   #$FF
DCF1            STA B   $0200   
DCF4   L_DCF4   RTS
  
DCF5   S_DCF5   LDA B   $6000   
DCF8            BIT B   #$01
DCFA            BEQ     L_DD08   
DCFC            LDA B   $6001   
DCFF            CMP B   #$0D
DD01            BNE     L_DD08   
DD03            STA B   $021C   
DD06            BRA     L_DCD5   
DD08   L_DD08   RTS
  
DD09   S_DD09   LDA B   $StatRegA   
DD0C            BIT B   #$01
DD0E            BEQ     L_DD1B   
DD10            LDA B   $RcvDtaA   
DD13   L_DD13   STA B   $0203   
DD16            LDA B   #$FF
DD18            STA B   $0202   
DD1B   L_DD1B   LDA B   $StatRegA   
DD1E            BIT B   #$04
DD20            BEQ     L_DD32   
DD22            LDA B   $0200   
DD25            BNE     L_DD32   
DD27            LDA B   $0201   
DD2A            STA B   $XmitDtaA   
DD2D            LDA B   #$FF
DD2F            STA B   $0200   
DD32   L_DD32   RTS
  
DD33   S_DD33   LDA B   $StatRegA   
DD36            BIT B   #$01
DD38            BEQ     L_DD46   
DD3A            LDA B   $RcvDtaA   
DD3D            CMP B   #$0D
DD3F            BNE     L_DD46   
DD41            CLR     $021C   
DD44            BRA     L_DD13   
DD46   L_DD46   RTS
  
DD47   L_DD47   LDX     D_BFFE   
DD4A            CPX     #$55AA
DD4D            BNE     L_DD54   
DD4F            LDX     D_BFFA   
DD52            JSR     $00,X
DD54   L_DD54   CLR     $0206   
DD57            LDA A   $0203   
DD5A            AND A   #$7F
DD5C            CMP A   #$02
DD5E            BNE     L_DD63   
DD60            JMP     L_C004   
DD63   L_DD63   CMP A   #$03
DD65            BNE     L_DD6A   
DD67            JMP     RSTLOC   
DD6A   L_DD6A   RTI
  
DD6B   RSTLOC   LDS     #$007F
DD6E            LDA A   #$55
DD70            STA A   $0206   
DD73            LDX     #$0080
DD76            CLR A
DD77            NOP  
DD78            NOP  
DD79            NOP  
DD7A            NOP  
DD7B            NOP  
DD7C            NOP  
DD7D            NOP  
DD7E            NOP  
DD7F            LDX     #$0000
DD82            STX     D_BFFE   
DD85            LDX     #$DD8D; Save rtn addr in 0
DD88            STX     $0000   
DD8A            JMP     BlkMov1; Effectively jsr   
DD8D   L_DD8D   LDS     #$007F
DD90            LDA A   #$55
DD92            STA A   $0206   
DD95            LDA B   #$FF
DD97            PSH B
DD98            LDX     #$0209
DD9B   L_DD9B   CLR     $00,X
DD9D            INX  
DD9E            CPX     #$021E
DDA1            BNE     L_DD9B   
DDA3            LDX     #$03E8
DDA6            STX     $020E   
DDA9            LDA A   #$FF
DDAB            STA A   $0215   
DDAE            LDX     D_BFFE   
DDB1            CPX     #$55AA
DDB4            BNE     L_DDBB   
DDB6            LDX     D_BFF8   
DDB9            JSR     $00,X
DDBB   L_DDBB   PUL B
DDBC            TST B
DDBD            BNE     L_DDC2   
DDBF            JMP     L_D09C   
DDC2   L_DDC2   JMP     L_C000   
DDC5   IRQLOC   LDA A   $0209   
DDC8            BEQ     L_DDD7   
DDCA            LDX     D_BFFE   
DDCD            CPX     #$55AA
DDD0            BNE     L_DDD7   
DDD2            LDX     D_BFFC   
DDD5            JSR     $00,X
DDD7   L_DDD7   RTI
  
DDD8   SWILOC   LDX     D_BFFE   
DDDB            CPX     #$55AA
DDDE            BNE     L_DDE5   
DDE0            LDX     D_BFF6   
DDE3            JSR     $00,X
DDE5   L_DDE5   RTI

org $E9AA
                dw $7E84
		db "BHI"; Op Code 22
		dw $ACE8,$6265,$3CC0,$5D00,$22E8,$38C3
		dw $7E84
		db "BLS"; Op Code 23
		dw $ACE9,$ABC5,$3CC0,$5D00,$23E8,$38C3
		dw $7E84
		db "BCC"; Op Code 24
		dw $ACE9,$BCC5,$3CC0,$5D00,$24E8,$38C3
                dw $7E84
		db "BCS"; Op Code 22
		dw $ACE9,$CDC5,$3CC0,$5D00,$24E8,$38C3
		dw $7E84
		db "BNE"; Op Code 23
		dw $ACE9,$DEC5,$3CC0,$5D00,$26E8,$38C3
		dw $7E84
		db "BEQ"; Op Code 24
		dw $ACE9,$EFC5,$3CC0,$5D00,$27E8,$38C3

FC5E   L_FC5E   CLR B
FC5F            LDA A   #$25
FC61            STA A   $602A   
FC64            LDA A   #$35
FC66            STA A   $602A   
FC69            LDA A   #$45
FC6B            STA A   $602A   
FC6E            LDA A   #$55
FC70            STA A   $602A   
FC73            LDA A   #$15
FC75            STA A   $602A   
FC78            LDA A   #$83
FC7A            STA A   $ModeRegB   
FC7D            LDA A   #$07
FC7F            STA A   $ModeRegB   
FC82            LDA A   #$99
FC84            STA A   $ClkRegB   
FC87            LDX     #PrintBuf
FC8A            STX     $0A82   
FC8D            STX     PBufPtr   
FC90            LDX     #$55AA
FC93            STX     $0A8C   
FC96   L_FC96   JMP     NEXT

;; PRNTRDY?
FC99
     $88
     PRNTRDY?
     $FC50
     $FCA6

FCA6   S_FCA6   LDA A   $StatRegB   
FCA9            AND A   #$04; Xmit Rdy?
FCAB            BNE     L_FCB0; Yes, Print   
FCAD            RTS  

FCAE            FCB     $20,  $0C

FCB0   L_FCB0   LDA A   $PortChg   
FCB3            AND A   #$04
FCB5            BNE     L_FCBB   
FCB7            LDA A   #$FF
FCB9            BRA     L_FCBC   
FCBB   L_FCBB   CLR A
FCBC   L_FCBC   RTS
  
FCBD   L_FCBD   JMP     NEXT

;; PRNTER!
FCC0
     $87
     PRNTER!
     $FC99
     $FCCC

FCCC   S_FCCC   LDX     #$0000
FCCF            STX     $0A8A   
FCD2            LDX     #$0FA0
FCD5            STX     $067E   
FCD8            LDX     PBufPtr   
FCDB            LDA A   $00,X; Get char from PrintBuf
FCDD            STA A   XmitDtaB   
FCE0            INX; Incr PBufPtr 
FCE1            CPX     #$0A7F; End of PrintBuf?
FCE4            BNE     SavePtr; no   
FCE6            LDX     #PrintBuf; Point back to beginning
FCE9   SavePtr: STX     PBufPtr   
FCEC            RTS
 
FCED   L_FCED   JMP     NEXT

FCF0
     $89
     "CHK-PRINT"
     $FCC0
     $FCFE

FCFE   S_FCFE   LDX     $0A8C   
FD01            CPX     #$55AA
FD04            BEQ     L_FD07   
FD06            RTS
  
FD07   L_FD07   LDA A   $0A88   
FD0A            BEQ     L_FD1C   
FD0C            JSR     S_FCA6   
FD0F            TST A
FD10            BEQ     L_FD1B   
FD12            LDX     #$0000
FD15            STX     $0A88   
FD18            STX     $0A8A   
FD1B   L_FD1B   RTS
  
FD1C   L_FD1C   LDX     $0A84   
FD1F            CPX     $0A82   
FD22            BNE     L_FD2B   
FD24            LDX     #$0FA0
FD27            STX     $067E   
FD2A            RTS
  
FD2B   L_FD2B   JSR     S_FCA6   
FD2E            TST A
FD2F            BNE     L_FD42   
FD31            LDX     $067E   
FD34            BNE     L_FD3D   
FD36            LDX     #$FFFF
FD39            STX     $0A8A   
FD3C            RTS
 
FD3D   L_FD3D   DEX  
FD3E            STX     $067E   
FD41            RTS
  
FD42   L_FD42   JSR     S_FCCC   
FD45            RTS
 
FD46   L_FD46   JMP     NEXT   

FD49            FCB     $88,  $50,  $72,  $6E,  $74,  $43,  $68,  $61
FD51            FCB     $F2,  $FC,  $F0,  $FD,  $56,  $B6,  $0A,  $88
FD59            FCB     $BA,  $0A,  $8A,  $27,  $05,  $32,  $33

FD60   L_FD60   JMP     NEXT   

FD63            FCB     $FE,  $0A,  $82,  $32,  $33,  $E7,  $00,  $08
FD6B            FCB     $8C,  $0A,  $7F,  $26,  $03,  $CE,  $06,  $80
FD73            FCB     $B6,  $0A,  $8A,  $27,  $03

FD78   L_FD78   JMP     NEXT


