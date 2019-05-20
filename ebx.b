' OmniBasic Copyright 1995-2003 Innomation Systems, Inc.
' All Rights Reserved
'
' This source file is provided for educational, documentary, and porting
' purposes only. The recipient agrees to hold this information in strict
' confidence. The recipient agrees to these terms by accepting this software
' source code. Violations may result in criminal and/or civil penalties under
' the copyright and trade secret laws of the United States of America.

' Edition History

' 10-19-02 OmniBasic release 1.44 as base for adaptation
' 11-16-02 Began conversion to x86 asm

' MACROS

MACRO GenExport
WRITE #ExportFile,OutBuf
INC AsmLineCtr
ENDMACRO

MACRO GenResource
WRITE #ResourceFile,OutBuf
INC AsmLineCtr
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
	TDataType=LONGVAR
ENDIF
ENDMACRO

MACRO ErrRet
IF ErrNo<>0 THEN
	RETURN
ENDIF
ENDMACRO

MACRO ErrMain
IF ErrNo<>0 THEN MainLoop
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
CONST ErrEndFcn=32
CONST ErrArrSub=33
CONST ErrEndProc=34
CONST ErrEndTbl=35
CONST ErrTblArgs=36
CONST ErrFcnArgs=37
CONST ErrTypeFcn=38

CONST COMPVAR=0
CONST BOOLVAR=1
CONST BYTEVAR=2
CONST WORDVAR=3
CONST LONGVAR=4
CONST FLOATVAR=5
CONST STRINGVAR=6
CONST LABELVAR=7
CONST MACROVAR=8
CONST OPER=9
CONST FCN=10
CONST PROC=11
CONST TYPE=12
CONST VOIDX=13
CONST COMPLEX=14
CONST BUFFER=15
CONST LABELPTR=16

CONST ArrayBit=$0001
CONST PointerBit=$0002
CONST ConstBit=$0004
CONST MultiBit=$0008
CONST MemberBit=$0010
CONST VectorBit=$0020
CONST TempBit=$0040
CONST DataBit=$0080
CONST ReDimBit=$0100
CONST UsrFcnBit=$0200
CONST CalledBit=$0400
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
CONST TTypOct=11
CONST TTypBin=12

CONST PTArrOpn=3
CONST PTArrCls=4
CONST PTFcnOpn=5
CONST PTFcnCls=6
CONST PTCpxOpn=24
CONST PTFCpxCls=25

CONST NumTemps=15
CONST OBQUOTE=$22
CONST LabelResolved=$ff
CONST LabelUnresolved=0

CONST _BufSize=300
CONST MacBufSiz=50000
CONST ExpTabSiz=300
CONST UserSym=197'  set to first user symbol in PreDefined
CONST SymTabSiz=3000

DIM OwnerName AS STRING*28
DIM OwnerCode AS LONG
DIM OperandOwnerName AS STRING*28
DIM FOROperandOwnerName AS STRING*28
DIM Op1OwnerName AS STRING*28
DIM Op2OwnerName AS STRING*28
DIM IgnoreRightParam AS BYTE
DIM FcnTypes(8) AS BYTE
DIM ProcFlag AS BYTE
DIM FcnFlag AS BYTE
DIM ProcFcnFlag AS BYTE
DIM ProcFcn AS BYTE
DIM InitTrue AS BYTE
DIM HasFcn AS BYTE
DIM SimpleCmp AS BYTE
DIM ComplexCmp AS BYTE
DIM PathIsVector AS BYTE
DIM RepeatFlag AS BYTE
DIM RepeatCnt AS LONG
DIM LastFilePos AS LONG
DIM ArrayDetail AS LONG
DIM ArrayDataType AS INTEGER
DIM CpxArrayOffset AS LONG
DIM OpSizeStr AS STRING*16
DIM ForDataType AS INTEGER
DIM D1Cleared AS BYTE
DIM TableNdx AS LONG
DIM TableTypeNdx AS LONG
DIM TableName AS STRING*28
DIM TableElements AS LONG
DIM TableCounter AS LONG
DIM CommaCounter AS LONG
DIM I AS LONG
DIM J AS LONG
DIM FirstValidChar AS BOOLEAN
DIM FilBufSiz AS LONG
DIM FilBufAdr AS LONG
DIM ANSIArgCtr AS LONG
DIM ObjType AS BYTE
DIM ObjClass AS LONG
DIM TempObjClass AS LONG
DIM ObjSubClass AS LONG
DIM GUIFlag AS BYTE
DIM Place AS BYTE
DIM HaltFlag AS BYTE
DIM AsmFlag AS BYTE
DIM DLLFlag AS BYTE
DIM FloatFlag AS BYTE
DIM ExpFlag AS BYTE
DIM SubCtr AS BYTE
DIM SubCtrSaf AS BYTE
DIM MultiFlag AS BYTE
DIM SubValue(3) AS LONG
DIM SubValSaf(3) AS LONG
DIM PrtPthFlg AS BYTE
DIM Comment AS STRING*64
DIM DirFlag AS BYTE
DIM CrOpFlag AS BYTE
DIM StatFlag AS BYTE
DIM LopCtrNum AS LONG
DIM LastSym AS LONG
DIM LastPublicSym AS LONG
DIM PublicOwnerName AS STRING*28
DIM LastSymSaf AS LONG
DIM LastKey AS LONG
DIM LetFlag AS BYTE
DIM StartFlag AS BYTE
DIM DataFlag AS BYTE
DIM SelectFlag AS BYTE
DIM CaseFlag AS BYTE
DIM CaseElseFlag AS BYTE
DIM CaseToFlag AS BYTE
DIM XBufSize AS LONG
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
DIM FcnName AS STRING*28
DIM FcnDataMod AS INTEGER
DIM FcnSymNdx AS LONG
DIM NumArgs AS BYTE
DIM TFcnArgs AS LONG
DIM AsmOut AS BYTE
DIM DumpSyms AS BYTE
DIM FloatOK AS BYTE
DIM OneDot AS BYTE
DIM LstExp AS LONG
DIM NoGen AS BYTE
DIM OptNdx AS LONG
DIM Opt AS STRING*1
DIM CondValid AS BYTE
DIM CondOp1 AS LONG
DIM CondOp2 AS LONG
DIM GenFlag(20) AS BYTE
DIM GFNdx AS LONG
DIM AddInst AS STRING*5
DIM DecInc AS STRING*3
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
DIM LdRegName AS STRING*16
DIM Reg0Name AS STRING*16
DIM Reg1Name AS STRING*16
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
DIM VarName AS STRING*28
DIM BufName AS STRING*28
DIM BufDataSize AS LONG
DIM AccMode AS STRING*40
DIM CreatMode AS STRING*40
DIM PathVar AS STRING*42
DIM PathName AS STRING*28
DIM ToSubFlag AS BYTE
DIM ToSub AS STRING*5
DIM DigDec AS BYTE
DIM BitType AS BYTE
DIM TFcnDataType AS BYTE
DIM FcnSpec AS BYTE
DIM JmpArgs AS LONG
DIM LabelNum AS LONG
DIM OELabelNum AS LONG
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
DIM ConStk(40) AS ConStruct
DIM ConStkPtr AS LONG
DIM InpFile(20) AS LONG
DIM InpFilPtr AS LONG
DIM DeclareFile AS LONG
DIM CodeFile AS LONG
DIM PreCodeFile AS LONG
DIM LibFile AS LONG
DIM DataFile AS LONG
DIM DimFile AS LONG
DIM FunctionFile AS LONG
DIM ImportFile AS LONG
DIM ExportFile AS LONG
DIM ResourceFile AS LONG
DIM OutFile AS LONG
DIM RawData AS STRING*1
DIM TempStr AS STRING*_BufSize
DIM FcnOp1Nam AS STRING*28
DIM FcnOp2Nam AS STRING*28
DIM TempName AS STRING*28
DIM TempInt AS LONG
DIM StringLength AS LONG
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
	Owner AS LONG
	DataType AS INTEGER
	DataMod AS INTEGER
	Detail AS LONG
	DataAddr AS LONG
	DataSize AS LONG
	ArrayDim1 AS LONG
	ArrayDim2 AS LONG
	ArrayDim3 AS LONG
	ArrayDims AS BYTE
	Misc AS BYTE
	FcnDataType AS BYTE
	FcnArgs AS BYTE
END TYPE
DIM SymTable(SymTabSiz) AS Symbol
DIM SymTableKey(SymTabSiz) AS LONG
TYPE KeyData
	KeyCheckWord AS LONG
	KeyName AS STRING*16
	KeyLabel AS LABEL
END TYPE
DIM UMFlag AS BYTE
DIM GblVarFlg AS BYTE
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
DIM SimpleOp AS STRING*8
DIM SimpleStructOp AS STRING*8
DIM ArraySize AS LONG
DIM ForNdx AS LONG
DIM DataTemp AS BYTE
DIM TSymName AS STRING*28
DIM VSymName AS STRING*28
DIM TOwner AS LONG
DIM TDataType AS INTEGER
DIM TblDataType AS INTEGER
DIM TDataMod AS INTEGER
DIM VDataMod AS INTEGER
DIM TDetail AS LONG
DIM VDetail AS LONG
DIM TDataAddr AS LONG
DIM VDataAddr AS LONG
DIM TDataSize AS LONG
DIM ExpTable(ExpTabSiz) AS LONG
DIM TypePtr AS LONG
DIM TypeFlag AS BYTE
DIM LastEntry AS Symbol
DIM SymTemp AS Symbol
DIM SrcLine AS STRING*_BufSize
DIM SrcLineSaf AS STRING*_BufSize
DIM OutBuf AS STRING*_BufSize
DIM TokenBuf AS STRING*_BufSize
DIM ExpEnd AS BYTE
DIM TokenLen AS BYTE
DIM ExpLen AS LONG
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
DIM BasicLineCtr AS LONG
DIM AsmLineCtr AS LONG
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
DIM TypeNdx AS LONG
DIM LabelFlag AS BYTE
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
DIM DMReDim AS BYTE
DIM EndFound AS BYTE
DIM TFileName AS STRING*28
DIM FileName AS STRING*28
DIM UseFilNam AS STRING*28
DIM Ctr1 AS LONG
DIM Ctr2 AS LONG
DIM Ctr3 AS LONG
DIM WhiteSpaceCtr AS LONG
DIM SrcNdx AS LONG
DIM EndNdx AS LONG
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

PRINT  "Copyright  1995-2003 Innomation Systems, Inc."
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

ON ERROR GOTO NoDeclareFile
DELETE "_DeclareFile"
NoDeclareFile:
CREATE #DeclareFile,"_DeclareFile":WRITE+TEXT

ON ERROR GOTO NoPreCodeFile
DELETE "_PreCodeFile"
NoPreCodeFile:
CREATE #PreCodeFile,"_PreCodeFile":WRITE+TEXT

ON ERROR GOTO NoCodeFile
DELETE "_CodeFile"
NoCodeFile:
CREATE #CodeFile,"_CodeFile":WRITE+TEXT

ON ERROR GOTO NoDataFile
DELETE "_DataFile"
NoDataFile:
CREATE #DataFile,"_DataFile":WRITE+TEXT

ON ERROR GOTO NoDimFile
DELETE "_DimFile"
NoDimFile:
CREATE #DimFile,"_DimFile":WRITE+TEXT

ON ERROR GOTO NoFunctionFile
DELETE "_FunctionFile"
NoFunctionFile:
CREATE #FunctionFile,"_FunctionFile":WRITE+TEXT

ON ERROR GOTO NoExportFile
DELETE "_ExportFile"
NoExportFile:
CREATE #ExportFile,"_ExportFile":WRITE+TEXT

ON ERROR GOTO NoResourceFile
DELETE "_ResourceFile"
NoResourceFile:
CREATE #ResourceFile,"_ResourceFile":WRITE+TEXT

ON ERROR
GFNdx=1
GenFlag(GFNdx)=$ff
XBufSize=_BufSize
SelectFlag=0
CaseFlag=0
CaseElseFlag=0
ProcFlag=0
FcnFlag=0
ProcFcnFlag=0
DataFlag=0
NoGen=0'  default OFF
ExpFlag=0
LastSym=UserSym
AsmFlag=0
HaltFlag=0
GUIFlag=0
DLLFlag=0
UDump=0'  default OFF
StartFlag=0
DumpSyms=0'  default OFF
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
PublicOwnerName=""
OwnerName=PublicOwnerName
OwnerCode=0
ConStkPtr=0
LopVarNdx=0
StringNum=0
LabelNum=0
TableNum=0
LoopNum=0
MacExFlag=0
BasicLineCtr=0
AsmLineCtr=0
ErrNo=0
PoolCtr=0
VarBytRem=0

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
SymTemp.Owner=0
READ SymTemp.DataType
READ SymTemp.DataMod
READ SymTemp.Detail
READ SymTemp.DataAddr
READ SymTemp.DataSize
SymTable(SymNdx)=SymTemp
SymTableKey(SymNdx)=CHKWORD(TempStr)
GOTO InitSym

LoadKeyWords:

TABLE KeyTable AS KeyData
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
 0,"beep",BeepX
 0,"endexit",EndExitX
 0,"redim",ReDimX
 0,"playwave",PlayWaveX
 0,"setvec",SetVecX
 0,"digits",DigitsX
 0,"macro",MacroX
 0,"endmacro",EndMacroX
 0,"table",TableX
 0,"endtable",EndTableX
 0,"include",IncludeX
 0,"freeze",FreezeX
 0,"call",CallX
 0,"chdir",ChDirX
 0,"mkdir",MkDirX
 0,"rmdir",RmDirX
 0,"settimer",SetTimerX
 0,"endfunction",EndFunctionX
 0,"endprocedure",EndProcedureX
 0,"randomize",RandomizeX
 0,"declare",DeclareX
 0,"function",FunctionX
 0,"procedure",ProcedureX
 0,"wend",WendX
 0,"continue",ContinueX
 0,"select",SelectX
 0,"endselect",EndSelectX
 0,"case",CaseX
 0,"endcase",EndCaseX
 0,"const",ConstX
 0,"swap",SwapX
 0,"program",ProgramX
 0,"Vacant13",Vacant13X
 0,"makelower",MakeLowerX
 0,"makeupper",MakeUpperX
 0,"vacant1",Vacant1X
 0,"vacant2",Vacant2X
 0,"vacant3",Vacant3X
 0,"%",MainLoop
ENDTABLE

KeyNdx=0
InitKeyWords:
INC KeyNdx
TempStr=KeyTable(KeyNdx).KeyName
IF TempStr="%" THEN Preamble
LastKey=KeyNdx
KeyTable(KeyNdx).KeyCheckWord=CHKWORD(TempStr)
GOTO InitKeyWords

Preamble:
GOSUB CmdLine

'*** Win95/NT ****
NewLine=$0a

OutBuf=";Compiler Delaration Section"
GOSUB OutDeclare
OutBuf=""
GOSUB OutDeclare
OutBuf="format PE "
IF GUIFlag=0 THEN
	OutBuf=OutBuf+"console"
ELSE
	OutBuf=OutBuf+"GUI"
ENDIF
IF DLLFlag<>0 THEN
	OutBuf=OutBuf+" DLL"
ENDIF
GOSUB OutDeclare
OutBuf=""
GOSUB OutDeclare
OutBuf="entry _Start"
GOSUB OutDeclare
OutBuf=""
GOSUB OutDeclare
OutBuf="macro align value { rb (value-1) - (rva $ + value-1) mod value }"
GOSUB OutDeclare
OutBuf=""
GOSUB OutDeclare
OutBuf="_BufSize=300"
GOSUB OutDeclare

OutBuf="section '.data' data readable writeable"
GOSUB OutInitData
OutBuf=""
GOSUB OutInitData
OutBuf="align 4"
GOSUB OutInitData
OutBuf=""
GOSUB OutInitData
OutBuf="ERR dd 0"
GOSUB OutInitData
OutBuf="_ErrVec dd 0"
GOSUB OutInitData
OutBuf="STATUS dd 0"
GOSUB OutInitData
OutBuf="POS dd 0"
GOSUB OutInitData
OutBuf="XferCount dd 0"
GOSUB OutInitData
OutBuf="_TrueStr db "+CHR$(OBQUOTE)+"TRUE"+CHR$(OBQUOTE)+",0"
GOSUB OutInitData
OutBuf="_FalseStr db "+CHR$(OBQUOTE)+"FALSE"+CHR$(OBQUOTE)+",0"
GOSUB OutInitData

RESTORE RunVarTbl
OutBuf="align 4"
GOSUB OutDim
RunVarLoop:
READ OutBuf
IF OutBuf="%" THEN RunVarDone
GOSUB OutDim
GOTO RunVarLoop
RunVarDone:

OutBuf=""
GOSUB OutDim
OutBuf="align 4"
GOSUB OutDim
OutBuf=""
GOSUB OutDim

OutBuf=""
GOSUB OutPreCode
OutBuf="section '.code' code readable executable"
GOSUB OutPreCode
OutBuf="; Main Code Section"
GOSUB OutPreCode
OutBuf=""
GOSUB OutPreCode
OutBuf="_Start:"
GOSUB OutPreCode
OutBuf=""
GOSUB OutPreCode
OutBuf="invoke GetModuleHandle, NULL"
GOSUB OutPreCode
OutBuf="mov dword [_hInstance], eax"
GOSUB OutPreCode
OutBuf="invoke GetCommandLine"
GOSUB OutPreCode
OutBuf="mov dword [_ArgList],eax"
GOSUB OutPreCode
OutBuf="mov dword edi,ProgramName"
GOSUB OutPreCode
OutBuf="call __MovArg"
GOSUB OutPreCode
OutBuf="invoke GetStdHandle, STD_INPUT_HANDLE"
GOSUB OutPreCode
OutBuf="mov dword [_InHandle], eax"
GOSUB OutPreCode
OutBuf="invoke GetStdHandle, STD_OUTPUT_HANDLE"
GOSUB OutPreCode
OutBuf="mov dword [_OutHandle], eax"
GOSUB OutPreCode
OutBuf="mov byte [_CRLF+12],13"
GOSUB OutPreCode
OutBuf="mov byte [_CRLF+13],10"
GOSUB OutPreCode
OutBuf="mov byte [_CRLF+14],0"
GOSUB OutPreCode
OutBuf="mov byte [_Prompt+12],63"
GOSUB OutPreCode
OutBuf="mov byte [_Prompt+13],0"
GOSUB OutPreCode
OutBuf="mov byte [_NullStr+12],0"
GOSUB OutPreCode
OutBuf="mov dword [_ErrVec],_ErrExit"
GOSUB OutPreCode

RESTORE RunStringTbl
OutBuf="_ErrExitMsg db 'Error exit',0"
GOSUB OutInitData
RunStringLoop:
READ VarName
IF VarName="%" THEN RunStringDone
READ ArraySize
TempInt=ArraySize/4
IF Mod(ArraySize,4)<>0 THEN
	TempInt=TempInt+1
ENDIF
OutBuf="align 4"
GOSUB OutInitData
OutBuf=VarName+" dd "+VarName+"+12"
GOSUB OutInitData
OutBuf=" dd "+STR$(ArraySize)
GOSUB OutInitData
OutBuf=" dd 0"
GOSUB OutInitData
OutBuf=" rb "+STR$(ArraySize)
GOSUB OutInitData
GOTO RunStringLoop
RunStringDone:

OutBuf=""
GOSUB OutFunction
OutBuf="; Function Code Section"
GOSUB OutFunction
OutBuf=""
GOSUB OutFunction

OutBuf=""
GenExport
OutBuf="section '.edata' export data readable"
GenExport
OutBuf=""
GenExport

OutBuf=""
GenResource
OutBuf="section '.rsrc' resource data readable"
GenResource
OutBuf=""
GenResource
OutBuf="; End of Resource Section"
GenResource
OutBuf=""
GenResource
OutBuf="section '.reloc' fixups data readable discardable"
GenResource

MainLoop:
IF ErrNo<>0 THEN
	IF ErrNo=ErrMacArg THEN
		PRINT "Fatal Error... MACRO argument error in line ";BasicLineCtr
		END
	ENDIF
	PRINT SrcLine
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
	PRINT TempStr';" in line ";BasicLineCtr
	IF ErrNo=ErrSymFul THEN
		PRINT "Fatal Error... Symbol Table Full"
		'PRINT "Total symbols=";SymNdx
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
		IF SymTable(LastSym).DataType<>STRINGVAR OR LAND(SymTable(LastSym).DataMod,ConstBit)<>ConstBit THEN NotString
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
	GOSUB OutCodeData
	GOTO MainLoop
ENDIF
IF TempByte="+" OR TempByte="." THEN
	OutBuf=MID$(SrcLine,2,LEN(SrcLine)-1)
	GOSUB OutCodeData
	GOTO MainLoop
ENDIF
IF TempByte="$" THEN
	' Process Directive
	GOSUB Remark
	GOSUB OutCodeData
	INC SrcNdx
	GOSUB NexToken
	IF TokenBuf="if" THEN IFDx
	IF TokenBuf="else" THEN ELSEDx
	IF TokenBuf="endif" THEN ENDIFDx
	ErrNo=ErrSyntax
	GOTO MainLoop
ENDIF 
GOSUB NexToken
SrcNdx=0
IF NextByte<>":" THEN ProcStmt 

'ProcLabel
StartFlag=$ff
IF DataFlag=$ff THEN
	DataFlag=0
ENDIF
LNFlag=$ff
GOSUB TokenSym
ErrMain
LabelFlag=$ff
TDataType=SymTable(SymNdx).DataType
TDetail=SymTable(SymNdx).Detail
TDataSize=SymTable(SymNdx).DataSize
TempStr=OwnerName+SymbolSaf
SymbolSaf=TempStr
IF SymFound<>0 THEN' Label Found
	IF TDataType<>LABELVAR THEN
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
	TDataType=LABELVAR
	SymTemp.DataType=LABELVAR
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
	IF SymFound=$ff AND SymTable(SymNdx).DataType=MACROVAR THEN
		GOSUB Remark
		GOSUB OutCodeData
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
IF KeyNdx<>1 THEN
	DataFlag=0
ENDIF
GOSUB Remark
SELECT CASE KeyNdx
	CASE 1
		GOSUB OutInitData
		GOTO DataX
	CASE 6
		GOSUB OutDim
		GOTO TypeX
	CASE 7
		GOTO DimX
	CASE 68
		GOSUB OutFunction
		GOTO FunctionX
	CASE 69
		GOSUB OutFunction
		GOTO ProcedureX
	CASE ELSE
		StartFlag=$ff
		GOSUB OutCodeData' put out OmniBasic source as comment
		OutBuf=""
		GOSUB OutLabel
		GOTO [KeyTable(KeyNdx).KeyLabel]
END SELECT

ProcCmd:
IF Op1Class<>STRClass THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
OutBuf="mov dword edi,"+Op1Name
GOSUB OutCodeData
OutBuf="call __MovArg"
GOSUB OutCodeData
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
	SymTemp.DataType=COMPVAR
	GOSUB ClrSym
	GOSUB SymInsert
	ErrRet
ELSE
	IF SymTable(SymNdx).DataType<>COMPVAR AND SymTable(SymNdx).DataType<> MACROVAR THEN
		ErrNo=ErrTypMis
		RETURN
	ENDIF
	IF LAND(SymTable(SymNdx).DataMod,SetMask)<>0 THEN
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
SELECT CASE TokenType
	CASE TTypInt
		GOSUB ChkInt
		ErrRet
		GOTO SetOp1
	CASE TTypHex
		GOSUB ChkHex
		ErrRet
		GOTO SetOp1
	CASE TTypSym
		GOSUB ChkSym
		ErrRet
		TokenSaf=STR$(SymTable(SymNdx).Detail)
		GOTO SetOp1
	CASE ELSE
		ErrNo=ErrIVExp
		RETURN
END SELECT
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
SELECT CASE TokenType
	CASE TTypInt
		GOSUB ChkInt
		ErrRet
		GOTO SetOperator
	CASE TTypHex
		GOSUB ChkHex
		ErrRet
		GOTO SetOperator
	CASE TTypSym
		GOSUB ChkSym
		ErrRet
		TokenSaf=STR$(SymTable(SymNdx).Detail)
		GOTO SetOperator
	CASE ELSE
		ErrNo=ErrIVExp
		RETURN
END SELECT
SetOperator:
SymNdx=SymNdxSaf
SymTable(SymNdx).Detail=CVTemp
IF CVOp="+" THEN
	CVTemp=SymTable(SymNdx).Detail+VAL(TokenSaf)
ENDIF
SELECT CASE CVOp
	CASE "-"
		CVTemp=SymTable(SymNdx).Detail-VAL(TokenSaf)
	CASE "*"
		CVTemp=SymTable(SymNdx).Detail*VAL(TokenSaf)
	CASE "/"
		CVTemp=SymTable(SymNdx).Detail/VAL(TokenSaf)
	CASE "&"
		CVTemp=LAND(SymTable(SymNdx).Detail,VAL(TokenSaf))
	CASE "|"
		CVTemp=LOR(SymTable(SymNdx).Detail,VAL(TokenSaf))
END SELECT
IF CVOp="<" OR CVOp=">>" THEN
	CVTemp=SymTable(SymNdx).Detail
	TempInt=VAL(TokenSaf)
';if (CVOp[0] == '>') CVTemp=CVTemp>>TempInt;
';else CVTemp=CVTemp<<TempInt;
ENDIF
SetFinish:
SymNdx=SymNdxSaf
SymTable(SymNdx).Detail=CVTemp
SymTable(SymNdx).DataMod=SetMask
OutBuf=SymTable(SymNdx).SymName+" equ "+STR$(CVTemp)
GOSUB OutCodeData
RETURN

MACRODx:
GOSUB NexToken
IF TokenType<>TTypSym THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
ENDIF
SymTemp.SymName=TokenSaf
GOSUB SymSrch
IF SymFound=$ff THEN
	ErrNo=ErrDupSym'  symbol already defined
	GOTO MainLoop
