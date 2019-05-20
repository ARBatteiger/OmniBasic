* Fix2VB 1998 Copyright Innomation Systems, Inc.
* All Rights Reserved
*
************** Edition History ****************
* 11-20-98 Project begun by M.L. Smith
*

****** Subroutine and Function Declarations ******

#FCN GetLine() VOID
#FCN KeyLook() VOID
#FCN LookUp() VOID
#FCN NexToken() VOID
#FCN NexToken3() VOID
#FCN UnDoToken() VOID

*********** MACROS ************

*********** Define Constants ************

#SET LineSize=200
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

#SET Numeric=0
#SET String=1
#SET Label=2

*********** Define Variables ************

 DIM AsciiByte:BYTE
 DIM EscSeq:BYTE
 DIM ExpEnd:BYTE 
 DIM FileName:STRING[79]
 DIM InpFile(20):BYTE
 DIM InpFilPtr:LONG
 DIM KeyNdx:LONG
 DIM KeyWord:STRING[29]
 DIM NextByte:STRING[1]
 DIM QuoteFlg:BYTE
 DIM SrcNdx:LONG
 DIM SrcNdxSaf:LONG
 DIM SrcLine:STRING[LineSize]
 DIM TempByte:STRING[1]
 DIM TempFile:BYTE
 DIM TempStr:STRING[LineSize]
 DIM TokenBuf:STRING[LineSize]
 DIM TokenLen:BYTE
 DIM TokenSaf:STRING[LineSize]
 DIM TokenType:BYTE

*********** Start Code Here *************
 PRINT "Fix2VB Version 0.0"
 PRINT "Copyright 1998 Innomation Systems, Inc."
 PRINT "All Rights Reserved"
 PRINT
 FileName=""
 FileName=NextArg
 IF LEN(FileName)=0 THEN
	PRINT "No input file"
	GOTO Help
	END
 ENDIF
 IF FileName="-?" THEN Help
 FileName=LCASE$(FileName)
 IF RIGHT$(FileName,4)<>".odr" THEN
	PRINT "no recognized file extension (.ODR)"
	END
 ENDIF
 print "Filename is: ";FileName
 ON ERROR GOTO NoInpFile
 InpFilPtr=1
 OPEN #InpFile(InpFilPtr),FileName:READ+TEXT
 ON ERROR GOTO NoTmpFile
 DELETE "_TmpFile"
