' OmniBasic Copyright 1995,1996,1997,1998,1999 Computer Design Lab
' All Rights Reserved
'
' This source file is provided for educational, documentation, and porting
' purposes only. The recipient agrees to hold this information in strict
' confidence. The recipient agrees to these terms by accepting this software
' source code. Violations may result in criminal and/or civil penalties under
' the copyright and trade secret laws of the United States of America.

' Edition History

' 10-19-02 OmniBasic release 1.44 as base for adaptation
' 10-19-02 Remove most XForms stuff
' 10-19-02 Remove all conditional code
' 10-19-02 Remove ANSI and ANSIFile code
' 10-19-02 Remove CType, WinType, Version, _exp, risc
' 10-19-02 Standardize on ' as remark,LONG, INTEGER, BOOLEAN, DOUBLE, BYTE as standard data types
' 10-20-02 Change all directives to statements except $IF, $ELSEIF, $ENDIF
' 10-20-02 Require ':' on labels, redo ReadSource
' 10-20-02 Set SymTable to 5000, MacBuffer to 50000
' 10-20-02 Added Parallel LONG Array containing the checkword of each symbol as key to lookup
' 10-27-02 Added Parallel LONG Array as above for KeyWord Lookup as well
' 10-27-02 Modified checkword calculation to use byte array vector pointing to target string
' 10-27-02 Insert STRING constants at end of symbol table without SymSrch
' 10-27-02 Remove more FilePtr remnants
' 11-02-02 Remove Strings from SymTable after each statement, set SymTable to 3000, ExpTable to 300
' 11-03-02 Took out user functions, multi-dim array
' 11-03-02 Changed GOTO and GOSUB, ON..., ON ERROR, RETURN, LABEL, etc. all to assembly code generation

' MACROS

MACRO GenVar
WRITE #VarFile,OutBuf
INC CLineCtr
ENDMACRO

MACRO GenMain
WRITE #CodeFile,OutBuf
INC CLineCtr
ENDMACRO

MACRO IncExpNdx
INC ExpNdx
ExpLen=ExpNdx
ENDMACRO

MACRO CommaRet
GOSUB GetComma
ErrRet
ENDMACRO

MACRO CommaMain
GOSUB GetComma
ErrMain
ENDMACRO

MACRO ColonRet
GOSUB GetColon
ErrRet
ENDMACRO

MACRO ColonMain
GOSUB GetColon
ErrMain
ENDMACRO

MACRO EqualRet
GOSUB GetEqual
ErrRet
ENDMACRO

MACRO EqualMain
GOSUB GetEqual
ErrMain
ENDMACRO

MACRO MakeLong
IF LAND(TDataMod,PointerBit)=PointerBit THEN
	TDataType=LONG
ENDIF
ENDMACRO

MACRO ErrRet
IF ErrNo<>0 THEN
	RETURN
ENDIF
ENDMACRO

MACRO ErrMain
;if (ErrNo) goto MainLoop;
ENDMACRO

CONST ErrUDSym=1
CONST ErrIVSNam=2
CONST ErrTypMis=3
CONST ErrIVExp=4
CONST ErrSyntax=5
CONST ErrDupSym=6
CONST ErrSymFul=7
CONST ErrUDFcn=8
CONST ErrIVType=9
CONST ErrIVMod=10
CONST ErrMacArg=11
CONST ErrIVDir=12
CONST ErrDupMac=13
CONST ErrEndStr=14
CONST ErrMacNst=15
CONST ErrMacBuf=16
CONST ErrIVMac=17
CONST ErrEndm=18
CONST ErrUBCon=19
CONST ErrNDeep=20
CONST ErrDecFcn=21
CONST ErrIVParm=22
CONST ErrParam=23
CONST ErrCpxExp=24
CONST ErrIVFunc=25
CONST ErrTmpUse=26
CONST ErrParen=27
CONST ErrFcn=28
CONST ErrIVTarg=29
CONST ErrFSNest=30
CONST ErrTblArr=31
CONST ErrERRTrp=32
CONST ErrArrSub=33
CONST ErrTblTbl=34
CONST ErrEndTbl=35
CONST ErrTblArgs=36

CONST COMPVAR=0
CONST BOOLEAN=1
CONST BYTE=2
CONST SHORT=3
CONST LONG=4
CONST FLOAT=5
CONST STRING=6
CONST LABEL=7
CONST MACRO=8
CONST OPER=9
CONST FCN=10
CONST PROC=11
CONST TYPE=12
CONST VOIDX=13
CONST COMPLEX=14
CONST BUFFER=15
CONST LABELVAR=16

CONST ArrayBit=$0001
CONST PointerBit=$0002
CONST ConstBit=$0004
CONST MultiBit=$0008
CONST MemberBit=$0010
CONST VectorBit=$0020
CONST TempBit=$0040
CONST DataBit=$0080
CONST TmpVec=$60
CONST ArrayMsk=$fffe

CONST NULLClass=0
CONST INTClass=1
CONST STRClass=2
CONST ARRClass=3
CONST CPXClass=4
CONST FLTClass=5
CONST BOOLClass=6
CONST OBJClass=7
CONST FRMClass=8
CONST LBLClass=9

CONST TTypRelOp=1
CONST TTypPunct=2
CONST TTypMath=3
CONST TTypQuote=4
CONST TTypSym=5
CONST TTypInt=6
CONST TTypHex=7
CONST TTypParen=8
CONST TTypMisc=9
CONST TTypFloat=10

CONST IntFcn=1
CONST DblFcn=2

CONST NumTemps=15
CONST OBQUOTE=$22
CONST LabelResolved=$ff
CONST LabelUnresolved=0

CONST _BufSize=300
CONST MacBufSiz=50000
CONST ExpTabSiz=300
CONST UserSym=192'  set to first user symbol in PreDefined
CONST SymTabSiz=3000

DIM TableNdx AS LONG
DIM TableTypeNdx AS LONG
DIM TableName AS STRING*28
DIM TableElements AS LONG
DIM TableCounter AS LONG
DIM CommaCounter AS LONG
DIM I AS LONG
DIM J AS LONG
DIM FirstValidChar AS BOOLEAN
DIM HexType AS BYTE
DIM ANSIArgs(9) AS STRING*5
DIM FilBufSiz AS LONG
DIM FilBufAdr AS LONG
DIM ANSIArgCtr AS LONG
DIM ObjType AS BYTE
DIM ObjClass AS LONG
DIM TempObjClass AS LONG
DIM ObjSubClass AS LONG
DIM GroupFlag AS BYTE
DIM Place AS BYTE
DIM HaltFlag AS BYTE
DIM PromptFlag AS BYTE
DIM ProcedureFlag AS BYTE
DIM DLLFlag AS BYTE
DIM FloatFlag AS BYTE
DIM ExpFlag AS BYTE
DIM XSize AS LONG
DIM YSize AS LONG
DIM SubCtr AS BYTE
DIM SubCtrSaf AS BYTE
DIM MultiFlag AS BYTE
DIM DbgFlag AS BYTE
DIM SubValue(3) AS LONG
DIM SubValSaf(3) AS LONG
DIM PrtPthFlg AS BYTE
DIM VerbFlag AS BYTE
DIM VerbCmd AS STRING*10
DIM Comment AS STRING*64
DIM ExistingCompVar AS BYTE
DIM StdLib AS STRING*42
DIM AsmbCmd AS STRING*32
DIM ObjectCmd AS STRING*32
DIM OptionCmd AS STRING*32
DIM CompileCmd AS STRING*32
DIM AsmbFlag AS BYTE
DIM DirFlag AS BYTE
DIM CrOpFlag AS BYTE
DIM StatFlag AS BYTE
DIM LopCtrNum AS LONG
DIM LastSym AS LONG
DIM LastKey AS LONG
DIM LetFlag AS BYTE
DIM StartFlag AS BYTE
DIM DataFlag AS BYTE
DIM SelectFlag AS BYTE
DIM CaseFlag AS BYTE
DIM CaseElseFlag AS BYTE
DIM CaseToFlag AS BYTE
DIM XBufSize AS LONG
DIM LinkerOut AS String*40
DIM B AS STRING*10
DIM BufRWFlg AS BYTE
DIM NewLine AS BYTE
DIM Fmt AS STRING*79
DIM UDump AS BYTE
DIM StringNum AS LONG
DIM VectorFlg AS BYTE
DIM VectorName AS STRING*28
DIM DtaRegNum AS BYTE
DIM LoopVars(40) AS STRING*28
DIM LopVarNdx AS LONG
DIM UsrFcnNam AS STRING*42
DIM UsrFcnNamx AS STRING*42
DIM SetObjNam AS STRING*42
DIM NumArgs AS BYTE
DIM LinkerOpt AS STRING*50
DIM LibList AS STRING*100
DIM ProgMode AS BYTE
DIM ObjectMode AS BYTE
DIM DumpSyms AS BYTE
DIM FloatOK AS BYTE
DIM OneDot AS BYTE
DIM LstExp AS LONG
DIM NoGen AS BYTE
DIM COut AS BYTE
DIM OptNdx AS LONG
DIM Opt AS STRING*1
DIM CondValid AS BYTE
DIM CondOp1 AS LONG
DIM CondOp2 AS LONG
DIM GenFlag(20) AS BYTE
DIM GFNdx AS LONG
DIM AddInst AS STRING*5
DIM DecInc AS STRING*2
DIM VarSize AS LONG
DIM SetMask AS BYTE
DIM ArrayBase AS BYTE
DIM TmpMax AS BYTE
DIM TmpVecMax AS BYTE
DIM FTmpMax AS BYTE
DIM ChrTmpMax AS BYTE
DIM StrTmpMax AS BYTE
DIM PrintFlag AS BYTE
DIM TabFlag AS BYTE
DIM DevFlag AS BYTE
DIM LastStmt AS STRING*8
DIM LastLabel AS STRING*28
DIM FcnCode AS BYTE
DIM FileStat AS BYTE
DIM DiskIO AS BYTE
DIM FileIO AS BYTE
DIM ReadFlag AS BYTE
DIM AndOrFlag AS BYTE
DIM CompFlag AS BYTE
DIM Promote AS BYTE
DIM Demote AS BYTE
DIM DataOp AS BYTE
DIM MathOp AS BYTE
DIM LdRegName AS STRING*4
DIM Reg0Name AS STRING*4
DIM Reg1Name AS STRING*4
DIM _DataType AS STRING*16
DIM DWSafe AS STRING*3
DIM D0Loaded AS BYTE
DIM Target AS BYTE
DIM TmpUse AS LONG
DIM TmpVecUse AS LONG
DIM FTmpUse AS LONG
DIM ChrTmpUse AS LONG
DIM StrTmpUse AS LONG
DIM Op1Class AS BYTE
DIM Operator AS BYTE
DIM Op2Class AS BYTE
DIM OpClass AS BYTE
DIM Op1Type AS BYTE
DIM Op1Mod AS INTEGER
DIM Op1Detail AS LONG
DIM Op2Type AS BYTE
DIM Op2Mod AS INTEGER
DIM Op2Detail AS LONG
DIM Op1Name AS STRING*42
DIM Op2Name AS STRING*42
DIM SwitchClass AS BYTE
DIM Op1DataSize AS LONG
DIM Op2DataSize AS LONG
DIM LNFlag AS BYTE
DIM VarName AS STRING*29
DIM BufName AS STRING*29
DIM AccMode AS STRING*40
DIM CreatMode AS STRING*40
DIM PathVar AS STRING*42
DIM PathName AS STRING*29
DIM ToSubFlag AS BYTE
DIM DigDec AS BYTE
DIM BitType AS BYTE
DIM FcnType AS BYTE
DIM FcnSpec AS BYTE
DIM JmpArgs AS LONG
DIM LabelNum AS LONG
DIM OELabelNum:LONG
DIM FcnLabNum AS LONG
DIM TableNum AS LONG
TYPE ConStruct
	TermLabel AS LONG
	ContLabel AS LONG
	LoopName AS STRING*28
	ConType AS BYTE
	ConLine AS LONG
	LoopVec AS LONG
	LoopLabel AS LONG
	NoStep AS BYTE
	ImmTo AS BYTE
	ImmToVal AS STRING*10
	ImmStep AS BYTE
	ImmStepVal AS STRING*10
	NegImmStep AS BYTE
END TYPE
DIM CS(40) AS ConStruct
DIM CSP AS LONG
DIM InpFile(20) AS BYTE
DIM InpFilPtr AS LONG
DIM CodeFile AS BYTE GLOBAL
DIM VarFile AS BYTE
DIM OutFile AS BYTE
DIM FDFile AS BYTE
DIM RawData AS STRING*1
DIM TempStr AS STRING*_BufSize
DIM FcnOp1Nam AS STRING*42
DIM FcnOp2Nam AS STRING*42
DIM TempName AS STRING*28
DIM TempInt AS LONG
DIM TempByte AS STRING*1
DIM ErrNo AS LONG
DIM NextByte AS STRING*1
DIM AsciiByte AS BYTE
DIM Konstant AS LONG
DIM StringCnt AS LONG
DIM StringLen AS LONG
DIM LoopNum AS LONG
TYPE Symbol
	SymName AS STRING*28
	DataType AS INTEGER
	DataMod AS BYTE
	ArrayDims AS BYTE
	PointerSym AS BOOLEAN
	ConstSym AS BOOLEAN
	MemberSym AS BOOLEAN
	VectorSym AS BOOLEAN
	TempSym AS BOOLEAN
	DataSym AS BOOLEAN
	Detail AS LONG
	DataAddr AS LONG
	DataSize AS LONG
	ArrayDim1 AS LONG
	ArrayDim2 AS LONG
	ArrayDim3 AS LONG
END TYPE
DIM SymTable(SymTabSiz) AS Symbol
DIM SymTableKey(SymTabSiz) AS LONG
DIM KeyStringArray(28) AS BYTE VECTOR
TYPE KeyData
	KeyCheckWord AS LONG
	KeyName AS STRING*16
	KeyLabel AS LABEL
END TYPE
DIM KeyTable(200) AS KeyData
DIM UMFlag AS BYTE
DIM GblVarFlg AS BYTE
DIM ExtVarFlg AS BYTE
DIM CVTemp AS LONG
DIM CVOp AS STRING*2
DIM NeedComma AS BYTE
DIM MacExFlag AS BYTE
DIM MacBuf(MacBufSiz) AS BYTE
DIM MacDefNdx AS LONG
DIM MacExNdx AS LONG
DIM MacTblPtr AS LONG
DIM MacArgBuf(16) AS STRING*100
DIM MacArgPtr AS LONG
DIM MaxArgNum AS BYTE
DIM PoolCtr AS LONG
DIM SymNdx AS LONG
DIM SymNdxSaf AS LONG
DIM SymType AS STRING*32
DIM ArraySize AS LONG
DIM ForNdx AS LONG
DIM DataTemp AS BYTE
DIM TSymName AS STRING*42
DIM VSymName AS STRING*42
DIM TDataType AS BYTE
DIM TDataMod AS INTEGER
DIM TDetail AS LONG
DIM VDetail AS LONG
DIM TDataAddr AS LONG
DIM TDataSize AS LONG
DIM ExpTable(ExpTabSiz) AS LONG
DIM TypePtr AS LONG
DIM TypeFlag AS BYTE
DIM LastEntry AS Symbol
DIM SymTemp AS Symbol GLOBAL
DIM SrcLine AS STRING*_BufSize
DIM SrcLineCpy AS STRING*_BufSize
DIM SrcLineSaf AS STRING*_BufSize
DIM UsrLine AS STRING*_BufSize
DIM _OutBuf AS STRING*_BufSize
DIM OutBuf AS STRING*_BufSize VECTOR GLOBAL
DIM TokenBuf AS STRING*_BufSize
DIM ExpEnd AS BYTE
DIM TokenLen AS BYTE
DIM ExpLen AS BYTE
DIM LastGroup AS BYTE
DIM TokenType AS BYTE
DIM LastByte AS BYTE
DIM IsOperator AS BYTE
DIM WasOperator AS BYTE
DIM TokenSaf AS STRING*_BufSize
DIM RootSym AS STRING*29
DIM Subscript(3) AS STRING*28
DIM SubscrErr AS BYTE
DIM KeyWord AS STRING*29
DIM KeyNdx AS LONG
DIM SymbolSaf AS STRING*29
DIM NumberOK AS BYTE
DIM HexOK AS BYTE
DIM SymbolOK AS BYTE
DIM IntOK AS BYTE
DIM DimFlag AS BYTE
DIM DimOK AS BYTE
DIM GlobalFlg AS BYTE
DIM BasicLineCtr AS LONG
DIM CLineCtr AS LONG
DIM QuoteFlg AS BYTE
DIM EscSeq AS BYTE
DIM ParenStk(100) AS BYTE
DIM ParenCnt AS BYTE
DIM FcnCtr AS BYTE
DIM AECtr AS BYTE
DIM LevelCnt AS BYTE
DIM SymFull AS BYTE
DIM SymFound AS BYTE
DIM ErrCnt AS BYTE
DIM VarBytRem AS LONG
DIM TypeBytes AS LONG
DIM TypeVars AS LONG
DIM LabelFlag AS BYTE

DIM ObjTypNdx AS LONG
DIM ObjClsNdx AS LONG
DIM AddFcnNam AS STRING*32

DIM DTCompVar AS BYTE
DIM DTBoolean AS BYTE
DIM DTByte AS BYTE
DIM DTShort AS BYTE
DIM DTLong AS BYTE
DIM DTFloat AS BYTE
DIM DTString AS BYTE
DIM DTLabel AS BYTE
DIM DTMacro AS BYTE
DIM DTOper AS BYTE
DIM DTFcn AS BYTE
DIM DTProc AS BYTE
DIM DTStruct AS BYTE
DIM DTVoid AS BYTE
DIM DTComplex AS BYTE
DIM DTBuffer AS BYTE

DIM DMData AS BYTE
DIM DMTemp AS BYTE
DIM DMVector AS BYTE
DIM DMMember AS BYTE
DIM DMMulti AS BYTE
DIM DMConst AS BYTE
DIM DMAddr AS BYTE
DIM DMArray AS BYTE

DIM TFileName AS STRING*28
DIM FileName AS STRING*28
DIM UseFilNam AS STRING*28
DIM Ctr1 AS LONG
DIM Ctr2 AS LONG
DIM Ctr3 AS LONG
DIM SrcNdx AS LONG
DIM SrcNdxCpy AS LONG
DIM SrcNdxSaf AS LONG
DIM ExpEndSaf AS BYTE
DIM NumberNdx AS LONG
DIM ValidNdx AS LONG
DIM LabNdx AS LONG
DIM ExpNdx AS LONG
DIM ExpLeft AS LONG
DIM ExpRight AS LONG
DIM PType AS LONG

' Start
PRINT 
PRINT "OmniBasic Version 0.2"
PRINT 

PRINT  "Copyright  1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002 Innomation Systems, Inc."
PRINT  "All Rights Reserved"
PRINT 
FileName=""
FileName=NextArg
IF LEN(FileName)=0 THEN
	PRINT "No input file"
	END
ENDIF
IF FileName="-?" THEN Help
IF RIGHT$(FileName,2)<>".b" AND RIGHT$(FileName,2)<>".B" THEN
	PRINT "No Recognized Extension"
	END
ENDIF
ON ERROR GOTO NoInpFile
InpFilPtr=1
OPEN #InpFile(InpFilPtr),FileName:READ
	
FileName=LEFT$(FileName,LEN(FileName)-2)
ON ERROR GOTO NoCodeFile
DELETE "_CodFile"
NoCodeFile:
CREATE #CodeFile,"_CodFile":WRITE+TEXT
ON ERROR GOTO NoVarFile
DELETE "_VarFile"
NoVarFile:
CREATE #VarFile,"_VarFile":WRITE+TEXT
ON ERROR
LinkerOut=""
LibList=""
LinkerOpt=""
GFNdx=1
GenFlag(GFNdx)=$ff
SETVEC OutBuf=ADDR(_OutBuf)
XBufSize=_BufSize
SelectFlag=0
CaseFlag=0
CaseElseFlag=0
GroupFlag=0' clear Group Flag
DataFlag=0'  clear Data Flag
NoGen=0'  default OFF
ExpFlag=0
HexType=0' $ (Motorola)
LastSym=UserSym
HaltFlag=0
PromptFlag=0
ProcedureFlag=0
VerbFlag=0
UDump=0'  default OFF
StartFlag=0
COut=0'  default OFF
DumpSyms=0'  default OFF
ProgMode=$ff'  default ON
ObjectMode=0'  default OFF
AsmbFlag=0'  default OFF
LopCtrNum=-1
ArrayBase=1'  default to base 1
PrtPthFlg=0
DtaRegNum=0
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

FOR MacDefNdx=1 TO MacBufSiz
	MacBuf(MacDefNdx)=0
NEXT MacDefNdx
MacDefNdx=1

RESTORE PreDefTbl
SymNdx=0
InitSym:
INC SymNdx
READ TempStr
IF TempStr="%" THEN LoadKeyWords
SymTemp.SymName=TempStr
READ SymTemp.DataType
READ SymTemp.DataMod
READ SymTemp.Detail
READ SymTemp.DataAddr
READ SymTemp.DataSize
SymTable(SymNdx)=SymTemp
TempInt=0
SETVEC KeyStringArray=ADDR(TempStr)
FOR I=1 TO LEN(TempStr)
	TempInt=TempInt+KeyStringArray(I)
NEXT I
SymTableKey(SymNdx)=TempInt
GOTO InitSym

LoadKeyWords:

TABLE KeyTable
 0,"data",DataX
 0,"restore",RestoreX
 0,"poke",PokeX
 0,"return",ReturnX
 0,"seek",SeekX
 0,"type",TypeX
 0,"dim",DimX
 0,"let",LetX
 0,"for",ForX
 0,"if",IfX
 0,"goto",GotoX
 0,"gosub",GosubX
 0,"on",OnX
 0,"print",PrintX
 0,"input",InputX
 0,"read",ReadX
 0,"write",WriteX
 0,"get",GetX
 0,"put",PutX
 0,"end",EndX
 0,"create",CreateX
 0,"open",OpenX
 0,"close",CloseX
 0,"while",WhileX
 0,"endwhile",EndWhileX
 0,"next",NextX
 0,"rem",RemX
 0,"else",ElseX
 0,"endif",EndIfX
 0,"delete",DeleteX
 0,"buffer",BufferX
 0,"loop",LoopX
 0,"endloop",EndLoopX
 0,"repeat",RepeatX
 0,"until",UntilX
 0,"exitif",ExitIfX
 0,"shell",ShellX
 0,"fprint",FPrintX
 0,"finput",FInputX
 0,"base",BaseX
 0,"inc",IncX
 0,"dec",DecX
 0,"bufread",BufReadX
 0,"bufwrite",BufWriteX
 0,"decimals",DecimalsX
 0,"exchange",ExchangeX
 0,"Vacant1",Vacant1X
 0,"endexit",EndExitX
 0,"table",TableX
 0,"endtable",EndTableX
 0,"setvec",SetVecX
 0,"digits",DigitsX
 0,"macro",MacroX
 0,"endmacro",EndMacroX
 0,"Vacant2",Vacant2X
 0,"Vacant3",Vacant3X
 0,"include",IncludeX
 0,"freeze",FreezeX
 0,"library",LibraryX
 0,"Vacant4",Vacant4X
 0,"Vacant5",Vacant5X
 0,"Vacant6",Vacant6X
 0,"Vacant7",Vacant7X
 0,"Vacant8",Vacant8X
 0,"Vacant9",Vacant9X
 0,"randomize",RandomizeX
 0,"Vacant10",Vacant10X
 0,"Vacant11",Vacant11X
 0,"Vacant12",Vacant12X
 0,"wend",WendX
 0,"continue",ContinueX
 0,"select",SelectX
 0,"endselect",EndSelectX
 0,"case",CaseX
 0,"endcase",EndCaseX
 0,"const",ConstX
 0,"swap",SwapX
 0,"program",ProgramX
 0,"hexout",HexOutX
 0,"makelower",MakeLowerX
 0,"makeupper",MakeUpperX
 0,"fill",FillX
 0,"init",InitX
 0,"setbufadr",SetBufAdrX
 0,"%",MainLoop
ENDTABLE

KeyNdx=0
InitKeyWords:
INC KeyNdx
TempStr=KeyTable(KeyNdx).KeyName
IF TempStr="%" THEN Preamble
LastKey=KeyNdx
TempInt=0
SETVEC KeyStringArray=ADDR(TempStr)
FOR I=1 TO LEN(TempStr)
	TempInt=TempInt+KeyStringArray(I)
NEXT I
KeyTable(KeyNdx).KeyCheckWord=TempInt
GOTO InitKeyWords

Preamble:
GOSUB CmdLine
Comment="Compiler Declaration and Variable Section"
GOSUB BldComment
GenVar
GOSUB VarBlank

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

OutBuf="void _TrmStr();"
GenVar
OutBuf="void _PrtUsing();"
GenVar
OutBuf="void _ReadBool();"
GenVar
OutBuf="void _ReadByte();"
GenVar
OutBuf="void _ReadShort();"
GenVar
OutBuf="void _ReadLong();"
GenVar
OutBuf="void _ReadFlt();"
GenVar
OutBuf="void _ReadStr();"
GenVar
OutBuf="void _MovArg();"
GenVar
OutBuf="void _MovStr();"
GenVar
OutBuf="long _CmpStr();"
GenVar
OutBuf="long _StrLen();"
GenVar
OutBuf="long _SubStr();"
GenVar
OutBuf="void _MidStr();"
GenVar
OutBuf="void _LeftStr();"
GenVar
OutBuf="void _RightStr();"
GenVar
OutBuf="void _ClrConv();"
GenVar
OutBuf="double _AtoD();"
GenVar
OutBuf="long _AtoL();"
GenVar
OutBuf="void _ZLtoH();"
GenVar
OutBuf="void _ZLtoA();"
GenVar
OutBuf="void _LtoA();"
GenVar
OutBuf="void _DtoA();"
GenVar
OutBuf="void _LtoH();"
GenVar
OutBuf="void _PrintStr();"
GenVar
OutBuf="void _PrintTab();"
GenVar
OutBuf="void _InpData();"
GenVar
OutBuf="void _BtoA();"
GenVar
OutBuf="void _LCase();"
GenVar
OutBuf="void _UCase();"
GenVar
OutBuf="void _Remnant();"
GenVar