ENDIF
SymTemp.DataType=MACROVAR
GOSUB ClrSym
SymTemp.DataAddr=MacDefNdx'  address of macro in macro buffer
GOSUB SymInsert
ErrMain
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
SELECT CASE TokenBuf
	CASE "macro"
		ErrNo=ErrMacNst'  nested macro
		GOTO MainLoop
	CASE "endmacro"
		MacBuf(MacDefNdx)=0
		GOSUB MacDefInc
		GOTO MainLoop
	CASE "end"
		GOSUB NexToken
		IF TokenBuf="macro" THEN
			MacBuf(MacDefNdx)=0
			GOSUB MacDefInc
			GOTO MainLoop
		ENDIF
END SELECT	
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
SELECT CASE TokenType
	CASE TTypInt
		GOSUB ChkInt
		ErrMain
		GOTO IFDx1
	CASE TTypHex
		GOSUB ChkHex
		ErrMain
		GOTO IFDx1
	CASE TTypSym
		GOSUB TokenSym1
		ErrRet
		TokenSaf=STR$(SymTable(SymNdx).Detail)
		GOTO IFDx1
	CASE ELSE
		ErrNo=ErrIVExp
		GOTO MainLoop
END SELECT
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
		PRINT "FATAL ERROR... DATA block with no label in line "';BasicLineCtr
		END
	ENDIF
	LastStmt="data"' needed for first 'DATA' in block
	GOSUB Remark
	GOSUB OutInitData
	OutBuf=SymbolSaf+":"
	GOSUB OutInitData
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
SELECT CASE TokenType
	CASE TTypHex
		GOSUB ChkHex
		ErrMain
		TempStr=TokenSaf
		GOTO NextData
	CASE TTypInt
		GOSUB ChkInt
		ErrMain
		TempStr=TokenSaf
		GOTO NextData
	CASE TTypFloat
		GOSUB ChkFlt
		ErrMain
		TempStr=TokenSaf
		GOTO NextData
	CASE TTypSym
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
	CASE ELSE
		ErrNo=ErrSyntax
		GOTO MainLoop
END SELECT
NextData:
IF TempStr="" THEN
	TempStr=CHR$($80)
ENDIF
OutBuf="db "+CHR$(OBQUOTE)+TempStr+CHR$(OBQUOTE)+",0"
GOSUB OutInitData
NeedComma=$ff
GOTO DATALoop

RestoreX:
GOSUB ChkLabel
ErrMain
IF SymTable(SymNdx).DataType<>LABELVAR OR SymTable(SymNdx).DataMod<>DataBit THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
OutBuf="mov dword [_DataPtr],"+SymbolSaf
GOSUB OutCodeData
GOTO MainLoop

PokeX:
GOSUB GetIntOp' get addr
ErrMain
OutBuf="mov dword _Poker=eax"
GOSUB OutCodeData
CommaMain
GOSUB GetIntOp' get data
ErrMain
OutBuf="mov dword [_Poker],eax"
GOSUB OutCodeData
GOTO MainLoop

ReturnX:
IF FcnFlag<>0 THEN
	GOSUB NexToken
	IF TokenLen=0 THEN
		ErrNo=ErrSyntax
		GOTO MainLoop
	ENDIF
	GOSUB UnDoToken
	GOSUB Expr
	ErrMain
	SELECT CASE TFcnDataType
		CASE BOOLVAR
			IF TDataType<>BOOLVAR THEN
				ErrNo=ErrTypMis
				GOTO MainLoop
			ENDIF
			OutBuf="mov byte al,["+OperandOwnerName+TSymName+"]"
		CASE LONGVAR
			IF TDataType<>LONGVAR THEN
				ErrNo=ErrTypMis
				GOTO MainLoop
			ENDIF
			IF TSymName<>"~" THEN
				OutBuf="mov eax,["+OperandOwnerName+TSymName+"]"
				GOSUB OutFunction
			ENDIF
			OutBuf="mov [_LongRet],eax"			
		CASE STRINGVAR
			IF TDataType<>STRINGVAR THEN
				ErrNo=ErrTypMis
				GOTO MainLoop
			ENDIF
			OutBuf="mov edi,["+OperandOwnerName+TSymName+"]"
			GOSUB OutFunction
			OutBuf="mov [_StringRet],edi"
			GOSUB OutFunction
			OutBuf="mov edi,["+OperandOwnerName+TSymName+"+4]"
			GOSUB OutFunction
			OutBuf="mov [_StringRet+4],edi"
			GOSUB OutFunction
			OutBuf="mov edi,["+OperandOwnerName+TSymName+"+8]"
			GOSUB OutFunction
			OutBuf="mov [_StringRet+8],edi"
		CASE FLOATVAR
			IF TDataType<>FLOATVAR THEN
				ErrNo=ErrTypMis
				GOTO MainLoop
			ENDIF
	END SELECT
ENDIF
GOSUB OutFunction
OutBuf="ret"
GOSUB OutCodeData
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
GOSUB LoadNumericValue
OutBuf="invoke SetFilePointer,[_IOPthNum],eax,0,FILE_BEGIN"
GOSUB OutCodeData
GOSUB SetStatus
GOSUB CallErr
GOTO MainLoop

TypeX:
IF ProcFcnFlag<>0 THEN
	ErrNo=ErrTypeFcn
	GOTO MainLoop
ENDIF
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

LetX:
GOSUB Let
GOTO MainLoop

Let:
Target=$ff
LetFlag=$ff
GOSUB Expr
ErrRet
IF DMConst<>0 THEN
	ErrNo=ErrIVExp
	RETURN
ENDIF
Op1Name=TSymName
Op1Type=TDataType
Op1Class=OpClass
SELECT CASE Op1Type
	CASE 1
		OpSizeStr=" byte "
	CASE 2
		OpSizeStr=" byte "
	CASE 3
		OpSizeStr=" word "
	CASE 4
		OpSizeStr=" dword "
	CASE ELSE
		OpSizeStr=" "
END SELECT
Op1Mod=TDataMod
Op1Detail=TDetail
Op1DataSize=TDataSize
Op1OwnerName=OperandOwnerName
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
IF Op1Mod=VectorBit AND Op1Type=STRINGVAR AND NextByte=CHR$($22) THEN
	GOSUB NexToken
	IF RIGHT$(TokenSaf,1)<>CHR$(OBQUOTE) THEN
		ErrNo=ErrSyntax
		RETURN
	ENDIF
	IF LEN(TokenBuf)=2 THEN
		OutBuf="mov ["+Op1Name+"+12],0"
		GOSUB OutCode
		GOTO MainLoop
	ELSE
		IF NextByte<>"+" AND Op1Detail>LEN(TokenSaf) THEN
			OutBuf="mov edi,["+Op1Name+"]"
			GOSUB OutCode
			GOSUB MakeStrConst
			OutBuf="mov esi,_StrConst"+STR$(PoolCtr)
			GOSUB OutCode
			OutBuf="call __SetStrConst"
			GOSUB OutCode
			GOTO MainLoop
		ENDIF
	ENDIF
	GOSUB UnDoToken
ENDIF
IF Op1Type=LABELPTR THEN
	GOSUB NexToken
	SymTemp.SymName=TokenSaf
	GOSUB SymSrch
	IF SymFound=0 THEN
		'print "make label here",SrcLine
	ELSE 
		IF  SymTable(SymNdx).DataType<>LABELVAR THEN
			ErrNo=ErrTypMis
			RETURN
		ENDIF	
	ENDIF
	IF LAND(VectorBit,Op1Mod)=0 THEN
		OutBuf="mov dword ["+Op1OwnerName+Op1Name+"],"+SymTemp.SymName
	ELSE
		OutBuf="mov dword esi,["+Op1OwnerName+Op1Name+"]"
		GOSUB OutCode
		OutBuf="mov dword [esi], dword "+SymTemp.SymName
	ENDIF
	GOSUB OutCode
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
Op2OwnerName=OperandOwnerName
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
		IF Op1Mod=0 AND Op2Mod=ConstBit THEN
			Op2Name=STR$(Op2Detail)
			IF Op1Type=BOOLVAR OR Op1Type=BYTEVAR THEN
				IF Op2Detail>255 THEN
					ErrNo=ErrTypMis
					RETURN
				ENDIF
			ENDIF
			IF Op1Type=WORDVAR THEN
				IF Op2Detail>65535 THEN
					ErrNo=ErrTypMis
					RETURN
				ENDIF
			ENDIF
			IF Op1Type=LONGVAR THEN
				IF Op2Detail>$7fffffff THEN
					ErrNo=ErrTypMis
					RETURN
				ENDIF
			ENDIF
			OutBuf="mov"+OpSizeStr+"["+Op1OwnerName+Op1Name+"],"+Op2Name
			GOSUB OutCodeData
			RETURN
		ENDIF
		IF Op1Mod=0 AND Op2Mod=0 THEN
			IF Op1Type>Op2Type AND Op2Type<>BOOLVAR THEN
				OutBuf="xor eax,eax"
				GOSUB OutCodeData
			ENDIF 
			IF Op2Type=BOOLVAR OR Op2Type=BYTEVAR THEN
				OutBuf="mov al,["+Op2OwnerName+Op2Name+"]"			
				GOSUB OutCodeData
				GOSUB StoreInt
				RETURN
			ENDIF
			IF Op2Type=WORDVAR THEN
				OutBuf="mov ax,["+Op2OwnerName+Op2Name+"]"			
				GOSUB OutCodeData
				GOSUB StoreInt
				RETURN
			ENDIF
			IF Op2Type=LONGVAR THEN
				OutBuf="mov eax,["+Op2OwnerName+Op2Name+"]"			
				GOSUB OutCodeData
				GOSUB StoreInt
				RETURN
			ENDIF
		ENDIF
		D0Loaded=0
		GOSUB LoadReg
		ErrRet
	ENDIF
	GOSUB StoreD0
	RETURN
ENDIF
IF Op1Class=STRClass THEN
	OutBuf="mov edi,"+Op1Name
	GOSUB OutCodeData
	OutBuf="mov esi,"+Op2Name
	GOSUB OutCodeData
	OutBuf="call __MovStr"
	GOSUB OutCodeData
	RETURN
ENDIF
IF Op1Class=CPXClass OR Op1Class=ARRClass THEN
	IF LAND(Op1Mod,VectorBit)=0 THEN
		OutBuf="mov edi,"+Op1OwnerName+Op1Name
	ELSE
		OutBuf="mov edi,["+Op1OwnerName+Op1Name+"]"
	ENDIF
	GOSUB OutCodeData
	IF LAND(Op2Mod,VectorBit)=0 THEN
		OutBuf="mov esi,"+Op2OwnerName+Op2Name
	ELSE
		OutBuf="mov esi,["+Op2OwnerName+Op2Name+"]; Get src addr"
	ENDIF
	GOSUB OutCodeData
	IF Op1Class=ARRClass THEN
		TempInt=Op1DataSize
	ELSE
		TempInt=SymTable(Op1Detail).DataSize
	ENDIF
	OutBuf="mov ecx,"+STR$(TempInt)	
	GOSUB OutCodeData
	INC LabelNum
	OutBuf=OwnerName+"_Lbl"+STR$(LabelNum)+":"
	GOSUB OutCodeData
	OutBuf="mov al,byte [esi]"
	GOSUB OutCodeData
	OutBuf="mov byte [edi],al"
	GOSUB OutCodeData
	OutBuf="inc esi"
	GOSUB OutCodeData
	OutBuf="inc edi"
	GOSUB OutCodeData
	OutBuf="dec ecx"
	GOSUB OutCodeData
	OutBuf="jne "+OwnerName+"_Lbl"+STR$(LabelNum)
	GOSUB OutCodeData
	RETURN
ENDIF
SELECT CASE Op1Class
	CASE BOOLClass
		D0Loaded=0
		GOSUB LoadReg
		ErrMain
		GOSUB StoreD0
		RETURN
	CASE OBJClass
		ErrNo=ErrIVType
		RETURN
	CASE FRMClass
		ErrNo=ErrIVType
		RETURN
	CASE ELSE 
		PRINT  "Internal Error"
		END
END SELECT

StoreInt:
IF Op1Type=BOOLVAR OR Op1Type=BYTEVAR THEN
	OutBuf="mov ["+Op1OwnerName+Op1Name+"],al"
ENDIF
IF Op1Type=WORDVAR THEN
	OutBuf="mov ["+Op1OwnerName+Op1Name+"],ax"
ENDIF
IF Op1Type=LONGVAR THEN
	OutBuf="mov ["+Op1OwnerName+Op1Name+"],eax"
ENDIF
GOSUB OutCodeData
RETURN

ForX:
GOSUB TokenSym
ErrMain
IF SymFound=0 THEN
	ErrNo=ErrUDSym
	GOTO MainLoop
ENDIF
ForDataType=SymTable(SymNdx).DataType
GOSUB IncConStk
ErrMain
ConStk(ConStkPtr).LoopName=SymTemp.SymName
GOSUB GetSymTemp
GOSUB ClassOp1
FOROperandOwnerName=OperandOwnerName
IF OpClass<>INTClass OR DMVector<>0 OR DMArray<>0 THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
GOSUB GetLopVec
ErrMain
ConStk(ConStkPtr).LoopVec=LopVarNdx
ConStk(ConStkPtr).ConType=5
ConStk(ConStkPtr).ConLine=BasicLineCtr
EqualMain
GOSUB Expr
ErrMain
IF TSymName="~" THEN
	TSymName="eax"
ENDIF
' set initial value into loop var
IF DMConst<>0 THEN
	OutBuf="mov ["+FOROperandOwnerName+ConStk(ConStkPtr).LoopName+"],"+OperandOwnerName+TSymName
ELSE
	IF DMVector<>0 THEN
		OutBuf="mov edi,["+OperandOwnerName+TSymName+"]"
		GOSUB OutCodeData
		OutBuf="mov eax,[edi]"
		GOSUB OutCodeData
	ELSE
		OutBuf="mov eax,["+OperandOwnerName+TSymName+"]"
		GOSUB OutCodeData
	ENDIF
	OutBuf="mov ["+OperandOwnerName+ConStk(ConStkPtr).LoopName+"],eax"
ENDIF
GOSUB OutCodeData
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
	ConStk(ConStkPtr).ImmTo=$ff
	ConStk(ConStkPtr).ImmToVal=TSymName
ELSE
	ConStk(ConStkPtr).ImmTo=0
ENDIF
IF ConStk(ConStkPtr).ImmTo=0 THEN
	IF DMVector<>0 THEN
		OutBuf="mov edi,["+OperandOwnerName+TSymName+"]"
		GOSUB OutCodeData
		OutBuf="mov eax,[edi]"
		GOSUB OutCodeData
	ELSE
		IF TSymName<>"~" THEN
			OutBuf="mov eax,["+OperandOwnerName+TempStr+"]"
			GOSUB OutCodeData
		ENDIF
	ENDIF
	OutBuf="mov [_LopVec"+STR$(LopVarNdx)+"],eax"
	GOSUB OutCodeData
ENDIF
GOSUB NexToken
IF TokenLen=0 THEN
	ConStk(ConStkPtr).NoStep=$ff
ELSE
	IF TokenBuf<>"step" THEN
		ErrNo=ErrSyntax
		GOTO MainLoop
	ENDIF
	ConStk(ConStkPtr).NoStep=0
	GOSUB Expr
	IF OpClass<>INTClass THEN
		ErrNo=ErrTypMis
		GOTO MainLoop
	ENDIF
	ErrMain
	ConStk(ConStkPtr).NegImmStep=0
	IF TSymName<>"~" AND DMConst<>0 THEN
		ConStk(ConStkPtr).ImmStep=$ff
		ConStk(ConStkPtr).ImmStepVal=TSymName
		IF LEN(TSymName)=10 THEN'???
			IF Mid$(TSymName,3,1)>"7" THEN'???
				ConStk(ConStkPtr).NegImmStep=$ff
			ENDIF
		ENDIF
	ELSE
		ConStk(ConStkPtr).ImmStep=0
		IF TSymName="~" THEN
			TSymName="eax"
		ENDIF
		IF DMVector<>0 THEN
			OutBuf="mov edi,["+OperandOwnerName+TSymName+"]"
			GOSUB OutCodeData
			OutBuf="mov eax,[edi]"
			GOSUB OutCodeData
		ELSE
			OutBuf="mov eax,["+OperandOwnerName+TSymName+"]"
			GOSUB OutCodeData
		ENDIF
		OutBuf="mov [_LopVec"+Str$(LopVarNdx)+"+4],eax"
		GOSUB OutCodeData
	ENDIF
ENDIF
INC LabelNum
OutBuf="_Lbl"+STR$(LabelNum)+":"
GOSUB OutCodeData
ConStk(ConStkPtr).LoopLabel=LabelNum
INC LabelNum
ConStk(ConStkPtr).ContLabel=LabelNum
INC LabelNum
ConStk(ConStkPtr).TermLabel=LabelNum
' compare loopvar to "to" value
IF ConStk(ConStkPtr).ImmStep=$ff AND ConStk(ConStkPtr).NegImmStep=0 OR ConStk(ConStkPtr).NoStep=$ff THEN
	SymTemp.SymName=ConStk(ConStkPtr).LoopName
	IF ForDataType<LONGVAR THEN
		OutBuf="xor eax,eax"
		GOSUB OutCodeData
	ENDIF
	OutBuf="mov eax,["+FOROperandOwnerName+ConStk(ConStkPtr).LoopName+"]"
	GOSUB OutCodeData	
	IF ConStk(ConStkPtr).ImmTo=$ff THEN
		OutBuf="cmp eax,"+ConStk(ConStkPtr).ImmToVal
		GOSUB OutCodeData
	ELSE
		OutBuf="cmp eax,[_LopVec"+STR$(ConStk(ConStkPtr).LoopVec)+"]"
		GOSUB OutCodeData
	ENDIF
	OutBuf="jg _Lbl"+STR$(ConStk(ConStkPtr).TermLabel)
	GOSUB OutCodeData
ENDIF
IF ConStk(ConStkPtr).ImmStep=$ff AND ConStk(ConStkPtr).NegImmStep=$ff THEN
	IF ConStk(ConStkPtr).ImmTo=$ff THEN
		OutBuf=";if ("+ConStk(ConStkPtr).LoopName+"<"+ConStk(ConStkPtr).ImmToVal+") goto _Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+";"
		GOSUB OutCodeData
	ELSE
		OutBuf=";if ("+ConStk(ConStkPtr).LoopName+"<_LopVec"+STR$(ConStk(ConStkPtr).LoopVec)+"._Limit) goto _Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+";"
		GOSUB OutCodeData
	ENDIF
ENDIF
IF ConStk(ConStkPtr).ImmStep=0 AND ConStk(ConStkPtr).NoStep=0 THEN
	IF ConStk(ConStkPtr).ImmTo=0 THEN
		OutBuf=";if ((_LopVec"+STR$(LopVarNdx)+"._Step>=0) && ("+ConStk(ConStkPtr).LoopName+">_LopVec"+STR$(ConStk(ConStkPtr).LoopVec)+"._Limit)) goto _Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+";"
		GOSUB OutCodeData
		OutBuf=";if ((_LopVec"+STR$(LopVarNdx)+"._Step<0) && ("+ConStk(ConStkPtr).LoopName+"<_LopVec"+STR$(ConStk(ConStkPtr).LoopVec)+"._Limit)) goto _Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+";"
		GOSUB OutCodeData
	ELSE
		OutBuf=";if ((_LopVec"+STR$(LopVarNdx)+"._Step>=0) && ("+ConStk(ConStkPtr).LoopName+">"+ConStk(ConStkPtr).ImmToVal+")) goto _Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+";"
		GOSUB OutCodeData
		OutBuf=";if ((_LopVec"+STR$(LopVarNdx)+"._Step<0) && ("+ConStk(ConStkPtr).LoopName+"<"+ConStk(ConStkPtr).ImmToVal+")) goto _Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+";"
		GOSUB OutCodeData
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
IF SimpleCmp<>0 THEN
	IF Op1Type=BYTEVAR AND Op2Detail>255 THEN
		ErrNo=ErrTypMis
		GOTO MainLoop
	ENDIF
	IF Op1Type=WORDVAR AND Op2Detail>65535 THEN
		ErrNo=ErrTypMis
		GOTO MainLoop
	ENDIF
	IF Op1Type=LONGVAR AND Op2Detail>$7fffffff THEN
		ErrNo=ErrTypMis
		GOTO MainLoop
	ENDIF
	OutBuf="cmp ["+Op1OwnerName+Op1Name+"],"+STR$(Op2Detail)
	GOSUB OutCodeData
ENDIF
GOSUB NexToken
IF TokenLen=0 THEN StructIF
GOSUB UnDoToken
GOSUB ChkLabel
ErrMain
IF SymTable(SymNdx).DataType<>LABELVAR THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
IF SimpleCmp=0 THEN
	OutBuf="je _Lbl"+STR$(LabelNum)
	GOSUB OutCodeData
	OutBuf="jmp "+SymTemp.SymName
	GOSUB OutCodeData
	OutBuf="_Lbl"+STR$(LabelNum)+":"
ELSE
	OutBuf=SimpleOp+SymTemp.SymName
ENDIF
GOSUB OutCodeData
GOTO MainLoop
StructIF:
GOSUB IncConStk
ErrMain
ConStk(ConStkPtr).TermLabel=LabelNum
ConStk(ConStkPtr).ConType=0
ConStk(ConStkPtr).ConLine=BasicLineCtr
IF SimpleCmp=0 THEN
	OutBuf="je _Lbl"+STR$(LabelNum)
ELSE
	OutBuf=SimpleStructOp+"_Lbl"+STR$(LabelNum)
ENDIF
GOSUB OutCodeData 
GOTO MainLoop

GotoX:
ToSub="jmp "
GotoX1:
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
	IF TDataType<>LABELPTR THEN
		ErrNo=ErrTypMis
		GOTO MainLoop
	ENDIF
	IF DMVector<>0 THEN
		OutBuf="mov esi,["+OperandOwnerName+TSymName+"]"
		GOSUB OutCode
		OutBuf=ToSub+"dword [esi]"		
	ELSE
		OutBuf=ToSub+"["+OperandOwnerName+TSymName+"]"
	ENDIF
	GOSUB OutCode
	GOTO MainLoop
ENDIF
GOSUB UnDoToken
GOSUB ChkLabel
ErrMain
IF SymTable(SymNdx).DataType<>LABELVAR THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
OutBuf=ToSub+OperandOwnerName+SymbolSaf
GOSUB OutCodeData
GOTO MainLoop

GosubX:
ToSub="call "
GOTO GotoX1

OnX:
LNFlag=$ff
NeedComma=$00
JmpArgs=0
GOSUB NexToken
IF TokenBuf="error" THEN ON_ERROR
GOSUB UnDoToken
INC LabelNum
INC TableNum
OutBuf="align 4"
GOSUB OutInitData
OutBuf="_Table"+STR$(TableNum)+":"
GOSUB OutInitData
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
GOSUB UnDoToken
GOSUB ChkLabel
ErrMain
TempInt=SymTable(SymNdx).Detail
TDataType=SymTable(SymNdx).DataType
IF TDataType<>LABELVAR THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
OutBuf="dd "+SymTable(SymNdx).SymName
GOSUB OutInitData
INC JmpArgs
NeedComma=$ff
GOTO ChkArgs
MakSwitch:
IF JmpArgs<1 THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
ENDIF
Ctr1=0
OutBuf="cmp eax,1"
GOSUB OutCodeData
OutBuf="jl _Lbl"+STR$(LabelNum)
GOSUB OutCodeData
OutBuf="cmp eax,"+STR$(JmpArgs)
GOSUB OutCodeData
OutBuf="jg _Lbl"+STR$(LabelNum)
GOSUB OutCodeData
OutBuf="dec eax"
GOSUB OutCodeData
OutBuf="shl eax,2"
GOSUB OutCodeData
OutBuf="add eax,_Table"+STR$(TableNum)
GOSUB OutCodeData
OutBuf="mov eax,[eax]"
GOSUB OutCodeData
IF ToSubFlag=0 THEN
	OutBuf="jmp dword eax"
ELSE
	OutBuf="call dword eax"
ENDIF
GOSUB OutCodeData
OutBuf="_Lbl"+STR$(LabelNum)+":"
GOSUB OutCodeData
GOTO MainLoop

ON_ERROR:
GOSUB NexToken
IF TokenLen=0 THEN' Turn off ON ERROR
	OutBuf="mov [_ErrVec],_ErrExit"
	GOSUB OutCode
	GOTO MainLoop
ENDIF
IF TokenBuf<>"goto" THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
ENDIF
GOSUB ChkLabel
ErrMain
IF SymTable(SymNdx).DataType<>LABELVAR THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
OutBuf="mov [_ErrVec],"+SymTemp.SymName
GOSUB OutCode
GOTO MainLoop

PrintX:
GOSUB DevChk
PrintFlag=$ff
IF DevFlag=$ff THEN
	PrtPthFlg=$ff
	GOSUB GetPthNum1
	ErrMain
	PrtPthFlg=0
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
IF TDataType<>STRINGVAR OR DMAddr<>0 THEN
	GOSUB MakString
	ErrMain
ENDIF
GOSUB ClassOp
OutBuf="mov esi,"+OperandOwnerName+TSymName
GOSUB OutCodeData
OutBuf="mov edi,_PrintBuf"
GOSUB OutCodeData
OutBuf="call __MovStr"
GOSUB OutCodeData
OutBuf="mov esi,_PrintBuf"
GOSUB OutCodeData
OutBuf="call __StrLen"
GOSUB OutCodeData
OutBuf="mov edx,eax"
GOSUB OutCodeData
OutBuf="add edx,[POS]"
GOSUB OutCodeData
OutBuf="mov [POS],edx"
GOSUB OutCodeData
OutBuf="invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL"
GOSUB OutCodeData
GOSUB CallErrZ
PrtArgSep:
GOSUB NexToken
IF FileIO<>0 THEN
	GOSUB OutCRLF
	IF TokenBuf="," OR TokenBuf=";" THEN
		IF NextByte<>"" THEN PrintLp
	ENDIF
	GOTO PrintEx