NoTmpFile
 CREATE #TempFile,"_TmpFile":WRITE+TEXT
 ON ERROR
 WHILE NOT(EOF(#InpFile(InpFilPtr))) DO
 	READ #InpFile(InpFilPtr),SrcLine
	CONTINUE IF SrcLine=CHR$(0xc)
	TempStr="'"+SrcLine
	write #TempFile,TempStr
 ENDWHILE
 end

* Keyword dispatch
 ON KeyNdx GOTO S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20,S21,S22,S23,S24,S25,S26,S27,S28,S29,S30,S31,S32,S33,S34,S35,S36,S37,S38,S39,S40,S41,S42,S43,S44,S45,S46,S47,S48,S49,S50,S51,S52,S53,S54,S55,S56,S57,S58,S59,S60,S61,S62

* Keyword processing routines
S1
* alarmack node:tag|string_var|tag group

S2
* alarmackall picture|string_var|tag group

S3
* append file name|string_var|tag group   file name|string_var|tag

S4
* attrib file name|string_var|tag group   protection|string_var|tag

S5 
* basepic picture|string_var|tag group

S6
* checkrights "string"|string_var|tag group num_var

S7 
* chfile file name|string_var|tag group   numvar

S8
* closedig node:tag.field|string_var|tag group

S9
* closepic picture|nickname|string_var|tag group

S10
* copy file name|string_var|tag group   file name|string_var|tag group|pathname

S11
* debugoff

S12
* debugon "string"

S13
* declare var_name   var_type   [scope]

S14
* delete file name|string_var|tag group

S15
* disablealarm node:tag|string_var|tag group

S16
* enablealarm node:tag|string_var|tag group

S17
* exit

S18
* fileclose num_var

S19
* filelist pattern|string_var|tag group   string_var "string"|string_var|tag group [show]

S20
* fileopen file name|string_var|tag group   num_var

S21
* fileprint file name|string_var|tag group

S22
* fileread num_var   string_var

S23
* filewrite num_var   "string"|string_var|tag group

S24
* findlink object|string_var|tag group   picture|string_var|tag group

S25
* getval node:tag.field|string_var|tag group|dde address   num_var|string_var

S26
* goto num_var|value

S27
* if expression
* command
* [else]
* [command]
* endif

S28
* login

S29
* logout

S30
* menu command [true|false]

S31
* message "string"|string_var|tag group

S32
* note "string"|string_var|tag group

S33
* null

S34
* numtostr value|num_var   "string"|string_var|tag group

S35
* offscan node:tag|string_var|tag group

S36
* onscan node:tag|string_var|tag group

S37
* opendig node:tag.field|string_var|tag group

S38
* openpic picture|string_var|tag group [Y,X,H,W]

S39
* pan X,Y picture|string_var|tag group

S40
* pause value|num_var

S41
* playsound filename|string_var|tag group

S42
* prompt num_var|string_var "string"|string_var|tag group [X,Y]

S43
* ramp node:tag.field|string_var|tag group %EGU|num_var

S44
* replacepic picture1|string_var|tag group   picture2|string_var|tag group   [tag group file|tag group]

S45
* round num_var   DN|UP|BK

S46
* runtask executable "[parameter]"

S47
* setauto node:tag|string_var|tag group

S48
* setmanl node:tag|string_var|tag group

S49
* setnickname "nickname"|string_var|tag group

S50
* setval node:tag.field|string_var:tag group|DDE address

S51
* strcat string_var   "string"|string_var|tag group   [num_var|value] [padchar]

S52
* strcmp "string"|string_var|tag group   "string"|string_var|tag group   num_var

S53
* strlen "string"|string_var|tag group   num_var

S54
* strstr "string"|string_var|tag group   "string"|string_var|tag group   num_var

S55
* strok "string"|string_var|tag group   value|num_var  value|num_var   string_var

S56
* strtonum "string"|string_var|tag group

S57
* togglealarm node:tag|string_var|tag group

S58
* toggledig node:tag.field|string_var|tag group

S59
* togglemanl node:tag|string_var|tag group

S60
* togglescan node:tag|string_var|tag group

S61
* view file name|string_var|tag group   "string"|string_var|tag group

S62
* zoom object|string_var|tag group  picture|string_var|tag group

Help
 PRINT "Usage: Fix2VB FileName"
 END

NoInpFile
 PRINT "Cannot open file: ";FileName
 END

KeyTable DATA "alarmack"
 DATA "alarmackall"
 DATA "append"
 DATA "attrib"
 DATA "basepic"
 DATA "checkrights"
 DATA "chfile"
 DATA "closedig"
 DATA "closepic"
 DATA "copy"
 DATA "debugoff"
 DATA "debugon"
 DATA "declare"
 DATA "delete"
 DATA "disablealarm"
 DATA "enablealarm"
 DATA "exit"
 DATA "fileclose"
 DATA "filelist"
 DATA "fileopen"
 DATA "fileprint"
 DATA "fileread"
 DATA "filewrite"
 DATA "findlink"
 DATA "getval"
 DATA "goto"
 DATA "if"
 DATA "login"
 DATA "logout"
 DATA "menu"
 DATA "message"
 DATA "note"
 DATA "null"
 DATA "numtostr"
 DATA "offscan"
 DATA "onscan"
 DATA "opendig"
 DATA "openpic"
 DATA "pan"
 DATA "pause"
 DATA "playsound"
 DATA "prompt"
 DATA "ramp"
 DATA "replacepic"
 DATA "round"
 DATA "runtask"
 DATA "setauto"
 DATA "setmanl"
 DATA "setnickname"
 DATA "setval"
 DATA "strcat"
 DATA "strcmp"
 DATA "strlen"
 DATA "strstr"
 DATA "strtok"
 DATA "strtonum"
 DATA "togglealarm"
 DATA "toggledig"
 DATA "togglemanl"
 DATA "togglescan"
 DATA "view"
 DATA "zoom"

* Funtions and Subroutines

GetLine
`
 RETURN

KeyLook
 KeyNdx=0
 RESTORE KeyTable
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
 IF TempByte="(" OR TempByte=")" THEN
	IF TokenLen<>0 THEN NexToken5
	NexToken3()
	TokenType=TTypParen
	GOTO NexToken6
 ENDIF
 IF TempByte<>"," THEN\ REM  special cond for multi-dim array
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
 IF TokenType=TTypInt AND RIGHT$(TokenBuf,1)="h" THEN\ REM Intel hex->Motorala
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