GOSUB VarBlank
OutBuf="#define _BufSize "+STR$(_BufSize)
GenVar
OutBuf="#include "+CHR$(OBQUOTE)+"basic.h"+CHR$(OBQUOTE)
GenVar
RESTORE RunVars
RunVarLp:
READ TempInt,OutBuf
IF OutBuf="%" THEN RunVarDn
IF ObjectMode=$ff AND TempInt=1 THEN
	TempStr="extern "+OutBuf
	OutBuf=TempStr
ENDIF
GenVar
GOTO RunVarLp
RunVarDn:

'*** Win95/NT ****
VerbCmd=""
NewLine=$0a

IF ObjectMode=0 THEN
	TempStr=""
ELSE
	TempStr="extern "
ENDIF
OutBuf=TempStr+"char _IOBuffer[_BufSize];"
GenVar
OutBuf=TempStr+"char _PrintBuf[_BufSize];"
GenVar

GOSUB VarBlank
OutBuf="static long _LoopCtr[10];"
GenVar

GOSUB VarBlank
Comment="User Declaration and Variable Section"
GOSUB BldComment
GenVar
OutBuf=""
GenMain
Comment="Code Section"
GOSUB BldComment
GenMain
OutBuf=""
GenMain
IF ObjectMode=0 THEN
	StartFlag=$ff'  for a short time only
	OutBuf="main(argc,argv)"
	GenMain
	OutBuf="int argc;"
	GenMain
	OutBuf="char *argv[];"
	GenMain
	OutBuf="{"
	GenMain
	OutBuf=""
	GenMain
	Comment="Pseudo Registers"
	GOSUB BldComment
	GenMain
	OutBuf="register long _d0;"
	GenMain
	OutBuf="register long _d1;"
	GenMain
	OutBuf="double _d0f;"
	GenMain
	OutBuf="double _d1f;"
	GenMain
	OutBuf="register void *_a0;"
	GenMain
	OutBuf=""
	GenMain
	Comment="Initialize Variables"
	GOSUB BldComment
	GenMain
	TempInt=22
	SymTemp.SymName="_CBufVec"
	OutBuf="_a0=_ConvBuf;"
	GenMain
	GOSUB SetStrVec
	SymTemp.SymName="_CBuf1Vec"
	OutBuf="_a0=_ConvBuf1;"
	GenMain
	GOSUB SetStrVec
	TempInt=_BufSize
	SymTemp.SymName="_PBufVec"
	OutBuf="_a0=_PrintBuf;"
	GenMain
	GOSUB SetStrVec
	SymTemp.SymName="_IOBufVec"
	OutBuf="_a0=_IOBuffer;"
	GenMain
	GOSUB SetStrVec
	Comment="Initialize System Variables"
	GOSUB BldComment
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
	OutBuf="_CRLF[0]=0x0d;"
	GenMain
	OutBuf="_CRLF[1]=0x0a;"
	GenMain
	OutBuf="_NewLine="+STR$(NewLine)+";"
	GenMain
	OutBuf="_Prompt='?';"
	GenMain
   	OutBuf="_ArgCount=argc;"
   	GenMain
   	OutBuf="_ArgNum=0;"
   	GenMain
   	OutBuf="_ArgList=(long)argv;"
   	GenMain
   	GOSUB ReqTmpVec
   	OutBuf="_TmpVec1._Ptr=ProgramName;"
   	GOSUB OutCode
   	OutBuf="_TmpVec1._Len=28;"
   	GOSUB OutCode
   	OutBuf="_TmpVec1._Lnk=0;"
   	GOSUB OutCode
	OutBuf="_MovArg(&_TmpVec1,_ArgList);"
	GOSUB OutCode
	OutBuf=""
	GenMain
	StartFlag=0'  was on only to set up sys vars and vecs
ENDIF

MainLoop:
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
	IF HaltFlag<>0 THEN
		END
	END IF
	ErrNo=0
ENDIF
IF DimFlag=0 THEN
	LOOP
		IF SymTable(LastSym).DataType<>STRING OR LAND(SymTable(LastSym).DataMod,ConstBit)<>ConstBit THEN NotString
		DEC LastSym
	ENDLOOP
ENDIF
NotString:
GOSUB MainLoopInit
IF MacExFlag=0 THEN
	IF InpFilPtr=1 THEN
		INC BasicLineCtr
	ENDIF
	GOSUB ReadSource
	IF TempInt=0 THEN Finish
ELSE
	SrcLine=""
	SrcNdx=0
	MacExLp: AsciiByte=MacBuf(MacExNdx)
	INC MacExNdx
	IF AsciiByte=0 THEN'  end of MACRO
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
ProcLine:
SrcNdx=0
IF GenFlag(GFNdx)=0 THEN
	IF LEFT$(SrcLine,1)<>"$" THEN MainLoop
	INC SrcNdx
	GOSUB NexToken
	IF TokenBuf<>"if" AND TokenBuf<>"else" AND TokenBuf<>"endif" THEN MainLoop
	IF TokenBuf="if" THEN IFDx
	IF TokenBuf="else" THEN ELSEDx
	GOTO ENDIFDx
ENDIF
IF LEN(SrcLine)=0 THEN MainLoop
TempByte=LEFT$(SrcLine,1)
IF TempByte="'" THEN
	GOSUB Remark
	GOSUB OutCode
	GOTO MainLoop
ENDIF
IF TempByte=";" THEN
	OutBuf=MID$(SrcLine,2,LEN(SrcLine)-1)
	GOSUB OutCode
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
IF TempByte="+" THEN' AT&T Assembler code
	OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+MID$(SrcLine,2,LEN(SrcLine)-1)+CHR$(OBQUOTE)+");"
	GOSUB OutCode
	GOTO MainLoop
ENDIF
IF TempByte="$" THEN
	' Process Directive
	GOSUB Remark
	GOSUB OutCode
	INC SrcNdx
	GOSUB NexToken
	SELECT CASE TokenBuf
		CASE "if"
			GOTO IFDx
		CASE "else"
			GOTO ELSEDx
		CASE "endif"
			GOTO ENDIFDx
		CASE ELSE
			ErrNo=ErrSyntax
			GOTO MainLoop
	ENDSELECT
ENDIF 
GOSUB NexToken
SrcNdx=0
IF NextByte<>":" THEN ProcStmt 

'ProcLabel
StartFlag=$ff
IF DataFlag=$ff THEN
	DataFlag=0
	OutBuf="0};"
	GenVar
ENDIF
LNFlag=$ff
GOSUB TokenSym
ErrMain
LabelFlag=$ff
TDataType=SymTable(SymNdx).DataType
TDetail=SymTable(SymNdx).Detail
TDataSize=SymTable(SymNdx).DataSize
LastLabel=SymbolSaf
IF SymFound<>0 THEN' Label Found
	IF TDataType<>LABEL THEN
		ErrNo=ErrDupSym
		GOTO MainLoop
	ENDIF
	IF TDetail=LabelUnresolved THEN
		SymTable(SymNdx).Detail=LabelResolved
	ELSE
		ErrNo=ErrDupSym
		GOTO MainLoop
	ENDIF
ELSE
	GOSUB ClrDatTyp
	TDataType=LABEL
	SymTemp.DataType=LABEL
	GOSUB ClrSym
	SymTemp.DataMod=0
	SymTemp.Detail=LabelResolved
	GOSUB SymInsert
	ErrMain
ENDIF
GOSUB NexToken' Eat the ':'
GOSUB NexToken
IF TokenBuf="data" THEN
	SymTable(SymNdx).DataMod=DataBit
	GOTO DataX'  DATA statement processing
ENDIF
GOSUB UnDoToken
SymbolSaf=SymbolSaf+":"

ProcStmt:
GOSUB NexToken
IF TokenSaf="STATUS" THEN
	EqualMain
	GOSUB NexToken
	StatFlag=$ff
ENDIF
IF LEN(TokenBuf)>0 THEN
	LastStmt=TokenBuf
ENDIF
IF TokenLen=0 THEN
	GOSUB OutLabel
	GOTO MainLoop
ENDIF
GOSUB KeyLook
IF KeyNdx=0 THEN
	REM maybe a macro
	SymTemp.SymName=TokenSaf
	GOSUB SymSrch
	IF SymFound=$ff AND SymTable(SymNdx).DataType=MACRO THEN
		GOSUB Remark
		GOSUB OutCode
		MacTblPtr=SymNdx
		MacExNdx=SymTable(SymNdx).DataAddr
		SymTable(SymNdx).Detail=SymTable(SymNdx).Detail+1' inc macro occurrance
		NeedComma=0
		MaxArgNum=0
		MacExFlag=$ff
		GOSUB OutLabel
		IF MID$(SrcLine,SrcNdx+1,1)=" " THEN
			INC SrcNdx
		ENDIF
		MacExLoop:
		GOSUB MacToken
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
	KeyNdx=8' Assume LET
	GOSUB UnDoToken
ENDIF
IF KeyNdx<>1 AND DataFlag=$ff THEN
	DataFlag=0
	OutBuf="0};"
	GenVar
ENDIF
GOSUB Remark
IF KeyNdx=1 THEN'  DATA statement
	GenVar
	GOTO DataX
ENDIF
IF KeyNdx=6 THEN'  TYPE
	GenVar
	GOTO TypeX
ENDIF
IF KeyNdx=7 THEN'  DIM
	GOTO DimX
ENDIF
StartFlag=$ff
GOSUB OutCode' put out OmniBasic source as comment
OutBuf=""
GOSUB OutLabel
GOTO [KeyTable(KeyNdx).KeyLabel]

ProcCmd:
IF Op1Class<>STRClass THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
OutBuf="_MovArg(&"+Op1Name+",_ArgList);"
GOSUB OutCode
RETURN

SETDx:
SetMask=0
GOSUB SETDx1
GOTO MainLoop

SETDx1:
' Changed into a subroutine because is called by
' inline code OR CmdLine, so cannot "jump" to MainLoop as before.
UMFlag=0
GOSUB TokenSym
ErrRet
IF SymFound=0 THEN
	ExistingCompVar=0
	SymTemp.DataType=COMPVAR
	GOSUB ClrSym
	GOSUB SymInsert
	ErrRet
ELSE
	ExistingCompVar=$ff
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
GOSUB NexToken
IF TokenBuf="-" THEN
	UMFlag=$ff
	GOSUB NexToken
ENDIF
IF TokenType=TTypInt THEN
	GOSUB ValidInt
	IF IntOK=0 THEN
		ErrNo=ErrIVExp
		RETURN
	ENDIF
	GOTO SetOp1
ENDIF
IF TokenType=TTypHex THEN
	GOSUB ValidHex
	IF HexOK=0 THEN
		ErrNo=ErrIVExp
		RETURN
	ENDIF
	GOTO SetOp1
ENDIF
IF TokenType=TTypSym THEN
	GOSUB TokenSym1
	ErrRet
	IF SymFound=0 THEN
		ErrNo=ErrUDSym
		RETURN
	ENDIF
	TokenSaf=STR$(SymTable(SymNdx).Detail)
	GOTO SetOp1
ENDIF
ErrNo=ErrIVExp
RETURN
SetOp1:
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
GOSUB NexToken
IF TokenLen=0 THEN SetFinish
IF TokenBuf="<" THEN
	GOSUB NexToken
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
GOSUB NexToken
IF TokenType=TTypInt THEN
	GOSUB ValidInt
	IF IntOK=0 THEN
		ErrNo=ErrIVExp
		RETURN
	ENDIF
	GOTO SetOperator
ENDIF
IF TokenType=TTypHex THEN
	GOSUB ValidHex
	IF HexOK=0 THEN
		ErrNo=ErrIVExp
		RETURN
	ENDIF
	GOTO SetOperator
ENDIF
IF TokenType=TTypSym THEN
	GOSUB TokenSym1
	ErrRet
	IF SymFound=0 THEN
		ErrNo=ErrUDSym
		RETURN
	ENDIF
	TokenSaf=STR$(SymTable(SymNdx).Detail)
	GOTO SetOperator
ENDIF
ErrNo=ErrIVExp
RETURN
SetOperator:
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
	CVTemp=LAND(SymTable(SymNdx).Detail,VAL(TokenSaf))
ENDIF
IF CVOp="|" THEN
	CVTemp=LOR(SymTable(SymNdx).Detail,VAL(TokenSaf))
ENDIF
IF CVOp="<" OR CVOp=">>" THEN
	CVTemp=SymTable(SymNdx).Detail
	TempInt=VAL(TokenSaf)
;if (CVOp[0] == '>') CVTemp=CVTemp>>TempInt;
;else CVTemp=CVTemp<<TempInt;
ENDIF
SetFinish:
SymNdx=SymNdxSaf
SymTable(SymNdx).Detail=CVTemp
SymTable(SymNdx).DataMod=SetMask
IF ExistingCompVar=$ff THEN
	OutBuf="#undef "+SymTable(SymNdx).SymName
	GOSUB OutCode
ENDIF
OutBuf="#define "+SymTable(SymNdx).SymName+" "+STR$(CVTemp)
GOSUB OutCode
RETURN

MACRODx:
GOSUB NexToken
IF TokenType<>5 THEN'  symbol
	ErrNo=ErrSyntax'  syntax error
	GOTO MainLoop
ENDIF
SymTemp.SymName=TokenSaf
GOSUB SymSrch
IF SymFound=$ff THEN
	ErrNo=ErrDupSym'  symbol already defined
	GOTO MainLoop
ENDIF
SymTemp.DataType=MACRO
GOSUB ClrSym
SymTemp.DataAddr=MacDefNdx'  address of macro in macro buffer
GOSUB SymInsert
ErrMain
' read a line of source code
MacLp:
IF InpFilPtr=1 THEN
	INC BasicLineCtr
ENDIF
GOSUB ReadSource
IF TempInt=0 THEN
	PRINT "FATAL ERROR.. EOF in MACRO"
	END
ENDIF
MacLpExit:
GOSUB NexToken
IF TokenBuf="macro" THEN
	ErrNo=ErrMacNst'  nested macro
	GOTO MainLoop
ENDIF
IF TokenBuf="endmacro" THEN
	MacBuf(MacDefNdx)=0
	GOSUB MacDefInc
	GOTO MainLoop
ENDIF
IF TokenBuf="end" THEN
	GOSUB NexToken
	IF TokenBuf="macro" THEN
		MacBuf(MacDefNdx)=0
		GOSUB MacDefInc
		GOTO MainLoop
	ENDIF
ENDIF	
SrcNdx=0
lbl7027:
INC SrcNdx
IF SrcNdx>LEN(SrcLine) THEN
	MacBuf(MacDefNdx)=NewLine
	GOSUB MacDefInc
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
		GOSUB MacDefInc
		ErrMain
		GOTO lbl7027
	ENDIF
	AsciiByte=LAND(AsciiByte,$4f)' make upper case
	TempByte=CHR$(AsciiByte)
	IF TempByte>="A" AND TempByte<="F" THEN
		AsciiByte=LAND($0f,AsciiByte)
		AsciiByte=LOR($80,AsciiByte)
		AsciiByte=AsciiByte+9
		MacBuf(MacDefNdx)=AsciiByte
		GOSUB MacDefInc
		ErrMain
		GOTO lbl7027
	ENDIF
	ErrNo=ErrIVMac
	GOTO MainLoop
ENDIF
TempByte=MID$(SrcLine,SrcNdx,1)
AsciiByte=ASC(TempByte)
MacBuf(MacDefNdx)=AsciiByte
GOSUB MacDefInc
ErrMain
GOTO lbl7027

ENDMDx:
ErrNo=ErrEndm
GOTO MainLoop

IFDx:
CondValid=GenFlag(GFNdx)
INC GFNdx
IF GFNdx>20 THEN
	PRINT "FATAL Error Conditional stack overflow"
	END
ENDIF
UMFlag=0
GOSUB TokenSym
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
GOSUB NexToken
IF TokenBuf="-" THEN
	UMFlag=$ff
	GOSUB NexToken
ENDIF
IF TokenType=TTypInt THEN
	GOSUB ValidInt
	IF IntOK=0 THEN
		ErrNo=ErrIVExp
		GOTO MainLoop
	ENDIF
	GOTO IFDx1
ENDIF
IF TokenType=TTypHex THEN
	GOSUB ValidHex
	IF HexOK=0 THEN
		ErrNo=ErrIVExp
		GOTO MainLoop
	ENDIF
	GOTO IFDx1
ENDIF
IF TokenType=TTypSym THEN
	GOSUB TokenSym1
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
IFDx1:
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

ELSEDx:
IF GFNdx<2 THEN
	PRINT "FATAL ERROR Conditional stack error (#ELSE)"
	END
ENDIF
IF GenFlag(GFNdx-1)=$ff THEN
	GenFlag(GFNdx)=LNOT(GenFlag(GFNdx))
ENDIF
GOTO MainLoop

ENDIFDx:
DEC GFNdx
IF GFNdx=0 THEN
	PRINT "FATAL ERROR Conditional stack error (#ENDIF)"
	END
ENDIF
CondValid=GenFlag(GFNdx)
GOTO MainLoop

FIXDx:
SetMask=$80
GOSUB SETDx1
GOTO MainLoop

DataX:
IF DataFlag=0 THEN
	DataFlag=$ff
	IF LabelFlag=0 OR SymTable(SymNdx).DataMod<>DataBit THEN
		PRINT "FATAL ERROR... DATA block with no label in line ";BasicLineCtr
		END
	ENDIF
	LastStmt="data"'  needed for first 'DATA' in block
	GOSUB Remark
	GenVar
	OutBuf="static unsigned char "+SymbolSaf+"[]={"
	GenVar
ENDIF
NeedComma=0
DATALoop:
GOSUB NexToken
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
	GOSUB ValidHex
	IF HexOK=0 THEN
		ErrNo=ErrIVExp
		GOTO MainLoop
	ENDIF
	TempStr="0x"+MID$(TokenSaf,2,LEN(TokenSaf)-1)
	GOTO NextData
ENDIF
IF TokenType=TTypInt THEN
	GOSUB ValidInt
	IF IntOK=0 THEN
		ErrNo=ErrIVExp
		GOTO MainLoop
	ENDIF
	TempStr=TokenSaf
	GOTO NextData
ENDIF
IF TokenType=TTypFloat THEN
	GOSUB ValidFlt
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
	GOSUB TokenSym1
	ErrMain
	TDataType=SymTable(SymNdx).DataType
	IF TDataType<>COMPVAR THEN
		ErrNo=ErrTypMis
		GOTO MainLoop
	ENDIF
	Konstant=SymTable(SymNdx).Detail
	TempStr=STR$(Konstant)
	GOTO NextData
ENDIF
ErrNo=ErrSyntax
NextData:
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

RestoreX:
LNFlag=$ff
GOSUB TokenSym
ErrMain
IF SymFound=0 THEN
	SymTemp.DataType=LABEL
	GOSUB ClrSym
	SymTemp.Detail=LabelUnresolved
	SymTemp.DataMod=DataBit
	GOSUB SymInsert
	ErrMain
ENDIF
IF SymTable(SymNdx).DataType<>LABEL OR SymTable(SymNdx).DataMod<>DataBit THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
OutBuf="_DataPtr="+SymbolSaf+";"
GOSUB OutCode
OutBuf="_DataPtrSaf=_DataPtr;"
GOSUB OutCode
GOTO MainLoop

PokeX:
GOSUB GetIntOp' get addr
ErrMain
OutBuf="(long)_Poker=_d0;"
GOSUB OutCode
CommaMain
GOSUB GetIntOp' get data
ErrMain
OutBuf="*_Poker=_d0;"
GOSUB OutCode
GOTO MainLoop

ReturnX:
OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+"ret"+CHR$(OBQUOTE)+");"
GenMain
GOTO MainLoop

SeekX:
DiskIO=$ff
GOSUB GetPthNum
ErrMain
GOSUB Expr
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
OutBuf="STATUS=lseek(_IOPthNum,(long)"+TSymName+",0);"
GOSUB OutCode
GOSUB CallErr
GOTO MainLoop

TypeX:
GOSUB ClrDatTyp
GOSUB TokenSym
ErrMain
IF SymFound=$ff THEN
	ErrNo=ErrDupSym
	GOTO MainLoop
ENDIF
TypeFlag=$ff
TypePtr=SymNdx
TypeVars=0
TypeBytes=0
SymTemp.DataType=TYPE
GOSUB ClrSym
GOSUB SymInsert
ErrMain
TypeLp:
TDataMod=0
IF InpFilPtr=1 THEN
	INC BasicLineCtr
ENDIF
GOSUB ReadSource
IF TempInt=0 THEN
	PRINT "Fatal Error: EOF in TYPE"
	END
ENDIF
TypeLp2:
GOSUB NexToken
IF TokenBuf="end" THEN
	GOSUB NexToken
	IF TokenBuf="type" THEN TypeEnd
	ErrNo=ErrSyntax
ENDIF
IF TokenBuf="endtype" THEN TypeEnd
GOSUB UnDoToken		
IF LEFT$(SrcLine,1)="*" THEN TypeLp
GOSUB DimVar
IF DimOK=0 THEN MainLoop
INC TypeVars
IF MOD(TypeBytes,2)=1 THEN
	IF DTShort=$ff OR DTLong=$ff OR DTFloat=$ff THEN
		INC TypeBytes
	ENDIF
ENDIF
SymTemp.DataAddr=TypeBytes
GOSUB SymInsert
ErrMain 
TypeBytes=TypeBytes+SymTemp.DataSize
IF MultiFlag=$ff THEN
	'GOSUB AddMulti
	ErrMain
ENDIF
GOTO TypeLp
TypeEnd:
IF MOD(TypeBytes,2)<>0 THEN
	INC TypeBytes
ENDIF
SymTable(TypePtr).DataSize=TypeBytes
SymTable(TypePtr).Detail=TypeVars
GOTO MainLoop

DimX:
GblVarFlg=0
GOSUB DimVar
IF DimOK=0 THEN MainLoop
GOSUB SymInsert
ErrMain

GOSUB DecVar
IF MultiFlag=$ff THEN
	'GOSUB AddMulti
ENDIF
GOTO MainLoop

SetFcnPtr:
GOSUB Remark
GOSUB OutCode
IF LAND(SymTable(SymNdx).DataSize,$00000004)=0 THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
Op1Name=SymTable(SymNdx).SymName
Op1DataSize=SymTable(SymNdx).DataSize
EqualMain
GOSUB NexToken
SymTemp.SymName=TokenSaf
GOSUB SymSrch
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
	GOSUB UnDoToken
	GOSUB Expr
	IF DMVector<>0 THEN
		GOSUB VecSymNam
		TempStr="="
	ELSE
		TempStr="=(long)"
	ENDIF
	IF TDataType<>LONG AND DMAddr=0 THEN
		ErrNo=ErrTypMis
		GOTO MainLoop
	ENDIF
ENDIF
OutBuf="(long)"+Op1Name+TempStr+TSymName+";"	
GOSUB OutCode
GOTO MainLoop

LetX:
GOSUB Let
GOTO MainLoop

Let:
Target=$ff
LetFlag=$ff
GOSUB Expr
ErrRet
IF DMConst=$ff THEN
	ErrNo=ErrIVExp
	RETURN
ENDIF
Op1Name=TSymName
Op1Class=OpClass
Op1Type=TDataType
Op1Mod=TDataMod
Op1Detail=TDetail
Op1DataSize=TDataSize
IF Op1Name="NextArg" THEN
	ErrNo=ErrIVTarg
	RETURN
ENDIF
IF LAND(TempBit,Op1Mod)<>0 AND LAND(VectorBit,Op1Mod)=0 THEN
	ErrNo=ErrIVTarg
	RETURN
ENDIF 
GOSUB NexToken
IF TokenBuf<>"=" THEN
	ErrNo=ErrSyntax
	RETURN
ENDIF
IF Op1Type=LABELVAR THEN
	GOSUB NexToken
	SymTemp.SymName=TokenSaf
	GOSUB SymSrch
	IF SymFound=0 THEN
		'print "make label here",SrcLine
	ELSE 
		IF  SymTable(SymNdx).DataType<>LABEL THEN
			ErrNo=ErrTypMis
			RETURN
		ENDIF	
	ENDIF
	OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+"movl $"+SymTemp.SymName+",__ArgSafe0"+CHR$(OBQUOTE)+");"
	GenMain
	IF LAND(VectorBit,Op1Mod)=VectorBit THEN
		Op1Name=Op1Name+"._Ptr"
	ENDIF
	OutBuf="*((long*)"+Op1Name+")=_ArgSafe0;"
	GenMain
	RETURN
ENDIF
LetFlag=0
GOSUB GetExp
ErrRet
Target=0
GOSUB ProcExp
ErrRet
GOSUB ClassOp
Op2Name=TSymName
Op2Class=OpClass
Op2Type=TDataType
Op2Mod=TDataMod
Op2Detail=TDetail
GOSUB NexToken
IF TokenLen<>0 THEN' check for junk on end
	ErrNo=ErrSyntax
	RETURN