ENDIF
IF TokenBuf="," THEN
	OutBuf="xor eax,eax"
	GOSUB OutCodeData
	OutBuf="call __PrintTab"
	GOSUB OutCodeData
	GOSUB CallErr
	IF NextByte="" THEN PrintEx
	GOTO PrintLp
ENDIF
IF TokenBuf=";" THEN
	IF NextByte="" THEN PrintEx
	GOTO PrintLp
ENDIF
PrintEx:
IF TokenBuf<>"," AND TokenBuf<>";" THEN
	OutBuf="invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL"
	GOSUB OutCodeData
	OutBuf="mov [POS],0"
	GOSUB OutCodeData
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
ENDIF
IF FileIO=0 THEN
	GOSUB NexToken
	GOSUB UnDoToken
	IF TokenType=TTypQuote THEN
		GOSUB Expr
		ErrMain
		OutBuf="invoke WriteConsole,[_OutHandle],["+OperandOwnerName+TSymName+"],["+OperandOwnerName+TSymName+"+4],XferCount,NULL"
		GOSUB OutCodeData
		CommaMain
	ELSE
		OutBuf="invoke WriteConsole,[_OutHandle],[_Prompt],1,XferCount,NULL"
		GOSUB OutCodeData
	ENDIF
	GOSUB CallErrZ
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
	IF DMVector<>0 AND DMTemp=0 THEN
		GOSUB SetTmpVec
		ErrMain
	ENDIF
	OutBuf="mov esi,"+TSymName
	GOSUB OutCodeData
	OutBuf="mov [_ArgSafe0],esi"
	GOSUB OutCodeData
	OutBuf="mov [_ArgSafe1],"+STR$(TDataType)
	GOSUB OutCodeData
	OutBuf="call __InpData"
	GOSUB OutCodeData
	GOSUB CallErrZ
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
GOSUB GetSymTemp
GOSUB UnDoToken
Target=$ff
ReadFlag=$ff
LOOP
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
	IF DMAddr<>0 THEN
		TDataType=LONGVAR
	ENDIF
	SELECT CASE TDataType
		CASE BOOLVAR
			OutBuf="call __ReadBool"
		CASE BYTEVAR
			OutBuf="call __ReadByte"'
		CASE WORDVAR
			OutBuf="call __ReadShort"
		CASE LONGVAR
			OutBuf="call __ReadLong"
		CASE FLOATVAR
			OutBuf="call __ReadFlt"
		CASE STRINGVAR
			OutBuf="mov eax,"+STR$(TDetail)
			GOSUB OutCodeData
			OutBuf="call __ReadStr"
	END SELECT
	GOSUB OutCodeData
	NeedComma=$ff
ENDLOOP

FileRead:
GOSUB UnDoToken
GOSUB ReadWrite
ErrMain
INC LabelNum' Start label
INC LabelNum' Finish label
INC LabelNum' Error label
OutBuf="_Lbl"+STR$(LabelNum-2)+":"
GOSUB OutCodeData
OutBuf="mov [_ArgSafe0],esi"
GOSUB OutCodeData
OutBuf="invoke ReadFile,[_IOPthNum],[_IOBuffer],1,XferCount,0"
GOSUB OutCodeData
GOSUB SetStatus
OutBuf="cmp eax,0"
GOSUB OutCodeData
OutBuf="je _Lbl"+STR$(LabelNum)
GOSUB OutCodeData
OutBuf="cmp [XferCount],0"
GOSUB OutCodeData
OutBuf="je _Lbl"+STR$(LabelNum-1)
GOSUB OutCodeData
OutBuf="cmp byte [_IOBuffer+12],13"
GOSUB OutCodeData
OutBuf="je _Lbl"+STR$(LabelNum-1)
GOSUB OutCodeData
OutBuf="cmp byte [_IOBuffer+12],10"
GOSUB OutCodeData
OutBuf="je _Lbl"+STR$(LabelNum-2)
GOSUB OutCodeData
OutBuf="cmp [_ByteCounter],0"
GOSUB OutCodeData
OutBuf="je _Lbl"+STR$(LabelNum-2)
GOSUB OutCodeData
OutBuf="mov al, byte [_IOBuffer+12]"
GOSUB OutCodeData
OutBuf="mov esi,[_ArgSafe0]"
GOSUB OutCodeData
OutBuf="mov [esi],al"
GOSUB OutCodeData
OutBuf="inc esi"
GOSUB OutCodeData
OutBuf="mov [_ArgSafe0],esi"
GOSUB OutCodeData
OutBuf="dec [_ByteCounter]"
GOSUB OutCodeData
OutBuf="jmp _Lbl"+STR$(LabelNum-2)
GOSUB OutCodeData
OutBuf="_Lbl"+STR$(LabelNum-1)+":"
GOSUB OutCodeData
OutBuf="cmp [_ByteCounter],0"
GOSUB OutCodeData
OutBuf="je _OELbl"+STR$(OELabelNum+1)
GOSUB OutCodeData
OutBuf="mov esi,[_ArgSafe0]"
GOSUB OutCodeData
OutBuf="mov byte [esi],0"
GOSUB OutCodeData
OutBuf="jmp _OELbl"+STR$(OELabelNum+1)
GOSUB OutCodeData
OutBuf="_Lbl"+STR$(LabelNum)+":"
GOSUB OutCodeData
GOSUB CallErrZ
GOTO MainLoop
GOSUB OutCodeData

WriteX:
GOSUB ReadWrite
ErrMain
OutBuf="mov [XferCount],0"
GOSUB OutCodeData
INC LabelNum
OutBuf="_Lbl"+STR$(LabelNum)+":"
GOSUB OutCodeData
OutBuf="cmp byte [esi],0; Null?"
GOSUB OutCodeData
OutBuf="je _Lbl"+STR$(LabelNum+1)
GOSUB OutCodeData
OutBuf="inc esi"
GOSUB OutCodeData
OutBuf="inc [XferCount]"
GOSUB OutCodeData
OutBuf="dec [_ByteCounter]"
GOSUB OutCodeData
OutBuf="jne _Lbl"+STR$(LabelNum)
GOSUB OutCodeData
INC LabelNum
OutBuf="_Lbl"+STR$(LabelNum)+":"
GOSUB OutCodeData
GOSUB OutWrite
OutBuf="mov edx,[XferCount]"
GOSUB OutCodeData
OutBuf="mov [_ArgSafe0],edx"
GOSUB OutCodeData
OutBuf="mov eax,[_CRLF]"
GOSUB OutCodeData
OutBuf="mov [_XferAddr],eax"
GOSUB OutCodeData
OutBuf="mov [XferCount],2"
GOSUB OutCodeData
GOSUB OutWrite
OutBuf="mov edx,[_ArgSafe0]"
GOSUB OutCodeData
OutBuf="add edx,[XferCount]"
GOSUB OutCodeData
OutBuf="mov [XferCount],edx"
GOSUB OutCodeData
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
	SELECT CASE TokenBuf
		CASE "if"
			GOTO EndIfX
		CASE "loop"
			GOTO EndLoopX
		CASE "while"
			GOTO EndWhileX
		CASE "exit"
			GOTO EndExitX
		CASE "select"
			GOTO EndSelectX
		CASE "case"
			GOTO EndCaseX
		CASE "function"
			GOTO EndFunctionX
		CASE "procedure"
			GOTO EndProcedureX
		CASE ELSE
			ErrNo=ErrSyntax
			GOTO MainLoop
	END SELECT
ENDIF
OutBuf="xor eax,eax"
GOSUB OutCodeData
OutBuf="invoke ExitProcess, eax"
GOSUB OutCodeData
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
OutBuf="invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,CREATE_NEW,FILE_ATTRIBUTE_NORMAL,0"
GOSUB OutCodeData
OutBuf="mov [STATUS],eax"
GOSUB OutCodeData
OutBuf="mov ["+PathVar+"],eax"
GOSUB OutCodeData
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
OutBuf="invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0"
GOSUB OutCodeData
OutBuf="mov [STATUS],eax"
GOSUB OutCodeData
IF PathIsVector=0 THEN
	OutBuf="mov ["+PathVar+"],eax"
ELSE
	OutBuf="mov edi,["+PathVar+"]"
	GOSUB OutCodeData
	OutBuf="mov [edi],eax"
ENDIF
GOSUB OutCodeData
GOSUB CallErr
GOTO MainLoop

CloseX:
DiskIO=$ff
CloseLp:
GOSUB GetPthNum
ErrMain
OutBuf="invoke CloseHandle,[_IOPthNum]"
GOSUB OutCodeData
GOSUB SetStatus
GOSUB CallErrZ
GOSUB NexToken
IF TokenLen=0 THEN MainLoop
IF TokenBuf<>"," THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
ENDIF
GOTO CloseLp

WhileX:
INC LabelNum
OutBuf="_Lbl"+STR$(LabelNum)+":"
GOSUB OutCodeData
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
ConStk(ConStkPtr).LoopLabel=LabelNum
ConStk(ConStkPtr).ContLabel=LabelNum' For consistancy with CONTINUE statement
INC LabelNum
ConStk(ConStkPtr).TermLabel=LabelNum
ConStk(ConStkPtr).ConType=1
ConStk(ConStkPtr).ConLine=BasicLineCtr
OutBuf="je _Lbl"+STR$(LabelNum)
GOSUB OutCodeData
GOTO MainLoop

EndWhileX:
TempInt=1
GOSUB ConStkChk
ErrMain
OutBuf="jmp _Lbl"+STR$(ConStk(ConStkPtr).LoopLabel)
GOSUB OutCodeData
OutBuf="_Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+":"
GOSUB OutCodeData
DEC ConStkPtr
GOTO MainLoop

NextX:
IF ConStkPtr=0 THEN
	ErrNo=ErrUBCon
	GOTO MainLoop
ENDIF
GOSUB NexToken
IF TokenLen=0 THEN
	TokenSaf=ConStk(ConStkPtr).LoopName
ENDIF
IF TokenSaf<>ConStk(ConStkPtr).LoopName THEN
	ErrNo=ErrUBCon
	GOTO MainLoop
ENDIF
TempInt=5
OutBuf="_Lbl"+STR$(ConStk(ConStkPtr).ContLabel)+":"
GOSUB OutCodeData
GOSUB ConStkChk
ErrMain
' add "step" to loop var
IF ConStk(ConStkPtr).NoStep=$ff THEN
	OutBuf="inc ["+FOROperandOwnerName+ConStk(ConStkPtr).LoopName+"]"
	GOSUB OutCodeData
ELSE
	IF ConStk(ConStkPtr).ImmStep=0 THEN
		OutBuf=";"+ConStk(ConStkPtr).LoopName+"="+ConStk(ConStkPtr).LoopName+"+_LopVec"+STR$(ConStk(ConStkPtr).LoopVec)+"._Step;"
		GOSUB OutCodeData
	ELSE
		OutBuf=";"+ConStk(ConStkPtr).LoopName+"="+ConStk(ConStkPtr).LoopName+"+"+ConStk(ConStkPtr).ImmStepVal+";"
		GOSUB OutCodeData
	ENDIF
ENDIF
' branch back to loop beginning
OutBuf="jmp _Lbl"+STR$(ConStk(ConStkPtr).LoopLabel)
GOSUB OutCodeData
' generate done label
OutBuf="_Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+":"
GOSUB OutCodeData
DEC ConStkPtr
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
GOSUB ConStkChk
ErrMain
INC LabelNum
OutBuf="jmp _Lbl"+STR$(LabelNum)
GOSUB OutCodeData
OutBuf="_Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+":"
GOSUB OutCodeData
ConStk(ConStkPtr).TermLabel=LabelNum
GOTO MainLoop

EndIfX:
TempInt=0
GOSUB ConStkChk
ErrMain
OutBuf="_Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+":"
GOSUB OutCodeData
DEC ConStkPtr
GOTO MainLoop

DeleteX:
GOSUB GetPthNam
ErrMain
OutBuf="invoke DeleteFile,[_IOBuffer]"
GOSUB OutCodeData
GOSUB SetStatus
GOSUB CallErrZ
GOTO MainLoop

BufferX:
GOSUB TokenSym
ErrMain
BufName=SymTemp.SymName
IF SymFound=0 THEN
	GOSUB MakeBuffer
	GOSUB ClrSym
	SymTemp.DataMod=0
	SymTemp.DataType=BUFFER
	SymTemp.DataSize=8
	GOSUB SymInsert
	ErrMain
ENDIF
TDataType=SymTable(SymNdx).DataType
IF TDataType<>BUFFER THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
EqualMain
GOSUB Expr
ErrMain
IF TSymName<>"~" THEN
	D0Loaded=0
	GOSUB LoadReg
	ErrMain
ENDIF
IF DMConst<>0 AND TSymName="0" THEN
	GOSUB ReleaseBuffer
ELSE
	GOSUB GetBuffer
ENDIF
GOTO MainLoop

LoopX:
GOSUB IncConStk
ErrMain
GOSUB NexToken
IF TokenLen=0 THEN
	ConStk(ConStkPtr).ConType=3
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
	OutBuf="mov [_LoopCtr+"+STR$(LopCtrNum*4)+"],"+LdRegName
	GOSUB OutCodeData
	ConStk(ConStkPtr).ConType=4
ENDIF
ConStk(ConStkPtr).ConLine=BasicLineCtr
INC LabelNum
OutBuf="_Lbl"+STR$(LabelNum)+":"
GOSUB OutCodeData
ConStk(ConStkPtr).LoopLabel=LabelNum
ConStk(ConStkPtr).ContLabel=LabelNum' For consistancy with CONTINUE statement
INC LabelNum
ConStk(ConStkPtr).TermLabel=LabelNum
GOTO MainLoop

EndLoopX:
TempInt=3
GOSUB ConStkChk
IF ErrNo<>0 THEN
	ErrNo=0
	TempInt=4
	GOSUB ConStkChk
	ErrMain
ENDIF
IF TempInt=3 THEN
	OutBuf="jmp _Lbl"+STR$(ConStk(ConStkPtr).LoopLabel)
ELSE
	OutBuf="dec [_LoopCtr"+"+"+STR$(LopCtrNum*4)+"];"
	GOSUB OutCodeData
	OutBuf="jne _Lbl"+STR$(ConStk(ConStkPtr).LoopLabel)
	DEC LopCtrNum
ENDIF
GOSUB OutCodeData
OutBuf="_Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+":"
GOSUB OutCodeData
DEC ConStkPtr
GOTO MainLoop

RepeatX:
GOSUB IncConStk
ErrMain
INC LabelNum
OutBuf="_Lbl"+STR$(LabelNum)+":"
GOSUB OutCodeData
ConStk(ConStkPtr).LoopLabel=LabelNum
ConStk(ConStkPtr).ConLine=BasicLineCtr
ConStk(ConStkPtr).ConType=2
INC LabelNum
ConStk(ConStkPtr).ContLabel=LabelNum
INC LabelNum
ConStk(ConStkPtr).TermLabel=LabelNum
GOTO MainLoop

UntilX:
TempInt=2
GOSUB ConStkChk
ErrMain
OutBuf="_Lbl"+STR$(ConStk(ConStkPtr).ContLabel)+":"
GOSUB OutCodeData
GOSUB CmpOps
ErrMain
IF TokenLen<>0 THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
ENDIF
OutBuf="je _Lbl"+STR$(ConStk(ConStkPtr).LoopLabel)
GOSUB OutCodeData
OutBuf="_Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+":"
GOSUB OutCodeData
DEC ConStkPtr
GOTO MainLoop

ExitIfX:
GOSUB CmpOps
ErrMain
IF ConStkPtr<1 THEN
	ErrNo=ErrUBCon
	GOTO MainLoop
ENDIF
IF TokenLen=0 THEN
	OutBuf="jne _Lbl"+STR$(ConStk(ConStkPtr).TermLabel)
	GOSUB OutCodeData
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
ConStk(ConStkPtr).TermLabel=LabelNum
ConStk(ConStkPtr).ConLine=BasicLineCtr
ConStk(ConStkPtr).ConType=6
OutBuf="je _Lbl"+STR$(LabelNum)
GOSUB OutCodeData
GOTO MainLoop

ShellX:
GOSUB Expr
IF TDataType<>STRINGVAR THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
OutBuf="mov edi,_IOBuffer"
GOSUB OutCodeData
OutBuf="mov esi,"+OperandOwnerName+TSymName+"; Get src"
GOSUB OutCodeData
OutBuf="call __MovStr"
GOSUB OutCodeData
OutBuf="cinvoke system,[_IOBuffer]"
GOSUB OutCodeData
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
DecInc="inc"
INCx1:
Target=$ff
GOSUB Expr
ErrMain
FcnOp1Nam=TSymName
IF DMConst<>0 THEN
	ErrNo=ErrIVExp
	GOTO MainLoop
ENDIF
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
IF DMAddr=0 THEN
	IF LAND(VectorBit,TDataMod)=VectorBit THEN
		OutBuf="mov esi,["+SymTemp.SymName+"]"
		GOSUB OutCodeData
		OutBuf=DecInc+_DataType+"[esi]; INC/DEC operand"
	ELSE
		OutBuf=DecInc+" ["+SymTemp.SymName+"]"
	ENDIF
ELSE
	GOSUB GetVarSiz
	IF LAND(VectorBit,TDataMod)=VectorBit THEN
		OutBuf=";(long)"+SymTemp.SymName+"._Ptr=(long)"+SymTemp.SymName+"._Ptr"+LEFT$(DecInc,1)+STR$(VarSize)+";"
		GOSUB OutCodeData
		OutBuf=";*((long*)esi)=(long)"+SymTemp.SymName+"._Ptr;"
	ELSE
		OutBuf=";"+SymTemp.SymName+"="+SymTemp.SymName+LEFT$(DecInc,1)+STR$(VarSize)+";"
	ENDIF
ENDIF
GOSUB OutCodeData
GOTO MainLoop

DecX:
DecInc="dec"
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
	OutBuf="mov [_Decimals],eax"
ELSE
	OutBuf="mov [_Digits],eax"
ENDIF
GOSUB OutCodeData
GOTO MainLoop

ExchangeX:
Target=$ff
GOSUB Expr
ErrMain
IF DMConst<>0 THEN
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
IF DMConst<>0 THEN
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
	IF Op1Type<>STRINGVAR THEN
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
	OutBuf="mov eax,edx"
	GOSUB OutCodeData
	Op1Name=Op2Name
	GOSUB StoreD0
	GOTO MainLoop
ENDIF
IF Op1Class=CPXClass OR Op1Class=ARRClass OR Op1Type=STRINGVAR THEN
	IF LAND(Op1Mod,VectorBit)=0 THEN
		OutBuf="mov esi,"+Op1Name
	ELSE
		OutBuf="mov esi,["+Op1Name+"]"
		GOSUB OutCodeData
		OutBuf="mov esi,[esi]"
	ENDIF
	GOSUB OutCodeData
	IF LAND(Op1Mod,VectorBit)=0 THEN
		OutBuf="mov esi,"+Op2Name
	ELSE
		OutBuf="mov esi,["+Op2Name+"]"
		GOSUB OutCodeData
		OutBuf="mov esi,[esi]"
	ENDIF
	GOSUB OutCodeData
	IF Op1Class=ARRClass THEN
		TempInt=Op1DataSize
	ELSE
		IF Op1Type=STRINGVAR THEN
			TempInt=Op1Detail
		ELSE
			TempInt=SymTable(Op1Detail).DataSize
		ENDIF
	ENDIF
	INC LabelNum		
	OutBuf="mov edx,"+STR$(TempInt)	
	GOSUB OutCodeData
	OutBuf="_Lbl"+STR$(LabelNum)+":"
	GOSUB OutCodeData
	OutBuf="mov al,[esi]"
	GOSUB OutCodeData
	OutBuf="mov ah,[edi]"
	GOSUB OutCodeData
	OutBuf="mov [esi],ah"
	GOSUB OutCodeData
	OutBuf="mov [edi],al"
	GOSUB OutCodeData
	OutBuf="inc esi"
	GOSUB OutCodeData
	OutBuf="inc edi"
	GOSUB OutCodeData	
	OutBuf="dec edx"
	GOSUB OutCodeData
	OutBuf="jne _Lbl"+STR$(LabelNum)
	GOSUB OutCodeData
	GOTO MainLoop	
ENDIF
ErrNo=ErrIVType
GOTO MainLoop

BeepX:
GOTO MainLoop

EndExitX:
TempInt=6
GOSUB ConStkChk
ErrMain
OutBuf="jmp _Lbl"+STR$(ConStk(ConStkPtr-1).TermLabel)
GOSUB OutCodeData
OutBuf="_Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+":"
GOSUB OutCodeData
DEC ConStkPtr
GOTO MainLoop

ReDimX:
IgnoreRightParam=$ff
GOSUB TokenSym
ErrMain
BufName=SymTemp.SymName
BufDataSize=SymTable(SymNdx).DataAddr
IF LAND(SymTable(SymNdx).DataMod,ReDimBit)<>ReDimBit THEN
	ErrNo=ErrTypMis
ENDIF
GOSUB NexToken
IF TokenBuf<>"(" THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
ENDIF
TempInt=0
Ctr1=0
FOR I=SrcNdx TO EndNdx
	IF MID$(SrcLine,I,1)="," THEN
		INC Ctr1
	ENDIF
NEXT I
IF Ctr1>2 THEN
	ErrNo=ErrSyntax
ENDIF
GOSUB Expr
ErrMain
IF TSymName<>"~" THEN
	D0Loaded=0
	GOSUB LoadReg
	ErrMain
ENDIF
OutBuf="imul eax,"+STR$(BufDataSize)
GOSUB OutCodeData
IF DMConst<>0 AND TSymName="0" THEN
	GOSUB ReleaseBuffer
ELSE
	GOSUB GetBuffer
ENDIF
GOTO MainLoop

PlayWaveX:
GOSUB Expr
ErrMain
IF OpClass<>STRClass THEN
	ErrNo=ErrIVType
	GOTO MainLoop
ENDIF
OutBuf="mov esi,"+OperandOwnerName+TSymName
GOSUB OutCodeData
OutBuf="mov eax,[esi]"
GOSUB OutCodeData
OutBuf="mov [_ArgSafe0],eax"
GOSUB OutCodeData
OutBuf="mov [_ArgSafe1],0"
GOSUB OutCodeData
GOSUB NexToken
IF TokenLen=0 THEN PlayWave1
GOSUB Expr
IF OpClass<>INTClass THEN
	ErrNo=ErrIVType
	GOTO MainLoop
ENDIF
IF TSymName<>"~" THEN
	D0Loaded=0
	GOSUB LoadReg
	ErrMain
ENDIF
OutBuf="mov _ArgSafe1,eax"
GOSUB OutCodeData
PlayWave1:
OutBuf="invoke sndPlaySound,[_ArgSafe0],[_ArgSafe1]"
GOSUB OutCodeData
GOTO MainLoop

SetVecX:
GOSUB TokenSym
ErrMain
IF SymFound=0 THEN
	ErrNo=ErrUDSym
	GOTO MainLoop
ENDIF
VectorName=SymTemp.SymName
VDataMod=SymTable(SymNdx).DataMod
VDataAddr=SymTable(SymNdx).DataAddr
IF SymTable(SymNdx).DataType=STRINGVAR THEN
	VDetail=SymTable(SymNdx).Detail
ELSE
	VDetail=0
ENDIF
IF LAND(VDataMod,VectorBit)=0 THEN' Not a vector
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
EqualMain
GOSUB GetIntOp
ErrMain
IF LAND(VDataMod,ArrayBit)=ArrayBit THEN
	TempInt=ArrayBase*VDataAddr
	OutBuf="sub eax,"+STR$(TempInt)
	GOSUB OutCodeData
ENDIF
OutBuf="mov ["+VectorName+"],eax"
GOSUB OutCodeData
IF VDetail<>0 THEN'  must be STRING.. do rest of vector
	GOSUB NexToken
	IF TokenLen=0 THEN
		OutBuf="mov ["+VectorName+"+4],"+STR$(VDetail)
	ELSE
		IF TokenBuf<>"," THEN
			ErrNo=ErrSyntax
			GOTO MainLoop
		ENDIF
		GOSUB GetIntOp
		ErrMain
		OutBuf="mov ["+VectorName+"+4],eax"
	ENDIF
	GOSUB OutCodeData
	OutBuf="mov ["+VectorName+"+8],0"
	GOSUB OutCodeData
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

TableX:
ArraySize=0
GOSUB ClrDatTyp
GOSUB TokenSym
SymNdxSaf=SymNdx
ErrMain
IF SymFound=$ff THEN
	ErrNo=ErrDupSym
	GOTO MainLoop
ENDIF
GOSUB NexToken
IF TokenBuf<>"as" THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
ENDIF
OutBuf=""
GOSUB OutInitData
OutBuf="align 4"
GOSUB OutInitData
OutBuf=SymTemp.SymName+":"
GOSUB OutInitData
GOSUB ClrSym
GOSUB NexToken
SELECT CASE TokenBuf
	CASE "boolean"
		SymTemp.DataType=BOOLVAR
		SymTemp.DataAddr=1
	CASE "byte"
		SymTemp.DataType=BYTEVAR
		SymTemp.DataAddr=1
	CASE "integer"
		SymTemp.DataType=WORDVAR
		SymTemp.DataAddr=2
	CASE "long"
		SymTemp.DataType=LONGVAR
		SymTemp.DataAddr=4
	CASE "double"
		SymTemp.DataType=FLOATVAR
		SymTemp.DataAddr=8
	CASE "label"
		SymTemp.DataType=LABELPTR
		SymTemp.DataAddr=4
	CASE "string"
		SymTemp.DataType=STRINGVAR
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
		SymTemp.DataAddr=TempInt
		StringLength=TempInt
	CASE ELSE
		TableName=SymTemp.SymName
		SymTemp.SymName=TokenSaf
		GOSUB SymSrch
		IF SymFound=0 THEN
			ErrNo=ErrUDSym
			GOTO MainLoop
		ENDIF
		IF SymTable(SymNdx).DataType<>TYPE THEN
			ErrNo=ErrTypMis
			GOTO MainLoop
		ENDIF
		TypeNdx=SymNdx
		SymTemp.SymName=TempStr
		TypeVars=SymTable(SymNdx).Detail
		SymTemp.DataType=COMPLEX
		SymTemp.Detail=TypeNdx
		SymTemp.DataAddr=SymTable(SymNdx).DataSize
		SymTemp.DataSize=SymTemp.DataAddr
		SymTemp.SymName=TableName
