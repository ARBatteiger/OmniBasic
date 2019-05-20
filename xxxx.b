ic Copyright 1995,1996,1997,1998,1999 Computer Design Lab
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
' 10-20-02 Change all directives to statements except $IF, $ELSEIF, $ENDIF

'***** Subroutine Declarations ******

FUNCTION Add() VOID
FUNCTION AddLftGrp() VOID
FUNCTION AddMulti() VOID
FUNCTION AddRtGrp1() VOID
FUNCTION AddRtGrp2() VOID
FUNCTION And() VOID
FUNCTION BldComment() VOID
FUNCTION BldOffset() VOID
FUNCTION BufRW() VOID
FUNCTION CSChk() VOID
FUNCTION CallErr() VOID
FUNCTION ClassOp() VOID
FUNCTION ClassOp1() VOID
FUNCTION ClrDatTyp() VOID
FUNCTION ClrERR() VOID
FUNCTION ClrSym() VOID
FUNCTION ClrSymTab() VOID
FUNCTION CmdLine() VOID
FUNCTION CmpBool() VOID
FUNCTION CmpNum() VOID
FUNCTION CmpOps() VOID
FUNCTION CmpString() VOID
FUNCTION DateTime() VOID
FUNCTION DecVar() VOID
FUNCTION DevChk() VOID
FUNCTION DimVar() VOID
FUNCTION Div() VOID
FUNCTION EndCasex() VOID
FUNCTION Expr() VOID
SUBROUTINE F0'  EOF
SUBROUTINE F1'  LEN
SUBROUTINE F2'  STR$
SUBROUTINE F3'  VAL
SUBROUTINE F4'  LAND
SUBROUTINE F5'  MID$
SUBROUTINE F6'  LOR
SUBROUTINE F7'  LEFT$
SUBROUTINE F8'  MOD
SUBROUTINE F9'  CHR$
SUBROUTINE F10'  RIGHT$
SUBROUTINE F11'  ASC
SUBROUTINE F12'  NOT
SUBROUTINE F13'  BUFADR
SUBROUTINE F14'  BUFSIZ
SUBROUTINE F15'  TAB
SUBROUTINE F16'  PEEK
SUBROUTINE F17'  ADDR
SUBROUTINE F18'  LXOR
SUBROUTINE F19'  LNOT
SUBROUTINE F20'  INDEX
SUBROUTINE F21'  SIZE
SUBROUTINE F22'  IVAL
SUBROUTINE F23'  FVAL
SUBROUTINE F24'  TRM$
SUBROUTINE F25'  FILSIZ
SUBROUTINE F26'  FILPOS
SUBROUTINE F27'  SQR
SUBROUTINE F28'  INT
SUBROUTINE F29'  ABS
SUBROUTINE F30'  SIN
SUBROUTINE F31'  COS
SUBROUTINE F32'  TAN
SUBROUTINE F33'  ASN
SUBROUTINE F34'  ACS
SUBROUTINE F35'  ATN
SUBROUTINE F36'  LOG
SUBROUTINE F37'  LOG10
SUBROUTINE F38'  GETMENU
SUBROUTINE F39'  GETFILE
SUBROUTINE F40'  THOUR
SUBROUTINE F41'  TMIN
SUBROUTINE F42'  TSEC
SUBROUTINE F43'  TYEAR
SUBROUTINE F44'  TMON
SUBROUTINE F45'  TDAT
SUBROUTINE F46'  TDAY
SUBROUTINE F47'  MBUTTON
SUBROUTINE F48'  HEX$
SUBROUTINE F49'  BITTST
SUBROUTINE F50'  SHL
SUBROUTINE F51'  SHR
SUBROUTINE F52'  ROL
SUBROUTINE F53'  ROR
SUBROUTINE F54'  BITCHG
SUBROUTINE F55'  BITCLR
SUBROUTINE F56'  BITSET
SUBROUTINE F57'  SUBSTR
SUBROUTINE F58'  ZSTR$
SUBROUTINE F59'  ZHEX$
SUBROUTINE F60'  USING
SUBROUTINE F61'  Vacant
SUBROUTINE F62'  Vacant
SUBROUTINE F63'  Vacant
SUBROUTINE F64'  Vacant
SUBROUTINE F65'  Vacant
SUBROUTINE F66'  Vacant
SUBROUTINE F67'  Vacant
SUBROUTINE F68'  Vacant
SUBROUTINE F69'  Vacant
SUBROUTINE F70'  Vacant
SUBROUTINE F71'  RND
SUBROUTINE F72'  Vacant
SUBROUTINE F73'  Vacant
SUBROUTINE F74'  Vacant
SUBROUTINE F75'  Vacant
SUBROUTINE F76'  Vacant
SUBROUTINE F77'  LCASE$
SUBROUTINE F78'  UCASE$
SUBROUTINE F79'  REMNANT$
SUBROUTINE F80'  FINDADDR
SUBROUTINE F81'  FINDOFFS