ENDIF
IF Op2Name="NextArg" THEN
	GOSUB ProcCmd
	RETURN
ENDIF
IF Op1Class<>Op2Class THEN'  int=float for example
	EXITIF Op1Class=INTClass AND Op2Class=FLTClass
	EXITIF Op1Class=FLTClass AND Op2Class=INTClass
	ErrNo=ErrTypMis
	RETURN
ENDIF
IF Op1Class=INTClass OR Op1Class=FLTClass OR Op1Class=BOOLClass THEN
     IF TSymName<>"~" THEN
		TDataType=Op1Type
		GOSUB GetDtaTyp
		IF LAND(Op1Mod,$7f)=0 AND Op2Mod=ConstBit THEN
			IF Op2Type=BOOLEAN THEN
				Op2Name=STR$(Op2Detail)
			ENDIF
			OutBuf=Op1Name+"="+Op2Name+";"
			GOSUB OutCode
			RETURN
		ENDIF
		IF LAND(Op1Mod,$7f)=0 AND LAND(Op2Mod,$7f)=0 AND Op1Type=Op2Type THEN
			IF Op1Mod=0 And Op2Mod=0 THEN
				OutBuf=Op1Name+"="+Op2Name+";"
			ENDIF
			GOSUB OutCode
			RETURN
		ENDIF
		D0Loaded=0
		GOSUB LoadReg
		ErrRet
	ENDIF
	GOSUB StoreD0
	RETURN
ENDIF
IF Op1Class=STRClass THEN
	OutBuf="_MovStr(&"+Op1Name+",&"+Op2Name+");"
	GOSUB OutCode
	RETURN
ENDIF
IF Op1Class=CPXClass OR Op1Class=ARRClass THEN
	IF LAND(Op1Mod,VectorBit)=0 THEN
		OutBuf="_DestAddr="+Op1Name+";"
	ELSE
		OutBuf="_DestAddr="+Op1Name+"._Ptr;"
	ENDIF
	GOSUB OutCode
	IF LAND(Op2Mod,VectorBit)=0 THEN
		OutBuf="_SrcAddr="+Op2Name+";"
	ELSE
		OutBuf="_SrcAddr="+Op2Name+"._Ptr;"
	ENDIF
	GOSUB OutCode
	IF Op1Class=ARRClass THEN
		TempInt=Op1DataSize
	ELSE
		TempInt=SymTable(Op1Detail).DataSize
	ENDIF	
	OutBuf="_BlkCnt="+STR$(TempInt)+";"
	GOSUB OutCode
	OutBuf="while (_BlkCnt)"
	GOSUB OutCode
	OutBuf="{"
	GOSUB OutCode
	OutBuf="*((unsigned char*)_DestAddr)=*((unsigned char*)_SrcAddr);"
	GOSUB OutCode
	OutBuf="(long)_DestAddr=(long)_DestAddr+1;"
	GOSUB OutCode
	OutBuf="(long)_SrcAddr=(long)_SrcAddr+1;"
	GOSUB OutCode
	OutBuf="_BlkCnt--;"
	GOSUB OutCode
	OutBuf="}"
	GOSUB OutCode
	RETURN
ENDIF
IF Op1Class=BOOLClass THEN
	D0Loaded=0
	GOSUB LoadReg
	ErrMain
	GOSUB StoreD0
	RETURN
ENDIF
IF Op1Class=OBJClass THEN
	ErrNo=ErrIVType
	RETURN
ENDIF
IF Op1Class=FRMClass THEN
	ErrNo=ErrIVType
	RETURN
ENDIF 
PRINT  "Internal Error"
END

ForX:
GOSUB TokenSym
ErrMain
IF SymFound=0 THEN
	ErrNo=ErrUDSym
	GOTO MainLoop
ENDIF
GOSUB IncConStk
ErrMain
CS(CSP).LoopName=SymTemp.SymName
SymTemp=SymTable(SymNdx)
GOSUB ClassOp1
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
GOSUB GetLopVec
ErrMain
CS(CSP).LoopVec=LopVarNdx
CS(CSP).ConType=5
CS(CSP).ConLine=BasicLineCtr
EqualMain
GOSUB Expr
ErrMain
IF TSymName="~" THEN
	TSymName="_d0"
ENDIF
IF DMVector=$ff THEN
	GOSUB VecSymNam
ENDIF
' set initial value into loop var
OutBuf=CS(CSP).LoopName+"="+TSymName+";"
GOSUB OutCode
GOSUB NexToken
IF TokenBuf<>"to" THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
ENDIF
GOSUB Expr
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
	GOSUB VecSymNam
ENDIF
IF CS(CSP).ImmTo=0 THEN
	OutBuf="_LopVec"+STR$(LopVarNdx)+"._Limit="+TSymName+";"
	GOSUB OutCode
ENDIF
GOSUB NexToken
IF TokenLen=0 THEN
	CS(CSP).NoStep=$ff
ELSE
	IF TokenBuf<>"step" THEN
		ErrNo=ErrSyntax
		GOTO MainLoop
	ENDIF
	CS(CSP).NoStep=0
	GOSUB Expr
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
			GOSUB VecSymNam
		ENDIF
		OutBuf="_LopVec"+Str$(LopVarNdx)+"._Step="+TSymName+";"
		GOSUB OutCode
	ENDIF
ENDIF
INC LabelNum
OutBuf="_Lbl"+STR$(LabelNum)+":;"
GOSUB OutCode
CS(CSP).LoopLabel=LabelNum
INC LabelNum
CS(CSP).ContLabel=LabelNum
INC LabelNum
CS(CSP).TermLabel=LabelNum
' compare loopvar to "to" value
IF CS(CSP).ImmStep=$ff AND CS(CSP).NegImmStep=0 OR CS(CSP).NoStep=$ff THEN
	IF CS(CSP).ImmTo=$ff THEN
		OutBuf="if ("+CS(CSP).LoopName+">"+CS(CSP).ImmToVal+") goto _Lbl"+STR$(CS(CSP).TermLabel)+";"
		GOSUB OutCode
	ELSE
		OutBuf="if ("+CS(CSP).LoopName+">_LopVec"+STR$(CS(CSP).LoopVec)+"._Limit) goto _Lbl"+STR$(CS(CSP).TermLabel)+";"
		GOSUB OutCode
	ENDIF
ENDIF
IF CS(CSP).ImmStep=$ff AND CS(CSP).NegImmStep=$ff THEN
	IF CS(CSP).ImmTo=$ff THEN
		OutBuf="if ("+CS(CSP).LoopName+"<"+CS(CSP).ImmToVal+") goto _Lbl"+STR$(CS(CSP).TermLabel)+";"
		GOSUB OutCode
	ELSE
		OutBuf="if ("+CS(CSP).LoopName+"<_LopVec"+STR$(CS(CSP).LoopVec)+"._Limit) goto _Lbl"+STR$(CS(CSP).TermLabel)+";"
		GOSUB OutCode
	ENDIF
ENDIF
IF CS(CSP).ImmStep=0 AND CS(CSP).NoStep=0 THEN
	IF CS(CSP).ImmTo=0 THEN
		OutBuf="if ((_LopVec"+STR$(LopVarNdx)+"._Step>=0) && ("+CS(CSP).LoopName+">_LopVec"+STR$(CS(CSP).LoopVec)+"._Limit)) goto _Lbl"+STR$(CS(CSP).TermLabel)+";"
		GOSUB OutCode
		OutBuf="if ((_LopVec"+STR$(LopVarNdx)+"._Step<0) && ("+CS(CSP).LoopName+"<_LopVec"+STR$(CS(CSP).LoopVec)+"._Limit)) goto _Lbl"+STR$(CS(CSP).TermLabel)+";"
		GOSUB OutCode
	ELSE
		OutBuf="if ((_LopVec"+STR$(LopVarNdx)+"._Step>=0) && ("+CS(CSP).LoopName+">"+CS(CSP).ImmToVal+")) goto _Lbl"+STR$(CS(CSP).TermLabel)+";"
		GOSUB OutCode
		OutBuf="if ((_LopVec"+STR$(LopVarNdx)+"._Step<0) && ("+CS(CSP).LoopName+"<"+CS(CSP).ImmToVal+")) goto _Lbl"+STR$(CS(CSP).TermLabel)+";"
		GOSUB OutCode
	ENDIF
ENDIF
GOTO MainLoop

IfX:
GOSUB CmpOps
ErrMain
INC LabelNum
IF TokenLen=0 THEN StructIF' This makes the 'THEN' optional
IF TokenBuf<>"then" THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
ENDIF
GOSUB NexToken
IF TokenLen=0 THEN StructIF
LNFlag=$ff
GOSUB TokenSym1
ErrMain
IF SymFound=0 THEN
	GOSUB ClrSym
	SymTemp.DataType=LABEL
	SymTemp.DataMod=0
	SymTemp.Detail=LabelUnresolved
	GOSUB SymInsert
	ErrMain
ENDIF
IF SymTable(SymNdx).DataType<>7 THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
OutBuf="if (_True==0) goto _Lbl"+STR$(LabelNum)+";"
GOSUB OutCode
OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+"jmp "+SymTemp.SymName+CHR$(OBQUOTE)+");"
GOSUB OutCode
OutBuf="_Lbl"+STR$(LabelNum)+":;"
GOSUB OutCode
GOTO MainLoop
StructIF:
GOSUB IncConStk
ErrMain
CS(CSP).TermLabel=LabelNum
CS(CSP).ConType=0
CS(CSP).ConLine=BasicLineCtr
OutBuf="if (_True==0) goto _Lbl"+STR$(LabelNum)+";"
GOSUB OutCode
GOTO MainLoop

GotoX:
LNFlag=$ff
GOSUB NexToken
IF TokenBuf="[" THEN
	FOR I=1 TO LEN(SrcLine)
		IF MID$(SrcLine,I,1)="]" THEN BracketFound
	NEXT I
	ErrNo=ErrSyntax
	GOTO MainLoop
	BracketFound:
	MID$(SrcLine,I,1)=CHR$(0)
	GOSUB Expr
	IF TDataType<>LABELVAR THEN
		ErrNo=ErrTypMis
		GOTO MainLoop
	ENDIF
	IF TSymName="~" THEN
		OutBuf="_ArgSafe0=_d0;"
		GenMain
		OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+"movl __ArgSafe0,%eax"+CHR$(OBQUOTE)+");"
	ELSE
		IF DMVector<>0 THEN
			IF RIGHT$(OutBuf,3)="d0;" THEN
				TempStr="*((long*)"+MID$(OutBuf,7,13)+")"
			ELSE
				TempStr="*((long*)"+LEFT$(OutBuf,13)+")"
			ENDIF
			OutBuf="_ArgSafe0="+TempStr+";"
			GenMain
			OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+"movl __ArgSafe0,%eax"+CHR$(OBQUOTE)+");"
		ELSE
			OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+"movl _"+TSymName+",%eax"+CHR$(OBQUOTE)+");"
		ENDIF
	ENDIF
	GenMain
	OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+"jmp *%eax"+CHR$(OBQUOTE)+");"
	GenMain
	GOTO MainLoop
ENDIF
GOSUB UnDoToken
GOSUB TokenSym
ErrMain
IF SymFound=0 THEN
	GOSUB ClrSym
	SymTemp.DataType=LABEL
	SymTemp.DataMod=0
	SymTemp.Detail=LabelUnresolved
	GOSUB SymInsert
	ErrMain
ENDIF
TempInt=SymTable(SymNdx).Detail
IF SymTable(SymNdx).DataType<>LABEL THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+"jmp "+SymbolSaf+CHR$(OBQUOTE)+");"
GOSUB OutCode
GOTO MainLoop

GosubX:
LNFlag=$ff
GOSUB NexToken
IF TokenBuf="[" THEN
	FOR I=1 TO LEN(SrcLine)
		IF MID$(SrcLine,I,1)="]" THEN BracketFound2
	NEXT I
	ErrNo=ErrSyntax
	GOTO MainLoop
	BracketFound2:
	MID$(SrcLine,I,1)=CHR$(0)
	GOSUB Expr
	IF TDataType<>LABELVAR THEN
		ErrNo=ErrTypMis
		GOTO MainLoop
	ENDIF
	IF TSymName="~" THEN
		OutBuf="_ArgSafe0=_d0;"
		GenMain
		OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+"movl __ArgSafe0,%eax"+CHR$(OBQUOTE)+");"
	ELSE
		IF DMVector<>0 THEN
			IF RIGHT$(OutBuf,3)="d0;" THEN
				TempStr="*((long*)"+MID$(OutBuf,7,13)+")"
			ELSE
				TempStr="*((long*)"+LEFT$(OutBuf,13)+")"
			ENDIF
			OutBuf="_ArgSafe0="+TempStr+";"
			GenMain
			OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+"movl __ArgSafe0,%eax"+CHR$(OBQUOTE)+");"
		ELSE
			OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+"movl _"+TSymName+",%eax"+CHR$(OBQUOTE)+");"
		ENDIF
	ENDIF
	GenMain
	OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+"call *%eax"+CHR$(OBQUOTE)+");"
	GenMain
	GOTO MainLoop
ENDIF
GOSUB UnDoToken
GOSUB TokenSym
ErrMain
IF SymFound=0 THEN
	GOSUB ClrSym
	SymTemp.DataType=LABEL
	SymTemp.DataMod=0
	SymTemp.Detail=LabelUnresolved
	GOSUB SymInsert
	ErrMain
ENDIF
TempInt=SymTable(SymNdx).Detail
IF SymTable(SymNdx).DataType<>LABEL THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+"call "+SymbolSaf+CHR$(OBQUOTE)+");"
GOSUB OutCode
GOTO MainLoop

OnX:
LNFlag=$ff
NeedComma=$00
JmpArgs=0
GOSUB NexToken
IF TokenBuf="error" THEN ON_ERROR
GOSUB UnDoToken
INC LabelNum
INC TableNum
GOSUB GetIntOp' get test integer
ErrMain
GOSUB NexToken
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
ChkArgs:
GOSUB NexToken
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
GOSUB TokenSym1
ErrMain
IF SymFound=0 THEN
	SymTemp.DataType=LABEL
	GOSUB ClrSym
	SymTemp.DataMod=0
	SymTemp.Detail=LabelUnresolved
	GOSUB SymInsert
	ErrMain
ENDIF
TempInt=SymTable(SymNdx).Detail
TDataType=SymTable(SymNdx).DataType
IF TDataType<>LABEL THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
INC JmpArgs
NeedComma=$ff
GOTO ChkArgs
MakSwitch:
SrcNdx=SrcNdxSaf
OutBuf="switch (_d0)"
GOSUB OutCode
OutBuf="{"
GOSUB OutCode
Ctr1=0
MakCase:
GOSUB NexToken
IF TokenLen=0 THEN
	OutBuf="}"
	GOSUB OutCode
	GOTO MainLoop
ENDIF
IF TokenBuf="," THEN MakCase
GOSUB TokenSym1
INC Ctr1
OutBuf="case "+STR$(Ctr1)+":"
GOSUB OutCode
IF ToSubFlag=0 THEN
	OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+"jmp "+SymTemp.SymName+CHR$(OBQUOTE)+");"
ELSE
	OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+"call "+SymTemp.SymName+CHR$(OBQUOTE)+");"
	GOSUB OutCode
	OutBuf="break;"
ENDIF
GOSUB OutCode
GOTO MakCase
ON_ERROR:
GOSUB NexToken
IF TokenLen=0 THEN' Turn off ON ERROR
	OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+"movl $_ErrExit,_ErrVec"+CHR$(OBQUOTE)+");"
	GenMain
	GOTO MainLoop
ENDIF
IF TokenBuf<>"goto" THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
ENDIF
GOSUB TokenSym
ErrMain
IF SymFound=0 THEN
	SymTemp.DataType=LABEL
	GOSUB ClrSym
	SymTemp.DataMod=0
	SymTemp.Detail=LabelUnresolved
	GOSUB SymInsert
	ErrMain
ENDIF
IF SymTable(SymNdx).DataType<>7 THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+"movl $"+SymTemp.SymName+",_ErrVec"+CHR$(OBQUOTE)+");"
GenMain
GOTO MainLoop

PrintX:
GOSUB DevChk
PrintFlag=$ff
IF DevFlag=$ff THEN
	PrtPthFlg=$ff
	GOSUB GetPthNum1
	ErrMain
	PrtPthFlg=0
ELSE
	OutBuf="_PrtPthNum=1;"
	GOSUB OutCode
ENDIF
GOSUB NexToken
IF TokenBuf="using" THEN PrtUsing
GOSUB UnDoToken
PrintLp:
GOSUB NexToken
IF TokenLen=0 THEN PrintEx
GOSUB UnDoToken
GOSUB Expr
ErrMain
IF TDataType=VOIDX THEN PrtArgSep
IF TabFlag=$ff THEN
	TabFlag=0
	GOTO PrtArgSep
ENDIF
IF TDataType<>STRING OR DMAddr=$ff THEN
	GOSUB MakString
	ErrMain
ENDIF
GOSUB ClassOp
OutBuf="_PrintStr(&"+TSymName+",_BufSize);"
GOSUB OutCode
GOSUB CallErr
GOSUB GenXfrCnt
PrtArgSep:
GOSUB NexToken
IF FileIO<>0 THEN
	GOSUB OutNewLine
	IF TokenBuf="," OR TokenBuf=";" THEN
		IF NextByte<>"" THEN PrintLp
	ENDIF
	GOTO PrintEx
ENDIF
IF TokenBuf="," THEN
	OutBuf="_PrintTab(0);"
	GOSUB OutCode
	GOSUB CallErr
	GOSUB GenXfrCnt
	IF NextByte="" THEN PrintEx
	GOTO PrintLp
ENDIF
IF TokenBuf=";" THEN
	IF NextByte="" THEN PrintEx
	GOTO PrintLp
ENDIF
PrintEx:
IF TokenBuf<>"," AND TokenBuf<>";" THEN
	IF FileIO=0 THEN
		GOSUB OutCRLF
	ENDIF
	OutBuf="POS=0;"
	GOSUB OutCode
ENDIF
GOTO MainLoop

PrtUsing:
GOSUB UnDoToken
GOSUB Expr
GOTO MainLoop

InputX:
GOSUB DevChk
IF DevFlag=$ff THEN
	GOSUB GetPthNum1
	ErrMain
ELSE
	OutBuf="_IOPthNum=0;"
	GOSUB OutCode
ENDIF
IF FileIO=0 THEN
	GOSUB NexToken
	GOSUB UnDoToken
	IF TokenType=TTypQuote THEN
		GOSUB Expr
		ErrMain
		OutBuf="STATUS=write(1,"+TSymName+"._Ptr,"+TSymName+"._Len);"
		GOSUB OutCode
		CommaMain
	ELSE
		OutBuf="STATUS=write(1,&_Prompt,1);"
		GOSUB OutCode
	ENDIF
	GOSUB CallErr
ENDIF
Target=$ff
LOOP
	GOSUB Expr
	ErrMain
	IF DMVector=0 THEN
		GOSUB Vectorize
		ErrMain
		GOSUB ClassOp
	ENDIF
	IF DMVector=$ff AND DMTemp=0 THEN
		GOSUB SetTmpVec
		ErrMain
	ENDIF
	OutBuf="_InpData(&"+TSymName+","+STR$(TDataType)+",_BufSize);"
	GOSUB OutCode
	GOSUB CallErr
	GOSUB GenXfrCnt
	GOSUB NexToken
	EXITIF TokenBuf<>","
ENDLOOP
IF FileIO=0 AND NewLine=$0d THEN
	GOSUB OutCRLF
ENDIF
GOTO MainLoop

ReadX:
NeedComma=0
GOSUB NexToken
IF TokenBuf="#" THEN FileRead' Path# read
SymTemp.SymName=TokenSaf
GOSUB SymSrch
IF SymFound=0 THEN
	ErrNo=ErrUDSym
	GOTO MainLoop
ENDIF
SymTemp=SymTable(SymNdx)
GOSUB UnDoToken
Target=$ff
ReadFlag=$ff
lbl8161:
IF NeedComma=$ff THEN
	GOSUB NexToken
	IF TokenLen=0 THEN MainLoop
	IF TokenBuf<>"," THEN
		ErrNo=ErrSyntax
		GOTO MainLoop
	ELSE
		NeedComma=0
	ENDIF
ENDIF
GOSUB GetExp
ErrMain
IF TokenLen=0 THEN MainLoop
GOSUB ProcExp
ErrMain
GOSUB ClassOp
GOSUB GetBase
IF TDataType=COMPVAR OR TDataType>6 THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
IF DMAddr=$ff THEN
	TDataType=LONG
ENDIF
IF TDataType=BOOLEAN THEN
	OutBuf="_ReadBool((long)_a0);"' Cast for ansi proto
	GOSUB OutCode
	GOTO lbl8164
ENDIF
IF TDataType=BYTE THEN
	OutBuf="_ReadByte((long)_a0);"' Cast for ansi proto
	GOSUB OutCode
	GOTO lbl8164
ENDIF
IF TDataType=SHORT THEN
	OutBuf="_ReadShort((long)_a0);"' Cast for ansi proto
	GOSUB OutCode
	GOTO lbl8164
ENDIF
IF TDataType=LONG THEN
	OutBuf="_ReadLong((long)_a0);"' Cast for ansi proto
	GOSUB OutCode
	GOTO lbl8164
ENDIF
IF TDataType=FLOAT THEN
	OutBuf="_ReadFlt((long)_a0);"' Cast for ansi proto
	GOSUB OutCode
	GOTO lbl8164
ENDIF
IF TDataType=STRING THEN
	OutBuf="_ReadStr((long)_a0,"+STR$(TDetail)+");"' Cast for ansi proto
	GOSUB OutCode
	GOTO lbl8164
ENDIF
lbl8164:
NeedComma=$ff
GOTO lbl8161
FileRead:
GOSUB UnDoToken
GOSUB ReadWrite
ErrMain
OutBuf="_DataPtr=_a0;"
GOSUB OutCode
OutBuf="_BlkCnt="+STR$(SymTemp.Detail)+";"
GOSUB OutCode
INC LabelNum' Start label
INC LabelNum' Finish label
INC LabelNum' Error label

OutBuf="_Lbl"+STR$(LabelNum-2)+":;"
GOSUB OutCode
OutBuf="STATUS=read(_IOPthNum,_IOBuffer,1);"
GOSUB OutCode
OutBuf="if (STATUS == -1) goto _Lbl"+STR$(LabelNum)+";"
GOSUB OutCode
OutBuf="if (STATUS == 0) goto _Lbl"+STR$(LabelNum-1)+";"
GOSUB OutCode
OutBuf="if (_IOBuffer[0] == _NewLine) goto _Lbl"+STR$(LabelNum-1)+";"
GOSUB OutCode
OutBuf="*_DataPtr=_IOBuffer[0];"
GOSUB OutCode
OutBuf="_DataPtr++;"
GOSUB OutCode
OutBuf="_BlkCnt--;"
GOSUB OutCode
OutBuf="if (_BlkCnt == 0) goto _Lbl"+STR$(LabelNum)+";"
GOSUB OutCode
OutBuf="goto _Lbl"+STR$(LabelNum-2)+";"
GOSUB OutCode
OutBuf="_Lbl"+STR$(LabelNum-1)+":;"
GOSUB OutCode
OutBuf="*_DataPtr=0;"
GOSUB OutCode
OutBuf="_Lbl"+STR$(LabelNum)+":;"
GOSUB OutCode
GOSUB CallErr

GOSUB GenXfrCnt
GOTO MainLoop

WriteX:
GOSUB ReadWrite
ErrMain
OutBuf="XferCount=_StrLen(&"+TSymName+");"
GOSUB OutCode
OutBuf="_XferAddr=_a0;"
GOSUB OutCode
GOSUB OutWrite
OutBuf="_XferAddr=&_NewLine;"
GOSUB OutCode
OutBuf="XferCount=1;"
GOSUB OutCode
GOSUB OutWrite
GOTO MainLoop

GetX:
GOSUB GetPut
ErrMain
GOSUB OutRead
GOTO MainLoop

PutX:
GOSUB GetPut
ErrMain
GOSUB OutWrite
GOTO MainLoop

EndX:
GOSUB NexToken
IF TokenLen<>0 THEN
	LastStmt=LastStmt+TokenBuf' prevents bug involving false 'end'
	IF TokenBuf="if" THEN EndIfX
	IF TokenBuf="loop" THEN EndLoopX
	IF TokenBuf="while" THEN EndWhileX
	IF TokenBuf="exit" THEN EndExitX
	IF TokenBuf="select" THEN EndSelectX
	IF TokenBuf="case" THEN EndCaseX
	ErrNo=ErrSyntax
	GOTO MainLoop
ENDIF
OutBuf="exit(0);"
GOSUB OutCode
GOTO MainLoop

CreateX:
CrOpFlag=$ff
Target=$ff
GOSUB GetPthNum
ErrMain
Target=0
GOSUB GetPthNam
ErrMain
ColonMain
GOSUB GetAccMod
OutBuf="STATUS=open(_IOBuffer,"+AccMode+","+CreatMode+");"
GOSUB OutCode
OutBuf=PathVar+"=STATUS;"
GOSUB OutCode
GOSUB CallErr
GOTO MainLoop

OpenX:
CrOpFlag=0
Target=$ff
GOSUB GetPthNum
ErrMain
Target=0
GOSUB GetPthNam
ErrMain
ColonMain
GOSUB GetAccMod
ErrMain
IF DirFlag=$ff THEN
	AccMode=AccMode+"|A_DIR"
ENDIF
OutBuf="STATUS=open(_IOBuffer,"+AccMode+");"
GOSUB OutCode
OutBuf=PathVar+"=STATUS;"
GOSUB OutCode
GOSUB CallErr
GOTO MainLoop

