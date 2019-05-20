* OmniBasic Copyright 1995,1996,1997,1998,1999, 2000 Computer Design Lab
* All Rights Reserved
*
* This source file is provided for educational, documentation, and porting
* purposes only. The recipient agrees to hold this information in strict
* confidence. The recipient agrees to these terms by accepting this software
* source code. Violations may result in criminal and/or civil penalties under
* the copyright and trade secret laws of the United States of America.

* Edition History
* 12-14-95 CDL Basic release 2.0 as base for adaptation
* 04-26-96 Release 1.0
* 05-12-96 Misc bug fixes (sbrtn, backslash, error exit, AccMode)
* 05-12-96 Added function variables (private), Added TRIM$()
* 05-14-96 Release 1.01
* 05-16-96 Change to allow binary create (MSDOS)
* 05-16-96 Begin changing of subroutines to functions
* 05-16-96 Release 1.02
* 05-17-96 Clean up DIM inside functions, fix EXITIF/ENDEXIT
* 05-19-96 Add \" capability
* 05-20-96 Release 1.03
* 05-21-96 Fix TermLabel on LOOP/ENDLOOP and REPEAT/UNTIL
* 05-21-96 Fix CREATE for os9 version (close the file after trial open)
* 05-21-96 Release 1.04
* 05-21-96 Add OS/2
* 05-23-96 Fix SEEK to allow FLOAT arg, Add (* detection
* 05-23-96 Release 1.05
* 05-24-96 Touch up FOR, Remove HexString
* 05-29-96 Add _PrtPthNum, fix _IOBuffer and _PrtBuf for FCN's
* 06-05-96 Allow VECTOR in FCN DIM
* 06-05-96 Release 1.06
* 06-06-96 Fix problem concerning VECTORS as function args
* 06-06-96 Fix FOR to check data types for TO and STEP
* 06-07-96 Fix EOF for MSDOS and OS/2
* 06-07-96 Release 1.07
* 06-13-96 Add Multi-Diminsioned Arrays
* 06-14-96 Release 1.08
* 06-16-96 Fix bug in BUFREAD/WRITE addr()...(remove IO test in Vectorize)
* 06-16-96 Redo FOR/NEXT
* 06-17-96 Release 1.09
* 06-25-96 Fix bug in single dim arr concerneing "array subscript error'
* 06-25-96 Release 1.10
* 06-30-96 Fix bug in extern(al) declaration of _IOBuffer and _PrintBuf
* 07-02-96 Add P_READ to CREATE args (for Linux)
* 07-02-96 Release 1.11
* 07-08-96 Fix floating point problem
* 07-08-96 Release 1.12
* 07-12-96 Redo floating point again (this time with feeling)
* 07-12-96 Release 1.13
* 07-14-96 Change PRINT and INPUT for multiple args
* 07-14-96 Release 1.14
* 07-17-96 Fix subscript/float problem, declare cpx as short/2
* 07-17-96 Release 1.15
* 07-21-96 Fix INPUT Line Feed bug where Newline=$0d, Fix NoStep flag
* 07-21-96 Add -d option and Auto_Declare feature
* 07-21-96 Release 1.16
* 07-25-96 Fix MakString to use FloatFlag
* 07-25-96 Release 1.17
* 01-28-97 Mod 1.17 for COL Linux to use -lm
* 04-28-97 Fix AutoDim on INPUT and READ
* 04-28-97 Fix LastStmt problem concerning null lines at end (DATA stmt prob)
* 04-28-97 Fix Vectorizing problem with WRITE
* 04-28-97 Release 1.18
* 05-14-97 Convert OS/2 version to use dynamic libraries
* 05-14-97 Allow .b or .B for filename suffix (extension)
* 05-14-97 Release 1.19
* 05-19-97 Add -s for GNU versions
* 05-19-97 Release 1.20
* 05-29-97 Add -w, -l (and associated windows functionality)
* 05-29-97 Add CType=6 (Win95/NT version)
* 06-01-97 Allow up to 16 MACRO args (was 9), add -p
* 06-02-97 Release 1.21
* 06-16-97 Add -w, -n, modify argc--, fl_initialize
* 06-17-97 Add STARTWIN statement, FORM, OBJECT data types, SHOW statement
* 06-17-97 Add object names to pre-defined symbols
* 06-19-97 Add window object dispatching and decoding
* 06-19-97 Fix bug involving #IF/#ELSE/#ENDIF testing in conditional section
* 06-23-97 Add ON OBJECT, other XFORMS statements. Max symbols->2500
* 06-30-97 Add more objects, object functions, and object statements
* 07-03-95 Release 1.22 BETA
* 07-05-97 Add Timer, Chart, and Positioner with associated functions etc.
* 07-05-97 Add var SetObjNam for SETOBJECT (fix name conflict with UsrFcnNam)
* 07-05-97 Fix Float functions with INC FloatFlag, Max symbols->2700
* 07-06-97 Release 1.23 BETA
* 07-07-97 Add protyping for lib functions, fix ansi lvalue problem
* 07-08-97 Put table lookup on SETOBJECT
* 07-09-97 Add RANDOMIZE statement and RND() function
* 07-14-97 Add FDESIGN Support, check for 'junk' after op2 on LET
* 07-14-97 Preprocess input lines to remove spaces next to operators
* 07-15-97 Change VOID datatype to VOIDX to appease the SAS compiler
* 07-16-97 Make brower callback respond only to doubleclick
* 07-31-97 Finish XFORMS for now
* 08-01-97 Release 1.25
* 08-06-97 Add SELECT CASE, allow END IF or ENDIF etc.
* 08-08-97 Release 1.26
* 08-16-97 Fix optional 'THEN" problem, add HHH (Amiga stuff)
* 08-16-97 Fix #FCN for ansi proto, _d0=0 etc. AFTER PARAM's AND DIM's
* 08-16-97 Release 1.28
* 08-20-97 Create BSD Version
* 08-20-97 Create HP-UX Version, SCO Version
* 09-01-97 Make DataMod 16 bit, Add WinMod
* 09-02-97 Add PROGRAM and HEXOUT statements, allow Intel and C style hex input
* 09-03-97 Add ANSI style file I/O, modify _ltoh.c for above
* 09-04-97 Release 1.30
* 09-05-97 Modify _strlen.c for speed
* 09-05-97 Add LCASE$(), UCASE$(), MAKELOWER, MAKEUPPER
* 09-05-97 Add [third arg] to SUBSTR, modify _substr.c accordingly
* 09-07-97 Release 1.31
* 09-08-97 Add REMNANT$(), _remant.c to lib, add FILL, fix PEEK() bug, add INIT
* 09-08-97 Add FINDADDR() and FINDOFFS()
* 09-08-97 Release 1.32
* 09-10-97 Fix tab char in col 1 problem, fix ANSIFlag/ANSIFile mistake
* 09-10-97 Release 1.33
* 09-14-97 Fix "false end" problem, add Personal and Commercial versions
* 09-14-97 Release 1.34
* 09-16-97 Enhance preprocessor to handle free format
* 09-16-97 Release 1.36 (1.35 was intermediate version)
* 09-22-97 Fix HP long boundary problem, add -O after gcc for HP-UX
* 09-22-97 Release 1.37
* 10-13-97 Add ProgramName special variable to identify 'self'
* 10-15-97 Misc bug fixes, fix GET/PUT/READ/WRITE bug for structures/arrays
* 10-15-97 Release 1.38
* 10-22-97 Fix bug concerning array args to user fcns
* 10-22-97 Release 1.39
* 10-25-97 Add SETBUFADR statement
* 10-28-97 Fix bug concerning SEEK for ANSI file I/O
* 10-28-97 Release 1.40
* 10-30-97 Remove GetDataWd fcn (was same as GetDtaTyp)
* 10-30-97 Release 1.41
* 11-02-97 Experimental version 1.42 In-house use only
* 01-17-98 Fix bug concerning mixed floats/integers in concatenation expr
* 01-17-98 Replace "cat", "merge", etc. with BUFFER code
* 01-17-98 Replace "rm" etc. with DELETE statements
* 01-17-98 Remove "-lm", add ".exe" for new Win95/NT version
* 01-17-98 Release 1.43
* 02-07-99 Fix '[' in column 1

****** Command Line Defaults ******
#SET _exp=0
#SET CType=6\ Windows default
#SET Version=0
#SET risc=0
* Version: 0=Commercial, 1=Demo (Evaluation)
#SET WinType=0

****** Subroutine Declarations ******

#FCN Add() VOID
#FCN AddLftGrp() VOID
#FCN AddMulti() VOID
#FCN AddRtGrp1() VOID
#FCN AddRtGrp2() VOID
#FCN And() VOID
#FCN BldComment() VOID
#FCN BldOffset() VOID
#FCN BufRW() VOID
#FCN CSChk() VOID
#FCN CallErr() VOID
#FCN ClassOp() VOID
#FCN ClassOp1() VOID
#FCN ClrDatTyp() VOID
#FCN ClrERR() VOID
#FCN ClrSym() VOID
#FCN ClrSymTab() VOID
#FCN CmdLine() VOID
#FCN CmpBool() VOID
#FCN CmpNum() VOID
#FCN CmpOps() VOID
#FCN CmpString() VOID
#FCN DateTime() VOID
#FCN DecVar() VOID
#FCN DevChk() VOID
#FCN DimVar() VOID
#FCN Div() VOID
#FCN EndCasex() VOID
#FCN Expr() VOID
#SBRTN F0\ REM  EOF
#SBRTN F1\ REM  LEN
#SBRTN F2\ REM  STR$
#SBRTN F3\ REM  VAL
#SBRTN F4\ REM  LAND
#SBRTN F5\ REM  MID$
#SBRTN F6\ REM  LOR
#SBRTN F7\ REM  LEFT$
#SBRTN F8\ REM  MOD
#SBRTN F9\ REM  CHR$
#SBRTN F10\ REM  RIGHT$
#SBRTN F11\ REM  ASC
#SBRTN F12\ REM  NOT
#SBRTN F13\ REM  BUFADR
#SBRTN F14\ REM  BUFSIZ
#SBRTN F15\ REM  TAB
#SBRTN F16\ REM  PEEK
#SBRTN F17\ REM  ADDR
#SBRTN F18\ REM  LXOR
#SBRTN F19\ REM  LNOT
#SBRTN F20\ REM  INDEX
#SBRTN F21\ REM  SIZE
#SBRTN F22\ REM  IVAL
#SBRTN F23\ REM  FVAL
#SBRTN F24\ REM  TRM$
#SBRTN F25\ REM  FILSIZ
#SBRTN F26\ REM  FILPOS
#SBRTN F27\ REM  SQR
#SBRTN F28\ REM  INT
#SBRTN F29\ REM  ABS
#SBRTN F30\ REM  SIN
#SBRTN F31\ REM  COS
#SBRTN F32\ REM  TAN
#SBRTN F33\ REM  ASN
#SBRTN F34\ REM  ACS
#SBRTN F35\ REM  ATN
#SBRTN F36\ REM  LOG
#SBRTN F37\ REM  LOG10
#SBRTN F38\ REM  GETMENU
#SBRTN F39\ REM  GETFILE
#SBRTN F40\ REM  THOUR
#SBRTN F41\ REM  TMIN
#SBRTN F42\ REM  TSEC
#SBRTN F43\ REM  TYEAR
#SBRTN F44\ REM  TMON
#SBRTN F45\ REM  TDAT
#SBRTN F46\ REM  TDAY
#SBRTN F47\ REM  MBUTTON
#SBRTN F48\ REM  HEX$
#SBRTN F49\ REM  BITTST
#SBRTN F50\ REM  SHL
#SBRTN F51\ REM  SHR
#SBRTN F52\ REM  ROL
#SBRTN F53\ REM  ROR
#SBRTN F54\ REM  BITCHG
#SBRTN F55\ REM  BITCLR
#SBRTN F56\ REM  BITSET
#SBRTN F57\ REM  SUBSTR
#SBRTN F58\ REM  ZSTR$
#SBRTN F59\ REM  ZHEX$
#SBRTN F60\ REM  USING
#SBRTN F61\ REM  COLORMAP
#SBRTN F62\ REM  GETINPUT
#SBRTN F63\ REM  POPINPUT
#SBRTN F64\ REM  POPQUESTION
#SBRTN F65\ REM  GETBUTTON
#SBRTN F66\ REM  GETCHOICE
#SBRTN F67\ REM  GETBROWSER
#SBRTN F68\ REM  GETVALUE (Slider, Counter, Dial, Timer)
#SBRTN F69\ REM  GETPOSX
#SBRTN F70\ REM  GETPOSY
#SBRTN F71\ REM  RND
#SBRTN F72\ REM  BELOWMOUSE
#SBRTN F73\ REM  GETX
#SBRTN F74\ REM  GETY
#SBRTN F75\ REM  GETW
#SBRTN F76\ REM  GETH
#SBRTN F77\ REM  LCASE$
#SBRTN F78\ REM  UCASE$
#SBRTN F79\ REM  REMNANT$
#SBRTN F80\ REM  FINDADDR
#SBRTN F81\ REM  FINDOFFS

#FCN FDInit() VOID
#FCN FDGetObjTyp() VOID
#FCN FDGetObjCls() VOID
#FCN FDLook() VOID
#FCN FcnRegs() VOID
#FCN GenCase() VOID
#FCN GenObject() VOID
#FCN GenXfrCnt() VOID
#FCN GetAccMod() VOID
#FCN GetBase() VOID
#FCN GetChrVec() VOID
#FCN GetColon() VOID
#FCN GetComma() VOID
#FCN GetDtaTyp() VOID
#FCN GetEqual() VOID
#FCN GetExp() VOID
#FCN GetFilePtr() VOID
#FCN GetFltOp() VOID
#FCN GetFltTmp() VOID
#FCN GetIntOp() VOID
#FCN GetIntTmp() VOID
#FCN GetLopVec() VOID
#FCN GetOpSize() VOID
#FCN GetPthNum() VOID
#FCN GetPthNum1() VOID
#FCN GetPthNum2() VOID
#FCN GetPthNam() VOID
#FCN GetPut() VOID
#FCN GetRP1() VOID
#FCN GetRegPrm() VOID
#FCN GetStrVec() VOID
#FCN GetTmp() VOID
#FCN GetTmpVec() VOID
#FCN GetVarSiz() VOID
#FCN GtRootSym() VOID
#FCN IncConStk() VOID
#FCN IncExpNdx() VOID
#FCN KeyLook() VOID
#FCN LoadReg() VOID
#FCN LookUp() VOID
#FCN MacDefInc() VOID
#FCN MacToken() VOID
#FCN MakString() VOID
#FCN MakTmpVec() VOID
#FCN MidLftRt() VOID
#FCN Mul() VOID
#FCN MultiInsert() VOID
#FCN NexToken() VOID
#FCN NexToken3() VOID
#FCN NumToA() VOID
#FCN Or() VOID
#FCN OutCRLF() VOID
#FCN OutCode() VOID
#FCN OutFcn() VOID
#FCN OutMain() VOID
#FCN OutVar() VOID
#FCN OutLabel() VOID
#FCN OutNewLine() VOID
#FCN OutRead() VOID
#FCN OutWrite() VOID
#FCN ParenScan() VOID
#FCN ParseOpt() VOID
#FCN PreScan() VOID
#FCN PreScan1() VOID
#FCN ProcExp() VOID
#FCN ProcKonst() VOID
#FCN ReadSource() VOID
#FCN ReadWrite() VOID
#FCN RegInit() VOID
#FCN Remark() VOID
#FCN ReqTmpVec() VOID
#FCN SETDx1() VOID
#FCN SetStrVec() VOID
#FCN SetTmpVec() VOID
#FCN SolveTerm() VOID
#FCN SOLook() VOID
#FCN SquishExp() VOID
#FCN StoreD0() VOID
#FCN StrSiz() VOID
#FCN Sub() VOID
#FCN SubLoad() VOID
#FCN SymInsert() VOID
#FCN SymSearch() VOID
#FCN SymSrch() VOID
#FCN TokenSym() VOID
#FCN TokenSym1() VOID
#FCN UnBlkFcn() VOID
#FCN UnDoToken() VOID
#FCN Unary() VOID
#FCN ValidFlt() VOID
#FCN ValidHex() VOID
#FCN ValidInt() VOID
#FCN ValidSym() VOID
#FCN VarBlank() VOID
#FCN VecString() VOID
#FCN VecSymNam() VOID
#FCN Vectorize() VOID

* MACROS

#MACRO CommaRet
 GetComma()
 ErrRet
#ENDM

#MACRO CommaMain
 GetComma()
 ErrMain
#ENDM

#MACRO ColonRet
 GetColon()
 ErrRet
#ENDM

#MACRO ColonMain
 GetColon()
 ErrMain
#ENDM

#MACRO EqualRet
 GetEqual()
 ErrRet
#ENDM

#MACRO EqualMain
 GetEqual()
 ErrMain
#ENDM

#MACRO InitReg0
 D0Loaded=0
#ENDM

#MACRO MakeLong
 IF TDataMod&AddrBit=AddrBit THEN
	TDataType=LONG
 ENDIF
#ENDM

#MACRO RET
 if 0=0 then
	return
 endif
#ENDM

#MACRO GenCode
 OutCode()
#ENDM

#MACRO GenVar
 OutVar()
#ENDM

#MACRO GenMain
 OutMain()
#ENDM


#MACRO GenFcn
 OutFcn()
#ENDM

#MACRO GenRead
 OutRead()
#ENDM

#MACRO GenWrite
 OutWrite()
#ENDM

#MACRO GenCRLF
 OutCRLF()
#ENDM

#MACRO GenNewLine
 OutNewLine()
#ENDM

#MACRO ErrRet
;if (ErrNo) return;
#ENDM

#MACRO ErrMain
;if (ErrNo) goto MainLoop;
#ENDM

#SET os9_68020=0
#SET msdos=1
#SET Linux=2
#SET os9_68000=3
#SET os2=4
#SET os9000=5
#SET nt=6
#SET amiga=7

#SET ErrUDSym=1
#SET ErrIVSNam=2
#SET ErrTypMis=3
#SET ErrIVExp=4
#SET ErrSyntax=5
#SET ErrDupSym=6
#SET ErrSymFul=7
#SET ErrUDFcn=8
#SET ErrIVType=9
#SET ErrIVMod=10
#SET ErrMacArg=11
#SET ErrIVDir=12
#SET ErrDupMac=13
#SET ErrEndStr=14
#SET ErrMacNst=15
#SET ErrMacBuf=16
#SET ErrIVMac=17
#SET ErrEndm=18
#SET ErrUBCon=19
#SET ErrNDeep=20
#SET ErrDecFcn=21
#SET ErrIVParm=22
#SET ErrParam=23
#SET ErrCpxExp=24
#SET ErrIVFunc=25
#SET ErrTmpUse=26
#SET ErrParen=27
#SET ErrFcn=28
#SET ErrIVTarg=29
#SET ErrFSNest=30
#SET ErrPrmCnt=31
#SET ErrERRTrp=32
#SET ErrArrSub=33

#SET COMPVAR=0
#SET BOOLEAN=1
#SET BYTE=2
#SET SHORT=3
#SET LONG=4
#SET FLOAT=5
#SET STRING=6
#SET LABEL=7
#SET MACRO=8
#SET OPER=9
#SET FCN=10
#SET PROC=11
#SET STRUCT=12
#SET VOIDX=13
#SET COMPLEX=14
#SET BUFFER=15
#SET FORM=16
#SET OBJECT=17

#SET ArrayBit=$0001
#SET AddrBit=$0002
#SET ConstBit=$0004
#SET MultiBit=$0008
#SET MemberBit=$0010
#SET VectorBit=$0020
#SET TempBit=$0040
#SET DataBit=$0080
#SET FileBit=$0100
#SET TmpVec=$60
#SET ArrayMsk=$fffe
#SET AddrOrFile=$0101

#SET NULLClass=0
#SET INTClass=1
#SET STRClass=2
#SET ARRClass=3
#SET CPXClass=4
#SET FLTClass=5
#SET BOOLClass=6
#SET OBJClass=7
#SET FRMClass=8

#SET TTypRelOp=1
#SET TTypPunct=2
#SET TTypMath=3
#SET TTypQuote=4
#SET TTypSym=5
#SET TTypInt=6
#SET TTypHex=7
#SET TTypParen=8
#SET TTypMisc=9
#SET TTypFloat=10

*#IF WinType=1

* Object Classes (DataAddr)-->(Detail | Object Subclass)
#SET OBJ_BUTTON=$100
#SET OBJ_BOX=$200
#SET OBJ_SLIDER=$300
#SET OBJ_BROWSER=$400
#SET OBJ_TEXT=$500
#SET OBJ_MENU=$600
#SET OBJ_INPUT=$700
#SET OBJ_FRAME=$800
#SET OBJ_CLOCK=$900
#SET OBJ_BITMAP=$a00
#SET OBJ_PIXMAP=$b00
#SET OBJ_CHOICE=$c00
#SET OBJ_BROWSER=$d00
#SET OBJ_COUNTER=$e00
#SET OBJ_DIAL=$f00
#SET OBJ_TIMER=$1000
#SET OBJ_CHART=$2000
#SET OBJ_POSITIONER=$3000
#SET OBJ_GROUP=$4000
#SET OBJ_CANVAS=$5000
#SET OBJ_XYPLOT=$6000

* Object Subclasses (Detail)
#SET NORMAL_BUTTON=1
#SET PUSH_BUTTON=2
#SET TOUCH_BUTTON=3
#SET RADIO_BUTTON=4
#SET MENU_BUTTON=5
#SET HIDDEN_BUTTON=6
#SET INOUT_BUTTON=7
#SET RETURN_BUTTON=8
#SET HIDDEN_RET_BUTTON=9
#SET NO_BOX=10
#SET UP_BOX=11
#SET DOWN_BOX=12
#SET BORDER_BOX=13
#SET SHADOW_BOX=14
#SET FRAME_BOX=15
#SET ROUNDED_BOX=16
#SET EMBOSSED_BOX=17
#SET FLAT_BOX=18
#SET RFLAT_BOX=19
#SET RSHADOW_BOX=20
#SET OVAL_BOX=21
#SET ROUNDED3D_UPBOX=22
#SET ROUNDED3D_DOWNBOX=23
#SET OVAL3D_UPBOX=24
#SET OVAL3D_DOWNBOX=25
#SET PUSH_MENU=26
#SET PULLDOWN_MENU=27
#SET TOUCH_MENU=28
#SET NORMAL_INPUT=29
#SET FLOAT_INPUT=30
#SET INT_INPUT=31
#SET DATE_INPUT=32
#SET MULTILINE_INPUT=33
#SET SECRET_INPUT=34
#SET HIDDEN_INPUT=35
#SET NO_FRAME=36
#SET UP_FRAME=37
#SET DOWN_FRAME=38
#SET BORDER_FRAME=39
#SET ENGRAVED_FRAME=40
#SET EMBOSSED_FRAME=41
#SET ROUNDED_FRAME=42
#SET OVAL_FRAME=43
#SET ANALOG_CLOCK=44
#SET DIGITAL_CLOCK=45
#SET NORMAL_BITMAP=46
#SET NORMAL_PIXMAP=47
#SET NORMAL_TEXT=48
#SET NORMAL_CHOICE=49
#SET DROPLIST_CHOICE=50
#SET NORMAL_BROWSER=51
#SET SELECT_BROWSER=52
#SET MOLD_BROWSER=53
#SET MULTI_BROWSER=54
#SET VERT_SLIDER=55
#SET HOR_SLIDER=56
#SET VERT_FILL_SLIDER=57
#SET HOR_FILL_SLIDER=58
#SET VERT_NICE_SLIDER=59
#SET HOR_NICE_SLIDER=60
#SET VERT_BROWSER_SLIDER=61
#SET HOR_BROWSER_SLIDER=62
#SET NORMAL_COUNTER=63
#SET SIMPLE_COUNTER=64
#SET NORMAL_DIAL=65
#SET LINE_DIAL=66
#SET FILL_DIAL=67
#SET NORMAL_TIMER=68
#SET VALUE_TIMER=69
#SET HIDDEN_TIMER=70
#SET BAR_CHART=71
#SET HORBAR_CHART=72
#SET LINE_CHART=73
#SET FILLED_CHART=74
#SET SPIKE_CHART=75
#SET PIE_CHART=76
#SET SPECIALPIE_CHART=77
#SET NORMAL_POSITIONER=78
#SET NORMAL_GROUP=79
#SET END_GROUP=80\ REM used only to keep objtyp table in sync
#SET NORMAL_CANVAS=81
#SET SCROLLED_CANVAS=82
#SET NORMAL_XYPLOT=83
#SET SQUARE_XYPLOT=84
#SET CIRCLE_XYPLOT=85
#SET FILLED_XYPLOT=86
#SET POINTS_XYPLOT=87
#SET DASHED_XYPLOT=88
#SET IMPULSE_XYPLOT=89
#SET ACTIVE_XYPLOT=90
#SET EMPTY_XYPLOT=91

* Object Types (DataMod)
#SET BUTTON=1
#SET CHECKBUTTON=2
#SET ROUNDBUTTON=3
#SET PIXMAPBUTTON=4
#SET BITMAPBUTTON=5
#SET LIGHTBUTTON=6
#SET ROUND3DBUTTON=7
#SET BOX=8
#SET MENU=9
#SET INPUT=10
#SET FRAME=11
#SET LABELFRAME=12
#SET CLOCK=13
#SET BITMAP=14
#SET PIXMAP=15
#SET TEXT=16
#SET CHOICE=17
#SET BROWSER=18
#SET SLIDER=19
#SET VALSLIDER=20
#SET COUNTER=21
#SET DIAL=22
#SET TIMER=23
#SET CHART=24
#SET POSITIONER=25
#SET GROUP=26
#SET ENDGROUP=27
#SET CANVAS=28
#SET GLCANVAS=29
#SET XYPLOT=30

*#ENDIF\ REM WinType=1

#SET VoidFcn=0
#SET IntFcn=1
#SET DblFcn=2

#SET ParamSize=32

#SET NumTemps=15

#SET _BufSize=300
#SET MacBufSiz=20000
#SET ExpTabSiz=100
#SET UserSym=374\ REM  set to first user symbol in PreDefined

#IF Version=0
#SET SymTabSiz=3500
#ENDIF

#IF Version=1
#SET SymTabSiz=UserSym+200
#ENDIF

 DIM HexType:BYTE
 DIM ANSIArgs(9):STRING[5]
 DIM FilBufSiz:LONG
 DIM FilBufAdr:LONG
 DIM ANSIArgCtr:LONG
 DIM ObjForm:STRING[6]
 DIM ObjType:BYTE
 DIM ColorArgs:BYTE
 DIM Color:STRING[28]
 DIM ColorName:STRING[28]
 DIM ObjClass:LONG
 DIM TempObjClass:LONG
 DIM ObjSubClass:LONG
 DIM FormFlag:BYTE
 DIM GroupFlag:BYTE
 Dim FormGroup:BYTE
 DIM Place:BYTE
 DIM PromptFlag:BYTE
 DIM ProcedureFlag:BYTE
 DIM WinFlag:BYTE
 DIM XWinFlag:BYTE
 DIM ANSIFile:BYTE
 DIM AnyWinFlag:BYTE
 DIM DLLFlag:BYTE
 DIM EnableAuto:BYTE
 DIM AutoDim:BYTE
 DIM FloatFlag:BYTE
 DIM ExpFlag:BYTE
 DIM XSize:LONG
 DIM YSize:LONG
 DIM MultiNdx:LONG
 DIM LastMulti:LONG
 DIM FcnMulti:LONG
 DIM SubCtr:BYTE
 DIM SubCtrSaf:BYTE
 DIM MultiFlag:BYTE
 DIM DbgFlag:BYTE
 DIM SubValue(3):LONG
 DIM SubValSaf(3):LONG
 DIM PrtPthFlg:BYTE
 DIM VerbFlag:BYTE
 DIM VerbCmd:STRING[10]
 DIM Comment:STRING[64]
 DIM RemarkFlg:BYTE
 DIM OldCompVar:BYTE
 DIM StdLib:STRING[42]
 DIM AsmbCmd:STRING[32]
 DIM ObjectCmd:STRING[32]
 DIM OptionCmd:STRING[32]
 DIM CompileCmd:STRING[32]
 DIM AsmbFlag:BYTE
 DIM DirFlag:BYTE
 DIM CrOpFlag:BYTE
 DIM StatFlag:BYTE
 DIM LopCtrNum:LONG
 DIM LastSym:LONG
 DIM FcnSym:LONG
 DIM FcnHeader:STRING[_BufSize]
 DIM FcnBlk(32):STRING[100]
 DIM LetFlag:BYTE
 DIM FcnBlkNdx:BYTE
 DIM FcnFlag:BYTE
 DIM SbrtnFlag:BYTE
 DIM FcnActive:BYTE
 DIM StartFlag:BYTE
 DIM DataFlag:BYTE
 DIM CFlag:BYTE
 DIM CVarFlag:BYTE
 DIM CMainFlag:BYTE
 DIM CFcnFlag:BYTE
 DIM SelectFlag:BYTE
 DIM CaseFlag:BYTE
 DIM CaseElseFlag:BYTE
 DIM CaseToFlag:BYTE
 DIM XBufSize:LONG
 DIM LinkerOut:String[40]
 DIM B:STRING[10]
 DIM BufRWFlg:BYTE
 DIM NewLine:BYTE
 DIM Fmt:STRING[79]
 DIM UDump:BYTE
 DIM StringNum:LONG
 DIM VectorFlg:BYTE
 DIM ParmCtr:BYTE
 DIM ParamCount:BYTE
 DIM ParmFlag:BYTE
 DIM FcnVarFlg:BYTE
 DIM ProcName:STRING[28]
 DIM DtaRegNum:BYTE
 DIM LoopVars(40):STRING[28]
 DIM LopVarNdx:LONG
 DIM ProcFlag:BYTE
 DIM GNU:BYTE
 DIM Unix:BYTE
 DIM UsrFcnNam:STRING[42]
 DIM UsrFcnNamx:STRING[42]
 DIM SetObjNam:STRING[42]
 DIM NumArgs:BYTE
 DIM ParamCnt:BYTE
 DIM LinkerOpt:STRING[50]
 DIM LibList:STRING[100]
 DIM ProgMode:BYTE
 DIM FcnMode:BYTE
 DIM DumpSyms:BYTE
 DIM FloatOK:BYTE
 DIM OneDot:BYTE
 DIM Machine:BYTE
 DIM os9:BYTE
 DIM LstExp:LONG
 DIM NoGen:BYTE
 DIM COut:BYTE
 DIM OptNdx:LONG
 DIM Opt:STRING[1]
 DIM CondValid:BYTE
 DIM CondOp1:LONG
 DIM CondOp2:LONG
 DIM GenFlag(20):BYTE
 DIM GFNdx:LONG
 DIM AddInst:STRING[5]
 DIM DecInc:STRING[2]
 DIM VarSize:LONG
 DIM SetMask:BYTE
 DIM ArrayBase:BYTE
 DIM TmpMax:BYTE
 DIM TmpVecMax:BYTE
 DIM FTmpMax:BYTE
 DIM ChrTmpMax:BYTE
 DIM StrTmpMax:BYTE
 DIM PrintFlag:BYTE
 DIM TabFlag:BYTE
 DIM DevFlag:BYTE
 DIM LastStmt:STRING[8]
 DIM LastLabel:STRING[28]
 DIM FcnCode:BYTE
 DIM FileStat:BYTE
 DIM DiskIO:BYTE
 DIM FileIO:BYTE
 DIM ReadFlag:BYTE
 DIM AndOrFlag:BYTE
 DIM CompFlag:BYTE
 DIM Promote:BYTE
 DIM Demote:BYTE
 DIM DataOp:BYTE
 DIM MathOp:BYTE
 DIM LdRegName:STRING[4]
 DIM Reg0Name:STRING[4]
 DIM Reg1Name:STRING[4]
 DIM _DataType:STRING[16]
 DIM DWSafe:STRING[3]
 DIM D0Loaded:BYTE
 DIM Target:BYTE
 DIM TmpUse:LONG
 DIM TmpVecUse:LONG
 DIM FTmpUse:LONG
 Dim ChrTmpUse:LONG
 Dim StrTmpUse:LONG
 DIM Op1Class:BYTE
 DIM Operator:BYTE
 DIM Op2Class:BYTE
 DIM OpClass:BYTE
 DIM Op1Type:BYTE
 DIM Op1Mod:SHORT
 DIM Op1Detail:LONG
 DIM Op2Type:BYTE
 DIM Op2Mod:SHORT
 DIM Op2Detail:LONG
 DIM Op1Name:STRING[42]
 DIM Op2Name:STRING[42]
 DIM SwitchClass:BYTE
 DIM Op1DataSize:LONG
 DIM Op2DataSize:LONG
 DIM LNFlag:BYTE
 DIM VarName:STRING[29]
 DIM BufName:STRING[29]
 DIM AccMode:STRING[40]
 DIM CreatMode:STRING[40]
 DIM PathVar:STRING[42]
 DIM PathName:STRING[29]
 DIM ToSubFlag:BYTE
 DIM DigDec:BYTE
 DIM BitType:BYTE
 DIM FcnType:BYTE
 DIM FcnSpec:BYTE
 DIM JmpArgs:LONG
 DIM LabelNum:LONG
 DIM FcnLabNum:LONG
 DIM TableNum:LONG
 TYPE ConStruct=TermLabel:LONG;ContLabel:LONG;LoopName:STRING[28];ConType:BYTE;ConLine:LONG;LoopVec:LONG;LoopLabel:LONG;NoStep:BYTE;ImmTo:BYTE;ImmToVal:STRING[10];ImmStep:BYTE;ImmStepVal:STRING[10];NegImmStep:BYTE
 DIM CS(40):ConStruct
 DIM CSP:LONG
 DIM InpFile(20):BYTE
 DIM InpFilPtr:LONG
 DIM CodeFile:BYTE GLOBAL
 DIM VarFile:BYTE
 DIM FcnFile:BYTE
 DIM OutFile:BYTE
 DIM FDFile:BYTE
 DIM RawData:STRING[1]
 DIM TempStr:STRING[_BufSize]
 DIM FcnOp1Nam:STRING[42]
 DIM FcnOp2Nam:STRING[42]
 DIM TempName:STRING[28]
 DIM TempInt:LONG
 DIM TempByte:STRING[1]
 DIM ErrNo:LONG
 DIM NextByte:STRING[1]
 DIM AsciiByte:BYTE
 DIM Konstant:LONG
 DIM StringCnt:LONG
 DIM StringLen:LONG
 DIM LoopNum:LONG
 TYPE Symbol=SymName:STRING[28];DataType:BYTE;WinMod:BYTE;DataMod:SHORT;Detail:LONG;DataAddr:LONG;DataSize:LONG;MultiPtr:SHORT
 DIM SymTable(SymTabSiz):Symbol
 DIM UMFlag:BYTE
 DIM GblVarFlg:BYTE
 DIM ExtVarFlg:BYTE
 DIM CVTemp:LONG
 DIM CVOp:STRING[2]
 DIM NeedComma:BYTE
 DIM MacExFlag:BYTE
 DIM MacBuf(MacBufSiz):BYTE
 DIM MacDefNdx:LONG
 DIM MacExNdx:LONG
 DIM MacTblPtr:LONG
 DIM MacArgBuf(16):STRING[100]
 DIM MacArgPtr:LONG
 DIM MaxArgNum:BYTE
 DIM PoolCtr:LONG
 DIM SymNdx:LONG
 DIM SymNdxSaf:LONG
 DIM SymType:STRING[32]
 DIM ArraySize:LONG
 DIM ForNdx:LONG
 DIM DataTemp:BYTE
 DIM TSymName:STRING[42]
 DIM VSymName:STRING[42]
 DIM TDataType:BYTE
 DIM TWinMod:BYTE
 DIM TDataMod:SHORT
 DIM TDetail:LONG
 DIM VDetail:LONG
 DIM TDataAddr:LONG
 DIM TDataSize:LONG
 DIM TMultiPtr:SHORT
 DIM ExpTable(ExpTabSiz):LONG
 DIM TypePtr:LONG
 DIM TypeFlag:BYTE
 DIM QBType:Byte
 DIM LastEntry:Symbol
 DIM SymTemp:Symbol GLOBAL
 DIM SrcLine:STRING[_BufSize]
 DIM SrcLineCpy:STRING[_BufSize]
 DIM UsrLine:STRING[_BufSize]
 DIM _OutBuf:STRING[_BufSize]
 DIM OutBuf:STRING[_BufSize] VECTOR GLOBAL
 DIM TokenBuf:STRING[_BufSize]
 DIM ExpEnd:BYTE
 DIM TokenLen:BYTE
 DIM ExpLen:BYTE
 DIM LastGroup:BYTE
 DIM TokenType:BYTE
 DIM LastByte:BYTE
 DIM IsOperator:BYTE
 DIM WasOperator:BYTE
 DIM TokenSaf:STRING[_BufSize]
 DIM RootSym:STRING[29]
 DIM ObjectType:STRING[29]
 DIM ObjectFcn:STRING[29]
 DIM Subscript(3):STRING[28]
 DIM SubscrErr:BYTE
 DIM KeyWord:STRING[29]
 DIM KeyNdx:LONG
 DIM SymbolSaf:STRING[29]
 DIM NumberOK:BYTE
 DIM HexOK:BYTE
 DIM SymbolOK:BYTE
 DIM IntOK:BYTE
 DIM DimFlag:BYTE
 DIM DimOK:BYTE
 DIM GlobalFlg:BYTE
 DIM BasicLineCtr:LONG
 DIM CLineCtr:LONG
 DIM QuoteFlg:BYTE
 DIM EscSeq:BYTE
 DIM ParenStk(100):BYTE
 DIM ParenCnt:BYTE
 DIM FcnCtr:BYTE
 DIM AECtr:BYTE
 DIM LevelCnt:BYTE
 DIM SymFull:BYTE
 DIM SymFound:BYTE
 DIM ErrCnt:BYTE
 DIM VarBytRem:LONG
 DIM TypeBytes:LONG
 DIM TypeVars:LONG
 DIM LabelFlag:BYTE
 
 DIM ObjTypNdx:LONG
 DIM ObjClsNdx:LONG
 DIM AddFcnNam:STRING[32]
 DIM FDNumForms:LONG
 DIM FDNumObjects:LONG
 DIM fd_op:BYTE\ REM 0=None 1=Form Bgn, 2=Object, 3=Form End
 DIM fd_setop:BYTE
 DIM fd_class:LONG
 DIM fd_type:LONG
 DIM fd_objclass:LONG
 DIM fd_typestr:STRING[32]
 DIM fd_xpos:STRING[32]
 DIM fd_ypos:STRING[32]
 DIM fd_width:STRING[32]
 DIM fd_height:STRING[32]
 DIM fd_boxtype:STRING[32]
 DIM fd_color1:STRING[32]
 DIM fd_color2:STRING[32]
 DIM fd_alignment:STRING[32]
 DIM fd_style:STRING[32]
 DIM fd_size:STRING[32]
 DIM fd_labelcolor:STRING[32]
 DIM fd_labeltext:STRING[100]
 DIM fd_shortcut:STRING[32]
 DIM fd_resize:STRING[32]
 DIM fd_gravity1:STRING[32]
 DIM fd_gravity2:STRING[32]
 DIM fd_name:STRING[32]
 DIM fd_callback:STRING[32]
 DIM fd_file:STRING[32]
 DIM fd_return:STRING[32]
 DIM fd_argument:LONG
 
 DIM DTCompVar:BYTE
 DIM DTBoolean:BYTE
 DIM DTByte:BYTE
 DIM DTShort:BYTE
 DIM DTLong:BYTE
 DIM DTFloat:BYTE
 DIM DTString:BYTE
 DIM DTLabel:BYTE
 DIM DTMacro:BYTE
 DIM DTOper:BYTE
 DIM DTFcn:BYTE
 DIM DTProc:BYTE
 DIM DTStruct:BYTE
 DIM DTVoid:BYTE
 DIM DTComplex:BYTE
 DIM DTBuffer:BYTE
 DIM DTForm:BYTE
 DIM DTObject:BYTE
 
 DIM DMData:BYTE
 DIM DMTemp:BYTE
 DIM DMVector:BYTE
 DIM DMMember:BYTE
 DIM DMMulti:BYTE
 DIM DMConst:BYTE
 DIM DMAddr:BYTE
 DIM DMArray:BYTE

 DIM TFileName:STRING[28] 
 DIM FileName:STRING[28]
 DIM UseFilNam:STRING[28]
 DIM Ctr1:LONG
 DIM Ctr2:LONG
 DIM Ctr3:LONG
 DIM SrcNdx:LONG
 DIM SrcNdxSaf:LONG
 DIM ExpEndSaf:BYTE
 DIM NumberNdx:LONG
 DIM ValidNdx:LONG
 DIM LabNdx:LONG
 DIM ExpNdx:LONG
 DIM ExpLeft:LONG
 DIM ExpRight:LONG
 DIM PType:LONG
 
* Start
 PRINT
 PRINT "OmniBasic Version C++ Dev"

#IF CType=0
 PRINT "OS9/68020 Version"
#ENDIF

#IF CType=1
 PRINT "MSDOS Version"
#ENDIF

#IF CType=2
 PRINT "Linux Version"
#ENDIF

#IF CType=3
 PRINT "OS9/68000 Version"
#ENDIF

#IF CType=4
 PRINT "OS/2 Version"
#ENDIF

#IF CType=5
 PRINT "OS-9000 (V1.4) Version"
#ENDIF

#IF CType=6
 PRINT "Win95/NT Version"
#ENDIF

#IF CType=7
 PRINT "Amiga Version"
#ENDIF

#IF CType=8
 PRINT "BSD Version"
#ENDIF

#IF CType=9
 PRINT "HP-UX Version"
#ENDIF

#IF CType=10
 PRINT "SCO Version"
#ENDIF

#IF Version=0
 PRINT
 PRINT "Commercial Version"
 PRINT
#ENDIF

#IF Version=1
 PRINT
 PRINT "*************** Evaluation Version ***************"
 PRINT
 PRINT "To order call: (573) 486-3025"
 PRINT "EMail at sales@omnibasic.com"
 PRINT
 PRINT "Versions for other operating systems available"
 PRINT
#ENDIF

 PRINT "Copyright  1995, 1996, 1997, 1998, 1999, 2000 Computer Design Lab"
 PRINT "All Rights Reserved"
 PRINT
 FileName=""
 FileName=NextArg
 IF LEN(FileName)=0 THEN
	PRINT "No input file"
	END
 ENDIF
 IF FileName="-?" THEN Help
 IF RIGHT$(FileName,2)<>".b" AND RIGHT$(FileName,2)<>".B" THEN
	PRINT "no recognized suffix"
	END
 ENDIF
 ON ERROR GOTO NoInpFile
 InpFilPtr=1
 OPEN #InpFile(InpFilPtr),FileName:READ
 	
 FileName=LEFT$(FileName,LEN(FileName)-2)
 ON ERROR GOTO NoCodeFile
 DELETE "_CodFile"
NoCodeFile
 CREATE #CodeFile,"_CodFile":WRITE+TEXT
 ON ERROR GOTO NoVarFile
 DELETE "_VarFile"
NoVarFile
 CREATE #VarFile,"_VarFile":WRITE+TEXT
 ON ERROR GOTO NoFcnFile
 DELETE "_FcnFile"
NoFcnFile
 CREATE #FcnFile,"_FcnFile":WRITE+TEXT
 ON ERROR
 LinkerOut=""
 LibList=""
 LinkerOpt=""
 GFNdx=1
 GenFlag(GFNdx)=$ff
 SETVEC OutBuf=ADDR(_OutBuf)
 XBufSize=_BufSize
 CFlag=0\ REM  clear C Flags
 CVarFlag=0
 CMainFlag=0
 CFcnFlag=0
 SelectFlag=0
 CaseFlag=0
 CaseElseFlag=0
 FormFlag=0\ REM clear Form Flag
 GroupFlag=0\REM clear Group Flag
 DataFlag=0\ REM  clear Data Flag
 NoGen=0\ REM  default OFF
 ExpFlag=0
 WinFlag=0
 HexType=0\ REM $ (Motorola)
 XWinFlag=0
 AnyWinFlag=0
 PromptFlag=0
 ProcedureFlag=0
 VerbFlag=0
 ParmFlag=0
 FcnVarFlg=0
 UDump=0\ REM  default OFF
 StartFlag=0
 COut=0\ REM  default OFF
 DumpSyms=0\ REM  default OFF
 ProgMode=$ff\ REM  default ON
 FcnMode=0\ REM  default OFF
 AsmbFlag=0\ REM  default OFF
 RemarkFlg=$ff\ REM  default ON
 AutoDim=$ff\ REM  default ON
 LopCtrNum=-1
 ArrayBase=1\ REM  default to base 1
 PrtPthFlg=0
 DtaRegNum=0
 LastMulti=SymTabSiz+1
 FcnMulti=LastMulti
 FcnActive=0
 FcnFlag=0
 SbrtnFlag=0
 TmpMax=0
 TmpVecMax=0
 FTmpMax=0
 ChrTmpMax=0
 StrTmpMax=0
 ErrCnt=0
 LastStmt=""
 LastLabel=""
 CSP=0
 LopVarNdx=0
 StringNum=0
 LabelNum=0
 FcnLabNum=0
 TableNum=0
 LoopNum=0
 MacExFlag=0
 BasicLineCtr=0
 CLineCtr=0
 ErrNo=0
 PoolCtr=0
 VarBytRem=0
 DbgFlag=0

 FOR LopVarNdx=1 to 40
	LoopVars(LopVarNdx)="%"
 NEXT LopVarNdx
 
 FOR SymNdx=1 TO SymTabSiz
	ClrSymTab()
 NEXT SymNdx

 FOR MacDefNdx=1 TO MacBufSiz
	MacBuf(MacDefNdx)=0
 NEXT MacDefNdx
 MacDefNdx=1
 
 RESTORE PreDefTbl
 SymNdx=0
InitSym
 INC SymNdx
 READ SymTemp.SymName
 IF SymTemp.SymName="%" THEN Preamble
 READ SymTemp.DataType
 READ SymTemp.DataMod
 READ SymTemp.Detail
 READ SymTemp.DataAddr
 READ SymTemp.DataSize
 SymTemp.MultiPtr=0
 SymTable(SymNdx)=SymTemp
 GOTO InitSym
 
Preamble
 CmdLine()
 Comment="Compiler Declaration and Variable Section"
 BldComment()
 GenVar
 VarBlank()
 
 OutBuf="typedef struct {"
 GenVar
 OutBuf="void *_Ptr;"
 GenVar
 OutBuf="long _Len;"
 GenVar
 OutBuf="void *_Lnk;"
 GenVar
 OutBuf="} _vector;"
 GenVar
 OutBuf=""
 GenVar
 OutBuf="typedef struct {"
 GenVar
 OutBuf="void *_BufPtr;"
 GenVar
 OutBuf="long _BufSiz;"
 GenVar
 OutBuf="} _buffer;"
 GenVar
 OutBuf=""
 GenVar
 OutBuf="typedef struct {"
 GenVar
 OutBuf="long _Limit;"
 GenVar
 OutBuf="long _Step;"
 GenVar
 OutBuf="} _loopvec;"
 GenVar
 OutBuf=""
 GenVar

 Comment="I/O Library Function Prototypes"
 BldComment()
 GenVar

 OutBuf="extern "+CHR$($22)+"C"+CHR$($22)+" {"\ Begin extern c section
 GenVar

 OutBuf=""
 GenVar
 OutBuf="int close(unsigned char);"
 GenVar
 OutBuf="int lseek(unsigned char,int,int);"
 GenVar
 OutBuf="int read(unsigned char,char *,int);"
 GenVar
 OutBuf="int open(char *,int, ...);"
 GenVar  
 OutBuf="int write(unsigned char,char *,int);"
 GenVar
 OutBuf="int unlink(char *);"
 GenVar
 OutBuf=""
 GenVar

 OutBuf="}"\ End of extern c section
 GenVar

 Comment="OmniBasic Library Function Prototypes"
 BldComment()
 GenVar

 OutBuf="extern "+CHR$($22)+"C"+CHR$($22)+" {"\ Begin extern c section
 GenVar

 OutBuf=""
 GenVar
 OutBuf="void _TrmStr(_vector *);"
 GenVar
 OutBuf="void _PrtUsing(long,char *,long);"
 GenVar
 OutBuf="void _ReadBool(long);"
 GenVar
 OutBuf="void _ReadByte(long);"
 GenVar
 OutBuf="void _ReadShort(long);"
 GenVar
 OutBuf="void _ReadLong(long);"
 GenVar
 OutBuf="void _ReadFlt(long);"
 GenVar
 OutBuf="void _ReadStr(long,long);"
 GenVar
 OutBuf="void _MovArg(_vector *,long);"
 GenVar
 OutBuf="void _MovStr(_vector *,_vector *);"
 GenVar
 OutBuf="long _CmpStr(_vector *,_vector *);"
 GenVar 
 OutBuf="long _StrLen(_vector *);"
 GenVar
 OutBuf="long _SubStr(_vector *,_vector *,long);"
 GenVar
 OutBuf="void _MidStr(long,long,long,char);"
 GenVar
 OutBuf="void _LeftStr(long,long,long,char);"
 GenVar
 OutBuf="void _RightStr(long,long,char);"
 GenVar
 OutBuf="void _ClrConv(void);"
 GenVar
 OutBuf="double _AtoD(void);"
 GenVar
 OutBuf="long _AtoL(void);"
 GenVar
 OutBuf="void _ZLtoH(long);"
 GenVar
 OutBuf="void _ZLtoA(long);"
 GenVar
 OutBuf="void _LtoA(long);"
 GenVar
 OutBuf="void _DtoA(double);"
 GenVar
 OutBuf="void _LtoH(long,long);"
 GenVar
 OutBuf="void _PrintStr(_vector *,long);"
 GenVar
 OutBuf="void _PrintTab(long);"
 GenVar
 OutBuf="void _InpData(_vector *,char,long);"
 GenVar
 OutBuf="void _BtoA(long);"
 GenVar
 OutBuf="long _LCase(_vector *);"
 GenVar
 OutBuf="long _UCase(_vector *);"
 GenVar
 OutBuf="void _Remnant(long,long,char);"
 GenVar

 OutBuf="}"\ End of extern c section
 GenVar

 VarBlank()
 OutBuf="#define _BufSize "+STR$(_BufSize)
 GenVar
 OutBuf="#include "+CHR$($22)+"basic.h"+CHR$($22)
 GenVar
 RESTORE RunVars
RunVarLp
 READ TempInt,OutBuf
 IF OutBuf="%" THEN RunVarDn
 IF FcnMode=$ff AND TempInt=1 THEN
	TempStr="extern "+OutBuf
	OutBuf=TempStr
 ENDIF
 GenVar
 GOTO RunVarLp
RunVarDn

**** OS-9/68020 ****
#IF CType=0
 Machine=0
 GNU=0
 Unix=0
 os9=1
 VerbCmd=" -q"
 NewLine=$0d
#LIB -k=2 -bg
#ENDIF

**** MSDOS ****
#IF CType=1
 Machine=1
 GNU=1
 Unix=0
 os9=0
 VerbCmd=""
 NewLine=$0a
#ENDIF

**** Linux ****
#IF CType=2
 Machine=2
 GNU=1
 Unix=1
 os9=0
 VerbCmd=""
 NewLine=$0a
#ENDIF

**** OS-9/68000 ****
#IF CType=3
 Machine=0
 GNU=0
 Unix=0
 os9=1
 VerbCmd=" -q"
 NewLine=$0d
#LIB -k=0lcl -bg
#ENDIF

**** OS/2 ****
#IF CType=4
 Machine=4
 GNU=1
 Unix=0
 os9=0
 VerbCmd=""
 NewLine=$0a
#ENDIF

**** OS9000 ****
#IF CType=5
 Machine=5
 GNU=0
 Unix=0
 os9=1
 VerbCmd=" -q"
 NewLine=$0d
#ENDIF

**** Win95/NT ****
#IF CType=6
 Machine=6
 GNU=1
 Unix=0
 os9=0
 VerbCmd=""
 NewLine=$0a
#ENDIF

**** Amiga ****
#IF CType=7
 Machine=7
 GNU=0
 Unix=0
 os9=0
 VerbCmd=""
 NewLine=$0a
#ENDIF

**** BSD ****
#IF CType=8
 Machine=8
 GNU=1
 Unix=1
 os9=0
 VerbCmd=""
 NewLine=$0a
#ENDIF

**** HP-UX ****
#IF CType=9
 Machine=9
 GNU=1
 Unix=1
 os9=0
 VerbCmd=""
 NewLine=$0a
#ENDIF

**** SCO ****
#IF CType=10
 Machine=10
 GNU=1
 Unix=0
 os9=0
 VerbCmd=""
 NewLine=$0a
#ENDIF

 IF FcnMode=0 THEN
	TempStr=""
 ELSE
	TempStr="extern "
 ENDIF
 OutBuf=TempStr+"char _IOBuffer[_BufSize];"
 GenVar
 OutBuf=TempStr+"char _PrintBuf[_BufSize];"
 GenVar

 VarBlank()
 OutBuf="long _LoopCtr[10];"
 GenVar

 VarBlank()
 Comment="User Declaration and Variable Section"
 BldComment()
 GenVar
 OutBuf=""
 GenMain
 Comment="Code Section"
 BldComment()
 GenMain
 OutBuf=""
 GenMain
 IF FcnMode=0 THEN
	StartFlag=$ff\ REM  for a short time only
	IF WinFlag=0 OR Machine<>6 THEN
		OutBuf="main(int argc,char *argv[])"
		GenMain
	ELSE
		OutBuf="int STDCALL WinMain(HINSTANCE hInst,HINSTANCE hPrev,LPSTR lpcmd,int nSHOW)"
		GenMain
	ENDIF
	OutBuf="{"
	GenMain
	OutBuf=""
	GenMain
	Comment="Pseudo Registers"
	BldComment()
	GenMain
	OutBuf="register long _d0;"
	GenMain
	OutBuf="register long _d1;"
	GenMain
	OutBuf="double _d0f;"
	GenMain
	OutBuf="double _d1f;"
	GenMain
	OutBuf="void *_a0;"
	GenMain
	OutBuf=""
	GenMain
	Comment="Initialize Variables"
	BldComment()
	GenMain
	TempInt=22
	SymTemp.SymName="_CBufVec"
	OutBuf="_a0=_ConvBuf;"
	GenMain
	SetStrVec()
	SymTemp.SymName="_CBuf1Vec"
	OutBuf="_a0=_ConvBuf1;"
	GenMain
	SetStrVec()
	TempInt=_BufSize
	SymTemp.SymName="_PBufVec"
	OutBuf="_a0=_PrintBuf;"
	GenMain
	SetStrVec()
	SymTemp.SymName="_IOBufVec"
	OutBuf="_a0=_IOBuffer;"
	GenMain
	SetStrVec()
	Comment="Set ERROR Vector"
	BldComment()
	GenMain
	OutBuf="_ErrFlag=setjmp(_ebuf);"
	GenMain
	OutBuf="if (_ErrFlag) goto ErrExit;"
	GenMain
	Comment="Initialize System Variables"
	BldComment()
	GenMain
	OutBuf="_Digits=15;"
	GenMain
	OutBuf="_Decimals=2;"
	GenMain
	OutBuf="POS=0;"
	GenMain
	OutBuf="errno=0;"
	GenMain
	OutBuf="XferCount=0;"
	GenMain
	OutBuf="STATUS=0;"
	GenMain
 	IF Unix=0 THEN
		OutBuf="_CRLF[0]=0x0d;"
 	ELSE
 		OutBuf="_CRLF[0]=0x0a;"
 	ENDIF
	GenMain
	OutBuf="_CRLF[1]=0x0a;"
	GenMain
	OutBuf="_NewLine="+STR$(NewLine)+";"
	GenMain
	OutBuf="_Prompt='?';"
	GenMain
	RegInit()\ REM main case, Prevent unreferenced var warnings
   	IF WinFlag=0 OR Machine<>6 THEN
    		OutBuf="_ArgCount=argc;"
    		GenMain
    		OutBuf="_ArgNum=0;"
    		GenMain
    		OutBuf="_ArgList=(long)argv;"
    		GenMain
    		ReqTmpVec()
    		OutBuf="_TmpVec1._Ptr=ProgramName;"
    		GenCode
    		OutBuf="_TmpVec1._Len=28;"
    		GenCode
    		OutBuf="_TmpVec1._Lnk=0;"
    		GenCode
 		OutBuf="_MovArg(&_TmpVec1,_ArgList);"
 		GenCode
	ENDIF
	IF Machine=2 AND XWinFlag<>0 THEN
		OutBuf="fl_initialize(&argc,argv,"+CHR$($22)+FileName+CHR$($22)+",0,0);"
		GenMain
 		OutBuf="FL_OBJECT *obj;"
 		GenVar
	ENDIF
	OutBuf=""
	GenMain
	StartFlag=0\ REM  was on only to set up sys vars and vecs
 ENDIF
 OutBuf=""
 GenFcn
 Comment="Function and Subroutine Section"
 BldComment()
 GenFcn
 OutBuf=""
 GenFcn
 
MainLoop
 EnableAuto=0
 ClrDatTyp()
 LetFlag=0
 ProcFlag=0
 Target=0
 ANSIFile=0
 PrintFlag=0
 StatFlag=0
 TabFlag=0
 DevFlag=0
 FileIO=0
 DiskIO=0
 BufRWFlg=0
 FileStat=0
 LabelFlag=$00
 Op1Class=0
 ReadFlag=0
 CompFlag=0
 Promote=0
 Demote=0
 LNFlag=$00
 TmpUse=0
 TmpVecUse=0
 FTmpUse=0
 ChrTmpUse=0
 StrTmpUse=0
 DimFlag=$00
 TypeFlag=$00
 TDataMod=0
 IF ErrNo<>0 THEN
	IF ErrNo=ErrMacArg THEN
		PRINT "Fatal Error... MACRO argument error in line ";BasicLineCtr
		END
	ENDIF
	PRINT UsrLine
	OutBuf=""
	IF SrcNdx<2 THEN
		SrcNdx=2
	ENDIF
	For Ctr1=1 TO SrcNdx-1
		OutBuf=OutBuf+" "
	NEXT Ctr1
	OutBuf=OutBuf+"^"
	PRINT OutBuf
	RESTORE ErrorTbl
	FOR Ctr1=1 to ErrNo
		READ TempStr
	NEXT Ctr1
	PRINT TempStr;" in line ";BasicLineCtr
	IF ErrNo=ErrSymFul THEN
		PRINT "Fatal Error... Symbol Table Full"
		PRINT "Total symbols=";SymNdx
		END
	ENDIF
	INC ErrCnt
	ErrNo=0
 ENDIF
 IF MacExFlag=0 THEN
	IF InpFilPtr=1 THEN
		INC BasicLineCtr
	ENDIF
	ReadSource()
	IF TempInt=0 THEN Finish
 ELSE
 	SrcLine=""
 	SrcNdx=0
MacExLp AsciiByte=MacBuf(MacExNdx)
	INC MacExNdx
	IF AsciiByte=0 THEN\ REM  end of MACRO
		MacExFlag=0
		GOTO MainLoop
	ENDIF
	IF AsciiByte=NewLine THEN ProcLine
	IF LAND($80,AsciiByte)=$80 THEN
		AsciiByte=LAND($7f,AsciiByte)
		IF AsciiByte=0 THEN
			SrcLine=SrcLine+STR$(SymTable(MacTblPtr).Detail)
			GOTO MacExLp
		ENDIF
		IF AsciiByte>MaxArgNum THEN
			ErrNo=ErrMacArg
			GOTO MainLoop
		ENDIF
		MacArgPtr=AsciiByte
		SrcLine=SrcLine+MacArgBuf(MacArgPtr)
		GOTO MacExLp
	ENDIF
	SrcLine=SrcLine+CHR$(AsciiByte)
	GOTO MacExLp
 ENDIF
ProcLine
 SrcNdx=0
 IF GenFlag(GFNdx)=0 THEN
 	IF LEFT$(SrcLine,1)<>"#" THEN MainLoop
	INC SrcNdx
	NexToken()
	IF TokenBuf<>"if" AND TokenBuf<>"else" AND TokenBuf<>"endif" THEN MainLoop
	IF TokenBuf="if" THEN IFDx
	IF TokenBuf="else" THEN ELSEDx
	GOTO ENDIFDx
 ENDIF
 IF LEN(SrcLine)=0 THEN MainLoop
 IF CFlag<>0 OR CVarFlag<>0 OR CMainFlag<>0 OR CFcnFlag<>0 THEN ProcStmt
 TempByte=LEFT$(SrcLine,1)
 IF TempByte="*" OR MID$(SrcLine,2,2)="(*" THEN
	Remark()
	GenCode
	GOTO MainLoop
 ENDIF
 IF TempByte=";" THEN
	OutBuf=MID$(SrcLine,2,LEN(SrcLine)-1)
	GenCode
	GOTO MainLoop
 ENDIF
 IF TempByte="," THEN
	OutBuf=MID$(SrcLine,2,LEN(SrcLine)-1)
	GenVar
	GOTO MainLoop
 ENDIF
 IF TempByte="." THEN
	OutBuf=MID$(SrcLine,2,LEN(SrcLine)-1)
	GenMain
	GOTO MainLoop
 ENDIF
 IF TempByte="/" THEN
	OutBuf=MID$(SrcLine,2,LEN(SrcLine)-1)
	GenFcn
	GOTO MainLoop
 ENDIF
 IF GNU=1 AND TempByte="+" THEN\ REM AT&T Assmebler code
	OutBuf="__asm__ __volatile__("+CHR$($22)+MID$(SrcLine,2,LEN(SrcLine)-1)+CHR$($22)+");"
	GenCode
	GOTO MainLoop
 ENDIF
 IF os9=1 AND TempByte="+" THEN\ REM OS9 Assembler code
 	OutBuf="@"+MID$(SrcLine,2,LEN(SrcLine)-1)
 	GenCode
 	GOTO MainLoop
 ENDIF
 IF TempByte=CHR$($20) OR TempByte=CHR$($09) THEN ProcStmt
 IF TempByte<>"#" THEN ProcLabel
 
* Process Directive
 Remark()
 GenCode
 INC SrcNdx
 NexToken()
 SELECT CASE TokenBuf
 	CASE "set"
 		GOTO SETDx
 	CASE "macro"
 		GOTO MACRODx
 	CASE "endm"
 		GOTO ENDMDx
 	CASE "if"
 		GOTO IFDx
 	CASE "else"
 		GOTO ELSEDx
 	CASE "endif"
 		GOTO ENDIFDx
 	CASE "use"
 		GOTO USEDx
 	CASE "fcn"
 		GOTO FCNDx
 	CASE "fix"
 		GOTO FIXDx
 	CASE "lib"
 		GOTO LIBDx
 	CASE "struct"
 		GOTO STRUCTDx
 	CASE "endstruct"
 		GOTO ENDSTRUCTDx
 	CASE "c"
 		GOTO CDx
 	CASE "endc"
 		GOTO ENDCDx
 	CASE "sbrtn"
 		GOTO SBRTNDx
 	CASE "form"
 		GOTO FORMDx
 	CASE "endform"
 		GOTO ENDFORMDx
 	CASE "group"
 		GOTO GROUPDx
 	CASE "endgroup"
 		GOTO ENDGROUPDx
 	CASE "fdesign"
 		GOTO FDESIGNDx
 	CASE "include"
 		GOTO USEDx
 	CASE ELSE
 		ErrNo=ErrSyntax
 		GOTO MainLoop
 ENDSELECT 
 
ProcLabel
 StartFlag=$ff
 IF ParmFlag=$ff THEN
	UnBlkFcn()
	ErrMain
 ENDIF
 IF FcnVarFlg=$ff THEN
	FcnVarFlg=0
 	RegInit()\ REM label/fcn case, Prevent unreferenced var warnings
 ENDIF
 IF DataFlag=$ff THEN
	DataFlag=0
	OutBuf="0};"
	GenVar
 ENDIF
 LNFlag=$ff
 TokenSym()
 ErrMain
 LabelFlag=$ff
 TDataType=SymTable(SymNdx).DataType
 TDetail=SymTable(SymNdx).Detail
 TDataSize=SymTable(SymNdx).DataSize
 LastLabel=SymbolSaf
 IF SymFound<>0 THEN
	IF TDataType<>LABEL AND TDataType<>FCN THEN
		ErrNo=ErrDupSym
		GOTO MainLoop
	ENDIF
	IF TDataType=LABEL THEN
		IF TDetail=$ff OR TDetail=$1ff THEN
			SymTable(SymNdx).Detail=SymTable(SymNdx).Detail&$100
		ELSE
			ErrNo=ErrDupSym
			GOTO MainLoop
		ENDIF
	ENDIF
	IF TDataType=FCN THEN
		ParamCount=SymTable(SymNdx).Detail-1000
		ParmCtr=0
		IF TDataAddr=0 THEN
			SymTable(SymNdx).DataAddr=1
		ELSE
			ErrNo=ErrDupSym
			GOTO MainLoop
		ENDIF
		IF FcnFlag=$ff THEN
			ErrNo=ErrFSNest
			GOTO MainLoop
		ENDIF
		IF TDataSize&$03=0 THEN
			FcnHeader="void "
			FcnActive=VoidFcn
		ENDIF
		IF TDataSize&$03=1 THEN
			FcnHeader="int "\ rem was long
			FcnActive=IntFcn
		ENDIF
		IF TDataSize&$03=2 THEN
			FcnHeader="double "
			FcnActive=DblFcn
		ENDIF
		GOTO ProcFcn
	ENDIF
 ELSE
	ClrDatTyp()
	TDataType=LABEL
	SymTemp.DataType=LABEL
	ClrSym()
	SymTemp.DataMod=0
	SymInsert()
	ErrMain
 ENDIF
 NexToken()
 IF TokenBuf=":" THEN
 	NexToken()\ REM Eat the ':'
 ENDIF
 IF TokenBuf="(" THEN\ &&&&&&&&&&&&
	ErrNo=ErrUDFcn
	GOTO MainLoop
 ENDIF
 IF TokenBuf="data" THEN
	SymTable(SymNdx).DataMod=DataBit
	GOTO S1\ REM  DATA statement processing
 ENDIF
 UnDoToken()
 IF SymTable(SymNdx).Detail=$100 AND TDataType=LABEL THEN\ REM  (sbrtn)
	OutBuf="void "+SymbolSaf+"(void);"
	GenVar
	TempStr="void "+SymbolSaf+"(void)"
	SymbolSaf=TempStr
	IF FcnFlag=$ff THEN
		ErrNo=ErrFSNest
		GOTO MainLoop
	ENDIF
	FcnFlag=$ff
	SbrtnFlag=$ff
	LabelFlag=$fe
	FcnActive=VoidFcn
	FcnSym=LastSym
 ELSE
	IF TDataType=LABEL THEN
		SymbolSaf=SymbolSaf+":"
	ENDIF
 ENDIF
 
ProcStmt
 NexToken()
 IF TokenSaf="STATUS" THEN
	ColonMain
	NexToken()
	StatFlag=$ff
 ENDIF
 IF LEN(TokenBuf)>0 THEN
 	LastStmt=TokenBuf
 ENDIF
 IF TokenLen=0 THEN
	OutLabel()
	GOTO MainLoop
 ENDIF
 IF CFlag<>0 OR CVarFlag<>0 OR CMainFlag<>0 OR CFcnFlag<>0 THEN
	IF LEFT$(SrcLine,1)="#" THEN
		NexToken()
		IF TokenBuf="c" THEN
			PRINT "FATAL ERROR... #C sync error in line ";BasicLineCtr
			END
		ENDIF
		IF TokenBuf="endc" THEN
			CFlag=0
			CVarFlag=0
			CMainFlag=0
			CFcnFlag=0
			Remark()
			GenCode
			GOTO MainLoop
		ENDIF
	ENDIF
	OutBuf=SrcLine
	IF CFlag<>0 THEN
		GenCode
	ELSE
		IF CVarFlag<>0 THEN
			GenVar
		ELSE
			IF CMainFlag<>0 THEN
				GenMain
			ELSE
				IF CFcnFlag<>0 THEN
					GenFcn
				ENDIF
			ENDIF
		ENDIF
	ENDIF
	GOTO MainLoop
 ENDIF
 KeyLook()
 IF KeyNdx=0 THEN
	REM maybe a macro, usrfcn, or form
	SymTemp.SymName=TokenSaf
	SymSrch()
 REM WinCode Removed
	IF SymFound=$ff AND SymTable(SymNdx).DataType=MACRO THEN
		Remark()
		GenCode
		MacTblPtr=SymNdx
		MacExNdx=SymTable(SymNdx).DataAddr
		SymTable(SymNdx).Detail=SymTable(SymNdx).Detail+1\ REM inc macro occurrance
		NeedComma=0
		MaxArgNum=0
		MacExFlag=$ff
		OutLabel()
		IF MID$(SrcLine,SrcNdx+1,1)=" " THEN
			INC SrcNdx
		ENDIF
MacExLoop
		MacToken()
		IF TokenLen=0 THEN
			GOTO MainLoop
		ENDIF
		IF NeedComma=0 AND TokenSaf="," THEN
			INC MaxArgNum
			MacArgBuf(MaxArgNum)=""
			GOTO MacExLoop
		ENDIF
		IF NeedComma=$ff AND TokenSaf<>"," THEN
			ErrNo=ErrSyntax
			GOTO MainLoop
		ENDIF
		IF NeedComma=$ff AND TokenSaf="," THEN
			NeedComma=0
			GOTO MacExLoop
		ENDIF
		INC MaxArgNum
		MacArgBuf(MaxArgNum)=TokenSaf
		NeedComma=$ff
		GOTO MacExLoop
	ENDIF
	IF SymFound=$ff AND SymTable(SymNdx).DataType=FCN AND SymTable(SymNdx).Detail>=1000 THEN
		StartFlag=$ff
		IF NextByte="(" THEN
			ProcFlag=$ff
		ELSE
			GOTO SetFcnPtr
		ENDIF
	ENDIF
	KeyNdx=8
	UnDoToken()
 ENDIF
 IF KeyNdx<>1 AND DataFlag=$ff THEN
	DataFlag=0
	OutBuf="0};"
	GenVar
 ENDIF
 Remark()
 IF ParmFlag=$ff AND KeyNdx<>50 THEN\ REM  not PARAM stmt
	UnBlkFcn()
 ENDIF
 IF FcnVarFlg=$ff AND KeyNdx<>7 THEN\ REM  not DIM stmt
	FcnVarFlg=0
 	RegInit()\Prevent unreferenced var warnings from SAS
 ENDIF
 IF KeyNdx=1 THEN\ REM  DATA statement
	GenVar
	GOTO S1
 ENDIF
 IF KeyNdx=6 THEN\ REM  TYPE
	GenVar
	GOTO S6
 ENDIF
 IF KeyNdx=7 THEN\ REM  DIM
	GOTO S7
 ENDIF
 IF KeyNdx=50 THEN\ REM  PARAM
	GOTO S50
 ENDIF
 StartFlag=$ff
 GenCode\ REM put out OmniBasic source as comment
 OutBuf=""
 OutLabel()
 IF KeyNdx<51 THEN
 	ON KeyNdx GOTO S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20,S21,S22,S23,S24,S25,S26,S27,S28,S29,S30,S31,S32,S33,S34,S35,S36,S37,S38,S39,S40,S41,S42,S43,S44,S45,S46,S47,S48,S49,S50
 ELSE
        ON KeyNdx-50 GOTO S51,S52,S53,S54,S55,S56,S57,S58,S59,S60,S61,S62,S63,S64,S65,S66,S67,S68,S69,S70,S71,S72,S73,S74,S75,S76,S77,S78,S79,S80,S81,S82,S83,S84,S85
 ENDIF
 PRINT "FATAL ERROR KeyWord LookUp Error:";BasicLineCtr,KeyNdx
 END

GenObject
 REM WinCode Removed
 RETURN

SETDx
 SetMask=0
 SETDx1()
 GOTO MainLoop

SETDx1
* Changed into a subroutine because is called by
* inline code OR CmdLine, so cannot "jump" to MainLoop as before.
* This should be the only sbrtn outside (before) the sbrtn section
 UMFlag=0
 TokenSym()
 ErrRet
 IF SymFound=0 THEN
	OldCompVar=0
	SymTemp.DataType=COMPVAR
	ClrSym()
	SymInsert()
	ErrRet
 ELSE
	OldCompVar=$ff
	IF SymTable(SymNdx).DataType<>COMPVAR AND SymTable(SymNdx).DataType<> MACRO THEN
		ErrNo=ErrTypMis
		RETURN
	ENDIF
	IF LAND(SymTable(SymNdx).DataMod,$80)<>0 THEN
		RETURN
	ENDIF
 ENDIF
 SymNdxSaf=SymNdx
 EqualRet
 NexToken()
 IF TokenBuf="-" THEN
	UMFlag=$ff
	NexToken()
 ENDIF
 IF TokenType=TTypInt THEN
	ValidInt()
	IF IntOK=0 THEN
		ErrNo=ErrIVExp
		RETURN
	ENDIF
	GOTO SetOp1
 ENDIF
 IF TokenType=TTypHex THEN
	ValidHex()
	IF HexOK=0 THEN
		ErrNo=ErrIVExp
		RETURN
	ENDIF
	GOTO SetOp1
 ENDIF
 IF TokenType=TTypSym THEN
	TokenSym1()
	ErrRet
	IF SymFound=0 THEN
		ErrNo=ErrUDSym
		RETURN
	ENDIF
	TokenSaf=STR$(SymTable(SymNdx).Detail)
	GOTO SetOp1
 ENDIF
 ErrNo=ErrIVExp
 RET
SetOp1
 IF UMFlag=$ff THEN
	TempStr="-"
 ELSE
	TempStr=""
 ENDIF
 TempStr=TempStr+TokenSaf
 IF MID$(TempStr,1,2)="--" THEN
	TempStr=MID$(TempStr,2,LEN(TempStr)-2)
 ENDIF
 CVTemp=VAL(TempStr)
 NexToken()
 IF TokenLen=0 THEN SetFinish
 IF TokenBuf="<" THEN
	NexToken()
	IF TokenBuf<>"<" THEN
		ErrNo=ErrIVExp
		RETURN
	ENDIF
	TokenType=TTypMath
 ENDIF
 IF TokenBuf=">>" THEN
	TokenType=TTypMath
 ENDIF
 IF TokenType<>TTypMath THEN
	ErrNo=ErrIVExp
	RETURN
 ENDIF
 CVOp=TokenBuf
 NexToken()
 IF TokenType=TTypInt THEN
	ValidInt()
	IF IntOK=0 THEN
		ErrNo=ErrIVExp
		RETURN
	ENDIF
	GOTO SetOperator
 ENDIF
 IF TokenType=TTypHex THEN
	ValidHex()
	IF HexOK=0 THEN
		ErrNo=ErrIVExp
		RETURN
	ENDIF
	GOTO SetOperator
 ENDIF
 IF TokenType=TTypSym THEN
	TokenSym1()
	ErrRet
	IF SymFound=0 THEN
		ErrNo=ErrUDSym
		RETURN
	ENDIF
	TokenSaf=STR$(SymTable(SymNdx).Detail)
	GOTO SetOperator
 ENDIF
 ErrNo=ErrIVExp
 RET
SetOperator
 SymNdx=SymNdxSaf
 SymTable(SymNdx).Detail=CVTemp
 IF CVOp="+" THEN
	CVTemp=SymTable(SymNdx).Detail+VAL(TokenSaf)
 ENDIF
 IF CVOp="-" THEN
	CVTemp=SymTable(SymNdx).Detail-VAL(TokenSaf)
 ENDIF
 IF CVOp="*" THEN
	CVTemp=SymTable(SymNdx).Detail*VAL(TokenSaf)
 ENDIF
 IF CVOp="/" THEN
	CVTemp=SymTable(SymNdx).Detail/VAL(TokenSaf)
 ENDIF
 IF CVOp="&" THEN
	CVTemp=SymTable(SymNdx).Detail&VAL(TokenSaf)
 ENDIF
 IF CVOp="|" THEN
	CVTemp=SymTable(SymNdx).Detail|VAL(TokenSaf)
 ENDIF
 IF CVOp="<" OR CVOp=">>" THEN
	CVTemp=SymTable(SymNdx).Detail
	TempInt=VAL(TokenSaf)
;if (CVOp[0] == '>') CVTemp=CVTemp>>TempInt;
;else CVTemp=CVTemp<<TempInt;
 ENDIF
SetFinish
 SymNdx=SymNdxSaf
 SymTable(SymNdx).Detail=CVTemp
 SymTable(SymNdx).DataMod=SetMask
 IF OldCompVar=$ff THEN
	OutBuf="#undef "+SymTable(SymNdx).SymName
	GenCode
 ENDIF
 OutBuf="#define "+SymTable(SymNdx).SymName+" "+STR$(CVTemp)
 GenCode
 RETURN
 
MACRODx
 NexToken()
 IF TokenType<>5 THEN\ REM  symbol
	ErrNo=ErrSyntax\ REM  syntax error
	GOTO MainLoop
 ENDIF
 SymTemp.SymName=TokenSaf
 SymSrch()
 IF SymFound=$ff THEN
	ErrNo=ErrDupSym\ REM  symbol already defined
	GOTO MainLoop
 ENDIF
 SymTemp.DataType=MACRO
 ClrSym()
 SymTemp.DataAddr=MacDefNdx\ REM  address of macro in macro buffer
 SymInsert()
 ErrMain
* read a line of source code
MacLp
 IF InpFilPtr=1 THEN
	INC BasicLineCtr
 ENDIF
 ReadSource()
 IF TempInt=0 THEN
 	PRINT "FATAL ERROR.. EOF in MACRO"
 	END
 ENDIF
MacLpExit
 IF MID$(SrcLine,1,1)="#" THEN
	SrcNdx=1
	NexToken()
	IF TokenBuf="macro" THEN
		ErrNo=ErrMacNst\ REM  nested macro
		GOTO MainLoop
	ENDIF
	IF TokenBuf="endm" THEN
		MacBuf(MacDefNdx)=0
		MacDefInc()
		GOTO MainLoop
	ENDIF
 ENDIF
 SrcNdx=0
lbl7027 INC SrcNdx
 IF SrcNdx>LEN(SrcLine) THEN
	MacBuf(MacDefNdx)=NewLine
	MacDefInc()
	ErrMain
	GOTO MacLp
 ENDIF
 IF MID$(SrcLine,SrcNdx,1)="~" THEN
	INC SrcNdx
	TempByte=MID$(SrcLine,SrcNdx,1)
	AsciiByte=ASC(TempByte)
	IF TempByte>="0" AND TempByte<="9" THEN
		AsciiByte=LAND($0f,AsciiByte)
		AsciiByte=LOR($80,AsciiByte)
		MacBuf(MacDefNdx)=AsciiByte
		MacDefInc()
		ErrMain
		GOTO lbl7027
	ENDIF
        AsciiByte=AsciiByte&$4f\ rem make upper case
        TempByte=CHR$(AsciiByte)
        IF TempByte>="A" AND TempByte<="F" THEN
		AsciiByte=LAND($0f,AsciiByte)
		AsciiByte=LOR($80,AsciiByte)
                AsciiByte=AsciiByte+9
		MacBuf(MacDefNdx)=AsciiByte
		MacDefInc()
		ErrMain
		GOTO lbl7027
	ENDIF
	ErrNo=ErrIVMac
	GOTO MainLoop
 ENDIF
 TempByte=MID$(SrcLine,SrcNdx,1)
 AsciiByte=ASC(TempByte)
 MacBuf(MacDefNdx)=AsciiByte
 MacDefInc()
 ErrMain
 GOTO lbl7027
 
ENDMDx
 ErrNo=ErrEndm
 GOTO MainLoop
 
IFDx
 CondValid=GenFlag(GFNdx)
 INC GFNdx
 IF GFNdx>20 THEN
	PRINT "FATAL Error Conditional stack overflow"
	END
 ENDIF
 UMFlag=0
 TokenSym()
 ErrMain
 IF SymFound=0 THEN
	ErrNo=ErrUDSym
	GOTO MainLoop
 ENDIF
 IF SymTable(SymNdx).DataType<>COMPVAR THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
 ENDIF
 CondOp1=SymTable(SymNdx).Detail
 EqualMain
 NexToken()
 IF TokenBuf="-" THEN
	UMFlag=$ff
	NexToken()
 ENDIF
 IF TokenType=TTypInt THEN
	ValidInt()
	IF IntOK=0 THEN
		ErrNo=ErrIVExp
		GOTO MainLoop
	ENDIF
	GOTO IFDx1
 ENDIF
 IF TokenType=TTypHex THEN
	ValidHex()
	IF HexOK=0 THEN
		ErrNo=ErrIVExp
		GOTO MainLoop
	ENDIF
	GOTO IFDx1
 ENDIF
 IF TokenType=TTypSym THEN
	TokenSym1()
	ErrMain
	IF SymFound=0 THEN
		ErrNo=ErrUDSym
		GOTO MainLoop
	ENDIF
	TokenSaf=STR$(SymTable(SymNdx).Detail)
	GOTO IFDx1
 ENDIF
 ErrNo=ErrIVExp
 GOTO MainLoop
IFDx1
 IF UMFlag=$ff THEN
	TempStr="-"
 ELSE
	TempStr=""
 ENDIF
 TempStr=TempStr+TokenSaf
 IF MID$(TempStr,1,2)="--" THEN
	TempStr=MID$(TempStr,2,LEN(TempStr)-2)
 ENDIF
 CondOp2=VAL(TempStr)
 IF CondOp1=CondOp2 AND CondValid=$ff THEN
	GenFlag(GFNdx)=$ff
 ELSE
	GenFlag(GFNdx)=0
 ENDIF
 GOTO MainLoop
 
ELSEDx
 IF GFNdx<2 THEN
	PRINT "FATAL ERROR Conditional stack error (#ELSE)"
	END
 ENDIF
 IF GenFlag(GFNdx-1)=$ff THEN
	GenFlag(GFNdx)=LNOT(GenFlag(GFNdx))
 ENDIF
 GOTO MainLoop
 
ENDIFDx
 DEC GFNdx
 IF GFNdx=0 THEN
	PRINT "FATAL ERROR Conditional stack error (#ENDIF)"
	END
 ENDIF
 CondValid=GenFlag(GFNdx)
 GOTO MainLoop
 
USEDx
 UseFilNam=""
UseLoop
 NexToken()
 IF TokenLen=0 THEN USEDx1
 UseFilNam=UseFilNam+TokenSaf
 GOTO UseLoop
USEDx1
 ON ERROR GOTO NoUseFile
 INC InpFilPtr
 IF InpFilPtr>20 THEN
	PRINT "FATAL ERROR Use Stack OverFlow"
	END
 ENDIF
 OPEN #InpFile(InpFilPtr),UseFilNam:READ
 ON ERROR
 GOTO MainLoop
NoUseFile
 PRINT "Cannot open file: ";UseFilNam
 END
 
FCNDx
 ANSIArgCtr=0
 FOR Ctr1=1 TO 9
 	ANSIArgs(Ctr1)=""
 NEXT Ctr1
 FcnSpec=0
 TokenSym()
 ErrMain
 IF SymFound=$ff THEN
	ErrNo=ErrDupSym
	ErrMain
 ENDIF
 ClrSym()
 SymTemp.DataType=FCN
 SymTemp.DataMod=0
 NexToken()
 IF TokenBuf<>"(" THEN
	ErrNo=ErrSyntax
	ErrMain
 ENDIF
 NexToken()
 IF TokenBuf="c" OR TokenBuf="C" OR TokenBuf=")" THEN
	IF TokenBuf=")" THEN
		UnDoToken()
	ENDIF
	TokenBuf="0"
 ELSE
 	WHILE TokenBuf<>")" DO
		IF ANSIArgCtr=10 THEN
			ErrNo=ErrSyntax
			GOTO MainLoop
		ENDIF
 		SELECT CASE TokenBuf
 			CASE "long"
 				INC ANSIArgCtr
 				ANSIArgs(ANSIArgCtr)="long"
 			CASE "int"
 				INC ANSIArgCtr
 				ANSIArgs(ANSIArgCtr)="long"
 			CASE "float"
 				INC ANSIArgCtr
 				ANSIArgs(ANSIArgCtr)="double"
 			CASE "real"
 				INC ANSIArgCtr
 				ANSIArgs(ANSIArgCtr)="double"
 			CASE "word"
 				INC ANSIArgCtr
 				ANSIArgs(ANSIArgCtr)="short"
 			CASE "short"
 				INC ANSIArgCtr
 				ANSIArgs(ANSIArgCtr)="short"
 			CASE "byte"
 				INC ANSIArgCtr
 				ANSIArgs(ANSIArgCtr)="char"
 			CASE "char"
 				INC ANSIArgCtr
 				ANSIArgs(ANSIArgCtr)="char"
 			CASE ELSE
 				IF TokenBuf<>"," THEN
 					ErrNo=ErrSyntax
 					GOTO MainLoop
 				ENDIF
 		ENDSELECT
 		NexToken()
 	ENDWHILE
 	TokenBuf=STR$(ANSIArgCtr)
 	UnDoToken()
 ENDIF				 			 						
 SymTemp.Detail=VAL(TokenBuf)+1000
 NexToken()
 IF TokenBuf<>")" THEN
	ErrNo=ErrSyntax
	ErrMain
 ENDIF
 SymTemp.DataSize=1\ REM  default for int
 OutBuf=""
FcnLoop
 NexToken()
 IF TokenLen=0 THEN FcnBuild
 IF TokenBuf="void" THEN
	SymTemp.DataSize=0
	TempStr="void "
 GOTO FcnLoop
 ENDIF
 IF TokenBuf="long" OR TokenBuf="int" THEN
	SymTemp.DataSize=1
	TempStr="int "
 	GOTO FcnLoop
 ENDIF
 IF TokenBuf="float" OR TokenBuf="real" THEN
	SymTemp.DataSize=2
	TempStr="double "
 GOTO FcnLoop
 ENDIF
 IF TokenBuf="pointer" THEN
	SymTemp.DataSize=SymTemp.DataSize|$00000004
	FcnSpec=BITSET(FcnSpec,0)
 GOTO FcnLoop
 ENDIF
 IF TokenBuf="global" THEN
	FcnSpec=BITSET(FcnSpec,1)
 GOTO FcnLoop
 ENDIF
 IF TokenBuf="external" THEN
	OutBuf=OutBuf+"extern "
	FcnSpec=BITSET(FcnSpec,2)
 GOTO FcnLoop
 ENDIF
 ErrNo=ErrSyntax
 GOTO MainLoop
FcnBuild
 IF FcnSpec=6 OR FcnSpec=7 THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
 ENDIF
 OutBuf=OutBuf+TempStr
 IF BITTST(FcnSpec,0) THEN
	OutBuf=OutBuf+"(*"+SymTemp.SymName+")"
 ELSE
	OutBuf=OutBuf+SymTemp.SymName
 ENDIF
 OutBuf=OutBuf+"("
 IF ANSIArgCtr=0 THEN
 	OutBuf=OutBuf+"void);"
 ELSE
 	FOR Ctr1=1 TO ANSIArgCtr
 		OutBuf=OutBuf+ANSIArgs(Ctr1)
 		IF Ctr1<>ANSIArgCtr THEN
 			OutBuf=OutBuf+","
 		ENDIF
 	NEXT Ctr1
 	OutBuf=OutBuf+");"
 ENDIF	
 GenVar
 SymInsert()
 GOTO MainLoop
 
FIXDx
 SetMask=$80
 SETDx1()
 GOTO MainLoop

LIBDx
 FOR Ctr1=5 TO LEN(SrcLine)
 	IF MID$(SrcLine,Ctr1,1)="-" THEN
 		LibList=LibList+" "
 	ENDIF
 	LibList=LibList+MID$(SrcLine,Ctr1,1)
 NEXT Ctr1
 GOTO MainLoop

STRUCTDx
 QBType=0
 ClrDatTyp()
 IF FcnFlag=$ff THEN
	ErrNo=ErrDecFcn
	GOTO MainLoop
 ENDIF
 TokenSym()
 ErrMain
 IF SymFound=$ff THEN
	ErrNo=ErrDupSym
	GOTO MainLoop
 ENDIF
 TypeFlag=$ff
 TypePtr=SymNdx
 TypeVars=0
 TypeBytes=0
 SymTemp.DataType=STRUCT
 ClrSym()
 SymInsert()
 ErrMain
StructLp
 TDataMod=0
 IF InpFilPtr=1 THEN
	INC BasicLineCtr
 ENDIF
 ReadSource()
 IF TempInt=0 THEN
	PRINT "Fatal Error: EOF in STRUCT"
	END
 ENDIF
StructLp2
 IF QBType<>0 THEN
 	NexToken()
 	IF TokenBuf="end" THEN
 		NexToken()
 		IF TokenBuf="type" THEN StructEnd
 		ErrNo=ErrSyntax
 	ENDIF
 	IF TokenBuf="endtype" THEN StructEnd
 	UnDoToken()
 ENDIF		
 IF LEFT$(SrcLine,1)="*" THEN StructLp
 IF LEFT$(SrcLine,1)="#" THEN
	INC SrcNdx
	NexToken()
	IF TokenBuf="endstruct" THEN StructEnd
	PRINT "Fatal Error: directive in structure"
	END
 ENDIF
 DimVar()
 IF DimOK=0 THEN MainLoop
 INC TypeVars
#IF risc=1
 IF DTShort=$ff THEN
 	IF MOD(TypeBytes,2)<>0 THEN
 		INC TypeBytes
 	ENDIF
 ENDIF
 IF DTLong=$ff OR DTFloat=$ff THEN
 	IF MOD(TypeBytes,4)<>0 THEN 
 		TypeBytes=TypeBytes+4-MOD(TypeBytes,4)
 	ENDIF
 ENDIF
#ELSE
 IF MOD(TypeBytes,2)=1 THEN
	IF DTShort=$ff OR DTLong=$ff OR DTFloat=$ff THEN
		INC TypeBytes
	ENDIF
 ENDIF
#ENDIF
 SymTemp.DataAddr=TypeBytes
 SymInsert()
 ErrMain 
 TypeBytes=TypeBytes+SymTemp.DataSize
 IF MultiFlag=$ff THEN
	AddMulti()
	ErrMain
 ENDIF
 GOTO StructLp
StructEnd
#IF risc=1
	IF MOD(TypeBytes,4)<>0 THEN
		TypeBytes=TypeBytes+4-MOD(TypeBytes,4)
	ENDIF
#ELSE
	IF MOD(TypeBytes,2)<>0 THEN
		INC TypeBytes
	ENDIF
#ENDIF
 SymTable(TypePtr).DataSize=TypeBytes
 SymTable(TypePtr).Detail=TypeVars
 GOTO MainLoop

ENDSTRUCTDx
 ErrNo=ErrEndStr
 GOTO MainLoop

CDx
 NexToken()
 IF TokenLen=0 THEN
 	CFlag=$ff
 ELSE
 	IF TokenBuf="var" THEN
 		CVarFlag=$ff
 	ELSE
 		IF TokenBuf="main" THEN
 			CMainFlag=$ff
 		ELSE
 			IF TokenBuf="fcn" THEN
 				CFcnFlag=$ff
 			ELSE
 				ErrNo=ErrSyntax
 			ENDIF
 		ENDIF
 	ENDIF
 ENDIF
 GOTO MainLoop

ENDCDx
 PRINT "FATAL ERROR... #ENDC sync error in line ";BasicLineCtr
 END

SBRTNDx
 LNFlag=$ff
 TokenSym()
 ErrMain
 IF SymFound<>0 THEN
	ErrNo=ErrDupSym
	GOTO MainLoop
 ENDIF
 ClrSym()
 SymTemp.DataType=LABEL
 SymTemp.DataMod=0
 SymTemp.Detail=$1ff
 SymInsert()
 ErrMain
 GOTO MainLoop
 
FORMDx
 IF FormFlag<>0 THEN
 	PRINT "Fatal Error...Nested #FORM"
 	END
 ENDIF
 IF AnyWinFlag=0 THEN
 	PRINT "FATAL ERROR.. FORM Directive in non-window program"
 	PRINT "Use '-?' to get valid command line options"
 	END
 ENDIF
 StartFlag=$ff
 FormFlag=$ff
 NexToken()
 SymTemp.SymName=TokenSaf
 SymSrch()
 IF SymFound=0 THEN
 	ErrNo=ErrUDSym
 	GOTO MainLoop
 ENDIF
 IF SymTable(SymNdx).DataType<>FORM THEN
 	ErrNo=ErrIVType
 	GOTO MainLoop
 ENDIF
 REM WinCode removed
 GOTO MainLoop

ENDFORMDx
 IF FormFlag=0 THEN
 	PRINT "Fatal Error...#ENDFORM without prior #FORM"
 	END
 ENDIF
 IF GroupFlag<>0 THEN
 	PRINT "Fatal Error...#ENDFORM with unfinished Group"
 	END
 ENDIF
 REM WinCode removed
 FormFlag=0
 GOTO MainLoop
 
GROUPDx
 IF FormFlag=0 THEN
 	PRINT "Fatal Error...#GROUP outside #FORM"
 	END
 ENDIF
 IF GroupFlag<>0 THEN
 	PRINT "Fatal Error...Nested #GROUP"
 	END
 ENDIF
 IF AnyWinFlag=0 THEN
 	PRINT "FATAL ERROR.. GROUP Directive in non-window program"
 	PRINT "Use '-?' to get valid command line options"
 	END
 ENDIF
 GroupFlag=$ff
 NexToken()
 IF TokenLen=0 THEN
 	TokenSaf="obj"
 ENDIF
 SymTemp.SymName=TokenSaf
 SymSrch()
 IF SymFound=0 THEN
 	ErrNo=ErrUDSym
 	GOTO MainLoop 	
 ENDIF
 IF SymTable(SymNdx).DataType<>OBJECT AND SymTable(SymNdx).DataMod=GROUP THEN
 	ErrNo=ErrIVType
 	GOTO MainLoop
 ENDIF
 REM WinCode removed
 GOTO MainLoop
 
ENDGROUPDx
 IF GroupFlag=0 THEN
 	PRINT "Fatal Error...#ENDGROUP without prior #GROUP"
 	END
 ENDIF
 REM WinCode removed
 GroupFlag=0
 GOTO MainLoop

FDESIGNDx
 REM WinCode removed

S1
* DATA
 IF DataFlag=0 THEN
	DataFlag=$ff
	IF LabelFlag=0 OR SymTable(SymNdx).DataMod<>DataBit THEN
		PRINT "FATAL ERROR... DATA block with no label in line ";BasicLineCtr
		END
	ENDIF
	LastStmt="data"\ REM  needed for first 'DATA' in block
	Remark()
	GenVar
	OutBuf="unsigned char "+SymbolSaf+"[]={"
	GenVar
 ENDIF
 NeedComma=0
DATALoop
 NexToken()
 IF TokenLen=0 THEN
	GOTO MainLoop
 ENDIF
 IF NeedComma=0 AND TokenBuf="," THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
 ENDIF
 IF NeedComma=$ff AND TokenBuf="," THEN
	NeedComma=0
	GOTO DATALoop
 ENDIF
 IF TokenType=TTypQuote THEN
	TempStr=MID$(TokenSaf,2,LEN(TokenSaf)-2)
	GOTO NextData
 ENDIF
 IF TokenType=TTypHex THEN
	ValidHex()
	IF HexOK=0 THEN
		ErrNo=ErrIVExp
		GOTO MainLoop
	ENDIF
	TempStr="0x"+MID$(TokenSaf,2,LEN(TokenSaf)-1)
	GOTO NextData
 ENDIF
 IF TokenType=TTypInt THEN
	ValidInt()
	IF IntOK=0 THEN
		ErrNo=ErrIVExp
		GOTO MainLoop
	ENDIF
	TempStr=TokenSaf
	GOTO NextData
 ENDIF
 IF TokenType=TTypFloat THEN
	ValidFlt()
	IF FloatOK=0 THEN
		ErrNo=ErrIVExp
		GOTO MainLoop
	ENDIF
	TempStr=TokenSaf
	GOTO NextData
 ENDIF
 IF TokenType=TTypSym THEN
	IF TokenBuf="true" OR TokenBuf="false" THEN
		IF TokenBuf="true" THEN
			TempStr="1"
		ELSE
			TempStr="0"
		ENDIF
		GOTO NextData
	ENDIF
	TokenSym1()
	ErrMain
	IF SymFound=0 THEN
		ErrNo=ErrUDSym
		GOTO MainLoop
	ENDIF
	IF SymTable(SymNdx).DataType<>0 THEN
		ErrNo=ErrTypMis
		GOTO MainLoop
	ENDIF
	Konstant=SymTable(SymNdx).Detail
	TempStr=STR$(Konstant)
	GOTO NextData
 ENDIF
 ErrNo=ErrSyntax
NextData
 OutBuf=""
 IF TempStr="" THEN
	TempStr=CHR$($80)
 ENDIF
 FOR Ctr1=1 TO LEN(TempStr)
	OutBuf=OutBuf+"'"+MID$(TempStr,Ctr1,1)+"',"
 NEXT Ctr1
 OutBuf=OutBuf+"0,"
 GenVar
 NeedComma=$ff
 GOTO DATALoop
 
S2
* RESTORE
 LNFlag=$ff
 TokenSym()
 ErrMain
 IF SymFound=0 THEN
	SymTemp.DataType=LABEL
	ClrSym()
	SymTemp.Detail=$ff
	SymTemp.DataMod=DataBit
	SymInsert()
	ErrMain
 ENDIF
 IF SymTable(SymNdx).DataType<>LABEL OR SymTable(SymNdx).DataMod<>DataBit THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
 ENDIF
 OutBuf="_DataPtr=(unsigned char *)"+SymbolSaf+";"
 GenCode
 OutBuf="_DataPtrSaf=_DataPtr;"
 GenCode
 GOTO MainLoop
 
S3
* POKE
 GetIntOp()\ rem get addr
 ErrMain
 OutBuf="*((long*)&_Poker)=_d0;"
 GenCode
 CommaMain
 GetIntOp()\ rem get data
 ErrMain
 OutBuf="*_Poker=_d0;"
 GenCode
 GOTO MainLoop
 
S4
* RETURN
 IF FcnFlag=0 THEN
	ErrNo=ErrFSNest
	GOTO MainLoop
 ENDIF
 IF FcnActive<>VoidFcn THEN
	Expr()
	IF TSymName="~" THEN
		IF FcnActive=IntFcn THEN
			TSymName="_d0"
		ELSE
			TSymName="_d0f"
		ENDIF
	ENDIF
 ELSE
	TSymName=""
 ENDIF
 OutBuf="return"+" "+TSymName+";"
 GenFcn
 IF CSP=0 THEN
	OutBuf="}"
	GenFcn
	FcnFlag=0
	IF LastSym>FcnSym AND SbrtnFlag=0 THEN
		FOR SymNdx=FcnSym+1 TO LastSym
			ClrSymTab()
		NEXT SymNdx
		LastSym=FcnSym
	ENDIF
	IF LastMulti<FcnMulti AND SbrtnFlag=0 THEN
		FOR MultiNdx=FcnMulti TO LastMulti STEP -1
			ClrSymTab()
		NEXT MultiNdx
		LastMulti=FcnMulti
	ENDIF
	SbrtnFlag=0
 ENDIF
 GOTO MainLoop
 
S5
* SEEK
 DiskIO=$ff
 GetPthNum()
 ErrMain
 Expr()
 ErrMain
 IF OpClass<>INTClass AND OpClass<>FLTClass THEN
        ErrNo=ErrTypMis
        ErrMain
 ENDIF
 IF TSymName="~" THEN
        IF OpClass=INTClass THEN
                TSymName="_d0"
        ELSE
                TSymName="_d0f"
        ENDIF
 ENDIF
 IF ANSIFile=0 THEN
 	OutBuf="STATUS=lseek(_IOPthNum,(long)"+TSymName+",0);"
 	GenCode
 	CallErr()
 ELSE
 	OutBuf="STATUS=fseek(_FilePtr,"+TSymName+",SEEK_SET);"
 	GenCode
 	IF StatFlag=0 THEN
 		OutBuf="if (STATUS != 0) longjmp(_ebuf,1);"
 		GenCode
 	ENDIF
 ENDIF
 GOTO MainLoop
 
S6
* TYPE
 QBType=0
 ClrDatTyp()
 IF FcnFlag=$ff THEN
	ErrNo=ErrDecFcn
	GOTO MainLoop
 ENDIF
 TokenSym()
 ErrMain
 IF SymFound=$ff THEN
	ErrNo=ErrDupSym
	GOTO MainLoop
 ENDIF
 TypeFlag=$ff
 TypePtr=SymNdx
 TypeVars=0
 TypeBytes=0
 SymTemp.DataType=STRUCT
 ClrSym()
 SymInsert()
 ErrMain
 NexToken()
 IF TokenLen=0 THEN
 	QBType=$ff
 	GOTO StructLp\ REM must be QB style
 ENDIF
 IF TokenBuf<>"=" THEN
	ErrNo=ErrSyntax
 ENDIF
TYPE1
 DimVar()
 IF DimOK=0 THEN MainLoop
 INC TypeVars
#IF risc=1
 IF DTShort=$ff THEN
 	IF MOD(TypeBytes,2)<>0 THEN
 		INC TypeBytes
 	ENDIF
 ENDIF
 IF DTLong=$ff OR DTFloat=$ff THEN
 	IF MOD(TypeBytes,4)<>0 THEN 
 		TypeBytes=TypeBytes+4-MOD(TypeBytes,4)
 	ENDIF
 ENDIF
#ELSE
 IF MOD(TypeBytes,2)=1 THEN
	IF DTShort=$ff OR DTLong=$ff OR DTFloat=$ff THEN
		INC TypeBytes
	ENDIF
 ENDIF
#ENDIF
 SymTemp.DataAddr=TypeBytes
 SymInsert()
 ErrMain 
 TypeBytes=TypeBytes+SymTemp.DataSize
 IF MultiFlag=$ff THEN
	AddMulti()
	ErrMain
 ENDIF
 IF TokenLen=0 THEN
#IF risc=1
	IF MOD(TypeBytes,4)<>0 THEN
		TypeBytes=TypeBytes+4-MOD(TypeBytes,4)
	ENDIF
#ELSE
	IF MOD(TypeBytes,2)<>0 THEN
		INC TypeBytes
	ENDIF
#ENDIF
	SymTable(TypePtr).DataSize=TypeBytes
	SymTable(TypePtr).Detail=TypeVars
	GOTO MainLoop
 ENDIF
 GOTO TYPE1

S7
* DIM
 IF FcnFlag=$ff AND FcnVarFlg=0 THEN
	ErrNo=ErrDecFcn
	GOTO MainLoop
 ENDIF
 GblVarFlg=0
 DimVar()
 IF DimOK=0 THEN MainLoop
 SymInsert()
 ErrMain
 REM WinCode removed
 DecVar()
 IF MultiFlag=$ff THEN
	AddMulti()
 ENDIF
 GOTO MainLoop
 
SetFcnPtr
 Remark()
 GenCode
 IF LAND(SymTable(SymNdx).DataSize,$00000004)=0 THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
 ENDIF
 Op1Name=SymTable(SymNdx).SymName
 Op1DataSize=SymTable(SymNdx).DataSize
 EqualMain
 NexToken()
 SymTemp.SymName=TokenSaf
 SymSrch()
 IF SymFound=0 THEN
	SymTemp.DataType=VOIDX
 ELSE
	SymTemp=SymTable(SymNdx)
 ENDIF
 IF SymTemp.DataType=FCN THEN
	IF SymTemp.Detail<1000 THEN
		ErrNo=ErrTypMis
		GOTO MainLoop
	ENDIF
	TSymName=SymTemp.SymName
	TempStr="=(long)"
 ELSE
	UnDoToken()
	Expr()
	IF DMVector<>0 THEN
		VecSymNam()
		TempStr="="
	ELSE
		TempStr="=(long)"
	ENDIF
	IF TDataType<>LONG AND DMAddr=0 THEN
		ErrNo=ErrTypMis
		GOTO MainLoop
	ENDIF
 ENDIF
 OutBuf="*((long*)&"+Op1Name+")"+TempStr+TSymName+";"
 GenCode
 GOTO MainLoop

S8
* LET
 EnableAuto=$ff\ REM allows auto-dimision
 IF ProcFlag=$ff THEN
	Target=0
 ELSE
	Target=$ff
	LetFlag=$ff
 ENDIF
 Expr()
 ErrMain
 IF ProcFlag=$ff THEN MainLoop
 IF DMConst=$ff THEN
	ErrNo=ErrIVExp
	GOTO MainLoop
 ENDIF
 Op1Name=TSymName
 Op1Class=OpClass
 Op1Type=TDataType
 Op1Mod=TDataMod
 Op1Detail=TDetail
 Op1DataSize=TDataSize
 IF Op1Name="NextArg" THEN
	ErrNo=ErrIVTarg
	GOTO MainLoop
 ENDIF
 IF LAND(TempBit,Op1Mod)<>0 AND LAND(VectorBit,Op1Mod)=0 THEN
	ErrNo=ErrIVTarg
	GOTO MainLoop
 ENDIF
 IF LAND(FileBit,Op1Mod)=FileBit THEN
	ErrNo=ErrIVTarg
	GOTO MainLoop
 ENDIF 
 NexToken()
 IF TokenBuf=":" THEN
	NexToken()
 ENDIF
 IF TokenBuf<>"=" THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
 ENDIF
 IF Op1Type=LONG THEN\ REM Function pointer assignment
	NexToken()
	SymTemp.SymName=TokenSaf
	SymSrch()
	IF SymFound=$ff AND SymTable(SymNdx).DataType=FCN AND NextByte<>"(" THEN
		OutBuf="_d0=(long)"+SymTable(SymNdx).SymName+";"
		GenCode
		StoreD0()
		GOTO MainLoop
	ENDIF
	UnDoToken()
 ENDIF
 LetFlag=0
 GetExp()
 ErrMain
 Target=0
 ProcExp()
 ErrMain
 ClassOp()
 Op2Name=TSymName
 Op2Class=OpClass
 Op2Type=TDataType
 Op2Mod=TDataMod
 Op2Detail=TDetail
 NexToken()
 IF TokenLen<>0 THEN\ REM check for junk on end
 	ErrNo=ErrSyntax
 	GOTO MainLoop
 ENDIF
 IF Op2Name="NextArg" THEN ProcCmd
 IF Op1Class<>Op2Class THEN\ REM  int=float for example
	EXITIF Op1Class=INTClass AND Op2Class=FLTClass
	EXITIF Op1Class=FLTClass AND Op2Class=INTClass
	ErrNo=ErrTypMis
	GOTO MainLoop
 ENDIF
 IF Op1Class=INTClass OR Op1Class=FLTClass OR Op1Class=BOOLClass THEN
       IF TSymName<>"~" THEN
		TDataType=Op1Type
                GetDtaTyp()
		IF LAND(Op1Mod,$7f)=0 AND Op2Mod=ConstBit THEN
			IF Op2Type=BOOLEAN THEN
				Op2Name=STR$(Op2Detail)
			ENDIF
			OutBuf=Op1Name+"="+Op2Name+";"
			GenCode
			GOTO MainLoop
		ENDIF
		IF LAND(Op1Mod,$7f)=0 AND LAND(Op2Mod,$7f)=0 AND Op1Type=Op2Type THEN
			IF Op1Mod=0 And Op2Mod=0 THEN
				OutBuf=Op1Name+"="+Op2Name+";"
			ENDIF
			GenCode
			GOTO MainLoop
		ENDIF
		InitReg0
		LoadReg()
		ErrMain
	ENDIF
	StoreD0()
	GOTO MainLoop
 ENDIF
 IF Op1Class=STRClass THEN
	OutBuf="_MovStr(&"+Op1Name+",&"+Op2Name+");"
	GenCode
	GOTO MainLoop
 ENDIF
 IF Op1Class=CPXClass OR Op1Class=ARRClass THEN
	IF LAND(Op1Mod,VectorBit)=0 THEN
		OutBuf="_DestAddr="+Op1Name+";"
	ELSE
		OutBuf="_DestAddr="+Op1Name+"._Ptr;"
	ENDIF
	GenCode
	IF LAND(Op2Mod,VectorBit)=0 THEN
		OutBuf="_SrcAddr="+Op2Name+";"
	ELSE
		OutBuf="_SrcAddr="+Op2Name+"._Ptr;"
	ENDIF
	GenCode
	IF Op1Class=ARRClass THEN
		TempInt=Op1DataSize
	ELSE
		TempInt=SymTable(Op1Detail).DataSize
	ENDIF	
	OutBuf="_BlkCnt="+STR$(TempInt)+";"
	GenCode
	OutBuf="while (_BlkCnt)"
	GenCode
	OutBuf="{"
	GenCode
	OutBuf="*((unsigned char*)_DestAddr)=*((unsigned char*)_SrcAddr);"
	GenCode
	OutBuf="*((long*)&_DestAddr)=(long)_DestAddr+1;"
	GenCode
	OutBuf="*((long*)&_SrcAddr)=(long)_SrcAddr+1;"
	GenCode
	OutBuf="_BlkCnt--;"
	GenCode
	OutBuf="}"
	GenCode
	GOTO MainLoop
 ENDIF
 IF Op1Class=BOOLClass THEN
	InitReg0
	LoadReg()
	ErrMain
	StoreD0()
	GOTO MainLoop
 ENDIF
 IF Op1Class=OBJClass THEN
 	ErrNo=ErrIVType
 	GOTO MainLoop
 ENDIF
 IF Op1Class=FRMClass THEN
 	ErrNo=ErrIVType
 	GOTO MainLoop
 ENDIF 
 PRINT "Internal Error"
 END

ProcCmd
 IF Op1Class<>STRClass THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
 ENDIF
 OutBuf="_MovArg(&"+Op1Name+",_ArgList);"
 GenCode
 GOTO MainLoop
 
S9
* FOR
 TokenSym()
 ErrMain
 IF SymFound=0 AND FcnFlag<>0 AND SbrtnFlag=0 THEN
	ErrNo=ErrUDSym
	GOTO MainLoop
 ENDIF
 IF SymFound=0 THEN
	IF RIGHT$(SymbolSaf,4)="_Str" OR AutoDim=0 THEN
		ErrNo=ErrUDSym
		GOTO MainLoop
	ELSE
		SymTemp.DataType=LONG
		SymTemp.DataMod=0
		ClrSym()
		SymTemp.DataSize=4
		SymInsert()
		ErrMain
		VarBlank()
		Comment="Automatic Variable Declaration"
		BldComment()
		GenVar
		OutBuf="long "+SymbolSaf+";"
		GenVar
		VarBlank()
	ENDIF
 ENDIF
 IncConStk()
 ErrMain
 CS(CSP).LoopName=SymTemp.SymName
 SymTemp=SymTable(SymNdx)
 ClassOp1()
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
 ENDIF
 GetLopVec()
 ErrMain
 CS(CSP).LoopVec=LopVarNdx
 CS(CSP).ConType=5
 CS(CSP).ConLine=BasicLineCtr
 EqualMain
 Expr()
 ErrMain
 IF TSymName="~" THEN
	TSymName="_d0"
 ENDIF
 IF DMVector=$ff THEN
	VecSymNam()
 ENDIF
* set initial value into loop var
 OutBuf=CS(CSP).LoopName+"="+TSymName+";"
 GenCode
 NexToken()
 IF TokenBuf<>"to" THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
 ENDIF
 Expr()
 ErrMain
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
 ENDIF
 IF TSymName<>"~" AND DMConst<>0 THEN
	CS(CSP).ImmTo=$ff
	CS(CSP).ImmToVal=TSymName
 ELSE
	CS(CSP).ImmTo=0
 ENDIF
 IF TSymName="~" THEN
	TSymName="_d0"
 ENDIF
 IF DMVector=$ff THEN
	VecSymNam()
 ENDIF
 IF CS(CSP).ImmTo=0 THEN
	OutBuf="_LopVec"+STR$(LopVarNdx)+"._Limit="+TSymName+";"
	GenCode
 ENDIF
 NexToken()
 IF TokenLen=0 THEN
	CS(CSP).NoStep=$ff
 ELSE
	IF TokenBuf<>"step" THEN
		ErrNo=ErrSyntax
		GOTO MainLoop
	ENDIF
	CS(CSP).NoStep=0
	Expr()
	IF OpClass<>INTClass THEN
		ErrNo=ErrTypMis
		GOTO MainLoop
	ENDIF
	ErrMain
	CS(CSP).NegImmStep=0
	IF TSymName<>"~" AND DMConst<>0 THEN
		CS(CSP).ImmStep=$ff
		CS(CSP).ImmStepVal=TSymName
		IF LEN(TSymName)=10 THEN
			IF Mid$(TSymName,3,1)>"7" THEN
				CS(CSP).NegImmStep=$ff
			ENDIF
		ENDIF
	ELSE
		CS(CSP).ImmStep=0
		IF TSymName="~" THEN
			TSymName="_d0"
		ENDIF
		IF DMVector=$ff THEN
			VecSymNam()
		ENDIF
		OutBuf="_LopVec"+Str$(LopVarNdx)+"._Step="+TSymName+";"
		GenCode
	ENDIF
 ENDIF
 INC LabelNum
 OutBuf="_Lbl"+STR$(LabelNum)+":;"
 GenCode
 CS(CSP).LoopLabel=LabelNum
 INC LabelNum
 CS(CSP).ContLabel=LabelNum
 INC LabelNum
 CS(CSP).TermLabel=LabelNum
* compare loopvar to "to" value
 IF CS(CSP).ImmStep=$ff AND CS(CSP).NegImmStep=0 OR CS(CSP).NoStep=$ff THEN
	IF CS(CSP).ImmTo=$ff THEN
		OutBuf="if ("+CS(CSP).LoopName+">"+CS(CSP).ImmToVal+") goto _Lbl"+STR$(CS(CSP).TermLabel)+";"
		GenCode
	ELSE
		OutBuf="if ("+CS(CSP).LoopName+">_LopVec"+STR$(CS(CSP).LoopVec)+"._Limit) goto _Lbl"+STR$(CS(CSP).TermLabel)+";"
		GenCode
	ENDIF
 ENDIF
 IF CS(CSP).ImmStep=$ff AND CS(CSP).NegImmStep=$ff THEN
	IF CS(CSP).ImmTo=$ff THEN
		OutBuf="if ("+CS(CSP).LoopName+"<"+CS(CSP).ImmToVal+") goto _Lbl"+STR$(CS(CSP).TermLabel)+";"
		GenCode
	ELSE
		OutBuf="if ("+CS(CSP).LoopName+"<_LopVec"+STR$(CS(CSP).LoopVec)+"._Limit) goto _Lbl"+STR$(CS(CSP).TermLabel)+";"
		GenCode
	ENDIF
 ENDIF
 IF CS(CSP).ImmStep=0 AND CS(CSP).NoStep=0 THEN
	IF CS(CSP).ImmTo=0 THEN
		OutBuf="if ((_LopVec"+STR$(LopVarNdx)+"._Step>=0) && ("+CS(CSP).LoopName+">_LopVec"+STR$(CS(CSP).LoopVec)+"._Limit)) goto _Lbl"+STR$(CS(CSP).TermLabel)+";"
		GenCode
		OutBuf="if ((_LopVec"+STR$(LopVarNdx)+"._Step<0) && ("+CS(CSP).LoopName+"<_LopVec"+STR$(CS(CSP).LoopVec)+"._Limit)) goto _Lbl"+STR$(CS(CSP).TermLabel)+";"
		GenCode
	ELSE
		OutBuf="if ((_LopVec"+STR$(LopVarNdx)+"._Step>=0) && ("+CS(CSP).LoopName+">"+CS(CSP).ImmToVal+")) goto _Lbl"+STR$(CS(CSP).TermLabel)+";"
		GenCode
		OutBuf="if ((_LopVec"+STR$(LopVarNdx)+"._Step<0) && ("+CS(CSP).LoopName+"<"+CS(CSP).ImmToVal+")) goto _Lbl"+STR$(CS(CSP).TermLabel)+";"
		GenCode
	ENDIF
 ENDIF
 GOTO MainLoop
 
S10
* IF
 CmpOps()
 ErrMain
 INC LabelNum
 IF TokenLen=0 THEN StructIF\ REM This makes the 'THEN' optional
 IF TokenBuf<>"then" THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
 ENDIF
 NexToken()
 IF TokenLen=0 THEN StructIF
 LNFlag=$ff
 TokenSym1()
 ErrMain
 IF SymFound=0 THEN
	ClrSym()
	SymTemp.DataType=LABEL
	SymTemp.DataMod=0
	SymTemp.Detail=$ff
	SymInsert()
	ErrMain
 ENDIF
 IF SymTable(SymNdx).DataType<>7 THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
 ENDIF
 OutBuf="if (_True==0) goto _Lbl"+STR$(LabelNum)+";"
 GenCode
 OutBuf="goto "+SymTemp.SymName+";"
 GenCode
 OutBuf="_Lbl"+STR$(LabelNum)+":;"
 GenCode
 GOTO MainLoop
StructIF
 IncConStk()
 ErrMain
 CS(CSP).TermLabel=LabelNum
 CS(CSP).ConType=0
 CS(CSP).ConLine=BasicLineCtr
 OutBuf="if (_True==0) goto _Lbl"+STR$(LabelNum)+";"
 GenCode
 GOTO MainLoop
 
S11
* GOTO
 LNFlag=$ff
 TokenSym()
 ErrMain
 IF SymFound=0 THEN
	ClrSym()
	SymTemp.DataType=LABEL
	SymTemp.DataMod=0
	SymTemp.Detail=$ff
	SymInsert()
	ErrMain
 ENDIF
 TempInt=SymTable(SymNdx).Detail
 IF SymTable(SymNdx).DataType<>LABEL OR TempInt&$100<>0 THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
 ENDIF
 OutBuf="goto "+SymbolSaf+";"
 GenCode
 GOTO MainLoop
 
S12
* GOSUB
 LNFlag=$ff
 TokenSym()
 ErrMain
 IF SymFound=0 THEN
	ClrSym()
	SymTemp.DataType=LABEL
	SymTemp.DataMod=0
	SymTemp.Detail=$1ff
	SymInsert()
	ErrMain
 ENDIF
 TempInt=SymTable(SymNdx).Detail
 IF SymTable(SymNdx).DataType<>LABEL OR TempInt&$100<>$100 THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
 ENDIF
 OutBuf=SymbolSaf+"();"
 GenCode
 GOTO MainLoop
 
S13
* ON
 LNFlag=$ff
 NeedComma=$00
 JmpArgs=0
 NexToken()
 IF TokenBuf="error" THEN ON_ERROR
 UnDoToken()
 INC LabelNum
 INC TableNum
 GetIntOp()\ rem get test integer
 ErrMain
 NexToken()
 IF TokenBuf="goto" OR TokenBuf="gosub" THEN
	IF TokenBuf="goto" THEN
		ToSubFlag=0
	ELSE
		ToSubFlag=$ff
	ENDIF
 ELSE
	ErrNo=ErrSyntax
	GOTO MainLoop
 ENDIF
 SrcNdxSaf=SrcNdx
ChkArgs
 NexToken()
 IF TokenLen=0 THEN MakSwitch
 IF TokenBuf="," AND NeedComma=$ff THEN
	NeedComma=0
	GOTO ChkArgs
 ENDIF
 IF TokenBuf="," AND NeedComma=0 THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
 ENDIF
 IF TokenBuf<>"," AND NeedComma=$ff THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
 ENDIF
 TokenSym1()
 ErrMain
 IF SymFound=0 THEN
	SymTemp.DataType=LABEL
	ClrSym()
	SymTemp.DataMod=0
	IF ToSubFlag=0 THEN
		SymTemp.Detail=$ff
	ELSE
		SymTemp.Detail=$1ff
	ENDIF
	SymInsert()
	ErrMain
 ENDIF
 TempInt=SymTable(SymNdx).Detail
 TDataType=SymTable(SymNdx).DataType
 IF TDataType=FCN AND SymTable(SymNdx).DataSize=0 AND TempInt=$3f2 THEN
    REM Make VOID FCN look like SBRTN
    TDataType=LABEL
    TempInt=$100
 ENDIF
 IF TDataType<>LABEL THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
 ENDIF
 IF ToSubFlag=0 AND TempInt&$100<>0 THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
 ENDIF
 IF ToSubFlag=$ff AND TempInt&$100<>$100 THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
 ENDIF
 INC JmpArgs
 NeedComma=$ff
 GOTO ChkArgs
MakSwitch
 SrcNdx=SrcNdxSaf
 OutBuf="switch (_d0)"
 GenCode
 OutBuf="{"
 GenCode
 Ctr1=0
MakCase
 NexToken()
 IF TokenLen=0 THEN
	OutBuf="}"
	GenCode
	GOTO MainLoop
 ENDIF
 IF TokenBuf="," THEN MakCase
 TokenSym1()
 INC Ctr1
 OutBuf="case "+STR$(Ctr1)+":"
 GenCode
 IF ToSubFlag=0 THEN
	OutBuf="goto "+SymTemp.SymName+";"
 ELSE
	OutBuf=SymTemp.SymName+"();"
	GenCode
	OutBuf="break;"
 ENDIF
 GenCode
 GOTO MakCase
ON_ERROR
 IF FcnFlag<>0 THEN
	ErrNo=ErrERRTrp
	GOTO MainLoop
 ENDIF
 NexToken()
 OutBuf="_ErrFlag=setjmp(_ebuf);"
 GenCode
 IF TokenLen=0 THEN
	OutBuf="if (_ErrFlag) goto ErrExit;"
	GenCode
	GOTO MainLoop
 ENDIF
 IF TokenBuf<>"goto" THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
 ENDIF
 TokenSym()
 ErrMain
 IF SymFound=0 THEN
	SymTemp.DataType=LABEL
	ClrSym()
	SymTemp.DataMod=0
	SymTemp.Detail=$ff
	SymInsert()
	ErrMain
 ENDIF
 IF SymTable(SymNdx).DataType<>7 THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
 ENDIF
 OutBuf="if (_ErrFlag) goto "+SymTemp.SymName+";"
 GenCode
 GOTO MainLoop
 
S14
* PRINT
 DevChk()
 PrintFlag=$ff
 IF DevFlag=$ff THEN
	PrtPthFlg=$ff
	GetPthNum1()
	ErrMain
	PrtPthFlg=0
 ELSE
	OutBuf="_PrtPthNum=1;"
	GenCode
 ENDIF
 NexToken()
 IF TokenBuf="using" THEN PrtUsing
 UnDoToken()
PrintLp
 NexToken()
 IF TokenLen=0 THEN PrintEx
 UnDoToken()
 Expr()
 ErrMain
 IF TDataType=VOIDX THEN PrtArgSep
 IF TabFlag=$ff THEN
	TabFlag=0
	GOTO PrtArgSep
 ENDIF
 IF TDataType<>STRING OR DMAddr=$ff THEN
	MakString()
	ErrMain
 ENDIF
 ClassOp()
 OutBuf="_PrintStr(&"+TSymName+",_BufSize);"
 GenCode
 CallErr()
 GenXfrCnt()
PrtArgSep
 NexToken()
 IF FileIO<>0 THEN
	GenNewLine
	IF TokenBuf="," OR TokenBuf=";" THEN
		IF NextByte<>"" THEN PrintLp
	ENDIF
	GOTO PrintEx
 ENDIF
 IF TokenBuf="," THEN
	OutBuf="_PrintTab(0);"
	GenCode
	CallErr()
	GenXfrCnt()
	IF NextByte="" THEN PrintEx
	GOTO PrintLp
 ENDIF
 IF TokenBuf=";" THEN
	IF NextByte="" THEN PrintEx
	GOTO PrintLp
 ENDIF
PrintEx
 IF TokenBuf<>"," AND TokenBuf<>";" THEN
	IF FileIO=0 THEN
		GenCRLF
	ENDIF
	OutBuf="POS=0;"
	GenCode
 ENDIF
 GOTO MainLoop

PrtUsing
 UnDoToken()
 Expr()
 GOTO MainLoop

S15
* INPUT
 EnableAuto=$ff\ REM allows auto-dimision
 DevChk()
 IF DevFlag=$ff THEN
	GetPthNum1()
	ErrMain
 ELSE
	OutBuf="_IOPthNum=0;"
	GenCode
 ENDIF
 IF FileIO=0 THEN
	NexToken()
	UnDoToken()
	IF TokenType=TTypQuote THEN
		Expr()
		ErrMain
		OutBuf="STATUS=write(1,(char *)"+TSymName+"._Ptr,"+TSymName+"._Len);"
		GenCode
		CommaMain
	ELSE
		OutBuf="STATUS=write(1,&_Prompt,1);"
		GenCode
	ENDIF
	CallErr()
 ENDIF
 Target=$ff
 LOOP
 	Expr()
 	ErrMain
 	IF DMVector=0 THEN
		Vectorize()
		ErrMain
		ClassOp()
 	ENDIF
 	IF DMVector=$ff AND DMTemp=0 THEN
		SetTmpVec()
		ErrMain
 	ENDIF
 	OutBuf="_InpData(&"+TSymName+","+STR$(TDataType)+",_BufSize);"
 	GenCode
 	CallErr()
 	GenXfrCnt()
 	NexToken()
 	EXITIF TokenBuf<>","
 ENDLOOP
 IF FileIO=0 AND NewLine=$0d THEN
	GenCRLF
 ENDIF
 GOTO MainLoop
 
S16
* READ
 EnableAuto=$ff\ REM allows auto-dimision
 NeedComma=0
 NexToken()
 IF TokenBuf="#" THEN FileRead\ REM Path# read
 SymTemp.SymName=TokenSaf
 SymSrch()
 IF SymFound=0 THEN
	ErrNo=ErrUDSym
	GOTO MainLoop
 ENDIF
 SymTemp=SymTable(SymNdx)
 IF SymTemp.DataMod&FileBit=FileBit THEN FileRead\ REM File ptr read
 UnDoToken()
 Target=$ff
 ReadFlag=$ff
lbl8161
 IF NeedComma=$ff THEN
	NexToken()
	IF TokenLen=0 THEN MainLoop
	IF TokenBuf<>"," THEN
		ErrNo=ErrSyntax
		GOTO MainLoop
	ELSE
		NeedComma=0
	ENDIF
 ENDIF
 GetExp()
 ErrMain
 IF TokenLen=0 THEN MainLoop
 ProcExp()
 ErrMain
 ClassOp()
 GetBase()
 IF TDataType=COMPVAR OR TDataType>6 THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
 ENDIF
 IF DMAddr=$ff THEN
	TDataType=LONG
 ENDIF
 IF TDataType=BOOLEAN THEN
	OutBuf="_ReadBool((long)_a0);"\ REM Cast for ansi proto
	GenCode
	GOTO lbl8164
 ENDIF
 IF TDataType=BYTE THEN
	OutBuf="_ReadByte((long)_a0);"\ REM Cast for ansi proto
	GenCode
	GOTO lbl8164
 ENDIF
 IF TDataType=SHORT THEN
	OutBuf="_ReadShort((long)_a0);"\ REM Cast for ansi proto
	GenCode
	GOTO lbl8164
 ENDIF
 IF TDataType=LONG THEN
	OutBuf="_ReadLong((long)_a0);"\ REM Cast for ansi proto
	GenCode
	GOTO lbl8164
 ENDIF
 IF TDataType=FLOAT THEN
	OutBuf="_ReadFlt((long)_a0);"\ REM Cast for ansi proto
	GenCode
	GOTO lbl8164
 ENDIF
 IF TDataType=STRING THEN
	OutBuf="_ReadStr((long)_a0,"+STR$(TDetail)+");"\ REM Cast for ansi proto
	GenCode
	GOTO lbl8164
 ENDIF
lbl8164
 NeedComma=$ff
 GOTO lbl8161
FileRead
 UnDoToken()
 ReadWrite()
 ErrMain
 OutBuf="_DataPtr=(unsigned char *)_a0;"
 GenCode
 OutBuf="_BlkCnt="+STR$(SymTemp.Detail)+";"
 GenCode
 INC LabelNum\ REM Start label
 INC LabelNum\ REM Finish label
 INC LabelNum\ REM Error label
 IF ANSIFile=0 THEN
 	OutBuf="_Lbl"+STR$(LabelNum-2)+":;"
 	GenCode
 	OutBuf="STATUS=read(_IOPthNum,_IOBuffer,1);"
 	GenCode
 	OutBuf="if (STATUS == -1) goto _Lbl"+STR$(LabelNum)+";"
 	GenCode
 	OutBuf="if (STATUS == 0) goto _Lbl"+STR$(LabelNum-1)+";"
 	GenCode
 	OutBuf="if (_IOBuffer[0] == _NewLine) goto _Lbl"+STR$(LabelNum-1)+";"
 	GenCode
 	OutBuf="*_DataPtr=_IOBuffer[0];"
 	GenCode
 	OutBuf="_DataPtr++;"
 	GenCode
 	OutBuf="_BlkCnt--;"
 	GenCode
 	OutBuf="if (_BlkCnt == 0) goto _Lbl"+STR$(LabelNum)+";"
 	GenCode
 	OutBuf="goto _Lbl"+STR$(LabelNum-2)+";"
 	GenCode
 	OutBuf="_Lbl"+STR$(LabelNum-1)+":;"
 	GenCode
 	OutBuf="*_DataPtr=0;"
 	GenCode
 	OutBuf="_Lbl"+STR$(LabelNum)+":;"
 	GenCode
 	CallErr()
 ELSE
 	OutBuf="_Lbl"+STR$(LabelNum-2)+":;"
 	GenCode
 	OutBuf="STATUS=fread(_IOBuffer,1,1,_FilePtr);"
 	GenCode 	
 	IF StatFlag=0 THEN
 		OutBuf="if (ferror(_FilePtr) != 0) longjmp(_ebuf,1);"
 		GenCode
 	ENDIF 	 	
 	OutBuf="if (STATUS == 0) goto _Lbl"+STR$(LabelNum-1)+";"
 	GenCode
 	OutBuf="if (_IOBuffer[0] == _NewLine) goto _Lbl"+STR$(LabelNum-1)+";"
 	GenCode
 	OutBuf="*_DataPtr=_IOBuffer[0];"
 	GenCode
 	OutBuf="_DataPtr++;"
 	GenCode
 	OutBuf="_BlkCnt--;"
 	GenCode
 	OutBuf="if (_BlkCnt == 0) goto _Lbl"+STR$(LabelNum)+";"
 	GenCode
 	OutBuf="goto _Lbl"+STR$(LabelNum-2)+";"
 	GenCode
 	OutBuf="_Lbl"+STR$(LabelNum-1)+":;"
 	GenCode
 	OutBuf="*_DataPtr=0;"
 	GenCode
 	OutBuf="_Lbl"+STR$(LabelNum)+":;"
 	GenCode
 	rem error test here
 ENDIF
 GenXfrCnt()
 GOTO MainLoop
 
S17
* WRITE
 ReadWrite()
 ErrMain
 OutBuf="XferCount=_StrLen(&"+TSymName+");"
 GenCode
 OutBuf="_XferAddr=(char *)_a0;"
 GenCode
 GenWrite
 OutBuf="_XferAddr=&_NewLine;"
 GenCode
 OutBuf="XferCount=1;"
 GenCode
 GenWrite
 GOTO MainLoop
 
S18
* GET
 GetPut()
 ErrMain
 GenRead
 GOTO MainLoop
 
S19
* PUT
 GetPut()
 ErrMain
 GenWrite
 GOTO MainLoop
 
S20
* END
 NexToken()
 IF TokenLen<>0 THEN
 	LastStmt=LastStmt+TokenBuf\ REM prevents bug involving false 'end'
 	IF TokenBuf="if" THEN S29
 	IF TokenBuf="loop" THEN S33
 	IF TokenBuf="while" THEN S25
 	IF TokenBuf="exit" THEN S48
 	IF TokenBuf="select" THEN S74
 	IF TokenBuf="case" THEN S76
 	ErrNo=ErrSyntax
 	GOTO MainLoop
 ENDIF
 OutBuf="exit(0);"
 GenCode
 GOTO MainLoop
 
S21
* CREATE
 CrOpFlag=$ff
 Target=$ff
 GetPthNum()
 ErrMain
 Target=0
 GetPthNam()
 ErrMain
 ColonMain
 GetAccMod()
 IF ANSIFile=0 THEN
 	IF Machine=0 OR Machine=5 OR Machine=7 THEN
	 	INC LabelNum
	 	ErrMain
	 	OutBuf="STATUS=open(_IOBuffer,A_READ);"
	 	GenCode
	 	OutBuf="if (STATUS != -1)"
	 	GenCode
	 	OutBuf="{"
	 	GenCode
		OutBuf="close(STATUS);"
	 	GenCode
	 	OutBuf="STATUS=-1;"
	 	GenCode
	 	OutBuf="errno=E_EXIST;"
	 	GenCode
	 	OutBuf="goto _Lbl"+STR$(LabelNum)+";"
	 	GenCode
	 	OutBuf="}"
	 	GenCode
	 	OutBuf="STATUS=creat(_IOBuffer,"+CreatMode+");"
	 	GenCode
	 	OutBuf=PathVar+"=STATUS;"
	 	GenCode
	 	OutBuf="_Lbl"+STR$(LabelNum)+":;"
	 	GenCode
 	ELSE
	 	OutBuf="STATUS=open(_IOBuffer,"+AccMode+","+CreatMode+");"
	 	GenCode
	 	OutBuf=PathVar+"=STATUS;"
	 	GenCode
 	ENDIF
 	CallErr()
 ELSE
 	OutBuf="_FilePtr=fopen(_IOBuffer,"+CHR$($22)+AccMode+CHR$($22)+");"
 	GenCode
 	OutBuf=PathVar+"=*((long*)&_FilePtr);"
 	GenCode
 	OutBuf="STATUS=*((long*)&_FilePtr);"
 	GenCode
 	IF StatFlag=0 THEN
 		OutBuf="if (_FilePtr == NULL) longjmp(_ebuf,1);"
 		GenCode
 	ENDIF
 ENDIF
 GOTO MainLoop
 
S22
* OPEN
 CrOpFlag=0
 Target=$ff
 GetPthNum()
 ErrMain
 Target=0
 GetPthNam()
 ErrMain
 ColonMain
 GetAccMod()
 ErrMain
 IF ANSIFile=0 THEN
 	IF DirFlag=$ff THEN
		AccMode=AccMode+"|A_DIR"
 	ENDIF
 	OutBuf="STATUS=open(_IOBuffer,"+AccMode+");"
 	GenCode
 	OutBuf=PathVar+"=STATUS;"
 	GenCode
 	CallErr()
 ELSE
 	OutBuf="_FilePtr=fopen(_IOBuffer,"+CHR$($22)+AccMode+CHR$($22)+");"
 	GenCode
 	OutBuf=PathVar+"=*((long*)&_FilePtr);"
 	GenCode
 	OutBuf="STATUS=*((long*)&_FilePtr);"
 	GenCode
 	IF StatFlag=0 THEN
 		OutBuf="if (_FilePtr == NULL) longjmp(_ebuf,1);"
 		GenCode
 	ENDIF
 ENDIF
 GOTO MainLoop
 
S23
* CLOSE
 DiskIO=$ff
CloseLp
 GetPthNum()
 ErrMain
 IF ANSIFile=0 THEN
 	OutBuf="STATUS=close(_IOPthNum);"
 	GenCode
 	CallErr()
 ELSE
 	OutBuf="STATUS=fclose(_FilePtr);"
 	GenCode
 	IF StatFlag=0 THEN
 		OutBuf="if (STATUS != 0) longjmp(_ebuf,1);"
 		GenCode
 	ENDIF
 ENDIF
 NexToken()
 IF TokenLen=0 THEN MainLoop
 IF TokenBuf<>"," THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
 ENDIF
 GOTO CloseLp
 
S24
* WHILE
 INC LabelNum
 OutBuf="_Lbl"+STR$(LabelNum)+":;"
 GenCode
 CmpOps()
 ErrMain
 IF TokenLen<>0 THEN\ REM This test makes the 'DO' optional
 	IF TokenBuf<>"do" THEN
		ErrNo=ErrSyntax
		GOTO MainLoop
 	ENDIF
 ENDIF
 IncConStk()
 ErrMain
 CS(CSP).LoopLabel=LabelNum
 CS(CSP).ContLabel=LabelNum\ REM For consistancy with CONTINUE statement
 INC LabelNum
 CS(CSP).TermLabel=LabelNum
 CS(CSP).ConType=1
 CS(CSP).ConLine=BasicLineCtr
 OutBuf="if (_True==0) goto _Lbl"+STR$(LabelNum)+";"
 GenCode
 GOTO MainLoop
 
S25
* ENDWHILE
 TempInt=1
 CSChk()
 ErrMain
 OutBuf="goto _Lbl"+STR$(CS(CSP).LoopLabel)+";"
 GenCode
 OutBuf="_Lbl"+STR$(CS(CSP).TermLabel)+":;"
 GenCode
 DEC CSP
 GOTO MainLoop
 
S26
* NEXT
 IF CSP=0 THEN
	ErrNo=ErrUBCon
	GOTO MainLoop
 ENDIF
 NexToken()
 IF TokenLen=0 THEN
 	TokenSaf=CS(CSP).LoopName
 ENDIF
 IF TokenSaf<>CS(CSP).LoopName THEN
	ErrNo=ErrUBCon
	GOTO MainLoop
 ENDIF
 TempInt=5
* The following conditional code prevents unused label warnings on os9, os9000, and Amiga
 IF Machine=0 OR Machine=5 OR Machine=7 THEN
	 OutBuf="goto _Lbl"+STR$(CS(CSP).ContLabel)+";"
	 GenCode
 ENDIF
 OutBuf="_Lbl"+STR$(CS(CSP).ContLabel)+":;"
 GenCode
 CSChk()
 ErrMain
* add "step" to loop var
 IF CS(CSP).NoStep=$ff THEN
	OutBuf=CS(CSP).LoopName+"++;"
	GenCode
 ELSE
	IF CS(CSP).ImmStep=0 THEN
		OutBuf=CS(CSP).LoopName+"="+CS(CSP).LoopName+"+_LopVec"+STR$(CS(CSP).LoopVec)+"._Step;"
		GenCode
	ELSE
		OutBuf=CS(CSP).LoopName+"="+CS(CSP).LoopName+"+"+CS(CSP).ImmStepVal+";"
		GenCode
	ENDIF
 ENDIF
* branch back to loop beginning
 OutBuf="goto _Lbl"+STR$(CS(CSP).LoopLabel)+";"
 GenCode
* generate done label
 OutBuf="_Lbl"+STR$(CS(CSP).TermLabel)+":;"
 GenCode
 DEC CSP
 GOTO MainLoop
 
S27
* REM
 GOTO MainLoop
 
S28
* ELSE
 NexToken()\ REM  make sure nothing follows
 IF TokenLen<>0 THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
 ENDIF
 TempInt=0
 CSChk()
 ErrMain
 INC LabelNum
 OutBuf="goto _Lbl"+STR$(LabelNum)+";"
 GenCode
 OutBuf="_Lbl"+STR$(CS(CSP).TermLabel)+":;"
 GenCode
 CS(CSP).TermLabel=LabelNum
 GOTO MainLoop
 
S29
* ENDIF
 TempInt=0
 CSChk()
 ErrMain
 OutBuf="_Lbl"+STR$(CS(CSP).TermLabel)+":;"
 GenCode
 DEC CSP
 GOTO MainLoop
 
S30
* DELETE
 GetPthNam()
 ErrMain
 OutBuf="STATUS=unlink(_IOBuffer);"
 GenCode
 CallErr()
 GOTO MainLoop
 
S31
* BUFFER
 TokenSym()
 ErrMain
 BufName=SymTemp.SymName
 IF SymFound=0 THEN
	OutBuf=""
	GenVar
	Comment="Memory Buffer"
	BldComment()
	GenVar
	ClrSym()
	SymTemp.DataMod=0
	SymTemp.DataType=BUFFER
	SymTemp.DataSize=8
	SymInsert()
	ErrMain
	OutBuf="_buffer "+BufName+";"
	GenVar
 ENDIF
 TDataType=SymTable(SymNdx).DataType
 IF TDataType<>BUFFER THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
 ENDIF
 EqualMain
 Expr()
 IF DMConst=$ff AND TSymName="0x0" THEN
	OutBuf="free("+BufName+"._BufPtr);"
	GenCode
 ELSE
	IF TSymName<>"~" THEN
		InitReg0
		LoadReg()
		ErrMain
	ENDIF
	OutBuf=BufName+"._BufSiz=_d0;"
	GenCode
	OutBuf="*((long*)&"+BufName+"._BufPtr)=(long)malloc(_d0);"
	GenCode
	OutBuf="if (*((long*)&"+BufName+"._BufPtr) == 0) "+BufName+"._BufSiz=0;"
	GenCode
 ENDIF
 GOTO MainLoop
 
S32
* LOOP
 IncConStk()
 ErrMain
 NexToken()
 IF TokenLen=0 THEN
	CS(CSP).ConType=3
 ELSE
	INC LopCtrNum
	IF LopCtrNum>9 THEN
		ErrNo=ErrTmpUse
		GOTO MainLoop
	ENDIF
	IF TokenBuf<>"count" THEN
		ErrNo=ErrSyntax
		GOTO MainLoop
	ENDIF
	EqualMain
	GetIntOp()
 	ErrMain
	OutBuf="_LoopCtr["+STR$(LopCtrNum)+"]=_d0;"
	GenCode
	CS(CSP).ConType=4
 ENDIF
 CS(CSP).ConLine=BasicLineCtr
 INC LabelNum
 OutBuf="_Lbl"+STR$(LabelNum)+":;"
 GenCode
 CS(CSP).LoopLabel=LabelNum
 CS(CSP).ContLabel=LabelNum\ REM For consistancy with CONTINUE statement
 INC LabelNum
 CS(CSP).TermLabel=LabelNum
 GOTO MainLoop
 
S33
* ENDLOOP
 TempInt=3
 CSChk()
 IF ErrNo<>0 THEN
	ErrNo=0
	TempInt=4
	CSChk()
	ErrMain
 ENDIF
 IF TempInt=3 THEN
	OutBuf="goto _Lbl"+STR$(CS(CSP).LoopLabel)+";"
 ELSE
	OutBuf="_LoopCtr["+STR$(LopCtrNum)+"]--;"
	GenCode
	OutBuf="if (_LoopCtr["+STR$(LopCtrNum)+"] !=0) goto _Lbl"+STR$(CS(CSP).LoopLabel)+";"
	DEC LopCtrNum
 ENDIF
 GenCode
* The following conditional code prevents unused label warnings on os9, os9000, and Amiga
 IF Machine=0 OR Machine=5 OR Machine=7 THEN
	 OutBuf="goto _Lbl"+STR$(CS(CSP).TermLabel)+";"
	 GenCode
 ENDIF
 OutBuf="_Lbl"+STR$(CS(CSP).TermLabel)+":;"
 GenCode
 DEC CSP
 GOTO MainLoop
 
S34
* REPEAT
 IncConStk()
 ErrMain
 INC LabelNum
 OutBuf="_Lbl"+STR$(LabelNum)+":;"
 GenCode
 CS(CSP).LoopLabel=LabelNum
 CS(CSP).ConLine=BasicLineCtr
 CS(CSP).ConType=2
 INC LabelNum
 CS(CSP).ContLabel=LabelNum
 INC LabelNum
 CS(CSP).TermLabel=LabelNum
 GOTO MainLoop
 
S35
* UNTIL
 TempInt=2
 CSChk()
 ErrMain
* The following conditional code prevents unused label warnings on os9, os9000, and Amiga
 IF Machine=0 OR Machine=5 OR Machine=7 THEN
	 OutBuf="goto _Lbl"+STR$(CS(CSP).ContLabel)+";"
	 GenCode
 ENDIF
 OutBuf="_Lbl"+STR$(CS(CSP).ContLabel)+":;"
 GenCode
 CmpOps()
 ErrMain
 IF TokenLen<>0 THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
 ENDIF
 OutBuf="if (_True==0) goto _Lbl"+STR$(CS(CSP).LoopLabel)+";"
 GenCode
* The following conditional code prevents unused label warnings on os9, os9000, and Amiga
 IF Machine=0 OR Machine=5 OR Machine=7 THEN
	 OutBuf="goto _Lbl"+STR$(CS(CSP).TermLabel)+";"
	 GenCode
 ENDIF
 OutBuf="_Lbl"+STR$(CS(CSP).TermLabel)+":;"
 GenCode
 DEC CSP
 GOTO MainLoop
 
S36
* EXITIF
 CmpOps()
 ErrMain
 IF CSP<1 THEN
	ErrNo=ErrUBCon
	GOTO MainLoop
 ENDIF
 IF TokenLen=0 THEN
	OutBuf="if (_True) goto _Lbl"+STR$(CS(CSP).TermLabel)+";"
	GenCode
	GOTO MainLoop
 ENDIF
 IF TokenBuf<>"then" THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
 ENDIF
 NexToken()
 IF TokenLen<>0 THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
 ENDIF
 IncConStk()
 ErrMain
 INC LabelNum
 CS(CSP).TermLabel=LabelNum
 CS(CSP).ConLine=BasicLineCtr
 CS(CSP).ConType=6
 OutBuf="if (_True==0) goto _Lbl"+STR$(LabelNum)+";"
 GenCode
 GOTO MainLoop

S37
* SHELL
 Expr()
 IF TDataType<>STRING THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
 ENDIF
 OutBuf="_MovStr(&_IOBufVec,&"+TSymName+");"
 GenCode
 OutBuf="system(_IOBuffer);"
 GenCode
 GOTO MainLoop

S38
* FPRINT
 FileIO=$ff
 GOTO S14

S39
* FINPUT
 FileIO=$ff
 GOTO S15

S40
* BASE
 NexToken()
 IF TokenBuf<>"0" AND TokenBuf<>"1" THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
 ENDIF
 IF TokenBuf="0" THEN
	ArrayBase=0
 ELSE
	ArrayBase=1
 ENDIF
 GOTO MainLoop

S41
* INC
 DecInc="++"
INCx1
 Target=$ff
 Expr()
 ErrMain
 FcnOp1Nam=TSymName
 IF DMConst=$ff THEN
	ErrNo=ErrIVExp
	GOTO MainLoop
 ENDIF
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
 ENDIF
 IF DMAddr=0 THEN
	IF VectorBit&TDataMod=VectorBit THEN
		OutBuf="(*(("+_DataType+"*)"+SymTemp.SymName+"._Ptr))"+DecInc+";"
	ELSE
		OutBuf=SymTemp.SymName+DecInc+";"
	ENDIF
 ELSE
	GetVarSiz()
	IF VectorBit&TDataMod=VectorBit THEN
		OutBuf="*((long*)&"+SymTemp.SymName+"._Ptr)=(long)"+SymTemp.SymName+"._Ptr"+LEFT$(DecInc,1)+STR$(VarSize)+";"
		GenCode
		OutBuf="*((long*)_a0)=(long)"+SymTemp.SymName+"._Ptr;"
	ELSE
		OutBuf=SymTemp.SymName+"="+SymTemp.SymName+LEFT$(DecInc,1)+STR$(VarSize)+";"
	ENDIF
 ENDIF
 GenCode
 GOTO MainLoop

S42
* DEC
 DecInc="--"
 GOTO INCx1

S43
* BUFREAD
 BufRW()
 ErrMain
 GenRead
 GOTO MainLoop

S44
* BUFWRITE
 BufRW()
 ErrMain
 GenWrite
 GOTO MainLoop

S52
* DIGITS
 DigDec=$ff
 GOTO Decimals1

S45
* DECIMALS
 DigDec=0
Decimals1
 GetIntOp()
 ErrMain
 IF DigDec=0 THEN
	OutBuf="_Decimals=_d0;"
 ELSE
	OutBuf="_Digits=_d0;"
 ENDIF
 GenCode
 GOTO MainLoop

S46
* EXCHANGE
 Target=$ff
 Expr()
 ErrMain
 IF DMConst=$ff THEN
	ErrNo=ErrIVExp
	GOTO MainLoop
 ENDIF
 Op1Name=TSymName
 Op1Class=OpClass
 Op1Type=TDataType
 Op1Mod=TDataMod
 Op1Detail=TDetail
 Op1DataSize=TDataSize
 IF Op1Name="NextArg" THEN
	ErrNo=ErrIVTarg
	GOTO MainLoop
 ENDIF
 CommaMain
 Expr()
 ErrMain
 IF DMConst=$ff THEN
	ErrNo=ErrIVExp
	GOTO MainLoop
 ENDIF
 Op2Name=TSymName
 Op2Class=OpClass
 Op2Type=TDataType
 Op2Mod=TDataMod
 Op2Detail=TDetail
 Op2DataSize=TDataSize
 IF Op2Name="NextArg" THEN
	ErrNo=ErrIVTarg
	GOTO MainLoop
 ENDIF
 IF Op1Type<>Op2Type THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
 ENDIF
 IF Op1Class<>CPXClass AND Op1DataSize<>Op2DataSize THEN
	IF Op1Type<>STRING THEN
		ErrNo=ErrTypMis
		GOTO MainLoop
	ELSE
		IF Op1Detail<>Op2Detail THEN
			ErrNo=ErrTypMis
			GOTO MainLoop
		ENDIF
	ENDIF
 ENDIF
 IF Op1Class=CPXClass AND SymTable(Op1Detail).DataSize<>SymTable(Op2Detail).DataSize THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
 ENDIF
 IF Op1Class=FLTClass OR Op1Class=INTClass OR Op1Class=BOOLClass THEN
	Promote=$ff
	SymTemp.SymName=Op1Name
	LoadReg()
	ErrMain
	SymTemp.SymName=Op2Name
	LoadReg()
	ErrMain
	TempStr=Op1Name
	Op1Name=Op2Name
	Op2Name=TempStr
	StoreD0()
	ErrMain
	OutBuf="_d0=_d1;"
	GenCode
	Op1Name=Op2Name
	StoreD0()
	GOTO MainLoop
 ENDIF
 IF Op1Class=CPXClass OR Op1Class=ARRClass OR Op1Type=STRING THEN
	IF LAND(Op1Mod,VectorBit)=0 THEN
		OutBuf="_DestAddr="+Op1Name+";"
	ELSE
		OutBuf="_DestAddr="+Op1Name+"._Ptr;"
	ENDIF
	GenCode
	IF LAND(Op2Mod,VectorBit)=0 THEN
		OutBuf="_SrcAddr="+Op2Name+";"
	ELSE
		OutBuf="_SrcAddr="+Op2Name+"._Ptr;"
	ENDIF
	GenCode
	IF Op1Class=ARRClass THEN
		TempInt=Op1DataSize
	ELSE
		IF Op1Type=STRING THEN
			TempInt=Op1Detail
		ELSE
			TempInt=SymTable(Op1Detail).DataSize
		ENDIF
	ENDIF		
	OutBuf="_BlkCnt="+STR$(TempInt)+";"	
	GenCode
	OutBuf="while (_BlkCnt)"
	GenCode
	OutBuf="{"
	GenCode
	OutBuf="_True=*((unsigned char*)_DestAddr);"
	GenCode
	OutBuf="*((unsigned char*)_DestAddr)=*((unsigned char*)_SrcAddr);"
	GenCode
	OutBuf="*((unsigned char*)_SrcAddr)=_True;"
	GenCode
	OutBuf="*((long*)&_DestAddr)=(long)_DestAddr+1;"
	GenCode
	OutBuf="*((long*)&_SrcAddr)=(long)_SrcAddr+1;"
	GenCode	
	OutBuf="_BlkCnt--;"
	GenCode
	OutBuf="}"
	GenCode
	GOTO MainLoop	
 ENDIF
 ErrNo=ErrIVType
 GOTO MainLoop

ProcFcn
 FcnFlag=$ff
 FcnSym=LastSym
 FcnBlkNdx=1
 ParmFlag=$ff
* NexToken()
* IF TokenBuf<>"(" THEN
*	ErrNo=ErrSyntax
*	GOTO MainLoop
* ENDIF
* NexToken()
* IF TokenBuf=")" THEN\ REM  (done)
*	FcnHeader=FcnHeader+LEFT$(SrcLine,SrcNdx-1)
*	GOTO MainLoop
* ENDIF
* ErrNo=ErrSyntax
 FcnHeader=FcnHeader+TokenSaf+"("
 GOTO MainLoop

S47
* VACANT
 GOTO MainLoop

S48
* ENDEXIT
 TempInt=6
 CSChk()
 ErrMain
 OutBuf="goto _Lbl"+STR$(CS(CSP-1).TermLabel)+";"
 GenCode
 OutBuf="_Lbl"+STR$(CS(CSP).TermLabel)+":;"
 GenCode
 DEC CSP
 GOTO MainLoop

S49
* STARTWIN Statement
 REM WinCode removed
 GOTO MainLoop

S50
* PARAM
 IF ProcedureFlag<>0 THEN ParamType2
 IF ParmFlag=0 THEN
	ErrNo=ErrParam
	GOTO MainLoop
 ENDIF
 GblVarFlg=0
 DimVar()
 IF DimOK=0 THEN MainLoop
 IF RIGHT$(FcnHeader,1)<>"(" THEN
	FcnHeader=FcnHeader+","
 ENDIF
 FcnHeader=FcnHeader+SymTemp.SymName
 INC ParmCtr
 SymInsert()
 ErrMain
 DecVar()
 IF MultiFlag=$ff THEN
	AddMulti()
 ENDIF
 GOTO MainLoop
ParamType2
 REM This type of PARAM is to declare a var and get it from command line or file
 GOTO MainLoop

S51
* SETVEC
 TokenSym()
 ErrMain
 IF SymFound=0 THEN
	ErrNo=ErrUDSym
	GOTO MainLoop
 ENDIF
 ProcName=SymTemp.SymName
 IF SymTable(SymNdx).DataType=STRING THEN
	VDetail=SymTable(SymNdx).Detail
 ELSE
	VDetail=0
 ENDIF
 TDataMod=SymTable(SymNdx).DataMod
 IF LAND(TDataMod,VectorBit)=0 THEN\ REM Not a vector
	ErrNo=ErrTypMis
	GOTO MainLoop
 ENDIF
 EqualMain
 GetIntOp()
 ErrMain
 OutBuf="*((long*)&"+ProcName+"._Ptr)=_d0;"
 GenCode
 IF VDetail<>0 THEN\ REM  must be STRING.. do rest of vector
	NexToken()
	IF TokenLen=0 THEN
		OutBuf=ProcName+"._Len="+STR$(VDetail)+";"
	ELSE
		IF TokenBuf<>"," THEN
			ErrNo=ErrSyntax
			GOTO MainLoop
		ENDIF
		GetIntOp()
 		ErrMain
		OutBuf=ProcName+"._Len=_d0;"
	ENDIF
	GenCode
	OutBuf="*((long*)&"+ProcName+"._Lnk)=0;"
	GenCode
 ENDIF
 GOTO MainLoop

S53
* Show
 REM WinCode removed
 GOTO MainLoop

S54
* SETWIN
 IF AnyWinFlag=0 THEN
 	PRINT "FATAL ERROR.. SET Statement in non-window program"
 	PRINT "Use '-?' to get valid command line options"
 	END
 ENDIF
 
S55
* FREEZE
 REM WinCode removed
 GOTO MainLoop

S56
* UNFREEZE
 REM WinCode removed
 GOTO MainLoop
 
S57
* REDRAW
 REM WinCode removed
 GOTO MainLoop
 
S58
* RINGBELL
 IF AnyWinFlag=0 THEN
 	PRINT "FATAL ERROR.. RINGBELL Statement in non-window program"
 	PRINT "Use '-?' to get valid command line options"
 	END
 ENDIF
 REM WinCode removed
 GOTO MainLoop
 
S59
* HIDE
 REM WinCode removed
 GOTO MainLoop
  
S60
* ADDOBJECT
 REM WinCode removed
 GOTO MainLoop

S61
* DELOBJECT
 REM WinCode removed
 GOTO MainLoop
 
S62
* ACTIVATE
 REM WinCode removed
 GOTO MainLoop

S63
* DEACTIVATE
 REM WinCode removed
 GOTO MainLoop
 
S64
* FOCUS
 REM WinCode removed
 GOTO MainLoop

S65
* TRIGGER
 REM WinCode removed
 GOTO MainLoop
 
S66
* RANDOMIZE
 IF os9=0 THEN
 	NexToken()
 	IF TokenLen<>0 THEN
 		UnDoToken()
 		GetIntOp()
 		ErrMain
 		OutBuf="srand(_d0);"
 	ELSE
 		OutBuf="srand(time(NULL)/2);"
 	ENDIF
 	GenCode
 ELSE
 	PRINT "Warning... RANDOMIZE not available on this version"
 ENDIF
 GOTO MainLoop
 
S67
* GETMOUSE (form or root)
 REM WinCode removed
 GOTO MainLoop
 
S68
* SETMOUSE (root)
 REM WinCode removed
 GOTO MainLoop
 
S69
* SCALE (root)
 REM WinCode removed
 GOTO MainLoop
 
S70
* EXIT
 NexToken()
 IF TokenBuf="if" THEN S36
 ErrNo=ErrSyntax
 GOTO MainLoop
 
S71
* WEND
 GOTO S25\ REM Turn into ENDWHILE
 
S72
* CONTINUE
 NexToken()
 IF TokenBuf<>"if" THEN
 	ErrNo=ErrSyntax
 	GOTO MainLoop
 ENDIF
 IF CSP<1 THEN
	ErrNo=ErrUBCon
	GOTO MainLoop
 ENDIF
 TempInt=CS(CSP).ConType
 IF TempInt<0 OR TempInt>5 THEN\ REM Only for FOR/NEXT, LOOP/ENDLOOP, REPEAT/UNTIL/, WHILE/ENDWHILE
	ErrNo=ErrUBCon
	GOTO MainLoop
 ENDIF
 CmpOps()
 OutBuf="if (_True) goto _Lbl"+STR$(CS(CSP).ContLabel)+";"
 GenCode
 GOTO MainLoop
 
S73
* SELECT
 IF SelectFlag<>0 THEN
 	ErrNo=ErrUBCon
 	GOTO MainLoop
 ENDIF
 SelectFlag=$ff
 NexToken()
 IF TokenBuf<>"case" THEN
 	ErrNo=ErrSyntax
 	GOTO MainLoop
 ENDIF
 Expr()
 ErrMain
 IF OpClass<>STRClass AND OpClass<>INTClass THEN
 	ErrNo=ErrIVType
 	GOTO MainLoop
 ENDIF
 IF OpClass=INTClass AND TSymName<>"~" THEN
	InitReg0
	LoadReg()
	ErrMain
 ENDIF
 SwitchClass=OpClass
 IF OpClass=INTClass THEN
 	OutBuf="_SwitchInt=_d0;"
 ELSE
 	 OutBuf="_SwitchStr="+TSymName+";"
 ENDIF
 GenCode
 IncConStk()
 ErrMain
 CS(CSP).ConLine=BasicLineCtr
 CS(CSP).ConType=7
 INC LabelNum
 CS(CSP).TermLabel=LabelNum	
 GOTO MainLoop
 
S74
* ENDSELECT
 IF SelectFlag=0 THEN
 	ErrNo=ErrUBCon
 	GOTO MainLoop
 ENDIF
 IF CaseFlag<>0 THEN
 	EndCasex()
 	CaseFlag=0
 ENDIF
 SelectFlag=0
 CaseElseFlag=0
 TempInt=7
 CSChk()
 ErrMain
 OutBuf="_Lbl"+STR$(CS(CSP).TermLabel)+":;"
 GenCode
 DEC CSP
 GOTO MainLoop 

S75
* CASE
 IF SelectFlag=0 OR CaseElseFlag<>0 THEN
 	ErrNo=ErrUBCon
 	GOTO MainLoop
 ENDIF
 IF CaseFlag<>0 THEN
 	EndCasex()
 ENDIF
 CaseFlag=$ff
 INC LabelNum
 CS(CSP).ConLine=BasicLineCtr
 CS(CSP).ConType=7
 CS(CSP).ContLabel=LabelNum
 NexToken()
 IF TokenBuf="else" THEN
 	CaseElseFlag=$ff
 ELSE
 	UnDoToken()
 	Expr()
 	ErrMain
 	IF OpClass<>STRClass AND OpClass<>INTClass THEN
 		ErrNo=ErrIVType
 		GOTO MainLoop
 	ENDIF
 	IF OpClass=INTClass AND TSymName<>"~" THEN
		InitReg0
		LoadReg()
		ErrMain
 	ENDIF
 	IF OpClass<>SwitchClass THEN
 		ErrNo=ErrTypMis
 		GOTO MainLoop
 	ENDIF
 	CaseToFlag=0
 	NexToken()
 	IF TokenLen<>0 THEN
 		IF TokenBuf="to" THEN
 			CaseToFlag=$ff
 		ELSE
 			ErrNo=ErrSyntax
 			GOTO MainLoop
 		ENDIF
 	ENDIF
 	IF CaseToFlag=0 THEN
 		SymType="!="
 		GenCase()
 	ELSE
 		SymType="<"
 		GenCase()
 		REM Get second arg here
 		D0Loaded=0
 		Expr()
 		ErrMain
 		IF OpClass<>STRClass AND OpClass<>INTClass THEN
 			ErrNo=ErrIVType
 			GOTO MainLoop
 		ENDIF
 		IF OpClass=INTClass AND TSymName<>"~" THEN
			InitReg0
			LoadReg()
			ErrMain
 		ENDIF
 		IF OpClass<>SwitchClass THEN
 			ErrNo=ErrTypMis
 			GOTO MainLoop
 		ENDIF
 		SymType=">"
 		GenCase() 	
 	ENDIF
 ENDIF	
 GOTO MainLoop
 
S76
* ENDCASE
 IF SelectFlag=0 OR CaseFlag=0 THEN
 	ErrNo=ErrUBCon
 	GOTO MainLoop
 ENDIF
 CaseFlag=0
 EndCasex()
 GOTO MainLoop
 
S77
* CONST
 GOTO FIXDx
 
S78
* SWAP
 GOTO S46\ REM go do exchange
 
S79
* PROGRAM
 StartFlag=$ff
 GOTO MainLoop

S80
* HEXOUT
 NexToken()
 IF TokenBuf="=" THEN
 	NexToken()
 ENDIF
 SELECT CASE LEFT$(TokenBuf,1)
 	CASE "m"
 		HexType=0
 	CASE "i"
 		HexType=1
 	CASE "c"
 		HexType=2
 	CASE "n"
 		HexType=3
 	CASE ELSE
 		ErrNo=ErrSyntax
 ENDSELECT
 GOTO MainLoop
 
S81
* MAKELOWER
 Expr()
 IF OpClass<>STRClass THEN
 	ErrNo=ErrIVType
 	GOTO MainLoop
 ENDIF
 OutBuf="_LCase(&"+TSymName+");"
 GenCode
 GOTO MainLoop

S82
* MAKEUPPER
 Expr()
 IF OpClass<>STRClass THEN
 	ErrNo=ErrIVType
 	GOTO MainLoop
 ENDIF
 OutBuf="_UCase(&"+TSymName+");"
 GenCode
 GOTO MainLoop
 
S83
* FILL
 GetIntOp()\ rem get addr
 ErrMain
 OutBuf="*((long*)&_Poker)=_d0;"
 GenCode
 CommaMain
 GetIntOp()\ rem get count
 ErrMain
 OutBuf="_ArgSafe0=_d0;"
 GenCode
 NexToken()
 IF TokenLen=0 THEN
 	OutBuf="_d0=0"
 	GenCode
 ELSE
 	IF TokenBuf<>"," THEN
 		ErrNo=ErrSyntax
 		GOTO MainLoop
 	ENDIF
 	GetIntOp()\ rem get data
 	ErrMain
 ENDIF
 OutBuf="while (_ArgSafe0){"
 GenCode
 OutBuf="*_Poker=_d0;"
 GenCode
 OutBuf="_Poker++;"
 GenCode
 OutBuf="_ArgSafe0--;}"
 GenCode
 GOTO MainLoop

S84
* INIT
 Expr()
 IF TDataType<>BUFFER THEN
 	IF TDataType<1 OR TDataType>6 THEN
 		IF TDataType<>COMPLEX THEN
 			ErrNo=ErrIVType
 			GOTO MainLoop
 		ENDIF
 	ENDIF
 	GetBase()
 	OutBuf="*((long*)&_Poker)=_a0;"
 	GenCode 
 	OutBuf="_ArgSafe0="+STR$(TDataSize)+";"
 	GenCode	
 ELSE
 	OutBuf="*((long*)&_Poker)=(long)"+TSymName+"._BufPtr;"
 	GenCode
	OutBuf="_ArgSafe0="+TSymName+"._BufSiz;"
	GenCode
 ENDIF 
 NexToken()
 IF TokenLen=0 THEN
 	OutBuf="_d0=0;"
 	GenCode
 ELSE
 	IF TokenBuf<>"," THEN
 		ErrNo=ErrSyntax
 		GOTO MainLoop
 	ENDIF
 	GetIntOp()\ rem get data
 	ErrMain
 ENDIF
 OutBuf="while (_ArgSafe0){"
 GenCode
 OutBuf="*_Poker=_d0;"
 GenCode
 OutBuf="_Poker++;"
 GenCode
 OutBuf="_ArgSafe0--;}"
 GenCode
 GOTO MainLoop

S85
* SETBUFADR
 TokenSym()
 ErrMain
 BufName=SymTemp.SymName
 IF SymFound=0 THEN
	OutBuf=""
	GenVar
	Comment="Memory Buffer"
	BldComment()
	GenVar
	ClrSym()
	SymTemp.DataMod=0
	SymTemp.DataType=BUFFER
	SymTemp.DataSize=8
	SymInsert()
	ErrMain
	OutBuf="_buffer "+BufName+";"
	GenVar
 ENDIF
 IF SymTemp.DataType<>BUFFER THEN\ REM Not a buffer
	ErrNo=ErrTypMis
	GOTO MainLoop
 ENDIF
 EqualMain
 GetIntOp()
 ErrMain
       OutBuf="*((long*)&"+BufName+"._BufPtr)=_d0;"
 GenCode
 GOTO MainLoop
  
KeyTable DATA "data"
 DATA "restore"
 DATA "poke"
 DATA "return"
 DATA "seek"
 DATA "type"
 DATA "dim"
 DATA "let"
 DATA "for"
 DATA "if"
 DATA "goto"
 DATA "gosub"
 DATA "on"
 DATA "print"
 DATA "input"
 DATA "read"
 DATA "write"
 DATA "get"
 DATA "put"
 DATA "end"
 DATA "create"
 DATA "open"
 DATA "close"
 DATA "while"
 DATA "endwhile"
 DATA "next"
 DATA "rem"
 DATA "else"
 DATA "endif"
 DATA "delete"
 DATA "buffer"
 DATA "loop"
 DATA "endloop"
 DATA "repeat"
 DATA "until"
 DATA "exitif"
 DATA "shell"
 DATA "fprint"
 DATA "finput"
 DATA "base"
 DATA "inc"
 DATA "dec"
 DATA "bufread"
 DATA "bufwrite"
 DATA "decimals"
 DATA "exchange"
 DATA "Vacant"
 DATA "endexit"
 DATA "startwin"
 DATA "param"
 DATA "setvec"
 DATA "digits"
 DATA "show"
 DATA "setwin"
 DATA "freeze"
 DATA "unfreeze"
 DATA "redraw"
 DATA "ringbell"
 DATA "hide"
 DATA "addobject"
 DATA "delobject"
 DATA "activate"
 DATA "deactivate"
 DATA "focus"
 DATA "trigger"
 DATA "randomize"
 DATA "getmouse"
 DATA "setmouse"
 DATA "scale"
 DATA "exit"
 DATA "wend"
 DATA "continue"
 DATA "select"
 DATA "endselect"
 DATA "case"
 DATA "endcase"
 DATA "const"
 DATA "swap"
 DATA "program"
 DATA "hexout"
 DATA "makelower"
 DATA "makeupper"
 DATA "fill"
 DATA "init"
 DATA "setbufadr"
 DATA "%"
 
SOTable DATA "color"\ REM 1
 DATA "shortcut"\ REM 2
 DATA "position"\ REM 3
 DATA "size"\ REM 4
 DATA "menu_item_shortcut"\ REM 5
 DATA "input_cursor_position"\ REM 6
 DATA "dim_item"\ REM 7
 DATA "bounds"\ REM 8
 DATA "add_item"\ REM 9
 DATA "label_text"\ REM 10
 DATA "xbounds"\ REM 11
 DATA "add_browser_line"\ REM 12
 DATA "load_browser"\ REM 13
 DATA "bitmap"\ REM 14
 DATA "pixmap"\ REM 15
 DATA "delete_item"\ REM 16
 DATA "ybounds"\ REM 17
 DATA "delete_browser_line"\ REM 18
 DATA "select_browser_line"\ REM 19
 DATA "return"\ REM 20
 DATA "deselect_browser_line"\ REM 21
 DATA "clear"\ REM 22
 DATA "xgrid"\ REM 23
 DATA "countup"\ REM 24
 DATA "suspend"\ REM 25
 DATA "resume"\ REM 26
 DATA "replace_item"\ REM 27
 DATA "ygrid"\ REM 28
 DATA "replace_browser_line"\ REM 29
 DATA "insert_browser_line"\ REM 30
 DATA "input_color"\ REM 31
 DATA "border_width"\ REM 32
 DATA "push_button"\ REM 33
 DATA "label_color"\ REM 34
 DATA "label_size"\ REM 35
 DATA "value"\ REM 36
 DATA "add_chart_value"\ REM 37
 DATA "insert_chart_value"\ REM 38
 DATA "replace_chart_value"\ REM 39
 DATA "positioner_xvalue"\ REM 40
 DATA "positioner_yvalue"\ REM 41
 DATA "double_click"\ REM 42
 DATA "input_text"\ REM 43
 DATA "box_type"\ REM 44
 DATA "label_style"\ REM 45
 DATA "label_align"\ REM 46
 DATA "resize"\ REM 47
 DATA "gravity"\ REM 48
 DATA "shortcut_key"\ REM 49
 DATA "data"\ REM 50
 DATA "step"\ REM 51
 DATA "cursor_type"\ REM 52
 DATA "title"\ REM 53
 DATA "kbd_mask"\ REM 54
 DATA "%"
 
FDTable DATA "=============== FORM ======="
 DATA "--------------------"
 DATA "============================"
 DATA "height"
 DATA "number"
 DATA "name"
 DATA "class"
 DATA "type"
 DATA "box"
 DATA "boxtype"
 DATA "colors"
 DATA "alignment"
 DATA "style"
 DATA "size"
 DATA "lcol"
 DATA "label"
 DATA "shortcut"
 DATA "resize"
 DATA "gravity"
 DATA "callback"
 DATA "width"
 DATA "file"
 DATA "return"
 DATA "argument"
 DATA "%"

ErrorTbl DATA "Undefined symbol"\ REM  ErrUDSym
 DATA "Invalid symbol name"\ REM  ErrIVSNam
 DATA "Type mismatch or wrong type"\ REM  ErrTypMis
 DATA "Invalid Expression"\ REM  ErrIVExp
 DATA "Syntax Error"\ REM  ErrSyntax
 DATA "Symbol already defined"\ REM  ErrDupSym
 DATA "Symbol table full"\ REM  ErrSymFul
 DATA "Undefined Function"\ REM  ErrUDFcn
 DATA "Invalid data type"\ REM  ErrIVType
 DATA "Invalid data type modifier"\ REM  ErrIVMod
 DATA "Macro argument error"\ REM  ErrMacArg
 DATA "Invalid directive"\ REM  ErrIVDir
 DATA "Macro already defined"\ REM  ErrDupMac
 DATA "ENDSTRUCT without STRUCT"\ REM  ErrEndStr
 DATA "Nested macro"\ REM  ErrMacNst
 DATA "Macro buffer full"\ REM  ErrMacBuf
 DATA "Invalid macro"\ REM  ErrIVMac
 DATA "ENDM without MACRO"\ REM  ErrEndm
 DATA "Unbalanced control structure"\ REM  ErrUBCon
 DATA "Nested too deep"\ REM  ErrNDeep
 DATA "Illegal Declaration inside Function or Subroutine"\ REM  ErrDecFcn
 DATA "Invalid parameter"\ REM  ErrIVParm
 DATA "Parameter Statement out of Place"\ REM  ErrErrParm
 DATA "Expression too complex"\ REM  ErrCpxExp
 DATA "Invalid function"\ REM  ErrIVFunc
 DATA "No more temps available"\ REM  ErrTmpUse
 DATA "Unbalanced parens"\ REM  ErrParen
 DATA "Function error"\ REM  ErrFcn
 DATA "Invalid target"\ REM  ErrIVTarg
 DATA "Function/Subroutine nested"\ REM  ErrFSNest
 DATA "Wrong Number of Parameters"\ REM  ErrPrmCnt
 DATA "ERROR Trap in subroutine or function"\ REM  ErrERRTrp
 DATA "Array subscript error"\ REM  ErrArrSub

RunVars DATA 0,""
 DATA 1,"long _d2;"
 DATA 1,"long _PUArgs[15];"
 DATA 1,"int _ArgCount;"
 DATA 1,"long _ArgList;"
 DATA 1,"long _ArgNum;"
 DATA 1,"char _TestByte;"
 DATA 1,"char _Prompt;"
 DATA 1,"char _NewLine;"
 DATA 1,"char _CRLF[2];"
 DATA 1,"long STATUS;"
 DATA 1,"jmp_buf _ebuf;"
 DATA 1,"time_t _t;"
 DATA 1,"struct tm *_systime;"
 DATA 1,"long _ErrFlag;"
 DATA 1,"unsigned char *_Poker;"
 DATA 1,"void *_SrcAddr;"
 DATA 1,"void *_DestAddr;"
 DATA 1,"long _BlkCnt;"
 DATA 1,"long _DummyArg;"
 DATA 1,"long XferCount;"
 DATA 1,"char *_XferAddr;"
 DATA 1,"short _Digits;"
 DATA 1,"short _Decimals;"
 DATA 1,"long _ArgSafe0;"
 DATA 1,"long _ArgSafe1;"
 DATA 1,"float _FltArgSafe0;"
 DATA 1,"float _FltArgSafe1;"
 DATA 1,"long _SwitchInt;"
 DATA 1,"_vector _SwitchStr;"
 DATA 1,"double _DblArgSafe0;"
 DATA 1,"double _DblArgSafe1;"
 DATA 1,"unsigned char _IOPthNum;"
 DATA 1,"FILE *_FilePtr;"
 DATA 1,"unsigned char _PrtPthNum;"
 DATA 1,"short _SafeZone;"
 DATA 1,"long _IOBufPtr;"
 DATA 1,"_vector _IOBufVec;"
 DATA 1,"long POS;"
 DATA 1,"int MX;"
 DATA 1,"int MY;"
 DATA 1,"int KM;"
 DATA 1,"_vector _PBufVec;"
 DATA 1,"unsigned char *_DataPtr;"
 DATA 1,"unsigned char *_DataPtrSaf;"
 DATA 1,"unsigned char _True;"
 DATA 1,"char _ConvBuf[22];"
 DATA 1,"char _ConvBuf1[22];"
 DATA 1,"char ProgramName[40];"
 DATA 1,"_vector _CBufVec;"
 DATA 1,"_vector _CBuf1Vec;"
 DATA 1,"char _NullStr[2];"
 DATA 0,""
 DATA 0,"%"
 
PreDefTbl DATA "{",OPER,0,0,0,0
 DATA "}",OPER,0,0,0,0
 DATA "[",OPER,0,0,0,0
 DATA "]",OPER,0,0,0,0
 DATA "(",OPER,0,0,0,0
 DATA ")",OPER,0,0,0,0
 DATA "=",OPER,0,0,0,0
 DATA "<",OPER,0,0,0,0
 DATA ">",OPER,0,0,0,0
 DATA "<=",OPER,0,0,0,0
 DATA ">=",OPER,0,0,0,0
 DATA "<>",OPER,0,0,0,0
 DATA ".",OPER,0,0,0,0
 DATA ",",OPER,0,0,0,0
 DATA "+",OPER,0,0,0,0
 DATA "-",OPER,0,0,0,0
 DATA "*",OPER,0,0,0,0
 DATA "/",OPER,0,0,0,0
 DATA "~",OPER,4,0,0,0
 DATA "_NullStr",STRING,$00,0,0,0
 DATA "0x0",LONG,ConstBit,0,0,4
 DATA "<",OPER,0,0,0,0
 DATA ">",OPER,0,0,0,0
 DATA "(",OPER,0,0,0,0
 DATA ")",OPER,0,0,0,0
 DATA "*",OPER,0,0,0,0
 DATA "",OPER,0,0,0,0
 DATA "true",BOOLEAN,4,1,0,0
 DATA "false",BOOLEAN,4,0,0,0
 DATA "eof",FCN,0,0,0,0
 DATA "len",FCN,0,1,0,0
 DATA "str_Str",FCN,0,2,0,0
 DATA "val",FCN,0,3,0,0
 DATA "land",FCN,0,4,0,0
 DATA "mid_Str",FCN,0,5,0,0
 DATA "lor",FCN,0,6,0,0
 DATA "left_Str",FCN,0,7,0,0
 DATA "mod",FCN,0,8,0,0
 DATA "chr_Str",FCN,0,9,0,0
 DATA "right_Str",FCN,0,10,0,0
 DATA "asc",FCN,0,11,0,0
 DATA "not",FCN,0,12,0,0
 DATA "bufadr",FCN,0,13,0,0
 DATA "bufsiz",FCN,0,14,0,0
 DATA "tab",FCN,0,15,0,0
 DATA "peek",FCN,0,16,0,0
 DATA "addr",FCN,0,17,0,0
 DATA "lxor",FCN,0,18,0,0
 DATA "lnot",FCN,0,19,0,0
 DATA "index",FCN,0,20,0,0
 DATA "size",FCN,0,21,0,0
 DATA "ival",FCN,0,22,0,0
 DATA "fval",FCN,0,23,0,0
 DATA "trim_Str",FCN,0,24,0,0
 DATA "filsiz",FCN,0,25,0,0
 DATA "filpos",FCN,0,26,0,0
 DATA "sqr",FCN,0,27,0,0
 DATA "int",FCN,0,28,0,0
 DATA "abs",FCN,0,29,0,0
 DATA "sin",FCN,0,30,0,0
 DATA "cos",FCN,0,31,0,0
 DATA "tan",FCN,0,32,0,0
 DATA "asn",FCN,0,33,0,0
 DATA "acs",FCN,0,34,0,0
 DATA "atn",FCN,0,35,0,0
 DATA "log",FCN,0,36,0,0
 DATA "log10",FCN,0,37,0,0
 DATA "getmenu",FCN,0,38,0,0
 DATA "getfile",FCN,0,39,0,0
 DATA "thour",FCN,0,40,0,0
 DATA "tmin",FCN,0,41,0,0
 DATA "tsec",FCN,0,42,0,0
 DATA "tyear",FCN,0,43,0,0
 DATA "tmon",FCN,0,44,0,0
 DATA "tdat",FCN,0,45,0,0
 DATA "tday",FCN,0,46,0,0
 DATA "mbutton",FCN,0,47,0,0
 DATA "hex_Str",FCN,0,48,0,0
 DATA "bittst",FCN,0,49,0,0
 DATA "shl",FCN,0,50,0,0
 DATA "shr",FCN,0,51,0,0
 DATA "rol",FCN,0,52,0,0
 DATA "ror",FCN,0,53,0,0
 DATA "bitchg",FCN,0,54,0,0
 DATA "bitclr",FCN,0,55,0,0
 DATA "bitset",FCN,0,56,0,0
 DATA "substr",FCN,0,57,0,0
 DATA "zstr_Str",FCN,0,58,0,0
 DATA "zhex_Str",FCN,0,59,0,0
 DATA "using",FCN,0,60,0,0
 DATA "ERR",LONG,0,0,0,4
 DATA "_BufSize",0,0,0,0,0
 DATA "POS",LONG,0,0,0,4
 DATA "_DummyArg",LONG,0,0,0,4
 DATA "errno",LONG,0,0,0,4
 DATA "_IOBuffer",LONG,0,0,0,4
 DATA "_PrintBuf",LONG,0,0,0,4
 DATA "Vacant$$$",LONG,0,0,0,4
 DATA "_Digits",SHORT,0,0,0,2
 DATA "_Decimals",SHORT,0,0,0,2
 DATA "STATUS",LONG,0,0,0,4
 DATA "_ArgSafe0",LONG,0,0,0,4
 DATA "_ArgSafe1",LONG,0,0,0,4
 DATA "_IOPthNum",SHORT,0,0,0,2
 DATA "_FilePtr",LONG,0,0,0,4
 DATA "_SafeZone",SHORT,0,0,0,2
 DATA "_IOBufPtr",LONG,0,0,0,4
 DATA "_IOBufVec",STRING,VectorBit,_BufSize,0,4
 DATA "_PBufVec",LONG,0,0,0,4
 DATA "_DataPtr",LONG,0,0,0,4
 DATA "_True",BYTE,0,0,0,1
 DATA "_DataPtrSaf",LONG,0,0,0,4
 DATA "_ConvBuf",STRING,0,22,0,22
 DATA "_CBufVec",LONG,0,0,0,4
 DATA "_ConvBuf1",STRING,0,22,0,22
 DATA "_CBuf1Vec",LONG,0,0,0,4
 DATA "_Tmp1",LONG,TempBit,0,0,4
 DATA "_Tmp2",LONG,TempBit,0,0,4
 DATA "_Tmp3",LONG,TempBit,0,0,4
 DATA "_Tmp4",LONG,TempBit,0,0,4
 DATA "_Tmp5",LONG,TempBit,0,0,4
 DATA "_Tmp6",LONG,TempBit,0,0,4
 DATA "_Tmp7",LONG,TempBit,0,0,4
 DATA "_Tmp8",LONG,TempBit,0,0,4
 DATA "_Tmp9",LONG,TempBit,0,0,4
 DATA "_Tmp10",LONG,TempBit,0,0,4
 DATA "_Tmp11",LONG,TempBit,0,0,4
 DATA "_Tmp12",LONG,TempBit,0,0,4
 DATA "_Tmp13",LONG,TempBit,0,0,4
 DATA "_Tmp14",LONG,TempBit,0,0,4
 DATA "_Tmp15",LONG,TempBit,0,0,4
 DATA "_TmpVec1",VOIDX,TmpVec,0,0,12
 DATA "_TmpVec2",VOIDX,TmpVec,0,0,12
 DATA "_TmpVec3",VOIDX,TmpVec,0,0,12
 DATA "_TmpVec4",VOIDX,TmpVec,0,0,12
 DATA "_TmpVec5",VOIDX,TmpVec,0,0,12
 DATA "_TmpVec6",VOIDX,TmpVec,0,0,12
 DATA "_TmpVec7",VOIDX,TmpVec,0,0,12
 DATA "_TmpVec8",VOIDX,TmpVec,0,0,12
 DATA "_TmpVec9",VOIDX,TmpVec,0,0,12
 DATA "_TmpVec10",VOIDX,TmpVec,0,0,12
 DATA "_TmpVec11",VOIDX,TmpVec,0,0,12
 DATA "_TmpVec12",VOIDX,TmpVec,0,0,12
 DATA "_TmpVec13",VOIDX,TmpVec,0,0,12
 DATA "_TmpVec14",VOIDX,TmpVec,0,0,12
 DATA "_TmpVec15",VOIDX,TmpVec,0,0,12
 DATA "&",9,0,0,0,0
 DATA "|",9,0,0,0,0
 DATA "0",FLOAT,ConstBit,0,0,8
 DATA "NextArg",6,TmpVec,0,0,0
 DATA "XferCount",4,0,0,0,0
 DATA "_FTmp1",FLOAT,0,0,0,8
 DATA "_FTmp2",FLOAT,0,0,0,8
 DATA "_FTmp3",FLOAT,0,0,0,8
 DATA "_FTmp4",FLOAT,0,0,0,8
 DATA "_FTmp5",FLOAT,0,0,0,8
 DATA "_FTmp6",FLOAT,0,0,0,8
 DATA "_FTmp7",FLOAT,0,0,0,8
 DATA "_FTmp8",FLOAT,0,0,0,8
 DATA "_FTmp9",FLOAT,0,0,0,8
 DATA "_FTmp10",FLOAT,0,0,0,8
 DATA "_FTmp11",FLOAT,0,0,0,8
 DATA "_FTmp12",FLOAT,0,0,0,8
 DATA "_FTmp13",FLOAT,0,0,0,8
 DATA "_FTmp14",FLOAT,0,0,0,8
 DATA "_FTmp15",FLOAT,0,0,0,8
 DATA "TRUE",BOOLEAN,4,1,0,0
 DATA "True",BOOLEAN,4,1,0,0
 DATA "FALSE",BOOLEAN,4,0,0,0
 DATA "False",BOOLEAN,4,0,0,0
 DATA "colormap",FCN,0,61,0,0
 DATA "getinput",FCN,0,62,0,0
 DATA "input_box",FCN,0,63,0,0
 DATA "question_box",FCN,0,64,0,0
 DATA "getbutton",FCN,0,65,0,0
 DATA "getchoice",FCN,0,66,0,0
 DATA "getbrowser",FCN,0,67,0,0
 DATA "getvalue",FCN,0,68,0,0
 DATA "getposx",FCN,0,69,0,0
 DATA "getposy",FCN,0,70,0,0
 DATA "rnd",FCN,0,71,0,0
 DATA "belowmouse",FCN,0,72,0,0
 DATA "getx",FCN,0,73,0,0
 DATA "gety",FCN,0,74,0,0
 DATA "getw",FCN,0,75,0,0
 DATA "geth",FCN,0,76,0,0
 DATA "lcase_Str",FCN,0,77,0,0
 DATA "ucase_Str",FCN,0,78,0,0
 DATA "tail_Str",FCN,0,79,0,0
 DATA "findaddr",FCN,0,80,0,0
 DATA "findoffs",FCN,0,81,0,0
 DATA "fp_size",FORM,0,0,0,0
 DATA "fp_position",FORM,0,1,0,0
 DATA "fp_geometry",FORM,0,2,0,0
 DATA "fp_aspect",FORM,0,3,0,0
 DATA "fp_mouse",FORM,0,4,0,0
 DATA "fp_center",FORM,0,5,0,0
 DATA "fp_fullscreen",FORM,0,6,0,0
 DATA "fp_free",FORM,0,7,0,0
 DATA "fp_hotspot",FORM,0,8,0,0
 DATA "fp_centerfree",FORM,0,9,0,0
 DATA "fp_iconic",FORM,0,10,0,0
 DATA "nb_btn",OBJECT,BUTTON,NORMAL_BUTTON,OBJ_BUTTON,0
 DATA "pb_btn",OBJECT,BUTTON,PUSH_BUTTON,OBJ_BUTTON,0
 DATA "tb_btn",OBJECT,BUTTON,TOUCH_BUTTON,OBJ_BUTTON,0
 DATA "rb_btn",OBJECT,BUTTON,RADIO_BUTTON,OBJ_BUTTON,0
 DATA "mb_btn",OBJECT,BUTTON,MENU_BUTTON,OBJ_BUTTON,0
 DATA "hb_btn",OBJECT,BUTTON,HIDDEN_BUTTON,OBJ_BUTTON,0
 DATA "iob_btn",OBJECT,BUTTON,INOUT_BUTTON,OBJ_BUTTON,0
 DATA "rtb_btn",OBJECT,BUTTON,RETURN_BUTTON,OBJ_BUTTON,0
 DATA "hrb_btn",OBJECT,BUTTON,HIDDEN_RET_BUTTON,OBJ_BUTTON,0  
 DATA "nb_chkbtn",OBJECT,CHECKBUTTON,NORMAL_BUTTON,OBJ_BUTTON,0
 DATA "pb_chkbtn",OBJECT,CHECKBUTTON,PUSH_BUTTON,OBJ_BUTTON,0
 DATA "tb_chkbtn",OBJECT,CHECKBUTTON,TOUCH_BUTTON,OBJ_BUTTON,0
 DATA "rb_chkbtn",OBJECT,CHECKBUTTON,RADIO_BUTTON,OBJ_BUTTON,0
 DATA "mb_chkbtn",OBJECT,CHECKBUTTON,MENU_BUTTON,OBJ_BUTTON,0
 DATA "hb_chkbtn",OBJECT,CHECKBUTTON,HIDDEN_BUTTON,OBJ_BUTTON,0
 DATA "iob_chkbtn",OBJECT,CHECKBUTTON,INOUT_BUTTON,OBJ_BUTTON,0
 DATA "rtb_chkbtn",OBJECT,CHECKBUTTON,RETURN_BUTTON,OBJ_BUTTON,0
 DATA "hrb_chkbtn",OBJECT,CHECKBUTTON,HIDDEN_RET_BUTTON,OBJ_BUTTON,0  
 DATA "nb_rndbtn",OBJECT,ROUNDBUTTON,NORMAL_BUTTON,OBJ_BUTTON,0
 DATA "pb_rndbtn",OBJECT,ROUNDBUTTON,PUSH_BUTTON,OBJ_BUTTON,0
 DATA "tb_rndbtn",OBJECT,ROUNDBUTTON,TOUCH_BUTTON,OBJ_BUTTON,0
 DATA "rb_rndbtn",OBJECT,ROUNDBUTTON,RADIO_BUTTON,OBJ_BUTTON,0
 DATA "mb_rndbtn",OBJECT,ROUNDBUTTON,MENU_BUTTON,OBJ_BUTTON,0
 DATA "hb_rndbtn",OBJECT,ROUNDBUTTON,HIDDEN_BUTTON,OBJ_BUTTON,0
 DATA "iob_rndbtn",OBJECT,ROUNDBUTTON,INOUT_BUTTON,OBJ_BUTTON,0
 DATA "rtb_rndbtn",OBJECT,ROUNDBUTTON,RETURN_BUTTON,OBJ_BUTTON,0
 DATA "hrb_rndbtn",OBJECT,ROUNDBUTTON,HIDDEN_RET_BUTTON,OBJ_BUTTON,0
 DATA "nb_pixbtn",OBJECT,PIXMAPBUTTON,NORMAL_BUTTON,OBJ_BUTTON,0
 DATA "pb_pixbtn",OBJECT,PIXMAPBUTTON,PUSH_BUTTON,OBJ_BUTTON,0
 DATA "tb_pixbtn",OBJECT,PIXMAPBUTTON,TOUCH_BUTTON,OBJ_BUTTON,0
 DATA "rb_pixbtn",OBJECT,PIXMAPBUTTON,RADIO_BUTTON,OBJ_BUTTON,0
 DATA "mb_pixbtn",OBJECT,PIXMAPBUTTON,MENU_BUTTON,OBJ_BUTTON,0
 DATA "hb_pixbtn",OBJECT,PIXMAPBUTTON,HIDDEN_BUTTON,OBJ_BUTTON,0
 DATA "iob_pixbtn",OBJECT,PIXMAPBUTTON,INOUT_BUTTON,OBJ_BUTTON,0
 DATA "rtb_pixbtn",OBJECT,PIXMAPBUTTON,RETURN_BUTTON,OBJ_BUTTON,0
 DATA "hrb_pixbtn",OBJECT,PIXMAPBUTTON,HIDDEN_RET_BUTTON,OBJ_BUTTON,0
 DATA "nb_bitbtn",OBJECT,BITMAPBUTTON,NORMAL_BUTTON,OBJ_BUTTON,0
 DATA "pb_bitbtn",OBJECT,BITMAPBUTTON,PUSH_BUTTON,OBJ_BUTTON,0
 DATA "tb_bitbtn",OBJECT,BITMAPBUTTON,TOUCH_BUTTON,OBJ_BUTTON,0
 DATA "rb_bitbtn",OBJECT,BITMAPBUTTON,RADIO_BUTTON,OBJ_BUTTON,0
 DATA "mb_bitbtn",OBJECT,BITMAPBUTTON,MENU_BUTTON,OBJ_BUTTON,0
 DATA "hb_bitbtn",OBJECT,BITMAPBUTTON,HIDDEN_BUTTON,OBJ_BUTTON,0
 DATA "iob_bitbtn",OBJECT,BITMAPBUTTON,INOUT_BUTTON,OBJ_BUTTON,0
 DATA "rtb_bitbtn",OBJECT,BITMAPBUTTON,RETURN_BUTTON,OBJ_BUTTON,0
 DATA "hrb_bitbtn",OBJECT,BITMAPBUTTON,HIDDEN_RET_BUTTON,OBJ_BUTTON,0
 DATA "nb_litbtn",OBJECT,LIGHTBUTTON,NORMAL_BUTTON,OBJ_BUTTON,0
 DATA "pb_litbtn",OBJECT,LIGHTBUTTON,PUSH_BUTTON,OBJ_BUTTON,0
 DATA "tb_litbtn",OBJECT,LIGHTBUTTON,TOUCH_BUTTON,OBJ_BUTTON,0
 DATA "rb_litbtn",OBJECT,LIGHTBUTTON,RADIO_BUTTON,OBJ_BUTTON,0
 DATA "mb_litbtn",OBJECT,LIGHTBUTTON,MENU_BUTTON,OBJ_BUTTON,0
 DATA "hb_litbtn",OBJECT,LIGHTBUTTON,HIDDEN_BUTTON,OBJ_BUTTON,0
 DATA "iob_litbtn",OBJECT,LIGHTBUTTON,INOUT_BUTTON,OBJ_BUTTON,0
 DATA "rtb_litbtn",OBJECT,LIGHTBUTTON,RETURN_BUTTON,OBJ_BUTTON,0
 DATA "hrb_litbtn",OBJECT,LIGHTBUTTON,HIDDEN_RET_BUTTON,OBJ_BUTTON,0
 DATA "nb_rnd3dbtn",OBJECT,ROUND3DBUTTON,NORMAL_BUTTON,OBJ_BUTTON,0
 DATA "pb_rnd3dbtn",OBJECT,ROUND3DBUTTON,PUSH_BUTTON,OBJ_BUTTON,0
 DATA "tb_rnd3dbtn",OBJECT,ROUND3DBUTTON,TOUCH_BUTTON,OBJ_BUTTON,0
 DATA "rb_rnd3dbtn",OBJECT,ROUND3DBUTTON,RADIO_BUTTON,OBJ_BUTTON,0
 DATA "mb_rnd3dbtn",OBJECT,ROUND3DBUTTON,MENU_BUTTON,OBJ_BUTTON,0
 DATA "hb_rnd3dbtn",OBJECT,ROUND3DBUTTON,HIDDEN_BUTTON,OBJ_BUTTON,0
 DATA "iob_rnd3dbtn",OBJECT,ROUND3DBUTTON,INOUT_BUTTON,OBJ_BUTTON,0
 DATA "rtb_rnd3dbtn",OBJECT,ROUND3DBUTTON,RETURN_BUTTON,OBJ_BUTTON,0
 DATA "hrb_rnd3dbtn",OBJECT,ROUND3DBUTTON,HIDDEN_RET_BUTTON,OBJ_BUTTON,0
 DATA "bx_up",OBJECT,BOX,UP_BOX,OBJ_BOX,0
 DATA "bx_none",OBJECT,BOX,NO_BOX,OBJ_BOX,0
 DATA "bx_down",OBJECT,BOX,DOWN_BOX,OBJ_BOX,0
 DATA "bx_border",OBJECT,BOX,BORDER_BOX,OBJ_BOX,0
 DATA "bx_shadow",OBJECT,BOX,SHADOW_BOX,OBJ_BOX,0
 DATA "bx_frame",OBJECT,BOX,FRAME_BOX,OBJ_BOX,0
 DATA "bx_flat",OBJECT,BOX,FLAT_BOX,OBJ_BOX,0
 DATA "bx_embossed",OBJECT,BOX,EMBOSSED_BOX,OBJ_BOX,0
 DATA "bx_rounded",OBJECT,BOX,ROUNDED_BOX,OBJ_BOX,0
 DATA "bx_rflat",OBJECT,BOX,RFLAT_BOX,OBJ_BOX,0
 DATA "bx_rshadow",OBJECT,BOX,RSHADOW_BOX,OBJ_BOX,0
 DATA "bx_oval",OBJECT,BOX,OVAL_BOX,OBJ_BOX,0
 DATA "bx_rnd3dup",OBJECT,BOX,ROUNDED3D_UPBOX,OBJ_BOX,0
 DATA "bx_rnd3ddown",OBJECT,BOX,ROUNDED3D_DOWNBOX,OBJ_BOX,0
 DATA "bx_oval3dup",OBJECT,BOX,OVAL3D_UPBOX,OBJ_BOX,0
 DATA "bx_oval3ddown",OBJECT,BOX,OVAL3D_DOWNBOX,OBJ_BOX,0
 DATA "mu_push",OBJECT,MENU,PUSH_MENU,OBJ_MENU,0
 DATA "mu_pulldown",OBJECT,MENU,PULLDOWN_MENU,OBJ_MENU,0
 DATA "mu_touch",OBJECT,MENU,TOUCH_MENU,OBJ_MENU,0
 DATA "in_normal",OBJECT,INPUT,NORMAL_INPUT,OBJ_INPUT,0
 DATA "in_float",OBJECT,INPUT,FLOAT_INPUT,OBJ_INPUT,0
 DATA "in_integer",OBJECT,INPUT,INT_INPUT,OBJ_INPUT,0
 DATA "in_date",OBJECT,INPUT,DATE_INPUT,OBJ_INPUT,0
 DATA "in_multiline",OBJECT,INPUT,MULTILINE_INPUT,OBJ_INPUT,0
 DATA "in_hidden",OBJECT,INPUT,SECRET_INPUT,OBJ_INPUT,0
 DATA "in_secret",OBJECT,INPUT,HIDDEN_INPUT,OBJ_INPUT,0
 DATA "fm_none",OBJECT,FRAME,NO_FRAME,OBJ_FRAME,0
 DATA "fm_up",OBJECT,FRAME,UP_FRAME,OBJ_FRAME,0
 DATA "fm_down",OBJECT,FRAME,DOWN_FRAME,OBJ_FRAME,0
 DATA "fm_border",OBJECT,FRAME,BORDER_FRAME,OBJ_FRAME,0
 DATA "fm_engraved",OBJECT,FRAME,ENGRAVED_FRAME,OBJ_FRAME,0
 DATA "fm_embossed",OBJECT,FRAME,EMBOSSED_FRAME,OBJ_FRAME,0
 DATA "fm_rounded",OBJECT,FRAME,ROUNDED_FRAME,OBJ_FRAME,0
 DATA "fm_oval",OBJECT,FRAME,OVAL_FRAME,OBJ_FRAME,0
 DATA "lf_none",OBJECT,LABELFRAME,NO_FRAME,OBJ_FRAME,0
 DATA "lf_up",OBJECT,LABELFRAME,UP_FRAME,OBJ_FRAME,0
 DATA "lf_down",OBJECT,LABELFRAME,DOWN_FRAME,OBJ_FRAME,0
 DATA "lf_border",OBJECT,LABELFRAME,BORDER_FRAME,OBJ_FRAME,0
 DATA "lf_engraved",OBJECT,LABELFRAME,ENGRAVED_FRAME,OBJ_FRAME,0
 DATA "lf_embossed",OBJECT,LABELFRAME,EMBOSSED_FRAME,OBJ_FRAME,0
 DATA "lf_rounded",OBJECT,LABELFRAME,ROUNDED_FRAME,OBJ_FRAME,0
 DATA "lf_oval",OBJECT,LABELFRAME,OVAL_FRAME,OBJ_FRAME,0
 DATA "ck_analog",OBJECT,CLOCK,ANALOG_CLOCK,OBJ_CLOCK,0
 DATA "ck_digital",OBJECT,CLOCK,DIGITAL_CLOCK,OBJ_CLOCK,0
 DATA "bm_normal",OBJECT,BITMAP,NORMAL_BITMAP,OBJ_BITMAP,0
 DATA "pm_normal",OBJECT,PIXMAP,NORMAL_PIXMAP,OBJ_PIXMAP,0
 DATA "tx_normal",OBJECT,TEXT,NORMAL_TEXT,OBJ_TEXT,0
 DATA "ch_normal",OBJECT,CHOICE,NORMAL_CHOICE,OBJ_CHOICE,0
 DATA "ch_droplist",OBJECT,CHOICE,DROPLIST_CHOICE,OBJ_CHOICE,0
 DATA "br_normal",OBJECT,BROWSER,NORMAL_BROWSER,OBJ_BROWSER,0
 DATA "br_select",OBJECT,BROWSER,SELECT_BROWSER,OBJ_BROWSER,0
 DATA "br_mold",OBJECT,BROWSER,MOLD_BROWSER,OBJ_BROWSER,0
 DATA "br_multi",OBJECT,BROWSER,MULTI_BROWSER,OBJ_BROWSER,0
 DATA "sl_vert",OBJECT,SLIDER,VERT_SLIDER,OBJ_SLIDER,0
 DATA "sl_horiz",OBJECT,SLIDER,HOR_SLIDER,OBJ_SLIDER,0
 DATA "sl_vertfill",OBJECT,SLIDER,VERT_FILL_SLIDER,OBJ_SLIDER,0
 DATA "sl_horizfill",OBJECT,SLIDER,HOR_FILL_SLIDER,OBJ_SLIDER,0
 DATA "sl_vertnice",OBJECT,SLIDER,VERT_NICE_SLIDER,OBJ_SLIDER,0
 DATA "sl_horiznice",OBJECT,SLIDER,HOR_NICE_SLIDER,OBJ_SLIDER,0
 DATA "sl_vertbrowser",OBJECT,SLIDER,VERT_BROWSER_SLIDER,OBJ_SLIDER,0
 DATA "sl_horizbrowser",OBJECT,SLIDER,HOR_BROWSER_SLIDER,OBJ_SLIDER,0
 DATA "vs_vert",OBJECT,VALSLIDER,VERT_SLIDER,OBJ_SLIDER,0
 DATA "vs_horiz",OBJECT,VALSLIDER,HOR_SLIDER,OBJ_SLIDER,0
 DATA "vs_vertfill",OBJECT,VALSLIDER,VERT_FILL_SLIDER,OBJ_SLIDER,0
 DATA "vs_horizfill",OBJECT,VALSLIDER,HOR_FILL_SLIDER,OBJ_SLIDER,0
 DATA "vs_vertnice",OBJECT,VALSLIDER,VERT_NICE_SLIDER,OBJ_SLIDER,0
 DATA "vs_horiznice",OBJECT,VALSLIDER,HOR_NICE_SLIDER,OBJ_SLIDER,0
 DATA "vs_vertbrowser",OBJECT,VALSLIDER,VERT_BROWSER_SLIDER,OBJ_SLIDER,0
 DATA "vs_horizbrowser",OBJECT,VALSLIDER,HOR_BROWSER_SLIDER,OBJ_SLIDER,0
 DATA "ct_normal",OBJECT,COUNTER,NORMAL_COUNTER,OBJ_COUNTER,0
 DATA "ct_simple",OBJECT,COUNTER,SIMPLE_COUNTER,OBJ_COUNTER,0
 DATA "dl_normal",OBJECT,DIAL,NORMAL_DIAL,OBJ_DIAL,0
 DATA "dl_line",OBJECT,DIAL,LINE_DIAL,OBJ_DIAL,0
 DATA "dl_fill",OBJECT,DIAL,FILL_DIAL,OBJ_DIAL,0
 DATA "tm_normal",OBJECT,TIMER,NORMAL_TIMER,OBJ_TIMER,0
 DATA "tm_value",OBJECT,TIMER,VALUE_TIMER,OBJ_TIMER,0
 DATA "tm_hidden",OBJECT,TIMER,HIDDEN_TIMER,OBJ_TIMER,0
 DATA "cr_vertbar",OBJECT,CHART,BAR_CHART,OBJ_CHART,0
 DATA "cr_horizbar",OBJECT,CHART,HORBAR_CHART,OBJ_CHART,0
 DATA "cr_line",OBJECT,CHART,LINE_CHART,OBJ_CHART,0
 DATA "cr_filled",OBJECT,CHART,FILLED_CHART,OBJ_CHART,0
 DATA "cr_spike",OBJECT,CHART,SPIKE_CHART,OBJ_CHART,0
 DATA "cr_pie",OBJECT,CHART,PIE_CHART,OBJ_CHART,0
 DATA "cr_specialpie",OBJECT,CHART,SPECIALPIE_CHART,OBJ_CHART,0
 DATA "ps_normal",OBJECT,POSITIONER,NORMAL_POSITIONER,OBJ_POSITIONER,0
 DATA "gp_normal",OBJECT,GROUP,NORMAL_GROUP,OBJ_GROUP,0
 DATA "cv_normal",OBJECT,CANVAS,NORMAL_CANVAS,OBJ_CANVAS,0
 DATA "cv_scrolled",OBJECT,CANVAS,SCROLLED_CANVAS,OBJ_CANVAS,0
 DATA "gl_normal",OBJECT,GLCANVAS,NORMAL_CANVAS,OBJ_CANVAS,0
 DATA "gl_scrolled",OBJECT,GLCANVAS,SCROLLED_CANVAS,OBJ_CANVAS,0
 DATA "xy_normal",OBJECT,XYPLOT,NORMAL_XYPLOT,OBJ_XYPLOT,0
 DATA "xy_square",OBJECT,XYPLOT,SQUARE_XYPLOT,OBJ_XYPLOT,0
 DATA "xy_circle",OBJECT,XYPLOT,CIRCLE_XYPLOT,OBJ_XYPLOT,0
 DATA "xy_filled",OBJECT,XYPLOT,FILLED_XYPLOT,OBJ_XYPLOT,0
 DATA "xy_points",OBJECT,XYPLOT,POINTS_XYPLOT,OBJ_XYPLOT,0
 DATA "xy_dashed",OBJECT,XYPLOT,DASHED_XYPLOT,OBJ_XYPLOT,0
 DATA "xy_impulse",OBJECT,XYPLOT,IMPULSE_XYPLOT,OBJ_XYPLOT,0
 DATA "xy_active",OBJECT,XYPLOT,ACTIVE_XYPLOT,OBJ_XYPLOT,0
 DATA "xy_empty",OBJECT,XYPLOT,EMPTY_XYPLOT,OBJ_XYPLOT,0
 DATA "msg_box",FORM,0,0,0,0
 DATA "alert_box",FORM,0,0,0,0
 DATA "hint_box",FORM,0,0,0,0
 DATA "obj",OBJECT,0,0,0,0
 DATA "root",FORM,0,0,0,0
 DATA "MX",LONG,0,0,0,4
 DATA "MY",LONG,0,0,0,4
 DATA "KM",LONG,0,0,0,4
 DATA "ProgramName",STRING,0,28,0,28
 DATA "%"
 
 
Finish
 IF InpFilPtr>1 THEN
	CLOSE #InpFile(InpFilPtr)
	DEC InpFilPtr
	GOTO MainLoop
 ENDIF
 CLOSE #InpFile(InpFilPtr)
 IF LastStmt="data" THEN
	DataFlag=0
	OutBuf="0};"
	GenVar
 ENDIF
 IF ProgMode=$ff THEN
	IF LastStmt<>"end" THEN
 		OutBuf="exit(0);"
 		GenMain
	ENDIF
	OutBuf="ErrExit:;"
	GenMain
	OutBuf="puts("+CHR$($22)+"Error Exit"+CHR$($22)+");"
	GenMain	
	OutBuf="exit(errno);"
	GenMain
 ENDIF
 OutBuf="}"
 GenMain

 CLOSE #CodeFile
 CLOSE #FcnFile
 CLOSE #VarFile
 ON ERROR GOTO NoCFile
 DELETE FileName+".cpp"
NoCFile
 ON ERROR
*******
 PRINT BasicLineCtr;" OmniBasic lines compiled to ";CLineCtr;" C lines"
 PRINT
 TFileName=FileName+".cpp"
 CREATE #OutFile,TFileName:WRITE+BINARY
 OPEN #VarFile,"_VarFile":READ+BINARY
 FilBufSiz=FILSIZ(#VarFile)
 BUFFER FileBuf=FilBufSiz
 FilBufAdr=BUFADR(FileBuf)
 BUFREAD #VarFile,FilBufAdr,FilBufSiz
 BUFWRITE #OutFile,FilBufAdr,FilBufSiz
 BUFFER FileBuf=0
 CLOSE #VarFile
 DELETE "_VarFile"
 IF FcnMode=0 THEN
	 OPEN #CodeFile,"_CodFile":READ+BINARY
	 FilBufSiz=FILSIZ(#CodeFile)
	 BUFFER FileBuf=FilBufSiz
	 FilBufAdr=BUFADR(FileBuf)
	 BUFREAD #CodeFile,FilBufAdr,FilBufSiz
	 BUFWRITE #OutFile,FilBufAdr,FilBufSiz
	 BUFFER FileBuf=0
	 CLOSE #CodeFile
	 DELETE "_CodFile"
 ENDIF
 OPEN #FcnFile,"_FcnFile":READ+BINARY
 FilBufSiz=FILSIZ(#FcnFile)
 BUFFER FileBuf=FilBufSiz
 FilBufAdr=BUFADR(FileBuf)
 BUFREAD #FcnFile,FilBufAdr,FilBufSiz
 BUFWRITE #OutFile,FilBufAdr,FilBufSiz
 BUFFER FileBuf=0
 CLOSE #FcnFile
 DELETE "_FcnFile"
 CLOSE #OutFile
*******
 FOR Ctr1=1 TO SymTabSiz
	IF SymTable(Ctr1).DataType=LABEL THEN
		IF SymTable(Ctr1).Detail&$ff=$ff THEN\ REM  lop off sbrtn bit
			INC ErrCnt
			PRINT "Label ";SymTable(Ctr1).SymName;" unresolved"
		ENDIF
	ENDIF
 NEXT Ctr1
lbl9999 IF CSP<>0 THEN
	PRINT "Unbalanced control structure in line ";CS(CSP).ConLine
	DEC CSP
	INC ErrCnt
	GOTO lbl9999
 ENDIF
 IF GFNdx<>1 THEN
	PRINT "Unbalanced conditional stack"
	INC ErrCnt
 ENDIF
 IF ErrCnt<>0 THEN
	PRINT ErrCnt;" error(s)"
 ELSE
	REM Do c compile here
	IF NoGen=0 AND ErrCnt=0 AND COut=0 THEN
		IF Machine=0 OR Machine=5 THEN
			IF VerbFlag<>0 THEN
				VerbCmd=" -bp"
			ENDIF
			StdLib=" -l=basic.l "
			IF Machine=0 THEN
				CompileCmd="cc  "
			ELSE
				CompileCmd="oc  "
			ENDIF
			AsmbCmd=" -ac"
			ObjectCmd=" -r "
		ENDIF
************************ Amiga Section ***********************
		IF Machine=7 THEN
			IF VerbFlag<>0 THEN
				VerbCmd=""
			ENDIF
			StdLib=""
			CompileCmd="sc  "
			AsmbCmd=""
			ObjectCmd=""
		ENDIF
**************************************************************
 		IF GNU=1 THEN
			IF VerbFlag<>0 THEN
				VerbCmd=" -v"
			ENDIF
			CompileCmd="gcc "
			IF Machine=9 THEN
				CompileCmd=CompileCmd+"-O "
			ENDIF
			IF Machine=1 THEN
				StdLib=" basic.a \\djgpp/lib/libm.a"
			ENDIF
 			IF Machine=2 OR Machine=8 OR Machine=9 OR Machine=10 THEN
				StdLib=" basic.a -lm"
			ENDIF
			IF Machine=4 OR Machine=6 THEN
				StdLib=" basic.a"
			ENDIF
			AsmbCmd=" -S "
			ObjectCmd=" -c "
			IF AsmbFlag+COut+FcnMode=0 AND Machine<>4 THEN
				LinkerOut=" -o "+FileName
				IF Machine=6 THEN
					LinkerOut=LinkerOut+".exe"
				ENDIF
			ENDIF
		ENDIF
		IF FcnMode=$ff OR AsmbFlag=$ff THEN
			StdLib=""
		ENDIF
		IF AsmbFlag=0 THEN
			AsmbCmd=""
		ENDIF
		IF FcnMode=0 THEN
			ObjectCmd=""
		ENDIF
		OptionCmd=AsmbCmd+ObjectCmd
		IF GNU=1 THEN\ gnu type
			IF DbgFlag=0 THEN\ NOT -g option
				LinkerOpt=LinkerOpt+" -s"
			ENDIF
		ENDIF
		TempStr=CompileCmd+FileName+".cpp "+OptionCmd+LibList+StdLib+LinkerOut+LinkerOpt+VerbCmd	
		IF Machine=4 THEN
			TempStr=TempStr+" -Zcrtdll"
		ENDIF
		IF Machine=6 AND WinFlag<>0 THEN
			TempStr=TempStr+" -luser32 -Wl,--subsystem,windows"
		ENDIF
		IF Machine=2 AND XWinFlag<>0 THEN
			TempStr=TempStr+" -L/usr/X11R6/lib -lforms -lX11"
		ENDIF
		IF VerbFlag<>0 THEN
			PRINT TempStr
		ENDIF
		SHELL TempStr
		IF Machine=1 THEN
			TempStr="rm "+FileName
			IF VerbFlag<>0 THEN
				PRINT TempStr
			ENDIF
			SHELL TempStr
		ENDIF
	ENDIF
 ENDIF
 IF COut=0 OR NoGen=$ff THEN
	DELETE FileName+".cpp"
 	IF Machine=7 THEN
 		DELETE FileName+".lnk"
 		DELETE FileName+".o"
 	ENDIF
 ENDIF
 IF UDump=$ff THEN
	Fmt=">>>> ^^^^^^^^^^^^^^^^^^^^^^^ >> >> >>>> >>>>>>>> >>>>>>>> >>>>>>>> >>>>"
	PRINT
	PRINT "Symbol Table:"
	PRINT
	PRINT USING(Fmt,"Sym#","Symbol Name","DT","WM","DM","Detail","DataAddr","DataSize","Link")
	PRINT
	FOR Ctr3=1 TO SymTabSiz
		TempStr="......................."
		TSymName=SymTable(Ctr3).SymName
		IF TSymName<>"%" THEN
			LEFT$(TempStr,LEN(TSymName))=TSymName
			TDataType=SymTable(Ctr3).DataType
			TWinMod=SymTable(Ctr3).WinMod
			TDataMod=SymTable(Ctr3).DataMod
			TDetail=SymTable(Ctr3).Detail
			TDataAddr=SymTable(Ctr3).DataAddr
			TDataSize=SymTable(Ctr3).DataSize
			TMultiPtr=SymTable(Ctr3).MultiPtr
			PRINT USING(Fmt,ZSTR$(Ctr3),TempStr,ZHEX$(TDataType),ZHEX$(TWinMod),ZHEX$(TDataMod),ZHEX$(TDetail),ZHEX$(TDataAddr),ZHEX$(TDataSize),ZHEX$(TMultiPtr))
		ENDIF
	NEXT Ctr3
 ENDIF
 IF DumpSyms=$ff THEN
	PRINT "Symbol Table:"
	FOR Ctr1=UserSym TO SymTabSiz
		TempStr=SymTable(Ctr1).SymName
	EXITIF TempStr="%"
		IF POS<63 THEN
			PRINT TempStr,
		ELSE
			PRINT TempStr
		ENDIF
	NEXT Ctr1
	PRINT
	PRINT Ctr1-UserSym;" symbols"
	PRINT
 ENDIF
 IF PromptFlag<>0 THEN
        INPUT "Hit any key to continue>",TempStr
 ENDIF
 END
NoInpFile
 PRINT "Cannot open file: ";FileName
 END
Help
 PRINT "ob file [opts] {CompVar=Const}"
 PRINT "Options:"
 PRINT "    -A        ANSI Compatible Mode"
 PRINT "    -a        Compile to assembler (.a or .s file)"
 PRINT "    -c        Compile to C code (.c file)"
#IF CType=6
* PRINT "    -D        DLL Mode (generate .dll instead of .exe)"
#ENDIF
 PRINT "    -d        Declare each variable (turns off Auto-Diminsion)"
 PRINT "    -e        Compile with no output but check for errors"
 PRINT "    -f        Function mode"
 PRINT "    -g        Generate symbol module for debugger"
 PRINT "    -p        Prompt for 'hit any key' to continue"
 PRINT "    -r        Turn OFF remarks (comments) in -c option"
 PRINT "    -s        Symbol Table Dump to stdout"
 PRINT "    -u        Unabridged symbol table dump"
 PRINT "    -v        Verbose (detailed reporting of progress)"
#IF CType=6 THEN
 PRINT "    -w        Generate Windows executable"
#ENDIF
 REM WinCode removed
 
 END

****** Subroutine Section ******

 
DimVar
 TDataMod=LAND(MemberBit,TypeFlag)
 ClrDatTyp()
 ExtVarFlg=0
 VectorFlg=0
 MultiFlag=0
 DimOK=0
 DimFlag=$ff
 TDataType=COMPVAR
 TDataSize=1
 ArraySize=1
 ClrSym()
 TokenSym()
 ErrRet
 IF SymFound=$ff THEN
	ErrNo=ErrDupSym
	RETURN
 ENDIF
 IF SubCtr<>0 THEN
	DMArray=$ff
	ArraySize=SubValue(1)*SubValue(2)*SubValue(3)
	IF SubCtr>1 THEN
		MultiFlag=$ff
		TDataMod=LOR(TDataMod,MultiBit)
	ENDIF
 ENDIF
 NexToken()
 IF TokenBuf<>":" AND TokenBuf<>"as" THEN
	ErrNo=ErrSyntax
	RETURN
 ENDIF
 NexToken()
 IF TokenLen=0 THEN
	ErrNo=ErrSyntax
	RETURN
 ENDIF
 IF TokenBuf="boolean" OR TokenBuf="logical" THEN
	DTBoolean=$ff
	TDataType=BOOLEAN
	SymType="unsigned char "
	TDataSize=1
	GOTO DimVar1
 ENDIF
 IF TokenBuf="byte" OR TokenBuf="char" THEN
	DTByte=$ff
	TDataType=BYTE
	SymType="unsigned char "
	TDataSize=1
	GOTO DimVar1
 ENDIF
 IF TokenBuf="short" OR TokenBuf="word" THEN
	DTShort=$ff
	TDataType=SHORT
	SymType="unsigned short "
	TDataSize=2
	GOTO DimVar1
 ENDIF
 IF TokenBuf="long" OR TokenBuf="integer" OR TokenBuf="file" THEN
	DTLong=$ff
	TDataType=LONG
	IF TokenBuf="file" THEN
 		TDataMod=LOR(TDataMod,FileBit)
 	ENDIF
	SymType="long "
	TDataSize=4
	GOTO DimVar1
 ENDIF
 IF TokenBuf="form" THEN
 	IF AnyWinFlag=0 THEN
 		PRINT "FATAL ERROR.. FORM dimensioned in non-window program"
 		PRINT "Use '-?' to get valid command line options"
 		END
 	ENDIF
	DTForm=$ff
	TDataType=FORM
	SymType="window"
	GOTO DimWin
 ENDIF
 IF TokenBuf="object" THEN
 	IF AnyWinFlag=0 THEN
 		PRINT "FATAL ERROR.. OBJECT dimensioned in non-window program"
 		PRINT "Use '-?' to get valid command line options"
 		END
 	ENDIF
	DTObject=$ff
	TDataType=OBJECT
	SymType="window"
	GOTO DimWin
 ENDIF 
 IF TokenBuf="real" OR TokenBuf="float" THEN
	DTFloat=$ff
	TDataType=FLOAT
	SymType="double "
	TDataSize=8
	GOTO DimVar1
 ENDIF
 IF MID$(TokenBuf,1,6)="string" THEN
	DTString=$ff
	TDataType=STRING
	SymType="unsigned char "
	IF MID$(TokenSaf,7,1)<>"[" OR RIGHT$(TokenSaf,1)<>"]" THEN
		IF NextByte<>"*" THEN
			ErrNo=ErrSyntax
			RETURN
		ENDIF
		NexToken()\ REM Eat '*'
		NexToken()
		TempStr=TokenSaf
	ELSE
		TempStr=MID$(TokenSaf,8,LEN(TokenSaf)-8)
	ENDIF
	StrSiz()
	ErrRet
	SymTemp.Detail=TempInt
	TDataSize=TempInt
	GOTO DimVar1
 ENDIF
 IF TypeFlag=$ff THEN
	ErrNo=ErrIVParm
	RETURN
 ENDIF
 TSymName=SymTemp.SymName
 TypePtr=SymNdx
 SubCtrSaf=SubCtr
 SubValSaf=SubValue
 TokenSym1()
 ErrRet
 IF SymFound=0 OR SymTable(SymNdx).DataType<>STRUCT THEN
	ErrNo=ErrIVType
	RETURN
 ENDIF
 TDataSize=SymTable(SymNdx).DataSize
 SymType="short "\ REM  will divide array size by 2 later
 SymTemp.Detail=SymNdx
 SymNdx=TypePtr
 SymTemp.SymName=TSymName
 SubCtr=SubCtrSaf
 SubValue=SubValSaf
 TDataType=COMPLEX
 DTComplex=$ff
DimVar1
 NexToken()
 IF TokenLen=0 OR TokenBuf=";" THEN DimVar2
 IF TokenBuf="external" THEN
	IF TypeFlag=$ff THEN
		ErrNo=ErrIVParm
		RETURN
	ENDIF
	ExtVarFlg=$ff
	GOTO DimVar1
 ENDIF
 IF TokenBuf="address" OR TokenBuf="pointer" THEN
	IF TypeFlag=$ff OR DMArray=$ff THEN
		ErrNo=ErrIVParm
		RETURN
	ENDIF
	DMAddr=$ff
	SymType="long "
	DTString=0
	DTComplex=0
	TDataSize=4
	TDataMod=LOR(AddrBit,TDataMod)
	GOTO DimVar1
 ENDIF
 IF TokenBuf="vector" THEN
	NexToken()
	IF TokenLen<>0 THEN
		IF TokenBuf="global" THEN
			GblVarFlg=$ff
		ELSE
			ErrNo=ErrIVParm
			RETURN
		ENDIF
	ENDIF
	IF TypeFlag=$ff OR DMAddr=$ff OR  ParmFlag=$ff THEN
		ErrNo=ErrIVParm
		RETURN
	ENDIF
	VectorFlg=$ff
	TDataMod=LOR(TDataMod,VectorBit)
	GOTO DimVar2
 ENDIF
 IF TokenBuf="global" THEN
	IF TypeFlag=$ff THEN
		ErrNo=ErrIVParm
		RETURN
	ENDIF
	GblVarFlg=$ff
	GOTO DimVar1
 ENDIF
 ErrNo=ErrIVMod
 RET
DimWin
 DimFlag=0\ rem back to normal parsing rules
 SymNdxSaf=SymNdx
 TempStr=SymTemp.SymName
 NexToken()\ rem get object/form type
 IF TokenLen=0 THEN
 	ErrNo=ErrSyntax
 	RETURN
 ENDIF
 SymTemp.SymName=TokenBuf
 SymSrch()
 IF SymFound=0 THEN
 	ErrNo=ErrUDSym
 	RETURN
 ENDIF
 IF SymTable(SymNdx).DataType<>TDataType THEN
 	ErrNo=ErrIVType
 	RETURN
 ENDIF 
 TDetail=SymTable(SymNdx).Detail\ rem save object/form type
 TDataMod=SymTable(SymNdx).DataMod\ rem save object/form type
 ObjClass=SymTable(SymNdx).DataAddr\ rem save object/form class
 SymNdx=SymNdxSaf
 SymTemp.SymName=TempStr
 NexToken()
 IF TokenBuf<>"[" THEN
 	ErrNo=ErrSyntax
 	RETURN
 ENDIF
 NexToken()\ rem get x size
 TempStr=TokenBuf
 StrSiz()
 ErrRet
 TDataAddr=TempInt\ rem save x size
 CommaRet
 NexToken()\ rem get y size
 TempStr=TokenBuf
 StrSiz()
 ErrRet
 TDataSize=TempInt\ rem save y size  
 NexToken()
 IF TokenBuf<>"]" THEN
 	ErrNo=ErrSyntax
 	RETURN 
 ENDIF 
 SymTemp.Detail=TDetail|ObjClass
 SymTemp.DataMod=TDataMod
 SymTemp.DataAddr=TDataAddr
 SymTemp.DataSize=TDataSize 
DimVar2
 SymTemp.DataType=TDataType
 IF DMArray=$ff THEN
	TDataMod=LOR(ArrayBit,TDataMod)
	IF SymType="window" THEN
		ErrNo=ErrIVMod\ no arrays of objects (yet?)
		RET
	ENDIF
 ENDIF
 DimOK=$ff
 SymTemp.DataMod=TDataMod
 SymTemp.DataSize=ArraySize*TDataSize
 IF TDataType=STRING OR TDataType=COMPLEX THEN
	ArraySize=SymTemp.DataSize
 ENDIF
 RETURN

DecVar
 TempStr=""
 IF ExtVarFlg<>0 THEN
	TempStr="extern "
 ENDIF
 IF VectorFlg=$ff THEN
	GenVar
	OutBuf=TempStr+"_vector "+SymTemp.SymName+";"
	GenVar
	RETURN
 ENDIF
#IF risc=1
 IF TDataType=COMPLEX THEN
	ArraySize=ArraySize/4\ REM  byte-long correction
	SymType="long "
 ENDIF
#ELSE
 IF TDataType=COMPLEX THEN
	ArraySize=ArraySize/2\ REM  byte-short correction
 ENDIF
#ENDIF
 TempStr=TempStr+SymType
 TempStr=TempStr+SymTemp.SymName
 IF DMArray=$ff OR TDataType=STRING OR TDataType=COMPLEX THEN
	IF DMAddr=0 THEN
		TempStr=TempStr+"["+STR$(ArraySize)+"]"
	ENDIF
 ENDIF
 TempStr=TempStr+";"
 IF ParmFlag=0 THEN
	IF FcnVarFlg=0 THEN
		GenVar
		OutBuf=TempStr
		GenVar
	ELSE
		GenFcn
		OutBuf=TempStr
		GenFcn
	ENDIF
 ELSE
	INC FcnBlkNdx
	FcnBlk(FcnBlkNdx)=TempStr+" "+OutBuf
 ENDIF
 RETURN

VarBlank
 OutBuf=""
 GenVar
 RETURN

ClrSymTab
 SymTable(SymNdx).SymName="%"
 SymTable(SymNdx).DataType=COMPVAR
 SymTable(SymNdx).DataMod=0
 SymTable(SymNdx).Detail=0
 SymTable(SymNdx).DataAddr=0
 SymTable(SymNdx).DataSize=0
 SymTable(SymNdx).MultiPtr=0
 RETURN

OutLabel
 IF LabelFlag=$ff THEN\ REM Plain label
	OutBuf=SymbolSaf+";"
	GenCode
 ENDIF
 IF LabelFlag=$fe THEN\ REM Subroutine
	OutBuf=""
	GenCode
	OutBuf=SymbolSaf
	GenCode
	FcnRegs()
	RegInit()\ REM main case, Prevent unreferenced var warnings
 ENDIF
 RETURN

GetExp
 FloatFlag=0
 TypePtr=0
 ExpEnd=0
 ExpNdx=1
 ParenCnt=0
 FcnCtr=0
 AECtr=0
 ExpTable(ExpNdx)=1
 LastEntry=SymTable(ExpTable(ExpNdx))
GetExp1
 IF ExpEnd=$ff THEN ExpExit
 IF NextByte="," AND FcnCtr=0 AND AECtr=0 THEN ExpExit
GetExp2
 NexToken()
 IF FcnCtr<>0 AND TokenBuf="#" THEN GetExp2
 IF TokenLen=0 THEN ExpExit
 IF TokenBuf="," THEN
	AddRtGrp2()
	IF ExpNdx>ExpTabSiz THEN ExpExit
	IncExpNdx()
	IF ExpNdx>ExpTabSiz THEN ExpExit
	ExpTable(ExpNdx)=2
	IncExpNdx()
	IF ExpNdx>ExpTabSiz THEN ExpExit
	ExpTable(ExpNdx)=1
	LastEntry=SymTable(ExpTable(ExpNdx))
	GOTO GetExp1
 ENDIF
************************
* Start of Pointer Stuff Here
 IF TokenBuf="[" THEN
	IncExpNdx()
	IF ExpNdx>ExpTabSiz THEN ExpExit
	NexToken()
	IF TokenLen=0 THEN
		ErrNo=ErrIVExp
		GOTO ExpExit
	ENDIF
	SymTemp.SymName=TokenSaf
	SymSrch()
	IF SymFound=0 THEN
		ErrNo=ErrUDSym
		GOTO ExpExit
	ENDIF
	SymTemp=SymTable(SymNdx)
	IF LAND(AddrBit,SymTemp.DataMod)<>AddrBit THEN
		ErrNo=ErrTypMis
		GOTO ExpExit
	ENDIF
	IF SymTemp.DataType=FLOAT THEN
		INC FloatFlag
	ENDIF
	IF SymTemp.DataType=COMPLEX THEN
		ExpTable(ExpNdx)=24\ REM  cpx begin
		IncExpNdx()
		IF ExpNdx>ExpTabSiz THEN ExpExit
	ENDIF
	ExpTable(ExpNdx)=26\ REM  "["
	IncExpNdx()
	IF ExpNdx>ExpTabSiz THEN ExpExit
	ExpTable(ExpNdx)=SymNdx
	LastEntry=SymTemp
	NexToken()
	IF TokenBuf<>"]" OR TokenLen=0 THEN
		ErrNo=ErrSyntax
		GOTO ExpExit
	ENDIF
	IncExpNdx()
	IF ExpNdx>ExpTabSiz THEN ExpExit
	ExpTable(ExpNdx)=27\ REM  put "]" in table
	IF SymTemp.DataType<>COMPLEX THEN GetExp1
	IncExpNdx()
	IF ExpNdx>ExpTabSiz THEN ExpExit
	IF NextByte="." THEN
		NexToken()\ REM  eat "."
		ExpTable(ExpNdx)=13\ REM  "."
		NexToken()
		IF TokenLen=0 THEN
			ErrNo=ErrSyntax
			GOTO ExpExit
		ENDIF
		SymTemp.SymName=TokenSaf
		SymSrch()
		IF SymFound=0 THEN
			ErrNo=ErrUDSym
			GOTO ExpExit
		ENDIF
		SymTemp=SymTable(SymNdx)
		IF LAND(MemberBit,SymTemp.DataMod)<>MemberBit THEN
			ErrNo=ErrTypMis
			GOTO ExpExit
		ENDIF
		IF SymTemp.DataType=FLOAT THEN
			INC FloatFlag
		ENDIF
		IncExpNdx()
		IF ExpNdx>ExpTabSiz THEN ExpExit
		ExpTable(ExpNdx)=SymNdx
		IncExpNdx()
		IF ExpNdx>ExpTabSiz THEN ExpExit
	ENDIF
	ExpTable(ExpNdx)=25\ REM  cpx end
	GOTO GetExp1
 ENDIF
* End of Pointer Stuff Here
************************
 IF TokenType=TTypMath THEN
	IncExpNdx()
	IF ExpNdx>ExpTabSiz THEN ExpExit
	IF TokenBuf="+" THEN
		Unary()
		ExpTable(ExpNdx)=15
	ENDIF
	IF TokenBuf="-" THEN
		Unary()
		ExpTable(ExpNdx)=16
	ENDIF
	IF TokenBuf="*" THEN
		ExpTable(ExpNdx)=17
	ENDIF
	IF TokenBuf="/" THEN
		ExpTable(ExpNdx)=18
	ENDIF
	IF TokenBuf="&" THEN
		ExpTable(ExpNdx)=146
	ENDIF
	IF TokenBuf="|" THEN
		ExpTable(ExpNdx)=147
	ENDIF
	LastEntry=SymTable(ExpTable(ExpNdx))
	GOTO GetExp1
 ENDIF
 IF TokenBuf="(" THEN
	IncExpNdx()
	IF ExpNdx>ExpTabSiz THEN ExpExit
	IF LAND(ArrayBit,LastEntry.DataMod)<>0 AND SymTemp.DataType<$10 THEN
		ExpTable(ExpNdx)=3
		INC ParenCnt
		ParenStk(ParenCnt)=3
		INC AECtr
		IncExpNdx()
		IF ExpNdx>ExpTabSiz THEN ExpExit
		ExpTable(ExpNdx)=1
		GOTO GetExp3
	ENDIF
	IF LastEntry.DataType=FCN THEN
		ExpTable(ExpNdx)=5
		INC ParenCnt
		ParenStk(ParenCnt)=5
		INC FcnCtr
		IncExpNdx()
		IF ExpNdx>ExpTabSiz THEN ExpExit
		ExpTable(ExpNdx)=1
		GOTO GetExp3
	ENDIF
	IF LastEntry.DataType<>9 AND ExpNdx<>1 THEN
		ErrNo=ErrIVExp
		GOTO ExpExit
	ENDIF
	LevelCnt=1
	PreScan1()
	AddLftGrp()
	ExpTable(ExpNdx)=1
	INC ParenCnt
	ParenStk(ParenCnt)=1
GetExp3
	LastEntry=SymTable(ExpTable(ExpNdx))
	GOTO GetExp1
 ENDIF
 IF TokenBuf=")" THEN
	AddRtGrp2()
	IF ExpNdx>ExpTabSiz THEN ExpExit
	IncExpNdx()
	IF ExpNdx>ExpTabSiz THEN ExpExit
	IF ParenCnt=0 THEN
		ErrNo=ErrParen
		GOTO ExpExit
	ENDIF
	IF ParenStk(ParenCnt)=3 OR ParenStk(ParenCnt)=5 THEN
		ExpTable(ExpNdx)=2
		IncExpNdx()
		IF ExpNdx>ExpTabSiz THEN ExpExit
	ENDIF
	ExpTable(ExpNdx)=ParenStk(ParenCnt)+1
	IF ExpTable(ExpNdx)=4 THEN
		DEC AECtr
	ENDIF
	IF ExpTable(ExpNdx)=6 THEN
		DEC FcnCtr
	ENDIF
	DEC ParenCnt
	LastEntry=SymTable(ExpTable(ExpNdx))
	AddRtGrp1()
	GOTO GetExp1
 ENDIF
 IF TokenBuf="." THEN
	IncExpNdx()
	IF ExpNdx>ExpTabSiz THEN ExpExit
	ExpTable(ExpNdx)=13
	LastEntry=SymTable(ExpTable(ExpNdx))
	GOTO GetExp1
 ENDIF
 IF TokenType=TTypSym THEN
	IncExpNdx()
	IF ExpNdx>ExpTabSiz THEN ExpExit
	SymTemp.SymName=TokenBuf
	SymSearch()
	IF SymFound=$ff THEN
		SymTemp=SymTable(SymNdx)
		IF SymTemp.DataType=FCN THEN\ REM Function found
			IF MID$(SrcLine,SrcNdx+1,2)="()" THEN
				ExpTable(ExpNdx)=SymNdx
				IncExpNdx()
				INC SrcNdx
				IF ExpNdx>ExpTabSiz THEN ExpExit
				ExpTable(ExpNdx)=5
				IncExpNdx()
				INC SrcNdx
				IF ExpNdx>ExpTabSiz THEN ExpExit
				ExpTable(ExpNdx)=6
				NextByte=MID$(SrcLine,SrcNdx+1,1)
				GOTO GetExp1
			ENDIF
			PreScan()
			AddLftGrp()
			IF ExpNdx>ExpTabSiz THEN ExpExit
			LastEntry=SymTemp
			ExpTable(ExpNdx)=SymNdx
			GOTO GetExp1
		ENDIF
	ENDIF
	SymTemp.SymName=TokenSaf
	SymSrch()
	IF ErrNo<>0 THEN ExpExit
	IF SymFound=0 THEN
		IF FcnFlag<>0 AND SbrtnFlag=0 THEN
			ErrNo=ErrUDSym
			GOTO ExpExit
		ENDIF
		IF AutoDim=0 OR EnableAuto=0 THEN
			ErrNo=ErrUDSym
			GOTO ExpExit
		ENDIF
		ClrSym()
		SymTemp.DataMod=0
		IF RIGHT$(SymTemp.SymName,4)="_Str" THEN
			TempStr="unsigned char "+SymTemp.SymName+"[32];"
			SymTemp.DataType=STRING
			SymTemp.Detail=32
			SymTemp.DataSize=32
		ELSE
			TempStr="long "+SymTemp.SymName+";"
			SymTemp.DataType=LONG
			SymTemp.DataSize=4
		ENDIF
		SymInsert()
		IF ErrNo<>0 THEN ExpExit
		VarBlank()
		Comment="Automatic Variable Declaration"
		BldComment()
		GenVar
		OutBuf=TempStr
		GenVar
		VarBlank()
	ENDIF
	SymTemp=SymTable(SymNdx)
	IF SymTemp.DataMod&AddrBit=0 AND SymTemp.DataType<$10 THEN\ REM  special test for pointer
		DataTemp=SymTemp.DataType
		IF SymTemp.DataType=FLOAT THEN
			INC FloatFlag
		ENDIF
	ELSE
		DataTemp=LONG
	ENDIF
	IF DataTemp>=BOOLEAN AND DataTemp<=STRING OR DataTemp=COMPLEX OR DataTemp=BUFFER THEN
		ExpTable(ExpNdx)=SymNdx
		IF LAND(MemberBit,SymTemp.DataMod)<>0 AND LastEntry.SymName<>"." AND SymTemp.DataType<$10 THEN
			ErrNo=ErrIVExp
			GOTO ExpExit
		ENDIF
		IF TypePtr<>0 AND LastEntry.SymName="." THEN
			IF SymNdx-TypePtr>SymTable(TypePtr).Detail OR TypePtr>SymNdx THEN
				ErrNo=ErrUDSym
				GOTO ExpExit
			ELSE
				TypePtr=0
			ENDIF
		ENDIF
		IF DataTemp=COMPLEX THEN
			TempStr=NextByte
			PreScan()
			AddLftGrp()
			IF ExpNdx>ExpTabSiz THEN ExpExit
			NextByte=TempStr
			INC ParenCnt
			ParenStk(ParenCnt)=24
			ExpTable(ExpNdx)=24
			IncExpNdx()
			IF ExpNdx>ExpTabSiz THEN ExpExit
			TypePtr=SymTemp.Detail
		ENDIF
		IF DataTemp<>COMPLEX AND LAND(ArrayBit,SymTemp.DataMod)=ArrayBit AND SymTemp.DataType<$10 THEN
			TempStr=NextByte
			PreScan()
			AddLftGrp()
			IF ExpNdx>ExpTabSiz THEN ExpExit
			NextByte=TempStr
		ENDIF
		IF DataTemp<>COMPLEX THEN
			AddLftGrp()
		ENDIF
		IF ExpNdx>ExpTabSiz THEN ExpExit
		ExpTable(ExpNdx)=SymNdx
		LastEntry=SymTemp
		GOTO Exp4
	ENDIF
	IF DataTemp=OBJECT OR DataTemp=FORM THEN\ REM New
		ExpTable(ExpNdx)=SymNdx
		LastEntry=SymTemp		
		GOTO Exp4
	ENDIF
	IF DataTemp=COMPVAR OR DataTemp=MACRO THEN
		Konstant=SymTable(SymNdx).Detail
		SymTemp.SymName=Hex$(Konstant)
		ProcKonst()
		IF ErrNo<>0 THEN ExpExit
		GOTO Exp4
	ENDIF
	GOTO ExpExit
 ENDIF
 IF TokenType=TTypFloat THEN
	INC FloatFlag
	IncExpNdx()
	IF ExpNdx>ExpTabSiz THEN ExpExit
	AddLftGrp()
	IF ExpNdx>ExpTabSiz THEN ExpExit
	ValidFlt()
	IF FloatOK=0 THEN
		ErrNo=ErrIVExp
		GOTO ExpExit
	ENDIF
	SymTemp.SymName=TokenBuf
	SymSrch()
	IF SymFound=0 THEN
		ClrSym()
		SymTemp.DataType=FLOAT
		SymTemp.DataSize=8
		SymTemp.DataMod=ConstBit
		SymInsert()
		ErrRet
	ENDIF
	SymTemp=SymTable(SymNdx)
	LastEntry=SymTemp
	ExpTable(ExpNdx)=SymNdx
	AddRtGrp1()
	IF ExpNdx>ExpTabSiz THEN ExpExit
	GOTO GetExp1
 ENDIF
 IF TokenType=TTypInt THEN
	IncExpNdx()
	IF ExpNdx>ExpTabSiz THEN ExpExit
	AddLftGrp()
	IF ExpNdx>ExpTabSiz THEN ExpExit
	ValidInt()
	IF IntOK=0 THEN
		ErrNo=ErrIVExp
		GOTO ExpExit
	ENDIF
	Konstant=VAL(TokenBuf)
	SymTemp.SymName=Hex$(Konstant)
	ProcKonst()
	IF ErrNo<>0 THEN ExpExit
	GOTO Exp4
 ENDIF
 IF TokenType=TTypHex THEN
	IncExpNdx()
	IF ExpNdx>ExpTabSiz THEN ExpExit
	AddLftGrp()
	IF ExpNdx>ExpTabSiz THEN ExpExit
	ValidHex()
	IF HexOK=0 THEN
		ErrNo=ErrIVExp
		GOTO ExpExit
	ENDIF
	SymTemp.SymName=TokenBuf
	ProcKonst()
	IF ErrNo<>0 THEN ExpExit
Exp4 AddRtGrp1()
	IF ExpNdx>ExpTabSiz THEN ExpExit
	GOTO GetExp1
 ENDIF
 IF TokenType=TTypQuote THEN
	IncExpNdx()
	IF ExpNdx>ExpTabSiz THEN ExpExit
	IF LEN(TokenSaf)=2 THEN\ REM  null string
		LastEntry=SymTable(20)
		ExpTable(ExpNdx)=20\ REM  20 is table entry for null string
		GOTO GetExp1
	ENDIF
	INC PoolCtr
	TempStr="_StrConst"
	TempStr=TempStr+STR$(PoolCtr)
	SymTemp.SymName=TempStr
	OutBuf="char "+TempStr+"[]="
	OutBuf=OutBuf+TokenSaf+";"
	SymSrch()
	SymTemp.DataType=STRING
	SymTemp.DataMod=4
	ClrSym()
	SymTemp.Detail=LEN(TokenSaf)-1
	SymTemp.DataSize=SymTemp.Detail
	SymInsert()
	IF ErrNo<>0 THEN
		GOTO ExpExit
	ENDIF
	GenVar
	LastEntry=SymTemp
	ExpTable(ExpNdx)=SymNdx
	GOTO GetExp1
 ENDIF
 ErrNo=ErrIVExp
 RET
ExpExit
 IF ExpLen=ExpTabSiz THEN
	ErrNo=ErrCpxExp
 ENDIF
 IF ExpLen=1 THEN
	ErrNo=ErrIVExp
 ENDIF
 IF ErrNo=0 THEN
	IF ParenCnt<>0 THEN
		IF ParenStk(ParenCnt)=24 THEN
			IncExpNdx()
			IF ExpNdx>ExpTabSiz THEN ExpExit
			ExpTable(ExpNdx)=25
			DEC ParenCnt
		ENDIF
	ENDIF
	IF ParenCnt<>0 THEN
		IF ParenStk(ParenCnt)=22 THEN
			IncExpNdx()
			IF ExpNdx>ExpTabSiz THEN ExpExit
			ExpTable(ExpNdx)=23
			ParenCnt=0
		ENDIF
	ENDIF
	IF ParenCnt<>0 THEN
		ErrNo=ErrParen
	ELSE
		IncExpNdx()
		ExpTable(ExpNdx)=2
	ENDIF
 ENDIF
 RETURN

PreScan
 LevelCnt=0
 PreScan1()
 RETURN

PreScan1
 SrcNdxSaf=SrcNdx
 ExpEndSaf=ExpEnd
PreScan2
 NexToken()
 IF TokenLen=0 THEN
	NextByte="%"
	SrcNdx=SrcNdxSaf
	ExpEnd=ExpEndSaf
	RETURN
 ENDIF
 IF TokenType=TTypMath AND LevelCnt=0 THEN
	NextByte=TokenBuf
	SrcNdx=SrcNdxSaf
	ExpEnd=ExpEndSaf
	RETURN
 ENDIF
 IF TokenBuf="(" THEN
	INC LevelCnt
 ENDIF
 IF TokenBuf=")" THEN
	DEC LevelCnt
 ENDIF
 GOTO PreScan2
 RETURN\ REM  sbrtn delimiter only

Unary
 LstExp=ExpTable(ExpNdx-1)
 IF LstExp=1 OR LstExp=3 OR LstExp=5 OR LstExp=22 OR LstExp=24 THEN
	ExpTable(ExpNdx)=21\ REM *********
	IncExpNdx()
 ENDIF
 RETURN

AddLftGrp
 IF NextByte="*" OR NextByte="/" OR NextByte="&" THEN
	IF LAND(MemberBit,SymTemp.DataMod)<>MemberBit THEN
		IF ParenCnt<>0 THEN
			IF ParenStk(ParenCnt)=22 THEN
				RETURN
			ENDIF
		ENDIF
		INC ParenCnt
		ParenStk(ParenCnt)=22
		ExpTable(ExpNdx)=22
		IncExpNdx()
	ENDIF
 ENDIF
 RETURN

AddRtGrp1
 IF ParenCnt=0 THEN
	RETURN
 ENDIF
 IF NextByte="+" OR NextByte="-" OR NextByte="*" OR NextByte="/"  OR NextByte="&" OR NextByte="|" THEN
	IF ParenStk(ParenCnt)=24 THEN
		IncExpNdx()
		IF ExpNdx>ExpTabSiz THEN
			RETURN
		ENDIF
		DEC ParenCnt
		ExpTable(ExpNdx)=25
	ENDIF
	IF ParenCnt=0 THEN
		RETURN
	ENDIF
	IF NextByte="+" OR NextByte="-"  OR NextByte="|" THEN
		IF ParenStk(ParenCnt)=22 THEN
			IncExpNdx()
			DEC ParenCnt
			ExpTable(ExpNdx)=23
			LastEntry=SymTable(ExpTable(ExpNdx))
			RETURN
		ELSE
			RETURN
		ENDIF
	ENDIF
 ENDIF
 RETURN

AddRtGrp2
 IF ParenStk(ParenCnt)=24 THEN
	IncExpNdx()
	IF ExpNdx>ExpTabSiz THEN
		RETURN
	ENDIF
	DEC ParenCnt
	ExpTable(ExpNdx)=25
 ENDIF
 IF ParenStk(ParenCnt)=22 THEN
	IncExpNdx()
	DEC ParenCnt
	ExpTable(ExpNdx)=23
 ENDIF
 RETURN

IncExpNdx
 INC ExpNdx
 ExpLen=ExpNdx
 RETURN

ProcKonst
 SymSrch()
 IF SymFound=0 THEN
	ClrSym()
	SymTemp.DataType=LONG
	SymTemp.DataSize=4
	SymTemp.DataMod=4
	SymInsert()
	ErrRet
 ENDIF
 SymTemp=SymTable(SymNdx)
 LastEntry=SymTemp
 ExpTable(ExpNdx)=SymNdx
 RETURN

ProcExp
 IF ExpFlag=$ff THEN
	FOR Ctr1=1 to ExpLen
		PRINT SymTable(ExpTable(Ctr1)).SymName;
	NEXT Ctr1
	PRINT
 ENDIF
 LOOP
	LastGroup=$00
	TempInt=ExpNdx
	ParenScan()
	ExpNdx=TempInt
	IF ParenCnt=0 THEN
		RETURN
	ENDIF
	SolveTerm()
	ErrRet
	SquishExp()
 ENDLOOP
 RETURN\ REM  sbrtn delimiter only

ParenScan
 ParenCnt=0
 ExpNdx=0
 PType=0
 ExpLeft=0
 ExpRight=0
 IF ExpNdx>ExpLen THEN
	RETURN
 ENDIF
ParenScn1
 INC ExpNdx
 PType=ExpTable(ExpNdx)
 IF PType=1 OR PType=3 OR PType=5 OR PType=22 OR PType=24 OR PType=26 THEN
	ExpLeft=ExpNdx
	INC ParenCnt
 ENDIF
 IF PType=2 OR PType=4 OR PType=6 OR PType=23 OR PType=25 OR PType=27 THEN
	ExpRight=ExpNdx
	RETURN
 ENDIF
 GOTO ParenScn1
 RETURN\ REM  sbrtn delimiter only

SquishExp
 LOOP
	IF ExpRight+1>ExpLen THEN
		ExpLen=ExpLeft-1
		RETURN
	ENDIF
	ExpTable(ExpLeft)=ExpTable(ExpRight+1)
	INC ExpLeft
	INC ExpRight
 ENDLOOP
 RETURN\ REM  sbrtn delimiter only

SolveTerm
 InitReg0
 IF ExpLeft=1 AND ExpRight=ExpLen THEN
	LastGroup=$ff
 ENDIF
 IF ExpLeft=2 AND ExpRight=ExpLen-1 AND ExpTable(1)=1 THEN
	LastGroup=$ff
 ENDIF
********************************
* Pointer Stuff Begins Here
 IF PType=27 THEN
	ExpNdx=ExpLeft+1
	ClassOp()
	GetTmpVec()
	ErrRet
	SymTable(SymNdx).DataMod=LAND(SymTable(SymNdx).DataMod,$fd)\ REM  kill addr bit
	ExpTable(ExpNdx)=SymNdx
	OutBuf="*((long*)&"+SymTemp.SymName+"._Ptr)="+TSymName+";"
	GenCode
	IF TDataType=STRING THEN
		OutBuf=SymTemp.SymName+"._Len="+STR$(TDetail)+";"
		GenCode
		OutBuf=SymTemp.SymName+"._Lnk=0;"
		GenCode
	ENDIF
	GOTO GrpCpxEnd
 ENDIF
* Pointer Stuff Ends Here
********************************
 IF PType=4 THEN
	ExpNdx=ExpLeft-1
	ClassOp()
	IF TDataType=STRING THEN
		VecString()
		GOTO ArrFcnEnd
	ENDIF
	GetTmpVec()
	ErrRet
	GetBase()
	ExpTable(ExpNdx)=SymNdx
	TempStr=SymTemp.SymName
	GetOpSize()
	BldOffset()
	ErrRet
	OutBuf=TempStr+"._Ptr=_a0;"
	GenCode
	GOTO ArrFcnEnd
 ENDIF
 IF PType=6 THEN\ REM Function
	ExpNdx=ExpLeft-1
	SymTemp=SymTable(ExpTable(ExpNdx))
	UsrFcnNam=SymTemp.SymName
	TempInt=SymTemp.Detail+1
	FcnCode=TempInt-1
	IF FcnCode=$ff THEN\ REM  (BASIC Subroutine)
		ErrNo=ErrTypMis
		RETURN
	ENDIF
	ExpNdx=ExpNdx+2
	IF TempInt>=1000 THEN\ REM  UsrFcn
		TempInt=TempInt-1001\ REM  now TempInt=number of args
		IF TempInt=10 THEN
			NumArgs=ExpRight-ExpLeft-1
		ELSE
			NumArgs=TempInt
			IF ExpRight-ExpLeft<>NumArgs+1 THEN
				ErrNo=ErrFcn
				RETURN
			ENDIF
		ENDIF
		FcnType=LAND($00000003,SymTemp.DataSize)
		FcnSpec=LAND($00000004,SymTemp.DataSize)
		IF FcnType<2 THEN
			GetIntTmp()
			ErrRet
		ELSE
			GetFltTmp()
			ErrRet
		ENDIF
		IF FcnType<>0 THEN
			OutBuf=SymTemp.SymName+"="
		ELSE
			OutBuf=""
		ENDIF
		IF FcnSpec=0 THEN
			OutBuf=OutBuf+UsrFcnNam
		ELSE
			OutBuf=OutBuf+"(*"+UsrFcnNam+")"
		ENDIF
		TempStr=OutBuf+"("
		WHILE NumArgs>0 DO
			ClassOp()
			IF OpClass<>INTClass AND OpClass<>FLTClass AND OpClass<>BOOLClass THEN
				ErrNo=ErrTypMis
				RETURN
			ENDIF
			IF DMVector<>0 THEN
				IF OpClass=INTClass THEN
					GetIntTmp()
					ErrRet
					OutBuf=SymTemp.SymName+"=*(long*)"+TSymName+"._Ptr;"
				ELSE
					GetFltTmp()
					ErrRet
					OutBuf=SymTemp.SymName+"=*(double*)"+TSymName+"._Ptr;"
				ENDIF
				GenCode
				TSymName=SymTemp.SymName
			ENDIF
			TempStr=TempStr+TSymName
			IF NumArgs>1 THEN
				TempStr=TempStr+","
			ENDIF
			DEC NumArgs
			INC ExpNdx
		ENDWHILE
                OutBuf=TempStr+");"
		GenCode
		ExpTable(ExpNdx)=SymNdx
	ELSE
		IF TempInt<51 THEN
 			ON TempInt GOSUB F0,F1,F2,F3,F4,F5,F6,F7,F8,F9,F10,F11,F12,F13,F14,F15,F16,F17,F18,F19,F20,F21,F22,F23,F24,F25,F26,F27,F28,F29,F30,F31,F32,F33,F34,F35,F36,F37,F38,F39,F40,F41,F42,F43,F44,F45,F46,F47,F48,F49
 		ELSE
 			ON TempInt-50 GOSUB F50,F51,F52,F53,F54,F55,F56,F57,F58,F59,F60,F61,F62,F63,F64,F65,F66,F67,F68,F69,F70,F71,F72,F73,F74,F75,F76,F77,F78,F79,F80,F81
 		ENDIF
	ENDIF
	ErrRet
	GOTO ArrFcnEnd
 ENDIF
 IF PType=25 THEN
	IF ExpRight-ExpLeft=2 THEN
		ExpNdx=ExpLeft+1
		ClassOp()
		IF DMVector=0 THEN
			Vectorize()
			ErrRet
		ENDIF
		IF DMVector=$ff AND DMTemp=0 THEN
			SetTmpVec()
			ErrRet
		ENDIF
		GOTO GrpCpxEnd
	ENDIF
	ExpNdx=ExpLeft+3
	ClassOp()
	IF TDataType=STRING AND DMVector=0 THEN
		VecString()
	ENDIF
	IF DMVector=$ff AND DMTemp=0 THEN
		SetTmpVec()
		ErrRet
	ENDIF
	ExpNdx=ExpNdx-2
	ClassOp()
	IF DMVector=0 THEN
		Vectorize()
		ErrRet
	ENDIF
	IF DMVector=$ff AND DMTemp=0 THEN
		SetTmpVec()
		ErrRet
	ENDIF
	ExpNdx=ExpNdx+2
	ClassOp()
	ExpNdx=ExpNdx-2
	SymNdx=ExpTable(ExpNdx)
	SymTable(SymNdx).DataType=TDataType
	SymTable(SymNdx).DataSize=TDataSize
	SymTable(SymNdx).Detail=TDetail
	OutBuf="_d0=(long)"+SymTable(SymNdx).SymName+"._Ptr;"
	GenCode
	IF DMVector=$ff THEN
		OutBuf="_d0=_d0+(long)"+TSymName+"._Ptr;"
	ELSE
		OutBuf="_d0=_d0+"+STR$(TDataAddr)+";"
	ENDIF
	GenCode
	OutBuf="*((long*)&"+SymTable(SymNdx).SymName+"._Ptr)=_d0;"
	GenCode
	IF OpClass=STRClass AND ReadFlag=0 THEN
		OutBuf=SymTable(SymNdx).SymName+"._Len="+TSymName+"._Len;"
		GenCode
		OutBuf=SymTable(SymNdx).SymName+"._Lnk="+TSymName+"._Lnk;"
		GenCode
	ENDIF
	GOTO GrpCpxEnd
 ENDIF
* Get here if PType=2
 ExpNdx=ExpLeft+1
 ClassOp()
 MakeLong
 IF ExpRight-ExpLeft=2 AND DMArray=$ff THEN
	IF CompFlag<>0 THEN
		ErrNo=ErrIVExp
	ENDIF
	GOTO GrpCpxEnd
 ENDIF
 IF LastGroup=$ff AND ExpRight-ExpLeft<>2 AND Target=$ff THEN
	ErrNo=ErrIVTarg
	RETURN
 ENDIF
 IF ExpRight-ExpLeft=2 THEN
	IF TDataType=STRING AND DMVector=0 AND DMAddr=0 THEN
		VecString()
	ENDIF
	IF TDataType=STRING AND DMVector=$ff AND DMTemp=0 AND DiskIO=$ff  AND BufRWFlg=0 THEN
		GetBase()
	ENDIF
	GOTO GrpCpxEnd
 ENDIF
ScanStr
 ClassOp()
 MakeLong
 IF TDataType=STRING AND DMVector=0 AND DMAddr=0 THEN
	VecString()
 ENDIF
 IF DMVector=$ff AND DMTemp=0 THEN
	REM need to make a temp vector
	SetTmpVec()
	ErrRet
 ENDIF
 INC ExpNdx
 IF ExpNdx<ExpRight THEN ScanStr
 ExpNdx=ExpLeft+1
 ClassOp()
 MakeLong
 IF TDataType=STRING THEN
	DataOp=0
	Ctr1=0
6184 IF DataOp=0 THEN
		ClassOp()
		IF TDataType<>STRING THEN
			ErrNo=ErrIVExp
			RETURN
		ENDIF
		INC Ctr1
		IF Ctr1>1 THEN
			OutBuf="_a0=&"+TSymName+";"
			GenCode
			TSymName=SymTable(ExpTable(ExpNdx-2)).SymName
			OutBuf=TSymName+"._Lnk=_a0;"
			GenCode
		ENDIF
		DataOp=$ff
	ELSE
		MathOp=ExpTable(ExpNdx)
		IF MathOp<15 THEN
			ErrNo=ErrIVExp
			RETURN
		ENDIF
		DataOp=0
	ENDIF
	INC ExpNdx
 IF ExpNdx<ExpRight THEN 6184
	IF DataOp=0 THEN
		ErrNo=ErrIVExp
		RETURN
	ENDIF
	ExpNdx=ExpLeft+1
	GOTO GrpCpxEnd
 ENDIF
 IF TDataType<2 OR TDataType>5 THEN
	ErrNo=ErrIVExp
	RETURN
 ELSE
	DataOp=0
	Ctr1=0
6186 IF DataOp=0 THEN
		DataOp=$ff
		LoadReg()
		ErrRet
		INC Ctr1
		IF Ctr1>1 THEN
			IF MathOp=15 THEN
				Add()
			ENDIF
			IF MathOp=16 THEN
				Sub()
			ENDIF
			IF MathOp=17 THEN
				Mul()
			ENDIF
			IF MathOp=18 THEN
				Div()
			ENDIF
			IF MathOp=146 THEN
				And()
			ENDIF
			IF MathOp=147 THEN
				Or()
			ENDIF
		ENDIF
	ELSE
		MathOp=ExpTable(ExpNdx)
		DataOp=0
	ENDIF
	INC ExpNdx
	IF ExpNdx<ExpRight THEN 6186
	IF DataOp=0 THEN
		ErrNo=ErrIVExp
	ENDIF
	ExpNdx=ExpLeft+1
	IF LastGroup=$ff AND CompFlag=0 THEN
		ExpTable(ExpNdx)=19
		IF TDataType=FLOAT THEN
			SymTable(19).DataType=FLOAT
		ELSE
			SymTable(19).DataType=LONG
		ENDIF
		GOTO GrpCpxEnd
	ENDIF
	IF FloatFlag=0 THEN
		GetTmp()
		ErrRet
	ELSE
		GetFltTmp()
		ErrRet
	ENDIF
        OutBuf=SymTemp.SymName+"="+Reg0Name+";"
	GenCode
	ExpTable(ExpNdx)=SymNdx
	GOTO GrpCpxEnd
 ENDIF
ArrFcnEnd
 DEC ExpLeft
GrpCpxEnd
 ExpTable(ExpLeft)=ExpTable(ExpNdx)
 ExpNdx=ExpLeft
 INC ExpLeft
 RETURN
 
GetBase
 IF DMMember=$ff THEN
	OutBuf="*((long*)&_a0)="+STR$(TDataAddr)+";"
 ELSE
	IF DMVector=$ff THEN
		OutBuf="_a0="+TSymName+"._Ptr;"
	ELSE
		IF DMArray=$ff OR TDataType=STRING OR TDataType=COMPLEX THEN
			OutBuf="_a0="+TSymName+";"
		ELSE
			OutBuf="_a0=&"+TSymName+";"
		ENDIF
	ENDIF
 ENDIF
 GenCode
 RETURN

BldOffset
 SymTable(SymNdx).DataSize=TempInt
 SymTable(SymNdx).DataMod=LAND(ArrayMsk,SymTable(SymNdx).DataMod)
 ClassOp()
 ExpNdx=ExpNdx+2
 NumArgs=ExpRight-ExpLeft-1
 IF NumArgs<>SubCtr THEN
	ErrNo=ErrArrSub
	RETURN
 ENDIF
 SubLoad()
 IF NumArgs=1 THEN\ REM  1 dim array
	IF TempInt<>1 THEN
		OutBuf="_d0=_d0*"+STR$(TempInt)+";"
		GenCode
	ENDIF
	OutBuf="*((long*)&_a0)=(long)_a0+_d0;"
	GenCode
	ExpNdx=ExpNdx-2
	RETURN
 ENDIF
 OutBuf="_d1=_d0;"
 GenCode
 INC ExpNdx
 SubLoad()
 ErrRet
 IF NumArgs=2 THEN\ REM  2 dim array
	REM _d0 is (2), _d1 is (1)
	OutBuf="_d0=_d0*"+STR$(SubValue(1))+"*"+STR$(TempInt)+"+"+STR$(TempInt)+"*_d1;"
	GenCode
	OutBuf="*((long*)&_a0)=(long)_a0+_d0;"
	GenCode
	ExpNdx=ExpNdx-3
	RETURN
 ENDIF
 REM Get here if 3 dim array
 OutBuf="_d2=_d0;"
 GenCode
 INC ExpNdx
 SubLoad()
 ErrRet
 REM _d0 is (3), _d1 is(1), _d2 is (2)
 OutBuf="_d0=_d2*"+STR$(SubValue(1))+"*"+STR$(TempInt)+"+_d0*"+STR$(SubValue(1))+"*"+STR$(SubValue(2))+"*"+STR$(TempInt)+";"
 GenCode
 OutBuf="_d0=_d0+"+STR$(TempInt)+"*_d1;"
 GenCode
 OutBuf="*((long*)&_a0)=(long)_a0+_d0;"
 GenCode
 ExpNdx=ExpNdx-4
 RETURN

VecString
 IF BufRWFlg=$ff THEN\ REM  for the case of BUFRW #fn,ADDR(a$),size
	RETURN
 ENDIF
 GetTmpVec()
 ErrRet
 GetBase()
 ExpTable(ExpNdx)=SymNdx
 TempStr=SymTemp.SymName
 TempInt=TDetail
 IF PType=4 THEN
	BldOffset()
 ENDIF
 OutBuf=TempStr+"._Ptr=_a0;"
 GenCode
 IF ReadFlag=0 THEN
 	OutBuf=TempStr+"._Len="+STR$(TempInt)+";"
 	GenCode
 	OutBuf=TempStr+"._Lnk=0;"
 	GenCode
 ENDIF
 RETURN

ClassOp
 SymTemp=SymTable(ExpTable(ExpNdx))
 ClassOp1()
 RETURN

ClassOp1
 ClrDatTyp()
 TSymName=SymTemp.SymName
 TDataType=SymTemp.DataType
 TWinMod=SymTemp.WinMod
 TDataMod=SymTemp.DataMod
 TDetail=SymTemp.Detail
 TDataAddr=SymTemp.DataAddr
 TDataSize=SymTemp.DataSize
 TMultiPtr=SymTemp.MultiPtr
 IF TDataType=OBJECT OR TDataType=FORM THEN
 	TDataMod=0
 	IF TDataType=OBJECT THEN
 		OpClass=OBJClass
 		ObjClass=SymTemp.Detail&$ff00
 		ObjSubClass=SymTemp.Detail&$ff
 	ELSE
 		OpClass=FRMClass
 	ENDIF
 	RETURN
 ENDIF
 GetDtaTyp()
 IF LAND(DataBit,TDataMod)=DataBit THEN
	DMData=$ff
 ENDIF
 IF LAND(TempBit,TDataMod)=TempBit THEN
	DMTemp=$ff
 ENDIF
 IF LAND(VectorBit,TDataMod)=VectorBit THEN
	DMVector=$ff
 ENDIF
 IF LAND(MemberBit,TDataMod)=MemberBit THEN
	DMMember=$ff
 ENDIF
 IF LAND(MultiBit,TDataMod)=MultiBit THEN
	DMMulti=$ff
 ENDIF
 IF LAND(ConstBit,TDataMod)=ConstBit THEN
	DMConst=$ff
 ENDIF
 IF LAND(AddrBit,TDataMod)=AddrBit THEN
	DMAddr=$ff
 ENDIF
 IF LAND(ArrayBit,TDataMod)=ArrayBit THEN
	DMArray=$ff
	OpClass=ARRClass
	IF DMMulti=$ff THEN
		MultiNdx=TMultiPtr
		SubCtr=SymTable(MultiNdx).DataMod
		SubValue(1)=SymTable(MultiNdx).Detail
		SubValue(2)=SymTable(MultiNdx).DataAddr
		SubValue(3)=SymTable(MultiNdx).DataSize
	ELSE
		SubCtr=1
	ENDIF
	RETURN
 ENDIF
 IF TDataType>=2 AND TDataType<=4 OR LAND(AddrBit,TDataMod)=AddrBit THEN
	OpClass=INTClass
	RETURN
 ENDIF
 IF TDataType=FCN AND TDataSize&$00000004=4 THEN
	OpClass=INTClass
 ENDIF
 IF TDataType=BOOLEAN THEN
	OpClass=BOOLClass
	RETURN
 ENDIF
 IF TDataType=STRING THEN
	OpClass=STRClass
	RETURN
 ENDIF
 IF TDataType=FLOAT THEN
	OpClass=FLTClass
	RETURN
 ENDIF
 IF TDataType=COMPLEX THEN
	OpClass=CPXClass
	RETURN
 ENDIF
 OpClass=0
 RETURN
 
Expr
 GetExp()
 ErrRet
 ProcExp()
 ErrRet
 ClassOp()
 RETURN
 
TokenSym
 NexToken()
 IF TokenLen=0 THEN
	ErrNo=ErrSyntax
	RETURN
 ENDIF
 TokenSym1()
 RETURN

TokenSym1
 GtRootSym()
 ValidSym()
 IF SymbolOK=0 THEN
	ErrNo=ErrIVSNam
	RETURN
 ENDIF
 SymTemp.SymName=SymbolSaf
 SymSrch()
 RETURN
 
ClrSym
 SymTemp.Detail=0
 SymTemp.DataAddr=0
 SymTemp.DataSize=0
 SymTemp.MultiPtr=0
 RETURN
 
CmdLine
CmdLineLp
 ErrNo=0
 TempStr=NextArg
 IF LEN(TempStr)=0 THEN
 	RETURN
 ENDIF
 IF LEFT$(TempStr,1)="-" THEN
	OptNdx=1
Option
	ParseOpt()
	IF LEN(Opt)=0 THEN CmdLineLp
	IF Opt="1" THEN
		ExpFlag=$ff
		GOTO Option
	ENDIF
	IF Opt="r" THEN
		RemarkFlg=0
		GOTO Option
	ENDIF
	IF Opt="a" THEN
		AsmbFlag=$ff
		GOTO Option
	ENDIF
	IF Opt="d" THEN
		AutoDim=0
		GOTO Option
	ENDIF
    IF Opt="p" THEN
    	PromptFlag=$ff
		GOTO Option
	ENDIF
    IF Opt="P" THEN
    	ProcedureFlag=$ff
		GOTO Option
	ENDIF
	IF Opt="f" THEN
		FcnMode=$ff
		ProgMode=0
		GOTO Option
	ENDIF
	IF Opt="g" THEN
		LinkerOpt=LinkerOpt+" -g"
		DbgFlag=$ff
		GOTO Option
	ENDIF
    IF Opt="D" THEN
    	DLLFlag=$ff
    	GOTO Option
	ENDIF
	IF Opt="w" THEN
		WinFlag=$ff
		AnyWinFlag=$ff
		OutBuf="#include <windows.h>"
		GenVar
    	GOTO Option
	ENDIF
	IF Opt="x" THEN
		XWinFlag=$ff
		AnyWinFlag=$ff
		OutBuf="#include <forms.h>"
		GenVar
    	GOTO Option
	ENDIF
	IF Opt="c" THEN
		COut=$ff
		GOTO Option
	ENDIF
	IF Opt="e" THEN
		NoGen=$ff
		GOTO Option
	ENDIF
	IF Opt="s" THEN
		DumpSyms=$ff
		GOTO Option
	ENDIF
	IF Opt="v" THEN
		VerbFlag=$ff
		GOTO Option
	ENDIF
	IF Opt="u" THEN
		UDump=$ff
		GOTO Option
	ENDIF
	PRINT "Unknown option ";TempStr
	END
 ELSE
	REM SET Directive
	SrcNdx=0
	SrcLine=TempStr
	SetMask=$80\ REM  simulate FIX
	SETDx1()
 ENDIF
 GOTO CmdLineLp
 RETURN\ REM Sbtrn delimiter only

ParseOpt
 INC OptNdx
 Opt=MID$(TempStr,OptNdx,1)
 RETURN
 
CallErr
 IF StatFlag=$ff THEN
	RETURN
 ENDIF
 OutBuf="if (STATUS == -1) longjmp(_ebuf,1);"
 GenCode
 RETURN

GenXfrCnt
 OutBuf="XferCount=STATUS;"
 GenCode
 RETURN

ClrERR
 OutBuf="errno=0;"
 GenCode
 RETURN
 
GetAccMod
 NexToken()
 IF TokenBuf="dir" THEN
	DirFlag=$ff
	NexToken()
	IF TokenBuf="+" THEN
		NexToken()\ REM  eat optional "+"
	ENDIF
 ELSE
	DirFlag=0
 ENDIF
 IF ANSIFile=0 THEN
 	IF CrOpFlag=$ff THEN
		AccMode="A_WRITE|A_CREAT|A_EXCL"
 	ENDIF
 ELSE
 	IF CrOpFlag=$ff THEN
		AccMode="w"
	ELSE
		AccMode="r"
 	ENDIF
 ENDIF
 IF TokenLen<>0 THEN
	IF TokenBuf="update" THEN
		IF ANSIFile=0 THEN
			IF CrOpFlag=$ff THEN
				CreatMode="P_WRITE|P_READ"
			ELSE
				AccMode="A_UPDATE"
			ENDIF
		ELSE
			AccMode=AccMode+"+"
		ENDIF
	ELSE
		IF ANSIFile=0 THEN
			IF TokenBuf="read" THEN
				IF CrOpFlag=$ff THEN
					CreatMode="P_READ"
				ELSE
					AccMode="A_READ"
				ENDIF
			ELSE
				IF TokenBuf="write" THEN
					IF CrOpFlag=$ff THEN
						CreatMode="P_WRITE|P_READ"
					ELSE
						AccMode="A_WRITE"
					ENDIF
				ENDIF
			ENDIF
		ELSE
			IF CrOpFlag=0 AND TokenBuf="write" THEN AccModErr
			IF CrOpFlag<>0 AND TokenBuf="read" THEN AccModErr
		ENDIF
	ENDIF
 ELSE
AccModErr
	ErrNo=ErrSyntax
	RETURN
 ENDIF
 NexToken()
 IF TokenLen<>0 THEN
	IF TokenBuf="+" THEN
		NexToken()\ REM  eat optional "+"
		IF TokenBuf="dir" THEN
			DirFlag=$ff
		ELSE
			IF TokenBuf="binary" THEN
				IF ANSIFile=0 THEN
					AccMode=AccMode+"|A_BINARY"
				ELSE
					AccMode=AccMode+"b"
				ENDIF
			ELSE
				IF TokenBuf="text" THEN
					IF ANSIFile=0 THEN
						AccMode=AccMode+"|A_TEXT"
					ENDIF
				ELSE
					ErrNo=ErrSyntax
				ENDIF
			ENDIF
		ENDIF
	ENDIF
 ENDIF
 RETURN

GetOpSize
 IF TDataType=BOOLEAN OR TDataType=BYTE THEN
	TempInt=1
 ENDIF
 IF TDataType=SHORT THEN
	TempInt=2
 ENDIF
 IF TDataType=LONG THEN
	TempInt=4
 ENDIF
 IF TDataType=FLOAT THEN
	TempInt=8
 ENDIF
 IF TDataType=COMPLEX THEN
	TempInt=SymTable(SymTable(SymNdx).Detail).DataSize
 ENDIF
 RETURN
 
DevChk
 NexToken()
 IF TokenBuf="#" THEN
	DevFlag=$ff
 ELSE
	UnDoToken()
 ENDIF
 RETURN
 
GetPthNum
 ClrERR()
 NexToken()
 IF TokenBuf<>"#" THEN\ REM Must be a file pointer
 	UnDoToken()
 	ANSIFile=1
 	Expr()
 	IF LAND(FileBit,TDataMod)<>FileBit THEN\ REM Not a file pointer
 		ErrNo=ErrTypMis
 		RETURN
 	ENDIF
 	GetFilePtr() 	
 	IF FileStat=0 AND KeyNdx<>23 THEN\ REM Not fcn or close
		NexToken()
		IF TokenBuf<>"," THEN
			UnDoToken()
		ENDIF
 	ENDIF
 	RETURN	
 ELSE\ REM Must be Path #
 	ANSIFile=0
 	GetPthNum1()
 ENDIF
 RETURN

GetFilePtr 
 IF Target=0 OR FileStat<>0 THEN
	IF TSymName<>"~" THEN
		InitReg0
		LoadReg()
		ErrRet
	ENDIF
	OutBuf="*((long*)&_FilePtr)=_d0;"
	GenCode
 ELSE
	IF DMVector=0 THEN
		PathVar=TSymName
	ELSE
		VecSymNam()
		PathVar=TSymName
	ENDIF
 ENDIF
 RETURN

GetPthNum1
 GetExp()
 ErrRet
 ProcExp()
 ErrRet
 GetPthNum2()
 RETURN

GetPthNum2
 ClassOp()
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 IF Target=0 THEN
	IF TSymName<>"~" THEN
		InitReg0
		LoadReg()
		ErrRet
	ENDIF
	OutBuf="_d0=_d0&0xff;"
	GenCode
	IF PrtPthFlg=0 THEN
		OutBuf="_IOPthNum=_d0;"
	ELSE
		OutBuf="_PrtPthNum=_d0;"
	ENDIF
	GenCode
 ELSE
	IF DMConst=$ff THEN
		ErrNo=ErrIVExp
		RETURN
	ENDIF
	IF DMVector=0 THEN
		PathVar=TSymName
	ELSE
		VecSymNam()
		PathVar=TSymName
	ENDIF
 ENDIF
* The following code makes the "," following the device name
* acceptable but not mandatory
 IF FileStat=0 AND KeyNdx<>23 THEN\ REM Not fcn or close
	NexToken()
	IF TokenBuf<>"," THEN
		UnDoToken()
	ENDIF
 ENDIF
 RETURN
 
GetPthNam
 Expr()
 ErrRet
 IF TDataType<>STRING THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 OutBuf="_MovStr(&_IOBufVec,&"+TSymName+");"
 GenCode
 RETURN

BufRW
 BufRWFlg=$ff
 DiskIO=$ff
 GetPthNum()
 ErrRet
 GetIntOp()\REM Get Address
 ErrRet
 OutBuf="*((long*)&_XferAddr)=_d0;"
 GenCode
 CommaRet
 GetIntOp()\REM Get # of bytes
 ErrRet
 OutBuf="XferCount=_d0;"
 GenCode
 RETURN
 
GetPut
 DiskIO=$ff
 GetPthNum()
 ErrRet
 Expr()
 ErrRet
 IF DMConst=$ff THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 GetBase()
 OutBuf="_XferAddr=(char *)_a0;"
 GenCode
 OutBuf="XferCount="+STR$(SymTemp.DataSize)+";"
 GenCode
 RETURN
 
ReadWrite
 DiskIO=$ff
 GetPthNum()
 ErrRet
 Expr()
 ErrRet
 IF TDataType<>STRING THEN
	ErrNo=ErrTypMis
 ENDIF
 GetBase()
 RETURN
 
GetRegPrm
 SymTemp=SymTable(ExpTable(ExpNdx))
 GetRP1()
 RETURN

GetRP1
 TDataType=SymTemp.DataType
 TDataMod=SymTemp.DataMod
 IF LAND(SymTemp.DataMod,AddrBit)<>AddrBit THEN
	IF TDataType<1 OR TDataType>5 THEN
		ErrNo=ErrIVExp
		RETURN
	ENDIF
 ENDIF
 GetDtaTyp()
 IF FloatFlag=0 THEN
	Reg0Name="_d0"
	Reg1Name="_d1"
 ELSE
	Reg0Name="_d0f"
	Reg1Name="_d1f"
 ENDIF
 IF D0Loaded=0 THEN
	LdRegName=Reg0Name
 ELSE
	LdRegName=Reg1Name
 ENDIF
 RETURN

LoadReg
 IF Promote=$ff OR Demote=$ff THEN
	SymSrch()
	SymTemp=SymTable(SymNdx)
	GetRP1()
 ELSE
	GetRegPrm()
 ENDIF
 ErrRet
 IF LAND(ConstBit,SymTemp.DataMod)=ConstBit THEN
	IF TDataType=BOOLEAN THEN
                OutBuf=LdRegName+"="+STR$(SymTemp.Detail)+";"
		GenCode
	ELSE
                OutBuf=LdRegName+"="+SymTemp.SymName+";"
		GenCode
	ENDIF
 ELSE
	IF LAND(VectorBit,SymTemp.DataMod)=0 THEN
		IF TDataMod&AddrOrFile=0 THEN
                        OutBuf=LdRegName+"="+SymTemp.SymName+";"
		ELSE
                        OutBuf=LdRegName+"=(long)"+SymTemp.SymName+";"
		ENDIF
		GenCode
	ELSE
                OutBuf=LdRegName+"=*(("+_DataType+"*)"+SymTemp.SymName+"._Ptr);"
		GenCode
	ENDIF
 ENDIF
 D0Loaded=$ff
 RETURN
 
StoreD0
 SymTemp.SymName=Op1Name
 SymSrch()
 SymTemp=SymTable(SymNdx)
 GetRP1()
 IF LAND(VectorBit,SymTemp.DataMod)=0 THEN
	IF TDataMod&AddrBit=0 THEN
                OutBuf=SymTemp.SymName+"="+Reg0Name+";"
	ELSE
                OutBuf="*((long*)&"+SymTemp.SymName+")="+Reg0Name+";"
	ENDIF
 ELSE
        OutBuf="*(("+_DataType+"*)"+SymTemp.SymName+"._Ptr)="+Reg0Name+";"
 ENDIF
 GenCode
 RETURN

GetIntTmp
 OpClass=INTClass
 GetTmp()
 RETURN
 
GetTmp
 IF TmpUse=NumTemps THEN
	ErrNo=ErrTmpUse
	RETURN
 ENDIF
 INC TmpUse
 IF TmpUse>TmpMax THEN
	TmpMax=TmpUse
	VarBlank()
	Comment="Temporary Variable"
	BldComment()
	GenVar
	OutBuf="long _Tmp"+STR$(TmpUse)+";"
	GenVar
	VarBlank()
 ENDIF
 SymTemp.SymName="_Tmp"+STR$(TmpUse)
 SymSrch()
 IF OpClass=INTClass THEN
	SymTable(SymNdx).DataType=LONG
 ELSE
	SymTable(SymNdx).DataType=TDataType
 ENDIF
 SymTable(SymNdx).DataSize=TDataSize
 RETURN

GetFltTmp
 IF FTmpUse=NumTemps THEN
	ErrNo=ErrTmpUse
	RETURN
 ENDIF
 INC FTmpUse
 IF FTmpUse>FTmpMax THEN
	FTmpMax=FTmpUse
	VarBlank()
	Comment="Temporary Floating Point Variable"
	BldComment()
	GenVar
	OutBuf="double _FTmp"+STR$(FTmpUse)+";"
	GenVar
	VarBlank()
 ENDIF
 SymTemp.SymName="_FTmp"+STR$(FTmpUse)
 SymSrch()
 RETURN
 
GetStrVec
 INC StrTmpUse
 IF StrTmpUse>StrTmpMax THEN
	StrTmpMax=StrTmpUse
	VarBlank()
	Comment="Temporary String Variable"
	BldComment()
	GenVar
	OutBuf="unsigned char _StrTmp"+STR$(StrTmpUse)+"[22];"
	GenVar
	VarBlank()
 ENDIF
 ReqTmpVec()
 ErrRet
 SymTable(SymNdx).DataMod=TmpVec
 SymTable(SymNdx).DataType=STRING
 SymTable(SymNdx).Detail=22
 TempInt=22
 SymTable(SymNdx).DataAddr=0
 SymTable(SymNdx).DataSize=22
 SymTable(SymNdx).MultiPtr=0
 OutBuf="_a0=_StrTmp"+STR$(StrTmpUse)+";"
 GenCode
 SetStrVec()
 RETURN

GetChrVec
 INC ChrTmpUse
 IF ChrTmpUse>ChrTmpMax THEN
	ChrTmpMax=ChrTmpUse
	VarBlank()
	Comment="Temporary Character Variable"
	BldComment()
	GenVar
	OutBuf="char _ChrTmp"+STR$(ChrTmpUse)+";"
	GenVar
	VarBlank()
 ENDIF
 ReqTmpVec()
 ErrRet
 SymTable(SymNdx).DataMod=TmpVec
 SymTable(SymNdx).DataType=STRING
 SymTable(SymNdx).Detail=1
 TempInt=1
 SymTable(SymNdx).DataAddr=0
 SymTable(SymNdx).DataSize=1
 OutBuf="_a0=&_ChrTmp"+STR$(ChrTmpUse)+";"
 GenCode
 SetStrVec()
 RETURN

SetStrVec
 OutBuf=SymTemp.SymName+"._Ptr=_a0;"
 GenCode
 OutBuf=SymTemp.SymName+"._Len="+STR$(TempInt)+";"
 GenCode
 OutBuf=SymTemp.SymName+"._Lnk=0;"
 GenCode
 RETURN
 
ReqTmpVec
 IF TmpVecUse=NumTemps THEN
	ErrNo=ErrTmpUse
	RETURN
 ENDIF
 INC TmpVecUse
 IF TmpVecUse>TmpVecMax THEN
	TmpVecMax=TmpVecUse
	MakTmpVec()
 ENDIF
 SymTemp.SymName="_TmpVec"+STR$(TmpVecUse)
 SymSrch()
 SymNdxSaf=SymNdx
 RETURN

GetTmpVec
 ReqTmpVec()
 ErrRet
 SymTable(SymNdx).DataMod=TmpVec
 SymTable(SymNdx).DataMod=LOR(TDataMod,SymTable(SymNdx).DataMod)
 SymTable(SymNdx).DataType=TDataType
 SymTable(SymNdx).Detail=TDetail
 SymTable(SymNdx).DataAddr=TDataAddr
 SymTable(SymNdx).DataSize=TDataSize
 SymTable(SymNdx).MultiPtr=TMultiPtr
 RETURN

MakTmpVec
 VarBlank()
 Comment="Temporary Vector"
 BldComment()
 GenVar
 OutBuf="_vector _TmpVec"+STR$(TmpVecUse)+";"
 GenVar
 VarBlank()
 RETURN

SetTmpVec
 GetTmpVec()
 ErrRet
 ExpTable(ExpNdx)=SymNdx
 OutBuf=SymTable(SymNdx).SymName+"="+TSymName+";"
 GenCode
 ClassOp()
 RETURN
 
Vectorize
 GetTmpVec()
 ErrRet
 GetBase()
 ExpTable(ExpNdx)=SymNdx
 OutBuf=SymTemp.SymName+"._Ptr=_a0;"
 GenCode
 RETURN
 
GetLopVec
 LopVarNdx=0
GetLV1
 INC LopVarNdx
 IF LopVarNdx=41 THEN
	ErrNo=ErrTmpUse
	RETURN
 ENDIF
 IF LoopVars(LopVarNdx)=CS(CSP).LoopName THEN GetLV2
 IF LoopVars(LopVarNdx)<>"%" THEN GetLV1
 LoopVars(LopVarNdx)=CS(CSP).LoopName
 VarBlank()
 Comment="For Loop Vector"
 BldComment()
 GenVar
 OutBuf="_loopvec _LopVec"+STR$(LopVarNdx)+";"
 GenVar
 VarBlank()
GetLV2
 RETURN

And
 IF TDataType=FLOAT THEN
	ErrNo=ErrTypMis
 ENDIF
 OutBuf="_d0=_d0&_d1;"
 GenCode
 RETURN

Or
 IF TDataType=FLOAT THEN
	ErrNo=ErrTypMis
 ENDIF
 OutBuf="_d0=_d0|_d1;"
 GenCode
 RETURN
 
Add
 OutBuf=Reg0Name+"="+Reg0Name+"+"+Reg1Name+";"
 GenCode
 RETURN
 
Sub
 OutBuf=Reg0Name+"="+Reg0Name+"-"+Reg1Name+";"
 GenCode
 RETURN
 
Mul
 OutBuf=Reg0Name+"="+Reg0Name+"*"+Reg1Name+";"
 GenCode
 RETURN
 
Div
 OutBuf=Reg0Name+"="+Reg0Name+"/"+Reg1Name+";"
 GenCode
 RETURN

CmpNum
 InitReg0
 Promote=$ff
 SymTemp.SymName=Op1Name
 LoadReg()
 SymTemp.SymName=Op2Name
 LoadReg()
 OutBuf="if ("+Reg0Name+" "+SymType+" "+Reg1Name+") _d0=0xff;"
 GenCode
 OutBuf="else _d0=0;"
 GenCode
 RETURN
 
CmpString
 OutBuf="_d0=_CmpStr(&"+Op1Name+",&"+Op2Name+");"
 GenCode
 OutBuf="if (_d0 "+SymType+" 1) _d0=0xff;"
 GenCode
 OutBuf="else _d0=0;"
 GenCode
 RETURN
 
CmpBool
 Promote=$ff
 SymTemp.SymName=Op1Name
 LoadReg()
 SymTemp.SymName=Op2Name
 LoadReg()
 OutBuf="if (_d0 "+SymType+" _d1) _d0=0xff;"
 GenCode
 OutBuf="else _d0=0;"
 GenCode
 RETURN

UnBlkFcn
 TempStr=OutBuf
 OutBuf=FcnHeader+")"
 GenFcn
 For Ctr1=1 TO FcnBlkNdx
	OutBuf=FcnBlk(Ctr1)
	GenFcn
 NEXT Ctr1
 OutBuf=""
 GenFcn
 ParmFlag=0
 IF ParamCount<>10 AND ParamCount<>ParmCtr THEN\ REM declaration <> # of parms
 	ErrNo=ErrFcn
 	RETURN
 ENDIF
 FcnVarFlg=$ff
 FcnRegs()
 OutBuf=TempStr
 RETURN

FcnRegs
 OutBuf="{"
 GenFcn
 OutBuf=""
 GenFcn
 Comment="Pseudo Registers"
 BldComment()
 GenFcn
 OutBuf="register long _d0;"
 GenFcn
 OutBuf="register long _d1;"
 GenFcn
 OutBuf="double _d0f;"
 GenFcn
 OutBuf="double _d1f;"
 GenFcn
 OutBuf="void *_a0;"
 GenFcn
 OutBuf=""
 GenFcn
 RETURN

NexToken
 ExpEnd=0
 TokenLen=0
 TokenType=0
 QuoteFlg=0
 NextByte=""
 TokenBuf=""
 TokenSaf=""
NexToken1
 INC SrcNdx
 IF SrcNdx>LEN(SrcLine) THEN NexToken5
 TempByte=MID$(SrcLine,SrcNdx,1)
 NextByte=MID$(SrcLine,SrcNdx+1,1)
 AsciiByte=ASC(TempByte)
 IF AsciiByte=$22 AND EscSeq=0 THEN
	IF QuoteFlg=0 AND TokenLen<>0 THEN NexToken5
	NexToken3()
	IF QuoteFlg=1 THEN
		TokenType=TTypQuote
		GOTO NexToken6
	ELSE
		QuoteFlg=1
		EscSeq=0
		GOTO NexToken1
	ENDIF
 ENDIF
 IF QuoteFlg=1 THEN
	IF EscSeq=$ff THEN
		EscSeq=0
	ELSE
		IF AsciiByte=$5c THEN
			EscSeq=$ff
		ENDIF
	ENDIF
	NexToken3()
	GOTO NexToken1
 ENDIF
 IF TempByte="." THEN
	IF TokenType=TTypInt THEN
		TokenType=TTypFloat
		NexToken3()
		GOTO NexToken1
	ENDIF
	IF TokenLen=0 THEN
		IF NextByte>="0" AND NextByte<="9" THEN
			TokenType=TTypFloat
			NexToken3()
			GOTO NexToken1
		ENDIF
	ENDIF
 ENDIF
 IF TempByte=CHR$($5c) OR TempByte="'" THEN NexToken5
 IF TempByte="<" OR TempByte=">" OR TempByte="=" THEN
	IF TokenLen<>0 THEN NexToken5
	TokenType=TTypRelOp
	NexToken3()
	IF TempByte="=" THEN
		GOTO NexToken6
	ENDIF
	IF NextByte=">" OR NextByte="=" THEN
		INC SrcNdx
		TempByte=MID$(SrcLine,SrcNdx,1)
		NexToken3()
	ENDIF
	GOTO NexToken6
 ENDIF
 IF AsciiByte=$20 OR AsciiByte=$09 THEN
	IF TokenLen<>0 THEN
		DEC SrcNdx
		NextByte=" "
		ExpEnd=$ff
		GOTO NexTokDone
	ENDIF
	GOTO NexToken1
 ENDIF
 IF DimFlag=0 THEN
	IF TempByte="(" OR TempByte=")" THEN
		IF TokenLen<>0 THEN NexToken5
		NexToken3()
		TokenType=TTypParen
		GOTO NexToken6
	ENDIF
 ENDIF
 IF DimFlag=0 OR TempByte<>"," THEN\ REM  special cond for multi-dim array
	IF TempByte="," OR TempByte=";" OR TempByte=":" OR TempByte="." THEN
		IF TokenLen<>0 THEN NexToken5
		NexToken3()
		TokenType=TTypPunct
		GOTO NexToken6
	ENDIF
 ENDIF
 IF TempByte="+" OR TempByte="-" OR TempByte="*" OR TempByte="/"  OR TempByte="&" OR TempByte="|" THEN
	IF TokenLen<>0 THEN NexToken5
	NexToken3()
	TokenType=TTypMath
	GOTO NexToken6
 ENDIF
 IF DimFlag=$ff THEN NexToken2
 IF TempByte="$" OR TempByte="_" OR TempByte="@" THEN NexToken2
 IF TempByte>="0" AND TempByte<="9" THEN NexToken2
 IF TempByte>="A" AND TempByte<="Z" THEN NexToken2
 IF TempByte>="a" AND TempByte<="z" THEN NexToken2
 IF TokenLen<>0 THEN NexToken5
 NexToken3()
 TokenType=TTypMisc
 GOTO NexToken6
NexToken2
 NexToken3()
 GOTO NexToken1
NexToken5
 DEC SrcNdx
 NextByte=MID$(SrcLine,SrcNdx+1,1)
NexToken6
 IF NextByte=" " OR ASC(NextByte)=9 OR NextByte=":" OR NextByte=";" OR NextByte=CHR$($5c) THEN
	ExpEnd=$ff
 ENDIF
 IF NextByte="<" OR NextByte=">" OR NextByte="=" OR NextByte="" OR NextByte="'" THEN
	ExpEnd=$ff
 ENDIF
NexTokDone
 IF TokenType=TTypInt AND RIGHT$(TokenBuf,1)="h" THEN\ REM Intel hex->Motorola
 	IF LEFT$(TokenBuf,1)<>"0" THEN
 		TokenSaf="$"+LEFT$(TokenBuf,LEN(TokenBuf)-1)
 	ELSE
 		TokenSaf="$"+MID$(TokenBuf,2,LEN(TokenBuf)-2)\ REM removes leading 0
 	ENDIF
 	TokenBuf=TokenSaf
 	TokenType=TTypHex
 ENDIF
 IF TokenType=TTypInt AND MID$(TokenBuf,2,1)="x" THEN\ REM C hex->Motorala
 	TokenSaf="$"+MID$(TokenBuf,3,LEN(TokenBuf)-2)
 	TokenBuf=TokenSaf
 	TokenType=TTypHex
 ENDIF
 RETURN

NexToken3
 INC TokenLen
 TokenSaf=TokenSaf+TempByte
 IF TempByte>="A" AND TempByte<="Z" THEN
	AsciiByte=LOR(AsciiByte,$20)
	TempByte=CHR$(AsciiByte)
 ENDIF
 TokenBuf=TokenBuf+TempByte
 IF TokenLen=1 THEN
	IF TokenBuf="$" THEN
		TokenType=TTypHex
	ENDIF
	IF TokenBuf>="0" AND TokenBuf<="9" THEN
		TokenType=TTypInt
	ENDIF
	IF TokenBuf>="a" AND TokenBuf<="z" OR TokenBuf="_" THEN
		TokenType=TTypSym
	ENDIF
 ENDIF
 RETURN

UnDoToken
 SrcNdx=SrcNdx-TokenLen
 NextByte=""
 RETURN

MacToken
 TokenLen=0
 TokenSaf=""
MacToken1
 INC SrcNdx
 TempByte=MID$(SrcLine,SrcNdx,1)
 AsciiByte=ASC(TempByte)
 IF AsciiByte=NewLine OR AsciiByte=0 THEN
	DEC SrcNdx
	RETURN
 ENDIF
 IF AsciiByte=$2c THEN\ REM  comma
	IF TokenLen=0 THEN
		TokenSaf=TempByte
		TokenLen=1
	ELSE
		DEC SrcNdx
	ENDIF
	RETURN
 ENDIF
 TokenSaf=TokenSaf+TempByte
 INC TokenLen
 GOTO MacToken1
 RETURN\ REM  sbrtn delimiter only
 
ValidSym
 SymbolOK=0
 IF LEN(RootSym)>28 THEN
	RETURN
 ENDIF
 IF LNFlag=0 THEN 5110
 IF LEN(RootSym)>5 THEN 5110
 TempByte=MID$(RootSym,1,1)
 IF TempByte<"0" OR TempByte>"9" THEN 5110
 LabNdx=1
lbl5102 INC LabNdx
 IF LabNdx>LEN(RootSym) THEN
	SymbolSaf="_LN"
	SymbolSaf=SymbolSaf+RootSym
	SymbolOK=$ff
	RETURN
 ENDIF
 TempByte=MID$(RootSym,LabNdx,1)
 IF TempByte<"0" OR TempByte>"9" THEN
	RETURN
 ENDIF
 GOTO lbl5102
5110 LabNdx=1
 TempByte=MID$(RootSym,1,1)
 IF TempByte>="A" AND TempByte<="Z" THEN 5112
 IF TempByte>="a" AND TempByte<="z" THEN 5112
 IF TempByte="_" THEN 5112
 RET
5112 INC LabNdx
 IF LabNdx>LEN(RootSym) THEN
	SymbolOK=$ff
	SymbolSaf=RootSym
	RETURN
 ENDIF
 TempByte=MID$(RootSym,LabNdx,1)
 IF TempByte>="0" AND TempByte<="9" THEN 5112
 IF TempByte>="A" AND TempByte<="Z" THEN 5112
 IF TempByte>="a" AND TempByte<="z" THEN 5112
 IF TempByte="_" THEN 5112
 IF TempByte="$" AND LabNdx=LEN(RootSym) THEN 5112
 RETURN
 
ValidInt
 IntOK=0
 IF LEN(TokenBuf)>10 THEN
	RETURN
 ENDIF
 ValidNdx=0
5122 INC ValidNdx
 IF ValidNdx>LEN(TokenBuf) THEN
	IntOK=$ff
	RETURN
 ENDIF
 TempByte=MID$(TokenBuf,ValidNdx,1)
 IF TempByte>="0" AND TempByte<="9" THEN 5122
 RETURN
 
ValidHex
 HexOK=0
 IF LEN(TokenBuf)>9 THEN
	RETURN
 ENDIF
 ValidNdx=1
5142 INC ValidNdx
 IF ValidNdx>LEN(TokenBuf) THEN
	HexOK=$ff
	RETURN
 ENDIF
 TempByte=MID$(TokenBuf,ValidNdx,1)
 IF TempByte>="0" AND TempByte<="9" THEN 5142
 IF TempByte>="a" AND TempByte<="f" THEN 5142
 RETURN

ValidFlt
 OneDot=0
 FloatOK=0
 IF LEN(TokenBuf)>21 THEN
	RETURN
 ENDIF
 ValidNdx=0
ValidFlt1
 INC ValidNdx
 IF ValidNdx>LEN(TokenBuf) THEN
	FloatOK=$ff
	RETURN
 ENDIF
 TempByte=MID$(TokenBuf,ValidNdx,1)
 IF TempByte>="0" AND TempByte<="9" THEN ValidFlt1
 IF TempByte="." THEN
	IF OneDot=0 THEN
		OneDot=$ff
		GOTO ValidFlt1
	ENDIF
 ENDIF
 RETURN
 
SymSrch
 SymFull=0
 SymFound=0
 SymNdx=0
 TempName=SymTemp.SymName
 IF TempName="ERR" THEN
	SymTemp.SymName="errno"
 ENDIF
 IF LEFT$(TempName,1)="$" THEN\ Make Intel style hex
	LEFT$(TempName,1)="x"
	SymTemp.SymName="0"+TempName
 ENDIF
 IF RIGHT$(TempName,1)="$" THEN\ Covert string name to legal c name
	TempName=LEFT$(TempName,LEN(TempName)-1)
	SymTemp.SymName=TempName+"_Str"
 ENDIF
SymSrch1
 INC SymNdx
 IF SymNdx>LastMulti THEN
	SymFull=$ff
	RETURN
 ENDIF
 IF SymTable(SymNdx).SymName="%" THEN
	RETURN
 ENDIF
 IF SymTable(SymNdx).SymName<>SymTemp.SymName THEN SymSrch1
 SymFound=$ff
 RETURN

SymSearch
 SymSrch()
 IF SymFound=$ff THEN
	RETURN
 ENDIF
 SymTemp.SymName=TokenSaf
 SymSrch()
 RETURN
 
SymInsert
 IF SymFull=$ff THEN
	ErrNo=ErrSymFul
	RETURN
 ENDIF
 SymTable(SymNdx)=SymTemp
 LastSym=SymNdx
 RETURN

MultiInsert
 MultiNdx=SymTabSiz+1
 SymFull=0
MultiInsert1
 DEC MultiNdx 
 IF MultiNdx<=LastSym THEN
	ErrNo=ErrSymFul
	RETURN
 ENDIF
 IF SymTable(MultiNdx).SymName<>"%" THEN MultiInsert1
 SymTable(MultiNdx)=SymTemp
 LastMulti=MultiNdx
 RETURN

KeyLook
 KeyNdx=0
 RESTORE KeyTable
 LookUp()
 RETURN

SOLook
 KeyNdx=0
 RESTORE SOTable
 LookUp()
 RETURN
 
FDLook
 KeyNdx=0
 RESTORE FDTable
 LookUp()
 RETURN

LookUp
LookUp1
 READ KeyWord
 INC KeyNdx
 IF KeyWord="%" THEN
	KeyNdx=0
	RETURN
 ENDIF
 IF KeyWord=TokenBuf THEN
	RETURN
 ENDIF
 GOTO LookUp1
 RETURN\ REM  sbrtn delimiter only
 
CmpOps
 Op1Class=0
 AndOrFlag=$ff
 CompFlag=$ff
 OutBuf="_True=0;"
 GenCode
CmpOps1
 Promote=0
 Demote=0
 TmpUse=0
 TmpVecUse=0
 FTmpUse=0
 ChrTmpUse=0
 StrTmpUse=0
 TypeFlag=0
 TDataMod=0
 FileStat=0
 ClrDatTyp()
 Expr()
 ErrRet
 Op1Name=TSymName
 Op1Class=OpClass
 Op1Type=TDataType
 Op1Mod=TDataMod
 Op1Detail=TDetail
 IF TDataType=BOOLEAN THEN
	IF NextByte="=" OR NextByte="<" THEN
		NexToken()
		IF TokenBuf="=" THEN
			SymType="=="
		ELSE
			SymType="!="
		ENDIF
		IF TokenBuf<>"=" AND TokenBuf<>"<>" THEN
			ErrNo=ErrIVExp
			RETURN
		ENDIF
		GOTO CmpOps2
	ELSE
		Op2Name="true"
		Op2Class=BOOLClass
		Op2Type=1
		Op2Mod=$04
		Op2Detail=1
		SymType="=="
		GOTO CmpOps3
	ENDIF
 ENDIF
 NexToken()
 IF TokenType<>1 THEN
	ErrNo=ErrIVExp
	RETURN
 ENDIF
 SymType=""
 IF TokenBuf="=" THEN
	SymType="=="
 ENDIF
 IF TokenBuf="<" THEN
	SymType="<"
 ENDIF
 IF TokenBuf=">" THEN
	SymType=">"
 ENDIF
 IF TokenBuf="<=" THEN
	SymType="<="
 ENDIF
 IF TokenBuf=">=" THEN
	SymType=">="
 ENDIF
 IF TokenBuf="<>" THEN
	SymType="!="
 ENDIF
 IF SymType="" THEN
	ErrNo=ErrIVExp
 RETURN
 ENDIF
CmpOps2
 Expr()
 ErrRet
 Op2Name=TSymName
 Op2Class=OpClass
 Op2Type=TDataType
 Op2Mod=TDataMod
 Op2Detail=TDetail
 IF Op1Class=INTClass OR Op1Class=FLTClass THEN
	CmpNum()
	ErrRet
 ENDIF
 IF Op1Class<>Op2Class THEN
	EXITIF Op1Class=INTClass AND Op2Class=FLTClass
	EXITIF Op1Class=FLTClass AND Op2Class=INTClass
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 IF Op1Class=STRClass THEN
	CmpString()
 ENDIF
CmpOps3
 IF Op1Class=BOOLClass THEN
	CmpBool()
	ErrRet
 ENDIF
 IF Op1Class=0 OR Op1Class=ARRClass OR Op1Class=CPXClass THEN
	ErrNo=ErrIVExp
	RETURN
 ENDIF
 IF AndOrFlag=0 THEN
	OutBuf="_True=_True&_d0;"
 ELSE
	OutBuf="_True=_True|_d0;"
 ENDIF
 GenCode
 NexToken()
 IF TokenBuf="and" THEN
	AndOrFlag=0
	GOTO CmpOps1
 ENDIF
 IF TokenBuf="or" THEN
	AndOrFlag=$ff
	GOTO CmpOps1
 ENDIF
 RETURN
 
ClrDatTyp
 DTCompVar=0
 DTBoolean=0
 DTByte=0
 DTShort=0
 DTLong=0
 DTFloat=0
 DTString=0
 DTLabel=0
 DTMacro=0
 DTOper=0
 DTFcn=0
 DTProc=0
 DTStruct=0
 DTVoid=0
 DTComplex=0
 DTBuffer=0
 DTForm=0
 DTObject=0
 DMData=0
 DMTemp=0
 DMVector=0
 DMMember=0
 DMMulti=0
 DMConst=0
 DMAddr=0
 DMArray=0
 RETURN
 
GtRootSym
 SubscrErr=0
 RootSym=""
 SubCtr=0
 Subscript(1)=""
 Subscript(2)=""
 Subscript(3)=""
 SubValue(1)=1
 SubValue(2)=1
 SubValue(3)=1
 LabNdx=0
GtRtSym1
 INC LabNdx
 IF LabNdx>LEN(TokenSaf) THEN
	RETURN
 ENDIF
 TempByte=MID$(TokenSaf,LabNdx,1)
 IF TempByte<>"(" THEN
	RootSym=RootSym+TempByte
	GOTO GtRtSym1
 ENDIF
 IF RIGHT$(TokenSaf,1)<>")" THEN
	SubscrErr=$ff
	RETURN
 ENDIF
GtRtSym2
 INC SubCtr
 IF SubCtr>3 THEN
	ErrNo=ErrSyntax
	RETURN
 ENDIF
GtRtSym3
 INC LabNdx
 TempByte=MID$(TokenSaf,LabNdx,1)
 IF TempByte=")" OR TempByte="," THEN
	SymNdxSaf=SymNdx
	TempStr=SymTemp.SymName
	IF LEFT$(Subscript(SubCtr),1)>="0" AND LEFT$(Subscript(SubCtr),1)<="9" THEN
		SubValue(SubCtr)=VAL(Subscript(SubCtr))
	ELSE
		SymTemp.SymName=Subscript(SubCtr)
		SymSrch()
		IF SymFound=$ff AND SymTable(SymNdx).DataType=COMPVAR OR SymTable(SymNdx).DataType=MACRO THEN
			SubValue(SubCtr)=SymTable(SymNdx).Detail
		ELSE
			ErrNo=ErrUDSym
			RETURN
		ENDIF
	ENDIF
	SymNdx=SymNdxSaf
	SymTemp.SymName=TempStr
	IF TempByte="," THEN GtRtSym2
	RETURN
 ENDIF
 Subscript(SubCtr)=Subscript(SubCtr)+TempByte
 GOTO GtRtSym3
 RETURN\ REM  sbrtn delimiter only

F0
* EOF(#FileNum)
 INC FcnLabNum
 FileStat=$ff
 ClassOp()
 IF TDataMod&FileBit=0 THEN\ REM Path# style
 	GetPthNum2()
 	ErrRet
 	OutBuf="STATUS=lseek(_IOPthNum,0,1);"
 	GenCode
 	OutBuf="if (STATUS == -1) goto _FLbl"+STR$(FcnLabNum)+";"
 	GenCode
 	OpClass=BOOLClass
 	TDataType=BOOLEAN
 	GetTmp()
 	ErrRet
 	OutBuf=SymTemp.SymName+"=0;"
 	GenCode
 	OutBuf="*((long*)&_XferAddr)=lseek(_IOPthNum,0,2);"
 	GenCode
 	IF Machine<>1 AND Machine<>4 THEN
		OutBuf="if (STATUS == (long)_XferAddr) "+SymTemp.SymName+"=1;"
		GenCode
 	ELSE
		OutBuf="if (STATUS == (long)_XferAddr) "+SymTemp.SymName+"=1;"
		GenCode
		OutBuf="if (STATUS == (long)_XferAddr-1) "
		GenCode
		OutBuf="{"
		GenCode
		OutBuf="lseek(_IOPthNum,-1,1);"
		GenCode
		OutBuf="XferCount=read(_IOPthNum,&_TestByte,1);"
		GenCode
		OutBuf="if (XferCount == 0) "+SymTemp.SymName+"=1;"
		GenCode
		OutBuf="else lseek(_IOPthNum,-1,1);"
		GenCode
		OutBuf="}"
		GenCode
 	ENDIF
 	OutBuf="STATUS=lseek(_IOPthNum,STATUS,0);"
 	GenCode
 	OutBuf="_FLbl"+STR$(FcnLabNum)+":;"
 	GenCode
 	CallErr()
ELSE
 	GetFilePtr()
 	ErrRet
 	OutBuf="STATUS=feof(_FilePtr);"
 	GenCode
 	IF StatFlag=0 THEN
 		OutBuf="if (ferror(_FilePtr) != 0) longjmp(_ebuf,1);"
 		GenCode
 	ENDIF
 	OutBuf="if(STATUS) STATUS = 1;"
 	GenCode
 	OpClass=BOOLClass
 	TDataType=BOOLEAN
 	GetTmp()
 	ErrRet
 	OutBuf=SymTemp.SymName+"=STATUS;"
 	GenCode
 ENDIF
 ExpTable(ExpNdx)=SymNdx
 RETURN
 
F1
* LEN(String)
 ClassOp()
 IF TDataType<>STRING OR DMArray=$ff THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 GetIntTmp()
 ErrRet
 OutBuf=SymTemp.SymName+"=_StrLen(&"+TSymName+");"
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN
 
F2
* STR$(Number)
 ClassOp()
 LoadReg()
 ErrRet
 IF OpClass<>INTClass AND OpClass<>FLTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 IF OpClass=INTClass THEN
	IF FloatFlag<>0 THEN
		OutBuf="_d0=_d0f;"
		GenCode	
	ENDIF
	OutBuf="_LtoA(_d0);"
 ELSE
	OutBuf="_DtoA(_d0f);"
 ENDIF
 GenCode
 NumToA()
 RETURN

NumToA
 GetStrVec()
 ErrRet
 OutBuf="_MovStr(&"+SymTemp.SymName+",&_CBuf1Vec);"
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN
 
F3
* VAL(String)
 ClassOp()
 IF TDataType<>STRING OR DMArray=$ff THEN
	ErrNo=ErrTypMis\ REM  wrong type
	RETURN
 ENDIF
 IF Op1Class=FLTClass AND FcnCode=3 THEN
	FcnCode=23
 ENDIF
 OutBuf="_ClrConv();"
 GenCode
 OutBuf="_MovStr(&_CBufVec,&"+TSymName+");"
 GenCode
 IF FcnCode=23 THEN
	OutBuf="_d0f=_AtoD();"
 ELSE
	OutBuf="_d0=_AtoL();"
 ENDIF
 GenCode
 IF FcnCode=23 THEN
 	INC FloatFlag
	OpClass=FLTClass
	TDataType=FLOAT
	GetFltTmp()
	ErrRet
 ELSE
	OpClass=INTClass
	GetIntTmp()
	ErrRet
 ENDIF
 IF FcnCode=23 THEN
	OutBuf=SymTemp.SymName+"=_d0f;"
 ELSE
	OutBuf=SymTemp.SymName+"=_d0;"
 ENDIF
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN
 
F4
* LAND(Exp1,Exp2)
 ClassOp()
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 IF DMVector=$ff THEN
	VecSymNam()
 ENDIF
 FcnOp1Nam=TSymName
 INC ExpNdx
 ClassOp()
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 IF DMVector=$ff THEN
	VecSymNam()
 ENDIF
 GetIntTmp()
 ErrRet
 IF FcnCode=4 THEN
	OutBuf=SymTemp.SymName+"="+FcnOp1Nam+"&"+TSymName+";"
 ENDIF
 IF FcnCode=6 THEN
	OutBuf=SymTemp.SymName+"="+FcnOp1Nam+"|"+TSymName+";"
 ENDIF
 IF FcnCode=8 THEN
	OutBuf=SymTemp.SymName+"="+FcnOp1Nam+"%"+TSymName+";"
 ENDIF
 IF FcnCode=18 THEN
	OutBuf=SymTemp.SymName+"="+FcnOp1Nam+"^"+TSymName+";"
 ENDIF
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN
 
F5
* MID$(String,Position,Quantity)
 IF FcnCode=5 THEN
	IF ExpRight-ExpLeft<>4 THEN
		ErrNo=ErrFcn
		RETURN
	ENDIF
 ENDIF
 MidLftRt()
 RETURN

MidLftRt
 ClassOp()
 IF TDataType<>STRING THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 IF DMVector=$ff AND DMTemp=0 THEN
	REM need to make a temp vector
	SetTmpVec()
	ErrRet
 ENDIF
 OutBuf="_a0=&"+TSymName+";"
 GenCode
 INC ExpNdx
 ClassOp()
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 IF FcnCode=5 THEN
	LoadReg()\ REM  first arg
	ErrRet
	INC ExpNdx
	ClassOp()
	IF OpClass<>INTClass THEN
		ErrNo=ErrTypMis
		RETURN
	ENDIF
	LoadReg()\ REM  second arg
	ErrRet
 OutBuf="_MidStr((long)_a0,_d0,_d1,"+STR$(Target)+");"\ REM Cast for ansi proto
 GenCode
 ELSE
	LoadReg()\ REM  load d0
	ErrRet
	IF FcnCode=7 THEN
		OutBuf="_MidStr((long)_a0,1,_d0,"+STR$(Target)+");"\ REM Cast for ansi proto
	ELSE
		IF FcnCode=10 THEN
			OutBuf="_RightStr((long)_a0,_d0,"+STR$(Target)+");"\ REM Cast for ansi proto
		ELSE
			OutBuf="_Remnant((long)_a0,_d0,"+STR$(Target)+");"
		ENDIF
	ENDIF
	GenCode
 ENDIF
 ExpNdx=ExpLeft+1
 RETURN
 
F6
* LOR(Exp1,Exp2)
 GOSUB F4
 RETURN
 
F7
* LEFT$(String,Quantity)
 IF ExpRight-ExpLeft<>3 THEN
	ErrNo=ErrFcn
	RETURN
 ENDIF
 MidLftRt()
 RETURN
 
F8
* MOD(Exp1,Exp2)
 GOSUB F4
 RETURN
 
F9
* CHR$(Expr)
 ClassOp()
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 LoadReg()
 ErrRet
 GetChrVec()
 ErrRet
 OutBuf="_ChrTmp"+STR$(ChrTmpUse)+"=_d0;"
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN
 
F10
* RIGHT$(String,Quantity)
 MidLftRt()
 RETURN
 
F11
* ASC(String)
 ClassOp()
 IF TDataType<>STRING OR DMArray=$ff THEN
	ErrNo=ErrFcn
	RETURN
 ENDIF
 GetIntTmp()
 ErrRet
 OutBuf=SymTemp.SymName+"=*((unsigned char*)"+TSymName+"._Ptr);"
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN
 
F12
* NOT(Boolean)
 ClassOp()
 IF TDataType<>1 THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 OpClass=BOOLClass
 TDataType=BOOLEAN
 GetTmp()
 ErrRet
 IF DMVector=$ff THEN
	VecSymNam()
 ENDIF
 OutBuf=SymTemp.SymName+"= (!"+TSymName+");"
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN

F13
* BUFADR(Buffer)
 ClassOp()
 IF TDataType<>BUFFER THEN
	ErrNo=ErrTypMis
 ENDIF
 GetIntTmp()
 ErrRet
 IF FcnCode=13 THEN
	OutBuf=SymTemp.SymName+"=(long)"+TSymName+"._BufPtr;"
 ELSE
	OutBuf=SymTemp.SymName+"="+TSymName+"._BufSiz;"
 ENDIF
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN

F14
* BUFSIZ(Buffer)
 GOSUB F13
 RETURN

F15
* TAB()
 IF PrintFlag=0 THEN
	ErrNo=ErrFcn\ REM  function error
	RETURN
 ENDIF
 TabFlag=$ff
 ClassOp()
 IF OpClass=INTClass THEN
	LoadReg()
	ErrRet
	OutBuf="_PrintTab(_d0);"
	GenCode
	CallErr()
	GenXfrCnt()
 ELSE
	ErrNo=ErrTypMis
 ENDIF
 RETURN

F16
* PEEK
 ClassOp()
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 InitReg0
 LoadReg()
 OutBuf="*((long*)&_Poker)=_d0;"
 GenCode
 GetIntTmp()
 ErrRet
 OutBuf=SymTemp.SymName+"=*_Poker;"
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN

F17
* ADDR(Var)
 ClassOp()
 IF TDataType=OBJECT OR TDataType=FORM THEN
 	OutBuf="(long)_a0=(long)"+TSymName+";"
 	GenCode
 ELSE
 	IF FloatFlag>0 THEN
		DEC FloatFlag
 	ENDIF
 	IF TDataType>STRING AND TDataType<COMPLEX OR DMConst=$ff THEN
		ErrNo=ErrTypMis
		RETURN
 	ENDIF
 	GetBase()
 ENDIF
 GetIntTmp()
 ErrRet
 OutBuf=SymTemp.SymName+"=(long)_a0;"
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN

F18
* LXOR(IntExpr)
 GOSUB F4
 RETURN

F19
* LNOT(IntExpr)
 ClassOp()
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 GetIntTmp()
 ErrRet
 IF DMVector=$ff THEN
	VecSymNam()
 ENDIF
 OutBuf=SymTemp.SymName+"= ~"+TSymName+";"
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN

F20
* INDEX(Pointer,IntExpr)
 ClassOp()
 IF DMAddr=0 THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 FcnOp1Nam=TSymName
 IF DMVector=$ff THEN
	FcnOp1Nam=FcnOp1Nam+"._Ptr"
 ENDIF
 GetVarSiz()
 INC ExpNdx
 ClassOp()
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 GetIntTmp()
 ErrRet
 OutBuf=SymTemp.SymName+"=(long)"+FcnOp1Nam+"+"+TSymName+"*"+STR$(VarSize)+";"
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN

GetVarSiz
 IF TDataType=COMPLEX THEN
	VarSize=SymTable(TDetail).DataSize
 ENDIF
 IF TDataType=STRING THEN
	VarSize=TDetail
 ENDIF
 IF TDataType=BOOLEAN OR TDataType=BYTE THEN
	VarSize=1
 ENDIF
 IF TDataType=SHORT THEN
	VarSize=2
 ENDIF
 IF TDataType=LONG THEN
	VarSize=4
 ENDIF
 IF TDataType=FLOAT THEN
	VarSize=8
 ENDIF
 RETURN

F21
* SIZE(Var)
 ClassOp()
 IF TDataType=OBJECT THEN
 	VarSize=232
 	GOTO SIZE2
 ENDIF
 IF TDataType=FORM THEN
 	VarSize=208
 	GOTO SIZE2
 ENDIF
 IF FloatFlag>0 THEN
	DEC FloatFlag
 ENDIF
 IF TDataType<1 OR TDataType>6 THEN SIZE1
 VarSize=TDataSize
 GOTO SIZE2
SIZE1
 IF TDataType=BUFFER THEN
	VarSize=8
	GOTO SIZE2
 ENDIF
 IF TDataType=COMPLEX THEN
	VarSize=TDataSize
	GOTO SIZE2
 ENDIF
 ErrNo=ErrTypMis
 RET
SIZE2
 GetIntTmp()
 ErrRet
 OutBuf=SymTemp.SymName+"="+STR$(VarSize)+";"
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN

F22
* IVAL(String)
 GOSUB F3
 RETURN

F23
* FVAL(String)
 GOSUB F3
 RETURN

F24
* TRM$
 ClassOp()
 IF TDataType<>STRING THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 IF DMVector=$ff AND DMTemp=0 THEN
	SetTmpVec()
	ErrRet
 ENDIF
 OutBuf="_TrmStr(&"+TSymName+");"
 GenCode
 ExpNdx=ExpLeft+1
 RETURN

F25
* FILSIZ(#FileNum)
 INC FcnLabNum
 FileStat=$ff
 ClassOp()
 IF TDataMod&FileBit=0 THEN\ REM Path# style
 	GetPthNum2()
 	ErrRet
 	OutBuf="STATUS=lseek(_IOPthNum,0,1);"
 	GenCode
 	OutBuf="if (STATUS == -1) goto _FLbl"+STR$(FcnLabNum)+";"
 	GenCode
 	GetIntTmp()
 	ErrRet
 	OutBuf=SymTemp.SymName+"=lseek(_IOPthNum,0,2);"
 	GenCode
 	ExpTable(ExpNdx)=SymNdx
 	OutBuf="STATUS=lseek(_IOPthNum,STATUS,0);"
 	GenCode
 	OutBuf="_FLbl"+STR$(FcnLabNum)+":;"
 	GenCode
 	CallErr()
 ELSE
 	GetFilePtr()
 	ErrRet
 	OutBuf="STATUS=ftell(_FilePtr);"
 	GenCode
 	IF StatFlag=0 THEN
 		OutBuf="if (STATUS == -1) goto _FLbl"+STR$(FcnLabNum)+";"
 		GenCode
 	ENDIF
 	GetIntTmp()
 	ErrRet
 	OutBuf="fseek(_FilePtr,0,SEEK_END);"
 	GenCode
 	OutBuf=SymTemp.SymName+"=ftell(_FilePtr);"
 	GenCode
 	ExpTable(ExpNdx)=SymNdx
 	OutBuf="STATUS=fseek(_FilePtr,STATUS,SEEK_SET);"
 	GenCode
 	OutBuf="_FLbl"+STR$(FcnLabNum)+":;"
 	GenCode 
 ENDIF
 RETURN

F26
* FILPOS(#FileNum)
 FileStat=$ff
 ClassOp()
 IF TDataMod&FileBit=0 THEN\ REM Path# style
 	GetPthNum2()
 	ErrRet
 	OutBuf="STATUS=lseek(_IOPthNum,0,1);"
 	GenCode
 	CallErr()
 	GetIntTmp()
 	ErrRet
 	OutBuf=SymTemp.SymName+"=STATUS;"
 	GenCode
 ELSE
 	GetFilePtr()
 	ErrRet
 	OutBuf="STATUS=ftell(_FilePtr);"
 	GenCode
 	IF StatFlag=0 THEN
 		OutBuf="if (STATUS == -1) goto _FLbl"+STR$(FcnLabNum)+";"
 		GenCode
 	ENDIF
 	GetIntTmp()
 	ErrRet
 	OutBuf=SymTemp.SymName+"=STATUS;"
 	GenCode
 ENDIF
 ExpTable(ExpNdx)=SymNdx
 RETURN

F27
* SQR(Expr)
 ClassOp()
 INC FloatFlag
 IF OpClass<>INTClass AND OpClass<>FLTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 IF FcnCode=27 THEN
	TempStr="sqrt"
 ENDIF
 IF FcnCode=30 THEN
	TempStr="sin"
 ENDIF
 IF FcnCode=31 THEN
	TempStr="cos"
 ENDIF
 IF FcnCode=32 THEN
	TempStr="tan"
 ENDIF
 IF FcnCode=33 THEN
	TempStr="asin"
 ENDIF
 IF FcnCode=34 THEN
	TempStr="acos"
 ENDIF
 IF FcnCode=35 THEN
	TempStr="atan"
 ENDIF
 IF FcnCode=36 THEN
	TempStr="log"
 ENDIF
 IF FcnCode=37 THEN
	TempStr="log10"
 ENDIF
 GetFltTmp()
 ErrRet
 IF DMVector=0 THEN
	OutBuf=SymTemp.SymName+"="+TempStr+"((double)"+TSymName+");"
 ELSE
	OutBuf=SymTemp.SymName+"="+TempStr+"(*((double*)"+TSymName+"._Ptr));"
 ENDIF
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN

F28
* INT(FloatExpr)
 ClassOp()
 IF FloatFlag>0 THEN
	DEC FloatFlag
 ENDIF
 IF OpClass<>FLTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 GetIntTmp()
 ErrRet
 IF DMVector=0 THEN
	OutBuf=SymTemp.SymName+"=(long)"+TSymName+";"
 ELSE
	OutBuf=SymTemp.SymName+"=(long)*((double*)"+TSymName+"._Ptr);"
 ENDIF
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN

F29
* ABS(Expr)
 ClassOp()
 IF OpClass<>INTClass AND OpClass<>FLTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 IF DMVector=$ff THEN
	VecSymNam()
 ENDIF
 IF OpClass=INTClass THEN
	GetTmp()
	ErrRet
	OutBuf=SymTemp.SymName+"=abs("+TSymName+");"
	GenCode
 ELSE
	GetFltTmp()
	ErrRet
	OutBuf=SymTemp.SymName+"=fabs("+TSymName+");"
	GenCode
 ENDIF
 ExpTable(ExpNdx)=SymNdx
 RETURN

F30
* SIN(Expr)
 GOSUB F27
 RETURN

F31
* COS(Expr)
 GOSUB F27
 RETURN

F32
* TAN(Expr)
 GOSUB F27
 RETURN

F33
* ASN(Expr)
 GOSUB F27
 RETURN

F34
* ACS(Expr)
 GOSUB F27
 RETURN

F35
* ATN(Expr)
 GOSUB F27
 RETURN

F36
* LOG(Expr)
 GOSUB F27
 RETURN

F37
* LOG10(Expr)
 RETURN

F38
* GETMENU(MenuName)
 REM WinCode removed
 RETURN

F39
* GETFILE()
 REM WinCode removed
 RETURN

F40
* THOUR()
 DateTime()
 RETURN

F41
* TMIN()
 DateTime()
 RETURN

F42
* TSEC()
 DateTime()
 RETURN

F43
* TYEAR()
 DateTime()
 RETURN

F44
* TMON()
 DateTime()
 RETURN

F45
* TDAT()
 DateTime()
 RETURN

F46
* TDAY()
 DateTime()
 RETURN

DateTime
 OutBuf="_t=time(0);"
 GenCode
 OutBuf="_systime=localtime(&_t);"
 GenCode
 GetIntTmp()
 ErrRet
 IF FcnCode=40 THEN
	OutBuf=SymTemp.SymName+"=_systime->tm_hour;"
	GenCode
 ENDIF
 IF FcnCode=41 THEN
	OutBuf=SymTemp.SymName+"=_systime->tm_min;"
	GenCode
 ENDIF
 IF FcnCode=42 THEN
	OutBuf=SymTemp.SymName+"=_systime->tm_sec;"
	GenCode
 ENDIF
 IF FcnCode=43 THEN
	OutBuf=SymTemp.SymName+"=_systime->tm_year;"
	GenCode
 ENDIF
 IF FcnCode=44 THEN
	OutBuf=SymTemp.SymName+"=_systime->tm_mon+1;"
	GenCode
 ENDIF
 IF FcnCode=45 THEN
	OutBuf=SymTemp.SymName+"=_systime->tm_mday;"
	GenCode
 ENDIF
 IF FcnCode=46 THEN
	OutBuf=SymTemp.SymName+"=_systime->tm_wday;"
	GenCode
 ENDIF
 ExpTable(ExpNdx)=SymNdx
 RETURN

F47
* MBUTTON Function
 REM WinCode removed
 RETURN

F48
* HEX$(INT)
 ClassOp()
 LoadReg()
 ErrRet
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 OutBuf="_LtoH(_d0,"+STR$(HexType)+");"
 GenCode
 NumToA()
 RETURN

F49
* BITTST(ByteVar,Bit#)
 ClassOp()
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 LoadReg()
 ErrRet
 INC ExpNdx
 ClassOp()
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 LoadReg()
 ErrRet
 OutBuf="_d1=1<<_d1;"
 GenCode
 OpClass=BOOLClass
 TDataType=BOOLEAN
 GetTmp()
 ErrRet
 OutBuf="if (_d0&_d1) "+SymTemp.SymName+"=1;"
 GenCode
 OutBuf="else "+SymTemp.SymName+"=0;"
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN

F50
* SHL
 ClassOp()
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 LoadReg()
 ErrRet
 INC ExpNdx
 ClassOp()
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 LoadReg()
 ErrRet
 IF FcnCode=50 THEN
	OutBuf="_d0=_d0<<_d1;"
 ELSE
	IF FcnCode=51 THEN
		OutBuf="_d0=_d0>>_d1;"
	ELSE
		OutBuf="_d1=1<<_d1;"
		GenCode
		IF FcnCode=54 THEN
			OutBuf="_d0=_d0^_d1;"
		ELSE
			IF FcnCode=55 THEN
				OutBuf="_d1=_d1^0xffffffff;"
				GenCode
				OutBuf="_d0=_d0&_d1;"
			ELSE
				IF FcnCode=56 THEN
				OutBuf="_d0=_d0|_d1;"
				ENDIF
			ENDIF
		ENDIF
	ENDIF
 ENDIF
 GenCode
 GetIntTmp()
 ErrRet
 OutBuf=SymTemp.SymName+"=_d0;"
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN

F51
* SHR
 GOSUB F50
 RETURN

F52
* ROL
 GOSUB F50
 RETURN

F53
* ROR
 GOSUB F50
 RETURN

F54
* BITCHG
 GOSUB F50
 RETURN

F55
* BITCLR
 GOSUB F50
 RETURN

F56
* BITSET
 GOSUB F50
 RETURN

F57
* SUBSTR(Str1,Str2,[StartPos])
 ClassOp()
 IF TDataType<>STRING THEN
	ErrNo=ErrIVType
	RETURN
 ENDIF
 IF DMVector=$ff AND DMTemp=0 THEN
	SetTmpVec()
	ErrRet
 ENDIF
 FcnOp1Nam=TSymName
 INC ExpNdx
 ClassOp()
 IF TDataType<>STRING THEN
	ErrNo=ErrIVType
	RETURN
 ENDIF
 IF DMVector=$ff AND DMTemp=0 THEN
	SetTmpVec()
	ErrRet
 ENDIF
 TempStr=TSymName
 IF ExpRight-ExpLeft=4 THEN
 	INC ExpNdx
	ClassOp()
	IF OpClass<>INTClass THEN
		ErrNo=ErrIVType
		RETURN
	ENDIF
 ELSE
 	TSymName="1"
 ENDIF
 GetIntTmp()
 ErrRet
 OutBuf=SymTemp.SymName+"=_SubStr(&"+FcnOp1Nam+",&"+TempStr+","+TSymName+");"
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN

F58
* ZSTR$(INT)
 ClassOp()
 LoadReg()
 ErrRet
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 OutBuf="_ZLtoA(_d0);"
 GenCode
 NumToA()
 RETURN

F59
* ZHEX$(INT)
 ClassOp()
 LoadReg()
 ErrRet
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 OutBuf="_ZLtoH(_d0);"
 GenCode
 NumToA()
 RETURN

F60
* USING()
 NumArgs=ExpRight-ExpLeft-1
 IF NumArgs<2 OR NumArgs>NumTemps THEN
	ErrNo=ErrFcn
	RETURN
 ENDIF
 FOR Ctr1=1 TO NumArgs
	ClassOp()
	IF TDataType<>STRING OR DMAddr=$ff THEN
		MakString()
		ErrRet
		ClassOp()
	ENDIF
	OutBuf="_PUArgs["+STR$(Ctr1-1)+"]=(long)&"+TSymName+";"
	GenCode
	INC ExpNdx
 NEXT Ctr1
 OutBuf="_PrtUsing("+STR$(NumArgs)+",_PrintBuf,_BufSize);"
 GenCode
 CallErr()
 GenXfrCnt()
 GenCRLF
 OutBuf="POS=0;"
 GenCode
 ExpTable(ExpNdx)=21\ REM  return zero
 RETURN
 
F61
* COLORMAP()
 REM WinCode removed
 RETURN

F62
* GETINPUT()
 REM WinCode removed
 RETURN

F63
* INPUT_BOX()
 REM WinCode removed
 RETURN

F64
* QUESTION_BOX()
 REM WinCode removed
 RETURN

F65
* GETBUTTON(Button)
 REM WinCode removed
 RETURN

F66
* GETCHOICE(ChoiceName)
 REM WinCode removed
 RETURN

F67
* GETBROWSER()
 REM WinCode removed
 RETURN
 
F68
* GETVALUE()
 REM WinCode removed
 RETURN
 
F69
* GETPOSX()
 REM WinCode removed
 RETURN
 
F70
* GETPOSY()
 REM WinCode removed
 RETURN
 
F71
* RND()
 GetIntTmp()
 ErrRet
 IF os9=0 THEN
 	OutBuf=SymTemp.SymName+"=rand();"
 ELSE
 	OutBuf=SymTemp.SymName+"=0;"
 	PRINT "Warning... RND() is not available on this version"
 ENDIF
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN

F72
* BELOWMOUSE(ObjectName)
 REM WinCode removed
 RETURN

F73
* GETX()
 REM WinCode removed
 RETURN
 
F74
* GETY()
 REM WinCode removed
 RETURN

F75
* GETW()
 REM WinCode removed
 RETURN

F76
* GETH()
 REM WinCode removed
 RETURN
 
F77
* LCASE$()
 ClassOp()
 IF TDataType<>STRING OR DMArray=$ff THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 OutBuf="_MovStr(&_IOBufVec,&"+TSymName+");"
 GenCode
 OutBuf="_LCase(&_IOBufVec);"
 GenCode
 ExpTable(ExpNdx)=108\ REM 108 is _IOBufVec
 RETURN
 
F78
* UCASE$()
 ClassOp()
 IF TDataType<>STRING OR DMArray=$ff THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 OutBuf="_MovStr(&_IOBufVec,&"+TSymName+");"
 GenCode
 OutBuf="_UCase(&_IOBufVec);"
 GenCode
 ExpTable(ExpNdx)=108\ REM 108 is _IOBufVec
 RETURN
 
F79
* REMNANT$(String,Quantity)
 MidLftRt()
 RETURN
 
F80
* FINDADDR()
 ClassOp()
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 InitReg0
 LoadReg()
 OutBuf="*((long*)&_Poker)=_d0;"
 GenCode
 INC ExpNdx
 ClassOp()
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 InitReg0
 LoadReg()
 OutBuf="_ArgSafe0=_d0;"
 GenCode
 INC ExpNdx
 ClassOp()
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 InitReg0
 LoadReg() 
 GetIntTmp()
 ErrRet
 OutBuf=SymTemp.SymName+"=0;"
 GenCode
 OutBuf="while (_ArgSafe0){"
 GenCode
 OutBuf="if(*_Poker == _d0){"
 GenCode
 OutBuf=SymTemp.SymName+"=(long)_Poker;"
 GenCode
 OutBuf="break;}"
 GenCode
 OutBuf="_Poker++;"
 GenCode
 OutBuf="_ArgSafe0--;}"
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN
 
F81
* FINDOFFS()
 ClassOp()
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 InitReg0
 LoadReg()
 OutBuf="*((long*)&_Poker)=_d0;"
 GenCode
 OutBuf="_ArgSafe1=_d0;"
 GenCode
 INC ExpNdx
 ClassOp()
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 InitReg0
 LoadReg()
 OutBuf="_ArgSafe0=_d0;"
 GenCode
 INC ExpNdx
 ClassOp()
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 InitReg0
 LoadReg() 
 GetIntTmp()
 ErrRet
 OutBuf=SymTemp.SymName+"=-1;"
 GenCode
 OutBuf="while (_ArgSafe0){"
 GenCode
 OutBuf="if(*_Poker == _d0){"
 GenCode
 OutBuf=SymTemp.SymName+"=(long)_Poker-_ArgSafe1;"
 GenCode
 OutBuf="break;}"
 GenCode
 OutBuf="_Poker++;"
 GenCode
 OutBuf="_BlkCnt++;"
 GenCode
 OutBuf="_ArgSafe0--;}"
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN

OutCode
 INC CLineCtr
 IF StartFlag=$ff THEN
	IF FcnFlag=0 THEN
		WRITE #CodeFile,OutBuf
	ELSE
		WRITE #FcnFile,OutBuf
	ENDIF
 ELSE
	WRITE #VarFile,OutBuf
 ENDIF
 RETURN
 
OutVar
 WRITE #VarFile,OutBuf
 INC CLineCtr
 RETURN
 
OutMain
 WRITE #CodeFile,OutBuf
 INC CLineCtr
 RETURN
 
OutFcn
 WRITE #FcnFile,OutBuf
 INC CLineCtr
 RETURN

OutWrite
 IF ANSIFile=0 THEN
 	IF PrintFlag=0 THEN
		OutBuf="STATUS=write(_IOPthNum,_XferAddr,XferCount);"
 	ELSE
		OutBuf="STATUS=write(_PrtPthNum,_XferAddr,XferCount);"
	 ENDIF
 	GenCode
 	CallErr()
 ELSE
 	OutBuf="STATUS=fwrite(_XferAddr,1,XferCount,_FilePtr);"
 	GenCode
 	IF StatFlag=0 THEN
 		OutBuf="if (ferror(_FilePtr) != 0) longjmp(_ebuf,1);"
 		GenCode
 	ENDIF
 ENDIF
 GenXfrCnt()
 RETURN

OutRead
 IF ANSIFile=0 THEN
 	OutBuf="STATUS=read(_IOPthNum,_XferAddr,XferCount);"
 	GenCode
 	CallErr()
 ELSE
 	OutBuf="STATUS=fread(_XferAddr,1,XferCount,_FilePtr);"
 	GenCode
 	IF StatFlag=0 THEN
 		OutBuf="if (ferror(_FilePtr) != 0) longjmp(_ebuf,1);"
 		GenCode
 	ENDIF
 ENDIF
 GenXfrCnt()
 RETURN

OutCRLF
 OutBuf="_XferAddr=_CRLF;"
 GenCode
 IF Unix=0 THEN
 	OutBuf="XferCount=2;"
 ELSE
 	OutBuf="XferCount=1;"
 ENDIF
 GenCode
 OutBuf="STATUS=write(_PrtPthNum,_XferAddr,XferCount);"
 GenCode
 CallErr() 
 GenXfrCnt()
 RETURN

OutNewLine
 OutBuf="_XferAddr=&_NewLine;"
 GenCode
 OutBuf="XferCount=1;"
 GenCode
 GenWrite
 RETURN

MacDefInc
 INC MacDefNdx
 IF MacDefNdx>MacBufSiz THEN
	DEC MacDefNdx
	ErrNo=ErrMacBuf
 ENDIF
 RETURN
 
IncConStk
 INC CSP
 IF CSP>40 THEN
	ErrNo=ErrNDeep
 ENDIF
 RETURN

MakString
 IF OpClass=BOOLClass THEN
	IF TSymName<>"~" THEN
		InitReg0
		LoadReg()
		ErrRet
	ENDIF
	OutBuf="_BtoA(_d0);"
	GenCode
	NumToA()
	RETURN
 ENDIF
 IF TSymName<>"~" THEN
	InitReg0
	LoadReg()
	ErrRet
 ENDIF
 IF FloatFlag=0 THEN
	OutBuf="_LtoA(_d0);"
 ELSE
	OutBuf="_DtoA(_d0f);"
 ENDIF
 GenCode
 NumToA()
 RETURN

CSChk
 IF CSP<1 THEN
	ErrNo=ErrUBCon
	RETURN
 ENDIF
 IF CS(CSP).ConType<>TempInt THEN
	ErrNo=ErrUBCon
 ENDIF
 RETURN
 
StrSiz
 SymNdxSaf=SymNdx
 TokenBuf=SymTemp.SymName
 TempByte=LEFT$(TempStr,1)
 IF TempByte>="0" AND TempByte<="9" THEN
	TempInt=VAL(TempStr)
 ELSE
	SymTemp.SymName=TempStr
	SymSrch()
	IF SymFound=$ff AND SymTable(SymNdx).DataType=COMPVAR OR SymTable(SymNdx).DataType=MACRO THEN
		TempInt=SymTable(SymNdx).Detail
	ELSE
		ErrNo=ErrUDSym
		RETURN
	ENDIF
 ENDIF
 SymNdx=SymNdxSaf
 SymTemp.SymName=TokenBuf
 RETURN
 
Remark
 IF RemarkFlg<>0 AND COut<>0 THEN
	OutBuf=CHR$($2f)+CHR$($2a)+" LN:"+STR$(BasicLineCtr)+" "+UsrLine+" "+CHR$($2a)+CHR$($2f)
 ELSE
	OutBuf=""
 ENDIF
 RETURN

BldComment
 IF RemarkFlg<>0 AND COut<>0 THEN
	OutBuf=CHR$($2f)+CHR$($2a)+Comment+CHR$($2a)+CHR$($2f)
 ELSE
	OutBuf=""
 ENDIF
 RETURN

GetDtaTyp
 IF TDataType=BOOLEAN OR TDataType=BYTE THEN
	_DataType="unsigned char"
 ENDIF
 IF TDataType=SHORT THEN
	_DataType="short"
 ENDIF
 IF TDataType=LONG OR AddrBit&TDataMod=AddrBit THEN
	_DataType="long"
 ENDIF
 IF TDataType=FLOAT THEN
	_DataType="double"
 ENDIF
 RETURN

VecSymNam
 GetDtaTyp()
 VSymName=TSymName
 TSymName="*(("+_DataType+"*)"+VSymName+"._Ptr)"
 RETURN

AddMulti
 SymTemp.SymName="_Array_Diminsion"
 SymTemp.DataType=$ad\ REM  array diminsion (get it?)
 SymTemp.DataMod=SubCtr
 SymTemp.Detail=SubValue(1)
 SymTemp.DataAddr=SubValue(2)
 SymTemp.DataSize=SubValue(3)
 SymTemp.MultiPtr=SymNdx\ REM  backward pointer
 MultiInsert()
 SymTable(SymNdx).MultiPtr=MultiNdx
 RETURN

GetIntOp
 Expr()
 ErrRet
 IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 IF SymTemp.SymName<>"~" THEN
	InitReg0
	LoadReg()
 ENDIF
 RETURN

GetFltOp
 Expr()
 ErrRet
 IF OpClass<>FLTClass AND OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
 ENDIF
 IF TSymName="~" AND OpClass=INTClass THEN
 	TSymName="_d0"
 ENDIF
 IF TSymName<>"~" OR OpClass=INTClass THEN
	OutBuf="_d0f="+TSymName+";"
	GenCode
 ENDIF
 RETURN
 
GetComma
 NexToken()
 IF TokenBuf<>"," THEN
	ErrNo=ErrSyntax
 ENDIF
 RETURN

GetColon
 NexToken()
 IF TokenBuf<>":" THEN
	ErrNo=ErrSyntax
 ENDIF
 RETURN

GetEqual
 NexToken()
 IF TokenBuf<>"=" THEN
	ErrNo=ErrSyntax
 ENDIF
 RETURN

SubLoad
 InitReg0
 LoadReg()
 ErrRet
 IF FloatFlag<>0 THEN
	OutBuf="_d0=_d0f;"
	GenCode
 ENDIF
 IF ArrayBase=1 THEN
	OutBuf="_d0--;"
	GenCode
 ENDIF
 RETURN
 
RegInit
 OutBuf="_d0=0;"
 GenCode
 OutBuf="_d1=0;"
 GenCode
 OutBuf="_d0f=0;"
 GenCode
 OutBuf="_d1f=0;"
 GenCode
 OutBuf="_a0=0;"
 GenCode
 OutBuf=""
 GenCode
 RETURN
 
FDInit
 REM WinCode removed
 RETURN

ReadSource
 SrcNdx=0
 SrcLine=""
 UsrLine=""
 QuoteFlg=0
 LastByte=0
 WasOperator=0
ReadSrc
 STATUS:GET #InpFile(InpFilPtr),RawData
 TempInt=STATUS
 IF TempInt=0 THEN PreProc
 INC SrcNdx
 AsciiByte=ASC(RawData)
 IF AsciiByte=NewLine THEN PreProc
 UsrLine=UsrLine+RawData
 IF AsciiByte=$22 AND LastByte<>$5c THEN\ REM Is it a '"'?
	IF QuoteFlg=0 THEN
		QuoteFlg=1
	ELSE
		QuoteFlg=0
	ENDIF
 ENDIF
 IsOperator=0
 IF QuoteFlg=0 AND SrcNdx>1 THEN
	IF AsciiByte>=$2a AND AsciiByte<=$2f THEN
		IsOperator=1
	ELSE
		IF AsciiByte>=$3c AND AsciiByte<=$3e THEN
			IsOperator=1
		ELSE
			IF AsciiByte=$26 OR AsciiByte=$7c THEN
				IsOperator=1
			ENDIF
		ENDIF
	ENDIF
	IF LastByte=$20 AND IsOperator=1 THEN\ REM was space and is operator
		MID$(SrcLine,LEN(SrcLine),1)=RawData\ REM replace sp with op
	ELSE
		IF WasOperator=0 OR AsciiByte<>$20 THEN\ REM was not op or is not sp
			SrcLine=SrcLine+RawData
		ENDIF
	ENDIF
 ELSE	
	SrcLine=SrcLine+RawData
 ENDIF
 LastByte=AsciiByte
 WasOperator=IsOperator
 GOTO ReadSrc
PreProc
 SrcNdx=0
 TokenBuf=LEFT$(SrcLine,1)
 IF TokenBuf="'" OR TokenBuf=CHR$($5c) OR TokenBuf="(" THEN
 	MID$(SrcLine,1,1)="*"
 ENDIF
 NexToken()
 IF TokenBuf="rem" THEN
	TokenBuf="*"
 	TempStr="* "+SrcLine
	SrcLine=TempStr
 ENDIF
 IF TokenBuf="#" OR TokenBuf=";" OR TokenBuf="+" OR TokenBuf="*" OR TokenBuf="," OR TokenBuf="." OR TokenBuf="/" OR TokenBuf="$" OR TokenBuf="rem" THEN	
	SrcLine=TAIL$(SrcLine,SrcNdx-1)
	IF TokenBuf="$" THEN
		TokenBuf="#"
		MID$(SrcLine,SrcNdx,1)=TokenBuf
	ENDIF
	SrcNdx=0
	RETURN
 ENDIF
 IF TokenType=TTypInt THEN
 	SrcLine=TAIL$(SrcLine,SrcNdx-LEN(TokenBuf))
 	SrcNdx=0
 	RETURN
 ENDIF
 IF TokenBuf="[" THEN
 	TempStr=" "+SrcLine
 	SrcLine=TempStr
 	SrcNdx=0
 	RETURN
 ENDIF
 IF TokenType=TTypSym THEN
 	IF NextByte="=" THEN\ REM Implied LET
 		TempStr=" "+SrcLine
 		SrcLine=TempStr
 		SrcNdx=0
 		RETURN
 	ENDIF
 	IF NextByte=":" THEN\ REM LABEL or FCN or STATUS
 		IF TokenSaf="STATUS" THEN
 			TempStr=" "+SrcLine
 			SrcLine=TempStr
 		ELSE
 		 	SrcLine=TAIL$(SrcLine,SrcNdx-LEN(TokenBuf))
 		ENDIF
 		SrcNdx=0
 		RETURN
 	ENDIF	
 	KeyLook()
 	IF KeyNdx<>0 THEN\ REM Statement
 		TempStr=" "+SrcLine
 		SrcLine=TempStr
 		SrcNdx=0
 		RETURN
 	ENDIF
	SymTemp.SymName=TokenSaf
	SymSrch()
	IF SymFound<>0 THEN
		TDataType=SymTable(SymNdx).DataType
		IF TDataType>=1 AND TDataType<=6 THEN\ REM Standard variable
 			TempStr=" "+SrcLine
 			SrcLine=TempStr
 			SrcNdx=0
 			RETURN
 		ENDIF
		IF TDataType=MACRO OR TDataType=COMPLEX OR TDataType=FORM OR TDataType=OBJECT THEN
 			TempStr=" "+SrcLine
 			SrcLine=TempStr
 			SrcNdx=0
 			RETURN
 		ENDIF			
		IF TDataType=FCN OR TDataType=LABEL THEN
			IF NextByte="(" THEN\ REM FCN Call
 				TempStr=" "+SrcLine
 				SrcLine=TempStr
 			ELSE
 				SrcLine=TAIL$(SrcLine,SrcNdx-LEN(TokenBuf))
 			ENDIF
 			SrcNdx=0
 			RETURN
 		ENDIF
 	ELSE\ REM Must be new (unreferenced) LABEL
 		SrcLine=TAIL$(SrcLine,SrcNdx-LEN(TokenBuf))
 		SrcNdx=0
 		RETURN
 	ENDIF				
 ENDIF
* Get here if NULL line
 SrcNdx=0
 RETURN

GenCase
 IF OpClass=INTClass THEN
 	OutBuf="if (_SwitchInt "+SymType+" _d0) goto _Lbl"+STR$(LabelNum)+";"
 ELSE
 	OutBuf="_d0=_CmpStr(&_SwitchStr,&"+TSymName+");"
 	GenCode
 	OutBuf="if (_d0 "+SymType+" 1) goto _Lbl"+STR$(LabelNum)+";"
 ENDIF
 GenCode
 RETURN

EndCasex
 TempInt=7
 CSChk()
 ErrRet
 OutBuf="goto _Lbl"+STR$(CS(CSP).TermLabel)+";"\ REM when case code finishes
 GenCode
 OutBuf="_Lbl"+STR$(CS(CSP).ContLabel)+":;"\ REM get here if case not true
 GenCode
 RETURN
 	