FUNCTION FDInit() VOID
FUNCTION FDGetObjTyp() VOID
FUNCTION FDGetObjCls() VOID
FUNCTION FcnRegs() VOID
FUNCTION GenCase() VOID
FUNCTION GenXfrCnt() VOID
FUNCTION GetAccMod() VOID
FUNCTION GetBase() VOID
FUNCTION GetChrVec() VOID
FUNCTION GetColon() VOID
FUNCTION GetComma() VOID
FUNCTION GetDtaTyp() VOID
FUNCTION GetEqual() VOID
FUNCTION GetExp() VOID
FUNCTION GetFilePtr() VOID
FUNCTION GetFltOp() VOID
FUNCTION GetFltTmp() VOID
FUNCTION GetIntOp() VOID
FUNCTION GetIntTmp() VOID
FUNCTION GetLopVec() VOID

FUNCTION GetOpSize() VOID
FUNCTION GetPthNum() VOID
FUNCTION GetPthNum1() VOID
FUNCTION GetPthNum2() VOID
FUNCTION GetPthNam() VOID
FUNCTION GetPut() VOID
FUNCTION GetRP1() VOID
FUNCTION GetRegPrm() VOID
FUNCTION GetStrVec() VOID
FUNCTION GetTmp() VOID
FUNCTION GetTmpVec() VOID
FUNCTION GetVarSiz() VOID
FUNCTION GtRootSym() VOID
FUNCTION IncConStk() VOID
FUNCTION IncExpNdx() VOID
FUNCTION KeyLook() VOID
FUNCTION LoadReg() VOID
FUNCTION LookUp() VOID
FUNCTION MacDefInc() VOID
FUNCTION MacToken() VOID
FUNCTION MakString() VOID
FUNCTION MakTmpVec() VOID
FUNCTION MidLftRt() VOID
FUNCTION Mul() VOID
FUNCTION MultiInsert() VOID
FUNCTION NexToken() VOID
FUNCTION NexToken3() VOID
FUNCTION NumToA() VOID
FUNCTION Or() VOID
FUNCTION OutCRLF() VOID
FUNCTION OutCode() VOID
FUNCTION OutFcn() VOID
FUNCTION OutMain() VOID
FUNCTION OutVar() VOID
FUNCTION OutLabel() VOID
FUNCTION OutNewLine() VOID
FUNCTION OutRead() VOID
FUNCTION OutWrite() VOID
FUNCTION ParenScan() VOID
FUNCTION ParseOpt() VOID
FUNCTION PreScan() VOID
FUNCTION PreScan1() VOID
FUNCTION ProcExp() VOID
FUNCTION ProcKonst() VOID
FUNCTION ReadSource() VOID
FUNCTION ReadWrite() VOID
FUNCTION RegInit() VOID
FUNCTION Remark() VOID
FUNCTION ReqTmpVec() VOID
FUNCTION SETDx1() VOID
FUNCTION SetStrVec() VOID
FUNCTION SetTmpVec() VOID
FUNCTION SolveTerm() VOID
FUNCTION SquishExp() VOID
FUNCTION StoreD0() VOID
FUNCTION StrSiz() VOID
FUNCTION Sub() VOID
FUNCTION SubLoad() VOID
FUNCTION SymInsert() VOID
FUNCTION SymSearch() VOID
FUNCTION SymSrch() VOID
FUNCTION TokenSym() VOID
FUNCTION TokenSym1() VOID
FUNCTION UnBlkFcn() VOID
FUNCTION UnDoToken() VOID
FUNCTION Unary() VOID
FUNCTION ValidFlt() VOID
FUNCTION ValidHex() VOID
FUNCTION ValidInt() VOID
FUNCTION ValidSym() VOID
FUNCTION VarBlank() VOID
FUNCTION VecString() VOID
FUNCTION VecSymNam() VOID
FUNCTION Vectorize() VOID