CloseX:
DiskIO=$ff
CloseLp:
GOSUB GetPthNum
ErrMain
OutBuf="STATUS=close(_IOPthNum);"
GOSUB OutCode
GOSUB CallErr
GOSUB NexToken
IF TokenLen=0 THEN MainLoop
IF TokenBuf<>"," THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
ENDIF
GOTO CloseLp

WhileX:
INC LabelNum
OutBuf="_Lbl"+STR$(LabelNum)+":;"
GOSUB OutCode
GOSUB CmpOps
ErrMain
IF TokenLen<>0 THEN' This test makes the 'DO' optional
	IF TokenBuf<>"do" THEN
		ErrNo=ErrSyntax
		GOTO MainLoop
	ENDIF
ENDIF
GOSUB IncConStk
ErrMain
CS(CSP).LoopLabel=LabelNum
CS(CSP).ContLabel=LabelNum' For consistancy with CONTINUE statement
INC LabelNum
CS(CSP).TermLabel=LabelNum
CS(CSP).ConType=1
CS(CSP).ConLine=BasicLineCtr
OutBuf="if (_True==0) goto _Lbl"+STR$(LabelNum)+";"
GOSUB OutCode
GOTO MainLoop

EndWhileX:
TempInt=1
GOSUB CSChk
ErrMain
OutBuf="goto _Lbl"+STR$(CS(CSP).LoopLabel)+";"
GOSUB OutCode
OutBuf="_Lbl"+STR$(CS(CSP).TermLabel)+":;"
GOSUB OutCode
DEC CSP
GOTO MainLoop

NextX:
IF CSP=0 THEN
	ErrNo=ErrUBCon
	GOTO MainLoop
ENDIF
GOSUB NexToken
IF TokenLen=0 THEN
	TokenSaf=CS(CSP).LoopName
ENDIF
IF TokenSaf<>CS(CSP).LoopName THEN
	ErrNo=ErrUBCon
	GOTO MainLoop
ENDIF
TempInt=5
OutBuf="_Lbl"+STR$(CS(CSP).ContLabel)+":;"
GOSUB OutCode
GOSUB CSChk
ErrMain
' add "step" to loop var
IF CS(CSP).NoStep=$ff THEN
	OutBuf=CS(CSP).LoopName+"++;"
	GOSUB OutCode
ELSE
	IF CS(CSP).ImmStep=0 THEN
		OutBuf=CS(CSP).LoopName+"="+CS(CSP).LoopName+"+_LopVec"+STR$(CS(CSP).LoopVec)+"._Step;"
		GOSUB OutCode
	ELSE
		OutBuf=CS(CSP).LoopName+"="+CS(CSP).LoopName+"+"+CS(CSP).ImmStepVal+";"
		GOSUB OutCode
	ENDIF
ENDIF
' branch back to loop beginning
OutBuf="goto _Lbl"+STR$(CS(CSP).LoopLabel)+";"
GOSUB OutCode
' generate done label
OutBuf="_Lbl"+STR$(CS(CSP).TermLabel)+":;"
GOSUB OutCode
DEC CSP
GOTO MainLoop

RemX:
GOTO MainLoop

ElseX:
GOSUB NexToken'  make sure nothing follows
IF TokenLen<>0 THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
ENDIF
TempInt=0
GOSUB CSChk
ErrMain
INC LabelNum
OutBuf="goto _Lbl"+STR$(LabelNum)+";"
GOSUB OutCode
OutBuf="_Lbl"+STR$(CS(CSP).TermLabel)+":;"
GOSUB OutCode
CS(CSP).TermLabel=LabelNum
GOTO MainLoop

EndIfX:
TempInt=0
GOSUB CSChk
ErrMain
OutBuf="_Lbl"+STR$(CS(CSP).TermLabel)+":;"
GOSUB OutCode
DEC CSP
GOTO MainLoop

DeleteX:
GOSUB GetPthNam
ErrMain
OutBuf="STATUS=unlink(_IOBuffer);"
GOSUB OutCode
GOSUB CallErr
GOTO MainLoop

BufferX:
GOSUB TokenSym
ErrMain
BufName=SymTemp.SymName
IF SymFound=0 THEN
	OutBuf=""
	GenVar
	Comment="Memory Buffer"
	GOSUB BldComment
	GenVar
	GOSUB ClrSym
	SymTemp.DataMod=0
	SymTemp.DataType=BUFFER
	SymTemp.DataSize=8
	GOSUB SymInsert
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
GOSUB Expr
IF DMConst=$ff AND TSymName="0x0" THEN
	OutBuf="free("+BufName+"._BufPtr);"
	GOSUB OutCode
ELSE
	IF TSymName<>"~" THEN
		D0Loaded=0
		GOSUB LoadReg
		ErrMain
	ENDIF
	OutBuf=BufName+"._BufSiz=_d0;"
	GOSUB OutCode
	OutBuf="(long)"+BufName+"._BufPtr=malloc(_d0);"
	GOSUB OutCode
	OutBuf="if ((long)"+BufName+"._BufPtr == 0) "+BufName+"._BufSiz=0;"
	GOSUB OutCode
ENDIF
GOTO MainLoop

LoopX:
GOSUB IncConStk
ErrMain
GOSUB NexToken
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
	GOSUB GetIntOp
	ErrMain
	OutBuf="_LoopCtr["+STR$(LopCtrNum)+"]=_d0;"
	GOSUB OutCode
	CS(CSP).ConType=4
ENDIF
CS(CSP).ConLine=BasicLineCtr
INC LabelNum
OutBuf="_Lbl"+STR$(LabelNum)+":;"
GOSUB OutCode
CS(CSP).LoopLabel=LabelNum
CS(CSP).ContLabel=LabelNum' For consistancy with CONTINUE statement
INC LabelNum
CS(CSP).TermLabel=LabelNum
GOTO MainLoop

EndLoopX:
TempInt=3
GOSUB CSChk
IF ErrNo<>0 THEN
	ErrNo=0
	TempInt=4
	GOSUB CSChk
	ErrMain
ENDIF
IF TempInt=3 THEN
	OutBuf="goto _Lbl"+STR$(CS(CSP).LoopLabel)+";"
ELSE
	OutBuf="_LoopCtr["+STR$(LopCtrNum)+"]--;"
	GOSUB OutCode
	OutBuf="if (_LoopCtr["+STR$(LopCtrNum)+"] !=0) goto _Lbl"+STR$(CS(CSP).LoopLabel)+";"
	DEC LopCtrNum
ENDIF
GOSUB OutCode
OutBuf="_Lbl"+STR$(CS(CSP).TermLabel)+":;"
GOSUB OutCode
DEC CSP
GOTO MainLoop

RepeatX:
GOSUB IncConStk
ErrMain
INC LabelNum
OutBuf="_Lbl"+STR$(LabelNum)+":;"
GOSUB OutCode
CS(CSP).LoopLabel=LabelNum
CS(CSP).ConLine=BasicLineCtr
CS(CSP).ConType=2
INC LabelNum
CS(CSP).ContLabel=LabelNum
INC LabelNum
CS(CSP).TermLabel=LabelNum
GOTO MainLoop

UntilX:
TempInt=2
GOSUB CSChk
ErrMain
OutBuf="_Lbl"+STR$(CS(CSP).ContLabel)+":;"
GOSUB OutCode
GOSUB CmpOps
ErrMain
IF TokenLen<>0 THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
ENDIF
OutBuf="if (_True==0) goto _Lbl"+STR$(CS(CSP).LoopLabel)+";"
GOSUB OutCode
OutBuf="_Lbl"+STR$(CS(CSP).TermLabel)+":;"
GOSUB OutCode
DEC CSP
GOTO MainLoop

ExitIfX:
GOSUB CmpOps
ErrMain
IF CSP<1 THEN
	ErrNo=ErrUBCon
	GOTO MainLoop
ENDIF
IF TokenLen=0 THEN
	OutBuf="if (_True) goto _Lbl"+STR$(CS(CSP).TermLabel)+";"
	GOSUB OutCode
	GOTO MainLoop
ENDIF
IF TokenBuf<>"then" THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
ENDIF
GOSUB NexToken
IF TokenLen<>0 THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
ENDIF
GOSUB IncConStk
ErrMain
INC LabelNum
CS(CSP).TermLabel=LabelNum
CS(CSP).ConLine=BasicLineCtr
CS(CSP).ConType=6
OutBuf="if (_True==0) goto _Lbl"+STR$(LabelNum)+";"
GOSUB OutCode
GOTO MainLoop

ShellX:
GOSUB Expr
IF TDataType<>STRING THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
OutBuf="_MovStr(&_IOBufVec,&"+TSymName+");"
GOSUB OutCode
OutBuf="system(_IOBuffer);"
GOSUB OutCode
GOTO MainLoop

FPrintX:
FileIO=$ff
GOTO PrintX

FInputX:
FileIO=$ff
GOTO InputX

BaseX:
GOSUB NexToken
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

IncX:
DecInc="++"
INCx1:
Target=$ff
GOSUB Expr
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
	IF LAND(VectorBit,TDataMod)=VectorBit THEN
		OutBuf="(*(("+_DataType+"*)"+SymTemp.SymName+"._Ptr))"+DecInc+";"
	ELSE
		OutBuf=SymTemp.SymName+DecInc+";"
	ENDIF
ELSE
	GOSUB GetVarSiz
	IF LAND(VectorBit,TDataMod)=VectorBit THEN
		OutBuf="(long)"+SymTemp.SymName+"._Ptr=(long)"+SymTemp.SymName+"._Ptr"+LEFT$(DecInc,1)+STR$(VarSize)+";"
		GOSUB OutCode
		OutBuf="*((long*)_a0)=(long)"+SymTemp.SymName+"._Ptr;"
	ELSE
		OutBuf=SymTemp.SymName+"="+SymTemp.SymName+LEFT$(DecInc,1)+STR$(VarSize)+";"
	ENDIF
ENDIF
GOSUB OutCode
GOTO MainLoop

DecX:
DecInc="--"
GOTO INCx1

BufReadX:
GOSUB BufRW
ErrMain
GOSUB OutRead
GOTO MainLoop

BufWriteX:
GOSUB BufRW
ErrMain
GOSUB OutWrite
GOTO MainLoop

DecimalsX:
DigDec=0
Decimals1:
GOSUB GetIntOp
ErrMain
IF DigDec=0 THEN
	OutBuf="_Decimals=_d0;"
ELSE
	OutBuf="_Digits=_d0;"
ENDIF
GOSUB OutCode
GOTO MainLoop

ExchangeX:
Target=$ff
GOSUB Expr
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
GOSUB Expr
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
	GOSUB LoadReg
	ErrMain
	SymTemp.SymName=Op2Name
	GOSUB LoadReg
	ErrMain
	TempStr=Op1Name
	Op1Name=Op2Name
	Op2Name=TempStr
	GOSUB StoreD0
	ErrMain
	OutBuf="_d0=_d1;"
	GOSUB OutCode
	Op1Name=Op2Name
	GOSUB StoreD0
	GOTO MainLoop
ENDIF
IF Op1Class=CPXClass OR Op1Class=ARRClass OR Op1Type=STRING THEN
	IF LAND(Op1Mod,VectorBit)=0 THEN
		OutBuf="_DestAddr="+Op1Name+";"
	ELSE
		OutBuf="_DestAddr="+Op1Name+"._Ptr;"
	ENDIF
	GOSUB OutCode
	IF LAND(Op2Mod,VectorBit)=0 THEN
		OutBuf="_SrcAddr="+Op2Name+";"
	ELSE
		OutBuf="_SrcAddr="+Op2Name+"._Ptr;"
	ENDIF
	GOSUB OutCode
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
	GOSUB OutCode
	OutBuf="while (_BlkCnt)"
	GOSUB OutCode
	OutBuf="{"
	GOSUB OutCode
	OutBuf="_True=*((unsigned char*)_DestAddr);"
	GOSUB OutCode
	OutBuf="*((unsigned char*)_DestAddr)=*((unsigned char*)_SrcAddr);"
	GOSUB OutCode
	OutBuf="*((unsigned char*)_SrcAddr)=_True;"
	GOSUB OutCode
	OutBuf="(long)_DestAddr=(long)_DestAddr+1;"
	GOSUB OutCode
	OutBuf="(long)_SrcAddr=(long)_SrcAddr+1;"
	GOSUB OutCode	
	OutBuf="_BlkCnt--;"
	GOSUB OutCode
	OutBuf="}"
	GOSUB OutCode
	GOTO MainLoop	
ENDIF
ErrNo=ErrIVType
GOTO MainLoop

Vacant1X:
GOTO MainLoop

EndExitX:
TempInt=6
GOSUB CSChk
ErrMain
OutBuf="goto _Lbl"+STR$(CS(CSP-1).TermLabel)+";"
GOSUB OutCode
OutBuf="_Lbl"+STR$(CS(CSP).TermLabel)+":;"
GOSUB OutCode
DEC CSP
GOTO MainLoop

TableX:
GOSUB NexToken
TableName=TokenSaf
SymTemp.SymName=TokenSaf
GOSUB SymSrch
IF SymFound=0 THEN
	ErrNo=ErrUDSym
	GOTO MainLoop
ENDIF
IF LAND(SymTable(SymNdx).DataMod,ArrayBit)=0 THEN
	ErrNo=ErrTblArr
	GOTO MainLoop
ENDIF
TableNdx=SymNdx
TableTypeNdx=SymTable(SymNdx).Detail
IF SymTable(TableNdx).DataType=COMPLEX THEN
	TableTypeNdx=SymTable(TableNdx).Detail
	TableElements=SymTable(TableTypeNdx).Detail
ELSE
	TableElements=1
ENDIF
TableCounter=0
NeedComma=0
LOOP
	GOSUB MainLoopInit
	GOSUB ReadSource
	SrcLineCpy=SrcLine
	TempStr=LCASE$(SrcLine)
	IF TempInt=0 THEN
		PRINT "FATAL ERROR: EOF in table"
		END
	ENDIF
	IF LEFT$(TempStr,5)="table" THEN
		SrcLine=SrcLineCpy
		ErrNo=ErrTblTbl
		GOTO MainLoop
	ENDIF
	IF InpFilPtr=1 THEN
		INC BasicLineCtr
	ENDIF
	IF LEN(SrcLine)=0 THEN NullTableEntry
	IF LEFT$(TempStr,8)="endtable" OR LEFT$(TempStr,9)="end table" THEN
		GOTO MainLoop
	ENDIF
	IF TableElements=1 THEN' Not COMPLEX, just ARRAY
		GOSUB NexToken
		SrcLine=TableName+"("+STR$(TableCounter+ArrayBase)+")="+TokenSaf
		SrcNdx=0
		GOSUB Let
		SrcLine=SrcLineCpy
		ErrMain				
	ELSE
		CommaCounter=0
		FOR I=1 TO LEN(SrcLine)
			IF MID$(SrcLine,I,1)="," THEN
				INC CommaCounter
				MID$(SrcLine,I,1)=" "
			ENDIF
		NEXT I
		SrcLineSaf=SrcLine
		IF CommaCounter<>TableElements-1 THEN
			ErrNo=ErrTblArgs
			SrcLine=SrcLineCpy
			GOTO MainLoop
		ENDIF
		SrcNdxCpy=0
		FOR J=1 TO TableElements
			SrcLine=SrcLineSaf
			SrcNdx=SrcNdxCpy
			GOSUB NexToken
			SrcNdxCpy=SrcNdx
			SrcLine=TableName+"("+STR$(TableCounter+ArrayBase)+")."+SymTable(TableTypeNdx+J).SymName+"="+TokenSaf						
			SrcNdx=0
			GOSUB MainLoopInit
			GOSUB Let
			IF ErrNo<>0 THEN
				SrcLine=SrcLineCpy
				GOTO MainLoop
			ENDIF	
		NEXT J			
	ENDIF
	INC TableCounter
NullTableEntry:
ENDLOOP

EndTableX:
ErrNo=ErrEndTbl
GOTO MainLoop

SetVecX:
GOSUB TokenSym
ErrMain
IF SymFound=0 THEN
	ErrNo=ErrUDSym
	GOTO MainLoop
ENDIF
VectorName=SymTemp.SymName
IF SymTable(SymNdx).DataType=STRING THEN
	VDetail=SymTable(SymNdx).Detail
ELSE
	VDetail=0
ENDIF
TDataMod=SymTable(SymNdx).DataMod
IF LAND(TDataMod,VectorBit)=0 THEN' Not a vector
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
EqualMain
GOSUB GetIntOp
ErrMain
OutBuf="(long)"+VectorName+"._Ptr=_d0;"
GOSUB OutCode
IF VDetail<>0 THEN'  must be STRING.. do rest of vector
	GOSUB NexToken
	IF TokenLen=0 THEN
		OutBuf=VectorName+"._Len="+STR$(VDetail)+";"
	ELSE
		IF TokenBuf<>"," THEN
			ErrNo=ErrSyntax
			GOTO MainLoop
		ENDIF
		GOSUB GetIntOp
		ErrMain
		OutBuf=VectorName+"._Len=_d0;"
	ENDIF
	GOSUB OutCode
	OutBuf="(long)"+VectorName+"._Lnk=0;"
	GOSUB OutCode
ENDIF
GOTO MainLoop

DigitsX:
DigDec=$ff
GOTO Decimals1

MacroX:
GOTO MACRODx

EndMacroX:
ErrNo=ErrEndm
GOTO MainLoop

Vacant2X:
GOTO MainLoop

Vacant3X:
GOTO MainLoop

IncludeX:
UseFilNam=""
UseLoop:
GOSUB NexToken
IF TokenLen=0 THEN Include1
UseFilNam=UseFilNam+TokenSaf
GOTO UseLoop
Include1:
ON ERROR GOTO NoUseFile
INC InpFilPtr
IF InpFilPtr>20 THEN
	PRINT "FATAL ERROR Use Stack OverFlow"
	END
ENDIF
OPEN #InpFile(InpFilPtr),UseFilNam:READ
ON ERROR
GOTO MainLoop
NoUseFile:
PRINT  "Cannot open file: ";UseFilNam
END

FreezeX:
GOTO FIXDx

LibraryX:
FOR Ctr1=5 TO LEN(SrcLine)
	IF MID$(SrcLine,Ctr1,1)="-" THEN
		LibList=LibList+" "
	ENDIF
	LibList=LibList+MID$(SrcLine,Ctr1,1)
NEXT Ctr1
GOTO MainLoop
 
Vacant4X:
GOTO MainLoop

Vacant5X:
GOTO MainLoop

Vacant6X:
GOTO MainLoop

Vacant7X:
GOTO MainLoop

Vacant8X:
GOTO MainLoop

Vacant9X:
GOTO MainLoop

RandomizeX:
GOSUB NexToken
IF TokenLen<>0 THEN
	GOSUB UnDoToken
	GOSUB GetIntOp
	ErrMain
	OutBuf="srand(_d0);"
ELSE
	OutBuf="srand(time(NULL)/2);"
ENDIF
GOSUB OutCode
GOTO MainLoop

Vacant10X:
GOTO MainLoop

Vacant11X:
GOTO MainLoop

Vacant12X:
GOTO MainLoop

ExitX:
GOSUB NexToken
IF TokenBuf="if" THEN ExitIfX
ErrNo=ErrSyntax
GOTO MainLoop

WendX:
GOTO EndWhileX' Turn into ENDWHILE

ContinueX:
GOSUB NexToken
IF TokenBuf<>"if" THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
ENDIF
IF CSP<1 THEN
	ErrNo=ErrUBCon
	GOTO MainLoop
ENDIF
TempInt=CS(CSP).ConType
IF TempInt<0 OR TempInt>5 THEN' Only for FOR/NEXT, LOOP/ENDLOOP, REPEAT/UNTIL/, WHILE/ENDWHILE
	ErrNo=ErrUBCon
	GOTO MainLoop
ENDIF
GOSUB CmpOps
OutBuf="if (_True) goto _Lbl"+STR$(CS(CSP).ContLabel)+";"
GOSUB OutCode
GOTO MainLoop

SelectX:
IF SelectFlag<>0 THEN
	ErrNo=ErrUBCon
	GOTO MainLoop
ENDIF
SelectFlag=$ff
GOSUB NexToken
IF TokenBuf<>"case" THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
ENDIF
GOSUB Expr
ErrMain
IF OpClass<>STRClass AND OpClass<>INTClass THEN
	ErrNo=ErrIVType
	GOTO MainLoop
ENDIF
IF OpClass=INTClass AND TSymName<>"~" THEN
	D0Loaded=0
	GOSUB LoadReg
	ErrMain
ENDIF
SwitchClass=OpClass
IF OpClass=INTClass THEN
	OutBuf="_SwitchInt=_d0;"
ELSE
	 OutBuf="_SwitchStr="+TSymName+";"
ENDIF
GOSUB OutCode
GOSUB IncConStk
ErrMain
CS(CSP).ConLine=BasicLineCtr
CS(CSP).ConType=7
INC LabelNum
CS(CSP).TermLabel=LabelNum	
GOTO MainLoop

EndSelectX:
IF SelectFlag=0 THEN
	ErrNo=ErrUBCon
	GOTO MainLoop
ENDIF
IF CaseFlag<>0 THEN
	GOSUB EndCasex
	CaseFlag=0
ENDIF
SelectFlag=0
CaseElseFlag=0
TempInt=7
GOSUB CSChk
ErrMain
OutBuf="_Lbl"+STR$(CS(CSP).TermLabel)+":;"
GOSUB OutCode
DEC CSP
GOTO MainLoop 

CaseX:
IF SelectFlag=0 OR CaseElseFlag<>0 THEN
	ErrNo=ErrUBCon
	GOTO MainLoop
ENDIF
IF CaseFlag<>0 THEN
	GOSUB EndCasex
ENDIF
CaseFlag=$ff
INC LabelNum
CS(CSP).ConLine=BasicLineCtr
CS(CSP).ConType=7
CS(CSP).ContLabel=LabelNum
GOSUB NexToken
IF TokenBuf="else" THEN
	CaseElseFlag=$ff
ELSE
	GOSUB UnDoToken
	GOSUB Expr
	ErrMain
	IF OpClass<>STRClass AND OpClass<>INTClass THEN
		ErrNo=ErrIVType
		GOTO MainLoop
	ENDIF
	IF OpClass=INTClass AND TSymName<>"~" THEN
		D0Loaded=0
		GOSUB LoadReg
		ErrMain
	ENDIF
	IF OpClass<>SwitchClass THEN
		ErrNo=ErrTypMis
		GOTO MainLoop
	ENDIF
	CaseToFlag=0
	GOSUB NexToken
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
		GOSUB GenCase
	ELSE
		SymType="<"
		GOSUB GenCase
		REM Get second arg here
		D0Loaded=0
		GOSUB Expr
		ErrMain
		IF OpClass<>STRClass AND OpClass<>INTClass THEN
			ErrNo=ErrIVType
			GOTO MainLoop
		ENDIF
		IF OpClass=INTClass AND TSymName<>"~" THEN
			D0Loaded=0
			GOSUB LoadReg
			ErrMain
		ENDIF
		IF OpClass<>SwitchClass THEN
			ErrNo=ErrTypMis
			GOTO MainLoop
		ENDIF
		SymType=">"
		GOSUB GenCase 	
	ENDIF
ENDIF	
GOTO MainLoop

EndCaseX:
IF SelectFlag=0 OR CaseFlag=0 THEN
	ErrNo=ErrUBCon
	GOTO MainLoop
ENDIF
CaseFlag=0
GOSUB EndCasex
GOTO MainLoop

ConstX:
GOTO SETDx

SwapX:
GOTO ExchangeX

ProgramX:
StartFlag=$ff
GOTO MainLoop

HexOutX:
GOSUB NexToken
IF TokenBuf="=" THEN
	GOSUB NexToken
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

MakeLowerX:
GOSUB Expr
IF OpClass<>STRClass THEN
	ErrNo=ErrIVType
	GOTO MainLoop
ENDIF
OutBuf="_LCase(&"+TSymName+");"
GOSUB OutCode
GOTO MainLoop

MakeUpperX:
GOSUB Expr
IF OpClass<>STRClass THEN
	ErrNo=ErrIVType
	GOTO MainLoop
ENDIF
OutBuf="_UCase(&"+TSymName+");"
GOSUB OutCode
GOTO MainLoop

FillX:
GOSUB GetIntOp' get addr
ErrMain
OutBuf="(long)_Poker=_d0;"
GOSUB OutCode
CommaMain
GOSUB GetIntOp' get count
ErrMain
OutBuf="_ArgSafe0=_d0;"
GOSUB OutCode
GOSUB NexToken
IF TokenLen=0 THEN
	OutBuf="_d0=0"
	GOSUB OutCode
ELSE
	IF TokenBuf<>"," THEN
		ErrNo=ErrSyntax
		GOTO MainLoop
	ENDIF
	GOSUB GetIntOp' get data
	ErrMain
ENDIF
OutBuf="while (_ArgSafe0){"
GOSUB OutCode
OutBuf="*_Poker=_d0;"
GOSUB OutCode
OutBuf="_Poker++;"
GOSUB OutCode
OutBuf="_ArgSafe0--;}"
GOSUB OutCode
GOTO MainLoop

InitX:
GOSUB Expr
IF TDataType<>BUFFER THEN
	IF TDataType<1 OR TDataType>6 THEN
		IF TDataType<>COMPLEX THEN
			ErrNo=ErrIVType
			GOTO MainLoop
		ENDIF
	ENDIF
	GOSUB GetBase
	OutBuf="(long)_Poker=_a0;"
	GOSUB OutCode 
	OutBuf="_ArgSafe0="+STR$(TDataSize)+";"
	GOSUB OutCode	