END SELECT
SymTemp.DataMod=ArrayBit
SymNdx=SymNdxSaf
GOSUB SymInsert
ErrMain
TblDataType=SymTemp.DataType
TDataType=TblDataType' Useful only if NOT COMPLEX data type
RepeatFlag=0
TblLoop:
IF RepeatFlag<>0 THEN
	DEC RepeatCnt
	IF RepeatCnt=0 THEN
		RepeatFlag=0
		GOTO TblLoop
	ENDIF
	SrcNdx=0
	GOSUB NexToken
ELSE
	GOSUB ReadSource
	GOSUB NexToken
	IF TokenBuf="repeat" THEN
		RepeatFlag=$ff
		GOSUB NexToken
		IF TokenBuf="until" THEN
			GOSUB NexToken
			RepeatCnt=VAL(TokenSaf)
			RepeatCnt=RepeatCnt-ArraySize+1
		ELSE
			RepeatCnt=VAL(TokenSaf)+1
		ENDIF
		SrcLine=SrcLineSaf
		GOTO TblLoop
	ELSE
		SrcLineSaf=SrcLine
	ENDIF
ENDIF
IF InpFilPtr=1 THEN
	INC BasicLineCtr
ENDIF
IF TempInt=0 THEN
	PRINT "Fatal Error: EOF in TABLE"
	END
ENDIF
'GOSUB NexToken
TDataAddr=SymTemp.DataAddr		
IF TokenBuf="endtbl" OR TokenBuf="endtable" THEN
	IF TokenBuf="end" THEN
		GOSUB  NexToken
		IF TokenBuf<>"tbl" THEN
			ErrNo=ErrSyntax
			GOTO MainLoop
		ENDIF
	ENDIF
	SymTable(SymNdxSaf).DataSize=ArraySize*TDataAddr
	OutBuf="; End of table"
	GOSUB OutInitData
	OutBuf=""
	GOSUB OutInitData
	GOTO MainLoop
ENDIF
INC ArraySize
IF TblDataType=COMPLEX THEN
	GOSUB UnDoToken
	FOR I=1 TO TypeVars
		GOSUB NexToken
		IF TokenBuf="," THEN
			GOSUB NexToken
			IF TokenBuf="," THEN
				ErrNo=ErrSyntax
				GOTO MainLoop
			ENDIF
		ENDIF
		TDataType=SymTable(TypeNdx+I).DataType
		IF TDataType=STRINGVAR THEN
			StringLength=SymTable(TypeNdx+I).Detail
		ENDIF
		GOSUB MakeTableEntry	
	NEXT I
ELSE
	GOSUB MakeTableEntry
	ErrMain
ENDIF
GOTO TblLoop

MakeTableEntry:
SELECT CASE TDataType
	CASE BOOLVAR
		IF TokenBuf="true" THEN
			OutBuf="db 1"
		ELSE
			IF TokenBuf="false" THEN
				OutBuf="db 0"
			ELSE
				ErrNo=ErrTypMis
				RETURN
			ENDIF
		ENDIF	
	CASE BYTEVAR
		GOSUB ChkConst
		IF IVAL(TokenSaf)>255 THEN
			ErrNo=ErrTypMis
			RETURN
		ENDIF
		GOSUB TblInt
		ErrMain
		OutBuf="db "+TempStr
	CASE WORDVAR
		GOSUB ChkConst
		IF IVAL(TokenSaf)>65535 THEN
			ErrNo=ErrTypMis
			RETURN
		ENDIF
		GOSUB TblInt
		ErrMain
		OutBuf="dw "+TempStr
	CASE LABELPTR
		GOSUB UnDoToken
		GOSUB ChkLabel
		ErrMain
		OutBuf="dd "+TempStr
	CASE LONGVAR
		GOSUB ChkConst
		IF IVAL(TokenSaf)>$7fffffff THEN
			ErrNo=ErrTypMis
			RETURN
		ENDIF
		GOSUB TblInt
		ErrMain
		OutBuf="dd "+TempStr
	CASE FLOATVAR
		'
	CASE STRINGVAR
		IF TokenType<>TTypQuote THEN
			ErrNo=ErrTypMis
			RETURN	
		ENDIF
		IF LEN(TokenSaf)-1>StringLength THEN
			PRINT SrcLine
			PRINT "Fatal Error: Oversize string in table" 
			END
		ENDIF
		IF LEN(TokenSaf)>2 THEN
			OutBuf="db "+TokenSaf+",0"
		ELSE
			OutBuf="db 0"
		ENDIF
		FOR Ctr1=1 TO StringLength-LEN(TokenSaf)+1
			OutBuf=OutBuf+",0"
		NEXT Ctr1
END SELECT
GOSUB OutInitData
RETURN

ChkConst:
IF TokenType=TTypInt THEN
	RETURN
ENDIF
SymTemp.SymName=TokenSaf
GOSUB SymSrch
IF SymFound=0 THEN
	ErrNo=ErrUDSym
	RETURN
ENDIF
TokenSaf=STR$(SymTable(SymNdx).Detail)
TokenBuf=TokenSaf
TokenType=TTypInt
RETURN

TblInt:
IF TokenType=TTypInt THEN
	GOSUB ValidInt
	IF IntOK=0 THEN
		ErrNo=ErrIVExp
		RETURN
	ENDIF
	TempStr=TokenSaf
ENDIF
RETURN

EndTableX:
Print "Fatal Error: EndTable while not in table"
END
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
PRINT  "Cannot open file: "';UseFilNam
END

NoImportFile:
PRINT "Cannot open Import File"
END

NoLibFile:
PRINT "Cannot open Lib File"
END

FreezeX:
GOTO FIXDx

CallX:
GOSUB NexToken
SymTemp.SymName=TokenSaf
FcnName=TokenSaf
GOSUB SymSrch
GOSUB GetSymTemp
IF SymFound=0 THEN
	ErrNo=ErrUDSym
	GOTO MainLoop
ENDIF
IF SymTemp.DataType<>PROC THEN
	ErrNo=ErrTypMis
	GOTO MainLoop
ENDIF
FcnDataMod=SymTable(SymNdx).DataMod
FcnSymNdx=SymNdx
IF SymTemp.FcnArgs<>0 THEN
	GOSUB PushArgs
	ErrMain
ENDIF
TempInt=FcnDataMod
TempInt=LOR(TempInt,CalledBit)
SymTable(FcnSymNdx).DataMod=TempInt
OutBuf="call "+FcnName
GOSUB OutCodeData
GOTO MainLoop
 
ChDirX:
GOSUB GetPthNam
ErrMain
OutBuf="invoke SetCurrentDirectory,[_IOBuffer]"
GOSUB OutCodeData
GOSUB SetStatus
GOSUB CallErrZ 
GOTO MainLoop

MkDirX:
GOSUB GetPthNam
ErrMain
OutBuf="invoke CreateDirectory,[_IOBuffer],0"
GOSUB OutCodeData
GOSUB SetStatus
GOSUB CallErrZ
GOTO MainLoop

RmDirX:
GOSUB GetPthNam
ErrMain
OutBuf="invoke RemoveDirectory,[_IOBuffer]"
GOSUB OutCodeData
GOSUB SetStatus
GOSUB CallErrZ
GOTO MainLoop

SetTimerX:
'SetTimer
GOTO MainLoop

EndFunctionX:
IF FcnFlag=0 THEN
	ErrNo=ErrEndFcn
	GOTO MainLoop
ENDIF
' Put default return data here
SELECT CASE TFcnDataType
	CASE BOOLVAR
		OutBuf="mov [_BoolRet],0"
	CASE LONGVAR
		OutBuf="mov [_LongRet],0"
	CASE STRINGVAR
		OutBuf="mov edi,_NullStr"
		GOSUB OutFunction
		OutBuf="mov [_StringRet],edi"
		GOSUB OutFunction
		OutBuf="mov [_StringRet+4],0"
		GOSUB OutFunction
		OutBuf="mov [_StringRet+8],0"
	CASE FLOATVAR
		'
END SELECT
GOSUB OutFunction
OutBuf="ret"
GOSUB OutFunction
FcnFlag=0
ProcFcnFlag=0
OwnerCode=0
OwnerName=PublicOwnerName
LastSym=LastPublicSym
GOTO MainLoop

EndProcedureX:
IF ProcFlag=0 THEN
	ErrNo=ErrEndProc
	GOTO MainLoop
ENDIF
OutBuf="ret"
GOSUB OutFunction
ProcFlag=0
ProcFcnFlag=0
OwnerCode=0
OwnerName=PublicOwnerName
LastSym=LastPublicSym
GOTO MainLoop

RandomizeX:
GOSUB NexToken
IF TokenLen<>0 THEN
	GOSUB UnDoToken
	GOSUB GetIntOp
	ErrMain
	OutBuf=";srand(eax);"
ELSE
	OutBuf=";srand(time(NULL)/2);"
ENDIF
GOSUB OutCodeData
GOTO MainLoop

DeclareX:
GOSUB NexToken
SymTemp.DataMod=UsrFcnBit
IF TokenBuf="procedure" THEN
	ProcFcn=0
	SymTemp.DataType=PROC
ELSE
	IF TokenBuf="function" THEN
		ProcFcn=$ff
		SymTemp.DataType=FCN
	ELSE
		ErrNo=ErrSyntax
		GOTO MainLoop
	ENDIF
ENDIF
GOSUB NexToken
IF TokenBuf="public" THEN
	ErrNo=ErrSyntax
	GOTO MainLoop
ENDIF
SymTemp.SymName=TokenSaf
GOSUB SymSrch
IF SymFound<>0 THEN
	ErrNo=ErrDupSym
	GOTO MainLoop
ENDIF
Ctr3=0
GOSUB NexToken
IF TokenSaf<>"(" THEN
	IF ProcFcn=0 THEN
		GOTO ProcFcnDone
	ELSE
		ErrNo=ErrSyntax
		GOTO MainLoop
	ENDIF
ENDIF
NeedComma=0
DeclareLoop:
GOSUB NexToken
IF TokenBuf=")" THEN
	IF ProcFcn=0 THEN
		GOTO ProcFcnDone
	ELSE
		GOSUB NexToken
		IF TokenBuf<>"as" THEN
			ErrNo=ErrSyntax
			GOTO MainLoop
		ENDIF
		GOSUB NexToken
		IF TokenLen=0 THEN
			ErrNo=ErrSyntax
			GOTO MainLoop
		ENDIF
		SELECT CASE TokenBuf
			CASE "boolean"
				SymTemp.FcnDataType=BOOLVAR
			CASE "integer"
				SymTemp.FcnDataType=LONGVAR
			CASE "string"
				SymTemp.FcnDataType=STRINGVAR
			CASE "double"
				SymTemp.FcnDataType=FLOATVAR
			CASE ELSE
				ErrNo=ErrSyntax
				GOTO MainLoop
		END SELECT
		GOTO ProcFcnDone
	ENDIF
ELSE
	IF NeedComma<>0 THEN
		IF TokenSaf<>"," THEN
			ErrNo=ErrSyntax
			GOTO MainLoop
		ENDIF
		NeedComma=0
		GOTO DeclareLoop
	ELSE
		IF TokenSaf="," THEN
			ErrNo=ErrSyntax
			GOTO MainLoop
		ENDIF
	ENDIF
	INC Ctr3
	IF Ctr3>7 THEN
		ErrNo=ErrSyntax
		GOTO MainLoop
	ENDIF
	SELECT CASE TokenBuf
		CASE "boolean"
			TempInt=BOOLVAR
		CASE "integer"
			TempInt=LONGVAR
		CASE "string"
			TempInt=STRINGVAR
		CASE "double"
			TempInt=FLOATVAR
		CASE ELSE
			ErrNo=ErrSyntax
			GOTO MainLoop
	END SELECT
	SELECT CASE Ctr3
		CASE 1
			SymTemp.DataAddr=TempInt
		CASE 2
			SymTemp.DataSize=TempInt
		CASE 3
			SymTemp.ArrayDim1=TempInt
		CASE 4
			SymTemp.ArrayDim2=TempInt
		CASE 5
			SymTemp.ArrayDim3=TempInt
		CASE 6
			SymTemp.ArrayDims=TempInt
		CASE 7
			SymTemp.Misc=TempInt
	END SELECT
	NeedComma=$ff
	GOTO DeclareLoop
ENDIF
ProcFcnDone:
IF ProcFcn=$ff THEN
	IF Ctr3=0 THEN
		ErrNo=ErrSyntax
		GOTO MainLoop
	ENDIF
ENDIF
SymTemp.FcnArgs=Ctr3
SymTemp.Detail=LabelUnresolved
GOSUB SymInsert
GOTO MainLoop

FunctionX:
GOSUB FcnFlagChk
FcnFlag=$ff
ProcFcnFlag=$ff
GOSUB ProcFcnPrep
GOSUB PopArgs
ErrMain
GOTO MainLoop

ProcedureX:
GOSUB FcnFlagChk
ProcFlag=$ff
ProcFcnFlag=$ff
GOSUB ProcFcnPrep
IF SymTemp.FcnArgs<>0 THEN
	GOSUB PopArgs
	ErrMain
ENDIF
ErrMain
GOTO MainLoop

FcnFlagChk:
IF ProcFcnFlag<>0 THEN
	ErrNo=ErrFSNest
	GOTO MainLoop
ENDIF
RETURN

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
IF ConStkPtr<1 THEN
	ErrNo=ErrUBCon
	GOTO MainLoop
ENDIF
TempInt=ConStk(ConStkPtr).ConType
IF TempInt<0 OR TempInt>5 THEN' Only for FOR/NEXT, LOOP/ENDLOOP, REPEAT/UNTIL/, WHILE/ENDWHILE
	ErrNo=ErrUBCon
	GOTO MainLoop
ENDIF
GOSUB CmpOps
OutBuf="jne _Lbl"+STR$(ConStk(ConStkPtr).LoopLabel)
GOSUB OutCodeData
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
	OutBuf="mov [_SwitchInt],eax"
ELSE
	OutBuf="mov edi,["+OperandOwnerName+TSymName+"]"
	GOSUB OutCodeData
	OutBuf="mov [_SwitchStr],edi"
	GOSUB OutCodeData
	OutBuf="mov edi,["+OperandOwnerName+TSymName+"+4]"
	GOSUB OutCodeData
	OutBuf="mov [_SwitchStr+4],edi"
	GOSUB OutCodeData
	OutBuf="mov edi,["+OperandOwnerName+TSymName+"+8]"
	GOSUB OutCodeData
	OutBuf="mov [_SwitchStr+8],edi"
ENDIF
GOSUB OutCodeData
GOSUB IncConStk
ErrMain
ConStk(ConStkPtr).ConLine=BasicLineCtr
ConStk(ConStkPtr).ConType=7
INC LabelNum
ConStk(ConStkPtr).TermLabel=LabelNum	
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
GOSUB ConStkChk
ErrMain
OutBuf="_Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+":"
GOSUB OutCodeData
DEC ConStkPtr
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
ConStk(ConStkPtr).ConLine=BasicLineCtr
ConStk(ConStkPtr).ConType=7
ConStk(ConStkPtr).ContLabel=LabelNum
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
		SymType="jne "
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

Vacant13X:
GOTO MainLoop

MakeLowerX:
GOSUB Expr
IF OpClass<>STRClass THEN
	ErrNo=ErrIVType
	GOTO MainLoop
ENDIF
OutBuf="mov esi,"+OperandOwnerName+TSymName
GOSUB OutCodeData
OutBuf="call __LCase"
GOSUB OutCodeData
GOTO MainLoop

MakeUpperX:
GOSUB Expr
IF OpClass<>STRClass THEN
	ErrNo=ErrIVType
	GOTO MainLoop
ENDIF
OutBuf="mov esi,"+OperandOwnerName+TSymName
GOSUB OutCodeData
OutBuf="call __UCase"
GOSUB OutCodeData
GOTO MainLoop

Vacant1X:

GOTO MainLoop

Vacant2X:

GOTO MainLoop

Vacant3X:

GOTO MainLoop

ErrorTbl: DATA "Undefined symbol"' ErrUDSym
DATA "Invalid symbol name"' ErrIVSNam
DATA "Type mismatch or wrong type"' ErrTypMis
DATA "Invalid Expression"' ErrIVExp
DATA "Syntax Error"' ErrSyntax
DATA "Symbol already defined"' ErrDupSym
DATA "Symbol table full"' ErrSymFul
DATA "Undefined Function"' ErrUDFcn
DATA "Invalid data type"' ErrIVType
DATA "Invalid data type modifier"' ErrIVMod
DATA "Macro argument error"' ErrMacArg
DATA "Invalid directive"' ErrIVDir
DATA "Macro already defined"' ErrDupMac
DATA "ENDTYPE without TYPE"' ErrEndStr
DATA "Nested macro"' ErrMacNst
DATA "Macro buffer full"' ErrMacBuf
DATA "Invalid macro"' ErrIVMac
DATA "ENDMACRO without MACRO"'  ErrEndm
DATA "Unbalanced control structure"' ErrUBCon
DATA "Nested too deep"' ErrNDeep
DATA "Illegal Declaration inside Function or Subroutine"' ErrDecFcn
DATA "Invalid parameter"' ErrIVParm
DATA "Parameter Statement out of Place"' ErrErrParm
DATA "Expression too complex"' ErrCpxExp
DATA "Invalid function"'  ErrIVFunc
DATA "No more temps available"' ErrTmpUse
DATA "Unbalanced parens"' ErrParen
DATA "Function error"' ErrFcn
DATA "Invalid target"' ErrIVTarg
DATA "Function/Subroutine nested"' ErrFSNest
DATA "Table operand is not array"' ErrTabArr
DATA "EndFunction statement not in function"' ErrEndFcn
DATA "Array subscript error"' ErrArrSub
DATA "EndProcedure statement not in procedure"' ErrEndProc
DATA "ENDTABLE without TABLE"' ErrEndTbl
DATA "Wrong number of args in table"' ErrTblArgs
DATA "Wrong number of args in procedure or function"' ErrFcnArgs
DATA "TYPE statement inside procedure of function"' ErrTypeFcn

RunStringTbl: DATA "_IOBuffer",_BufSize
DATA "_PrintBuf",_BufSize
DATA "_NullStr",1
DATA "_CRLF",2
DATA "_Prompt",1
DATA "_ConvBuf",32
DATA "_ConvBuf1",32
DATA "ProgramName",28
DATA "_SwitchStr",_BufSize
DATA "%",0

RunVarTbl: DATA "_FltArgSafe0 rf 1"
DATA "_FltArgSafe1 rf 1"
DATA "_FloatRet rf 1"
DATA "_LoopCtr rd 10"
DATA "_hInstance rd 1"
DATA "_InHandle rd 1"
DATA "_OutHandle rd 1"
DATA "_IOPthNum rd 1"
DATA "_XferAddr rd 1"
DATA "_PUArgs rd 15"
DATA "_ArgList rd 1"
DATA "_ArgNum rd 1"
DATA "_Poker rd 1"
DATA "_DummyArg rd 1"
DATA "_FcnArg1 rd 1"
DATA "_FcnArg2 rd 1"
DATA "_FcnArg3 rd 1"
DATA "_FcnArg4 rd 1"
DATA "_FcnArg5 rd 1"
DATA "_FcnArg6 rd 1"
DATA "_FcnArg7 rd 1"
DATA "_LongRet rd 1"
DATA "_StringRet rd 3"
DATA "_ArgSafe0 rd 1"
DATA "_ArgSafe1 rd 1"
DATA "_SwitchInt rd 1"
DATA "_ByteCounter rd 1"
DATA "_PrtPthNum rd 1"
DATA "_DataPtr rd 1"
DATA "_Decimals rw 1"
DATA "_Digits rw 1"
DATA "_BoolRet rb 1"
DATA "%"

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
DATA "_NullStr",STRINGVAR,VectorBit,0,0,0
DATA "0x0",LONGVAR,ConstBit,0,0,4
DATA "<",OPER,0,0,0,0
DATA ">",OPER,0,0,0,0
DATA "(",OPER,0,0,0,0
DATA ")",OPER,0,0,0,0
DATA "*",OPER,0,0,0,0
DATA "",OPER,0,0,0,0
DATA "true",BOOLVAR,4,1,0,0
DATA "false",BOOLVAR,4,0,0,0
DATA "eof",FCN,0,1,0,0
DATA "len",FCN,0,2,0,0
DATA "str$",FCN,0,3,0,0
DATA "val",FCN,0,4,0,0
DATA "land",FCN,0,5,0,0
DATA "mid$",FCN,0,6,0,0
DATA "lor",FCN,0,7,0,0
DATA "left$",FCN,0,8,0,0
DATA "mod",FCN,0,9,0,0
DATA "chr$",FCN,0,10,0,0
DATA "right$",FCN,0,11,0,0
DATA "asc",FCN,0,12,0,0
DATA "not",FCN,0,13,0,0
DATA "bufadr",FCN,0,14,0,0
DATA "bufsiz",FCN,0,15,0,0
DATA "tab",FCN,0,16,0,0
DATA "peek",FCN,0,17,0,0
DATA "addr",FCN,0,18,0,0
DATA "lxor",FCN,0,19,0,0
DATA "lnot",FCN,0,20,0,0
DATA "index",FCN,0,21,0,0
DATA "size",FCN,0,22,0,0
DATA "ival",FCN,0,23,0,0
DATA "fval",FCN,0,24,0,0
DATA "trim$",FCN,0,25,0,0
DATA "filsiz",FCN,0,26,0,0
DATA "filpos",FCN,0,27,0,0
DATA "sqr",FCN,0,28,0,0
DATA "int",FCN,0,29,0,0
DATA "abs",FCN,0,30,0,0
DATA "sin",FCN,0,31,0,0
DATA "cos",FCN,0,32,0,0
DATA "tan",FCN,0,33,0,0
DATA "asn",FCN,0,34,0,0
DATA "acs",FCN,0,35,0,0
DATA "atn",FCN,0,36,0,0
DATA "log",FCN,0,37,0,0
DATA "log10",FCN,0,38,0,0
DATA "Vacant",FCN,0,39,0,0
DATA "Vacant",FCN,0,40,0,0
DATA "thour",FCN,0,41,0,0
DATA "tmin",FCN,0,42,0,0
DATA "tsec",FCN,0,43,0,0
DATA "tyear",FCN,0,44,0,0
DATA "tmon",FCN,0,45,0,0
DATA "tdat",FCN,0,46,0,0
DATA "tday",FCN,0,47,0,0
DATA "chkword",FCN,0,48,0,0
DATA "hex$",FCN,0,49,0,0
DATA "bittst",FCN,0,50,0,0
DATA "shl",FCN,0,51,0,0
DATA "shr",FCN,0,52,0,0
DATA "rol",FCN,0,53,0,0
DATA "ror",FCN,0,54,0,0
DATA "bitchg",FCN,0,55,0,0
DATA "bitclr",FCN,0,56,0,0
DATA "bitset",FCN,0,57,0,0
DATA "substr",FCN,0,56,0,0
DATA "zstr$",FCN,0,59,0,0
DATA "zhex$",FCN,0,60,0,0
DATA "using",FCN,0,61,0,0
DATA "ERR",LONGVAR,0,0,0,4
DATA "_BufSize",0,0,0,0,0
DATA "POS",LONGVAR,0,0,0,4
DATA "_DummyArg",LONGVAR,0,0,0,4
DATA "Vacant",0,0,0,0,0
DATA "_IOBuffer",STRINGVAR,VectorBit,_BufSize,_BufSize,_BufSize
DATA "_PrintBuf",STRINGVAR,VectorBit,_BufSize,_BufSize,_BufSize
DATA "Vacant",0,0,0,0,0
DATA "_Digits",WORDVAR,0,0,0,2
DATA "_Decimals",WORDVAR,0,0,0,2
DATA "STATUS",LONGVAR,0,0,0,4
DATA "_ArgSafe0",LONGVAR,0,0,0,4
DATA "_ArgSafe1",LONGVAR,0,0,0,4
DATA "_IOPthNum",LONGVAR,0,0,0,2
DATA "Vacant",0,0,0,0,0
DATA "Vacant",0,0,0,0,0
DATA "_IOBufPtr",LONGVAR,0,0,0,4
DATA "Vacant",0,0,0,0,0
DATA "Vacant",0,0,0,0,0
DATA "_DataPtr",LONGVAR,0,0,0,4
DATA "ProgramName",STRINGVAR,VectorBit,28,28,28
DATA "Vacant",0,0,0,0,0
DATA "_ConvBuf",STRINGVAR,VectorBit,32,32,32
DATA "Vacant",0,0,0,0,0
DATA "_ConvBuf1",STRINGVAR,VectorBit,32,32,32
DATA "Vacant",0,0,0,0,0
DATA "_Tmp1",LONGVAR,TempBit,0,0,4
DATA "_Tmp2",LONGVAR,TempBit,0,0,4
DATA "_Tmp3",LONGVAR,TempBit,0,0,4
DATA "_Tmp4",LONGVAR,TempBit,0,0,4
DATA "_Tmp5",LONGVAR,TempBit,0,0,4
DATA "_Tmp6",LONGVAR,TempBit,0,0,4
DATA "_Tmp7",LONGVAR,TempBit,0,0,4
DATA "_Tmp8",LONGVAR,TempBit,0,0,4
DATA "_Tmp9",LONGVAR,TempBit,0,0,4
DATA "_Tmp10",LONGVAR,TempBit,0,0,4
DATA "_Tmp11",LONGVAR,TempBit,0,0,4
DATA "_Tmp12",LONGVAR,TempBit,0,0,4
DATA "_Tmp13",LONGVAR,TempBit,0,0,4
DATA "_Tmp14",LONGVAR,TempBit,0,0,4
DATA "_Tmp15",LONGVAR,TempBit,0,0,4
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
DATA "0BUGBUG",FLOATVAR,ConstBit,0,0,8
DATA "NextArg",6,TmpVec,0,0,0
DATA "XferCount",4,0,0,0,0
DATA "_FTmp1",FLOATVAR,0,0,0,8
DATA "_FTmp2",FLOATVAR,0,0,0,8
DATA "_FTmp3",FLOATVAR,0,0,0,8
DATA "_FTmp4",FLOATVAR,0,0,0,8
DATA "_FTmp5",FLOATVAR,0,0,0,8
DATA "_FTmp6",FLOATVAR,0,0,0,8
DATA "_FTmp7",FLOATVAR,0,0,0,8
DATA "_FTmp8",FLOATVAR,0,0,0,8
DATA "_FTmp9",FLOATVAR,0,0,0,8
DATA "_FTmp10",FLOATVAR,0,0,0,8
DATA "_FTmp11",FLOATVAR,0,0,0,8
DATA "_FTmp12",FLOATVAR,0,0,0,8
DATA "_FTmp13",FLOATVAR,0,0,0,8
DATA "_FTmp14",FLOATVAR,0,0,0,8
DATA "_FTmp15",FLOATVAR,0,0,0,8
DATA "TRUE",BOOLVAR,4,1,0,0
DATA "True",BOOLVAR,4,1,0,0
DATA "FALSE",BOOLVAR,4,0,0,0
DATA "False",BOOLVAR,4,0,0,0
DATA "sal",FCN,0,62,0,0
DATA "sar",FCN,0,63,0,0
DATA "rcl",FCN,0,64,0,0
DATA "rcr",FCN,0,65,0,0
DATA "tablesize",FCN,0,66,0,0
DATA "filtyp",FCN,0,67,0,0
DATA "curdir",FCN,0,68,0,0
DATA "bin$",FCN,0,69,0,0
DATA "oct$",FCN,0,70,0,0
DATA "Vacant",FCN,0,71,0,0
DATA "rnd",FCN,0,72,0,0
DATA "Vacant",FCN,0,73,0,0
DATA "Vacant",FCN,0,74,0,0
DATA "Vacant",FCN,0,75,0,0
DATA "Vacant",FCN,0,76,0,0
DATA "Vacant",FCN,0,77,0,0
DATA "lcase$",FCN,0,78,0,0
DATA "ucase$",FCN,0,79,0,0
DATA "tail$",FCN,0,80,0,0
DATA "findaddr",FCN,0,81,0,0
DATA "findoffs",FCN,0,82,0,0
DATA "Vacant",0,0,0,0,0
DATA "_BoolRet",BOOLVAR,0,0,0,1
DATA "_LongRet",LONGVAR,0,0,0,4
DATA "_StringRet",STRINGVAR,VectorBit,0,0,0
DATA "_FloatRet",FLOATVAR,0,0,0,8
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
ENDIF
IF LastStmt<>"end" THEN
	OutBuf=""
	GOSUB OutCodeData
	OutBuf="; Automatic END statement"
	GOSUB OutCodeData
	OutBuf="xor eax,eax"
	GOSUB OutCodeData
	OutBuf="invoke ExitProcess, eax"
	GOSUB OutCodeData