' MACROS

MACRO CommaRet
 GetComma()
 ErrRet
ENDMACRO

MACRO CommaMain
 GetComma()
 ErrMain
ENDMACRO

MACRO ColonRet
 GetColon()
 ErrRet
ENDMACRO

MACRO ColonMain
 GetColon()
 ErrMain
ENDMACRO

MACRO EqualRet
 GetEqual()
 ErrRet
ENDMACRO

MACRO EqualMain
 GetEqual()
 ErrMain
ENDMACRO

MACRO InitReg0
 D0Loaded=0
ENDMACRO

MACRO MakeLong
 IF TDataMod&AddrBit=AddrBit THEN
	TDataType=LONG
 ENDIF
ENDMACRO

MACRO RET
 if 0=0 then
	return
 endif
ENDMACRO

MACRO GenCode
 OutCode()
ENDMACRO

MACRO GenVar
 OutVar()
ENDMACRO

MACRO GenMain
 OutMain()
ENDMACRO

MACRO GenFcn
 OutFcn()
ENDMACRO

MACRO GenRead
 OutRead()
ENDMACRO

MACRO GenWrite
 OutWrite()
ENDMACRO

MACRO GenCRLF
 OutCRLF()
ENDMACRO

MACRO GenNewLine
 OutNewLine()
ENDMACRO

MACRO ErrRet
;if (ErrNo) return;
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
 CONST ErrPrmCnt=31
 CONST ErrERRTrp=32
 CONST ErrArrSub=33

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
 CONST STRUCT=12
 CONST VOIDX=13
 CONST COMPLEX=14
 CONST BUFFER=15

 CONST ArrayBit=$0001
 CONST AddrBit=$0002
 CONST ConstBit=$0004
 CONST MultiBit=$0008
 CONST MemberBit=$0010
 CONST VectorBit=$0020
 CONST TempBit=$0040
 CONST DataBit=$0080
 CONST FileBit=$0100
 CONST TmpVec=$60
 CONST ArrayMsk=$fffe
 CONST AddrOrFile=$0101

 CONST NULLClass=0
 CONST INTClass=1
 CONST STRClass=2
 CONST ARRClass=3
 CONST CPXClass=4
 CONST FLTClass=5
 CONST BOOLClass=6
 CONST OBJClass=7
 CONST FRMClass=8

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

 CONST VoidFcn=0
 CONST IntFcn=1
 CONST DblFcn=2

 CONST ParamSize=32

 CONST NumTemps=15

 CONST _BufSize=300
 CONST MacBufSiz=20000
 CONST ExpTabSiz=100
 CONST UserSym=195'  set to first user symbol in PreDefined

 CONST SymTabSiz=3500

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
 DIM MultiNdx AS LONG
 DIM LastMulti AS LONG
 DIM FcnMulti AS LONG
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
 DIM OldCompVar AS BYTE
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
 DIM FcnSym AS LONG
 DIM FcnHeader AS STRING*_BufSize
 DIM FcnBlk(32) AS STRING*100
 DIM LetFlag AS BYTE
 DIM FcnBlkNdx AS BYTE
 DIM FcnFlag AS BYTE
 DIM SbrtnFlag AS BYTE
 DIM FcnActive AS BYTE
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
 DIM ParmCtr AS BYTE
 DIM ParamCount AS BYTE
 DIM ParmFlag AS BYTE
 DIM FcnVarFlg AS BYTE
 DIM ProcName AS STRING*28
 DIM DtaRegNum AS BYTE
 DIM LoopVars(40) AS STRING*28
 DIM LopVarNdx AS LONG
 DIM ProcFlag AS BYTE
 DIM UsrFcnNam AS STRING*42
 DIM UsrFcnNamx AS STRING*42
 DIM SetObjNam AS STRING*42
 DIM NumArgs AS BYTE
 DIM ParamCnt AS BYTE
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
 Dim ChrTmpUse AS LONG
 Dim StrTmpUse AS LONG
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
 DIM FcnFile AS BYTE
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
	DataType AS BYTE
	WinMod AS BYTE
	DataMod AS INTEGER
	Detail AS LONG
	DataAddr AS LONG
	DataSize AS LONG
	MultiPtr AS INTEGER
 END TYPE
 DIM SymTable(SymTabSiz) AS Symbol
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
 DIM TWinMod AS BYTE
 DIM TDataMod AS INTEGER
 DIM TDetail AS LONG
 DIM VDetail AS LONG
 DIM TDataAddr AS LONG
 DIM TDataSize AS LONG
 DIM TMultiPtr AS INTEGER
 DIM ExpTable(ExpTabSiz) AS LONG
 DIM TypePtr AS LONG
 DIM TypeFlag AS BYTE
 DIM LastEntry AS Symbol
 DIM SymTemp AS Symbol GLOBAL
 DIM SrcLine AS STRING*_BufSize
 DIM SrcLineCpy AS STRING*_BufSize
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
 PRINT "OmniBasic Version Exp0.1"

 PRINT

 PRINT "Copyright  1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002 Innomation Systems, Inc."
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
NoCodeFile:
 CREATE #CodeFile,"_CodFile":WRITE+TEXT
 ON ERROR GOTO NoVarFile
 DELETE "_VarFile"