ELSE
	OutBuf="(long)_Poker=(long)"+TSymName+"._BufPtr;"
	GOSUB OutCode
	OutBuf="_ArgSafe0="+TSymName+"._BufSiz;"
	GOSUB OutCode
ENDIF 
GOSUB NexToken
IF TokenLen=0 THEN
	OutBuf="_d0=0;"
	GOSUB OutCode
ELSE
	IF TokenBuf<>"," THEN
		ErrNo=ErrSyntax
		GOTO MainLoop
	ENDIF
	GOSUB GetIntOp' get data
	ErrMain
ENDIF
OutBuf="while (_ArgSafe0){"
GOSUB OutCode
OutBuf="*_Poker=_d0;"
GOSUB OutCode
OutBuf="_Poker++;"
GOSUB OutCode
OutBuf="_ArgSafe0--;}"
GOSUB OutCode
GOTO MainLoop

SetBufAdrX:
GOSUB TokenSym
ErrMain
BufName=SymTemp.SymName
IF SymFound=0 THEN
	OutBuf=""
	GenVar
	Comment="Memory Buffer"
	GOSUB BldComment
	GenVar
	GOSUB ClrSym
	SymTemp.DataMod=0
	SymTemp.DataType=BUFFER
	SymTemp.DataSize=8
	GOSUB SymInsert
	ErrMain
	OutBuf="_buffer "+BufName+";"
	GenVar
ENDIF
IF SymTemp.DataType<>BUFFER THEN' Not a buffer
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
EqualMain
GOSUB GetIntOp
ErrMain
OutBuf="(long)"+BufName+"._BufPtr=_d0;"
GOSUB OutCode
GOTO MainLoop

ErrorTbl: DATA "Undefined symbol"'  ErrUDSym
DATA "Invalid symbol name"'  ErrIVSNam
DATA "Type mismatch or wrong type"'  ErrTypMis
DATA "Invalid Expression"'  ErrIVExp
DATA "Syntax Error"'  ErrSyntax
DATA "Symbol already defined"'  ErrDupSym
DATA "Symbol table full"'  ErrSymFul
DATA "Undefined Function"'  ErrUDFcn
DATA "Invalid data type"'  ErrIVType
DATA "Invalid data type modifier"'  ErrIVMod
DATA "Macro argument error"'  ErrMacArg
DATA "Invalid directive"'  ErrIVDir
DATA "Macro already defined"'  ErrDupMac
DATA "ENDTYPE without TYPE"'  ErrEndStr
DATA "Nested macro"'  ErrMacNst
DATA "Macro buffer full"'  ErrMacBuf
DATA "Invalid macro"'  ErrIVMac
DATA "ENDM without MACRO"'  ErrEndm
DATA "Unbalanced control structure"'  ErrUBCon
DATA "Nested too deep"'  ErrNDeep
DATA "Illegal Declaration inside Function or Subroutine"'  ErrDecFcn
DATA "Invalid parameter"'  ErrIVParm
DATA "Parameter Statement out of Place"'  ErrErrParm
DATA "Expression too complex"'  ErrCpxExp
DATA "Invalid function"'  ErrIVFunc
DATA "No more temps available"'  ErrTmpUse
DATA "Unbalanced parens"'  ErrParen
DATA "Function error"'  ErrFcn
DATA "Invalid target"'  ErrIVTarg
DATA "Function/Subroutine nested"'  ErrFSNest
DATA "Table operand is not array"'  ErrTabArr
DATA "ERROR Trap in subroutine or function"'  ErrERRTrp
DATA "Array subscript error"'  ErrArrSub
DATA "Table declaration inside table"' ErrTblTbl
DATA "ENDTABLE without TABLE"' ErrEndTbl
DATA "Wrong number of args in table"'ErrTblArgs

RunVars: DATA 0,""
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
DATA 1,"void *_XferAddr;"
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
DATA 1,"unsigned char _PrtPthNum;"
DATA 1,"short _SafeZone;"
DATA 1,"long _IOBufPtr;"
DATA 1,"_vector _IOBufVec;"
DATA 1,"long ErrVec;"
DATA 1,"long POS;"
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

PreDefTbl: DATA "{",OPER,0,0,0,0
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
DATA "chkword",FCN,0,47,0,0
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
DATA "Vacant",0,0,0,0,0
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
DATA "Vacant",FCN,0,61,0,0
DATA "Vacant",FCN,0,62,0,0
DATA "Vacant",FCN,0,63,0,0
DATA "Vacantx",FCN,0,64,0,0
DATA "Vacant",FCN,0,65,0,0
DATA "Vacant",FCN,0,66,0,0
DATA "Vacant",FCN,0,67,0,0
DATA "Vacant",FCN,0,68,0,0
DATA "Vacant",FCN,0,69,0,0
DATA "Vacant",FCN,0,70,0,0
DATA "rnd",FCN,0,71,0,0
DATA "Vacant",FCN,0,72,0,0
DATA "Vacant",FCN,0,73,0,0
DATA "Vacant",FCN,0,74,0,0
DATA "Vacant",FCN,0,75,0,0
DATA "Vacant",FCN,0,76,0,0
DATA "lcase_Str",FCN,0,77,0,0
DATA "ucase_Str",FCN,0,78,0,0
DATA "tail_Str",FCN,0,79,0,0
DATA "findaddr",FCN,0,80,0,0
DATA "findoffs",FCN,0,81,0,0
DATA "ProgramName",STRING,0,28,0,28
DATA "%"


Finish:
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
	OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+"_ErrExit:"+CHR$(OBQUOTE)+");"
	GenMain
	OutBuf="puts("+CHR$(OBQUOTE)+"Error Exit"+CHR$(OBQUOTE)+");"
	GenMain	
	OutBuf="exit(errno);"
	GenMain
ENDIF
OutBuf="}"
GenMain
CLOSE #CodeFile
CLOSE #VarFile
ON ERROR GOTO NoCFile
DELETE FileName+".c"
NoCFile:
ON ERROR
'******
PRINT  BasicLineCtr;" OmniBasic lines compiled to ";CLineCtr;" C lines"
PRINT 
TFileName=FileName+".c"
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
IF ObjectMode=0 THEN
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
CLOSE #OutFile
'******
FOR Ctr1=1 TO SymTabSiz
	IF SymTable(Ctr1).DataType=LABEL THEN
		IF SymTable(Ctr1).Detail=LabelUnresolved THEN
			INC ErrCnt
			PRINT "Label ";SymTable(Ctr1).SymName;" unresolved"
		ENDIF
	ENDIF
NEXT Ctr1
lbl9999:
	IF CSP<>0 THEN
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
		IF VerbFlag<>0 THEN
			VerbCmd=" -v"
		ENDIF
		CompileCmd="gcc "
		StdLib=" basic.a"
		IF AsmbFlag=0 THEN
			AsmbCmd=""
		ELSE
			AsmbCmd=" -S "
		END IF
		IF ObjectMode=0 THEN
			ObjectCmd=""
		ELSE
			ObjectCmd=" -c "
		END IF
		IF AsmbFlag+COut+ObjectMode=0 THEN
			LinkerOut=" -o "+FileName
			LinkerOut=LinkerOut+".exe"
		ENDIF
		IF ObjectMode=$ff OR AsmbFlag=$ff THEN
			StdLib=""
		ENDIF
		OptionCmd=AsmbCmd+ObjectCmd
		IF DbgFlag=0 THEN' NOT -g option
			LinkerOpt=LinkerOpt+" -s"
		ENDIF
		TempStr=CompileCmd+FileName+".c "+OptionCmd+LibList+StdLib+LinkerOut+LinkerOpt+VerbCmd
		IF VerbFlag<>0 THEN
			PRINT TempStr
		ENDIF
		SHELL TempStr
	ENDIF
ENDIF
IF COut=0 OR NoGen=$ff THEN
	DELETE FileName+".c"
ENDIF
IF UDump=$ff THEN
	Fmt=">>>> ^^^^^^^^^^^^^^^^^^^^^^^ >> >>>> >>>>>>>> >>>>>>>> >>>>>>>>"
	PRINT
	PRINT "Symbol Table:"
	PRINT
	PRINT USING(Fmt,"Sym#","Symbol Name","DT","DM","Detail","DataAddr","DataSize","Link")
	PRINT
	FOR Ctr3=1 TO LastSym
		TempStr="......................."
		TSymName=SymTable(Ctr3).SymName
		IF TSymName<>"%" THEN
			LEFT$(TempStr,LEN(TSymName))=TSymName
			TDataType=SymTable(Ctr3).DataType
			TDataMod=SymTable(Ctr3).DataMod
			TDetail=SymTable(Ctr3).Detail
			TDataAddr=SymTable(Ctr3).DataAddr
			TDataSize=SymTable(Ctr3).DataSize
			PRINT USING(Fmt,ZSTR$(Ctr3),TempStr,ZHEX$(TDataType),ZHEX$(TDataMod),ZHEX$(TDetail),ZHEX$(TDataAddr),ZHEX$(TDataSize))
		ENDIF
	NEXT Ctr3
ENDIF
IF DumpSyms=$ff THEN
	PRINT "Symbol Table:"
	FOR Ctr1=UserSym TO LastSym
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
NoInpFile:
PRINT  "Cannot open file: ";FileName
END
Help:
PRINT  "ob file [opts] {CompVar=Const}"
PRINT  "Options:"
PRINT  "    -a        Compile to assembler (.a or .s file)"
PRINT  "    -c        Compile to C code (.c file)"
PRINT  "    -d        Compile to DLL"
PRINT  "    -e        Compile with no output but check for errors"
PRINT  "    -h        Halt Compile on first error encountered"
PRINT  "    -o        Compile to Object file"
PRINT  "    -g        Generate symbol module for debugger"
PRINT  "    -p        Prompt for 'hit any key' to continue"
PRINT  "    -s        Symbol Table Dump to stdout"
PRINT  "    -u        Unabridged symbol table dump"
PRINT  "    -v        Verbose (detailed reporting of progress)"

END

'***** Subroutine Section ******


DimVar:
TDataMod=LAND(MemberBit,TypeFlag)
GOSUB ClrDatTyp
ExtVarFlg=0
VectorFlg=0
MultiFlag=0
DimOK=0
DimFlag=$ff
TDataType=COMPVAR
TDataSize=1
ArraySize=1
GOSUB ClrSym
GOSUB TokenSym
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
GOSUB NexToken
IF TokenBuf<>":" AND TokenBuf<>"as" THEN
	ErrNo=ErrSyntax
	RETURN
ENDIF
GOSUB NexToken
IF TokenLen=0 THEN
	ErrNo=ErrSyntax
	RETURN
ENDIF
IF TokenBuf="boolean" THEN
	DTBoolean=$ff
	TDataType=BOOLEAN
	SymType="unsigned char "
	TDataSize=1
	GOTO DimVar1
ENDIF
IF TokenBuf="byte" THEN
	DTByte=$ff
	TDataType=BYTE
	SymType="unsigned char "
	TDataSize=1
	GOTO DimVar1
ENDIF
IF TokenBuf="integer" THEN
	DTShort=$ff
	TDataType=SHORT
	SymType="unsigned short "
	TDataSize=2
	GOTO DimVar1
ENDIF
IF TokenBuf="long" THEN
	DTLong=$ff
	TDataType=LONG
	SymType="long "
	TDataSize=4
	GOTO DimVar1
ENDIF
IF TokenBuf="label" THEN
	DTLong=$ff
	TDataType=LABELVAR
	SymType="long "
	TDataSize=4
	GOTO DimVar1
ENDIF
IF TokenBuf="double" THEN
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
	IF NextByte<>"*" THEN
		TempInt=255' Default string size
	ELSE
		GOSUB NexToken' Eat '*'
		GOSUB NexToken
		TempStr=TokenSaf
		GOSUB StrSiz
		ErrRet
	ENDIF
	SymTemp.Detail=TempInt
	TDataSize=TempInt
	GOTO DimVar1
ENDIF
TSymName=SymTemp.SymName
TypePtr=SymNdx
SubCtrSaf=SubCtr
SubValSaf=SubValue
GOSUB TokenSym1
ErrRet
IF SymFound=0 OR SymTable(SymNdx).DataType<>TYPE THEN
	ErrNo=ErrIVType
	RETURN
ENDIF
TDataSize=SymTable(SymNdx).DataSize
SymType="short "'  will divide array size by 2 later
SymTemp.Detail=SymNdx
SymNdx=TypePtr
SymTemp.SymName=TSymName
SubCtr=SubCtrSaf
SubValue=SubValSaf
TDataType=COMPLEX
DTComplex=$ff
DimVar1:
GOSUB NexToken
IF TokenLen=0 OR TokenBuf=";" THEN DimVar2
IF TokenBuf="external" THEN
	ExtVarFlg=$ff
	GOTO DimVar1
ENDIF
IF TokenBuf="pointer" THEN
	IF TypeFlag=$ff OR DMArray=$ff THEN
		ErrNo=ErrIVParm
		RETURN
	ENDIF
	DMAddr=$ff
	SymType="long "
	DTString=0
	DTComplex=0
	TDataSize=4
	TDataMod=LOR(PointerBit,TDataMod)
	GOTO DimVar1
ENDIF
IF TokenBuf="vector" THEN
	GOSUB NexToken
	IF TokenLen<>0 THEN
		IF TokenBuf="global" THEN
			GblVarFlg=$ff
		ELSE
			ErrNo=ErrIVParm
			RETURN
		ENDIF
	ENDIF
	IF TypeFlag=$ff OR DMAddr=$ff THEN
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
RETURN

DimVar2:
SymTemp.DataType=TDataType
IF DMArray=$ff THEN
	TDataMod=LOR(ArrayBit,TDataMod)
ENDIF
DimOK=$ff
SymTemp.DataMod=TDataMod
SymTemp.DataSize=ArraySize*TDataSize
IF TDataType=STRING OR TDataType=COMPLEX THEN
	ArraySize=SymTemp.DataSize
ENDIF
RETURN

DecVar:
TempStr=""
IF ExtVarFlg=0 THEN
	IF GblVarFlg=0 THEN
		TempStr="static "
	ENDIF
ELSE
	TempStr="extern "
ENDIF
IF VectorFlg=$ff THEN
	GenVar
	OutBuf=TempStr+"_vector "+SymTemp.SymName+";"
	GenVar
	RETURN
ENDIF

IF TDataType=COMPLEX THEN
	ArraySize=ArraySize/2'  byte-short correction
ENDIF

TempStr=TempStr+SymType
TempStr=TempStr+SymTemp.SymName
IF DMArray=$ff OR TDataType=STRING OR TDataType=COMPLEX THEN
	IF DMAddr=0 THEN
		TempStr=TempStr+"["+STR$(ArraySize)+"]"
	ENDIF
ENDIF
TempStr=TempStr+";"

GenVar
OutBuf=TempStr
GenVar
RETURN

VarBlank:
OutBuf=""
GenVar
RETURN

OutLabel:
IF LabelFlag=$ff THEN
	OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+SymbolSaf+CHR$(OBQUOTE)+");"
	GOSUB OutCode
	OutBuf=SymbolSaf+";"
	GOSUB OutCode
ENDIF
RETURN

GetExp:
FloatFlag=0
TypePtr=0
ExpEnd=0
ExpNdx=1
ParenCnt=0
FcnCtr=0
AECtr=0
ExpTable(ExpNdx)=1
LastEntry=SymTable(ExpTable(ExpNdx))
GetExp1:
IF ExpEnd=$ff THEN ExpExit
IF NextByte="," AND FcnCtr=0 AND AECtr=0 THEN ExpExit
GetExp2:
GOSUB NexToken
IF FcnCtr<>0 AND TokenBuf="#" THEN GetExp2
IF TokenLen=0 THEN ExpExit
IF TokenBuf="," THEN
	GOSUB AddRtGrp2
	IncExpNdx
	ExpTable(ExpNdx)=2
	IncExpNdx
	ExpTable(ExpNdx)=1
	LastEntry=SymTable(ExpTable(ExpNdx))
	GOTO GetExp1
ENDIF
'***********************
' Start of Pointer Stuff Here
IF TokenBuf="[" THEN
	IncExpNdx
	GOSUB NexToken
	IF TokenLen=0 THEN
		ErrNo=ErrIVExp
		GOTO ExpExit
	ENDIF
	SymTemp.SymName=TokenSaf
	GOSUB SymSrch
	IF SymFound=0 THEN
		ErrNo=ErrUDSym
		GOTO ExpExit
	ENDIF
	SymTemp=SymTable(SymNdx)
	IF LAND(PointerBit,SymTemp.DataMod)<>PointerBit THEN
		ErrNo=ErrTypMis
		GOTO ExpExit
	ENDIF
	IF SymTemp.DataType=FLOAT THEN
		INC FloatFlag
	ENDIF
	IF SymTemp.DataType=COMPLEX THEN
		ExpTable(ExpNdx)=24'  cpx begin
		IncExpNdx
	ENDIF
	ExpTable(ExpNdx)=26'  "["
	IncExpNdx
	ExpTable(ExpNdx)=SymNdx
	LastEntry=SymTemp
	GOSUB NexToken
	IF TokenBuf<>"]" OR TokenLen=0 THEN
		ErrNo=ErrSyntax
		GOTO ExpExit
	ENDIF
	IncExpNdx
	ExpTable(ExpNdx)=27'  put "]" in table
	IF SymTemp.DataType<>COMPLEX THEN GetExp1
	IncExpNdx
	IF NextByte="." THEN
		GOSUB NexToken'  eat "."
		ExpTable(ExpNdx)=13'  "."
		GOSUB NexToken
		IF TokenLen=0 THEN
			ErrNo=ErrSyntax
			GOTO ExpExit
		ENDIF
		SymTemp.SymName=TokenSaf
		GOSUB SymSrch
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
		IncExpNdx
		ExpTable(ExpNdx)=SymNdx
		IncExpNdx
	ENDIF
	ExpTable(ExpNdx)=25'  cpx end
	GOTO GetExp1
ENDIF
' End of Pointer Stuff Here
'***********************
IF TokenType=TTypMath THEN
	IncExpNdx
	IF TokenBuf="+" THEN
		GOSUB Unary
		ExpTable(ExpNdx)=15
	ENDIF
	IF TokenBuf="-" THEN
		GOSUB Unary
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
	IncExpNdx
	IF LAND(ArrayBit,LastEntry.DataMod)<>0 AND SymTemp.DataType<$10 THEN
		ExpTable(ExpNdx)=3
		INC ParenCnt
		ParenStk(ParenCnt)=3
		INC AECtr
		IncExpNdx
		ExpTable(ExpNdx)=1
		GOTO GetExp3
	ENDIF
	IF LAND(ArrayBit,LastEntry.DataMod)<>0 AND SymTemp.DataType=LABELVAR THEN
		ExpTable(ExpNdx)=3
		INC ParenCnt
		ParenStk(ParenCnt)=3
		INC AECtr
		IncExpNdx
		ExpTable(ExpNdx)=1
		GOTO GetExp3
	ENDIF
	IF LastEntry.DataType=FCN THEN
		ExpTable(ExpNdx)=5
		INC ParenCnt
		ParenStk(ParenCnt)=5
		INC FcnCtr
		IncExpNdx
		ExpTable(ExpNdx)=1
		GOTO GetExp3
	ENDIF
	IF LastEntry.DataType<>9 AND ExpNdx<>1 THEN
		ErrNo=ErrIVExp
		GOTO ExpExit
	ENDIF
	LevelCnt=1
	GOSUB PreScan1
	GOSUB AddLftGrp
	ExpTable(ExpNdx)=1
	INC ParenCnt
	ParenStk(ParenCnt)=1
GetExp3:
	LastEntry=SymTable(ExpTable(ExpNdx))
	GOTO GetExp1
ENDIF
IF TokenBuf=")" THEN
	GOSUB AddRtGrp2
	IncExpNdx
	IF ParenCnt=0 THEN
		ErrNo=ErrParen
		GOTO ExpExit
	ENDIF
	IF ParenStk(ParenCnt)=3 OR ParenStk(ParenCnt)=5 THEN
		ExpTable(ExpNdx)=2
		IncExpNdx
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
	GOSUB AddRtGrp1
	GOTO GetExp1
ENDIF
IF TokenBuf="." THEN
	IncExpNdx
	ExpTable(ExpNdx)=13
	LastEntry=SymTable(ExpTable(ExpNdx))
	GOTO GetExp1
ENDIF
IF TokenType=TTypSym THEN
	IncExpNdx
	SymTemp.SymName=TokenBuf
	GOSUB SymSearch
	IF SymFound=$ff THEN
		SymTemp=SymTable(SymNdx)
		IF SymTemp.DataType=FCN THEN' Function found
			IF MID$(SrcLine,SrcNdx+1,2)="()" THEN
				ExpTable(ExpNdx)=SymNdx
				IncExpNdx
				INC SrcNdx
				ExpTable(ExpNdx)=5
				IncExpNdx
				INC SrcNdx
				ExpTable(ExpNdx)=6
				NextByte=MID$(SrcLine,SrcNdx+1,1)
				GOTO GetExp1
			ENDIF
			GOSUB PreScan
			GOSUB AddLftGrp
			LastEntry=SymTemp
			ExpTable(ExpNdx)=SymNdx
			GOTO GetExp1
		ENDIF
	ENDIF
	SymTemp.SymName=TokenSaf
	GOSUB SymSrch
	IF ErrNo<>0 THEN ExpExit
	IF SymFound=0 THEN
		ErrNo=ErrUDSym
		GOTO ExpExit
	ENDIF
	SymTemp=SymTable(SymNdx)
	IF LAND(SymTemp.DataMod,PointerBit)=0 AND SymTemp.DataType<$10 THEN'  special test for pointer
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
			GOSUB PreScan
			GOSUB AddLftGrp
			NextByte=TempStr
			INC ParenCnt
			ParenStk(ParenCnt)=24
			ExpTable(ExpNdx)=24
			IncExpNdx
			TypePtr=SymTemp.Detail
		ENDIF
		IF DataTemp<>COMPLEX AND LAND(ArrayBit,SymTemp.DataMod)=ArrayBit AND SymTemp.DataType<$10 THEN
			TempStr=NextByte
			GOSUB PreScan
			GOSUB AddLftGrp
			NextByte=TempStr
		ENDIF
		IF DataTemp<>COMPLEX THEN
			GOSUB AddLftGrp
		ENDIF
		ExpTable(ExpNdx)=SymNdx
		LastEntry=SymTemp
		GOTO Exp4
	ENDIF
	IF DataTemp=COMPVAR OR DataTemp=MACRO THEN
		Konstant=SymTable(SymNdx).Detail
		SymTemp.SymName=Hex$(Konstant)
		GOSUB ProcKonst
		IF ErrNo<>0 THEN ExpExit
		GOTO Exp4
	ENDIF
	GOTO ExpExit
ENDIF
IF TokenType=TTypFloat THEN
	INC FloatFlag
	IncExpNdx
	GOSUB AddLftGrp
	GOSUB ValidFlt
	IF FloatOK=0 THEN
		ErrNo=ErrIVExp
		GOTO ExpExit
	ENDIF
	SymTemp.SymName=TokenBuf
	GOSUB SymSrch
	IF SymFound=0 THEN
		GOSUB ClrSym
		SymTemp.DataType=FLOAT
		SymTemp.DataSize=8
		SymTemp.DataMod=ConstBit
		GOSUB SymInsert
		ErrRet
	ENDIF
	SymTemp=SymTable(SymNdx)
	LastEntry=SymTemp
	ExpTable(ExpNdx)=SymNdx
	GOSUB AddRtGrp1
	GOTO GetExp1
ENDIF
IF TokenType=TTypInt THEN
	IncExpNdx
	GOSUB AddLftGrp
	GOSUB ValidInt
	IF IntOK=0 THEN
		ErrNo=ErrIVExp
		GOTO ExpExit
	ENDIF
	Konstant=VAL(TokenBuf)
	SymTemp.SymName=Hex$(Konstant)
	GOSUB ProcKonst
	IF ErrNo<>0 THEN ExpExit
	GOTO Exp4
ENDIF
IF TokenType=TTypHex THEN
	IncExpNdx
	GOSUB AddLftGrp
	GOSUB ValidHex
	IF HexOK=0 THEN
		ErrNo=ErrIVExp
		GOTO ExpExit
	ENDIF
	SymTemp.SymName=TokenBuf
	GOSUB ProcKonst
	IF ErrNo<>0 THEN ExpExit
Exp4:
	GOSUB AddRtGrp1
	GOTO GetExp1
ENDIF
IF TokenType=TTypQuote THEN
	IncExpNdx
	IF LEN(TokenSaf)=2 THEN'  null string
		LastEntry=SymTable(20)
		ExpTable(ExpNdx)=20'  20 is table entry for null string
		GOTO GetExp1
	ENDIF
	INC PoolCtr
	TempStr="_StrConst"
	TempStr=TempStr+STR$(PoolCtr)
	SymTemp.SymName=TempStr
	OutBuf="static char "+TempStr+"[]="
	OutBuf=OutBuf+TokenSaf+";"
	'Skip SymSrch, just point to next vacancy in symbol table
	SymNdx=LastSym+1
	IF SymNdx>SymTabSiz THEN
		SymFull=$ff
	ENDIF
	SymTemp.DataType=STRING
	SymTemp.DataMod=ConstBit
	GOSUB ClrSym
	SymTemp.Detail=LEN(TokenSaf)-1
	SymTemp.DataSize=SymTemp.Detail
	GOSUB SymInsert
	IF ErrNo<>0 THEN
		GOTO ExpExit
	ENDIF
	GenVar
	LastEntry=SymTemp
	ExpTable(ExpNdx)=SymNdx
	GOTO GetExp1