ENDIF
OutBuf="_ErrExit:"
GOSUB OutCode
OutBuf="cinvoke puts,_ErrExitMsg"
GOSUB OutCode	
OutBuf="mov eax,[ERR]"
GOSUB OutCodeData
OutBuf="invoke ExitProcess, eax"
GOSUB OutCodeData
OutBuf="; End of Declaration Section"
GOSUB OutDeclare
CLOSE #DeclareFile
OutBuf="; End of Initialized Data Section"
GOSUB OutInitData
OutBuf=""
GOSUB OutInitData
OutBuf="; Start of Uninitialized Data Section"
GOSUB OutInitData
OutBuf=""
GOSUB OutInitData
CLOSE #DataFile
OutBuf="; End of Uninitialized Data Section"
GOSUB OutDim
CLOSE #DimFile
OutBuf="; End of PreCode Section"
GOSUB OutPreCode
OutBuf=""
GOSUB OutPreCode
CLOSE #PreCodeFile
OutBuf="; End of Code Section"
GOSUB OutCode
CLOSE #CodeFile
OutBuf="; End of Function Section"
GOSUB OutFunction
CLOSE #FunctionFile
OutBuf="; End of Export Section"
GenExport
CLOSE #ExportFile
CLOSE #ResourceFile
ON ERROR GOTO NoCFile
DELETE FileName+".asm"
NoCFile:
ON ERROR
'******
'PRINT  BasicLineCtr;" OmniBasic lines compiled to ";AsmLineCtr;" Assembler lines"
PRINT
 
TFileName=FileName+".asm"
CREATE #OutFile,TFileName:WRITE+BINARY