NoVarFile:
 CREATE #VarFile,"_VarFile":WRITE+TEXT
 ON ERROR GOTO NoFcnFile
 DELETE "_FcnFile"
NoFcnFile:
 CREATE #FcnFile,"_FcnFile":WRITE+TEXT
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

 HaltFlag=0
 PromptFlag=0
 ProcedureFlag=0
 VerbFlag=0
 ParmFlag=0
 FcnVarFlg=0
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
InitSym:
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
 
Preamble:
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

 VarBlank()
 OutBuf="#define _BufSize "+STR$(_BufSize)
 GenVar
 OutBuf="#include "+CHR$($22)+"basic.h"+CHR$($22)
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

 VarBlank()
 OutBuf="static long _LoopCtr[10];"
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
	OutBuf="register void *_a0;"
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
    	ReqTmpVec()
    	OutBuf="_TmpVec1._Ptr=ProgramName;"
    	GenCode
    	OutBuf="_TmpVec1._Len=28;"
    	GenCode
    	OutBuf="_TmpVec1._Lnk=0;"
    	GenCode
 	OutBuf="_MovArg(&_TmpVec1,_ArgList);"
 	GenCode
	OutBuf=""
	GenMain
	StartFlag=0'  was on only to set up sys vars and vecs
 ENDIF
 OutBuf=""
 GenFcn
 Comment="Function and Subroutine Section"
 BldComment()
 GenFcn
 OutBuf=""
 GenFcn
 
MainLoop:
 ClrDatTyp()
 LetFlag=0
 ProcFlag=0
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
 IF MacExFlag=0 THEN
	IF InpFilPtr=1 THEN
		INC BasicLineCtr
	ENDIF
	ReadSource()
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
	NexToken()
	IF TokenBuf<>"if" AND TokenBuf<>"else" AND TokenBuf<>"endif" THEN MainLoop
	IF TokenBuf="if" THEN IFDx
	IF TokenBuf="else" THEN ELSEDx
	GOTO ENDIFDx
 ENDIF
 IF LEN(SrcLine)=0 THEN MainLoop
 TempByte=LEFT$(SrcLine,1)
 IF TempByte="'" THEN
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
 IF TempByte="+" THEN' AT&T Assembler code
	OutBuf="__asm__ __volatile__("+CHR$($22)+MID$(SrcLine,2,LEN(SrcLine)-1)+CHR$($22)+");"
	GenCode
	GOTO MainLoop
 ENDIF
 IF TempByte="$" THEN
	' Process Directive
	Remark()
	GenCode
	INC SrcNdx
	NexToken()
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
 NexToken()
 SrcNdx=0
 IF NextByte<>":" THEN ProcStmt 
 
'ProcLabel
 StartFlag=$ff
 IF ParmFlag=$ff THEN
	UnBlkFcn()
	ErrMain
 ENDIF
 IF FcnVarFlg=$ff THEN
	FcnVarFlg=0
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
			FcnHeader="int "' was long
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
 	NexToken()' Eat the ':'
 ENDIF
 IF TokenBuf="(" THEN' &&&&&&&&&&&&
	ErrNo=ErrUDFcn
	GOTO MainLoop
 ENDIF
 IF TokenBuf="data" THEN
	SymTable(SymNdx).DataMod=DataBit
	GOTO S1'  DATA statement processing