ENDIF
ErrNo=ErrIVExp
RETURN
ExpExit:
IF ExpLen=ExpTabSiz THEN
	ErrNo=ErrCpxExp
ENDIF
IF ExpLen=1 THEN
	ErrNo=ErrIVExp
ENDIF
IF ErrNo=0 THEN
	IF ParenCnt<>0 THEN
		IF ParenStk(ParenCnt)=24 THEN
			IncExpNdx
			ExpTable(ExpNdx)=25
			DEC ParenCnt
		ENDIF
	ENDIF
	IF ParenCnt<>0 THEN
		IF ParenStk(ParenCnt)=22 THEN
			IncExpNdx
			ExpTable(ExpNdx)=23
			ParenCnt=0
		ENDIF
	ENDIF
	IF ParenCnt<>0 THEN
		ErrNo=ErrParen
	ELSE
		IncExpNdx
		ExpTable(ExpNdx)=2
	ENDIF
ENDIF
RETURN

PreScan:
LevelCnt=0
GOSUB PreScan1
RETURN

PreScan1:
SrcNdxSaf=SrcNdx
ExpEndSaf=ExpEnd
PreScan2:
GOSUB NexToken
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

Unary:
LstExp=ExpTable(ExpNdx-1)
IF LstExp=1 OR LstExp=3 OR LstExp=5 OR LstExp=22 OR LstExp=24 THEN
	ExpTable(ExpNdx)=21' *********
	IncExpNdx
ENDIF
RETURN

AddLftGrp:
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
		IncExpNdx
	ENDIF
ENDIF
RETURN

AddRtGrp1:
IF ParenCnt=0 THEN
	RETURN
ENDIF
IF NextByte="+" OR NextByte="-" OR NextByte="*" OR NextByte="/"  OR NextByte="&" OR NextByte="|" THEN
	IF ParenStk(ParenCnt)=24 THEN
		IncExpNdx
		DEC ParenCnt
		ExpTable(ExpNdx)=25
	ENDIF
	IF ParenCnt=0 THEN
		RETURN
	ENDIF
	IF NextByte="+" OR NextByte="-"  OR NextByte="|" THEN
		IF ParenStk(ParenCnt)=22 THEN
			IncExpNdx
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

AddRtGrp2:
IF ParenStk(ParenCnt)=24 THEN
	IncExpNdx
	DEC ParenCnt
	ExpTable(ExpNdx)=25
ENDIF
IF ParenStk(ParenCnt)=22 THEN
	IncExpNdx
	DEC ParenCnt
	ExpTable(ExpNdx)=23
ENDIF
RETURN

ProcKonst:
GOSUB SymSrch
IF SymFound=0 THEN
	GOSUB ClrSym
	SymTemp.DataType=LONG
	SymTemp.DataSize=4
	SymTemp.DataMod=ConstBit
	GOSUB SymInsert
	ErrRet
ENDIF
SymTemp=SymTable(SymNdx)
LastEntry=SymTemp
ExpTable(ExpNdx)=SymNdx
RETURN

ProcExp:
IF ExpFlag=$ff THEN
	FOR Ctr1=1 to ExpLen
		PRINT SymTable(ExpTable(Ctr1)).SymName;
	NEXT Ctr1
	PRINT
ENDIF
LOOP
	LastGroup=$00
	TempInt=ExpNdx
	GOSUB ParenScan
	ExpNdx=TempInt
	IF ParenCnt=0 THEN
		RETURN
	ENDIF
	GOSUB SolveTerm
	ErrRet
	GOSUB SquishExp
ENDLOOP

ParenScan:
ParenCnt=0
ExpNdx=0
PType=0
ExpLeft=0
ExpRight=0
IF ExpNdx>ExpLen THEN
	RETURN
ENDIF
ParenScn1:
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

SquishExp:
LOOP
	IF ExpRight+1>ExpLen THEN
		ExpLen=ExpLeft-1
		RETURN
	ENDIF
	ExpTable(ExpLeft)=ExpTable(ExpRight+1)
	INC ExpLeft
	INC ExpRight
ENDLOOP

SolveTerm:
D0Loaded=0
IF ExpLeft=1 AND ExpRight=ExpLen THEN
	LastGroup=$ff
ENDIF
IF ExpLeft=2 AND ExpRight=ExpLen-1 AND ExpTable(1)=1 THEN
	LastGroup=$ff
ENDIF
'*******************************
' Pointer Stuff Begins Here
IF PType=27 THEN
	ExpNdx=ExpLeft+1
	GOSUB ClassOp
	GOSUB GetTmpVec
	ErrRet
	SymTable(SymNdx).DataMod=LAND(SymTable(SymNdx).DataMod,$fd)'  kill addr bit
	ExpTable(ExpNdx)=SymNdx
	OutBuf="(long)"+SymTemp.SymName+"._Ptr="+TSymName+";"
	GOSUB OutCode
	IF TDataType=STRING THEN
		OutBuf=SymTemp.SymName+"._Len="+STR$(TDetail)+";"
		GOSUB OutCode
		OutBuf=SymTemp.SymName+"._Lnk=0;"
		GOSUB OutCode
	ENDIF
	GOTO GrpCpxEnd
ENDIF
' Pointer Stuff Ends Here
'*******************************
IF PType=4 THEN
	ExpNdx=ExpLeft-1
	GOSUB ClassOp
	IF TDataType=STRING THEN
		GOSUB VecString
		GOTO ArrFcnEnd
	ENDIF
	GOSUB GetTmpVec
	ErrRet
	GOSUB GetBase
	ExpTable(ExpNdx)=SymNdx
	TempStr=SymTemp.SymName
	GOSUB GetOpSize
	GOSUB BldOffset
	ErrRet
	OutBuf=TempStr+"._Ptr=_a0;"
	GOSUB OutCode
	GOTO ArrFcnEnd
ENDIF
IF PType=6 THEN' Function
	ExpNdx=ExpLeft-1
	SymTemp=SymTable(ExpTable(ExpNdx))
	UsrFcnNam=SymTemp.SymName
	TempInt=SymTemp.Detail+1
	FcnCode=TempInt-1
	IF FcnCode=$ff THEN'  (BASIC Subroutine)'???
		ErrNo=ErrTypMis
		RETURN
	ENDIF
	ExpNdx=ExpNdx+2
	IF TempInt<51 THEN
		ON TempInt GOSUB F0,F1,F2,F3,F4,F5,F6,F7,F8,F9,F10,F11,F12,F13,F14,F15,F16,F17,F18,F19,F20,F21,F22,F23,F24,F25,F26,F27,F28,F29,F30,F31,F32,F33,F34,F35,F36,F37,F38,F39,F40,F41,F42,F43,F44,F45,F46,F47,F48,F49
	ELSE
		ON TempInt-50 GOSUB F50,F51,F52,F53,F54,F55,F56,F57,F58,F59,F60,F61,F62,F63,F64,F65,F66,F67,F68,F69,F70,F71,F72,F73,F74,F75,F76,F77,F78,F79,F80,F81
	ENDIF
	ErrRet
	GOTO ArrFcnEnd
ENDIF
IF PType=25 THEN
	IF ExpRight-ExpLeft=2 THEN
		ExpNdx=ExpLeft+1
		GOSUB ClassOp
		IF DMVector=0 THEN
			GOSUB Vectorize
			ErrRet
		ENDIF
		IF DMVector=$ff AND DMTemp=0 THEN
			GOSUB SetTmpVec
			ErrRet
		ENDIF
		GOTO GrpCpxEnd
	ENDIF
	ExpNdx=ExpLeft+3
	GOSUB ClassOp
	IF TDataType=STRING AND DMVector=0 THEN
		GOSUB VecString
	ENDIF
	IF DMVector=$ff AND DMTemp=0 THEN
		GOSUB SetTmpVec
		ErrRet
	ENDIF
	ExpNdx=ExpNdx-2
	GOSUB ClassOp
	IF DMVector=0 THEN
		GOSUB Vectorize
		ErrRet
	ENDIF
	IF DMVector=$ff AND DMTemp=0 THEN
		GOSUB SetTmpVec
		ErrRet
	ENDIF
	ExpNdx=ExpNdx+2
	GOSUB ClassOp
	ExpNdx=ExpNdx-2
	SymNdx=ExpTable(ExpNdx)
	SymTable(SymNdx).DataType=TDataType
	SymTable(SymNdx).DataSize=TDataSize
	SymTable(SymNdx).Detail=TDetail
	OutBuf="_d0=(long)"+SymTable(SymNdx).SymName+"._Ptr;"
	GOSUB OutCode
	IF DMVector=$ff THEN
		OutBuf="_d0=_d0+(long)"+TSymName+"._Ptr;"
	ELSE
		OutBuf="_d0=_d0+"+STR$(TDataAddr)+";"
	ENDIF
	GOSUB OutCode
	OutBuf="(long)"+SymTable(SymNdx).SymName+"._Ptr=_d0;"
	GOSUB OutCode
	IF OpClass=STRClass AND ReadFlag=0 THEN
		OutBuf=SymTable(SymNdx).SymName+"._Len="+TSymName+"._Len;"
		GOSUB OutCode
		OutBuf=SymTable(SymNdx).SymName+"._Lnk="+TSymName+"._Lnk;"
		GOSUB OutCode
	ENDIF
	GOTO GrpCpxEnd
ENDIF
' Get here if PType=2
ExpNdx=ExpLeft+1
GOSUB ClassOp
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
		GOSUB VecString
	ENDIF
	IF TDataType=STRING AND DMVector=$ff AND DMTemp=0 AND DiskIO=$ff  AND BufRWFlg=0 THEN
		GOSUB GetBase
	ENDIF
	GOTO GrpCpxEnd
ENDIF
ScanStr:
GOSUB ClassOp
MakeLong
IF TDataType=STRING AND DMVector=0 AND DMAddr=0 THEN
	GOSUB VecString
ENDIF
IF DMVector=$ff AND DMTemp=0 THEN
	REM need to make a temp vector
	GOSUB SetTmpVec
	ErrRet
ENDIF
INC ExpNdx
IF ExpNdx<ExpRight THEN ScanStr
ExpNdx=ExpLeft+1
GOSUB ClassOp
MakeLong
IF TDataType=STRING THEN
	DataOp=0
	Ctr1=0
	6184:
	IF DataOp=0 THEN
		GOSUB ClassOp
		IF TDataType<>STRING THEN
			ErrNo=ErrIVExp
			RETURN
		ENDIF
		INC Ctr1
		IF Ctr1>1 THEN
			OutBuf="_a0=&"+TSymName+";"
			GOSUB OutCode
			TSymName=SymTable(ExpTable(ExpNdx-2)).SymName
			OutBuf=TSymName+"._Lnk=_a0;"
			GOSUB OutCode
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
	6186:
	IF DataOp=0 THEN
		DataOp=$ff
		GOSUB LoadReg
		ErrRet
		INC Ctr1
		IF Ctr1>1 THEN
			IF MathOp=15 THEN
				GOSUB Add
			ENDIF
			IF MathOp=16 THEN
				GOSUB Sub
			ENDIF
			IF MathOp=17 THEN
				GOSUB Mul
			ENDIF
			IF MathOp=18 THEN
				GOSUB Div
			ENDIF
			IF MathOp=146 THEN
				GOSUB And
			ENDIF
			IF MathOp=147 THEN
				GOSUB Or
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
		GOSUB GetTmp
		ErrRet
	ELSE
		GOSUB GetFltTmp
		ErrRet
	ENDIF
       OutBuf=SymTemp.SymName+"="+Reg0Name+";"
	GOSUB OutCode
	ExpTable(ExpNdx)=SymNdx
	GOTO GrpCpxEnd
ENDIF
ArrFcnEnd:
DEC ExpLeft
GrpCpxEnd:
ExpTable(ExpLeft)=ExpTable(ExpNdx)
ExpNdx=ExpLeft
INC ExpLeft
RETURN

GetBase:
IF DMMember=$ff THEN
	OutBuf="(long)_a0="+STR$(TDataAddr)+";"
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
GOSUB OutCode
RETURN

BldOffset:
SymTable(SymNdx).DataSize=TempInt
SymTable(SymNdx).DataMod=LAND(ArrayMsk,SymTable(SymNdx).DataMod)
GOSUB ClassOp
ExpNdx=ExpNdx+2
NumArgs=ExpRight-ExpLeft-1
IF NumArgs<>SubCtr THEN
	ErrNo=ErrArrSub
	RETURN
ENDIF
GOSUB SubLoad
IF NumArgs=1 THEN'  1 DIM array
	IF TempInt<>1 THEN
		OutBuf="_d0=_d0*"+STR$(TempInt)+";"
		GOSUB OutCode
	ENDIF
	OutBuf="(long)_a0=(long)_a0+_d0;"
	GOSUB OutCode
	ExpNdx=ExpNdx-2
	RETURN
ENDIF
OutBuf="_d1=_d0;"
GOSUB OutCode
INC ExpNdx
GOSUB SubLoad
ErrRet
IF NumArgs=2 THEN'  2 DIM array
	REM _d0 is (2), _d1 is (1)
	OutBuf="_d0=_d0*"+STR$(SubValue(1))+"*"+STR$(TempInt)+"+"+STR$(TempInt)+"*_d1;"
	GOSUB OutCode
	OutBuf="(long)_a0=(long)_a0+_d0;"
	GOSUB OutCode
	ExpNdx=ExpNdx-3
	RETURN
ENDIF
REM Get here if 3 DIM array
OutBuf="_d2=_d0;"
GOSUB OutCode
INC ExpNdx
GOSUB SubLoad
ErrRet
REM _d0 is (3), _d1 is(1), _d2 is (2)
OutBuf="_d0=_d2*"+STR$(SubValue(1))+"*"+STR$(TempInt)+"+_d0*"+STR$(SubValue(1))+"*"+STR$(SubValue(2))+"*"+STR$(TempInt)+";"
GOSUB OutCode
OutBuf="_d0=_d0+"+STR$(TempInt)+"*_d1;"
GOSUB OutCode
OutBuf="(long)_a0=(long)_a0+_d0;"
GOSUB OutCode
ExpNdx=ExpNdx-4
RETURN

VecString:
IF BufRWFlg=$ff THEN'  for the case of BUFRW #fn,ADDR(a$),size
	RETURN
ENDIF
GOSUB GetTmpVec
ErrRet
GOSUB GetBase
ExpTable(ExpNdx)=SymNdx
TempStr=SymTemp.SymName
TempInt=TDetail
IF PType=4 THEN
	GOSUB BldOffset
ENDIF
OutBuf=TempStr+"._Ptr=_a0;"
GOSUB OutCode
IF ReadFlag=0 THEN
	OutBuf=TempStr+"._Len="+STR$(TempInt)+";"
	GOSUB OutCode
	OutBuf=TempStr+"._Lnk=0;"
	GOSUB OutCode
ENDIF
RETURN

ClassOp:
SymTemp=SymTable(ExpTable(ExpNdx))
GOSUB ClassOp1
RETURN

ClassOp1:
GOSUB ClrDatTyp
TSymName=SymTemp.SymName
TDataType=SymTemp.DataType
TDataMod=SymTemp.DataMod
TDetail=SymTemp.Detail
TDataAddr=SymTemp.DataAddr
TDataSize=SymTemp.DataSize
GOSUB GetDtaTyp
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
IF LAND(PointerBit,TDataMod)=PointerBit THEN
	DMAddr=$ff
ENDIF
IF LAND(ArrayBit,TDataMod)=ArrayBit THEN
	DMArray=$ff
	OpClass=ARRClass
	IF DMMulti=$ff THEN
		'MultiNdx=TMultiPtr
		'SubCtr=SymTable(MultiNdx).DataMod
		'SubValue(1)=SymTable(MultiNdx).Detail
		'SubValue(2)=SymTable(MultiNdx).DataAddr
		'SubValue(3)=SymTable(MultiNdx).DataSize
	ELSE
		SubCtr=1
	ENDIF
	RETURN
ENDIF
IF TDataType>=2 AND TDataType<=4 OR LAND(PointerBit,TDataMod)=PointerBit THEN
	OpClass=INTClass
	RETURN
ENDIF
IF TDataType=FCN AND LAND(TDataSize,$00000004)=4 THEN
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
IF TDataType=LABELVAR THEN
	OpClass=LBLClass
	RETURN
ENDIF
OpClass=0
RETURN

Expr:
GOSUB GetExp
ErrRet
GOSUB ProcExp
ErrRet
GOSUB ClassOp
RETURN

TokenSym:
GOSUB NexToken
IF TokenLen=0 THEN
	ErrNo=ErrSyntax
	RETURN
ENDIF
GOSUB TokenSym1
RETURN

TokenSym1:
GOSUB GtRootSym
GOSUB ValidSym
IF SymbolOK=0 THEN
	ErrNo=ErrIVSNam
	RETURN
ENDIF
SymTemp.SymName=SymbolSaf
GOSUB SymSrch
RETURN

ClrSym:
SymTemp.Detail=0
SymTemp.DataAddr=0
SymTemp.DataSize=0
RETURN

CmdLine:
CmdLineLp:
ErrNo=0
TempStr=NextArg
IF LEN(TempStr)=0 THEN
	RETURN
ENDIF
IF LEFT$(TempStr,1)="-" THEN
	OptNdx=1
	Option:
	GOSUB ParseOpt
	IF LEN(Opt)=0 THEN CmdLineLp
	IF Opt="1" THEN
		ExpFlag=$ff
		GOTO Option
	ENDIF
	IF Opt="a" THEN
		AsmbFlag=$ff
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
	IF Opt="h" THEN
   		HaltFlag=$ff
		GOTO Option
	ENDIF
	IF Opt="o" THEN
		ObjectMode=$ff
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
	SetMask=$80'  simulate FIX
	GOSUB SETDx1
ENDIF
GOTO CmdLineLp
RETURN' Sbtrn delimiter only

ParseOpt:
INC OptNdx
Opt=MID$(TempStr,OptNdx,1)
RETURN

CallErr:
IF StatFlag=$ff THEN
	RETURN
ENDIF
INC OELabelNum
OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+"cmpl $-1,_STATUS"+CHR$(OBQUOTE)+");"
GenMain
OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+"jg _OELbl"+STR$(OELabelNum)+CHR$(OBQUOTE)+");"
GenMain
OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+"movl _ErrVec,%eax"+CHR$(OBQUOTE)+");"
GenMain
OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+"jmp *%eax"+CHR$(OBQUOTE)+");"
GenMain
OutBuf="__asm__ __volatile__("+CHR$(OBQUOTE)+"_OELbl"+STR$(OELabelNum)+":"+CHR$(OBQUOTE)+");"
GenMain
RETURN

GenXfrCnt:
OutBuf="XferCount=STATUS;"
GOSUB OutCode
RETURN

GetAccMod:
GOSUB NexToken
IF TokenBuf="dir" THEN
	DirFlag=$ff
	GOSUB NexToken
	IF TokenBuf="+" THEN
		GOSUB NexToken'  eat optional "+"
	ENDIF
ELSE
	DirFlag=0
ENDIF
IF CrOpFlag=$ff THEN
	AccMode="A_WRITE|A_CREAT|A_EXCL"
ENDIF
IF TokenLen<>0 THEN
	IF TokenBuf="update" THEN
		IF CrOpFlag=$ff THEN
			CreatMode="P_WRITE|P_READ"
		ELSE
			AccMode="A_UPDATE"
		ENDIF
	ELSE
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
	ENDIF
ELSE
AccModErr:
	ErrNo=ErrSyntax
	RETURN
ENDIF
GOSUB NexToken
IF TokenLen<>0 THEN
	IF TokenBuf="+" THEN
		GOSUB NexToken'  eat optional "+"
		IF TokenBuf="dir" THEN
			DirFlag=$ff
		ELSE
			IF TokenBuf="binary" THEN
				AccMode=AccMode+"|A_BINARY"
			ELSE
				IF TokenBuf="text" THEN
					AccMode=AccMode+"|A_TEXT"
				ELSE
					ErrNo=ErrSyntax
				ENDIF
			ENDIF
		ENDIF
	ENDIF
ENDIF
RETURN

GetOpSize:
IF TDataType=BOOLEAN OR TDataType=BYTE THEN
	TempInt=1
ENDIF
IF TDataType=SHORT THEN
	TempInt=2
ENDIF
IF TDataType=LONG OR TDataType=LABELVAR THEN
	TempInt=4
ENDIF
IF TDataType=FLOAT THEN
	TempInt=8
ENDIF
IF TDataType=COMPLEX THEN
	TempInt=SymTable(SymTable(SymNdx).Detail).DataSize
ENDIF
RETURN

DevChk:
GOSUB NexToken
IF TokenBuf="#" THEN
	DevFlag=$ff
ELSE
	GOSUB UnDoToken
ENDIF
RETURN

GetPthNum:
GOSUB NexToken
GOSUB GetPthNum1
RETURN

GetPthNum1:
GOSUB GetExp
ErrRet
GOSUB ProcExp
ErrRet
GOSUB GetPthNum2
RETURN

GetPthNum2:
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
IF Target=0 THEN
	IF TSymName<>"~" THEN
		D0Loaded=0
		GOSUB LoadReg
		ErrRet
	ENDIF
	OutBuf="_d0=_d0&0xff;"
	GOSUB OutCode
	IF PrtPthFlg=0 THEN
		OutBuf="_IOPthNum=_d0;"
	ELSE
		OutBuf="_PrtPthNum=_d0;"
	ENDIF
	GOSUB OutCode
ELSE
	IF DMConst=$ff THEN
		ErrNo=ErrIVExp
		RETURN
	ENDIF
	IF DMVector=0 THEN
		PathVar=TSymName
	ELSE
		GOSUB VecSymNam
		PathVar=TSymName
	ENDIF
ENDIF
' The following code makes the "," following the device name
' acceptable but not mandatory
IF FileStat=0 AND KeyNdx<>23 THEN' Not fcn or close
	GOSUB NexToken
	IF TokenBuf<>"," THEN
		GOSUB UnDoToken
	ENDIF
ENDIF
RETURN

GetPthNam:
GOSUB Expr
ErrRet
IF TDataType<>STRING THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
OutBuf="_MovStr(&_IOBufVec,&"+TSymName+");"
GOSUB OutCode
RETURN

BufRW:
BufRWFlg=$ff
DiskIO=$ff
GOSUB GetPthNum
ErrRet
GOSUB GetIntOp' Get Address
ErrRet
OutBuf="(long)_XferAddr=_d0;"
GOSUB OutCode
CommaRet
GOSUB GetIntOp' Get # of bytes
ErrRet
OutBuf="XferCount=_d0;"
GOSUB OutCode
RETURN

GetPut:
DiskIO=$ff
GOSUB GetPthNum
ErrRet
GOSUB Expr
ErrRet
IF DMConst=$ff THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
GOSUB GetBase
OutBuf="_XferAddr=_a0;"
GOSUB OutCode
OutBuf="XferCount="+STR$(SymTemp.DataSize)+";"
GOSUB OutCode
RETURN

ReadWrite:
DiskIO=$ff
GOSUB GetPthNum
ErrRet
GOSUB Expr
ErrRet
IF TDataType<>STRING THEN
	ErrNo=ErrTypMis
ENDIF
GOSUB GetBase
RETURN

GetRegPrm:
SymTemp=SymTable(ExpTable(ExpNdx))
GOSUB GetRP1
RETURN

GetRP1:
TDataType=SymTemp.DataType
TDataMod=SymTemp.DataMod
IF LAND(SymTemp.DataMod,PointerBit)<>PointerBit THEN
	IF TDataType<1 OR TDataType>5 THEN
		ErrNo=ErrIVExp
		RETURN
	ENDIF
ENDIF
GOSUB GetDtaTyp
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

LoadReg:
IF Promote=$ff OR Demote=$ff THEN
	GOSUB SymSrch
	SymTemp=SymTable(SymNdx)
	GOSUB GetRP1
ELSE
	GOSUB GetRegPrm
ENDIF
ErrRet
IF LAND(ConstBit,SymTemp.DataMod)=ConstBit THEN
	IF TDataType=BOOLEAN THEN
               OutBuf=LdRegName+"="+STR$(SymTemp.Detail)+";"
		GOSUB OutCode
	ELSE
               OutBuf=LdRegName+"="+SymTemp.SymName+";"
		GOSUB OutCode
	ENDIF
ELSE
	IF LAND(VectorBit,SymTemp.DataMod)=0 THEN
		IF LAND(TDataMod,PointerBit)=0 THEN
                       OutBuf=LdRegName+"="+SymTemp.SymName+";"
		ELSE
                       OutBuf=LdRegName+"=(long)"+SymTemp.SymName+";"
		ENDIF
		GOSUB OutCode
	ELSE
               OutBuf=LdRegName+"=*(("+_DataType+"*)"+SymTemp.SymName+"._Ptr);"
		GOSUB OutCode
	ENDIF
ENDIF
D0Loaded=$ff
RETURN

StoreD0:
SymTemp.SymName=Op1Name
GOSUB SymSrch
SymTemp=SymTable(SymNdx)
GOSUB GetRP1
IF LAND(VectorBit,SymTemp.DataMod)=0 THEN
	IF LAND(TDataMod,PointerBit)=0 THEN
               OutBuf=SymTemp.SymName+"="+Reg0Name+";"
	ELSE
		OutBuf="(long)"+SymTemp.SymName+"="+Reg0Name+";"
	ENDIF
ELSE
       OutBuf="*(("+_DataType+"*)"+SymTemp.SymName+"._Ptr)="+Reg0Name+";"
ENDIF
GOSUB OutCode
RETURN

GetIntTmp:
OpClass=INTClass
GOSUB GetTmp
RETURN

GetTmp:
IF TmpUse=NumTemps THEN
	ErrNo=ErrTmpUse
	RETURN