OPEN #DeclareFile,"_DeclareFile":READ+BINARY
FilBufSiz=FILSIZ(#DeclareFile)
BUFFER FileBuf=FilBufSiz
FilBufAdr=BUFADR(FileBuf)
BUFREAD #DeclareFile,FilBufAdr,FilBufSiz
BUFWRITE #OutFile,FilBufAdr,FilBufSiz
CLOSE #DeclareFile
DELETE "_DeclareFile"

OPEN #DataFile,"_DataFile":READ+BINARY
FilBufSiz=FILSIZ(#DataFile)
BUFFER FileBuf=FilBufSiz
FilBufAdr=BUFADR(FileBuf)
BUFREAD #DataFile,FilBufAdr,FilBufSiz
BUFWRITE #OutFile,FilBufAdr,FilBufSiz
CLOSE #DataFile
DELETE "_DataFile"

OPEN #DimFile,"_DimFile":READ+BINARY
FilBufSiz=FILSIZ(#DimFile)
BUFFER FileBuf=FilBufSiz
FilBufAdr=BUFADR(FileBuf)
BUFREAD #DimFile,FilBufAdr,FilBufSiz
BUFWRITE #OutFile,FilBufAdr,FilBufSiz
CLOSE #DimFile
DELETE "_DimFile"

ON ERROR GOTO NoImportFile
OPEN #ImportFile,"_ImportFile.asm":READ+BINARY
ON ERROR
FilBufSiz=FILSIZ(#ImportFile)
BUFFER FileBuf=FilBufSiz
FilBufAdr=BUFADR(FileBuf)
BUFREAD #ImportFile,FilBufAdr,FilBufSiz
BUFWRITE #OutFile,FilBufAdr,FilBufSiz
CLOSE #ImportFile

OPEN #PreCodeFile,"_PreCodeFile":READ+BINARY
FilBufSiz=FILSIZ(#PreCodeFile)
BUFFER FileBuf=FilBufSiz
FilBufAdr=BUFADR(FileBuf)
BUFREAD #PreCodeFile,FilBufAdr,FilBufSiz
BUFWRITE #OutFile,FilBufAdr,FilBufSiz
CLOSE #PreCodeFile
DELETE "_PreCodeFile"

OPEN #CodeFile,"_CodeFile":READ+BINARY
FilBufSiz=FILSIZ(#CodeFile)
BUFFER FileBuf=FilBufSiz
FilBufAdr=BUFADR(FileBuf)
BUFREAD #CodeFile,FilBufAdr,FilBufSiz
BUFWRITE #OutFile,FilBufAdr,FilBufSiz
CLOSE #CodeFile
DELETE "_CodeFile"

ON ERROR GOTO NoLibFile
OPEN #LibFile,"_LibFile.asm":READ+BINARY
ON ERROR
FilBufSiz=FILSIZ(#LibFile)
BUFFER FileBuf=FilBufSiz
FilBufAdr=BUFADR(FileBuf)
BUFREAD #LibFile,FilBufAdr,FilBufSiz
BUFWRITE #OutFile,FilBufAdr,FilBufSiz
CLOSE #LibFile

OPEN #FunctionFile,"_FunctionFile":READ+BINARY
FilBufSiz=FILSIZ(#FunctionFile)
BUFFER FileBuf=FilBufSiz
FilBufAdr=BUFADR(FileBuf)
BUFREAD #FunctionFile,FilBufAdr,FilBufSiz
BUFWRITE #OutFile,FilBufAdr,FilBufSiz
CLOSE #FunctionFile
DELETE "_FunctionFile"

OPEN #ExportFile,"_ExportFile":READ+BINARY
FilBufSiz=FILSIZ(#ExportFile)
BUFFER FileBuf=FilBufSiz
FilBufAdr=BUFADR(FileBuf)
BUFREAD #ExportFile,FilBufAdr,FilBufSiz
'BUFWRITE #OutFile,FilBufAdr,FilBufSiz
CLOSE #ExportFile
DELETE "_ExportFile"

OPEN #ResourceFile,"_ResourceFile":READ+BINARY
FilBufSiz=FILSIZ(#ResourceFile)
BUFFER FileBuf=FilBufSiz
FilBufAdr=BUFADR(FileBuf)
BUFREAD #ResourceFile,FilBufAdr,FilBufSiz
'BUFWRITE #OutFile,FilBufAdr,FilBufSiz
CLOSE #ResourceFile
DELETE "_ResourceFile"

CLOSE #OutFile
''end
'******
FOR Ctr1=1 TO SymTabSiz
	TDataType=SymTable(Ctr1).DataType
	IF TDataType=LABELVAR OR TDataType=FCN OR TDataType=PROC THEN
		TDetail=SymTable(Ctr1).Detail
		TDataMod=SymTable(Ctr1).DataMod
		IF TDetail=LabelUnresolved THEN
			IF TDataType=LABELVAR THEN
				INC ErrCnt
				PRINT "Label unresolved: "';SymTable(Ctr1).SymName
				PRINT SymTable(Ctr1).SymName
			ELSE
				IF TDataType=FCN OR TDataType=PROC THEN
					IF LAND(TDataMod,UsrFcnBit)=UsrFcnBit THEN
						IF LAND(TDataMod,CalledBit)=CalledBit THEN
							INC ErrCnt
							PRINT "Function or procedure unresolved: "';SymTable(Ctr1).SymName
							PRINT SymTable(Ctr1).SymName
						ENDIF
					ENDIF
				ENDIF
			ENDIF						
		ENDIF
	ENDIF
NEXT Ctr1
lbl9999:
IF ConStkPtr<>0 THEN
	PRINT "Unbalanced control structure in line "';ConStk(ConStkPtr).ConLine	DEC ConStkPtr
	INC ErrCnt
	GOTO lbl9999
ENDIF
IF GFNdx<>1 THEN
	PRINT "Unbalanced conditional stack"
	INC ErrCnt
ENDIF
IF ProcFcnFlag<>0 THEN
	PRINT "Procedure or function not complete"
	PRINT LEFT$(OwnerName,LEN(OwnerName)-1)
	INC ErrCnt
ENDIF
IF ErrCnt<>0 THEN
	'PRINT ErrCnt;" error(s)"
ELSE
	REM Do assembly here
	IF AsmFlag=0 AND NoGen=0 THEN
		PRINT "Assemble:"
		SHELL "fasm "+TFileName+" "+FileName+".exe"
	ENDIF
ENDIF
IF AsmFlag=0 OR NoGen<>0 THEN
	DELETE FileName+".asm"
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
		TempStr=SymTable(Ctr1).SymName+" "
	EXITIF TempStr="%"
		IF POS<63 THEN
			PRINT TempStr,
		ELSE
			PRINT TempStr
		ENDIF
	NEXT Ctr1
	PRINT
	'PRINT Ctr1-UserSym;" symbols"
	PRINT
ENDIF
END
NoInpFile:
PRINT  "Cannot open file: "';FileName
END
Help:
PRINT  "ob file [opts] {CompVar=Const}"
PRINT  "Options:"
PRINT  "    -a        Compile to assembler (.asm file)"
PRINT  "    -d        Compile to DLL"
PRINT  "    -e        Compile with no output but check for errors"
PRINT  "    -h        Halt Compile on first error encountered"
PRINT  "    -g        Compile GUI (Windows) program"
PRINT  "    -s        Symbol Table Dump to stdout"
PRINT  "    -u        Unabridged symbol table dump"

END

'***** Subroutine Section ******

DimVar:
TDataMod=LAND(MemberBit,TypeFlag)
GOSUB ClrDatTyp
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
	IF ArraySize=0 THEN
		DMReDim=$ff
		TDataMod=LOR(TDataMod,ReDimBit)
	ENDIF
ENDIF
GOSUB NexToken
IF TokenBuf<>"as" THEN
	ErrNo=ErrSyntax
	RETURN
ENDIF
GOSUB NexToken
IF TokenLen=0 THEN
	ErrNo=ErrSyntax
	RETURN
ENDIF
SELECT CASE TokenBuf
	CASE "boolean"
		DTBoolean=$ff
		TDataType=BOOLVAR
		SymType=" rb "
		TDataSize=1
		TDataAddr=1
		GOTO DimVar1
	CASE "byte"
		DTByte=$ff
		TDataType=BYTEVAR
		SymType=" rb "
		TDataSize=1
		TDataAddr=1
		GOTO DimVar1
	CASE "integer"
		DTShort=$ff
		TDataType=WORDVAR
		SymType=" rw "
		TDataSize=2
		TDataAddr=2
		GOTO DimVar1
	CASE "long"
		DTLong=$ff
		TDataType=LONGVAR
		SymType=" rd "
		TDataSize=4
		TDataAddr=4
		GOTO DimVar1
	CASE "label"
		DTLong=$ff
		TDataType=LABELPTR
		SymType=" rd "
		TDataSize=4
		TDataAddr=4
		GOTO DimVar1
	CASE "double"
		DTFloat=$ff
		TDataType=FLOATVAR
		SymType=" rf "
		TDataSize=8
		TDataAddr=8
		GOTO DimVar1
	CASE "string"
		DTString=$ff
		TDataType=STRINGVAR
		SymType=" rb "
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
		IF TypeFlag=0 AND DMArray=0 THEN
			VectorFlg=$ff
			TDataMod=LOR(TDataMod,VectorBit)
		ENDIF
		TDataSize=TempInt
		TDataAddr=TempInt
		GOTO DimVar1
	CASE ELSE
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
		TDataAddr=SymTable(SymNdx).DataSize
		SymType=" rb "
		SymTemp.Detail=SymNdx
		SymNdx=TypePtr
		SymTemp.SymName=TSymName
		SubCtr=SubCtrSaf
		SubValue=SubValSaf
		TDataType=COMPLEX
		DTComplex=$ff
END SELECT
DimVar1:
GOSUB NexToken
IF TokenLen=0 OR TokenBuf=";" THEN DimVar2
IF TokenBuf="pointer" THEN
	IF TypeFlag=$ff OR DMArray<>0 THEN
		ErrNo=ErrIVParm
		RETURN
	ENDIF
	DMAddr=$ff
	VectorFlg=0
	SymType=" rd "
	DTString=0
	DTComplex=0
	TDataSize=4
	TDataAddr=4
	TDataMod=LOR(TDataMod,PointerBit)
	GOTO DimVar2
ENDIF
IF TokenBuf="vector" THEN
	IF TypeFlag<>0 OR DMAddr<>0 THEN
		ErrNo=ErrIVParm
		RETURN
	ENDIF
	VectorFlg=$ff
	TDataMod=LOR(TDataMod,VectorBit)
	GOTO DimVar2
ENDIF
ErrNo=ErrIVMod
RETURN

DimVar2:
SymTemp.Owner=OwnerCode
SymTemp.DataType=TDataType
IF DMArray<>0 THEN
	TDataMod=LOR(ArrayBit,TDataMod)
ENDIF
DimOK=$ff
SymTemp.DataMod=TDataMod
SymTemp.DataSize=ArraySize*TDataSize
SymTemp.DataAddr=TDataAddr
IF TDataType=STRINGVAR OR TDataType=COMPLEX THEN
	ArraySize=SymTemp.DataSize
ENDIF
RETURN

DecVar:
TempStr=OwnerName+SymTemp.SymName
IF DMAddr<>0 THEN
	GOSUB OutDim' Basic line as comment
	OutBuf=TempStr+" rd 1"
	GOSUB OutDim
	RETURN
ENDIF
IF DMReDim<>0 THEN
	GOSUB OutInitData' Basic line as comment
	BufName=TempStr
	GOSUB MakeBuffer
	RETURN
ENDIF
IF VectorFlg=$ff THEN
	IF TDataType=STRINGVAR AND DMArray=0 THEN
		GOSUB OutInitData' Basic line as comment
		OutBuf="align 4"
		GOSUB OutInitData
		OutBuf=TempStr+" dd "+TempStr+"+12"
		GOSUB OutInitData
		OutBuf=" dd "+STR$(TDataSize)
		GOSUB OutInitData
		OutBuf=" dd 0"
		GOSUB OutInitData
		OutBuf=" rb "+STR$(ArraySize)
		GOSUB OutInitData
	ELSE
		GOSUB OutDim' Basic line as comment
		OutBuf="align 4"
		GOSUB OutDim
		OutBuf=TempStr+" rd 3"
		GOSUB OutDim
	ENDIF
	RETURN
ENDIF
IF TDataType=STRINGVAR THEN' String array case
	GOSUB OutDim' Basic line as comment
	OutBuf=TempStr+" rb "+STR$(ArraySize)
	GOSUB OutDim
	RETURN
ENDIF
GOSUB OutDim' Basic line as comment
IF DMArray<>0 OR TDataType=COMPLEX THEN
	OutBuf="align 4"
	GOSUB OutDim
	TempStr=TempStr+SymType+STR$(ArraySize)
ELSE
	IF TDataSize=2 THEN
		OutBuf="align 2"
		GOSUB OutDim
	ELSE
		IF TDataSize=4 OR TDataSize=8 THEN
			OutBuf="align 4"
			GOSUB OutDim
		ENDIF
	ENDIF
	TempStr=TempStr+SymType+"1"
ENDIF
OutBuf=TempStr
GOSUB OutDim
RETURN

VarBlank:
OutBuf=""
GOSUB OutDim
RETURN

OutLabel:
IF LabelFlag=$ff THEN
	OutBuf=SymbolSaf
	GOSUB OutCodeData
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
IF IgnoreRightParam<>0 AND SrcNdx+1=EndNdx THEN ExpExit
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
	GOSUB GetSymTemp
	IF LAND(SymTemp.DataMod,PointerBit)<>PointerBit THEN
		ErrNo=ErrTypMis
		GOTO ExpExit
	ENDIF
	IF SymTemp.DataType=FLOATVAR THEN
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
		GOSUB GetSymTemp
		IF LAND(MemberBit,SymTemp.DataMod)<>MemberBit THEN
			ErrNo=ErrTypMis
			GOTO ExpExit
		ENDIF
		IF SymTemp.DataType=FLOATVAR THEN
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
	SELECT CASE TokenBuf
		CASE "+"
			GOSUB Unary
			ExpTable(ExpNdx)=15
		CASE"-"
			GOSUB Unary
			ExpTable(ExpNdx)=16
		CASE "*"
			ExpTable(ExpNdx)=17
		CASE "/"
			ExpTable(ExpNdx)=18
		CASE "&"
			ExpTable(ExpNdx)=146
		CASE "|"
			ExpTable(ExpNdx)=147
	END SELECT
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
	IF LAND(ArrayBit,LastEntry.DataMod)<>0 AND SymTemp.DataType=LABELPTR THEN
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
SELECT CASE TokenType
	CASE TTypSym
		IncExpNdx
		SymTemp.SymName=TokenBuf
		GOSUB SymSearch
		IF SymFound=$ff THEN
			GOSUB GetSymTemp
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
		GOSUB GetSymTemp
		IF LAND(SymTemp.DataMod,PointerBit)=0 AND SymTemp.DataType<$10 THEN'  special test for pointer
			DataTemp=SymTemp.DataType
			IF SymTemp.DataType=FLOATVAR THEN
				INC FloatFlag
			ENDIF
		ELSE
			DataTemp=LONGVAR
		ENDIF
		IF DataTemp>=BOOLVAR AND DataTemp<=STRINGVAR OR DataTemp=COMPLEX OR DataTemp=BUFFER THEN
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
			GOSUB AddRtGrp1
			GOTO GetExp1
		ENDIF
		IF DataTemp=COMPVAR OR DataTemp=MACROVAR THEN
			Konstant=SymTable(SymNdx).Detail
			SymTemp.SymName=STR$(Konstant)
			GOSUB ProcKonst
			IF ErrNo<>0 THEN ExpExit
			GOSUB AddRtGrp1
			GOTO GetExp1
		ENDIF
		GOTO ExpExit
	CASE TTypFloat
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
			SymTemp.DataType=FLOATVAR
			SymTemp.DataSize=8
			SymTemp.DataMod=ConstBit
			GOSUB SymInsert
			ErrRet
		ENDIF
		GOSUB GetSymTemp
		LastEntry=SymTemp
		ExpTable(ExpNdx)=SymNdx
		GOSUB AddRtGrp1
	CASE TTypInt
		IncExpNdx
		GOSUB AddLftGrp
		GOSUB ValidInt
		IF IntOK=0 THEN
			ErrNo=ErrIVExp
			GOTO ExpExit
		ENDIF
		Konstant=VAL(TokenBuf)
		SymTemp.SymName=Str$(Konstant)
		GOSUB ProcKonst
		IF ErrNo<>0 THEN ExpExit
		GOSUB AddRtGrp1
	CASE TTypHex
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
		GOSUB AddRtGrp1
	CASE TTypQuote
		IncExpNdx
		IF LEN(TokenSaf)=2 THEN'  null string
			LastEntry=SymTable(20)
			ExpTable(ExpNdx)=20'  20 is table entry for null string
			GOTO GetExp1
		ENDIF
		GOSUB MakeStrConst
		TempStr="_StrConst"+STR$(PoolCtr)
		SymTemp.SymName=TempStr
		'Skip SymSrch, just point to next vacancy in symbol table
		SymNdx=LastSym+1
		IF SymNdx>SymTabSiz THEN
			SymFull=$ff
		ENDIF
		SymTemp.DataType=STRINGVAR
		SymTemp.DataMod=ConstBit
		GOSUB ClrSym
		SymTemp.Detail=LEN(TokenSaf)-1
		SymTemp.DataSize=SymTemp.Detail
		GOSUB SymInsert
		IF ErrNo<>0 THEN
			GOTO ExpExit
		ENDIF
		LastEntry=SymTemp
		ExpTable(ExpNdx)=SymNdx
	CASE ELSE
		ErrNo=ErrIVExp
		RETURN
END SELECT
GOTO GetExp1
ExpExit:
IF ExpLen=ExpTabSiz THEN
	ErrNo=ErrCpxExp
ENDIF
IF ExpLen=1 THEN
	ErrNo=ErrIVExp
ENDIF
IF ErrNo=0 THEN' Check this block of code
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
	SymTemp.DataType=LONGVAR
	SymTemp.DataSize=4
	SymTemp.DataMod=ConstBit
	SymTemp.Detail=IVAL(SymTemp.SymName)
	GOSUB SymInsert
	ErrRet
ENDIF
GOSUB GetSymTemp
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
IF ExpNdx>ExpLen THEN'???
	RETURN
ENDIF
ParenScn1:
INC ExpNdx
PType=ExpTable(ExpNdx)
IF PType=1 OR PType=PTArrOpn OR PType=PTFcnOpn OR PType=22 OR PType=PTCpxOpn OR PType=26 THEN
	ExpLeft=ExpNdx
	INC ParenCnt
ENDIF
IF PType=2 OR PType=PTArrCls OR PType=PTFcnCls OR PType=23 OR PType=PTFCpxCls OR PType=27 THEN
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
	OutBuf="mov esi,["+OperandOwnerName+TSymName+"]"
	GOSUB OutCodeData
	IF SymTemp.DataType=COMPLEX THEN
		OutBuf="add esi,"+STR$(SymTable(ExpTable(ExpNdx+3)).DataAddr)
		GOSUB OutCodeData
	ENDIF
	OutBuf="mov ["+OperandOwnerName+SymTemp.SymName+"],esi"
	GOSUB OutCodeData
	IF TDataType=STRINGVAR THEN
		OutBuf="mov ["+OperandOwnerName+SymTemp.SymName+"+4],"+STR$(TDetail)
		GOSUB OutCodeData
		OutBuf="mov ["+OperandOwnerName+SymTemp.SymName+"+8],0"
		GOSUB OutCodeData
	ENDIF
	GOTO GrpCpxEnd
ENDIF
' Pointer Stuff Ends Here
'*******************************
IF PType=PTArrCls THEN
	ExpNdx=ExpLeft-1
	GOSUB ClassOp
	ArrayDataType=TDataType
	ArrayDetail=TDetail
	GOSUB GetTmpVec
	ErrRet
	GOSUB GetBase
	ExpTable(ExpNdx)=SymNdx
	TempStr=SymTemp.SymName
	GOSUB GetOpSize
	GOSUB BldOffset
	ErrRet
	OutBuf="mov ["+TempStr+"],esi"
	GOSUB OutCodeData
	IF ArrayDataType=STRINGVAR THEN
		OutBuf="mov ["+TempStr+"+4],"+STR$(ArrayDetail)
		GOSUB OutCodeData
		OutBuf="mov ["+TempStr+"+8],0"
		GOSUB OutCodeData
	ENDIF
	GOTO ArrFcnEnd
ENDIF
IF PType=PTFcnCls THEN' Function
	HasFcn=$ff
	ExpNdx=ExpLeft-1
	GOSUB GetSymTempExpNdx
	FcnName=SymTemp.SymName
	ExpNdx=ExpNdx+2
	IF SymTemp.DataMod=UsrFcnBit THEN
		TFcnDataType=SymTemp.FcnDataType
		GOSUB GetFcnTypes
		FOR Ctr3=1 TO TFcnArgs
			GOSUB ClassOp
			GOSUB ArgPush
			ErrRet
			INC ExpNdx
		NEXT Ctr3
		OutBuf="call "+FcnName
		GOSUB OutCodeData
		SELECT CASE TFcnDataType
			CASE BOOLVAR
				ExpTable(ExpNdx)=193
			CASE LONGVAR
				ExpTable(ExpNdx)=194
			CASE STRINGVAR
				ExpTable(ExpNdx)=195
			CASE FLOATVAR
				ExpTable(ExpNdx)=196
		END SELECT					
	ELSE
		FcnCode=SymTemp.Detail
		IF FcnCode<51 THEN
			ON FcnCode GOSUB F1,F2,F3,F4,F5,F6,F7,F8,F9,F10,F11,F12,F13,F14,F15,F16,F17,F18,F19,F20,F21,F22,F23,F24,F25,F26,F27,F28,F29,F30,F31,F32,F33,F34,F35,F36,F37,F38,F39,F40,F41,F42,F43,F44,F45,F46,F47,F48,F49,F50
		ELSE
			ON FcnCode-50 GOSUB F51,F52,F53,F54,F55,F56,F57,F58,F59,F60,F61,F62,F63,F64,F65,F66,F67,F68,F69,F70,F71,F72,F73,F74,F75,F76,F77,F78,F79,F80,F81,F82
		ENDIF
	ENDIF
	ErrRet
	GOTO ArrFcnEnd
ENDIF
IF PType=PTFCpxCls THEN
	IF ExpRight-ExpLeft=2 THEN
		ExpNdx=ExpLeft+1
		GOSUB ClassOp
		IF DMVector=0 THEN
			GOSUB Vectorize
			ErrRet
		ENDIF
		IF DMVector<>0 AND DMTemp=0 THEN
			GOSUB SetTmpVec
			ErrRet
		ENDIF
		GOTO GrpCpxEnd
	ENDIF
	ExpNdx=ExpLeft+3
	GOSUB ClassOp
	IF TDataType=STRINGVAR AND DMVector=0 THEN
		'GOSUB VecString
	ENDIF
	IF DMVector<>0 AND DMTemp=0 THEN
		GOSUB SetTmpVec
		ErrRet
	ENDIF
	ExpNdx=ExpNdx-2
	GOSUB ClassOp
	IF DMVector=0 THEN
		GOSUB Vectorize
		ErrRet
	ENDIF
	IF DMVector<>0 AND DMTemp=0 THEN
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
	IF DMVector<>0 THEN
		OutBuf="mov eax,["+SymTable(SymNdx).SymName+"]"
		GOSUB OutCodeData
		OutBuf="add eax,["+TSymName+"]"
		GOSUB OutCodeData
		OutBuf="mov ["+SymTable(SymNdx).SymName+"],eax"
		GOSUB OutCodeData
	ENDIF
	IF OpClass=STRClass AND ReadFlag=0 THEN
		OutBuf="mov ["+SymTable(SymNdx).SymName+"+4],"+STR$(SymTemp.Detail)
		GOSUB OutCodeData
		OutBuf="mov ["+SymTable(SymNdx).SymName+"+8],0"
		GOSUB OutCodeData	
	ENDIF
	GOTO GrpCpxEnd
ENDIF
' Get here if PType=2
ExpNdx=ExpLeft+1
GOSUB ClassOp
MakeLong
IF ExpRight-ExpLeft=2 AND DMArray<>0 THEN
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
	IF TDataType=STRINGVAR AND DMVector=0 AND DMAddr=0 THEN
		GOSUB VecString
	ENDIF
	IF TDataType=STRINGVAR AND DMVector<>0 AND DMTemp=0 AND DiskIO=$ff  AND BufRWFlg=0 THEN
		GOSUB GetBase
	ENDIF
	GOTO GrpCpxEnd
ENDIF
ScanStr:
GOSUB ClassOp
MakeLong
IF TDataType=STRINGVAR AND DMVector=0 AND DMAddr=0 THEN
	GOSUB VecString
ENDIF
IF DMVector<>0 AND DMTemp=0 THEN
	REM need to make a temp vector
	GOSUB SetTmpVec
	ErrRet
ENDIF
INC ExpNdx
IF ExpNdx<ExpRight THEN ScanStr
ExpNdx=ExpLeft+1
GOSUB ClassOp
MakeLong
IF TDataType=STRINGVAR THEN
	DataOp=0
	Ctr1=0
	Label6184:
	IF DataOp=0 THEN
		GOSUB ClassOp
		IF TDataType<>STRINGVAR THEN
			ErrNo=ErrIVExp
			RETURN
		ENDIF
		INC Ctr1
		IF Ctr1>1 THEN
			OutBuf="mov esi,"+OperandOwnerName+TSymName
			GOSUB OutCodeData
			TSymName=SymTable(ExpTable(ExpNdx-2)).SymName
			OutBuf="mov ["+OperandOwnerName+TSymName+"+8],esi"
			GOSUB OutCodeData
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
	IF ExpNdx<ExpRight THEN Label6184
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
	Label6186:
	IF DataOp=0 THEN
		DataOp=$ff
		GOSUB LoadReg
		ErrRet
		INC Ctr1
		IF Ctr1>1 THEN
			SELECT CASE MathOp
				CASE 15
					GOSUB DoAdd
				CASE 16
					GOSUB DoSub
				CASE 17
					GOSUB DoMul
				CASE 18
					GOSUB DoDiv
				CASE 146
					GOSUB DoAnd
				CASE 147
					GOSUB DoOr
			END SELECT
		ENDIF
	ELSE
		MathOp=ExpTable(ExpNdx)
		DataOp=0
	ENDIF
	INC ExpNdx
	IF ExpNdx<ExpRight THEN Label6186
	IF DataOp=0 THEN
		ErrNo=ErrIVExp
	ENDIF
	ExpNdx=ExpLeft+1
	IF LastGroup=$ff AND CompFlag=0 THEN
		ExpTable(ExpNdx)=19
		IF TDataType=FLOATVAR THEN
			SymTable(19).DataType=FLOATVAR
		ELSE
			SymTable(19).DataType=LONGVAR
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
       	OutBuf="mov ["+SymTemp.SymName+"],"+Reg0Name
	GOSUB OutCodeData
	D1Cleared=0
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
IF DMMember<>0 THEN
	IF DMArray=0 THEN
		OutBuf="mov esi,"+STR$(TDataAddr)
	ELSE
		GOSUB GetOpSize
		OutBuf="mov esi,0-("+STR$(ArrayBase)+"*"+STR$(TempInt)+")"
	ENDIF
	GOSUB OutCodeData
	RETURN
ENDIF
IF DMVector<>0 THEN
	OutBuf="mov esi,["+OperandOwnerName+TSymName+"]"
	GOSUB OutCodeData
	IF TDataType=COMPLEX THEN
		CpxArrayOffset=ArrayBase*TDataAddr
		OutBuf="add esi,"+STR$(SymTable(ExpTable(ExpNdx+5)).DataAddr)
		GOSUB OutCodeData
	ENDIF
	RETURN
ENDIF
IF DMArray<>0 THEN
	OutBuf="mov esi,"+OperandOwnerName+TSymName+"-("+STR$(ArrayBase)+"*"+STR$(TDataAddr)+")"
	IF TDataType=COMPLEX THEN
		CpxArrayOffset=ArrayBase*TDataAddr
		OutBuf=OutBuf+"+"+STR$(SymTable(ExpTable(ExpNdx+5)).DataAddr)
	ENDIF
	OutBuf=OutBuf
	GOSUB OutCodeData
	RETURN
ENDIF
IF TDataType=COMPLEX THEN
	OutBuf="mov esi,"+OperandOwnerName+TSymName+"+"+STR$(SymTable(ExpTable(ExpNdx+2)).DataAddr)
	GOSUB OutCodeData
	RETURN
ENDIF
OutBuf="mov esi,"+OperandOwnerName+TSymName
GOSUB OutCodeData
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
		SELECT CASE TempInt
			CASE 2
				OutBuf="shl eax,1"
			CASE 4
				OutBuf="shl eax,2"
			CASE 8
				OutBuf="shl eax,3"
			CASE 16
				OutBuf="shl eax,4"
			CASE 32
				OutBuf="shl eax,5"
			CASE 64
				OutBuf="shl eax,6"
			CASE 128
				OutBuf="shl eax,7"
			CASE 256
				OutBuf="shl eax,8"
			CASE 512
				OutBuf="shl eax,9"
			CASE 1024
				OutBuf="shl eax,10"
			CASE ELSE
				OutBuf="imul eax,"+STR$(TempInt)
		END SELECT		
		GOSUB OutCodeData
	ENDIF
	OutBuf="add esi,eax;"
	GOSUB OutCodeData
	ExpNdx=ExpNdx-2
	RETURN
ENDIF
OutBuf="mov edx,eax"
GOSUB OutCodeData
INC ExpNdx
GOSUB SubLoad
ErrRet
IF NumArgs=2 THEN'  2 DIM array
	REM eax is (2), edx is (1)
	OutBuf="eax=eax*"+STR$(SubValue(1))+"*"+STR$(TempInt)+"+"+STR$(TempInt)+"*edx"
	GOSUB OutCodeData
	OutBuf="add esi,eax"
	GOSUB OutCodeData
	ExpNdx=ExpNdx-3
	RETURN
ENDIF
REM Get here if 3 DIM array
OutBuf="mov edi,eax"
GOSUB OutCodeData
INC ExpNdx
GOSUB SubLoad
ErrRet
REM eax is (3), edx is(1), edi is (2)
OutBuf="eax=edi*"+STR$(SubValue(1))+"*"+STR$(TempInt)+"+eax*"+STR$(SubValue(1))+"*"+STR$(SubValue(2))+"*"+STR$(TempInt)+";"
GOSUB OutCodeData
OutBuf="eax=eax+"+STR$(TempInt)+"*edx;"
GOSUB OutCodeData
OutBuf="add esi,eax"
GOSUB OutCodeData
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
IF PType=PTArrCls THEN
	GOSUB BldOffset
ENDIF
OutBuf="mov ["+TempStr+"],esi"
GOSUB OutCodeData
IF ReadFlag=0 THEN
	OutBuf="mov ["+TempStr+"+4],"+STR$(TempInt)
	GOSUB OutCodeData
	OutBuf="mov ["+TempStr+"+8],0"
	GOSUB OutCodeData
ENDIF
RETURN

ClassOp:
GOSUB GetSymTempExpNdx
GOSUB ClassOp1
RETURN

ClassOp1:
GOSUB ClrDatTyp
TSymName=SymTemp.SymName
TOwner=SymTemp.Owner
TDataType=SymTemp.DataType
TDataMod=SymTemp.DataMod
TDetail=SymTemp.Detail
TDataAddr=SymTemp.DataAddr
TDataSize=SymTemp.DataSize
GOSUB GetDtaTyp 
DMData=LAND(DataBit,TDataMod)
DMTemp=LAND(TempBit,TDataMod)
DMVector=LAND(VectorBit,TDataMod)
DMMember=LAND(MemberBit,TDataMod)
DMMulti=LAND(MultiBit,TDataMod)
DMConst=LAND(ConstBit,TDataMod)
GOSUB GetOwnerName
DMAddr=LAND(PointerBit,TDataMod)
IF LAND(ArrayBit,TDataMod)=ArrayBit THEN
	DMArray=$ff
	OpClass=ARRClass
	IF DMMulti<>0 THEN
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
IF TDataType>=2 AND TDataType<=4 OR LAND(TDataMod,PointerBit)=PointerBit THEN
	OpClass=INTClass
	RETURN
ENDIF
IF TDataType=FCN AND LAND(TDataSize,$00000004)=4 THEN
	OpClass=INTClass
ENDIF
SELECT CASE TDataType
	CASE BOOLVAR
		OpClass=BOOLClass
	CASE STRINGVAR
		OpClass=STRClass
	CASE FLOATVAR
		OpClass=FLTClass
	CASE COMPLEX
		OpClass=CPXClass
	CASE LABELPTR
		OpClass=LBLClass
	CASE ELSE
		OpClass=0
END SELECT
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
SymTemp.ArrayDim1=0
SymTemp.ArrayDim2=0
SymTemp.ArrayDim3=0
SymTemp.ArrayDims=0
SymTemp.Misc=0
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
	SELECT CASE Opt
		CASE "1"
			ExpFlag=$ff
		CASE "a"
			AsmFlag=$ff
		CASE "h"
   			HaltFlag=$ff
		CASE "g"
			GUIFlag=$ff
		CASE "d"
   			DLLFlag=$ff
		CASE "e"
			NoGen=$ff
		CASE "s"
			DumpSyms=$ff
		CASE "u"
			UDump=$ff
		CASE ELSE
			PRINT "Unknown option "';TempStr
			END
		END SELECT
		GOTO Option
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
OutBuf="cmp eax,-1"
GOSUB OutCode
OutBuf="jg _OELbl"+STR$(OELabelNum)
GOSUB OutCode
OutBuf="invoke GetLastError"
GOSUB OutCode
OutBuf="mov [ERR],eax"
GOSUB OutCode
OutBuf="jmp [_ErrVec]"
GOSUB OutCode
OutBuf="_OELbl"+STR$(OELabelNum)+":"
GOSUB OutCode
RETURN

CallErrZ:
IF StatFlag=$ff THEN
	RETURN
ENDIF
INC OELabelNum
OutBuf="cmp eax,0"
GOSUB OutCode
OutBuf="jne _OELbl"+STR$(OELabelNum)
GOSUB OutCode
OutBuf="invoke GetLastError"
GOSUB OutCode
OutBuf="mov [ERR],eax"
GOSUB OutCode
OutBuf="jmp [_ErrVec]"
GOSUB OutCode
OutBuf="_OELbl"+STR$(OELabelNum)+":"
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
	SELECT CASE TokenBuf
		CASE "update"
			IF CrOpFlag=$ff THEN
				'CreatMode="P_WRITE|P_READ"
			ELSE
				AccMode="A_UPDATE"
			ENDIF
		CASE "read"
			IF CrOpFlag=$ff THEN
				CreatMode="P_READ"
			ELSE
				AccMode="A_READ"
			ENDIF
		CASE "write"
			IF CrOpFlag=$ff THEN
				CreatMode="P_WRITE|P_READ"
			ELSE
				AccMode="A_WRITE"
			ENDIF
	END SELECT
ELSE
AccModErr:
	ErrNo=ErrSyntax
	RETURN
ENDIF
GOSUB NexToken
IF TokenLen<>0 THEN' Check this block of code
	IF TokenBuf="+" THEN
		GOSUB NexToken'  eat optional "+"
		IF TokenBuf="dir" THEN
			DirFlag=$ff
		ELSE
			IF TokenBuf="binary" THEN
				AccMode=AccMode+"|A_BINARY"
			ELSE
				IF TokenBuf="text" THEN
					'AccMode=AccMode+"|A_TEXT"
				ELSE
					ErrNo=ErrSyntax
				ENDIF
			ENDIF
		ENDIF
	ENDIF
ENDIF
RETURN

GetOpSize:
SELECT CASE TDataType
	CASE BOOLVAR
		TempInt=1
	CASE BYTEVAR
		TempInt=1
	CASE WORDVAR
		TempInt=2
	CASE LONGVAR
		TempInt=4
	CASE LABELPTR
		TempInt=4
	CASE FLOATVAR
		TempInt=8
	CASE COMPLEX
		TempInt=SymTable(SymTable(SymNdx).Detail).DataSize
	CASE STRINGVAR
		TempInt=(SymTable(SymNdx).Detail)
END SELECT
IF LAND(TDataMod,PointerBit)=PointerBit THEN
	TempInt=4
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
IF TDataType<>LONGVAR THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
IF Target=0 THEN
	IF TSymName<>"~" THEN
		D0Loaded=0
		GOSUB LoadReg
		ErrRet
	ENDIF
	OutBuf="mov [_IOPthNum],eax"
	GOSUB OutCodeData
ELSE
	IF DMConst<>0 THEN
		ErrNo=ErrIVExp
		RETURN
	ENDIF
	IF DMVector=0 THEN
		PathIsVector=0
		PathVar=TSymName
	ELSE
		PathIsVector=$ff
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
IF TDataType<>STRINGVAR THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
OutBuf="mov edi,_IOBuffer"
GOSUB OutCodeData
OutBuf="mov esi,"+OperandOwnerName+TSymName
GOSUB OutCodeData
OutBuf="call __MovStr"
GOSUB OutCodeData
RETURN

BufRW:
BufRWFlg=$ff
DiskIO=$ff
GOSUB GetPthNum
ErrRet
GOSUB GetIntOp' Get Address
ErrRet
OutBuf="mov [_XferAddr],eax"
GOSUB OutCodeData
CommaRet
GOSUB GetIntOp' Get # of bytes
ErrRet
OutBuf="mov [XferCount],eax"
GOSUB OutCodeData
RETURN

GetPut:
DiskIO=$ff
GOSUB GetPthNum
ErrRet
GOSUB Expr
ErrRet
IF DMConst<>0 THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
IF DMVector=0 THEN
	GOSUB GetBase
ENDIF
OutBuf="mov [_XferAddr],esi"
GOSUB OutCodeData
OutBuf="mov [XferCount],"+STR$(SymTemp.DataSize)
GOSUB OutCodeData
RETURN

ReadWrite:
DiskIO=$ff
GOSUB GetPthNum
ErrRet
GOSUB Expr
ErrRet
IF TDataType<>STRINGVAR THEN
	ErrNo=ErrTypMis
ENDIF
OutBuf="mov [_XferAddr],esi"
GOSUB OutCodeData
OutBuf="mov [_ByteCounter],"+STR$(SymTemp.Detail)
GOSUB OutCodeData
RETURN

GetRegPrm:
GOSUB GetSymTempExpNdx
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
	Reg0Name="eax"
	Reg1Name="edx"
ELSE
	Reg0Name="eaxf"
	Reg1Name="edxf"
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
	GOSUB GetSymTemp
	GOSUB GetRP1
ELSE
	GOSUB GetRegPrm
ENDIF
ErrRet
TDataType=SymTemp.DataType
IF D0Loaded=0 THEN
	SELECT CASE TDataType
		CASE BOOLVAR
			LdRegName="al"
		CASE BYTEVAR
			LdRegName="al"
		CASE WORDVAR
			LdRegName="ax"
		CASE LONGVAR
			LdRegName="eax"
	END SELECT	
ELSE
	SELECT CASE TDataType
		CASE BOOLVAR
			LdRegName="dl"
		CASE BYTEVAR
			LdRegName="dl"
		CASE WORDVAR
			LdRegName="dx"
		CASE LONGVAR
			LdRegName="edx"
	END SELECT
ENDIF
IF LAND(ConstBit,SymTemp.DataMod)=ConstBit THEN
	OutBuf="mov "+LdRegName+","+STR$(SymTemp.Detail)
ELSE
	IF LAND(VectorBit,SymTemp.DataMod)=0 THEN
		GOSUB ClrDataRegs
		OutBuf="mov "+LdRegName+","+_DataType+"["+OperandOwnerName+SymTemp.SymName+"]"
	ELSE
		OutBuf="mov edi,["+OperandOwnerName+SymTemp.SymName+"]"
		GOSUB OutCodeData
		GOSUB ClrDataRegs
		OutBuf="mov "+LdRegName+","+_DataType+"[edi]"
	ENDIF
ENDIF
D0Loaded=$ff
GOSUB OutCodeData
RETURN

StoreD0:
SymTemp.SymName=Op1Name
GOSUB SymSrch
TSymName=SymTable(SymNdx).SymName
TDataType=SymTable(SymNdx).DataType
TDataMod=SymTable(SymNdx).DataMod
TOwner=SymTable(SymNdx).Owner
DMConst=0
GOSUB GetOwnerName
SELECT CASE TDataType
	CASE BOOLVAR
		Reg0Name="al"
		OpSizeStr=" byte "
	CASE BYTEVAR
		Reg0Name="al"
		OpSizeStr=" byte "
	CASE WORDVAR
		Reg0Name="ax"
		OpSizeStr=" word "
	CASE LONGVAR
		Reg0Name="eax"
		OpSizeStr=" dword "
	CASE FLOATVAR
		Reg0Name="floatreg"
		OpSizeStr=" qword "
END SELECT
IF LAND(TDataMod,PointerBit)<>0 THEN
		Reg0Name="eax"
		OpSizeStr=" dword "
ENDIF
IF LAND(TDataMod,VectorBit)=0 THEN
	OutBuf="mov"+OpSizeStr+"["+OperandOwnerName+TSymName+"],"+Reg0Name
ELSE
	IF LAND(TDataMod,PointerBit)<>0 THEN
		Reg0Name="eax"
		OutBuf="mov esi,"+SymTemp.SymName
		GOSUB OutCodeData
	ELSE
		OutBuf="mov esi,["+SymTemp.SymName+"]"
		GOSUB OutCodeData
	ENDIF
	OutBuf="mov"+OpSizeStr+"[esi],"+Reg0Name
ENDIF
GOSUB OutCodeData
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
	GOSUB OutDim
	OutBuf="_Tmp"+STR$(TmpUse)+" rd 1"
	GOSUB OutDim
	GOSUB VarBlank
ENDIF
SymTemp.SymName="_Tmp"+STR$(TmpUse)
GOSUB SymSrch
IF OpClass=INTClass THEN
	SymTable(SymNdx).DataType=LONGVAR
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
	GOSUB OutDim
	OutBuf=";static double _FTmp"+STR$(FTmpUse)+";"
	GOSUB OutDim
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
	GOSUB OutDim
	OutBuf="_StrTmp"+STR$(StrTmpUse)+" rb 32"
	GOSUB OutDim
	GOSUB VarBlank
ENDIF
GOSUB ReqTmpVec
ErrRet
SymTable(SymNdx).DataMod=TmpVec
SymTable(SymNdx).DataType=STRINGVAR
SymTable(SymNdx).Detail=32
TempInt=32
SymTable(SymNdx).DataAddr=0
SymTable(SymNdx).DataSize=32
OutBuf="mov esi,_StrTmp"+STR$(StrTmpUse)
GOSUB OutCodeData
GOSUB SetStrVec
RETURN

GetChrVec:
INC ChrTmpUse
IF ChrTmpUse>ChrTmpMax THEN
	ChrTmpMax=ChrTmpUse
	GOSUB VarBlank
	Comment="Temporary Character Variable"
	GOSUB BldComment
	GOSUB OutDim
	OutBuf="_ChrTmp"+STR$(ChrTmpUse)+" rb 1"
	GOSUB OutDim
	GOSUB VarBlank
ENDIF
GOSUB ReqTmpVec
ErrRet
SymTable(SymNdx).DataMod=TmpVec
SymTable(SymNdx).DataType=STRINGVAR
SymTable(SymNdx).Detail=1
TempInt=1
SymTable(SymNdx).DataAddr=0
SymTable(SymNdx).DataSize=1
OutBuf="mov esi,_ChrTmp"+STR$(ChrTmpUse)
GOSUB OutCodeData
GOSUB SetStrVec
RETURN

SetStrVec:
OutBuf="mov ["+SymTemp.SymName+"],esi"
GOSUB OutCodeData
OutBuf="mov ["+SymTemp.SymName+"+4],"+STR$(TempInt)
GOSUB OutCodeData
OutBuf="mov ["+SymTemp.SymName+"+8],0"
GOSUB OutCodeData
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
GOSUB OutDim
OutBuf="_TmpVec"+STR$(TmpVecUse)+" rd 3"
GOSUB OutDim
RETURN

SetTmpVec:
GOSUB GetTmpVec
ErrRet
ExpTable(ExpNdx)=SymNdx
OutBuf="mov edi,["+OperandOwnerName+TSymName+"]"
GOSUB OutCodeData
IF SymTemp.DataType=COMPLEX THEN
	OutBuf="add edi,"+STR$(SymTable(ExpTable(ExpNdx+2)).DataAddr)
	GOSUB OutCodeData
ENDIF
OutBuf="mov ["+SymTable(SymNdx).SymName+"],edi"
GOSUB OutCodeData
IF TDataType<>STRINGVAR THEN
	RETURN
ENDIF
OutBuf="mov edi,["+OperandOwnerName+TSymName+"+4]"
GOSUB OutCodeData
OutBuf="mov ["+SymTable(SymNdx).SymName+"+4],edi"
GOSUB OutCodeData
OutBuf="mov edi,["+OperandOwnerName+TSymName+"+8]"
GOSUB OutCodeData
OutBuf="mov ["+SymTable(SymNdx).SymName+"+8],edi"
GOSUB OutCodeData
GOSUB ClassOp
RETURN

Vectorize:
GOSUB GetTmpVec
ErrRet
GOSUB GetBase
ExpTable(ExpNdx)=SymNdx
OutBuf="mov ["+SymTemp.SymName+"],esi"
GOSUB OutCodeData
RETURN

GetLopVec:
LopVarNdx=0
GetLV1:
INC LopVarNdx
IF LopVarNdx=41 THEN
	ErrNo=ErrTmpUse
	RETURN
ENDIF
IF LoopVars(LopVarNdx)=ConStk(ConStkPtr).LoopName THEN GetLV2
IF LoopVars(LopVarNdx)<>"%" THEN GetLV1
LoopVars(LopVarNdx)=ConStk(ConStkPtr).LoopName
GOSUB VarBlank
Comment="For Loop Vector"
GOSUB BldComment
GOSUB OutDim
OutBuf="_LopVec"+STR$(LopVarNdx)+" rd 2"
GOSUB OutDim
GOSUB VarBlank
GetLV2:
RETURN

DoAnd:
IF TDataType=FLOATVAR THEN
	ErrNo=ErrTypMis
ENDIF
OutBuf="and eax,edx"
GOSUB OutCodeData
RETURN

DoOr:
IF TDataType=FLOATVAR THEN
	ErrNo=ErrTypMis
ENDIF
OutBuf="or eax,edx"
GOSUB OutCodeData
RETURN

DoAdd:
OutBuf="add "+Reg0Name+","+Reg1Name
GOSUB OutCodeData
RETURN

DoSub:
OutBuf="sub "+Reg0Name+","+Reg1Name
GOSUB OutCodeData
RETURN

DoMul:
OutBuf="imul "+Reg1Name
GOSUB OutCodeData
RETURN

DoDiv:
' The following is ONLY for integer divide
OutBuf="mov ecx,edx"
GOSUB OutCodeData
OutBuf="xor edx,edx"
GOSUB OutCodeData
OutBuf="idiv ecx"
GOSUB OutCodeData
RETURN

CmpNum:
D0Loaded=0
Promote=$ff
SymTemp.SymName=Op1Name
GOSUB LoadReg
SymTemp.SymName=Op2Name
GOSUB LoadReg
IF TDataType=BOOLVAR THEN
	OutBuf="cmp al,dl"
ELSE
	OutBuf="cmp "+Reg0Name+","+Reg1Name
ENDIF
GOSUB OutCodeData
OutBuf=SymType+"bl"
GOSUB OutCodeData
RETURN

CmpString:
OutBuf="mov edi,"+Op1OwnerName+Op1Name
GOSUB OutCodeData
OutBuf="mov esi,"+Op2OwnerName+Op2Name
GOSUB OutCodeData
OutBuf="call __CmpStr"
GOSUB OutCodeData
OutBuf=SymType+"bl"
GOSUB OutCodeData
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
IF TempByte="'" OR TempByte=";" THEN NexToken5' Remark
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
IF TokenType=TTypInt AND RIGHT$(TokenBuf,1)="o" THEN' Intel hex->Motorola
	IF LEFT$(TokenBuf,1)<>"0" THEN
		TokenSaf="%"+LEFT$(TokenBuf,LEN(TokenBuf)-1)
	ELSE
		TokenSaf="%"+MID$(TokenBuf,2,LEN(TokenBuf)-2)' removes leading 0
	ENDIF
	TokenBuf=TokenSaf
	TokenType=TTypOct
ENDIF
IF TokenType=TTypInt AND RIGHT$(TokenBuf,1)="b" THEN' Intel hex->Motorola
	IF LEFT$(TokenBuf,1)<>"0" THEN
		TokenSaf="&"+LEFT$(TokenBuf,LEN(TokenBuf)-1)
	ELSE
		TokenSaf="&"+MID$(TokenBuf,2,LEN(TokenBuf)-2)' removes leading 0
	ENDIF
	TokenBuf=TokenSaf
	TokenType=TTypBin
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
IF LNFlag=0 THEN NotLineNum
IF LEN(RootSym)>5 THEN NotLineNum
TempByte=MID$(RootSym,1,1)
IF TempByte<"0" OR TempByte>"9" THEN NotLineNum
LabNdx=1
BldLineNumLbl:
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
GOTO BldLineNumLbl
NotLineNum:
LabNdx=1
TempByte=MID$(RootSym,1,1)
IF TempByte>="A" AND TempByte<="Z" THEN ValidSymLoop
IF TempByte>="a" AND TempByte<="z" THEN ValidSymLoop
IF TempByte="_" THEN ValidSymLoop
RETURN
ValidSymLoop:
INC LabNdx
IF LabNdx>LEN(RootSym) THEN
	SymbolOK=$ff
	SymbolSaf=RootSym
	RETURN
ENDIF
TempByte=MID$(RootSym,LabNdx,1)
IF TempByte>="0" AND TempByte<="9" THEN ValidSymLoop
IF TempByte>="A" AND TempByte<="Z" THEN ValidSymLoop
IF TempByte>="a" AND TempByte<="z" THEN ValidSymLoop
IF TempByte="_" THEN ValidSymLoop
IF TempByte="$" AND LabNdx=LEN(RootSym) THEN ValidSymLoop
RETURN

ValidInt:
IntOK=0
IF LEN(TokenBuf)>10 THEN
	RETURN
ENDIF
ValidNdx=0
ValidIntLoop:
INC ValidNdx
IF ValidNdx>LEN(TokenBuf) THEN
	IntOK=$ff
	RETURN
ENDIF
TempByte=MID$(TokenBuf,ValidNdx,1)
IF TempByte>="0" AND TempByte<="9" THEN ValidIntLoop
RETURN

ValidHex:
HexOK=0
IF LEN(TokenBuf)>9 THEN
	RETURN
ENDIF
ValidNdx=1
ValidHexLoop:
INC ValidNdx
IF ValidNdx>LEN(TokenBuf) THEN
	HexOK=$ff
	RETURN
ENDIF
TempByte=MID$(TokenBuf,ValidNdx,1)
IF TempByte>="0" AND TempByte<="9" THEN ValidHexLoop
IF TempByte>="a" AND TempByte<="f" THEN ValidHexLoop
RETURN

ValidFlt:
OneDot=0
FloatOK=0
IF LEN(TokenBuf)>21 THEN
	RETURN
ENDIF
ValidNdx=0
ValidFltLoop:
INC ValidNdx
IF ValidNdx>LEN(TokenBuf) THEN
	FloatOK=$ff
	RETURN
ENDIF
TempByte=MID$(TokenBuf,ValidNdx,1)
IF TempByte>="0" AND TempByte<="9" THEN ValidFltLoop
IF TempByte="." THEN
	IF OneDot=0 THEN
		OneDot=$ff
		GOTO ValidFltLoop
	ENDIF
ENDIF
RETURN

SymSrch:
SymFull=0
SymFound=0
SymNdx=0
TempName=SymTemp.SymName
TempStr=TempName
TempInt=CHKWORD(TempStr)
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
SymTemp.Owner=OwnerCode
SymTable(SymNdx)=SymTemp
LastSym=SymNdx
TempStr=SymTemp.SymName
SymTableKey(SymNdx)=CHKWORD(TempStr)
RETURN

KeyLook:
KeyNdx=0
TempInt=CHKWORD(TokenBuf)
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
Op1OwnerName=OperandOwnerName
Op1Class=OpClass
Op1Type=TDataType
Op1Mod=TDataMod
Op1Detail=TDetail
IF TDataType=BOOLVAR THEN
	IF NextByte="=" OR NextByte="<" THEN
		GOSUB NexToken
		IF TokenBuf="=" THEN
			SymType="sete "
		ELSE
			SymType="setne "
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
		SymType="sete "
		GOTO CmpOps3
	ENDIF
ENDIF
GOSUB NexToken
IF TokenType<>1 THEN
	ErrNo=ErrIVExp
	RETURN
ENDIF
SymType=""
SELECT CASE TokenBuf
	CASE "="
		SymType="sete "
		SimpleOp="je "
		SimpleStructOp="jne "
	CASE "<"
		SymType="setl "
		SimpleOp="jnl "
		SimpleStructOp="jge "
	CASE ">"
		SymType="setg "
		SimpleOp="jg "
		SimpleStructOp="jle "
	CASE "<="
		SymType="setle "
		SimpleOp="jle "
		SimpleStructOp="jg "
	CASE ">="
		SymType="setge "
		SimpleOp="ge "
		SimpleStructOp="jl "
	CASE "<>"
		SymType="setne "
		SimpleOp="jne "
		SimpleStructOp="je "
	CASE ELSE
		ErrNo=ErrIVExp
		RETURN
END SELECT
CmpOps2:
GOSUB Expr
ErrRet
Op2Name=TSymName
Op2OwnerName=OperandOwnerName
Op2Class=OpClass
Op2Type=TDataType
Op2Mod=TDataMod
Op2Detail=TDetail
TempInt=LOR(Op1Mod,TempBit)
IF ComplexCmp=0 THEN
	IF KeyNdx=10 AND HasFcn=0 AND Op1Class=INTClass AND TempInt=TempBit AND Op2Class=INTClass AND Op2Mod=ConstBit THEN
		GOSUB NexToken
		IF TokenBuf<>"or" AND TokenBuf<>"and" then
			SimpleCmp=$ff
			RETURN
		ENDIF
		GOSUB UnDoToken
	ENDIF
ENDIF
ComplexCmp=$ff
CmpOps3:
IF InitTrue=0 THEN
	OutBuf="xor bh,bh"
	GOSUB OutCodeData
	InitTrue=$ff
ENDIF
IF Op1Class=INTClass OR Op1Class=FLTClass OR Op1Class=BOOLClass THEN
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
IF Op1Class=0 OR Op1Class=ARRClass OR Op1Class=CPXClass THEN
	ErrNo=ErrIVExp
	RETURN
ENDIF
IF AndOrFlag=0 THEN
	OutBuf="and bh,bl"
ELSE
	OutBuf="or bh,bl"
ENDIF
GOSUB OutCodeData
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
		IF SymFound=$ff AND SymTable(SymNdx).DataType=COMPVAR OR SymTable(SymNdx).DataType=MACROVAR THEN
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

F1:
' EOF(#FileNum)
FileStat=$ff
GOSUB ClassOp
GOSUB GetPthNum2
ErrRet
OutBuf="invoke GetFileSize,[_IOPthNum],0"
GOSUB OutCodeData
OutBuf="mov [_ArgSafe0],eax"
GOSUB OutCodeData
GOSUB CallErr
OutBuf="invoke SetFilePointer,[_IOPthNum],0,0,FILE_CURRENT"
GOSUB OutCodeData
GOSUB CallErr
OpClass=BOOLClass
TDataType=BOOLVAR
GOSUB GetTmp
ErrRet
OutBuf="cmp eax,[_ArgSafe0]"
GOSUB OutCodeData
OutBuf="sete cl; Set result"
GOSUB OutCodeData
OutBuf="mov byte ["+SymTemp.SymName+"],cl"
GOSUB OutCodeData
ExpTable(ExpNdx)=SymNdx
RETURN

F2:
' LEN(String)
GOSUB ClassOp
IF TDataType<>STRINGVAR OR DMArray<>0 THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
OutBuf="mov esi,"+OperandOwnerName+SymTemp.SymName
GOSUB OutCodeData
GOSUB GetIntTmp
ErrRet
OutBuf="call __StrLen"
GOSUB OutCodeData
GOSUB StoreD0Tmp
ExpTable(ExpNdx)=SymNdx
RETURN

F3:
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
		OutBuf=";eax=eaxf;"
		GOSUB OutCodeData	
	ENDIF
	SELECT CASE FcnCode
		CASE 69
			TempInt=2
		CASE 70
			TempInt=8
		CASE 3
			TempInt=10
		CASE 49
			TempInt=16
		CASE ELSE
			ErrNo=ErrTypMis
			RETURN
	END SELECT			
	OutBuf="cinvoke ltoa,eax,[_ConvBuf1],"+STR$(TempInt)
ELSE
	OutBuf="call __DtoA"
ENDIF
GOSUB OutCodeData
GOSUB NumToA
RETURN

NumToA:
GOSUB GetStrVec
ErrRet
OutBuf="mov edi,"+SymTemp.SymName
GOSUB OutCodeData
OutBuf="mov esi,_ConvBuf1"
GOSUB OutCodeData
OutBuf="call __MovStr"
GOSUB OutCodeData
ExpTable(ExpNdx)=SymNdx
RETURN

F4:
' VAL(String)
GOSUB ClassOp
IF TDataType<>STRINGVAR OR DMArray<>0 THEN
	ErrNo=ErrTypMis'  wrong type
	RETURN
ENDIF
IF Op1Class=FLTClass AND FcnCode=4 THEN
	FcnCode=24
ENDIF
IF FcnCode=24 THEN
	OutBuf=";eaxf=_AtoD();"
ELSE
	OutBuf="mov esi,["+OperandOwnerName+TSymName+"]"
	GOSUB OutCodeData
	OutBuf="call __AtoL"
ENDIF
GOSUB OutCodeData
IF FcnCode=24 THEN
	INC FloatFlag
	OpClass=FLTClass
	TDataType=FLOATVAR
	GOSUB GetFltTmp
	ErrRet
ELSE
	OpClass=INTClass
	GOSUB GetIntTmp
	ErrRet
ENDIF
IF FcnCode=24 THEN
	OutBuf=";"+SymTemp.SymName+"=eaxf;"
ELSE
	OutBuf="mov ["+SymTemp.SymName+"],eax"
ENDIF
GOSUB OutCodeData
ExpTable(ExpNdx)=SymNdx
RETURN

F5:
' LAND(Exp1,Exp2)
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
IF TSymName<>"~" THEN
	GOSUB LoadReg
	ErrRet
ENDIF
INC ExpNdx
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
IF TSymName<>"~" THEN
	GOSUB LoadReg
	ErrRet
ENDIF
GOSUB GetIntTmp
ErrRet
SELECT CASE FcnCode
	CASE 5' LAND()
		OutBuf="and eax,edx"
	CASE 7' LOR()
		OutBuf="or eax,edx"
	CASE 9' MOD()
		OutBuf="mov ecx,edx"
		GOSUB OutCodeData
		OutBuf="xor edx,edx"
		GOSUB OutCodeData
		OutBuf="idiv ecx"
		GOSUB OutCodeData
		OutBuf="mov eax,edx"
	CASE 19' LXOR()
		OutBuf="xor eax,edx"
END SELECT
GOSUB OutCodeData
GOSUB StoreD0Tmp
ExpTable(ExpNdx)=SymNdx
RETURN

F6:
' MID$(String,Position,Quantity)
IF FcnCode=6 THEN
	IF ExpRight-ExpLeft<>4 THEN
		ErrNo=ErrFcn
		RETURN
	ENDIF
ENDIF
GOSUB MidLftRt
RETURN

MidLftRt:
GOSUB ClassOp
IF TDataType<>STRINGVAR THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
IF DMVector<>0 AND DMTemp=0 THEN
	REM need to make a temp vector
	GOSUB SetTmpVec
	ErrRet
ENDIF
OutBuf="mov esi,"+OperandOwnerName+TSymName
GOSUB OutCodeData
INC ExpNdx
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
GOSUB LoadReg' first arg
ErrRet
SELECT CASE FcnCode
	CASE 6' Mid$
		INC ExpNdx
		GOSUB ClassOp
		IF OpClass<>INTClass THEN
			ErrNo=ErrTypMis
			RETURN
		ENDIF
		GOSUB LoadReg' second arg
		ErrRet
		OutBuf="call __MidStr"
	CASE 8' Left$
		OutBuf="mov edx,eax"
		GOSUB OutCodeData
		OutBuf="mov eax,1"
		GOSUB OutCodeData
		OutBuf="call __MidStr"
	CASE 11' Right$
		OutBuf="call __RightStr"
	CASE 80' TAil$
		OutBuf="call __TailStr"
END SELECT
GOSUB OutCodeData
ExpNdx=ExpLeft+1
RETURN

F7:
' LOR(Exp1,Exp2)
GOSUB F5
RETURN

F8:
' LEFT$(String,Quantity)
IF ExpRight-ExpLeft<>3 THEN
	ErrNo=ErrFcn
	RETURN
ENDIF
GOSUB MidLftRt
RETURN

F9:
' MOD(Exp1,Exp2)
GOSUB F5
RETURN

F10:
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
OutBuf="mov [_ChrTmp"+STR$(ChrTmpUse)+"],al"
GOSUB OutCodeData
ExpTable(ExpNdx)=SymNdx
RETURN

F11:
' RIGHT$(String,Quantity)
IF Target<>0 THEN
	ErrNo=ErrIVTarg
	RETURN
ENDIF
GOSUB MidLftRt
RETURN

F12:
' ASC(String)
GOSUB ClassOp
IF TDataType<>STRINGVAR OR DMArray<>0 THEN
	ErrNo=ErrFcn
	RETURN
ENDIF
GOSUB GetIntTmp
ErrRet
OutBuf="mov esi,["+OperandOwnerName+TSymName+"]"
GOSUB OutCodeData
OutBuf="mov al, byte [esi]"
GOSUB OutCodeData
GOSUB StoreD0Tmp
ExpTable(ExpNdx)=SymNdx
RETURN

F13:
' NOT(Boolean)
GOSUB ClassOp
IF TDataType<>1 THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
OpClass=BOOLClass
TDataType=BOOLVAR
ErrRet
IF TSymName<>"~" THEN
	D0Loaded=0
	GOSUB LoadReg
	ErrMain
ENDIF
GOSUB GetTmp
OutBuf="btc eax,0"
GOSUB OutCodeData
GOSUB StoreD0Tmp
ExpTable(ExpNdx)=SymNdx
RETURN

F14:
' BUFADR(Buffer)
GOSUB ClassOp
IF TDataType<>BUFFER THEN
	ErrNo=ErrTypMis
ENDIF
GOSUB GetIntTmp
ErrRet
IF FcnCode=14 THEN
	OutBuf="mov eax,["+OperandOwnerName+TSymName+"]"
ELSE
	OutBuf="mov eax,["+OperandOwnerName+TSymName+"+4]"
ENDIF
GOSUB OutCodeData
GOSUB StoreD0Tmp
ExpTable(ExpNdx)=SymNdx
RETURN

F15:
' BUFSIZ(Buffer)
GOSUB F14
RETURN

F16:
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
	OutBuf="call __PrintTab"
	GOSUB OutCodeData
	GOSUB CallErr
ELSE
	ErrNo=ErrTypMis
ENDIF
RETURN

F17:
' PEEK
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
D0Loaded=0
GOSUB LoadReg
OutBuf=";(long)_Poker=eax;"
GOSUB OutCodeData
GOSUB GetIntTmp
ErrRet
OutBuf=";"+SymTemp.SymName+"=*_Poker;"
GOSUB OutCodeData
ExpTable(ExpNdx)=SymNdx
RETURN

F18:
' ADDR(Var)
GOSUB ClassOp
IF FloatFlag>0 THEN
	DEC FloatFlag
ENDIF
IF TDataType>STRINGVAR AND TDataType<COMPLEX OR DMConst<>0 THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
IF DMArray=0 THEN
	GOSUB GetBase
ELSE
	IF DMVector=0 THEN
		OutBuf="mov esi,"+OperandOwnerName+TSymName
		GOSUB OutCodeData
	ELSE
		OutBuf="add esi,"+STR$(CpxArrayOffset)
		GOSUB OutCodeData
	ENDIF
ENDIF
OutBuf="mov eax,esi"
GOSUB OutCodeData
GOSUB GetIntTmp
ErrRet
GOSUB StoreD0Tmp
ExpTable(ExpNdx)=SymNdx
RETURN

F19:
' LXOR(IntExpr)
GOSUB F5
RETURN

F20:
' LNOT(IntExpr)
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
IF TSymName<>"~" THEN
	D0Loaded=0
	GOSUB LoadReg
	ErrMain
ENDIF
GOSUB GetIntTmp
ErrRet
OutBuf="not "+Reg0Name
GOSUB OutCodeData
GOSUB StoreD0Tmp
ExpTable(ExpNdx)=SymNdx
RETURN

F21:
' INDEX(Pointer,IntExpr)
GOSUB ClassOp
IF DMAddr=0 THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
FcnOp1Nam=TSymName
IF DMVector<>0 THEN
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
OutBuf="mov eax,"+TSymName
GOSUB OutCodeData
OutBuf="imul eax,"+STR$(VarSize)
GOSUB OutCodeData
OutBuf="add eax,["+FcnOp1Nam+"]"
GOSUB OutCodeData
OutBuf="mov ["+SymTemp.SymName+"],eax"
GOSUB OutCodeData
ExpTable(ExpNdx)=SymNdx
RETURN

GetVarSiz:
SELECT CASE TDataType
	CASE COMPLEX
		VarSize=SymTable(TDetail).DataSize
	CASE STRINGVAR
		VarSize=TDetail
	CASE BOOLVAR
		VarSize=1
	CASE BYTEVAR
		VarSize=1
	CASE WORDVAR
		VarSize=2
	CASE LONGVAR
		VarSize=4
	CASE FLOATVAR
		VarSize=8
END SELECT
RETURN

F22:
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
OutBuf="mov ["+SymTemp.SymName+"],"+STR$(VarSize)
GOSUB OutCodeData
ExpTable(ExpNdx)=SymNdx
RETURN

F23:
' IVAL(String)
GOSUB F4
RETURN

F24:
' FVAL(String)
GOSUB F4
RETURN

F25:
' TRIM$
GOSUB ClassOp
IF TDataType<>STRINGVAR THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
IF DMVector<>0 AND DMTemp=0 THEN
	GOSUB SetTmpVec
	ErrRet
ENDIF
OutBuf="call __TrmStr"
GOSUB OutCodeData
ExpNdx=ExpLeft+1
RETURN

F26:
' FILSIZ(#FileNum)
FileStat=$ff
GOSUB ClassOp
GOSUB GetPthNum2
ErrRet
OutBuf="invoke GetFileSize,[_IOPthNum],0"
GOSUB OutCodeData
GOSUB SetStatus
GOSUB CallErr
GOSUB GetIntTmp
ErrRet
GOSUB StoreD0Tmp
ExpTable(ExpNdx)=SymNdx
RETURN

F27:
' FILPOS(#FileNum)
FileStat=$ff
GOSUB ClassOp
GOSUB GetPthNum2
ErrRet
OutBuf="invoke SetFilePointer,[_IOPthNum],0,0,FILE_CURRENT"
GOSUB OutCodeData
GOSUB SetStatus
GOSUB CallErr
GOSUB GetIntTmp
ErrRet
GOSUB StoreD0Tmp
ExpTable(ExpNdx)=SymNdx
RETURN

F28:
' SQR(Expr)
GOSUB ClassOp
INC FloatFlag
IF OpClass<>INTClass AND OpClass<>FLTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
SELECT CASE FcnCode
	CASE 28
		TempStr="sqrt"
	CASE 31
		TempStr="sin"
	CASE 32
		TempStr="cos"
	CASE 33
		TempStr="tan"
	CASE 34
		TempStr="asin"
	CASE 35
		TempStr="acos"
	CASE 36
		TempStr="atan"
	CASE 37
		TempStr="log"
	CASE 38
		TempStr="log10"
END SELECT
GOSUB GetFltTmp
ErrRet
IF DMVector=0 THEN
	OutBuf=";"+SymTemp.SymName+"="+TempStr+"((double)"+TSymName+");"
ELSE
	OutBuf=";"+SymTemp.SymName+"="+TempStr+"(*((double*)"+TSymName+"._Ptr));"
ENDIF
GOSUB OutCodeData
ExpTable(ExpNdx)=SymNdx
RETURN

F29:
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
	OutBuf=";"+SymTemp.SymName+"=(long)"+TSymName+";"
ELSE
	OutBuf=";"+SymTemp.SymName+"=(long)*((double*)"+TSymName+"._Ptr);"
ENDIF
GOSUB OutCodeData
ExpTable(ExpNdx)=SymNdx
RETURN

F30:
' ABS(Expr)
GOSUB ClassOp
IF OpClass<>INTClass AND OpClass<>FLTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
IF SymTemp.SymName<>"~" THEN
	D0Loaded=0
	GOSUB LoadReg
ENDIF
IF OpClass=INTClass THEN
	GOSUB GetIntTmp
	ErrRet
	OutBuf="cinvoke abs,eax"
	GOSUB OutCodeData
	GOSUB StoreD0Tmp
ELSE
	GOSUB GetFltTmp
	ErrRet
	OutBuf=";"+SymTemp.SymName+"=fabs("+TSymName+");"
	GOSUB OutCodeData
ENDIF
ExpTable(ExpNdx)=SymNdx
RETURN

F31:
' SIN(Expr)
GOSUB F28
RETURN

F32:
' COS(Expr)
GOSUB F28
RETURN

F33:
' TAN(Expr)
GOSUB F28
RETURN

F34:
' ASN(Expr)
GOSUB F28
RETURN

F35:
' ACS(Expr)
GOSUB F28
RETURN

F36:
' ATN(Expr)
GOSUB F28
RETURN

F37:
' LOG(Expr)
GOSUB F28
RETURN

F38:
' LOG10(Expr)
RETURN

F39:
' Vacant
RETURN

F40:
' Vacant
RETURN

F41:
' THOUR()
GOSUB DateTime
RETURN

F42:
' TMIN()
GOSUB DateTime
RETURN

F43:
' TSEC()
GOSUB DateTime
RETURN

F44:
' TYEAR()
GOSUB DateTime
RETURN

F45:
' TMON()
GOSUB DateTime
RETURN

F46:
' TDAT()
GOSUB DateTime
RETURN

F47:
' TDAY()
GOSUB DateTime
RETURN

DateTime:
OutBuf=";_t=time(0);"
GOSUB OutCodeData
OutBuf=";_systime=localtime(&_t);"
GOSUB OutCodeData
GOSUB GetIntTmp
ErrRet
IF FcnCode=41 THEN
	OutBuf=";"+SymTemp.SymName+"=_systime->tm_hour;"
	GOSUB OutCodeData
ENDIF
IF FcnCode=42 THEN
	OutBuf=";"+SymTemp.SymName+"=_systime->tm_min;"
	GOSUB OutCodeData
ENDIF
IF FcnCode=43 THEN
	OutBuf=";"+SymTemp.SymName+"=_systime->tm_sec;"
	GOSUB OutCodeData
ENDIF
IF FcnCode=44 THEN
	OutBuf=";"+SymTemp.SymName+"=_systime->tm_year;"
	GOSUB OutCodeData
ENDIF
IF FcnCode=45 THEN
	OutBuf=";"+SymTemp.SymName+"=_systime->tm_mon+1;"
	GOSUB OutCodeData
ENDIF
IF FcnCode=46 THEN
	OutBuf=";"+SymTemp.SymName+"=_systime->tm_mday;"
	GOSUB OutCodeData
ENDIF
IF FcnCode=47 THEN
	OutBuf=";"+SymTemp.SymName+"=_systime->tm_wday;"
	GOSUB OutCodeData
ENDIF
ExpTable(ExpNdx)=SymNdx
RETURN

F48:
' CHKWORD(STRING)
'code template is for ASC(STRING)
GOSUB ClassOp
IF TDataType<>STRINGVAR OR DMArray<>0 THEN
	ErrNo=ErrFcn
	RETURN
ENDIF
GOSUB GetIntTmp
ErrRet
OutBuf="xor eax,eax"
GOSUB OutCodeData
OutBuf="mov esi,["+OperandOwnerName+TSymName+"]"
GOSUB OutCodeData
OutBuf="mov edx,["+OperandOwnerName+TSymName+"+4]"
GOSUB OutCodeData
OutBuf="xor ecx,ecx"
GOSUB OutCodeData
INC LabelNum
OutBuf="_Lbl"+STR$(LabelNum)+":"
GOSUB OutCodeData
OutBuf="mov cl, byte [esi]"
GOSUB OutCodeData
OutBuf="or cl,cl"
GOSUB OutCodeData
OutBuf="je _Lbl"+STR$(LabelNum+1)
GOSUB OutCodeData
OutBuf="inc esi"
GOSUB OutCodeData
OutBuf="add eax,ecx"
GOSUB OutCodeData
OutBuf="dec edx"
GOSUB OutCodeData
OutBuf="jne _Lbl"+STR$(LabelNum)
GOSUB OutCodeData
INC LabelNum
OutBuf="_Lbl"+STR$(LabelNum)+":"
GOSUB OutCodeData
GOSUB StoreD0Tmp
ExpTable(ExpNdx)=SymNdx
RETURN

F49:
' HEX$(INT)
GOSUB F3
RETURN

F50:
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
OutBuf="bt eax,edx"
GOSUB OutCodeData
OpClass=BOOLClass
TDataType=BOOLVAR
GOSUB GetTmp
ErrRet
OutBuf="setc cl; Set result"
GOSUB OutCodeData
OutBuf="mov byte ["+SymTemp.SymName+"],cl"
GOSUB OutCodeData
ExpTable(ExpNdx)=SymNdx
RETURN

F51:
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
OutBuf="mov ecx,edx"
GOSUB OutCodeData
OpSizeStr="cl"
SELECT CASE FcnCode
	CASE 51
		TempStr="shl "
	CASE 52
		TempStr="shr "
	CASE 53
		TempStr="rol "
	CASE 54
		TempStr="ror "
	CASE 55
		TempStr="btc "
		OpSizeStr="ecx"
	CASE 56
		TempStr="btr "
		OpSizeStr="ecx"
	CASE 57
		TempStr="bts "
		OpSizeStr="ecx"
	CASE 62
		TempStr="sal "
	CASE 63
		TempStr="sar "
	CASE 64
		TempStr="rcl "
	CASE 65
		TempStr="rcr "
ENDSELECT
OutBuf=TempStr+Reg0Name+","+OpSizeStr
GOSUB OutCodeData
GOSUB GetIntTmp
ErrRet
GOSUB StoreD0Tmp
ExpTable(ExpNdx)=SymNdx
RETURN

F52:
' SHL
GOSUB F51
RETURN

F53:
' ROL
GOSUB F51
RETURN

F54:
' ROR
GOSUB F51
RETURN

F55:
' BITCHG
GOSUB F51
RETURN

F56:
' BITCLR
GOSUB F51
RETURN

F57:
' BITSET
GOSUB F51
RETURN

F58:
' SUBSTR(Str1,Str2,[StartPos])
GOSUB ClassOp
IF TDataType<>STRINGVAR THEN
	ErrNo=ErrIVType
	RETURN
ENDIF
IF DMVector<>0 AND DMTemp=0 THEN
	GOSUB SetTmpVec
	ErrRet
ENDIF
FcnOp1Nam=TSymName
INC ExpNdx
GOSUB ClassOp
IF TDataType<>STRINGVAR THEN
	ErrNo=ErrIVType
	RETURN
ENDIF
IF DMVector<>0 AND DMTemp=0 THEN
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
OutBuf=";"+SymTemp.SymName+"=_SubStr(&"+FcnOp1Nam+",&"+TempStr+","+TSymName+");"
GOSUB OutCodeData
ExpTable(ExpNdx)=SymNdx
RETURN

F59:
' ZSTR$(INT)
GOSUB ClassOp
GOSUB LoadReg
ErrRet
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
OutBuf=";_ZLtoA(eax);"
GOSUB OutCodeData
GOSUB NumToA
RETURN

F60:
' ZHEX$(INT)
GOSUB ClassOp
GOSUB LoadReg
ErrRet
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
OutBuf=";_ZLtoH(eax);"
GOSUB OutCodeData
GOSUB NumToA
RETURN

F61:
' USING()

RETURN

F62:
' SAL()
GOSUB F51
RETURN

F63:
' SAR()
GOSUB F51
RETURN

F64:
' RCL()
GOSUB F51
RETURN

F65:
' RCR()
GOSUB F51
RETURN

F66:
' TABLESIZE()
GOSUB ClassOp
IF LAND(TDataMod,ArrayBit)<>ArrayBit THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
GOSUB GetIntTmp
ErrRet
TempInt=TDataSize/TDataAddr
OutBuf="mov ["+SymTemp.SymName+"],"+STR$(TempInt)
GOSUB OutCodeData
ExpTable(ExpNdx)=SymNdx
RETURN

F67:
' FilTyp()
'GetFileType
RETURN

F68:
' CurDir()
'GetCurrentDirectory
RETURN

F69:
' BIN$()
GOSUB F3
RETURN

F70:
' OCT$()
GOSUB F3
RETURN

F71:
' Vacant()
RETURN

F72:
' RND()
GOSUB GetIntTmp
ErrRet
OutBuf=";"+SymTemp.SymName+"=rand();"
GOSUB OutCodeData
ExpTable(ExpNdx)=SymNdx
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
' Vacant()
RETURN

F78:
' LCASE$()
GOSUB ClassOp
IF TDataType<>STRINGVAR OR DMArray<>0 THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
OutBuf="mov edi,_IOBuffer"
GOSUB OutCodeData
OutBuf="mov esi,"+OperandOwnerName+TSymName
GOSUB OutCodeData
OutBuf="call __MovStr"
GOSUB OutCodeData
OutBuf="mov esi,_IOBuffer"
GOSUB OutCodeData
IF FcnCode=78 THEN
	OutBuf="call __LCase"
ELSE
	OutBuf="call __UCase"
ENDIF
GOSUB OutCodeData
ExpTable(ExpNdx)=96
RETURN

F79:
' UCASE$()
GOTO F77

F80:
' Tail$(String,Quantity)
IF Target<>0 THEN
	ErrNo=ErrIVTarg
	RETURN
ENDIF
GOSUB MidLftRt
RETURN

F81:
' FINDADDR()
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
D0Loaded=0
GOSUB LoadReg
OutBuf="mov [_Poker],eax"
GOSUB OutCodeData
INC ExpNdx
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
D0Loaded=0
GOSUB LoadReg
OutBuf="mov [_ArgSafe0],eax"
GOSUB OutCodeData
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
OutBuf=";"+SymTemp.SymName+"=0;"
GOSUB OutCodeData
OutBuf=";while (_ArgSafe0){"
GOSUB OutCodeData
OutBuf=";if(*_Poker == eax){"
GOSUB OutCodeData
OutBuf=";"+SymTemp.SymName+"=(long)_Poker;"
GOSUB OutCodeData
OutBuf=";break;}"
GOSUB OutCodeData
OutBuf=";_Poker++;"
GOSUB OutCodeData
OutBuf=";_ArgSafe0--;}"
GOSUB OutCodeData
ExpTable(ExpNdx)=SymNdx
RETURN

F82:
' FINDOFFS()
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
D0Loaded=0
GOSUB LoadReg

' %%%%%%%%%%%############ bug follows
OutBuf="mov [_Poker],eax"
OutBuf="mov [_ArgSafe1],eax"
GOSUB OutCodeData
GOSUB OutCodeData

INC ExpNdx
GOSUB ClassOp
IF OpClass<>INTClass THEN
	ErrNo=ErrTypMis
	RETURN
ENDIF
D0Loaded=0
GOSUB LoadReg
OutBuf="mov [_ArgSafe0],eax"
GOSUB OutCodeData
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
OutBuf=";"+SymTemp.SymName+"=-1;"
GOSUB OutCodeData
OutBuf=";while (_ArgSafe0){"
GOSUB OutCodeData
OutBuf=";if(*_Poker == eax){"
GOSUB OutCodeData
OutBuf=";"+SymTemp.SymName+"=(long)_Poker-_ArgSafe1;"
GOSUB OutCodeData
OutBuf=";break;}"
GOSUB OutCodeData
OutBuf=";_Poker++;"
GOSUB OutCodeData
OutBuf=";_BlkCnt++;"
GOSUB OutCodeData
OutBuf=";_ArgSafe0--;}"
GOSUB OutCodeData
ExpTable(ExpNdx)=SymNdx
RETURN

OutCodeData:
INC AsmLineCtr
IF StartFlag=$ff THEN
	IF ProcFcnFlag=0 THEN
		GOSUB OutCode
	ELSE
		GOSUB OutFunction
	ENDIF
ELSE
	WRITE #DataFile,OutBuf
ENDIF
RETURN

OutDim:
WRITE #DimFile,OutBuf
INC AsmLineCtr
RETURN

OutDeclare:
WRITE #DeclareFile,OutBuf
INC AsmLineCtr
RETURN

OutInitData:
WRITE #DataFile,OutBuf
INC AsmLineCtr
RETURN

OutCode:
'LastFilePos=FILPOS(#CodeFile)
WRITE #CodeFile,OutBuf
INC AsmLineCtr
RETURN

OutFunction:
WRITE #FunctionFile,OutBuf
INC AsmLineCtr
RETURN

OutPreCode:
WRITE #PreCodeFile,OutBuf
INC AsmLineCtr
RETURN

StoreD0Tmp:
OutBuf="mov ["+SymTemp.SymName+"],eax"
GOSUB OutCodeData
D1Cleared=0
RETURN

OutWrite:
IF PrintFlag=0 THEN
	OutBuf="invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0"
ELSE
	OutBuf=";STATUS=write(_PrtPthNum,_XferAddr,XferCount);"
ENDIF
GOSUB OutCodeData
GOSUB SetStatus
GOSUB CallErrZ
RETURN

OutRead:
OutBuf="invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0"
GOSUB OutCodeData
GOSUB SetStatus
GOSUB CallErrZ
RETURN

SetStatus:
OutBuf="mov [STATUS],eax"
GOSUB OutCodeData
RETURN

OutCRLF:
OutBuf="mov [_XferAddr],_CRLF"
GOSUB OutCodeData
OutBuf="mov [XferCount],2"
GOSUB OutCodeData
OutBuf=";STATUS=write(_PrtPthNum,_XferAddr,XferCount);"
GOSUB OutCodeData
GOSUB CallErr 
RETURN

MacDefInc:
INC MacDefNdx
IF MacDefNdx>MacBufSiz THEN
	DEC MacDefNdx
	ErrNo=ErrMacBuf
ENDIF
RETURN

IncConStk:
INC ConStkPtr
IF ConStkPtr>40 THEN
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
	OutBuf="call __BtoA"
	GOSUB OutCodeData
	GOSUB NumToA
	RETURN
ENDIF
IF TSymName<>"~" THEN
	D0Loaded=0
	GOSUB LoadReg
	ErrRet
ENDIF
IF FloatFlag=0 THEN
	OutBuf="cinvoke ltoa,eax,[_ConvBuf1],10"
ELSE
	OutBuf=";_DtoA(eaxf);"
ENDIF
GOSUB OutCodeData
GOSUB NumToA
RETURN

ConStkChk:
IF ConStkPtr<1 THEN
	ErrNo=ErrUBCon
	RETURN
ENDIF
IF ConStk(ConStkPtr).ConType<>TempInt THEN
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
	IF SymFound=$ff AND SymTable(SymNdx).DataType=COMPVAR OR SymTable(SymNdx).DataType=MACROVAR THEN
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
OutBuf="; LN:"+STR$(BasicLineCtr)+" "+SrcLine
RETURN

BldComment:
OutBuf=";"+Comment
RETURN

GetDtaTyp:
SELECT CASE TDataType
	CASE BOOLVAR
		_DataType=" byte "
	CASE BYTEVAR
		_DataType=" byte "
	CASE WORDVAR
		_DataType=" word "
	CASE LONGVAR
		_DataType=" dword "
	CASE FLOATVAR
		_DataType=" double "
END SELECT
IF LAND(TDataMod,PointerBit)=PointerBit THEN
	_DataType=" dword "
ENDIF
RETURN

VecSymNam:
'GOSUB GetDtaTyp
VSymName=TSymName
TSymName="["+VSymName+"]"
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
	TSymName="eax"
ENDIF
IF TSymName<>"~" OR OpClass=INTClass THEN
	OutBuf=";eaxf="+TSymName+";"
	GOSUB OutCodeData
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
	OutBuf=";eax=eaxf;"
	GOSUB OutCodeData
ENDIF
RETURN

ReadSource:
SrcLine=""
SrcNdx=0
EndNdx=0
EndFound=0
QuoteFlg=0
WhiteSpaceCtr=0
FirstValidChar=FALSE
LOOP
	STATUS=GET #InpFile(InpFilPtr),RawData
	TempInt=XferCount
	IF TempInt=0 THEN
		IF EndFound=0 THEN
			EndNdx=EndNdx-WhiteSpaceCtr
		ENDIF
		RETURN
	ENDIF
	AsciiByte=ASC(RawData) 
	IF AsciiByte=NewLine THEN
		IF EndFound=0 THEN
			EndNdx=EndNdx-WhiteSpaceCtr
		ENDIF
		RETURN
	ENDIF
	IF QuoteFlg=0 THEN
		IF AsciiByte=OBQUOTE THEN
			QuoteFlg=$ff
		ENDIF
	ELSE
		IF AsciiByte=OBQUOTE THEN
			QuoteFlg=0
		ENDIF
	ENDIF
	IF AsciiByte=$27 THEN
		IF QuoteFlg=0 THEN
			EndFound=$ff
			EndNdx=EndNdx-WhiteSpaceCtr
		ENDIF
	ENDIF
	IF AsciiByte=$09 OR AsciiByte=$20 THEN
		INC WhiteSpaceCtr
	ELSE
		IF AsciiByte<>$0d THEN
			WhiteSpaceCtr=0
		ENDIF
	ENDIF
	IF FirstValidChar=FALSE THEN
		IF AsciiByte<>$0a AND AsciiByte<>$0d AND AsciiByte<>$09 AND AsciiByte<>$20 THEN
			FirstValidChar=TRUE
			SrcLine=SrcLine+RawData
			IF EndFound=0 THEN
				INC EndNdx
			ENDIF
		ENDIF
	ELSE
		IF AsciiByte<>$0d THEN' Temporary code?
			SrcLine=SrcLine+RawData
			IF EndFound=0 THEN
				INC EndNdx
			ENDIF
		ENDIF
	ENDIF
ENDLOOP
RETURN

GenCase:
IF OpClass=INTClass THEN
	OutBuf="mov edx,[_SwitchInt]"
	GOSUB OutCodeData
	OutBuf="cmp eax,edx"
	GOSUB OutCodeData
	OutBuf=SymType+"_Lbl"+STR$(LabelNum)
ELSE
	OutBuf="mov edi,_SwitchStr"
	GOSUB OutCodeData
	OutBuf="mov esi,"+OperandOwnerName+TSymName
	GOSUB OutCodeData
	OutBuf="call __CmpStr"
	GOSUB OutCodeData	
	OutBuf=SymType+" _Lbl"+STR$(LabelNum)
ENDIF
GOSUB OutCodeData
RETURN

EndCasex:
TempInt=7
GOSUB ConStkChk
ErrRet
OutBuf="jmp _Lbl"+STR$(ConStk(ConStkPtr).TermLabel)
GOSUB OutCodeData
OutBuf="_Lbl"+STR$(ConStk(ConStkPtr).ContLabel)+":"' get here if case not true
GOSUB OutCodeData
RETURN

MainLoopInit:
GOSUB ClrDatTyp
DMReDim=0
InitTrue=0
IgnoreRightParam=0
SimpleCmp=0
ComplexCmp=0
HasFcn=0
LetFlag=0
Target=0
PrintFlag=0
StatFlag=0
TabFlag=0
DevFlag=0
FileIO=0
DiskIO=0
BufRWFlg=0
D1Cleared=0
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

ClrDataRegs:
IF TDataType<>LONGVAR AND TDataType<>BOOLVAR THEN' Check for pointer here also?
	IF D1Cleared=0 THEN
		IF D0Loaded=0 THEN
			OutBuf="xor eax,eax"
		ELSE
			D1Cleared=$ff
			OutBuf="xor edx,edx"
		ENDIF
		GOSUB OutCodeData
	ENDIF
ENDIF
RETURN

GetSymTemp:
SymTemp=SymTable(SymNdx)
RETURN

GetSymTempExpNdx:
SymTemp=SymTable(ExpTable(ExpNdx))
RETURN

ChkLabel:
LNFlag=$ff
GOSUB TokenSym
ErrRet
IF SymFound=0 THEN
	SymTemp.DataType=LABELVAR
	GOSUB ClrSym
	SymTemp.Detail=LabelUnresolved
	IF KeyNdx=2 THEN' Restore
		SymTemp.DataMod=DataBit
	ENDIF
	SymTemp.Owner=OwnerCode
	GOSUB SymInsert
	ErrRet
ENDIF
TOwner=SymTable(SymNdx).Owner
GOSUB GetOwnerName
RETURN

MakeStrConst:
INC PoolCtr
OutBuf="_StrConst"+STR$(PoolCtr)+" db "+TokenSaf+",0"
GOSUB OutInitData
RETURN

MakeBuffer:
Comment="Memory Buffer"
GOSUB BldComment
GOSUB OutInitData
OutBuf=BufName+" dd 0"
GOSUB OutInitData
OutBuf=" dd 0"
GOSUB OutInitData
RETURN

ReleaseBuffer:
OutBuf="cmp ["+BufName+"+4],0"
GOSUB OutCodeData
INC LabelNum
OutBuf="je _Lbl"+STR$(LabelNum)
GOSUB OutCodeData
OutBuf="invoke  VirtualFree,["+BufName+"],0,MEM_RELEASE"
GOSUB OutCodeData
OutBuf="mov ["+BufName+"],0"
GOSUB OutCodeData
OutBuf="mov ["+BufName+"+4],0"
GOSUB OutCodeData
OutBuf="_Lbl"+STR$(LabelNum)+":"
GOSUB OutCodeData
RETURN

GetBuffer:
OutBuf="push eax"
GOSUB OutCodeData
OutBuf="cmp ["+BufName+"+4],0"
GOSUB OutCodeData
INC LabelNum
OutBuf="je _Lbl"+STR$(LabelNum)
GOSUB OutCodeData
OutBuf="invoke  VirtualFree,["+BufName+"],0,MEM_RELEASE"
GOSUB OutCodeData
OutBuf="mov ["+BufName+"],0"
GOSUB OutCodeData
OutBuf="mov ["+BufName+"+4],0"
GOSUB OutCodeData
OutBuf="_Lbl"+STR$(LabelNum)+":"
GOSUB OutCodeData
OutBuf="pop eax"
GOSUB OutCodeData
OutBuf="mov ["+BufName+"+4],eax"
GOSUB OutCodeData
OutBuf="invoke  VirtualAlloc,0,eax,MEM_COMMIT,PAGE_READWRITE"
GOSUB OutCodeData
OutBuf="mov ["+BufName+"],eax"
GOSUB OutCodeData
RETURN

PushArgs:
IgnoreRightParam=$ff
SymTemp=SymTable(SymNdx)
GOSUB GetFcnTypes
GOSUB NexToken
IF TokenBuf<>"(" THEN
	ErrNo=ErrSyntax
	RETURN
ENDIF
NeedComma=0
Ctr3=0
PushArgsLp:
IF Ctr3>TFcnArgs THEN
	ErrNo=ErrFcnArgs
	RETURN
ENDIF
GOSUB NexToken
IF TokenBuf=")" THEN
	IF Ctr3<>TFcnArgs THEN
		ErrNo=ErrFcnArgs
	ENDIF
	RETURN	
ENDIF
IF NeedComma<>0 THEN
	IF TokenSaf<>"," THEN
		ErrNo=ErrSyntax
		GOTO MainLoop
	ENDIF
	NeedComma=0
	GOTO PushArgsLp
ELSE
	IF TokenSaf="," THEN
		ErrNo=ErrSyntax
		GOTO MainLoop
	ENDIF
ENDIF
GOSUB UnDoToken
GOSUB Expr
ErrRet
INC Ctr3
GOSUB ArgPush
ErrRet
NeedComma=$ff
GOTO PushArgsLp
RETURN

PopArgs:
SymTemp=SymTable(SymNdx)
GOSUB GetFcnTypes
GOSUB NexToken
IF TokenBuf<>"(" THEN
	ErrNo=ErrSyntax
	RETURN
ENDIF
NeedComma=0
Ctr3=0
PopArgsLp:
IF Ctr3>TFcnArgs THEN
	ErrNo=ErrFcnArgs
	RETURN
ENDIF
GOSUB NexToken
IF TokenBuf=")" THEN
	IF Ctr3<>TFcnArgs THEN
		ErrNo=ErrFcnArgs
	ENDIF
	RETURN	
ENDIF
IF NeedComma<>0 THEN
	IF TokenSaf<>"," THEN
		ErrNo=ErrSyntax
		GOTO MainLoop
	ENDIF
	NeedComma=0
	GOTO PopArgsLp
ELSE
	IF TokenSaf="," THEN
		ErrNo=ErrSyntax
		GOTO MainLoop
	ENDIF
ENDIF
INC Ctr3
SymTemp.SymName=TokenSaf
GOSUB SymSrch
IF SymFound<>0 THEN
	ErrNo=ErrDupSym
	ErrRet
ENDIF
SymTemp.Owner=OwnerCode
SymTemp.Detail=0
OutBuf="; Auto diminsion of argument"
GOSUB OutDim
OutBuf="align 4"
GOSUB OutDim
SELECT CASE FcnTypes(Ctr3)
	CASE BOOLVAR
		' Pop bool here
	CASE LONGVAR
		OutBuf=OwnerName+TokenSaf+" rd 1"
		GOSUB OutDim
		OutBuf="mov eax,[_FcnArg"+STR$(Ctr3)+"]"
		GOSUB OutCodeData
		OutBuf="mov ["+OwnerName+TokenSaf+"],eax"
		GOSUB OutCodeData
		SymTemp.DataType=LONGVAR
		SymTemp.DataMod=0
		SymTemp.DataAddr=4
	CASE FLOATVAR
		' Pop float here
	CASE STRINGVAR
		OutBuf=OwnerName+TokenSaf+" rd 3"
		GOSUB OutDim
		OutBuf="mov esi,[_FcnArg"+STR$(Ctr3)+"]"
		GOSUB OutCodeData
		OutBuf="mov eax,[esi]"
		GOSUB OutCodeData
		OutBuf="mov ["+OwnerName+TokenSaf+"],eax"
		GOSUB OutCodeData
		OutBuf="add esi,4"
		GOSUB OutCodeData
		OutBuf="mov eax,[esi]"
		GOSUB OutCodeData
		OutBuf="mov ["+OwnerName+TokenSaf+"+4],eax"
		GOSUB OutCodeData
		OutBuf="mov ["+OwnerName+TokenSaf+"+8],0"
		GOSUB OutCodeData
		SymTemp.DataType=STRINGVAR
		SymTemp.DataMod=VectorBit
END SELECT
GOSUB SymInsert
NeedComma=$ff
GOTO PopArgsLp
RETURN

GetFcnTypes:
TFcnArgs=SymTemp.FcnArgs
TFcnDataType=SymTemp.FcnDataType
FcnTypes(1)=SymTemp.DataAddr
FcnTypes(2)=SymTemp.DataSize
FcnTypes(3)=SymTemp.ArrayDim1
FcnTypes(4)=SymTemp.ArrayDim2
FcnTypes(5)=SymTemp.ArrayDim3
FcnTypes(6)=SymTemp.ArrayDims
FcnTypes(7)=SymTemp.Misc
RETURN

ChkInt:
GOSUB ValidInt
IF IntOK=0 THEN
	ErrNo=ErrIVExp
ENDIF
RETURN

ChkSym:
GOSUB TokenSym1
ErrRet
IF SymFound=0 THEN
	ErrNo=ErrUDSym
	RETURN
ENDIF
RETURN

ChkHex:
GOSUB ValidHex
IF HexOK=0 THEN
	ErrNo=ErrIVExp
	RETURN
ENDIF
RETURN

ChkFlt:
GOSUB ValidFlt
IF FloatOK=0 THEN
	ErrNo=ErrIVExp
	GOTO MainLoop
ENDIF
RETURN

LoadNumericValue:
IF TSymName<>"~" THEN
	IF OpClass=INTClass THEN
		D0Loaded=0
		GOSUB LoadReg
	ELSE
		'TSymName="eaxf"
	ENDIF
ELSE
	IF OpClass=INTClass THEN
		TSymName="eax"
	ELSE
		'TSymName="eaxf"
	ENDIF
ENDIF
RETURN

PushNumeric:
GOSUB LoadNumericValue
OutBuf="mov [_FcnArg"+STR$(Ctr3)+"],eax"
GOSUB OutCodeData
RETURN

ProcFcnPrep:
GOSUB NexToken
SymTemp.SymName=TokenSaf
GOSUB SymSrch
IF SymFound=0 THEN
	ErrNo=ErrUDSym
	GOTO MainLoop
ENDIF
SymTable(SymNdx).Detail=LabelResolved
OwnerCode=SymNdx
GOSUB GetSymTemp
OwnerName=SymTemp.SymName+"!"
OutBuf=SymTemp.SymName+":"
GOSUB OutFunction
LastPublicSym=LastSym
GOSUB GetFcnTypes
RETURN

ArgPush:
SELECT CASE OpClass
	CASE BOOLClass
		IF FcnTypes(Ctr3)<>BOOLVAR THEN
			ErrNo=ErrTypMis
			RETURN
		ENDIF
		' Push bool here
	CASE INTClass
		IF FcnTypes(Ctr3)<>LONGVAR THEN
			ErrNo=ErrTypMis
			RETURN
		ENDIF
		GOSUB PushNumeric
	CASE FLTClass
		IF FcnTypes(Ctr3)<>FLOATVAR THEN
			ErrNo=ErrTypMis
			RETURN
		ENDIF
		GOSUB PushNumeric
	CASE STRClass
		IF FcnTypes(Ctr3)<>STRINGVAR THEN
			ErrNo=ErrTypMis
			RETURN
		ENDIF
		OutBuf="mov [_FcnArg"+STR$(Ctr3)+"],"+OperandOwnerName+TSymName
		GOSUB OutCodeData
END SELECT
RETURN

GetOwnerName:
IF TOwner=0 OR DMConst<>0 THEN
	OperandOwnerName=PublicOwnerName
ELSE
	OperandOwnerName=SymTable(TOwner).SymName+"!"
ENDIF
RETURN