ENDIF
INC TmpUse
IF TmpUse>TmpMax THEN
	TmpMax=TmpUse
	GOSUB VarBlank
	Comment="Temporary Variable"
	GOSUB BldComment
	GenVar
	OutBuf="static long _Tmp"+STR$(TmpUse)+";"
	GenVar
	GOSUB VarBlank
ENDIF
SymTemp.SymName="_Tmp"+STR$(TmpUse)
GOSUB SymSrch
IF OpClass=INTClass THEN
	SymTable(SymNdx).DataType=LONG
ELSE
	SymTable(SymNdx).DataType=TDataType
ENDIF
SymTable(SymNdx).DataSize=TDataSize
RETURN

GetFltTmp:
IF FTmpUse=NumTemps THEN
	ErrNo=ErrTmpUse
	RETURN
ENDIF
INC FTmpUse
IF FTmpUse>FTmpMax THEN
	FTmpMax=FTmpUse
	GOSUB VarBlank
	Comment="Temporary Floating Point Variable"
	GOSUB BldComment
	GenVar
	OutBuf="static double _FTmp"+STR$(FTmpUse)+";"
	GenVar
	GOSUB VarBlank
ENDIF
SymTemp.SymName="_FTmp"+STR$(FTmpUse)
GOSUB SymSrch
RETURN

GetStrVec:
INC StrTmpUse
IF StrTmpUse>StrTmpMax THEN
	StrTmpMax=StrTmpUse
	GOSUB VarBlank
	Comment="Temporary String Variable"
	GOSUB BldComment
	GenVar
	OutBuf="static unsigned char _StrTmp"+STR$(StrTmpUse)+"[22];"
	GenVar
	GOSUB VarBlank
ENDIF
GOSUB ReqTmpVec
ErrRet
SymTable(SymNdx).DataMod=TmpVec
SymTable(SymNdx).DataType=STRING
SymTable(SymNdx).Detail=22
TempInt=22
SymTable(SymNdx).DataAddr=0
SymTable(SymNdx).DataSize=22
OutBuf="_a0=_StrTmp"+STR$(StrTmpUse)+";"
GOSUB OutCode
GOSUB SetStrVec
RETURN

GetChrVec:
INC ChrTmpUse
IF ChrTmpUse>ChrTmpMax THEN
	ChrTmpMax=ChrTmpUse
	GOSUB VarBlank
	Comment="Temporary Character Variable"
	GOSUB BldComment
	GenVar
	OutBuf="char _ChrTmp"+STR$(ChrTmpUse)+";"
	GenVar
	GOSUB VarBlank
ENDIF
GOSUB ReqTmpVec
ErrRet
SymTable(SymNdx).DataMod=TmpVec
SymTable(SymNdx).DataType=STRING
SymTable(SymNdx).Detail=1
TempInt=1
SymTable(SymNdx).DataAddr=0
SymTable(SymNdx).DataSize=1
OutBuf="_a0=&_ChrTmp"+STR$(ChrTmpUse)+";"
GOSUB OutCode
GOSUB SetStrVec
RETURN

SetStrVec:
OutBuf=SymTemp.SymName+"._Ptr=_a0;"
GOSUB OutCode
OutBuf=SymTemp.SymName+"._Len="+STR$(TempInt)+";"
GOSUB OutCode
OutBuf=SymTemp.SymName+"._Lnk=0;"
GOSUB OutCode
RETURN

ReqTmpVec:
IF TmpVecUse=NumTemps THEN
	ErrNo=ErrTmpUse
	RETURN
ENDIF
INC TmpVecUse
IF TmpVecUse>TmpVecMax THEN
	TmpVecMax=TmpVecUse
	GOSUB MakTmpVec
ENDIF
SymTemp.SymName="_TmpVec"+STR$(TmpVecUse)
GOSUB SymSrch
SymNdxSaf=SymNdx
RETURN

GetTmpVec:
GOSUB ReqTmpVec
ErrRet
SymTable(SymNdx).DataMod=TmpVec
SymTable(SymNdx).DataMod=LOR(TDataMod,SymTable(SymNdx).DataMod)
SymTable(SymNdx).DataType=TDataType
SymTable(SymNdx).Detail=TDetail
SymTable(SymNdx).DataAddr=TDataAddr
SymTable(SymNdx).DataSize=TDataSize
RETURN

MakTmpVec:
GOSUB VarBlank
Comment="Temporary Vector"
GOSUB BldComment
GenVar
OutBuf="static _vector _TmpVec"+STR$(TmpVecUse)+";"
GenVar
GOSUB VarBlank
RETURN

SetTmpVec:
GOSUB GetTmpVec
ErrRet
ExpTable(ExpNdx)=SymNdx
OutBuf=SymTable(SymNdx).SymName+"="+TSymName+";"
GOSUB OutCode
GOSUB ClassOp
RETURN

Vectorize:
GOSUB GetTmpVec
ErrRet
GOSUB GetBase
ExpTable(ExpNdx)=SymNdx
OutBuf=SymTemp.SymName+"._Ptr=_a0;"
GOSUB OutCode
RETURN

GetLopVec:
LopVarNdx=0
GetLV1:
INC LopVarNdx
IF LopVarNdx=41 THEN
	ErrNo=ErrTmpUse
	RETURN
ENDIF
IF LoopVars(LopVarNdx)=CS(CSP).LoopName THEN GetLV2
IF LoopVars(LopVarNdx)<>"%" THEN GetLV1
LoopVars(LopVarNdx)=CS(CSP).LoopName
GOSUB VarBlank
Comment="For Loop Vector"
GOSUB BldComment
GenVar
OutBuf="static _loopvec _LopVec"+STR$(LopVarNdx)+";"
GenVar
GOSUB VarBlank
GetLV2:
RETURN

And:
IF TDataType=FLOAT THEN
	ErrNo=ErrTypMis
ENDIF
OutBuf="_d0=_d0&_d1;"
GOSUB OutCode
RETURN

Or:
IF TDataType=FLOAT THEN
	ErrNo=ErrTypMis
ENDIF
OutBuf="_d0=_d0|_d1;"
GOSUB OutCode
RETURN

Add:
OutBuf=Reg0Name+"="+Reg0Name+"+"+Reg1Name+";"
GOSUB OutCode
RETURN

Sub:
OutBuf=Reg0Name+"="+Reg0Name+"-"+Reg1Name+";"
GOSUB OutCode
RETURN

Mul:
OutBuf=Reg0Name+"="+Reg0Name+"*"+Reg1Name+";"
GOSUB OutCode
RETURN

Div:
OutBuf=Reg0Name+"="+Reg0Name+"/"+Reg1Name+";"
GOSUB OutCode
RETURN

CmpNum:
D0Loaded=0
Promote=$ff
SymTemp.SymName=Op1Name
GOSUB LoadReg
SymTemp.SymName=Op2Name
GOSUB LoadReg
OutBuf="if ("+Reg0Name+" "+SymType+" "+Reg1Name+") _d0=0xff;"
GOSUB OutCode
OutBuf="else _d0=0;"
GOSUB OutCode
RETURN

CmpString:
OutBuf="_d0=_CmpStr(&"+Op1Name+",&"+Op2Name+");"
GOSUB OutCode
OutBuf="if (_d0 "+SymType+" 1) _d0=0xff;"
GOSUB OutCode
OutBuf="else _d0=0;"
GOSUB OutCode
RETURN

CmpBool:
Promote=$ff
SymTemp.SymName=Op1Name
GOSUB LoadReg
SymTemp.SymName=Op2Name
GOSUB LoadReg
OutBuf="if (_d0 "+SymType+" _d1) _d0=0xff;"
GOSUB OutCode
OutBuf="else _d0=0;"
GOSUB OutCode
RETURN

NexToken:
ExpEnd=0
TokenLen=0
TokenType=0
QuoteFlg=0
NextByte=""
TokenBuf=""
TokenSaf=""
NexToken1:
INC SrcNdx
IF SrcNdx>LEN(SrcLine) THEN NexToken5
TempByte=MID$(SrcLine,SrcNdx,1)
NextByte=MID$(SrcLine,SrcNdx+1,1)
AsciiByte=ASC(TempByte)
IF AsciiByte=OBQUOTE AND EscSeq=0 THEN
	IF QuoteFlg=0 AND TokenLen<>0 THEN NexToken5
	GOSUB NexToken3
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
	GOSUB NexToken3
	GOTO NexToken1
ENDIF
IF TempByte="." THEN
	IF TokenType=TTypInt THEN
		TokenType=TTypFloat
		GOSUB NexToken3
		GOTO NexToken1
	ENDIF
	IF TokenLen=0 THEN
		IF NextByte>="0" AND NextByte<="9" THEN
			TokenType=TTypFloat
			GOSUB NexToken3
			GOTO NexToken1
		ENDIF
	ENDIF
ENDIF
IF TempByte="'" THEN NexToken5' Remark
IF TempByte="<" OR TempByte=">" OR TempByte="=" THEN
	IF TokenLen<>0 THEN NexToken5
	TokenType=TTypRelOp
	GOSUB NexToken3
	IF TempByte="=" THEN
		GOTO NexToken6
	ENDIF
	IF NextByte=">" OR NextByte="=" THEN
		INC SrcNdx
		TempByte=MID$(SrcLine,SrcNdx,1)
		GOSUB NexToken3
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
		GOSUB NexToken3
		TokenType=TTypParen
		GOTO NexToken6
	ENDIF
ENDIF
IF DimFlag=0 OR TempByte<>"," THEN'  special cond for multi-dim array
	IF TempByte="," OR TempByte=";" OR TempByte=":" OR TempByte="." THEN
		IF TokenLen<>0 THEN NexToken5
		GOSUB NexToken3
		TokenType=TTypPunct
		GOTO NexToken6
	ENDIF
ENDIF
IF TempByte="+" OR TempByte="-" OR TempByte="*" OR TempByte="/"  OR TempByte="&" OR TempByte="|" THEN
	IF TokenLen<>0 THEN NexToken5
	GOSUB NexToken3
	TokenType=TTypMath
	GOTO NexToken6
ENDIF
IF DimFlag=$ff THEN NexToken2
IF TempByte="$" OR TempByte="_" OR TempByte="@" THEN NexToken2
IF TempByte>="0" AND TempByte<="9" THEN NexToken2
IF TempByte>="A" AND TempByte<="Z" THEN NexToken2
IF TempByte>="a" AND TempByte<="z" THEN NexToken2
IF TokenLen<>0 THEN NexToken5
GOSUB NexToken3
TokenType=TTypMisc
GOTO NexToken6
NexToken2:
GOSUB NexToken3
GOTO NexToken1
NexToken5:
DEC SrcNdx
NextByte=MID$(SrcLine,SrcNdx+1,1)
NexToken6:
IF NextByte=" " OR ASC(NextByte)=9 OR NextByte=":" OR NextByte=";" THEN
	ExpEnd=$ff
ENDIF
IF NextByte="<" OR NextByte=">" OR NextByte="=" OR NextByte="" OR NextByte="'" THEN
	ExpEnd=$ff
ENDIF
NexTokDone:
IF TokenType=TTypInt AND RIGHT$(TokenBuf,1)="h" THEN' Intel hex->Motorola
	IF LEFT$(TokenBuf,1)<>"0" THEN
		TokenSaf="$"+LEFT$(TokenBuf,LEN(TokenBuf)-1)
	ELSE
		TokenSaf="$"+MID$(TokenBuf,2,LEN(TokenBuf)-2)' removes leading 0
	ENDIF
	TokenBuf=TokenSaf
	TokenType=TTypHex
ENDIF
IF TokenType=TTypInt AND MID$(TokenBuf,2,1)="x" THEN' C hex->Motorala
	TokenSaf="$"+MID$(TokenBuf,3,LEN(TokenBuf)-2)
	TokenBuf=TokenSaf
	TokenType=TTypHex
ENDIF
RETURN

NexToken3:
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

UnDoToken:
SrcNdx=SrcNdx-TokenLen
NextByte=""
RETURN

MacToken:
TokenLen=0
TokenSaf=""
MacToken1:
INC SrcNdx
TempByte=MID$(SrcLine,SrcNdx,1)
AsciiByte=ASC(TempByte)
IF AsciiByte=NewLine OR AsciiByte=0 THEN
	DEC SrcNdx
	RETURN
ENDIF
IF AsciiByte=$2c THEN'  comma
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

ValidSym:
SymbolOK=0
IF LEN(RootSym)>28 THEN
	RETURN
ENDIF
IF LNFlag=0 THEN 5110
IF LEN(RootSym)>5 THEN 5110
TempByte=MID$(RootSym,1,1)
IF TempByte<"0" OR TempByte>"9" THEN 5110
LabNdx=1
lbl5102:
INC LabNdx
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
5110:
LabNdx=1
TempByte=MID$(RootSym,1,1)
IF TempByte>="A" AND TempByte<="Z" THEN 5112
IF TempByte>="a" AND TempByte<="z" THEN 5112
IF TempByte="_" THEN 5112
RETURN
5112:
INC LabNdx
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

ValidInt:
IntOK=0
IF LEN(TokenBuf)>10 THEN
	RETURN
ENDIF
ValidNdx=0
5122:
INC ValidNdx
IF ValidNdx>LEN(TokenBuf) THEN
	IntOK=$ff
	RETURN
ENDIF
TempByte=MID$(TokenBuf,ValidNdx,1)
IF TempByte>="0" AND TempByte<="9" THEN 5122
RETURN

ValidHex:
HexOK=0
IF LEN(TokenBuf)>9 THEN
	RETURN
ENDIF
ValidNdx=1
5142:
INC ValidNdx
IF ValidNdx>LEN(TokenBuf) THEN
	HexOK=$ff
	RETURN
ENDIF
TempByte=MID$(TokenBuf,ValidNdx,1)
IF TempByte>="0" AND TempByte<="9" THEN 5142
IF TempByte>="a" AND TempByte<="f" THEN 5142
RETURN

ValidFlt:
OneDot=0
FloatOK=0
IF LEN(TokenBuf)>21 THEN
	RETURN
ENDIF
ValidNdx=0
ValidFlt1:
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

SymSrch:
SymFull=0
SymFound=0
SymNdx=0
TempName=SymTemp.SymName
TempStr=TempName
IF TempName="ERR" THEN
	SymTemp.SymName="errno"
	TempName=SymTemp.SymName
ENDIF
IF LEFT$(TempName,1)="$" THEN
	LEFT$(TempName,1)="x"
	SymTemp.SymName="0"+TempName
	TempName=SymTemp.SymName
ENDIF
IF RIGHT$(TempName,1)="$" THEN
	TempName=LEFT$(TempName,LEN(TempName)-1)
	SymTemp.SymName=TempName+"_Str"
	TempName=SymTemp.SymName
ENDIF
TempInt=0
SETVEC KeyStringArray=ADDR(TempName)
FOR I=1 TO LEN(TempName)
	TempInt=TempInt+KeyStringArray(I)
NEXT I
SymSrch1:
INC SymNdx
IF SymNdx>LastSym THEN
	RETURN
ENDIF
IF SymNdx>SymTabSiz THEN
	SymFull=$ff
	RETURN
ENDIF
IF SymTableKey(SymNdx)<>TempInt THEN SymSrch1
IF SymTable(SymNdx).SymName<>TempName THEN SymSrch1
SymFound=$ff
RETURN

SymSearch:
GOSUB SymSrch
IF SymFound=$ff THEN
	RETURN
ENDIF
SymTemp.SymName=TokenSaf
GOSUB SymSrch
RETURN

SymInsert:
IF SymFull=$ff THEN
	ErrNo=ErrSymFul
	RETURN
ENDIF
SymTable(SymNdx)=SymTemp
LastSym=SymNdx
TempStr=SymTemp.SymName
TempInt=0
SETVEC KeyStringArray=ADDR(TempStr)
FOR I=1 TO LEN(TempStr)
	TempInt=TempInt+KeyStringArray(I)
NEXT I
SymTableKey(SymNdx)=TempInt
RETURN

KeyLook:
KeyNdx=0
TempInt=0
SETVEC KeyStringArray=ADDR(TokenBuf)
FOR I=1 TO LEN(TokenBuf)
	TempInt=TempInt+KeyStringArray(I)
NEXT I
LookUp1:
INC KeyNdx
IF KeyNdx=LastKey THEN
	KeyNdx=0
	RETURN
ENDIF
IF KeyTable(KeyNdx).KeyCheckWord<>TempInt THEN LookUp1
IF KeyTable(KeyNdx).KeyName=TokenBuf THEN
	RETURN
ENDIF
GOTO LookUp1

CmpOps:
Op1Class=0
AndOrFlag=$ff
CompFlag=$ff
OutBuf="_True=0;"
GOSUB OutCode
CmpOps1:
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
GOSUB ClrDatTyp
GOSUB Expr
ErrRet
Op1Name=TSymName
Op1Class=OpClass
Op1Type=TDataType
Op1Mod=TDataMod
Op1Detail=TDetail
IF TDataType=BOOLEAN THEN
	IF NextByte="=" OR NextByte="<" THEN
		GOSUB NexToken
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
GOSUB NexToken
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
CmpOps2:
GOSUB Expr
ErrRet
Op2Name=TSymName
Op2Class=OpClass
Op2Type=TDataType
Op2Mod=TDataMod
Op2Detail=TDetail
IF Op1Class=INTClass OR Op1Class=FLTClass THEN
	GOSUB CmpNum
	ErrRet
ENDIF
IF Op1Class<>Op2Class THEN
	EXITIF Op1Class=INTClass AND Op2Class=FLTClass
	EXITIF Op1Class=FLTClass AND Op2Class=INTClass
	ErrNo=ErrTypMis
	RETURN
ENDIF
IF Op1Class=STRClass THEN
	GOSUB CmpString
ENDIF
CmpOps3:
IF Op1Class=BOOLClass THEN
	GOSUB CmpBool
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
GOSUB OutCode
GOSUB NexToken
IF TokenBuf="and" THEN
	AndOrFlag=0
	GOTO CmpOps1
ENDIF
IF TokenBuf="or" THEN
	AndOrFlag=$ff
	GOTO CmpOps1
ENDIF
RETURN

ClrDatTyp:
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
DMData=0
DMTemp=0
DMVector=0
DMMember=0
DMMulti=0
DMConst=0
DMAddr=0
DMArray=0
RETURN

GtRootSym:
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
GtRtSym1:
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
GtRtSym2:
INC SubCtr
IF SubCtr>3 THEN
	ErrNo=ErrSyntax
	RETURN
ENDIF
GtRtSym3:
INC LabNdx
TempByte=MID$(TokenSaf,LabNdx,1)
IF TempByte=")" OR TempByte="," THEN
	SymNdxSaf=SymNdx
	TempStr=SymTemp.SymName
	IF LEFT$(Subscript(SubCtr),1)>="0" AND LEFT$(Subscript(SubCtr),1)<="9" THEN
		SubValue(SubCtr)=VAL(Subscript(SubCtr))
	ELSE
		SymTemp.SymName=Subscript(SubCtr)
		GOSUB SymSrch
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

F0:
' EOF(#FileNum)
INC FcnLabNum
FileStat=$ff
GOSUB ClassOp
GOSUB GetPthNum2
ErrRet
OutBuf="STATUS=lseek(_IOPthNum,0,1);"
GOSUB OutCode
OutBuf="if (STATUS == -1) goto _FLbl"+STR$(FcnLabNum)+";"
GOSUB OutCode
OpClass=BOOLClass
TDataType=BOOLEAN
GOSUB GetTmp
ErrRet
OutBuf=SymTemp.SymName+"=0;"
GOSUB OutCode
OutBuf="(long)_XferAddr=lseek(_IOPthNum,0,2);"
GOSUB OutCode
OutBuf="if (STATUS == (long)_XferAddr) "+SymTemp.SymName+"=1;"
GOSUB OutCode
OutBuf="STATUS=lseek(_IOPthNum,STATUS,0);"
GOSUB OutCode
OutBuf="_FLbl"+STR$(FcnLabNum)+":;"
GOSUB OutCode
GOSUB CallErr
ExpTable(ExpNdx)=SymNdx
RETURN

F1:
' LEN(String)
GOSUB ClassOp
IF TDataType<>STRING OR DMArray=$ff THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
GOSUB GetIntTmp
ErrRet
OutBuf=SymTemp.SymName+"=_StrLen(&"+TSymName+");"
GOSUB OutCode
ExpTable(ExpNdx)=SymNdx
RETURN

F2:
' STR$(Number)
GOSUB ClassOp
GOSUB LoadReg
ErrRet
IF OpClass<>INTClass AND OpClass<>FLTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
IF OpClass=INTClass THEN
	IF FloatFlag<>0 THEN
		OutBuf="_d0=_d0f;"
		GOSUB OutCode	
	ENDIF
	OutBuf="_LtoA(_d0);"
ELSE
	OutBuf="_DtoA(_d0f);"
ENDIF
GOSUB OutCode
GOSUB NumToA
RETURN

NumToA:
GOSUB GetStrVec
ErrRet
OutBuf="_MovStr(&"+SymTemp.SymName+",&_CBuf1Vec);"
GOSUB OutCode
ExpTable(ExpNdx)=SymNdx
RETURN

F3:
' VAL(String)
GOSUB ClassOp
IF TDataType<>STRING OR DMArray=$ff THEN
	ErrNo=ErrTypMis'  wrong type
	RETURN
ENDIF
IF Op1Class=FLTClass AND FcnCode=3 THEN
	FcnCode=23
ENDIF
OutBuf="_ClrConv();"
GOSUB OutCode
OutBuf="_MovStr(&_CBufVec,&"+TSymName+");"
GOSUB OutCode
IF FcnCode=23 THEN
	OutBuf="_d0f=_AtoD();"
ELSE
	OutBuf="_d0=_AtoL();"
ENDIF
GOSUB OutCode
IF FcnCode=23 THEN
	INC FloatFlag
	OpClass=FLTClass
	TDataType=FLOAT
	GOSUB GetFltTmp
	ErrRet
ELSE
	OpClass=INTClass
	GOSUB GetIntTmp
	ErrRet
ENDIF
IF FcnCode=23 THEN
	OutBuf=SymTemp.SymName+"=_d0f;"
ELSE
	OutBuf=SymTemp.SymName+"=_d0;"
ENDIF
GOSUB OutCode
ExpTable(ExpNdx)=SymNdx
RETURN

F4:
' LAND(Exp1,Exp2)
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
IF DMVector=$ff THEN
	GOSUB VecSymNam
ENDIF
FcnOp1Nam=TSymName
INC ExpNdx
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
IF DMVector=$ff THEN
	GOSUB VecSymNam
ENDIF
GOSUB GetIntTmp
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
GOSUB OutCode
ExpTable(ExpNdx)=SymNdx
RETURN

F5:
' MID$(String,Position,Quantity)
IF FcnCode=5 THEN
	IF ExpRight-ExpLeft<>4 THEN
		ErrNo=ErrFcn
		RETURN
	ENDIF
ENDIF
GOSUB MidLftRt
RETURN

MidLftRt:
GOSUB ClassOp
IF TDataType<>STRING THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
IF DMVector=$ff AND DMTemp=0 THEN
	REM need to make a temp vector
	GOSUB SetTmpVec
	ErrRet
ENDIF
OutBuf="_a0=&"+TSymName+";"
GOSUB OutCode
INC ExpNdx
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
IF FcnCode=5 THEN
	GOSUB LoadReg'  first arg
	ErrRet
	INC ExpNdx
	GOSUB ClassOp
	IF OpClass<>INTClass THEN
		ErrNo=ErrTypMis
		RETURN
	ENDIF
	GOSUB LoadReg'  second arg
	ErrRet
OutBuf="_MidStr((long)_a0,_d0,_d1,"+STR$(Target)+");"' Cast for ansi proto
GOSUB OutCode
ELSE
	GOSUB LoadReg'  load d0
	ErrRet
	IF FcnCode=7 THEN
		OutBuf="_MidStr((long)_a0,1,_d0,"+STR$(Target)+");"' Cast for ansi proto
	ELSE
		IF FcnCode=10 THEN
			OutBuf="_RightStr((long)_a0,_d0,"+STR$(Target)+");"' Cast for ansi proto
		ELSE
			OutBuf="_Remnant((long)_a0,_d0,"+STR$(Target)+");"
		ENDIF
	ENDIF
	GOSUB OutCode
ENDIF
ExpNdx=ExpLeft+1
RETURN

F6:
' LOR(Exp1,Exp2)
GOSUB F4
RETURN

F7:
' LEFT$(String,Quantity)
IF ExpRight-ExpLeft<>3 THEN
	ErrNo=ErrFcn
	RETURN
ENDIF
GOSUB MidLftRt
RETURN

F8:
' MOD(Exp1,Exp2)
GOSUB F4
RETURN

F9:
' CHR$(Expr)
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
GOSUB LoadReg
ErrRet
GOSUB GetChrVec
ErrRet
OutBuf="_ChrTmp"+STR$(ChrTmpUse)+"=_d0;"
GOSUB OutCode
ExpTable(ExpNdx)=SymNdx
RETURN

F10:
' RIGHT$(String,Quantity)
GOSUB MidLftRt
RETURN

F11:
' ASC(String)
GOSUB ClassOp
IF TDataType<>STRING OR DMArray=$ff THEN
	ErrNo=ErrFcn
	RETURN
ENDIF
GOSUB GetIntTmp
ErrRet
OutBuf=SymTemp.SymName+"=*((unsigned char*)"+TSymName+"._Ptr);"
GOSUB OutCode
ExpTable(ExpNdx)=SymNdx
RETURN

F12:
' NOT(Boolean)
GOSUB ClassOp
IF TDataType<>1 THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
OpClass=BOOLClass
TDataType=BOOLEAN
GOSUB GetTmp
ErrRet
IF DMVector=$ff THEN
	GOSUB VecSymNam
ENDIF
OutBuf=SymTemp.SymName+"= (!"+TSymName+");"
GOSUB OutCode
ExpTable(ExpNdx)=SymNdx
RETURN

F13:
' BUFADR(Buffer)
GOSUB ClassOp
IF TDataType<>BUFFER THEN
	ErrNo=ErrTypMis
ENDIF
GOSUB GetIntTmp
ErrRet
IF FcnCode=13 THEN
	OutBuf=SymTemp.SymName+"=(long)"+TSymName+"._BufPtr;"
ELSE
	OutBuf=SymTemp.SymName+"="+TSymName+"._BufSiz;"
ENDIF
GOSUB OutCode
ExpTable(ExpNdx)=SymNdx
RETURN

F14:
' BUFSIZ(Buffer)
GOSUB F13
RETURN

F15:
' TAB()
IF PrintFlag=0 THEN
	ErrNo=ErrFcn
	RETURN
ENDIF
TabFlag=$ff
GOSUB ClassOp
IF OpClass=INTClass THEN
	GOSUB LoadReg
	ErrRet
	OutBuf="_PrintTab(_d0);"
	GOSUB OutCode
	GOSUB CallErr
	GOSUB GenXfrCnt
ELSE
	ErrNo=ErrTypMis
ENDIF
RETURN

F16:
' PEEK
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
D0Loaded=0
GOSUB LoadReg
OutBuf="(long)_Poker=_d0;"
GOSUB OutCode
GOSUB GetIntTmp
ErrRet
OutBuf=SymTemp.SymName+"=*_Poker;"
GOSUB OutCode
ExpTable(ExpNdx)=SymNdx
RETURN

F17:
' ADDR(Var)
GOSUB ClassOp
IF FloatFlag>0 THEN
	DEC FloatFlag
ENDIF
IF TDataType>STRING AND TDataType<COMPLEX OR DMConst=$ff THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
GOSUB GetBase
GOSUB GetIntTmp
ErrRet
OutBuf=SymTemp.SymName+"=(long)_a0;"
GOSUB OutCode
ExpTable(ExpNdx)=SymNdx
RETURN

F18:
' LXOR(IntExpr)
GOSUB F4
RETURN

F19:
' LNOT(IntExpr)
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
GOSUB GetIntTmp
ErrRet
IF DMVector=$ff THEN
	GOSUB VecSymNam
ENDIF
OutBuf=SymTemp.SymName+"= ~"+TSymName+";"
GOSUB OutCode
ExpTable(ExpNdx)=SymNdx
RETURN

F20:
' INDEX(Pointer,IntExpr)
GOSUB ClassOp
IF DMAddr=0 THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
FcnOp1Nam=TSymName
IF DMVector=$ff THEN
	FcnOp1Nam=FcnOp1Nam+"._Ptr"
ENDIF
GOSUB GetVarSiz
INC ExpNdx
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
GOSUB GetIntTmp
ErrRet
OutBuf=SymTemp.SymName+"=(long)"+FcnOp1Nam+"+"+TSymName+"*"+STR$(VarSize)+";"
GOSUB OutCode
ExpTable(ExpNdx)=SymNdx
RETURN

GetVarSiz:
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

F21:
' SIZE(Var)
GOSUB ClassOp
IF FloatFlag>0 THEN
	DEC FloatFlag
ENDIF
IF TDataType<1 OR TDataType>6 THEN SIZE1
VarSize=TDataSize
GOTO SIZE2
SIZE1:
IF TDataType=BUFFER THEN
	VarSize=8
	GOTO SIZE2
ENDIF
IF TDataType=COMPLEX THEN
	VarSize=TDataSize
	GOTO SIZE2
ENDIF
ErrNo=ErrTypMis
RETURN
SIZE2:
GOSUB GetIntTmp
ErrRet
OutBuf=SymTemp.SymName+"="+STR$(VarSize)+";"
GOSUB OutCode
ExpTable(ExpNdx)=SymNdx
RETURN

F22:
' IVAL(String)
GOSUB F3
RETURN

F23:
' FVAL(String)
GOSUB F3
RETURN

F24:
' TRM$
GOSUB ClassOp
IF TDataType<>STRING THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
IF DMVector=$ff AND DMTemp=0 THEN
	GOSUB SetTmpVec
	ErrRet
ENDIF
OutBuf="_TrmStr(&"+TSymName+");"
GOSUB OutCode
ExpNdx=ExpLeft+1
RETURN

F25:
' FILSIZ(#FileNum)
INC FcnLabNum
FileStat=$ff
GOSUB ClassOp
GOSUB GetPthNum2
ErrRet
OutBuf="STATUS=lseek(_IOPthNum,0,1);"
GOSUB OutCode
OutBuf="if (STATUS == -1) goto _FLbl"+STR$(FcnLabNum)+";"
GOSUB OutCode
GOSUB GetIntTmp
ErrRet
OutBuf=SymTemp.SymName+"=lseek(_IOPthNum,0,2);"
GOSUB OutCode
ExpTable(ExpNdx)=SymNdx
OutBuf="STATUS=lseek(_IOPthNum,STATUS,0);"
GOSUB OutCode
OutBuf="_FLbl"+STR$(FcnLabNum)+":;"
GOSUB OutCode
GOSUB CallErr
RETURN

F26:
' FILPOS(#FileNum)
FileStat=$ff
GOSUB ClassOp
	GOSUB GetPthNum2
	ErrRet
	OutBuf="STATUS=lseek(_IOPthNum,0,1);"
	GOSUB OutCode
	GOSUB CallErr
	GOSUB GetIntTmp
	ErrRet
	OutBuf=SymTemp.SymName+"=STATUS;"
	GOSUB OutCode
ExpTable(ExpNdx)=SymNdx
RETURN

F27:
' SQR(Expr)
GOSUB ClassOp
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
GOSUB GetFltTmp
ErrRet
IF DMVector=0 THEN
	OutBuf=SymTemp.SymName+"="+TempStr+"((double)"+TSymName+");"
ELSE
	OutBuf=SymTemp.SymName+"="+TempStr+"(*((double*)"+TSymName+"._Ptr));"
ENDIF
GOSUB OutCode
ExpTable(ExpNdx)=SymNdx
RETURN

F28:
' INT(FloatExpr)
GOSUB ClassOp
IF FloatFlag>0 THEN
	DEC FloatFlag
ENDIF
IF OpClass<>FLTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
GOSUB GetIntTmp
ErrRet
IF DMVector=0 THEN
	OutBuf=SymTemp.SymName+"=(long)"+TSymName+";"
ELSE
	OutBuf=SymTemp.SymName+"=(long)*((double*)"+TSymName+"._Ptr);"
ENDIF
GOSUB OutCode
ExpTable(ExpNdx)=SymNdx
RETURN

F29:
' ABS(Expr)
GOSUB ClassOp
IF OpClass<>INTClass AND OpClass<>FLTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
IF DMVector=$ff THEN
	GOSUB VecSymNam
ENDIF
IF OpClass=INTClass THEN
	GOSUB GetTmp
	ErrRet
	OutBuf=SymTemp.SymName+"=abs("+TSymName+");"
	GOSUB OutCode
ELSE
	GOSUB GetFltTmp
	ErrRet
	OutBuf=SymTemp.SymName+"=fabs("+TSymName+");"
	GOSUB OutCode
ENDIF
ExpTable(ExpNdx)=SymNdx
RETURN

F30:
' SIN(Expr)
GOSUB F27
RETURN

F31:
' COS(Expr)
GOSUB F27
RETURN

F32:
' TAN(Expr)
GOSUB F27
RETURN

F33:
' ASN(Expr)
GOSUB F27
RETURN

F34:
' ACS(Expr)
GOSUB F27
RETURN

F35:
' ATN(Expr)
GOSUB F27
RETURN

F36:
' LOG(Expr)
GOSUB F27
RETURN

F37:
' LOG10(Expr)
RETURN

F38:
' GETMENU(MenuName)
RETURN

F39:
' GETFILE()
RETURN

F40:
' THOUR()
GOSUB DateTime
RETURN

F41:
' TMIN()
GOSUB DateTime
RETURN

F42:
' TSEC()
GOSUB DateTime
RETURN

F43:
' TYEAR()
GOSUB DateTime
RETURN

F44:
' TMON()
GOSUB DateTime
RETURN

F45:
' TDAT()
GOSUB DateTime
RETURN

F46:
' TDAY()
GOSUB DateTime
RETURN

DateTime:
OutBuf="_t=time(0);"
GOSUB OutCode
OutBuf="_systime=localtime(&_t);"
GOSUB OutCode
GOSUB GetIntTmp
ErrRet
IF FcnCode=40 THEN
	OutBuf=SymTemp.SymName+"=_systime->tm_hour;"
	GOSUB OutCode
ENDIF
IF FcnCode=41 THEN
	OutBuf=SymTemp.SymName+"=_systime->tm_min;"
	GOSUB OutCode
ENDIF
IF FcnCode=42 THEN
	OutBuf=SymTemp.SymName+"=_systime->tm_sec;"
	GOSUB OutCode
ENDIF
IF FcnCode=43 THEN
	OutBuf=SymTemp.SymName+"=_systime->tm_year;"
	GOSUB OutCode
ENDIF
IF FcnCode=44 THEN
	OutBuf=SymTemp.SymName+"=_systime->tm_mon+1;"
	GOSUB OutCode
ENDIF
IF FcnCode=45 THEN
	OutBuf=SymTemp.SymName+"=_systime->tm_mday;"
	GOSUB OutCode
ENDIF
IF FcnCode=46 THEN
	OutBuf=SymTemp.SymName+"=_systime->tm_wday;"
	GOSUB OutCode
ENDIF
ExpTable(ExpNdx)=SymNdx
RETURN

F47:
' CHKWORD(STRING)
'code template is for ASC(STRING)
GOSUB ClassOp
IF TDataType<>STRING OR DMArray=$ff THEN
	ErrNo=ErrFcn
	RETURN
ENDIF
GOSUB GetIntTmp
ErrRet
OutBuf=SymTemp.SymName+"=*((unsigned char*)"+TSymName+"._Ptr);"
GOSUB OutCode
ExpTable(ExpNdx)=SymNdx
RETURN

F48:
' HEX$(INT)
GOSUB ClassOp
GOSUB LoadReg
ErrRet
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
OutBuf="_LtoH(_d0,"+STR$(HexType)+");"
GOSUB OutCode
GOSUB NumToA
RETURN

F49:
' BITTST(ByteVar,Bit#)
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
GOSUB LoadReg
ErrRet
INC ExpNdx
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
GOSUB LoadReg
ErrRet
OutBuf="_d1=1<<_d1;"
GOSUB OutCode
OpClass=BOOLClass
TDataType=BOOLEAN
GOSUB GetTmp
ErrRet
OutBuf="if (_d0&_d1) "+SymTemp.SymName+"=1;"
GOSUB OutCode
OutBuf="else "+SymTemp.SymName+"=0;"
GOSUB OutCode
ExpTable(ExpNdx)=SymNdx
RETURN

F50:
' SHL
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
GOSUB LoadReg
ErrRet
INC ExpNdx
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
GOSUB LoadReg
ErrRet
IF FcnCode=50 THEN
	OutBuf="_d0=_d0<<_d1;"
ELSE
	IF FcnCode=51 THEN
		OutBuf="_d0=_d0>>_d1;"
	ELSE
		OutBuf="_d1=1<<_d1;"
		GOSUB OutCode
		IF FcnCode=54 THEN
			OutBuf="_d0=_d0^_d1;"
		ELSE
			IF FcnCode=55 THEN
				OutBuf="_d1=_d1^0xffffffff;"
				GOSUB OutCode
				OutBuf="_d0=_d0&_d1;"
			ELSE
				IF FcnCode=56 THEN
				OutBuf="_d0=_d0|_d1;"
				ENDIF
			ENDIF
		ENDIF
	ENDIF
ENDIF
GOSUB OutCode
GOSUB GetIntTmp
ErrRet
OutBuf=SymTemp.SymName+"=_d0;"
GOSUB OutCode
ExpTable(ExpNdx)=SymNdx
RETURN

F51:
' SHR
GOSUB F50
RETURN

F52:
' ROL
GOSUB F50
RETURN

F53:
' ROR
GOSUB F50
RETURN

F54:
' BITCHG
GOSUB F50
RETURN

F55:
' BITCLR
GOSUB F50
RETURN

F56:
' BITSET
GOSUB F50
RETURN

F57:
' SUBSTR(Str1,Str2,[StartPos])
GOSUB ClassOp
IF TDataType<>STRING THEN
	ErrNo=ErrIVType
	RETURN
ENDIF
IF DMVector=$ff AND DMTemp=0 THEN
	GOSUB SetTmpVec
	ErrRet
ENDIF
FcnOp1Nam=TSymName
INC ExpNdx
GOSUB ClassOp
IF TDataType<>STRING THEN
	ErrNo=ErrIVType
	RETURN
ENDIF
IF DMVector=$ff AND DMTemp=0 THEN
	GOSUB SetTmpVec
	ErrRet
ENDIF
TempStr=TSymName
IF ExpRight-ExpLeft=4 THEN
	INC ExpNdx
	GOSUB ClassOp
	IF OpClass<>INTClass THEN
		ErrNo=ErrIVType
		RETURN
	ENDIF
ELSE
	TSymName="1"
ENDIF
GOSUB GetIntTmp
ErrRet
OutBuf=SymTemp.SymName+"=_SubStr(&"+FcnOp1Nam+",&"+TempStr+","+TSymName+");"
GOSUB OutCode
ExpTable(ExpNdx)=SymNdx
RETURN

F58:
' ZSTR$(INT)
GOSUB ClassOp
GOSUB LoadReg
ErrRet
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
OutBuf="_ZLtoA(_d0);"
GOSUB OutCode
GOSUB NumToA
RETURN

F59:
' ZHEX$(INT)
GOSUB ClassOp
GOSUB LoadReg
ErrRet
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
OutBuf="_ZLtoH(_d0);"
GOSUB OutCode
GOSUB NumToA
RETURN

F60:
' USING()
NumArgs=ExpRight-ExpLeft-1
IF NumArgs<2 OR NumArgs>NumTemps THEN
	ErrNo=ErrFcn
	RETURN
ENDIF
FOR Ctr1=1 TO NumArgs
	GOSUB ClassOp
	IF TDataType<>STRING OR DMAddr=$ff THEN
		GOSUB MakString
		ErrRet
		GOSUB ClassOp
	ENDIF
	OutBuf="_PUArgs["+STR$(Ctr1-1)+"]=(long)&"+TSymName+";"
	GOSUB OutCode
	INC ExpNdx
NEXT Ctr1
OutBuf="_PrtUsing("+STR$(NumArgs)+",_PrintBuf,_BufSize);"
GOSUB OutCode
GOSUB CallErr
GOSUB GenXfrCnt
GOSUB OutCRLF
OutBuf="POS=0;"
GOSUB OutCode
ExpTable(ExpNdx)=21'  return zero
RETURN

F61:
' Vacant()
RETURN

F62:
' Vacant()
RETURN

F63:
' Vacant()
RETURN

F64:
' Vacant()
RETURN

F65:
' Vacant()
RETURN

F66:
' Vacant()
RETURN

F67:
' Vacant()
RETURN

F68:
' Vacant()
RETURN

F69:
' Vacant()
RETURN

F70:
' Vacant()
RETURN

F71:
' RND()
GOSUB GetIntTmp
ErrRet
OutBuf=SymTemp.SymName+"=rand();"
GOSUB OutCode
ExpTable(ExpNdx)=SymNdx
RETURN

F72:
' Vacant()
RETURN

F73:
' Vacant()
RETURN

F74:
' Vacant()
RETURN

F75:
' Vacant()
RETURN

F76:
' Vacant()
RETURN

F77:
' LCASE$()
GOSUB ClassOp
IF TDataType<>STRING OR DMArray=$ff THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
OutBuf="_MovStr(&_IOBufVec,&"+TSymName+");"
GOSUB OutCode
OutBuf="_LCase(&_IOBufVec);"
GOSUB OutCode
ExpTable(ExpNdx)=108' 108 is _IOBufVec
RETURN

F78:
' UCASE$()
GOSUB ClassOp
IF TDataType<>STRING OR DMArray=$ff THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
OutBuf="_MovStr(&_IOBufVec,&"+TSymName+");"
GOSUB OutCode
OutBuf="_UCase(&_IOBufVec);"
GOSUB OutCode
ExpTable(ExpNdx)=108' 108 is _IOBufVec
RETURN

F79:
' REMNANT$(String,Quantity)
GOSUB MidLftRt
RETURN

F80:
' FINDADDR()
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
D0Loaded=0
GOSUB LoadReg
OutBuf="(long)_Poker=_d0;"
GOSUB OutCode
INC ExpNdx
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
D0Loaded=0
GOSUB LoadReg
OutBuf="_ArgSafe0=_d0;"
GOSUB OutCode
INC ExpNdx
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
D0Loaded=0
GOSUB LoadReg 
GOSUB GetIntTmp
ErrRet
OutBuf=SymTemp.SymName+"=0;"
GOSUB OutCode
OutBuf="while (_ArgSafe0){"
GOSUB OutCode
OutBuf="if(*_Poker == _d0){"
GOSUB OutCode
OutBuf=SymTemp.SymName+"=(long)_Poker;"
GOSUB OutCode
OutBuf="break;}"
GOSUB OutCode
OutBuf="_Poker++;"
GOSUB OutCode
OutBuf="_ArgSafe0--;}"
GOSUB OutCode
ExpTable(ExpNdx)=SymNdx
RETURN

F81:
' FINDOFFS()
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
D0Loaded=0
GOSUB LoadReg
OutBuf="(long)_Poker=_d0;"
OutBuf="_ArgSafe1=_d0;"
GOSUB OutCode
GOSUB OutCode
INC ExpNdx
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
D0Loaded=0
GOSUB LoadReg
OutBuf="_ArgSafe0=_d0;"
GOSUB OutCode
INC ExpNdx
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
D0Loaded=0
GOSUB LoadReg 
GOSUB GetIntTmp
ErrRet
OutBuf=SymTemp.SymName+"=-1;"
GOSUB OutCode
OutBuf="while (_ArgSafe0){"
GOSUB OutCode
OutBuf="if(*_Poker == _d0){"
GOSUB OutCode
OutBuf=SymTemp.SymName+"=(long)_Poker-_ArgSafe1;"
GOSUB OutCode
OutBuf="break;}"
GOSUB OutCode
OutBuf="_Poker++;"
GOSUB OutCode
OutBuf="_BlkCnt++;"
GOSUB OutCode
OutBuf="_ArgSafe0--;}"
GOSUB OutCode
ExpTable(ExpNdx)=SymNdx
RETURN

OutCode:
INC CLineCtr
IF StartFlag=$ff THEN
	WRITE #CodeFile,OutBuf
ELSE
	WRITE #VarFile,OutBuf
ENDIF
RETURN

OutWrite:
IF PrintFlag=0 THEN
	OutBuf="STATUS=write(_IOPthNum,_XferAddr,XferCount);"
ELSE
	OutBuf="STATUS=write(_PrtPthNum,_XferAddr,XferCount);"
ENDIF
GOSUB OutCode
GOSUB CallErr
GOSUB GenXfrCnt
RETURN

OutRead:
OutBuf="STATUS=read(_IOPthNum,_XferAddr,XferCount);"
GOSUB OutCode
GOSUB CallErr
GOSUB GenXfrCnt
RETURN

OutCRLF:
OutBuf="_XferAddr=_CRLF;"
GOSUB OutCode
OutBuf="XferCount=2;"
GOSUB OutCode
OutBuf="STATUS=write(_PrtPthNum,_XferAddr,XferCount);"
GOSUB OutCode
GOSUB CallErr 
GOSUB GenXfrCnt
RETURN

OutNewLine:
OutBuf="_XferAddr=&_NewLine;"
GOSUB OutCode
OutBuf="XferCount=1;"
GOSUB OutCode
GOSUB OutWrite
RETURN

MacDefInc:
INC MacDefNdx
IF MacDefNdx>MacBufSiz THEN
	DEC MacDefNdx
	ErrNo=ErrMacBuf
ENDIF
RETURN

IncConStk:
INC CSP
IF CSP>40 THEN
	ErrNo=ErrNDeep
ENDIF
RETURN

MakString:
IF OpClass=BOOLClass THEN
	IF TSymName<>"~" THEN
		D0Loaded=0
		GOSUB LoadReg
		ErrRet
	ENDIF
	OutBuf="_BtoA(_d0);"
	GOSUB OutCode
	GOSUB NumToA
	RETURN
ENDIF
IF TSymName<>"~" THEN
	D0Loaded=0
	GOSUB LoadReg
	ErrRet
ENDIF
IF FloatFlag=0 THEN
	OutBuf="_LtoA(_d0);"
ELSE
	OutBuf="_DtoA(_d0f);"
ENDIF
GOSUB OutCode
GOSUB NumToA
RETURN

CSChk:
IF CSP<1 THEN
	ErrNo=ErrUBCon
	RETURN
ENDIF
IF CS(CSP).ConType<>TempInt THEN
	ErrNo=ErrUBCon
ENDIF
RETURN

StrSiz:
SymNdxSaf=SymNdx
TokenBuf=SymTemp.SymName
TempByte=LEFT$(TempStr,1)
IF TempByte>="0" AND TempByte<="9" THEN
	TempInt=VAL(TempStr)
ELSE
	SymTemp.SymName=TempStr
	GOSUB SymSrch
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

Remark:
OutBuf=CHR$($2f)+CHR$($2a)+" LN:"+STR$(BasicLineCtr)+" "+UsrLine+" "+CHR$($2a)+CHR$($2f)
RETURN

BldComment:
OutBuf=CHR$($2f)+CHR$($2a)+Comment+CHR$($2a)+CHR$($2f)
RETURN

GetDtaTyp:
IF TDataType=BOOLEAN OR TDataType=BYTE THEN
	_DataType="unsigned char"
ENDIF
IF TDataType=SHORT THEN
	_DataType="short"
ENDIF
IF TDataType=LONG OR LAND(PointerBit,TDataMod)=PointerBit THEN
	_DataType="long"
ENDIF
IF TDataType=FLOAT THEN
	_DataType="double"
ENDIF
RETURN

VecSymNam:
GOSUB GetDtaTyp
VSymName=TSymName
TSymName="*(("+_DataType+"*)"+VSymName+"._Ptr)"
RETURN

GetIntOp:
GOSUB Expr
ErrRet
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
IF SymTemp.SymName<>"~" THEN
	D0Loaded=0
	GOSUB LoadReg
ENDIF
RETURN

GetFltOp:
GOSUB Expr
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
	GOSUB OutCode
ENDIF
RETURN

GetComma:
GOSUB NexToken
IF TokenBuf<>"," THEN
	ErrNo=ErrSyntax
ENDIF
RETURN

GetColon:
GOSUB NexToken
IF TokenBuf<>":" THEN
	ErrNo=ErrSyntax
ENDIF
RETURN

GetEqual:
GOSUB NexToken
IF TokenBuf<>"=" THEN
	ErrNo=ErrSyntax
ENDIF
RETURN

SubLoad:
D0Loaded=0
GOSUB LoadReg
ErrRet
IF FloatFlag<>0 THEN
	OutBuf="_d0=_d0f;"
	GOSUB OutCode
ENDIF
IF ArrayBase=1 THEN
	OutBuf="_d0--;"
	GOSUB OutCode
ENDIF
RETURN

RegInit:
OutBuf="_d0=0;"
GOSUB OutCode
OutBuf="_d1=0;"
GOSUB OutCode
OutBuf="_d0f=0;"
GOSUB OutCode
OutBuf="_d1f=0;"
GOSUB OutCode
OutBuf="_a0=0;"
GOSUB OutCode
OutBuf=""
GOSUB OutCode
RETURN

FDInit:
RETURN

ReadSource:
UsrLine=""
SrcLine=""
SrcNdx=0
FirstValidChar=FALSE
LOOP
	STATUS=GET #InpFile(InpFilPtr),RawData
	TempInt=STATUS
	IF TempInt=0 THEN
		SrcLine=UsrLine
		RETURN
	ENDIF
	AsciiByte=ASC(RawData)
	IF AsciiByte=NewLine THEN
		SrcLine=UsrLine
		RETURN
	ENDIF
	IF FirstValidChar=FALSE THEN
		IF AsciiByte<>$0a AND AsciiByte<>$09 AND AsciiByte<>$20 THEN
			FirstValidChar=TRUE
			UsrLine=UsrLine+RawData
		ENDIF
	ELSE
		UsrLine=UsrLine+RawData
	ENDIF
ENDLOOP
RETURN

GenCase:
IF OpClass=INTClass THEN
	OutBuf="if (_SwitchInt "+SymType+" _d0) goto _Lbl"+STR$(LabelNum)+";"
ELSE
	OutBuf="_d0=_CmpStr(&_SwitchStr,&"+TSymName+");"
	GOSUB OutCode
	OutBuf="if (_d0 "+SymType+" 1) goto _Lbl"+STR$(LabelNum)+";"
ENDIF
GOSUB OutCode
RETURN

EndCasex:
TempInt=7
GOSUB CSChk
ErrRet
OutBuf="goto _Lbl"+STR$(CS(CSP).TermLabel)+";"' when case code finishes
GOSUB OutCode
OutBuf="_Lbl"+STR$(CS(CSP).ContLabel)+":;"' get here if case not true
GOSUB OutCode
RETURN

MainLoopInit:
GOSUB ClrDatTyp
LetFlag=0
Target=0
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
RETURN
