
* CDL Basic Copyright 1994,1995 Computer Design Lab
* All Rights Reserved

* Edition History
* 11-23-94 Initial release V.7 Edition 1
* 11-28-94 V.71 Edition 2
*          Fix VAL bug, add asmb, add BUFFER, improve error reporting
*          Fix odd word boundary problem with DATA/READ
* 12-04-94 V.73 Edition 3
*          Fix TAB bug, fix READ odd byte bug, fix misc bugs in
*          PB68.b and runsubs, add TAB function, use "USE" to
*          include runsubs, generate only those temps being used
*          Add "Edition" as reserved VAR
* 12-06-94 V.74 Edition 4
*          Fix StrTmp/TmpVec bug, fix macro label bug, add ADDR and
*          BASE statements
* 12-15-94 V.91 Edition 5
*          Fix previous StrTmp/TmpVec buf fix, add BUFADR, BUFSIZ
*          Add LNOT, LXOR, INC, DEC, put align after preamble
*          Implement Pointers, change name to CDL Basic (FileName=cb)
*          Change directory to CLDB
*          Fix autotab bug (first arg followed by "," in PRINT statement)
* 12-22-94 V.92 Edition 6
*          Fix INC,DEC,INDEX of string pointers
*          Fix #USE with "/"s in filename
*          Add -?,-a,-b,-m,-e
*          Add XferCount
*          Add machine type and program size determination to branches
*          and lea (constant) and GOTO and GOSUB and ON ERROR
* 01-08-95 V.93 Edition 7
*          Add Floating Point Math, DECIMALS statement
*          Fix RESTORE bug involving "non-big" case
*          Add AQR, INT, IVAL, FVAL, ABS, -s
*          Add SIN, COS, TAN, ASN, ACS, ATN, LOG, LOG10
*          Add JTIM, JDAT, THOUR, TMIN, TSEC, TYEAR, TMON, TDAT, TDAY
* 01-25-95 V.94 Edition 8
*          Add -d, -f, -r, -v, -g
*          Add #ROF, #LIB, fix FOR loops for BYTE, SHORT
*          Add FRETURN, #PROCEDURE, #FCN, GETARGS
* 02-09-95 V1.0 Edition 9
*          Add #STRUCT, ENDSTRUCT, Print Boolean, Input Boolean
*          Fix misc bugs
* 02-20-95 V1.1 Edition 10
*          Add local functions
*          Allow functions to work without dummy target
*          Fix odd-sized structure problem
*          Fix SIZE function for complex arrays
* 03-09-95 V1.11 Edition 11
*          Fix Expr for "*" or"/" following grouping paren
* 03-21-95 V1.12 Edition 12
*          Fix lower-case-only problem for User Functions
*          Fix local function problem of calling after function appears
*          Change symbol size from 9 to 28 characters
*          Fix FOR/NEXT/GOSUB problem
* 03-22-95 V1.13 Edition 13
*          Fix "^" problem with error reorting
*          Fix symbol table dump
* 03-23-95 V1.14 Edition 14
*          Optimize FOR/NEXT
*          Optimize expression code generation
* 03-26-95 V1.15 Edition 15
*          Re-Do Loop/Count
*          Add register variables
* 03-27-95 Add Indirect GOTO and GOSUB
*          Allow setting/testing of MACROs same as COMVARs
* 03-30-95 Add ModAddr
* 03-31-95 Allow spaces and special chars as MACRO ARGs
*          Increase MACRO argument size to 100
*          Fix #STRUCT size bug
*          Fix bug in MACRO error reporting
*          Put MACROS in ".a" file as comment when invoked
*          Inhibit LineCtr increment when invoking MACROs and USE files
*          Fix TokenType "_" problem
* 04-05-95 Add ENDEXIT statement and allow THEN after EXITIF
* 04-07-95 Add RUN statement
*          Allow := on LET statement
*          Allow FLOAT args to LEFT$, RIGHT$, and MID$
*          Allow array to array assignment (a=b) where a & b are arrays
*          Add PARAM statement and Procedure Mode
*          Add -p and -c options
* 04-11-95 V1.16 Edition 16
*          Change FLOAT from single to double precision
*          Remove -c option (no longer needed due to double precision
*          Allow FLOAT arg to TAB()
*          Allow FLOAT arg to SEEK
*          Add VECTOR data modifier
*          Add SETVEC statement
* 04-29-95 V1.17 Edition 17
*          Change runsubs from "use" to "link"
*          Fix LEFT$, RIGHT$, MID$, concat for VECTOR and PARAM
*          Add LONG variable "_DummyArg"
*          Make string vectors with auto-setting for all but FcnMode
* 05-01-95 V1.18 Edition 18
*          Add GOTOQ and GOSUBQ MACROS
*          Remove jmp Start code section for FcnMode
*          Fix pointer ds size problem
*          Add GLOBAL qualifier for auto-vector strings
*          Make OutCode external function
*          Change lea TokenBuf to move.l TokenBuf before _AtoD in 
*          GetExp and READ (data) because TokenBuf is now a VECTOR
* 05-02-95 Add DIGITS statement
* 05-06-95 V1.19 Edition 19
*          Add BITCLR, BITCHG, BITSET, BITTST()
*          Add BITCLR(), BITCHG(), BITSET(), SHL(), SHR(), ROL()< ROR()
*          Add TestOpen
* 05-24-95 V1.20 Edition 20
*          Add auto load for procedures
*          Add unlink for procedures
*          Allow string var for procedure name on RUN statement
*          Add SUBSTR() function
*          Add ZHEX$() and ZSTR$() functions
*          Change runsubs to library file (proglib.l)
*          Reserve 4K storage for function temps
* 05-28-95 V1.21 Edition 21
*          Add PRINT USING
* 05-30-95 V1.22 Edition 22
*          Add -c and -u options
*          Fix END statement for procedures and functions
*          Add C environment
*          Change psects to named fields instead of numeric values
*          Change NextArg stuff to use a4 instead of a5
*          Add #FCN(c) for variable number of args
* 06-06-95 V1.23 Edition 23
*          Add -z option
*          Add return data type specifiers to #FCN directive
*          Overhaul function stuff including GETARGS
*          Add \x string constants
*          Remove GETARGS statement
* 06-08-95 Fix bug concerning dup symbol err on local fcns
*          Fix bug in SHELL caused by aborted CHAIN cmd
*          Pass Target in d7 for MID$
*          Pass _BufSize in d1 for _PrintStr
*          Change LOOP/COUNT to longword operation
*          Add EXCHANGE statement, fix bugs in LET
* 06-14-95 V1.24 Edition 24
*          Fix SHELL to work with concatenated strings
*          Fix bug in FOR which clobbered the symbol table
*          Fix VarBytes total when changing _Bufsize
* 06-17-95 V1.25 Edition 25
*          Fix problem with arrays over 65535 in BldOffSet
* 06-25-96 V1.26 Edition 26
*          Allow comments within structure defnitions
*          Change string comparisons to unsigned
*          Add stdin, stdout, stderr to C environment
* 06-26-95 V1.27 Edition 27
*          Allow assignment of LABEL to LONG in LET statement
*          Add fcn ptr capability incl ext and gbl fcn ptr
*          Allow assignment of FCN to FCNPTR in LET statement
* 06-30-95 V1.28 Edition 28
*          Add & and | operators
*          Add &, |, <<, and >> operations to #SET directive
*          Allow variable or constant for bit and shift args
* 07-04-95 V2.0 Edition 29
*          Fix _NullStr bug (change symbol table DataMod from 4 to 0)
*          Add cdllib.l to ROFList
*          Release 2.0 version to public
* 07-06-95 V2.0 Edition 30 special bug fix.. keep same version #
*          Bug fix concerning ADDR(a$) in BUFRWx statement

#SET Edition=30

#LIB -l=lib/cbf.l

* MACROS

#MACRO GenCode
 bsr OutCode
#ENDM

#MACRO GOTOQ
 bra ~1
#ENDM

#MACRO GOSUBQ
 bsr ~1
#ENDM

#MACRO GenJsr
 JsrTarget="~1"
 GOSUB BuildJsr
#ENDM

#MACRO ErrRet
 tst.l ErrNo(a6)
 beq.s ER~0
 rts
ER~0
#ENDM

#MACRO ErrMain
 tst.l ErrNo(a6)
 beq.s EM~0
 move.l #MainLoop-*-8,a2
 jmp (pc,a2.l)
EM~0
#ENDM


#SET ErrUDSym=1
#SET ErrIVSNam=2
#SET ErrTypMis=3
#SET ErrIVExp=4
#SET ErrSyntax=5
#SET ErrDupSym=6
#SET ErrSymFul=7
#SET ErrUnDef1=8
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
#SET ErrUnDef3=21
#SET ErrIVParm=22
#SET ErrUnDef4=23
#SET ErrCpxExp=24
#SET ErrIVFunc=25
#SET ErrTmpUse=26
#SET ErrParen=27
#SET ErrFcn=28
#SET ErrIVTarg=29
#SET ErrRegUse=30

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
#SET VOID=13
#SET COMPLEX=14
#SET BUFFER=15

#SET ArrayBit=$01
#SET AddrBit=$02
#SET ConstBit=$04
#SET RemoteBit=$08
#SET MemberBit=$10
#SET VectorBit=$20
#SET TempBit=$40
#SET RegBit=$80
#SET TmpVec=$60
#SET ArrayMsk=$fe

#SET NULLClass=0
#SET INTClass=1
#SET STRClass=2
#SET ARRClass=3
#SET CPXClass=4
#SET FLTClass=5
#SET BOOLClass=6

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

* REM 0=std, 1=lite, 2=demo
#SET CType=0
#IF CType=0
#SET SymTabSiz=2800
#ENDIF
#IF CType=1
#SET SymTabSiz=973
#ENDIF
#IF CType=2
#SET SymTabSiz=280
#ENDIF
#SET _BufSize=300
#SET MacBufSiz=20000
#SET ExpTabSiz=100
#SET UserSym=131

 DIM XBufSize:LONG
 DIM LibOut:String[100]
 DIM B:STRING[10]
 DIM Escape:BYTE
 DIM BufRWFlg:BYTE
 DIM Fmt:STRING[67]
 DIM CEnviron:BYTE
 DIM UDump:BYTE
 DIM PseudoFcn:BYTE
 DIM StringNum:LONG
 DIM VectorFlg:BYTE
 DIM ParmCtr:BYTE
 DIM ParmFlag:BYTE
 DIM ProcName:STRING[28]
 DIM DtaRegNum:BYTE
 DIM AliasFlg:BYTE
 DIM _HoldBuf:STRING[_BufSize]
 DIM HoldBuf:STRING[_BufSize] VECTOR GLOBAL
 DIM _HoldVar:STRING[28]
 DIM HoldVar:STRING[28] VECTOR GLOBAL
 DIM HoldFlag:BYTE GLOBAL
 DIM _HoldReg:STRING[2]
 DIM HoldReg:STRING[2] VECTOR GLOBAL
 DIM StoreFlag:BYTE GLOBAL
 DIM LoadFlag:BYTE GLOBAL
 DIM LoopVars(40):STRING[28]
 DIM LopVarNdx:LONG
 DIM ProcFlag:BYTE
 DIM UsrFcnNam:STRING[28]
 DIM StackAdj:BYTE
 DIM NumArgs:BYTE
 DIM ParamCnt:BYTE
 DIM l68Opt:STRING[100]
 DIM ROFList:STRING[100]
 DIM LibList:STRING[100]
 DIM ProgMode:BYTE
 DIM DrvrMode:BYTE
 DIM FcnMode:BYTE
 DIM ZeroMode:BYTE
 DIM ProcMode:BYTE
 DIM ROMMode:BYTE
 DIM MathCall:STRING[14]
 DIM VarReport:BYTE
 DIM DumpSyms:BYTE
 DIM FloatOK:BYTE
 DIM OneDot:BYTE
 DIM LstExp:LONG
 DIM JsrTarget:STRING[28]
 DIM NoGen:BYTE
 DIM AsmbFlag:BYTE
 DIM OptNdx:LONG
 DIM Opt:STRING[1]
 DIM ProgSize:BYTE\ 0=small (<32k), 1=large (>32k)
 DIM Machine:BYTE\ 0=68000, 1=68010, 2=68020, 3=68030
 DIM CondValid:BYTE
 DIM CondOp1:LONG
 DIM CondOp2:LONG
 DIM GenFlag(20):BYTE
 DIM GFNdx:LONG
 DIM AddInst:STRING[5]
 DIM DecFlag:BYTE
 DIM VarSize:LONG
 DIM SetMask:BYTE
 DIM CmdFlag:BYTE
 DIM ArrayBase:BYTE
 DIM TmpMax:BYTE
 DIM TmpVecMax:BYTE
 DIM LopVecMax:BYTE
 DIM StrTmpMax:BYTE
 DIM PrintFlag:BYTE
 DIM TabFlag:BYTE
 DIM DevFlag:BYTE
 DIM LastStmt:STRING[8]
 DIM DimStrFlg:BYTE
 DIM FcnCode:BYTE
 DIM ByteSize:BYTE
 DIM WordSize:BYTE
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
 DIM _Reg1Name:STRING[2]
 DIM Reg1Name:STRING[2] VECTOR GLOBAL
 DIM Reg2Name:STRING[2]
 DIM DataWidth:STRING[3]
 DIM DWSafe:STRING[3]
 DIM D0Loaded:BYTE
 DIM D1Loaded:BYTE
 DIM D0Float:BYTE
 DIM D1Float:BYTE
 DIM Target:BYTE
 DIM TmpUse:LONG
 DIM TmpVecUse:LONG
 DIM Op1Class:BYTE
 DIM Operator:BYTE
 DIM Op2Class:BYTE
 DIM OpClass:BYTE
 DIM Op1Type:BYTE
 DIM Op1Mod:BYTE
 DIM Op1Detail:LONG
 DIM Op2Type:BYTE
 DIM Op2Mod:BYTE
 DIM Op2Detail:LONG
 DIM Op1Name:STRING[28]
 DIM Op2Name:STRING[28]
 DIM Op1DataSize:LONG
 DIM Op2DataSize:LONG
 DIM LNFlag:BYTE
 DIM VarName:STRING[29]
 DIM BufName:STRING[29]
 DIM AccMode:BYTE
 DIM PathVar:STRING[29]
 DIM PathType:BYTE
 DIM PathName:STRING[29]
 DIM ToSubFlag:BYTE
 DIM DigDec:BYTE ALIAS=ToSubFlag
 DIM BitType:BYTE ALIAS=ToSubFlag
 DIM TstOpnFlg:BYTE ALIAS=ToSubFlag
 DIM FcnType:BYTE ALIAS=ToSubFlag
 DIM FcnPtrFlg:BYTE
 DIM JmpArgs:LONG
 DIM LabelNum:LONG
 DIM TableNum:LONG
 TYPE ConStruct=TermLabel:LONG;LoopName:STRING[28];ConType:BYTE;ConLine:LONG;LoopVec:LONG; LoopLabel:LONG;ForVarSiz:STRING[1];NoStep:BYTE;RemoteVar:BYTE;ImmTo:BYTE;ImmVal:STRING[9];RegVar:BYTE
 DIM CS(40):ConStruct
 DIM CSP:LONG
 DIM InpFile(20):BYTE
 DIM InpFilPtr:LONG
 DIM OutFile:BYTE GLOBAL
 DIM InitFile:BYTE
 DIM PoolFile:BYTE
 DIM RawData:STRING[1]
 DIM TempStr:STRING[_BufSize]
 DIM TempInt:LONG
 DIM TempByte:STRING[1]
 DIM ErrNo:LONG
 DIM NextByte:STRING[1]
 DIM AsciiByte:BYTE
 DIM Konstant:LONG
 DIM KSafe:LONG
 DIM HexString:STRING[9]
 DIM HiFltStr:STRING[9]
 DIM LoFltStr:STRING[9]
 DIM FloatName:STRING[28]
 DIM StringCnt:LONG
 DIM StringLen:LONG
 DIM LoopNum:LONG
 TYPE Symbol=SymName:STRING[28];DataType:BYTE;DataMod:BYTE;Detail:LONG;DataAddr:LONG;DataSize:LONG
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
 DIM MacArgBuf(10):STRING[100]
 DIM MacArgPtr:LONG
 DIM MaxArgNum:BYTE
 DIM PoolBuf:STRING[_BufSize]
 DIM PoolCtr:LONG
 DIM SymNdx:LONG
 DIM SymNdxSaf:LONG
 DIM SymType:STRING[6]
 DIM ArraySize:LONG
 DIM ForNdx:LONG
 DIM DataTemp:BYTE
 DIM TSymName:STRING[28]
 DIM TDataType:BYTE
 DIM TDataMod:BYTE
 DIM TDetail:LONG
 DIM VDetail:LONG
 DIM TDataAddr:LONG
 DIM TDataSize:LONG
 DIM ExpTable(ExpTabSiz):LONG
 DIM TypePtr:LONG
 DIM TypeFlag:BYTE
 DIM LastEntry:Symbol
 DIM SymTemp:Symbol GLOBAL
 DIM SrcLine:STRING[_BufSize]
 DIM SrcLineCpy:STRING[_BufSize]
 DIM _OutBuf:STRING[_BufSize]
 DIM OutBuf:STRING[_BufSize] VECTOR GLOBAL
 DIM TokenBuf:STRING[_BufSize]
 DIM ExpEnd:BYTE
 DIM TokenLen:BYTE
 DIM ExpLen:BYTE
 DIM LastGroup:BYTE
 DIM TokenType:BYTE
 DIM TokenSaf:STRING[_BufSize]
 DIM RootSym:STRING[29]
 DIM Subscript:STRING[100]
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
 DIM LineCtr:LONG
 DIM QuoteFlg:BYTE
 DIM ParenStk(100):BYTE
 DIM ParenCnt:BYTE
 DIM FcnCtr:BYTE
 DIM LevelCnt:BYTE
 DIM SymFull:BYTE
 DIM SymFound:BYTE
 DIM ErrCnt:BYTE
 DIM VarBytRem:LONG
 DIM VarBytes:LONG
 DIM TypeBytes:LONG
 DIM TypeVars:LONG
 DIM LabelFlag:BYTE
 
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
 
 DIM DMReg:BYTE
 DIM DMTemp:BYTE
 DIM DMVector:BYTE
 DIM DMMember:BYTE
 DIM DMRemote:BYTE
 DIM DMConst:BYTE
 DIM DMAddr:BYTE
 DIM DMArray:BYTE
 
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
 
Start
 PRINT
 PRINT "CDL Basic Version 2.0"
 PRINT "Copyright 1994, 1995 Computer Design Lab"
 PRINT "All Rights Reserved"
#IF CType=1
 PRINT "Lite Version"
#ENDIF
#IF CType=2
 PRINT "Modification EXPRESSLY PROHIBITED"
 PRINT "FOR DEMONSTRATION purposes ONLY!"
#ENDIF
 PRINT
 FileName=""
 FileName=NextArg
 IF LEN(FileName)=0 THEN
    PRINT "No input file"
    END
 ENDIF
 IF FileName="-?" THEN Help
 IF RIGHT$(FileName,2)<>".b" THEN
    PRINT "no recognized suffix"
    END
 ENDIF
 ON ERROR GOTO NoInpFile
 InpFilPtr=1
 OPEN #InpFile(InpFilPtr),FileName:READ
 FileName=LEFT$(FileName,LEN(FileName)-2)
 ON ERROR GOTO NoOutFile
 DELETE FileName+".a"
NoOutFile
 CREATE #OutFile,FileName+".a":WRITE
 ON ERROR GOTO NoPoolFil
 DELETE "_PoolFile"
NoPoolFil
 CREATE #PoolFile,"_PoolFile":WRITE
 ON ERROR GOTO NoInitFil
 DELETE "_InitFile"
NoInitFil
 CREATE #InitFile,"_InitFile":WRITE
 ON ERROR
 ROFList="RELS/"+FileName+".r"
 LibList=""
 LibOut=" -o="+FileName
 l68Opt=""
 GFNdx=1
 GenFlag(GFNdx)=$ff
 SETVEC OutBuf=ADDR(_OutBuf)
 SETVEC HoldVar=ADDR(_HoldVar)
 SETVEC HoldReg=ADDR(_HoldReg)
 SETVEC HoldBuf=ADDR(_HoldBuf)
 SETVEC Reg1Name=ADDR(_Reg1Name)
 OutBuf="_BufSize set "+STR$(_BufSize)
 GenCode
 XBufSize=_BufSize
 NoGen=0\ default
 UDump=0\ default
 CEnviron=0\ default
 AsmbFlag=0\ default
 Machine=0\ default to 68000
 ProgSize=0\ default to <32k
 DumpSyms=0\ default
 ProgMode=$ff\ default
 DrvrMode=0\ default
 ProcMode=0\ default
 FcnMode=0\ default
 ZeroMode=0\ default
 ROMMode=0\ default
 VarReport=0\ report
 ArrayBase=1\ default to base 1
 DtaRegNum=0
 HoldFlag=0
 StoreFlag=0
 LoadFlag=0
 HoldVar=""
 TmpMax=0
 TmpVecMax=0
 LopVecMax=0
 StrTmpMax=0
 ErrCnt=0
 LastStmt=""
 CSP=0
 LopVarNdx=0
 StringNum=0
 LabelNum=0
 TableNum=0
 LoopNum=0
 MacExFlag=0
 ParmCtr=0
 LineCtr=0
 ErrNo=0
 PoolCtr=0
 VarBytes=0
 VarBytRem=0

 FOR LopVarNdx=1 to 40
    LoopVars(LopVarNdx)="%"
 NEXT LopVarNdx
 
 FOR SymNdx=1 TO SymTabSiz
    SymTable(SymNdx).SymName="%"
    SymTable(SymNdx).DataType=COMPVAR
    SymTable(SymNdx).DataMod=0
    SymTable(SymNdx).Detail=0
    SymTable(SymNdx).DataAddr=0
    SymTable(SymNdx).DataSize=0
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
 SymTable(SymNdx)=SymTemp
 GOTOQ InitSym
 
Preamble
 GOSUB CmdLine
 IF ROMMode=0 THEN
    OutBuf=" use /dd/defs/oskdefs.d"
    GenCode
 ENDIF
 IF ProgMode+FcnMode+DrvrMode+ROMMode+ProcMode+ZeroMode<>$ff THEN
    PRINT "Invalid mode combination"
    END
 ENDIF
 IF DrvrMode=$ff OR ROMMode=$ff THEN
    MathCall=" bsr _"
    LibList=LibList+" -l=/dd/LIB/math.l "
 ELSE
    MathCall=" tcall T$Math,"
 ENDIF
 IF FcnMode+ZeroMode=0 THEN
    OutBuf="_Init"
    WRITE #InitFile,OutBuf
    OutBuf="Edition set 0"
    GenCode
    OutBuf=" vsect"
    GenCode
    OutBuf="_IOBuffer: ds.b _BufSize"
    GenCode
    OutBuf="_PrintBuf: ds.b _BufSize"
    GenCode
    OutBuf=" ends"
    GenCode
    VarBytes=VarBytes+2*_BufSize
    OutBuf=" align"
    GenCode
    OutBuf="_Start"
    GenCode
    IF ROMMode=0 AND ProcMode=0 THEN
        OutBuf=" move.l a3,ModAddr(a6)"
        GenCode
        IF CEnviron=$ff AND FcnMode=0 THEN
            LibList=LibList+" -l=/dd/LIB/clib.l -l=/dd/LIB/cio.l "
            REM "cstart" stuff follows
            GenJsr _BCStart
        ELSE
            OutBuf=" move.l a5,a4"
            GenCode
        ENDIF
    ENDIF
    IF ProcMode=$ff THEN
        OutBuf=" move.l a2,ModAddr(a6)"
        GenCode
        OutBuf=" move.l d1,_Parm1Addr(a6)"
        GenCode
        OutBuf=" move.l d0,_ParmCnt(a6)"
        GenCode
        OutBuf=" move.l a7,a0"
        GenCode
        OutBuf=" addq.l #4,a0"
        GenCode
        OutBuf=" move.l (a0),_Parm1Size(a6)"
        GenCode
        OutBuf=" addq.l #4,a0"
        GenCode
        OutBuf=" move.l a0,_PrmAdrPtr(a6)"
        GenCode
    ENDIF
    IF ProgSize=$ff THEN
        OutBuf=" move.l #_ERRExit-*-8,a2"
        GenCode
        OutBuf=" lea (pc,a2.l),a2"
    ELSE
        OutBuf=" lea _ERRExit(pc),a2"
    ENDIF
    GenCode
    OutBuf=" move.l a2,_ERRVec(a6)"
    GenCode
    IF ProgMode=$ff THEN
        OutBuf=" suba a5,a5"
        GenCode
    ENDIF
    OutBuf=" link a5,#0"
    GenCode
    OutBuf=" move.l a7,_StkSafe(a6)"
    GenCode
    OutBuf=" clr.l ERR(a6)"
    GenCode
    OutBuf=" move.w #15,_Digits(a6)"
    GenCode
    OutBuf=" move.w #2,_Decimals(a6)"
    GenCode
    OutBuf=" clr.l XferCount(a6)"
    GenCode
    IF ProgMode=$ff THEN
        OutBuf=" move.w #15,d0"
        GenCode
        OutBuf=" clr.l d1"
        GenCode
        OutBuf=" lea _TrapName(pc),a0"
        GenCode
        OutBuf=" os9 F$TLink"
        GenCode
    ENDIF
    OutBuf=" clr.l POS(a6)"
    GenCode
    TempInt=22
    SymTemp.SymName="_CBufVec"
    OutBuf=" lea _ConvBuf(a6),a0"
    GenCode
    GOSUB 6536
    SymTemp.SymName="_CBuf1Vec"
    OutBuf=" lea _ConvBuf1(a6),a0"
    GenCode
    GOSUB 6536
    TempInt=_BufSize
    SymTemp.SymName="_PBufVec"
    OutBuf=" lea _PrintBuf(a6),a0"
    GenCode
    GOSUB 6536
    SymTemp.SymName="_IOBufVec"
    OutBuf=" lea _IOBuffer(a6),a0"
    GenCode
    GOSUB 6536
    OutBuf=" clr.b _NullStr(a6)"
    GenCode
    OutBuf=" move.l #_Init-*-8,a3"
    GenCode
    OutBuf=" jmp (pc,a3.l)"
    GenCode
    OutBuf="_TrapName dc.b "+CHR$($22)+CHR$($4d)+CHR$($61)+CHR$($74)+CHR$($68)+CHR$($22)+",0"
    GenCode
    OutBuf="_Prompt dc.b "+CHR$($22)+CHR$($3f)+CHR$($22)+",0"
    GenCode
    OutBuf="_Shell dc.b "+CHR$($22)+CHR$($73)+CHR$($68)+CHR$($65)+CHR$($6c)+CHR$($6c)+CHR$($22)+",0"
    GenCode
    IF CEnviron=$ff THEN
        OutBuf="NullEnv: dc.l 0"
        GenCode
    ENDIF
    OutBuf=" align"
    GenCode
    VarBytes=VarBytes+4750\accounts for 15 possible temps in total
 ENDIF
 IF FcnMode+ZeroMode=$ff THEN
    OutBuf=" psect "+FileName+",0,0,0,0,0"
    GenCode
 ENDIF
 DIM _IOBuffer:LONG EXTERNAL
 DIM _PrintBuf:LONG EXTERNAL
 DIM _ERRVec:LONG EXTERNAL
 DIM _Digits:SHORT EXTERNAL
 DIM _Decimals:SHORT EXTERNAL
 DIM _StkSafe:LONG EXTERNAL
 DIM _ArgSafe0:LONG EXTERNAL
 DIM _ArgSafe1:LONG EXTERNAL
 DIM _IOPthNum:SHORT EXTERNAL
 DIM _SafeZone:SHORT EXTERNAL
 DIM _IOBufPtr:LONG EXTERNAL
 DIM _IOBufVec:LONG EXTERNAL
 DIM _PBufVec:LONG EXTERNAL
 DIM _DataPtr:LONG EXTERNAL
 DIM _True:BYTE EXTERNAL
 DIM _FileIO:BYTE EXTERNAL
 DIM _ConvBuf:STRING[12] EXTERNAL
 DIM _CBufVec:LONG EXTERNAL
 DIM _ConvBuf1:STRING[12] EXTERNAL
 DIM _CBuf1Vec:LONG EXTERNAL
 
MainLoop
 IF CmdFlag=$ff THEN
    RETURN
 ENDIF
 GOSUB ClrDatTyp
 PseudoFcn=0
 ProcFlag=0
 Target=0
 PrintFlag=0
 TabFlag=0
 DimStrFlg=0
 DevFlag=0
 ByteSize=0
 WordSize=0
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
 DimFlag=$00
 TypeFlag=$00
 ParmFlag=0
 TDataMod=0
 IF ErrNo<>0 THEN
    IF ErrNo=ErrMacArg THEN
        PRINT "Fatal Error... MACRO argument error in line ";LineCtr
        END
    ENDIF
    PRINT SrcLine
    OutBuf=""
    IF SrcNdx<1 then
        SrcNdx=1
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
    PRINT TempStr;" in line ";LineCtr
    IF ErrNo=ErrSymFul THEN
        PRINT "Fatal Error... Symbol Table Full"
        END
    ENDIF
    INC ErrCnt
    ErrNo=0
 ENDIF
 SrcNdx=0
 SrcLine=""
 IF MacExFlag=0 THEN
    IF InpFilPtr=1 THEN
        INC LineCtr
    ENDIF
ReadSrc IF EOF(#InpFile(InpFilPtr)) THEN Finish
    GET #InpFile(InpFilPtr),RawData
    IF ASC(RawData)=$0d THEN ProcLine
    SrcLine=SrcLine+RawData
    GOTOQ ReadSrc
 ENDIF
 IF MacExFlag=$ff THEN\ MACRO in effect
lbl123 AsciiByte=MacBuf(MacExNdx)
    INC MacExNdx
    IF AsciiByte=0 THEN\ end of MACRO
        MacExFlag=0
        GOTOQ MainLoop
    ENDIF
    IF AsciiByte=$0d THEN ProcLine
    IF LAND($80,AsciiByte)=$80 THEN
        AsciiByte=LAND($7f,AsciiByte)
        IF AsciiByte=0 THEN
            SrcLine=SrcLine+STR$(SymTable(MacTblPtr).Detail)
            GOTOQ lbl123
        ENDIF
        IF AsciiByte>MaxArgNum THEN
            ErrNo=ErrMacArg
            GOTOQ MainLoop
        ENDIF
        MacArgPtr=AsciiByte
        SrcLine=SrcLine+MacArgBuf(MacArgPtr)
        GOTOQ lbl123
    ENDIF
    SrcLine=SrcLine+CHR$(AsciiByte)
    GOTOQ lbl123
 ENDIF
ProcLine
 SrcNdx=0
 IF GenFlag(GFNdx)=0 THEN
    INC SrcNdx
    GOSUB NexToken
    IF TokenBuf<>"if" AND TokenBuf<>"else" AND TokenBuf<>"endif" THEN MainLoop
    IF TokenBuf="if" THEN IFDx
    IF TokenBuf="else" THEN ELSEDx
    GOTO ENDIFDx
 ENDIF
 IF LEN(SrcLine)=0 THEN MainLoop
 IF MID$(SrcLine,1,1)="*" THEN
    KeyNdx=$ffff
    GOTOQ ProcStmt2
 ENDIF
 IF MID$(SrcLine,1,1)="#" THEN
    GOTOQ ProcDef
 ENDIF
 IF MID$(SrcLine,SrcNdx+1,1)<>" " AND MID$(SrcLine,SrcNdx+1,1)<>"   " THEN
    GOTOQ ProcLabel
 ENDIF
 GOTOQ ProcStmt
 
ProcDef
 IF AsmbFlag=$ff THEN
    OutBuf="* "+SrcLine
    GenCode
 ENDIF
 INC SrcNdx
 GOSUB NexToken
 GOSUB DirSearch
 IF KeyNdx=0 THEN
    ErrNo=ErrIVDir
    GOTOQ MainLoop
 ENDIF
 ON KeyNdx GOTO SETDx,MACRODx,ENDMDx,IFDx,ELSEDx,ENDIFDx,USEDx,FCNDx,FIXDx,ROFDx,LIBDx,STRUCTDx,ENDSTRUCTDx
 PRINT "FATAL ERROR: Directive lookup error"
 END
 
ProcLabel
 LNFlag=$ff
 GOSUB TokenSym
 ErrMain
 LabelFlag=$ff
 TDataType=SymTable(SymNdx).DataType
 TDetail=SymTable(SymNdx).Detail
 TDataSize=SymTable(SymNdx).DataSize
 IF SymFound<>0 THEN
    IF TDataType<>LABEL AND TDataType<>FCN THEN
        ErrNo=ErrDupSym
        GOTOQ MainLoop
    ENDIF
    IF TDataType=LABEL THEN
        IF TDetail=$ff THEN
            SymTable(SymNdx).Detail=0
        ELSE
            ErrNo=ErrDupSym
            GOTOQ MainLoop
        ENDIF
    ENDIF
    IF TDataType=FCN THEN
        IF TDataAddr=0 THEN
            SymTable(SymNdx).DataAddr=1
        ELSE
            ErrNo=ErrDupSym
            GOTOQ MainLoop
        ENDIF
    ENDIF
 ELSE
    GOSUB ClrDatTyp
    SymTemp.DataType=LABEL
    GOSUB ClrSym1
    SymTemp.DataMod=0
    GOSUB SymInsert
    ErrMain
 ENDIF
 IF NextByte=":" THEN
    GOSUB NexToken
    SymbolSaf=SymbolSaf+":"
 ENDIF
 GOSUB NexToken
 IF TokenBuf="external" THEN MainLoop
 IF TokenBuf="(" THEN GetArgs
 GOSUB UnDoToken
 
ProcStmt
 GOSUB NexToken
 LastStmt=TokenBuf
 IF TokenLen=0 THEN
    IF LabelFlag=$ff THEN
        OutBuf=SymbolSaf
        GenCode
    ENDIF
    GOTOQ MainLoop
 ENDIF
 GOSUB KeyLook
 IF KeyNdx=0 THEN
    REM maybe a macro
    SymTemp.SymName=TokenSaf
    GOSUB SymSrch
    IF SymFound=$ff AND SymTable(SymNdx).DataType=MACRO THEN
        IF AsmbFlag=$ff THEN
            OutBuf="* "+SrcLine
            GenCode
        ENDIF
        MacTblPtr=SymNdx
        MacExNdx=SymTable(SymNdx).DataAddr
        SymTable(SymNdx).Detail=SymTable(SymNdx).Detail+1
        NeedComma=0
        MaxArgNum=0
        MacExFlag=$ff
        IF LabelFlag=$ff THEN
            OutBuf=SymbolSaf
            GenCode
        ENDIF
        IF MID$(SrcLine,SrcNdx+1,1)=" " THEN
            INC SrcNdx
        ENDIF
MacExLoop GOSUB MacToken
        IF TokenLen=0 THEN
            GOTOQ MainLoop
        ENDIF
        IF NeedComma=0 AND TokenSaf="," THEN
            INC MaxArgNum
            MacArgBuf(MaxArgNum)=""
            GOTOQ MacExLoop
        ENDIF
        IF NeedComma=$ff AND TokenSaf<>"," THEN
            ErrNo=ErrSyntax
            GOTOQ MainLoop
        ENDIF
        IF NeedComma=$ff AND TokenSaf="," THEN
            NeedComma=0
            GOTOQ MacExLoop
        ENDIF
        INC MaxArgNum
        MacArgBuf(MaxArgNum)=TokenSaf
        NeedComma=$ff
        GOTOQ MacExLoop
    ENDIF
    IF SymFound=$ff AND SymTable(SymNdx).DataType=FCN AND SymTable(SymNdx).Detail>1000 THEN
        IF NextByte="(" THEN
            ProcFlag=$ff
        ELSE
            GOTO SetFcnPtr
        ENDIF
    ENDIF
    KeyNdx=8
    GOSUB UnDoToken
 ENDIF
ProcStmt2
 IF KeyNdx>56 THEN\ must be ASMB
    OutBuf=SrcLine
    GenCode
    GOTOQ MainLoop
 ENDIF
 IF AsmbFlag=$ff THEN
    OutBuf="* "+SrcLine
    GenCode
 ENDIF
 OutBuf=""
 IF LabelFlag=$ff THEN
    OutBuf=SymbolSaf
    GenCode
 ENDIF
 ON KeyNdx GOTO S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20,S21,S22,S23,S24,S25,S26,S27,S28,S29,S30,S31,S32,S33,S34,S35,S36,S37,S38,S39,S40,S41,S42,S43,S44,S45,S46,S47,S48,S49,S50,S51,S52,S53,S54,S55,S56
 PRINT "FATAL ERROR KeyWord LookUp Error"
 END

SetLink
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
 IF AsciiByte=$22 THEN
    IF QuoteFlg=0 AND TokenLen<>0 THEN NexToken5
    GOSUB NexToken3
    IF QuoteFlg=1 THEN
        TokenType=TTypQuote
        GOTOQ NexToken6
    ELSE
        QuoteFlg=1
        GOTOQ NexToken1
    ENDIF
 ENDIF
 IF QuoteFlg=1 THEN
    GOSUB NexToken3
    GOTOQ NexToken1
 ENDIF
 IF TempByte="." THEN
    IF TokenType=TTypInt THEN
        TokenType=TTypFloat
        GOSUB NexToken3
        GOTOQ NexToken1
    ENDIF
    IF TokenLen=0 THEN
        IF NextByte>="0" AND NextByte<="9" THEN
            TokenType=TTypFloat
            GOSUB NexToken3
            GOTOQ NexToken1
        ENDIF
    ENDIF
 ENDIF
 IF TempByte=CHR$($5c) THEN NexToken5
 IF TempByte="<" OR TempByte=">" OR TempByte="=" THEN
    IF TokenLen<>0 THEN NexToken5
    TokenType=TTypRelOp
    GOSUB NexToken3
    IF TempByte="=" THEN
        GOTOQ NexToken6
    ENDIF
    IF NextByte=">" OR NextByte="=" THEN
        INC SrcNdx
        TempByte=MID$(SrcLine,SrcNdx,1)
        GOSUB NexToken3
    ENDIF
    GOTOQ NexToken6
 ENDIF
 IF AsciiByte=$20 OR AsciiByte=$09 THEN
    IF TokenLen<>0 THEN
        DEC SrcNdx
        NextByte=" "
        ExpEnd=$ff
        RETURN
    ENDIF
    GOTOQ NexToken1
 ENDIF
 IF DimFlag=0 THEN
    IF TempByte="(" OR TempByte=")" THEN
        IF TokenLen<>0 THEN NexToken5
        GOSUB NexToken3
        TokenType=TTypParen
        GOTOQ NexToken6
    ENDIF
 ENDIF
 IF TempByte="," OR TempByte=";" OR TempByte=":" OR TempByte="." THEN
    IF TokenLen<>0 THEN NexToken5
    GOSUB NexToken3
    TokenType=TTypPunct
    GOTOQ NexToken6
 ENDIF
 IF TempByte="+" OR TempByte="-" OR TempByte="*" OR TempByte="/"  OR TempByte="&" OR TempByte="|" THEN
    IF TokenLen<>0 THEN NexToken5
    GOSUB NexToken3
    TokenType=TTypMath
    GOTOQ NexToken6
 ENDIF
 IF DimFlag=$ff THEN NexToken2
 IF TempByte="$" OR TempByte="_" OR TempByte="@" THEN NexToken2
 IF TempByte>="0" AND TempByte<="9" THEN NexToken2
 IF TempByte>="A" AND TempByte<="Z" THEN NexToken2
 IF TempByte>="a" AND TempByte<="z" THEN NexToken2
 IF TokenLen<>0 THEN NexToken5
 GOSUB NexToken3
 TokenType=TTypMisc
 GOTOQ NexToken6
NexToken2 GOSUB NexToken3
 GOTOQ NexToken1
NexToken3 INC TokenLen
 TokenSaf=TokenSaf+TempByte
 IF TempByte<"A" OR TempByte>"Z" THEN NexToken4
 AsciiByte=LOR(AsciiByte,$20)
 TempByte=CHR$(AsciiByte)
NexToken4 TokenBuf=TokenBuf+TempByte
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
NexToken5 DEC SrcNdx
 NextByte=MID$(SrcLine,SrcNdx+1,1)
NexToken6 IF NextByte=" " OR ASC(NextByte)=9 OR NextByte=":" OR NextByte=";" OR NextByte=CHR$($5c) THEN
    ExpEnd=$ff
 ENDIF
 IF NextByte="<" OR NextByte=">" OR NextByte="=" OR NextByte="" THEN
    ExpEnd=$ff
 ENDIF
 RETURN

UnDoToken
 SrcNdx=SrcNdx-LEN(TokenBuf)
 NextByte=""
 RETURN

MacToken
 TokenLen=0
 TokenSaf=""
MacToken1
 INC SrcNdx
 TempByte=MID$(SrcLine,SrcNdx,1)
 AsciiByte=ASC(TempByte)
 IF AsciiByte=$0d OR AsciiByte=0 THEN
    DEC SrcNdx
    RETURN
 ENDIF
 IF AsciiByte=$2c THEN\ comma
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
 GOTOQ MacToken1
 
ValidSym SymbolOK=0
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
 GOTOQ lbl5102
5110 LabNdx=1
 TempByte=MID$(RootSym,1,1)
 IF TempByte>="A" AND TempByte<="Z" THEN 5112
 IF TempByte>="a" AND TempByte<="z" THEN 5112
 IF TempByte="_" THEN 5112
 RETURN
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
 IF TempByte="@" THEN 5112
 IF TempByte="$" THEN 5112
 RETURN
 
ValidInt IntOK=0
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
 
ValidHex HexOK=0
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
        GOTOQ ValidFlt1
    ENDIF
 ENDIF
 RETURN
 
SymSrch
 SymFull=0
 SymFound=0
 SymNdx=0
5202 INC SymNdx
 IF SymNdx>SymTabSiz THEN
    SymFull=$ff
    RETURN
 ENDIF
 IF SymTable(SymNdx).SymName="%" THEN
    RETURN
 ENDIF
 IF SymTable(SymNdx).SymName<>SymTemp.SymName THEN 5202
 SymFound=$ff
 RETURN

SymSearch
 GOSUB SymSrch
 IF SymFound=$ff THEN
    RETURN
 ENDIF
 SymTemp.SymName=TokenSaf
 GOSUB SymSrch
 RETURN
 
SymInsert
 IF SymFull=$ff THEN
    ErrNo=ErrSymFul
    RETURN
 ENDIF
 SymTable(SymNdx)=SymTemp
 RETURN
 
KeyLook
 KeyNdx=0
 RESTORE KeyTable
KeyLook1
 READ KeyWord
 INC KeyNdx
 IF KeyWord="%" THEN
    KeyNdx=0
    RETURN
 ENDIF
 IF KeyWord=TokenBuf THEN
    RETURN
 ENDIF
 GOTOQ KeyLook1
 
DirSearch
 KeyNdx=0
 RESTORE DefineTbl
DirSrch1
 READ KeyWord
 INC KeyNdx
 IF KeyWord="%" THEN
    KeyNdx=0
    RETURN
 ENDIF
 IF KeyWord=TokenBuf THEN
    RETURN
 ENDIF
 GOTOQ DirSrch1
 
GenPrec
 OutBuf=" move.l #$3e7ad7f2,d2"
 GenCode
 OutBuf=" move.l #$9abcaf4a,d3"
 GenCode
 RETURN

BuildJsr
 IF ProgSize=$ff THEN
    IF Machine<2 THEN\ 68000 or 68010
        OutBuf=" move.l #"+JsrTarget+"-*-8,a2"
        GenCode
        OutBuf=" jsr (pc,a2.l)"
    ELSE
        OutBuf=" bsr.l "+JsrTarget
    ENDIF
 ELSE
    OutBuf=" bsr "+JsrTarget
 ENDIF
 GenCode
 RETURN
 
AlignData
 OutBuf=" move.l a2,d0"
 GenCode
 OutBuf=" and.l #1,d0"
 GenCode
 OutBuf=" adda.l d0,a2"
 GenCode
 RETURN
 
CmpOps
 Op1Class=0
 AndOrFlag=$ff
 CompFlag=$ff
 OutBuf=" sf _True(a6)"
 GenCode
lbl5610 Promote=0
 ByteSize=0
 WordSize=0
 Demote=0
 TmpUse=0
 TmpVecUse=0
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
            SymType="seq"
        ELSE
            SymType="sne"
        ENDIF
        IF TokenBuf<>"=" AND TokenBuf<>"<>" THEN
            ErrNo=ErrIVExp
            RETURN
        ENDIF
        GOTOQ lbl5615
    ELSE
        Op2Name="true"
        Op2Class=BOOLClass
        Op2Type=1
        Op2Mod=$04
        Op2Detail=$ff
        SymType="seq"
        GOTOQ lbl5620
    ENDIF
 ENDIF
 GOSUB NexToken
 IF TokenType<>1 THEN
    ErrNo=ErrIVExp
    RETURN
 ENDIF
 SymType=""
 IF TokenBuf="=" THEN
    SymType="seq"
 ENDIF
 IF TokenBuf="<" THEN
    IF Op1Class<>STRClass THEN
        SymType="slt"
    ELSE
        SymType="scs"
    ENDIF
 ENDIF
 IF TokenBuf=">" THEN
    IF Op1Class<>STRClass THEN
        SymType="sgt"
    ELSE
        SymType="shi"
    ENDIF
 ENDIF
 IF TokenBuf="<=" THEN
    IF Op1Class<>STRClass THEN
        SymType="sle"
    ELSE
        SymType="sls"
    ENDIF
 ENDIF
 IF TokenBuf=">=" THEN
    IF Op1Class<>STRClass THEN
        SymType="sge"
    ELSE
        SymType="scc"
    ENDIF
 ENDIF
 IF TokenBuf="<>" THEN
    SymType="sne"
 ENDIF
 IF SymType="" THEN
    ErrNo=ErrIVExp
 RETURN
 ENDIF
lbl5615 GOSUB Expr
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
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 IF Op1Class=STRClass THEN
    GOSUB CmpString
 ENDIF
lbl5620
 IF Op1Class=BOOLClass THEN
    GOSUB CmpBool
    ErrRet
 ENDIF
 IF Op1Class=0 OR Op1Class=ARRClass OR Op1Class=CPXClass THEN
    ErrNo=ErrIVExp
    RETURN
 ENDIF
 OutBuf=" "+SymType+" d0"
 GenCode
 IF AndOrFlag=0 THEN
    OutBuf=" and.b d0,_True(a6)"
 ELSE
    OutBuf=" or.b d0,_True(a6)"
 ENDIF
 GenCode
 GOSUB NexToken
 IF TokenBuf="and" THEN
    AndOrFlag=0
    GOTOQ lbl5610
 ENDIF
 IF TokenBuf="or" THEN
    AndOrFlag=$ff
    GOTOQ lbl5610
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
 DMReg=0
 DMTemp=0
 DMVector=0
 DMMember=0
 DMRemote=0
 DMConst=0
 DMAddr=0
 DMArray=0
 RETURN
 
GtRootSym
 SubscrErr=0
 RootSym=""
 Subscript=""
 LabNdx=0
GtRtSym1
 INC LabNdx
 IF LabNdx>LEN(TokenSaf) THEN
    RETURN
 ENDIF
 TempByte=MID$(TokenSaf,LabNdx,1)
 IF TempByte<>"(" AND TempByte<>"[" THEN
    RootSym=RootSym+TempByte
    GOTOQ GtRtSym1
 ENDIF
 IF RIGHT$(TokenSaf,1)<>")" AND RIGHT$(TokenSaf,1)<>"]" THEN
    SubscrErr=$ff
    RETURN
 ENDIF
GtRtSym2
 INC LabNdx
 IF DimStrFlg=$ff THEN
    TokenSaf=TempStr
 ENDIF
 DimStrFlg=0
 TempByte=MID$(TokenSaf,LabNdx,1)
 IF LabNdx>LEN(TokenSaf)-1 THEN
    SymNdxSaf=SymNdx
    TempStr=SymTemp.SymName
    IF LEFT$(Subscript,1)>="0" AND LEFT$(Subscript,1)<="9" THEN
        TempInt=VAL(Subscript)
    ELSE
        SymTemp.SymName=Subscript
        GOSUB SymSrch
        IF SymFound=$ff AND SymTable(SymNdx).DataType=COMPVAR OR SymTable(SymNdx).DataType=MACRO THEN
            TempInt=SymTable(SymNdx).Detail
        ELSE
            ErrNo=ErrUDSym
            RETURN
        ENDIF
    ENDIF
    SymNdx=SymNdxSaf
    SymTemp.SymName=TempStr
    RETURN
 ENDIF
 IF TempByte<"0" AND TempByte>"9" THEN
    SubscrErr=$ff
    RETURN
 ENDIF
 Subscript=Subscript+TempByte
 GOTOQ GtRtSym2
 
DimVar
 TDataMod=LAND(MemberBit,TypeFlag)
 GOSUB ClrDatTyp
 IF ParmFlag=$ff THEN
    TDataMod=VectorBit
 ENDIF
 VectorFlg=0
 AliasFlg=0
 DimOK=0
 DimFlag=$ff
 TDataType=COMPVAR
 ArraySize=1
 GOSUB ClrSym1
 GOSUB TokenSym
 ErrRet
 IF SymFound=$ff THEN
    ErrNo=ErrDupSym
    RETURN
 ENDIF
 IF LEN(Subscript)<>0 THEN
    DMArray=$ff
    ArraySize=TempInt
 ENDIF
 GOSUB NexToken
 IF TokenSaf<>":" THEN
    ErrNo=ErrSyntax
    RETURN
 ENDIF
 GOSUB NexToken
 IF TokenLen=0 THEN
    ErrNo=ErrSyntax
    RETURN
 ENDIF
 IF TokenBuf="boolean" OR TokenBuf="logical" THEN
    DTBoolean=$ff
    TDataType=BOOLEAN
    SymType=" ds.b "
    TDataSize=1
    GOTOQ DimVar1
 ENDIF
 IF TokenBuf="byte" OR TokenBuf="char" THEN
    DTByte=$ff
    TDataType=BYTE
    SymType=" ds.b "
    TDataSize=1
    GOTOQ DimVar1
 ENDIF
 IF TokenBuf="short" OR TokenBuf="word" THEN
    DTShort=$ff
    TDataType=SHORT
    SymType=" ds.w "
    TDataSize=2
    GOTOQ DimVar1
 ENDIF
 IF TokenBuf="long" OR TokenBuf="integer" THEN
    DTLong=$ff
    TDataType=LONG
    SymType=" ds.l "
    TDataSize=4
    GOTOQ DimVar1
 ENDIF
 IF TokenBuf="real" OR TokenBuf="float" THEN
    DTFloat=$ff
    TDataType=FLOAT
    SymType=" ds.l "
    TDataSize=8
    GOTOQ DimVar1
 ENDIF
 IF MID$(TokenBuf,1,6)="string" THEN
    DimStrFlg=$ff
    DTString=$ff
    TDataType=STRING
    SymType=" ds.b "
    TempStr=TokenSaf
    TokenSaf=TokenBuf
    GOSUB GtRootSym
    IF SubscrErr=$ff THEN
        ErrNo=ErrSyntax
        RETURN
    ENDIF
    SymTemp.Detail=TempInt
    TDataSize=SymTemp.Detail
    GOTOQ DimVar1
 ENDIF
 IF TypeFlag=$ff THEN
    ErrNo=ErrIVParm
    RETURN
 ENDIF
 TSymName=SymTemp.SymName
 TypePtr=SymNdx
 GOSUB TokenSym1
 ErrRet
 IF SymFound=0 OR SymTable(SymNdx).DataType<>12 THEN
    ErrNo=ErrIVType
    RETURN
 ENDIF
 TDataSize=SymTable(SymNdx).DataSize
 SymTemp.Detail=SymNdx
 SymNdx=TypePtr
 SymTemp.SymName=TSymName
 SymType=" ds.b "
 TDataType=COMPLEX
 DTComplex=$ff
DimVar1
 GOSUB NexToken
 IF TokenLen=0 OR TokenBuf=";" THEN DimVar2
 IF TokenBuf="remote" THEN
    IF TypeFlag=$ff OR ParmFlag=$ff THEN
        ErrNo=ErrIVParm
        RETURN
    ENDIF
    DMRemote=$ff
    TDataMod=LOR(RemoteBit,TDataMod)
    GOTOQ DimVar1
 ENDIF
 IF TokenBuf="global" THEN
    IF TypeFlag=$ff OR ParmFlag=$ff THEN
        ErrNo=ErrIVParm
        RETURN
    ENDIF
    GblVarFlg=$ff
    GOTOQ DimVar1
 ENDIF
 IF TokenBuf="alias" THEN
    IF TypeFlag=$ff OR ParmFlag=$ff THEN
        ErrNo=ErrIVParm
        RETURN
    ENDIF
    ExtVarFlg=$ff
    IF NextByte<>"=" THEN
        ErrNo=ErrSyntax
        RETURN
    ENDIF
    GOSUB NexToken
    GOSUB NexToken
    RootSym=TokenSaf
    GOSUB ValidSym
    IF SymbolOK=0 THEN
        ErrNo=ErrIVSNam
        RETURN
    ENDIF
    OutBuf=SymTemp.SymName+" equ "+TokenSaf
    GenCode
    AliasFlg=$ff
    GOTOQ DimVar1
 ENDIF
 IF TokenBuf="external" THEN
    IF TypeFlag=$ff OR ParmFlag=$ff THEN
        ErrNo=ErrIVParm
        RETURN
    ENDIF
    ExtVarFlg=$ff
    GOTOQ DimVar1
 ENDIF
 IF TokenBuf="address" OR TokenBuf="pointer" OR ParmFlag=$ff THEN
    IF TypeFlag=$ff OR DMArray=$ff THEN
        ErrNo=ErrIVParm
        RETURN
    ENDIF
    DMAddr=$ff
    DTString=0
    DTComplex=0
    TDataMod=LOR(AddrBit,TDataMod)
    SymType=" ds.l "
    TDataSize=4
    GOTOQ DimVar1
 ENDIF
 IF TokenBuf="vector" THEN
    GOSUB NexToken
    IF TokenLen<>0 THEN
        IF TokenBuf="external" THEN
            ExtVarFlg=$ff
        ELSE
            IF TokenBuf="global" THEN
                GblVarFlg=$ff
            ELSE
                ErrNo=ErrIVParm
                RETURN
            ENDIF
        ENDIF
    ENDIF
    IF TypeFlag=$ff OR DMRemote=$ff OR DMAddr=$ff OR AliasFlg=$ff OR  ParmFlag=$ff THEN
        ErrNo=ErrIVParm
        RETURN
    ENDIF
    VectorFlg=$ff
    TDataMod=LOR(TDataMod,VectorBit)
    GOTOQ DimVar2
 ENDIF
 IF TokenBuf="register" THEN
    GOSUB NexToken
    IF TokenLen<>0 THEN
        ErrNo=ErrIVParm
        RETURN
    ENDIF
    IF TypeFlag=$ff OR DMArray=$ff OR ExtVarFlg=$ff OR GblVarFlg=$ff OR DMRemote=$ff OR DMAddr=$ff OR AliasFlg=$ff OR ParmFlag=$ff THEN
        ErrNo=ErrIVParm
        RETURN
    ENDIF
    IF TDataType<>BYTE AND TDataType<>SHORT AND TDataType<>LONG THEN
        ErrNo=ErrIVParm
        RETURN
    ENDIF
    ExtVarFlg=$ff\ fake out code generator
    DMReg=$ff
    TDataMod=LOR(TDataMod,RegBit)
    IF DtaRegNum=5 THEN
        ErrNo=ErrRegUse
        RETURN
    ENDIF
    IF DtaRegNum=0 THEN
        DtaRegNum=4
    ELSE
        DtaRegNum=5
    ENDIF
    SymTemp.Detail=DtaRegNum
    GOTOQ DimVar2
 ENDIF
 ErrNo=ErrIVMod
 RETURN
DimVar2
 DimOK=$ff
 SymTemp.DataType=TDataType
 IF DMArray=$ff THEN
    TDataMod=LOR(ArrayBit,TDataMod)
 ENDIF
 SymTemp.DataMod=TDataMod
 SymTemp.DataSize=TDataSize*ArraySize
 RETURN
 
GetExp
 TypePtr=0
 ExpEnd=0
 ExpNdx=1
 ParenCnt=0
 FcnCtr=0
 ExpTable(ExpNdx)=1
 LastEntry=SymTable(ExpTable(ExpNdx))
GetExp1
 IF ExpEnd=$ff THEN ExpExit
 IF NextByte="," AND FcnCtr=0 THEN ExpExit
 IF NextByte=")" AND PseudoFcn=$ff THEN ExpExit
GetExp2
 GOSUB NexToken
 IF FcnCtr<>0 AND TokenBuf="#" THEN GetExp2
 IF TokenLen=0 THEN ExpExit
 IF TokenBuf="," THEN
    GOSUB AddRtGrp2
    IF ExpNdx>ExpTabSiz THEN ExpExit
    GOSUBQ IncExpNdx
    IF ExpNdx>ExpTabSiz THEN ExpExit
    ExpTable(ExpNdx)=2
    GOSUBQ IncExpNdx
    IF ExpNdx>ExpTabSiz THEN ExpExit
    ExpTable(ExpNdx)=1
    LastEntry=SymTable(ExpTable(ExpNdx))
    GOTOQ GetExp1
 ENDIF
************************
* Start of Pointer Stuff Here
 IF TokenBuf="[" THEN
    GOSUBQ IncExpNdx
    IF ExpNdx>ExpTabSiz THEN ExpExit
    GOSUB NexToken
    IF TokenLen=0 THEN
        ErrNo=ErrIVExp
        GOTOQ ExpExit
    ENDIF
    SymTemp.SymName=TokenSaf
    GOSUB SymSrch
    IF SymFound=0 THEN
        ErrNo=ErrUDSym
        GOTOQ ExpExit
    ENDIF
    SymTemp=SymTable(SymNdx)
    IF LAND(AddrBit,SymTemp.DataMod)<>AddrBit THEN
        ErrNo=ErrTypMis
        GOTOQ ExpExit
    ENDIF
    IF SymTemp.DataType=COMPLEX THEN
        ExpTable(ExpNdx)=24\ cpx begin
        GOSUBQ IncExpNdx
        IF ExpNdx>ExpTabSiz THEN ExpExit
    ENDIF
    ExpTable(ExpNdx)=26\ "["
    GOSUBQ IncExpNdx
    IF ExpNdx>ExpTabSiz THEN ExpExit
    ExpTable(ExpNdx)=SymNdx
    LastEntry=SymTemp
    GOSUB NexToken
    IF TokenBuf<>"]" OR TokenLen=0 THEN
        ErrNo=ErrSyntax
        GOTOQ ExpExit
    ENDIF
    GOSUBQ IncExpNdx
    IF ExpNdx>ExpTabSiz THEN ExpExit
    ExpTable(ExpNdx)=27\ put "]" in table
    IF SymTemp.DataType<>COMPLEX THEN GetExp1
    GOSUBQ IncExpNdx
    IF ExpNdx>ExpTabSiz THEN ExpExit
    IF NextByte="." THEN
        GOSUB NexToken\ eat "."
        ExpTable(ExpNdx)=13\ "."
        GOSUB NexToken
        IF TokenLen=0 THEN
            ErrNo=ErrSyntax
            GOTOQ ExpExit
        ENDIF
        SymTemp.SymName=TokenSaf
        GOSUB SymSrch
        IF SymFound=0 THEN
            ErrNo=ErrUDSym
            GOTOQ ExpExit
        ENDIF
        SymTemp=SymTable(SymNdx)
        IF LAND(MemberBit,SymTemp.DataMod)<>MemberBit THEN
            ErrNo=ErrTypMis
            GOTOQ ExpExit
        ENDIF
        GOSUBQ IncExpNdx
        IF ExpNdx>ExpTabSiz THEN ExpExit
        ExpTable(ExpNdx)=SymNdx
        GOSUBQ IncExpNdx
        IF ExpNdx>ExpTabSiz THEN ExpExit
    ENDIF
    ExpTable(ExpNdx)=25\ cpx end
    GOTOQ GetExp1
 ENDIF
* End of Pointer Stuff Here
************************
 IF TokenType=TTypMath THEN
    GOSUBQ IncExpNdx
    IF ExpNdx>ExpTabSiz THEN ExpExit
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
        ExpTable(ExpNdx)=126
    ENDIF
    IF TokenBuf="|" THEN
        ExpTable(ExpNdx)=127
    ENDIF
    LastEntry=SymTable(ExpTable(ExpNdx))
    GOTOQ GetExp1
 ENDIF
 IF TokenBuf="(" THEN
    GOSUBQ IncExpNdx
    IF ExpNdx>ExpTabSiz THEN ExpExit
    IF LAND(ArrayBit,LastEntry.DataMod)<>0 THEN
        ExpTable(ExpNdx)=3
        INC ParenCnt
        ParenStk(ParenCnt)=3
        GOSUBQ IncExpNdx
        IF ExpNdx>ExpTabSiz THEN ExpExit
        ExpTable(ExpNdx)=1
        GOTOQ GetExp3
    ENDIF
    IF LastEntry.DataType=FCN THEN
        ExpTable(ExpNdx)=5
        INC ParenCnt
        ParenStk(ParenCnt)=5
        INC FcnCtr
        GOSUBQ IncExpNdx
        IF ExpNdx>ExpTabSiz THEN ExpExit
        ExpTable(ExpNdx)=1
        GOTOQ GetExp3
    ENDIF
    IF LastEntry.DataType<>9 AND ExpNdx<>1 THEN
        ErrNo=ErrIVExp
        GOTOQ ExpExit
    ENDIF
    LevelCnt=1
    GOSUB PreScan1
    GOSUB AddLftGrp
    ExpTable(ExpNdx)=1
    INC ParenCnt
    ParenStk(ParenCnt)=1
GetExp3
    LastEntry=SymTable(ExpTable(ExpNdx))
    GOTOQ GetExp1
 ENDIF
 IF TokenBuf=")" THEN
    GOSUB AddRtGrp2
    IF ExpNdx>ExpTabSiz THEN ExpExit
    GOSUBQ IncExpNdx
    IF ExpNdx>ExpTabSiz THEN ExpExit
    IF ParenCnt=0 THEN
        ErrNo=ErrParen
        GOTOQ ExpExit
    ENDIF
    IF ParenStk(ParenCnt)=3 OR ParenStk(ParenCnt)=5 THEN
        ExpTable(ExpNdx)=2
        GOSUBQ IncExpNdx
        IF ExpNdx>ExpTabSiz THEN ExpExit
    ENDIF
    ExpTable(ExpNdx)=ParenStk(ParenCnt)+1
    IF ExpTable(ExpNdx)=6 THEN
        DEC FcnCtr
    ENDIF
    DEC ParenCnt
    LastEntry=SymTable(ExpTable(ExpNdx))
    GOSUB AddRtGrp1
    GOTOQ GetExp1
 ENDIF
 IF TokenBuf="." THEN
    GOSUBQ IncExpNdx
    IF ExpNdx>ExpTabSiz THEN ExpExit
    ExpTable(ExpNdx)=13
    LastEntry=SymTable(ExpTable(ExpNdx))
    GOTOQ GetExp1
 ENDIF
 IF TokenType=TTypSym THEN
    GOSUBQ IncExpNdx
    IF ExpNdx>ExpTabSiz THEN ExpExit
    SymTemp.SymName=TokenBuf
    GOSUB SymSearch
    IF SymFound=$ff THEN
        SymTemp=SymTable(SymNdx)
        IF SymTemp.DataType=FCN THEN
            GOSUB PreScan
            GOSUB AddLftGrp
            IF ExpNdx>ExpTabSiz THEN ExpExit
            LastEntry=SymTemp
            ExpTable(ExpNdx)=SymNdx
            GOTOQ GetExp1
        ENDIF
    ENDIF
    SymTemp.SymName=TokenSaf
    GOSUB SymSrch
    IF SymFound=$ff THEN
        SymTemp=SymTable(SymNdx)
        DataTemp=SymTemp.DataType
        IF DataTemp>=BOOLEAN AND DataTemp<=STRING OR DataTemp=COMPLEX OR DataTemp=BUFFER THEN
            ExpTable(ExpNdx)=SymNdx
            IF LAND(MemberBit,SymTemp.DataMod)<>0 AND LastEntry.SymName<>"." THEN
                ErrNo=ErrIVExp
                GOTOQ ExpExit
            ENDIF
            IF TypePtr<>0 AND LastEntry.SymName="." THEN
                IF SymNdx-TypePtr>SymTable(TypePtr).Detail OR TypePtr>SymNdx THEN
                    ErrNo=ErrUDSym
                    GOTOQ ExpExit
                ELSE
                    TypePtr=0
                ENDIF
            ENDIF
            IF DataTemp=COMPLEX THEN
                TempStr=NextByte
                GOSUB PreScan
                GOSUB AddLftGrp
                IF ExpNdx>ExpTabSiz THEN ExpExit
                NextByte=TempStr
                INC ParenCnt
                ParenStk(ParenCnt)=24
                ExpTable(ExpNdx)=24
                GOSUBQ IncExpNdx
                IF ExpNdx>ExpTabSiz THEN ExpExit
                TypePtr=SymTemp.Detail
            ENDIF
            IF DataTemp<>COMPLEX AND LAND(ArrayBit,SymTemp.DataMod)=ArrayBit THEN
                TempStr=NextByte
                GOSUB PreScan
                GOSUB AddLftGrp
                IF ExpNdx>ExpTabSiz THEN ExpExit
                NextByte=TempStr
            ENDIF
            IF DataTemp<>COMPLEX THEN
                GOSUB AddLftGrp
            ENDIF
            IF ExpNdx>ExpTabSiz THEN ExpExit
            ExpTable(ExpNdx)=SymNdx
            LastEntry=SymTemp
            GOTOQ Exp4
        ENDIF
        IF DataTemp=COMPVAR OR DataTemp=MACRO THEN
            Konstant=SymTable(SymNdx).Detail
            SymTemp.SymName=Hex$(Konstant)
            GOSUB ProcKonst
            IF ErrNo<>0 THEN ExpExit
            GOTOQ Exp4
        ENDIF
    ENDIF
    ErrNo=ErrUDSym
    GOTOQ ExpExit
 ENDIF
 IF TokenType=TTypFloat THEN
    GOSUBQ IncExpNdx
    IF ExpNdx>ExpTabSiz THEN ExpExit
    GOSUB AddLftGrp
    IF ExpNdx>ExpTabSiz THEN ExpExit
    GOSUB ValidFlt
    IF FloatOK=0 THEN
        ErrNo=ErrIVExp
        GOTOQ ExpExit
    ENDIF
    move.l TokenBuf(a6),a0
    tcall T$Math,T$AtoD
    move.l d1,-(sp)
    move.l d0,Konstant(a6)
    SymTemp.SymName=Hex$(Konstant)
    move.l (sp)+,Konstant(a6)
    SymTemp.SymName=SymTemp.SymName+Hex$(Konstant)
    GOSUB SymSrch
    IF SymFound=0 THEN
        GOSUB ClrSym1
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
    IF ExpNdx>ExpTabSiz THEN ExpExit
    GOTOQ GetExp1
 ENDIF
 IF TokenType=TTypInt THEN
    GOSUBQ IncExpNdx
    IF ExpNdx>ExpTabSiz THEN ExpExit
    GOSUB AddLftGrp
    IF ExpNdx>ExpTabSiz THEN ExpExit
    GOSUB ValidInt
    IF IntOK=0 THEN
        ErrNo=ErrIVExp
        GOTOQ ExpExit
    ENDIF
    Konstant=VAL(TokenBuf)
    SymTemp.SymName=Hex$(Konstant)
    GOSUB ProcKonst
    IF ErrNo<>0 THEN ExpExit
    GOTOQ Exp4
 ENDIF
 IF TokenType=TTypHex THEN
    GOSUBQ IncExpNdx
    IF ExpNdx>ExpTabSiz THEN ExpExit
    GOSUB AddLftGrp
    IF ExpNdx>ExpTabSiz THEN ExpExit
    GOSUB ValidHex
    IF HexOK=0 THEN
        ErrNo=ErrIVExp
        GOTOQ ExpExit
    ENDIF
    SymTemp.SymName=TokenBuf
    GOSUB ProcKonst
    IF ErrNo<>0 THEN ExpExit
Exp4 GOSUB AddRtGrp1
    IF ExpNdx>ExpTabSiz THEN ExpExit
    GOTOQ GetExp1
 ENDIF
 IF TokenType=TTypQuote THEN
    GOSUBQ IncExpNdx
    IF ExpNdx>ExpTabSiz THEN ExpExit
    IF LEN(TokenSaf)=2 THEN\ null string
        LastEntry=SymTable(20)
        ExpTable(ExpNdx)=20\ 20 is table entry for null string
        GOTOQ GetExp1
    ENDIF
    INC PoolCtr
    PoolBuf="_Pool"
    PoolBuf=PoolBuf+STR$(PoolCtr)
    SymTemp.SymName=PoolBuf
    PoolBuf=PoolBuf+" dc.b "
    Escape=0
    FOR Ctr3=1 TO LEN(TokenSaf)
        B=MID$(TokenSaf,Ctr3,1)
        IF Escape=$ff THEN
            IF B<>"n" AND B<>"t" AND B<>"b" AND B<>"l" AND B<>"q" AND B<>CHR$($5c) THEN
                ErrNo=ErrSyntax
                RETURN
            ENDIF
            PoolBuf=PoolBuf+CHR$($22)+","
            IF B="n" THEN
                PoolBuf=PoolBuf+"$0d"
            ENDIF
            IF B="t" THEN
                PoolBuf=PoolBuf+"$09"
            ENDIF
            IF B="b" THEN
                PoolBuf=PoolBuf+"$08"
            ENDIF
            IF B="l" THEN
                PoolBuf=PoolBuf+"$0a"
            ENDIF
            IF B="q" THEN
                PoolBuf=PoolBuf+"$22"
            ENDIF
            IF B=CHR$($5c) THEN
                PoolBuf=PoolBuf+"$5c"
            ENDIF
            PoolBuf=PoolBuf+","+CHR$($22)
            Escape=0
        ELSE
            IF B<>CHR$($5c) THEN
                PoolBuf=PoolBuf+B
            ELSE
                Escape=$ff
            ENDIF
        ENDIF
    NEXT Ctr3
    PoolBuf=PoolBuf+",$0"
    GOSUB SymSrch
    SymTemp.DataType=STRING
    SymTemp.DataMod=4
    GOSUB ClrSym1
    SymTemp.Detail=LEN(TokenSaf)-1
    SymTemp.DataSize=SymTemp.Detail
    GOSUB SymInsert
    IF ErrNo<>0 THEN
        GOTOQ ExpExit
    ENDIF
    WRITE #PoolFile,PoolBuf
    LastEntry=SymTemp
    ExpTable(ExpNdx)=SymNdx
    GOTOQ GetExp1
 ENDIF
 ErrNo=ErrIVExp
 RETURN
PreScan
 LevelCnt=0
PreScan1
 SrcNdxSaf=SrcNdx
 ExpEndSaf=ExpEnd
PreScan2
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
 GOTOQ PreScan2

Unary
 LstExp=ExpTable(ExpNdx-1)
 IF LstExp=1 OR LstExp=3 OR LstExp=5 OR LstExp=22 OR LstExp=24 THEN
    ExpTable(ExpNdx)=21
    GOSUBQ IncExpNdx
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
        GOSUBQ IncExpNdx
    ENDIF
 ENDIF
 RETURN
AddRtGrp1
 IF ParenCnt=0 THEN
    RETURN
 ENDIF
 IF NextByte="+" OR NextByte="-" OR NextByte="*" OR NextByte="/"  OR NextByte="&" OR NextByte="|" THEN
    IF ParenStk(ParenCnt)=24 THEN
        GOSUBQ IncExpNdx
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
            GOSUBQ IncExpNdx
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
    GOSUBQ IncExpNdx
    IF ExpNdx>ExpTabSiz THEN
        RETURN
    ENDIF
    DEC ParenCnt
    ExpTable(ExpNdx)=25
 ENDIF
 IF ParenStk(ParenCnt)=22 THEN
    GOSUBQ IncExpNdx
    DEC ParenCnt
    ExpTable(ExpNdx)=23
    RETURN
 ELSE
    RETURN
 ENDIF
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
            GOSUBQ IncExpNdx
            IF ExpNdx>ExpTabSiz THEN ExpExit
            ExpTable(ExpNdx)=25
            DEC ParenCnt
        ENDIF
    ENDIF
    IF ParenCnt<>0 THEN
        IF ParenStk(ParenCnt)=22 THEN
            GOSUBQ IncExpNdx
            IF ExpNdx>ExpTabSiz THEN ExpExit
            ExpTable(ExpNdx)=23
            ParenCnt=0
        ENDIF
    ENDIF
    IF ParenCnt<>0 THEN
        ErrNo=ErrParen
    ELSE
        GOSUBQ IncExpNdx
        ExpTable(ExpNdx)=2
    ENDIF
 ENDIF
 RETURN

IncExpNdx
 INC ExpNdx
 ExpLen=ExpNdx
 RETURN

ProcKonst
 GOSUB SymSrch
 IF SymFound=0 THEN
    GOSUB ClrSym1
    SymTemp.DataType=LONG
    SymTemp.DataSize=4
    SymTemp.DataMod=4
    GOSUB SymInsert
    ErrRet
 ENDIF
 SymTemp=SymTable(SymNdx)
 LastEntry=SymTemp
 ExpTable(ExpNdx)=SymNdx
 RETURN

ProcExp
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
 GOTOQ ProcExp

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
 GOTOQ ParenScn1

SquishExp
 IF ExpRight+1>ExpLen THEN
    ExpLen=ExpLeft-1
    RETURN
 ENDIF
 ExpTable(ExpLeft)=ExpTable(ExpRight+1)
 INC ExpLeft
 INC ExpRight
 GOTOQ SquishExp

SolveTerm D0Loaded=0
 D0Float=0
 D1Float=0
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
    GOSUB ClassOp
    GOSUB GetTmpVec
    ErrRet
    SymTable(SymNdx).DataMod=LAND(SymTable(SymNdx).DataMod,$fd)\ kill addr bit
    ExpTable(ExpNdx)=SymNdx
    IF DMRemote=0 THEN
        OutBuf=" move.l "+TSymName+"(a6),a0"
    ELSE
        OutBuf=" move.l #"+TSymName+",d7"
        GenCode
        OutBuf=" move.l (a6,d7.l),a0"
    ENDIF
    GenCode
    OutBuf=" move.l a0,"+SymTemp.SymName+"(a6)"
    GenCode
    IF TDataType=STRING THEN
        OutBuf=" move.l #"+STR$(TDetail)+","+SymTemp.SymName+"+4(a6)"
        GenCode
        OutBuf=" clr.l "+SymTemp.SymName+"+8(a6)"
        GenCode
    ENDIF
    GOTOQ GrpCpxEnd
 ENDIF
* Pointer Stuff Ends Here
********************************
 IF PType=4 THEN
    ExpNdx=ExpLeft-1
    GOSUB ClassOp
    IF TDataType=STRING THEN
        GOSUB VecString
        GOTOQ ArrFcnEnd
    ENDIF
    GOSUB GetTmpVec
    ErrRet
    GOSUB GetBase
    ExpTable(ExpNdx)=SymNdx
    TempStr=SymTemp.SymName
    GOSUB GetOpSize
    GOSUB BldOffset
    OutBuf=" move.l a0,"+TempStr+"(a6)"
    GenCode
    GOTOQ ArrFcnEnd
 ENDIF
 IF PType=6 THEN
    ExpNdx=ExpLeft-1
    SymTemp=SymTable(ExpTable(ExpNdx))
    UsrFcnNam=SymTemp.SymName
    TempInt=SymTemp.Detail+1
    FcnCode=TempInt-1
    ExpNdx=ExpNdx+2
    IF TempInt>1000 THEN UsrFcn
    ON TempInt GOSUB F0,F1,F2,F3,F4,F5,F6,F7,F8,F9,F10,F11,F12,F13,F14,F15,F16,F17,F18,F19,F20,F21,F22,F23,F24,F25,F26,F27,F28,F29,F30,F31,F32,F33,F34,F35,F36,F37,F38,F39,F40,F41,F42,F43,F44,F45,F46,F47,F48,F49,F50,F51,F52,F53,F54,F55,F56,F57,F58,F59,F60
FcnReturn
    ErrRet
    GOTOQ ArrFcnEnd
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
            GOSUB MakTmpVec
            ErrRet
        ENDIF
        GOTOQ GrpCpxEnd
    ENDIF
    ExpNdx=ExpLeft+3
    GOSUB ClassOp
    IF TDataType=STRING AND DMVector=0 THEN
        GOSUB VecString
    ENDIF
    IF DMVector=$ff AND DMTemp=0 THEN
        GOSUB MakTmpVec
        ErrRet
    ENDIF
    ExpNdx=ExpNdx-2
    GOSUB ClassOp
    IF DMVector=0 THEN
        GOSUB Vectorize
        ErrRet
    ENDIF
    IF DMVector=$ff AND DMTemp=0 THEN
        GOSUB MakTmpVec
        ErrRet
    ENDIF
    ExpNdx=ExpNdx+2
    GOSUB ClassOp
    ExpNdx=ExpNdx-2
    SymNdx=ExpTable(ExpNdx)
    SymTable(SymNdx).DataType=TDataType
    SymTable(SymNdx).DataSize=TDataSize
    SymTable(SymNdx).Detail=TDetail
    OutBuf=" move.l "+SymTable(SymNdx).SymName+"(a6),d0"
    GenCode
    IF DMVector=$ff THEN
        OutBuf=" add.l "+TSymName+"(a6),d0"
    ELSE
        OutBuf=" add.l #"+STR$(TDataAddr)+",d0"
    ENDIF
    GenCode
    OutBuf=" move.l d0,"+SymTable(SymNdx).SymName+"(a6)"
    GenCode
    IF OpClass=STRClass AND ReadFlag=0 THEN
        OutBuf=" move.l "+TSymName+"+4(a6),"+SymTable(SymNdx).SymName+"+4(a6)"
        GenCode
        OutBuf=" move.l "+TSymName+"+8(a6),"+SymTable(SymNdx).SymName+"+8(a6)"
        GenCode
    ENDIF
    GOTOQ GrpCpxEnd
 ENDIF
 ExpNdx=ExpLeft+1
 GOSUB ClassOp
 IF ExpRight-ExpLeft=2 AND DMArray=$ff THEN
    IF CompFlag<>0 THEN
        ErrNo=ErrIVExp
    ENDIF
    GOTOQ GrpCpxEnd
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
    GOTOQ GrpCpxEnd
 ENDIF
ScanStr
 GOSUB ClassOp
 IF TDataType=STRING AND DMVector=0 AND DMAddr=0 THEN
    GOSUB VecString
 ENDIF
 IF DMVector=$ff AND DMTemp=0 THEN
    REM need to make a temp vector
    GOSUB MakTmpVec
    ErrRet
 ENDIF
 INC ExpNdx
 IF ExpNdx<ExpRight THEN ScanStr
    ExpNdx=ExpLeft+1
    GOSUB ClassOp
    IF TDataType=STRING THEN
        DataOp=0
        Ctr1=0
6184    IF DataOp=0 THEN
            GOSUB ClassOp
            IF TDataType<>STRING THEN
                ErrNo=ErrIVExp
                RETURN
            ENDIF
            INC Ctr1
            IF Ctr1>1 THEN
                OutBuf=" lea "+TSymName+"(a6),a0"
                GenCode
                TSymName=SymTable(ExpTable(ExpNdx-2)).SymName
                OutBuf=" move.l a0,"+TSymName+"+8(a6)"
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
        GOTOQ GrpCpxEnd
    ENDIF
    IF TDataType<2 OR TDataType>5 THEN
        ErrNo=ErrIVExp
        RETURN
    ELSE
        DataOp=0
        Ctr1=0
6186    IF DataOp=0 THEN
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
                IF MathOp=126 THEN
                    GOSUB And
                ENDIF
                IF MathOp=127 THEN
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
        GOTOQ GrpCpxEnd
    ENDIF
    GOSUB GetTmp
    IF ErrNo<>0 THEN
        ErrNo=ErrTmpUse
        RETURN
    ENDIF
    GOSUB SaveD0Tmp
    GOTOQ GrpCpxEnd
 ENDIF

GetBase
 IF DMMember=$ff THEN
    OutBuf=" move.l #"+STR$(TDataAddr)+",a0"
 ELSE
    IF DMVector=$ff THEN
        OutBuf=" move.l "+TSymName+"(a6),a0"
    ELSE
        IF DMRemote=0 THEN
            OutBuf=" lea "+TSymName+"(a6),a0"
        ELSE
            OutBuf=" move.l #"+TSymName+",d7"
            GenCode
            OutBuf=" lea (a6,d7.l),a0"
        ENDIF
    ENDIF
 ENDIF
 GenCode
 RETURN

BldOffset
 SymTable(SymNdx).DataSize=TempInt
 SymTable(SymNdx).DataMod=LAND(ArrayMsk,SymTable(SymNdx).DataMod)
 ExpNdx=ExpNdx+2
 GOSUB LoadReg
 ErrRet
 IF TDataType=FLOAT THEN
    OutBuf=MathCall+"T$DtoL"
    GenCode
 ENDIF
 IF ArrayBase=1 THEN
    OutBuf=" subq.l #1,d0"
    GenCode
 ENDIF
 IF TempInt<>1 THEN
    IF TempInt=2 THEN
        OutBuf=" asl.l #1,d0"
    ELSE
        IF TempInt=4 THEN
            OutBuf=" asl.l #2,d0"
        ELSE
            IF TempInt=8 THEN
                OutBuf=" asl.l #3,d0"
            ELSE
                OutBuf=" move.l #"+STR$(TempInt)+",d1"
                GenCode
                OutBuf=MathCall+"T$LMul"
            ENDIF
        ENDIF
    ENDIF
 GenCode
 ENDIF
 OutBuf=" adda.l d0,a0"
 GenCode
 ExpNdx=ExpNdx-2
 RETURN

ArrFcnEnd
 DEC ExpLeft
GrpCpxEnd
 ExpTable(ExpLeft)=ExpTable(ExpNdx)
 ExpNdx=ExpLeft
 INC ExpLeft
 RETURN

VecString
 IF BufRWFlg=$ff THEN\ for the case of BUFRW #fn,ADDR(a$),size
    RETURN
 ENDIF
 GOSUB GetTmpVec
 ErrRet
 IF DMConst=0 THEN
    GOSUB GetBase
 ELSE
    IF ProgSize=$ff THEN
        OutBuf=" move.l #"+TSymName+"-*-8,a0"
        GenCode
        OutBuf=" lea (pc,a0.l),a0"
    ELSE
        OutBuf=" lea "+TSymName+"(pc),a0"
    ENDIF
    GenCode
 ENDIF
 ExpTable(ExpNdx)=SymNdx
 TempStr=SymTemp.SymName
 TempInt=TDetail
 IF PType=4 THEN
    GOSUB BldOffset
 ENDIF
 IF DiskIO=0 THEN
    OutBuf=" move.l a0,"+TempStr+"(a6)"
    GenCode
    IF ReadFlag=0 THEN
        OutBuf=" move.l #"+STR$(TempInt)+","+TempStr+"+4(a6)"
        GenCode
        OutBuf=" clr.l "+TempStr+"+8(a6)"
        GenCode
    ENDIF
 ENDIF
 RETURN
ClassOp
 SymTemp=SymTable(ExpTable(ExpNdx))
ClassOp1
 GOSUB ClrDatTyp
 TSymName=SymTemp.SymName
 TDataType=SymTemp.DataType
 TDataMod=SymTemp.DataMod
 TDetail=SymTemp.Detail
 TDataAddr=SymTemp.DataAddr
 TDataSize=SymTemp.DataSize
 IF TDataMod=RegBit THEN
    DMReg=$ff
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
 IF LAND(RemoteBit,TDataMod)=RemoteBit THEN
    DMRemote=$ff
 ENDIF
 IF LAND(ConstBit,TDataMod)=ConstBit THEN
    DMConst=$ff
 ENDIF
 IF LAND(AddrBit,TDataMod)=AddrBit THEN
    DMAddr=$ff
 ENDIF
 IF LAND(ArrayBit,TDataMod)=ArrayBit THEN
    DMArray=$ff
 ENDIF
 IF DMArray=$ff THEN
    OpClass=ARRClass
    RETURN
 ENDIF
 IF TDataType=BOOLEAN THEN
    OpClass=BOOLClass
    RETURN
 ENDIF
 IF TDataType>=2 AND TDataType<=4 OR LAND(AddrBit,TDataMod)=AddrBit THEN
    OpClass=INTClass
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
 GOSUB GetExp
 ErrRet
 GOSUB ProcExp
 ErrRet
 GOSUB ClassOp
 RETURN
 
TokenSym
 GOSUB NexToken
 IF TokenLen=0 THEN
    ErrNo=ErrSyntax
    RETURN
 ENDIF
TokenSym1 GOSUB GtRootSym
 GOSUB ValidSym
 IF SymbolOK=0 THEN
    ErrNo=ErrIVSNam
    RETURN
 ENDIF
 SymTemp.SymName=SymbolSaf
 GOSUB SymSrch
 RETURN
 
ClrSym1 SymTemp.Detail=0
ClrSym2 SymTemp.DataAddr=0
ClrSym3 SymTemp.DataSize=0
 RETURN
 
CmdLine
 CmdFlag=$ff
CmdLineLp
 ErrNo=0
 TempStr=NextArg
 IF LEN(TempStr)=0 THEN CmdLineDn
 IF LEFT$(TempStr,1)="-" THEN
    OptNdx=1
Option
    GOSUB ParseOpt
    IF LEN(Opt)=0 THEN CmdLineLp
    IF Opt="b" OR Opt="B" THEN
        ProgSize=$ff
        GOTOQ Option
    ENDIF
    IF Opt="m" OR Opt="M" THEN
        GOSUB ParseOpt
        IF LEN(Opt)=0 THEN BadOpt
        IF Opt="=" THEN
            GOSUB ParseOpt
            IF LEN(Opt)=0 THEN BadOpt
        ENDIF
        Machine=VAL(Opt)
        GOTOQ Option
    ENDIF
    IF Opt="o" OR Opt="O" THEN
        IF OptNdx<>2 THEN BadOpt
        MID$(TempStr,2,1)="O"
        GOSUB ParseOpt
        IF LEN(Opt)=0 OR Opt<>"=" THEN BadOpt
        GOSUB ParseOpt
        IF LEN(Opt)=0 THEN
            LibOut=""
        ELSE
            LibOut=" "+TempStr
        ENDIF
        GOTOQ CmdLineLp
    ENDIF
    IF Opt="d" OR Opt="D" THEN
        DrvrMode=$ff
        ProgMode=0
        GOTOQ Option
    ENDIF
    IF Opt="f" OR Opt="F" THEN
        FcnMode=$ff
        ProgMode=0
        GOTOQ Option
    ENDIF
    IF Opt="z" OR Opt="Z" THEN
        ZeroMode=$ff
        ProgMode=0
        GOTOQ Option
    ENDIF
    IF Opt="r" OR Opt="R" THEN
        ROMMode=$ff
        ProgMode=0
        l68Opt=l68Opt+" -r"
        GOTOQ Option
    ENDIF
    IF Opt="g" OR Opt="G" THEN
        l68Opt=l68Opt+" -g"
        GOTOQ Option
    ENDIF
    IF Opt="v" OR Opt="V" THEN
        VarReport=$ff
        GOTOQ Option
    ENDIF
    IF Opt="a" OR Opt="A" THEN
        AsmbFlag=$ff
        GOTOQ Option
    ENDIF
    IF Opt="e" OR Opt="E" THEN
        NoGen=$ff
        GOTOQ Option
    ENDIF
    IF Opt="s" OR Opt="S" THEN
        DumpSyms=$ff
        GOTOQ Option
    ENDIF
    IF Opt="p" OR Opt="P" THEN
        ProcMode=$ff
        ProgMode=0
        GOTOQ Option
    ENDIF
    IF Opt="u" OR Opt="U" THEN
        UDump=$ff
        GOTOQ Option
    ENDIF
    IF Opt="c" OR Opt="C" THEN
        CEnviron=$ff
        GOTOQ Option
    ENDIF
    PRINT "Unknown option ";TempStr
    END
 ELSE
    REM SET Directive
    SrcNdx=0
    SrcLine=TempStr
    GOSUB FIXDx
 ENDIF
    GOTOQ CmdLineLp
CmdLineDn
 CmdFlag=0
 IF FcnMode+ZeroMode=$ff THEN
    RETURN
 ENDIF
 IF DrvrMode=0 THEN
    OutBuf=" psect "+FileName+",Typ_Lang,Attr_Rev,Edition,StackSize,_Start"
 ELSE
    OutBuf=" psect "+FileName+",Typ_Lang,Attr_Rev,Edition,StackSize,EntTable"
 ENDIF
 GenCode
 IF ProgMode=$ff THEN
    OutBuf="Typ_Lang set $101"
    GenCode
 ENDIF
 IF ProcMode=$ff THEN
    OutBuf="Typ_Lang set $201"
    GenCode
 ENDIF
 IF DrvrMode=$ff THEN
    OutBuf="Typ_Lang set $0e01"
    GenCode
    OutBuf="Attr_Rev set $a000"
    GenCode
 ENDIF
 IF ROMMode=$ff THEN
    OutBuf="Typ_Lang set $0c01"
    GenCode
    OutBuf="Attr_Rev set $8000"
    GenCode
 ENDIF
 IF ProgMode=$ff OR ProcMode=$ff THEN
    OutBuf="Attr_Rev set $8000"
    GenCode
    OutBuf="StackSize set 1000"
    GenCode
 ENDIF
 IF DrvrMode=$ff OR ROMMode=$ff THEN
    OutBuf="StackSize set 0"
    GenCode
 ENDIF
 IF ProcMode=0 THEN
    VarBytes=VarBytes+184
 ELSE
    VarBytes=VarBytes+188
    OutBuf=" vsect"
    GenCode
    OutBuf="_Parm1Addr: ds.l 1"
    GenCode
    OutBuf="_Parm1Size: ds.l 1"
    GenCode
    OutBuf="_ParmCnt: ds.l 1"
    GenCode
    OutBuf="_PrmAdrPtr: ds.l 1"
    GenCode
    OutBuf=" ends"
    GenCode
 ENDIF
 IF CEnviron=$ff THEN
    OutBuf=" vsect"
    GenCode
    OutBuf="_mtop: ds.l 1"
    GenCode
    OutBuf="_stbot: ds.l 1"
    GenCode
    OutBuf="_totmem: ds.l 1"
    GenCode
    OutBuf="_sbsize: ds.l 1"
    GenCode
    OutBuf="_fcbs: ds.l 1"
    GenCode
    OutBuf="environ: ds.l 1"
    GenCode
    OutBuf="_pathcnt: ds.w 1"
    GenCode
    OutBuf="_sysglob: ds.l 1"
    GenCode
    OutBuf="stdin: ds.l 1"
    GenCode
    OutBuf="stdout: ds.l 1"
    GenCode
    OutBuf="stderr: ds.l 1"
    GenCode
    OutBuf=" ends"
    GenCode
    VarBytes=VarBytes+30
 ENDIF
 RESTORE RunVars
RunVarLp
 READ OutBuf
 IF OutBuf="%" THEN
    RETURN
 ENDIF
 GenCode
 GOTOQ RunVarLp
RunVars
 DATA "errno: equ ERR"
 DATA " vsect"
 DATA "_DummyArg: ds.l 1"
 DATA "ERR: ds.l 1"
 DATA "_ERRVec: ds.l 1"
 DATA "ModAddr: ds.l 1"
 DATA "XferCount: ds.l 1"
 DATA "_SStr1: ds.l 3"
 DATA "_SStr2: ds.l 3"
 DATA "_Digits: ds.w 1"
 DATA "_Decimals: ds.w 1"
 DATA "_StkSafe: ds.l 1"
 DATA "_ArgSafe0: ds.l 1"
 DATA "_ArgSafe1: ds.l 1"
 DATA "_IOPthNum: ds.w 1"
 DATA "_SafeZone: ds.w 1"
 DATA "_IOBufPtr: ds.l 1"
 DATA "_IOBufVec: ds.l 3"
 DATA "POS: ds.l 1"
 DATA "_PBufVec: ds.l 3"
 DATA "_DataPtr: ds.l 1"
 DATA "_True: ds.b 1"
 DATA "_FileIO: ds.b 1"
 DATA "_ConvBuf: ds.b 22"
 DATA "_CBufVec: ds.l 3"
 DATA "_ConvBuf1: ds.b 22"
 DATA "_CBuf1Vec: ds.l 3"
 DATA "_NullStr: ds.w 1"
 DATA " ends"
 DATA "%"

ParseOpt
 INC OptNdx
 Opt=MID$(TempStr,OptNdx,1)
 RETURN
 
CallErr
 INC LabelNum
 OutBuf=" bcc.s _Lbl"+STR$(LabelNum)
 GenCode
 OutBuf=" move.l _StkSafe(a6),a7"
 GenCode
 OutBuf=" suba a5,a5"
 GenCode
 OutBuf=" link a5,#0"
 GenCode
 OutBuf=" move.w d1,ERR+2(a6)"
 GenCode
 OutBuf=" move.l _ERRVec(a6),a2"
 GenCode
 OutBuf=" jmp(a2)"
 GenCode
 OutBuf="_Lbl"+STR$(LabelNum)
 GenCode
 RETURN

GenXfrCnt
 OutBuf=" move.l d1,XferCount(a6)"
 GenCode
 RETURN

ClrERR
 OutBuf=" clr.l ERR(a6)"
 GenCode
 RETURN
 
GetAccMod AccMode=0
lbl6412 GOSUB NexToken
 IF TokenLen<>0 THEN
    IF TokenBuf="+" THEN
        GOTOQ lbl6412
    ENDIF
    IF TokenBuf="update" THEN
        AccMode=LOR($03,AccMode)
        GOTOQ lbl6412
    ENDIF
    IF TokenBuf="read" THEN
        AccMode=LOR($01,AccMode)
        GOTOQ lbl6412
    ENDIF
    IF TokenBuf="write" THEN
        AccMode=LOR($02,AccMode)
        GOTOQ lbl6412
    ENDIF
    IF TokenBuf="exec" THEN
        AccMode=LOR($04,AccMode)
        GOTOQ lbl6412
    ENDIF
    IF TokenBuf="dir" THEN
        AccMode=LOR($80,AccMode)
        GOTOQ lbl6412
    ENDIF
    ErrNo=ErrSyntax
    RETURN
 ENDIF
 IF AccMode=0 THEN
    ErrNo=ErrSyntax
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
 GOSUB NexToken
 IF TokenBuf="#" THEN
    DevFlag=$ff
 ELSE
    GOSUB UnDoToken
 ENDIF
 RETURN
 
GetPNum
 GOSUB ClrERR
 GOSUB NexToken
 IF TokenBuf<>"#" THEN
    ErrNo=ErrSyntax
    RETURN
 ENDIF
GetPNum1 GOSUB GetExp
 ErrRet
 GOSUB ProcExp
 ErrRet
GetPNum2 GOSUB ClassOp
 IF OpClass<>INTClass THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 IF Target=0 THEN
    IF TSymName<>"~" THEN
        ByteSize=$ff
        D0Loaded=0
        GOSUB LoadReg
        ErrRet
        OutBuf=" and.l #$ff,d0"
        GenCode
    ENDIF
    IF FileStat=0 AND DiskIO=0 THEN
        OutBuf=" move.w d0,_IOPthNum(a6)"
        GenCode
    ENDIF
 ELSE
    IF DMConst=$ff THEN
        ErrNo=ErrIVExp
        RETURN
    ENDIF
    PathVar=TSymName
    PathType=TDataType
 ENDIF
* The following code makes the "," following the device name
* acceptable but not mandatory
 IF FileStat=0 THEN
    GOSUB NexToken
    IF TokenBuf<>"," THEN
        GOSUB UnDoToken
    ENDIF
 ENDIF
 RETURN
 
GetPthNam
 GOSUB Expr
 ErrRet
 IF TDataType<>STRING THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 OutBuf=" lea "+TSymName+"(a6),a1"
 GenCode
 OutBuf=" lea _IOBufVec(a6),a0"
 GenCode
 GenJsr _MovStr
 RETURN

BufRW
 BufRWFlg=$ff
 DiskIO=$ff
 GOSUB GetPNum
 ErrRet
 OutBuf=" move.w d0,_IOPthNum(a6)"
 GenCode
 GOSUB Expr\ get address
 ErrRet
 IF OpClass<>INTClass THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 IF TSymName<>"~" THEN
    D0Loaded=0
    GOSUB LoadReg
    ErrRet
 ENDIF
 OutBuf=" move.l d0,-(sp)"
 GenCode
 GOSUB NexToken
 IF TokenBuf<>"," THEN
    ErrNo=ErrSyntax
    RETURN
 ENDIF
 GOSUB Expr\ get number of bytes
 ErrRet
 IF OpClass<>INTClass THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 IF TSymName<>"~" THEN
    D0Loaded=0
    GOSUB LoadReg
    ErrRet
 ENDIF
 OutBuf=" move.l d0,d1"
 GenCode
 OutBuf=" move.l (sp)+,a0"
 GenCode
 OutBuf=" move.w _IOPthNum(a6),d0"
 GenCode
 RETURN
 
GetPut
 DiskIO=$ff
 GOSUB GetPNum
 ErrRet
 OutBuf=" move.w d0,_IOPthNum(a6)"
 GenCode
 GOSUB Expr
 ErrRet
 IF DMConst=$ff OR DMReg=$ff THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 IF DMVector=0 THEN
    GOSUB GetBase
 ENDIF
 IF DMVector=$ff AND DMTemp=0 THEN
    GOSUB GetBase
 ENDIF
 OutBuf=" move.l #"+STR$(SymTemp.DataSize)+",d1"
 GenCode
 OutBuf=" move.w _IOPthNum(a6),d0"
 GenCode
 RETURN
 
ReadWrite
 DiskIO=$ff
 GOSUB GetPNum
 ErrRet
 GOSUB Expr
 ErrRet
 IF TDataType<>STRING THEN
    ErrNo=ErrTypMis
 ENDIF
 OutBuf=" move.l #"+STR$(SymTemp.Detail)+",d1"
 GenCode
 RETURN
 
GetRegPrm
 SymTemp=SymTable(ExpTable(ExpNdx))
GetRP1
 TDataType=SymTemp.DataType
 TDataMod=SymTemp.DataMod
 IF LAND(SymTemp.DataMod,AddrBit)<>AddrBit THEN
    IF TDataType<1 OR TDataType>5 THEN
        ErrNo=ErrIVExp
        RETURN
    ENDIF
 ENDIF
 IF TDataType=BOOLEAN OR TDataType=BYTE THEN
    DataWidth=".b "
 ENDIF
 IF TDataType=SHORT THEN
    DataWidth=".w "
 ENDIF
 IF TDataType=LONG OR TDataType=FLOAT THEN
    DataWidth=".l "
 ENDIF
 IF LAND(AddrBit,TDataMod)=AddrBit THEN
    DataWidth=".l "
 ENDIF
 IF LAND(RemoteBit,TDataMod)=0 THEN
    DMRemote=0
 ELSE
    DMRemote=$ff
 ENDIF
 IF TDataMod=RegBit THEN
    DMReg=$ff
 ENDIF
 IF D0Loaded=0 THEN
    Reg1Name="d0"
    Reg2Name="d1"
 ELSE
    Reg1Name="d2"
    Reg2Name="d3"
 ENDIF
 RETURN

SplitFlt
 LoFltStr=""
 FOR Ctr2=2 TO LEN(FloatName)
    EXITIF MID$(FloatName,Ctr2,1)="$"
 NEXT Ctr2
 HiFltStr=LEFT$(FloatName,Ctr2-1)
 FOR Ctr2=Ctr2 TO 28
    LoFltStr=LoFltStr+MID$(FloatName,Ctr2,1)
 NEXT Ctr2
 RETURN
 
GetDataWd
 IF Op1Type=1 OR Op1Type=2 THEN
    DataWidth=".b "
 ENDIF
 IF Op1Type=3 THEN
    DataWidth=".w "
 ENDIF
 IF Op1Type=4 OR Op1Type=5 OR LAND(Op1Mod,AddrBit)=AddrBit THEN
    DataWidth=".l "
 ENDIF
 RETURN
 
LoadReg
 IF Promote=$ff OR Demote=$ff THEN
    GOSUB SymSrch
    SymTemp=SymTable(SymNdx)
    GOSUB GetRP1
 ELSE
    GOSUB GetRegPrm
 ENDIF
 ErrRet
 IF TDataType=FLOAT THEN
    IF Reg1Name="d0" THEN
        D0Float=$ff
    ELSE
        D1Float=$ff
    ENDIF
 ENDIF
 IF TDataType=BYTE OR TDataType=SHORT THEN
    IF ByteSize=0 AND WordSize=0 THEN
        IF LAND(AddrBit,SymTemp.DataMod)=0 THEN
            OutBuf=" clr.l "+Reg1Name
            GenCode
        ENDIF
    ENDIF
 ENDIF
 IF LAND(ConstBit,SymTemp.DataMod)=ConstBit THEN
    IF TDataType=FLOAT THEN
        FloatName=SymTemp.SymName
        GOSUB SplitFlt
        OutBuf=" move.l #"+HiFltStr+","+Reg1Name
        GenCode
        OutBuf=" move.l #"+LoFltStr+","+Reg2Name
        GenCode
    ELSE
        IF TDataType=BOOLEAN THEN
            OutBuf=" move.b #"+STR$(SymTemp.Detail)+","+Reg1Name
            GenCode
        ELSE
            OutBuf=" move"+DataWidth+"#"+SymTemp.SymName+","+Reg1Name
            GenCode
        ENDIF
    ENDIF
 ELSE
    IF DMReg=$ff THEN
        OutBuf=" move"+DataWidth+"d"+STR$(SymTemp.Detail)+","+Reg1Name
        GenCode
    ELSE
        IF LAND(VectorBit,SymTemp.DataMod)=0 THEN
            IF DMRemote=0 THEN
                LoadFlag=$ff
                OutBuf=" move"+DataWidth+SymTemp.SymName+"(a6),"+Reg1Name
                GenCode
                IF SymTemp.DataType=FLOAT AND LAND(TDataMod,AddrBit)=0 THEN
                    OutBuf=" move.l "+SymTemp.SymName+"+4(a6),"+Reg2Name
                    GenCode
                ENDIF
            ELSE
                OutBuf=" move.l #"+SymTemp.SymName+",d7"
                GenCode
                OutBuf=" move"+DataWidth+"(a6,d7.l),"+Reg1Name
                GenCode
                IF SymTemp.DataType=FLOAT AND LAND(TDataMod,AddrBit)=0 THEN
                    OutBuf=" move.l 4(a6,d7.l),"+Reg2Name
                    GenCode
                ENDIF
            ENDIF
        ELSE
            OutBuf=" move.l "+SymTemp.SymName+"(a6),a2"
            GenCode
            OutBuf=" move"+DataWidth+"(a2),"+Reg1Name
            GenCode
            IF SymTemp.DataType=FLOAT AND LAND(TDataMod,AddrBit)=0 THEN
                OutBuf=" move.l 4(a2),"+Reg2Name
                GenCode
            ENDIF
        ENDIF
    ENDIF
 ENDIF
 D0Loaded=$ff
 RETURN
 
StoreD0
 SymTemp.SymName=Op1Name
 GOSUB SymSrch
 SymTemp=SymTable(SymNdx)
StoreD01
 GOSUB GetRP1
 IF DMReg=$ff THEN
    OutBuf=" move"+DataWidth+"d0,d"+STR$(SymTemp.Detail)
 ELSE
    IF LAND(VectorBit,SymTemp.DataMod)=0 THEN
        IF DMRemote=0 THEN
            OutBuf=" move"+DataWidth+"d0,"+SymTemp.SymName+"(a6)"
            IF SymTemp.DataType=FLOAT AND LAND(TDataMod,AddrBit)=0 THEN
                GenCode
                OutBuf=" move.l d1,"+SymTemp.SymName+"+4(a6)"
            ENDIF
        ELSE
            OutBuf=" move.l #"+SymTemp.SymName+",d7"
            GenCode
            OutBuf=" move"+DataWidth+"d0,(a6,d7.l)"
            IF SymTemp.DataType=FLOAT AND LAND(TDataMod,AddrBit)=0 THEN
                GenCode
                OutBuf=" move.l d1,4(a6,d7.l)"
            ENDIF
        ENDIF
    ELSE
        OutBuf=" move.l "+SymTemp.SymName+"(a6),a3"
        GenCode
        OutBuf=" move"+DataWidth+"d0,(a3)"
        IF SymTemp.DataType=FLOAT AND LAND(TDataMod,AddrBit)=0 THEN
            GenCode
            OutBuf=" move.l d1,4(a3)"
        ENDIF
    ENDIF
 ENDIF
 GenCode
 RETURN

GetIntTmp
 OpClass=INTClass
* fall thru to GetTmp
 
GetTmp
 IF TmpUse=15 THEN
    ErrNo=ErrTmpUse
    RETURN
 ENDIF
 INC TmpUse
 IF TmpUse>TmpMax THEN
    TmpMax=TmpUse
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
 
GetStrVec
 IF TmpVecUse=15 THEN
    ErrNo=ErrTmpUse
    RETURN
 ENDIF
 INC TmpVecUse
 IF TmpVecUse>StrTmpMax THEN
    StrTmpMax=TmpVecUse
 ENDIF
 IF TmpVecUse>TmpVecMax THEN
    TmpVecMax=TmpVecUse
 ENDIF
 SymTemp.SymName="_TmpVec"+STR$(TmpVecUse)
 GOSUB SymSrch
 SymTable(SymNdx).DataMod=TmpVec
 SymTable(SymNdx).DataType=STRING
 SymTable(SymNdx).Detail=22
 TempInt=22
 SymTable(SymNdx).DataAddr=0
 SymTable(SymNdx).DataSize=22
 OutBuf=" lea _StrTmp"+STR$(TmpVecUse)+"(a6),a0"
 GenCode
6536 OutBuf=" move.l a0,"+SymTemp.SymName+"(a6)"
 GenCode
 OutBuf=" move.l #"+STR$(TempInt)+","+SymTemp.SymName+"+4(a6)"
 GenCode
 OutBuf=" clr.l "+SymTemp.SymName+"+8(a6)"
 GenCode
 RETURN
 
GetTmpVec
 IF TmpVecUse=15 THEN
    ErrNo=ErrTmpUse
    RETURN
 ENDIF
 INC TmpVecUse
 IF TmpVecUse>TmpVecMax THEN
    TmpVecMax=TmpVecUse
 ENDIF
 SymTemp.SymName="_TmpVec"+STR$(TmpVecUse)
 GOSUB SymSrch
 SymNdxSaf=SymNdx
 SymTable(SymNdx).DataMod=TmpVec
 SymTable(SymNdx).DataMod=LOR(TDataMod,SymTable(SymNdx).DataMod)
 SymTable(SymNdx).DataType=TDataType
 SymTable(SymNdx).Detail=TDetail
 SymTable(SymNdx).DataAddr=TDataAddr
 SymTable(SymNdx).DataSize=TDataSize
 RETURN

MakTmpVec
 GOSUB GetTmpVec
 ErrRet
 ExpTable(ExpNdx)=SymNdx
 OutBuf=" move.l "+TSymName+"(a6),"+SymTable(SymNdx).SymName+"(a6)"
 GenCode
 OutBuf=" move.l "+TSymName+"+4(a6),"+SymTable(SymNdx).SymName+"+4(a6)"
 GenCode
 OutBuf=" move.l "+TSymName+"+8(a6),"+SymTable(SymNdx).SymName+"+8(a6)"
 GenCode
 GOSUB ClassOp
 RETURN
 
Vectorize
 GOSUB GetTmpVec
 ErrRet
 GOSUB GetBase
 ExpTable(ExpNdx)=SymNdx
 IF DiskIO=0 THEN
    OutBuf=" move.l a0,"+SymTemp.SymName+"(a6)"
    GenCode
 ENDIF
 RETURN
 
GetLopVec
 LopVarNdx=0
GetLV1
 INC LopVarNdx
 IF LopVarNdx=51 THEN
    ErrNo=ErrTmpUse
    RETURN
 ENDIF
 IF LoopVars(LopVarNdx)=CS(CSP).LoopName THEN GetLV2
 IF LoopVars(LopVarNdx)<>"%" THEN GetLV1
 LoopVars(LopVarNdx)=CS(CSP).LoopName
 LopVecMax=LopVarNdx
GetLV2
*SymTemp.SymName="_LopVec"+STR$(LopVarNdx)
*GOSUB SymSrch
*SymTable(SymNdx)=SymTable(SymNdxSaf)
 RETURN

And
 IF TDataType=FLOAT THEN
    ErrNo=ErrTypMis
 ENDIF
 OutBuf=" and.l d2,d0"
 GenCode
 RETURN

Or
 IF TDataType=FLOAT THEN
    ErrNo=ErrTypMis
 ENDIF
 OutBuf=" or.l d2,d0"
 GenCode
 RETURN
 
Add
 GOSUBQ ChkFloat
 IF D0Float=0 THEN
    OutBuf=" add.l d2,d0"
 ELSE
    OutBuf=MathCall+"T$DAdd"
 ENDIF
 GenCode
 RETURN
 
Sub
 GOSUBQ ChkFloat
 IF D0Float=0 THEN
    OutBuf=" sub.l d2,d0"
 ELSE
    OutBuf=MathCall+"T$DSub"
 ENDIF
 GenCode
 RETURN
 
Mul
 GOSUBQ ChkFloat
 IF D0Float=0 THEN
    OutBuf=" move.l d2,d1"
    GenCode
    OutBuf=MathCall+"T$LMul"
 ELSE
    OutBuf=MathCall+"T$DMul"
 ENDIF
 GenCode
 RETURN
 
Div
 GOSUBQ ChkFloat
 IF D0Float=0 THEN
    OutBuf=" move.l d2,d1"
    GenCode
    OutBuf=MathCall+"T$LDiv"
 ELSE
    OutBuf=MathCall+"T$DDiv"
 ENDIF
 GenCode
 RETURN

ChkFloat
 IF D0Float=0 AND D1Float=0 THEN
    RETURN
 ENDIF
 IF D0Float=$ff AND D1Float=$ff THEN
    RETURN
 ENDIF
 IF D0Float=0 THEN
    OutBuf=MathCall+"T$LtoD"
    GenCode
    D0Float=$ff
 ELSE
    OutBuf=" exg d0,d2"
    GenCode
    OutBuf=" exg d1,d3"
    GenCode
    OutBuf=MathCall+"T$LtoD"
    GenCode
    OutBuf=" exg d0,d2"
    GenCode
    OutBuf=" exg d1,d3"
    GenCode
    D1Float=$ff
 ENDIF
 TDataType=FLOAT
 TDataSize=8
 RETURN
 
CmpNum
 D0Loaded=0
 Promote=$ff
 IF Op1Class=INTClass AND Op2Class=FLTClass OR Op1Class=Op2Class THEN
    SymTemp.SymName=Op1Name
    GOSUB LoadReg
    SymTemp.SymName=Op2Name
    GOSUB LoadReg
    IF Op1Class=INTClass AND Op2Class=FLTClass THEN
        OutBuf=MathCall+"T$LtoD"
        GenCode
        Op1Type=FLOAT
        Op1Class=FLTClass
    ENDIF
 ELSE
    IF Op1Class=FLTClass AND Op2Class=INTClass THEN
        SymTemp.SymName=Op2Name
        GOSUB LoadReg
        OutBuf=MathCall+"T$LtoD"
        GenCode
        OutBuf=" move.l d0,d2"
        GenCode
        OutBuf=" move.l d1,d3"
        GenCode
        D0Loaded=0
        SymTemp.SymName=Op1Name
        GOSUB LoadReg
        Op2Type=FLOAT
        Op2Class=FLTClass
    ENDIF
 ENDIF
 IF Op1Class<>Op2Class THEN
    ErrNo=ErrIVExp
    RETURN
 ENDIF
 IF Op1Class=INTClass THEN
    OutBuf=" cmp.l d2,d0"
    GenCode
 ELSE
    OutBuf=MathCall+"T$DCmp"
    GenCode
 ENDIF
 RETURN
 
PromInt
 IF Op2Name<>"~" THEN
    Promote=$ff
    SymTemp.SymName=Op2Name
    GOSUB SymSrch
    GOSUB LoadReg
    TSymName="~"
    Op2Name="~"
    Op2Type=FLOAT
    Op2Class=FLTClass
 ENDIF
 OutBuf=MathCall+"T$LtoD"
 GenCode
 RETURN
 
DemoteInt
 IF Op2Name<>"~" THEN
    Demote=$ff
    SymTemp.SymName=Op2Name
    GOSUB SymSrch
    GOSUB LoadReg
    TSymName="~"
    Op2Name="~"
    Op2Type=LONG
    Op2Class=INTClass
 ENDIF
 OutBuf=MathCall+"T$DtoL"
 GenCode
 RETURN
 
CmpString
 OutBuf=" lea "+Op1Name+"(a6),a0"
 GenCode
 OutBuf=" lea "+Op2Name+"(a6),a1"
 GenCode
 GenJsr _CmpStr
 RETURN
 
CmpBool
 ByteSize=$ff
 Promote=$ff
 SymTemp.SymName=Op1Name
 GOSUB LoadReg
 SymTemp.SymName=Op2Name
 GOSUB LoadReg
 OutBuf=" cmp.b d2,d0"
 GenCode
 RETURN
 
SETDx
 SetMask=0
SETDx1
 UMFlag=0
 GOSUB TokenSym
 ErrMain
 IF SymFound=0 THEN
    SymTemp.DataType=COMPVAR
    GOSUB ClrSym1
    GOSUB SymInsert
    ErrMain
 ELSE
    IF SymTable(SymNdx).DataType<>COMPVAR AND SymTable(SymNdx).DataType<> MACRO THEN
        ErrNo=ErrTypMis
        GOTO MainLoop
    ENDIF
    IF LAND(SymTable(SymNdx).DataMod,$80)<>0 THEN MainLoop
 ENDIF
 SymNdxSaf=SymNdx
 GOSUB NexToken
 IF TokenBuf<>"=" THEN
    ErrNo=ErrSyntax
    GOTO MainLoop
 ENDIF
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
    GOTOQ SetOp1
 ENDIF
 IF TokenType=TTypHex THEN
    GOSUB ValidHex
    IF HexOK=0 THEN
        ErrNo=ErrIVExp
        GOTO MainLoop
    ENDIF
    GOTOQ SetOp1
 ENDIF
 IF TokenType=TTypSym THEN
    GOSUB TokenSym1
    ErrMain
    IF SymFound=0 THEN
        ErrNo=ErrUDSym
        GOTO MainLoop
    ENDIF
    TokenSaf=STR$(SymTable(SymNdx).Detail)
    GOTOQ SetOp1
 ENDIF
 ErrNo=ErrIVExp
 GOTO MainLoop
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
 GOSUB NexToken
 IF TokenLen=0 THEN SetFinish
 IF TokenBuf="<" THEN
    GOSUB NexToken
    IF TokenBuf<>"<" THEN
        ErrNo=ErrIVExp
        GOTO MainLoop
    ENDIF
    TokenType=TTypMath
 ENDIF
 IF TokenBuf=">>" THEN
    TokenType=TTypMath
 ENDIF
 IF TokenType<>TTypMath THEN
    ErrNo=ErrIVExp
    GOTO MainLoop
 ENDIF
 CVOp=TokenBuf
 GOSUB NexToken
 IF TokenType=TTypInt THEN
    GOSUB ValidInt
    IF IntOK=0 THEN
        ErrNo=ErrIVExp
        GOTO MainLoop
    ENDIF
    GOTOQ SetOperator
 ENDIF
 IF TokenType=TTypHex THEN
    GOSUB ValidHex
    IF HexOK=0 THEN
        ErrNo=ErrIVExp
        GOTO MainLoop
    ENDIF
    GOTOQ SetOperator
 ENDIF
 IF TokenType=TTypSym THEN
    GOSUB TokenSym1
    ErrMain
    IF SymFound=0 THEN
        ErrNo=ErrUDSym
        GOTO MainLoop
    ENDIF
    TokenSaf=STR$(SymTable(SymNdx).Detail)
    GOTOQ SetOperator
 ENDIF
 ErrNo=ErrIVExp
 GOTO MainLoop
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
******** The folowing code assumes that CVTemp is NOT REMOTE ********
 IF CVOp="<" OR CVOp=">>" THEN
    CVTemp=SymTable(SymNdx).Detail
    TempInt=VAL(TokenSaf)
    move.l TempInt(a6),d0
    move.l CVTemp(a6),d1
    move.l CVOp(a6),a2
    cmpi.b #'<',(a2)
    bne.s ShiftRight
    lsl.l d0,d1
    bra.s ShiftDone
ShiftRight
    lsr.l d0,d1
ShiftDone
    move.l d1,CVTemp(a6)
 ENDIF
SetFinish
 SymNdx=SymNdxSaf
 SymTable(SymNdx).Detail=CVTemp
 SymTable(SymNdx).DataMod=SetMask
 OutBuf=SymTable(SymNdx).SymName+" set "+STR$(CVTemp)
 GenCode
 IF SymTable(SymNdx).SymName="_BufSize" THEN
    IF CVTemp<>XBufSize THEN
        VarBytes=VarBytes+CVTemp*2-XBufSize*2
        XBufSize=CVTemp
    ENDIF
 ENDIF
 GOTO MainLoop
 
MACRODx
 GOSUB NexToken
 IF TokenType<>5 THEN\ symbol
    ErrNo=ErrSyntax\ syntax error
    GOTO MainLoop
 ENDIF
 SymTemp.SymName=TokenSaf
 GOSUB SymSrch
 IF SymFound=$ff THEN
    ErrNo=ErrDupSym\ symbol already defined
    GOTO MainLoop
 ENDIF
 SymTemp.DataType=MACRO
 GOSUB ClrSym1
 SymTemp.DataAddr=MacDefNdx\ address of macro in macro buffer
 GOSUB SymInsert
 ErrMain
* read a line of source code
MacLp 
 SrcLine=""
 IF InpFilPtr=1 THEN
    INC LineCtr
 ENDIF
MacLp1
 IF EOF(#InpFile(InpFilPtr)) THEN
    PRINT "FATAL ERROR EOF in MACRO"
    END
 ENDIF
 GET #InpFile(InpFilPtr),RawData
 IF ASC(RawData)=$0d THEN MacLpExit
 SrcLine=SrcLine+RawData
 GOTOQ MacLp1
MacLpExit
 IF MID$(SrcLine,1,1)="#" THEN
    SrcNdx=1
    GOSUB NexToken
    IF TokenBuf="macro" THEN
        ErrNo=ErrMacNst\ nested macro
        GOTO MainLoop
    ENDIF
    IF TokenBuf="endm" THEN
        MacBuf(MacDefNdx)=0
        GOSUB MacDefInc
        GOTO MainLoop
    ENDIF
 ENDIF
 SrcNdx=0
lbl7027 INC SrcNdx
 IF SrcNdx>LEN(SrcLine) THEN
    MacBuf(MacDefNdx)=$0d
    GOSUB MacDefInc
    ErrMain
    GOTOQ MacLp
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
        GOTOQ lbl7027
    ENDIF
    ErrNo=ErrIVMac
    GOTO MainLoop
 ENDIF
 TempByte=MID$(SrcLine,SrcNdx,1)
 AsciiByte=ASC(TempByte)
 MacBuf(MacDefNdx)=AsciiByte
 GOSUB MacDefInc
 ErrMain
 GOTOQ lbl7027
MacDefInc
 INC MacDefNdx
 IF MacDefNdx>MacBufSiz THEN
    DEC MacDefNdx
    ErrNo=ErrMacBuf
 ENDIF
 RETURN
 
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
 GOSUB NexToken
 CondOp1=SymTable(SymNdx).Detail
 IF TokenBuf<>"=" THEN
    ErrNo=ErrSyntax
    GOTO MainLoop
 ENDIF
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
    GOTOQ IFDx1
 ENDIF
 IF TokenType=TTypHex THEN
    GOSUB ValidHex
    IF HexOK=0 THEN
        ErrNo=ErrIVExp
        GOTO MainLoop
    ENDIF
    GOTOQ IFDx1
 ENDIF
 IF TokenType=TTypSym THEN
    GOSUB TokenSym1
    ErrMain
    IF SymFound=0 THEN
        ErrNo=ErrUDSym
        GOTO MainLoop
    ENDIF
    TokenSaf=STR$(SymTable(SymNdx).Detail)
    GOTOQ IFDx1
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
    PRINT "FATAL ERROR Conditional stack error"
    END
 ENDIF
 IF GenFlag(GFNdx-1)=$ff THEN
    GenFlag(GFNdx)=LNOT(GenFlag(GFNdx))
 ENDIF
 GOTO MainLoop
 
ENDIFDx
 DEC GFNdx
 IF GFNdx=0 THEN
    PRINT "FATAL ERROR Conditional stack error"
    END
 ENDIF
 CondValid=GenFlag(GFNdx)
 GOTO MainLoop
 
USEDx
 UseFilNam=""
UseLoop
 GOSUB NexToken
 IF TokenLen=0 THEN USEDx1
 UseFilNam=UseFilNam+TokenSaf
 GOTOQ UseLoop
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
 FcnPtrFlg=0
 GOSUB TokenSym
 ErrMain
 IF SymFound=$ff THEN
    ErrNo=ErrDupSym
    ErrMain
 ENDIF
 GOSUB ClrSym1
 SymTemp.DataType=FCN
 SymTemp.DataMod=0
 GOSUB NexToken
 IF TokenBuf<>"(" THEN
    ErrNo=ErrSyntax
    ErrMain
 ENDIF
 GOSUB NexToken
 IF TokenBuf<"1" OR TokenBuf>"9" THEN
    IF TokenBuf="c" OR TokenBuf="C" THEN
        TokenBuf="10"
    ELSE
        ErrNo=ErrSyntax
        ErrMain
    ENDIF
 ENDIF
 SymTemp.Detail=VAL(TokenBuf)+1000
 GOSUB NexToken
 IF TokenBuf<>")" THEN
    ErrNo=ErrSyntax
    ErrMain
 ENDIF
 SymTemp.DataSize=1\ default for int
FcnLoop
 GOSUB NexToken
 IF TokenLen=0 THEN FcnBuild
 IF TokenBuf="void" THEN
    SymTemp.DataSize=0
 GOTOQ FcnLoop
 ENDIF
 IF TokenBuf="int" THEN
    SymTemp.DataSize=1
 GOTOQ FcnLoop
 ENDIF
 IF TokenBuf="float" THEN
    SymTemp.DataSize=2
 GOTOQ FcnLoop
 ENDIF
 IF TokenBuf="pointer" THEN
    BITSET(FcnPtrFlg,0)
 GOTOQ FcnLoop
 ENDIF
 IF TokenBuf="global" THEN
    BITSET(FcnPtrFlg,1)
 GOTOQ FcnLoop
 ENDIF
 IF TokenBuf="external" THEN
    BITSET(FcnPtrFlg,2)
 GOTOQ FcnLoop
 ENDIF
FcnSyntax
 ErrNo=ErrSyntax
 GOTO MainLoop
FcnBuild
 IF FcnPtrFlg<>0 THEN
    IF MOD(FcnPtrFlg,2)=0 THEN FcnSyntax
    SymTemp.DataSize=LOR(SymTemp.DataSize,$00000004)
    IF FcnPtrFlg<4 THEN
        OutBuf=" vsect"
        GenCode
        OutBuf=SymTemp.SymName
        IF BITTST(FcnPtrFlg,1) THEN
            OutBuf=OutBuf+":"
        ENDIF
        OutBuf=OutBuf+" ds.l 1"
        GenCode
        OutBuf=" ends"
        GenCode
        VarBytes=VarBytes+4
    ENDIF
 ENDIF
 GOSUB SymInsert
 GOTO MainLoop
 
FIXDx
 SetMask=$80
 GOTOQ SETDx1

ROFDx
 ROFList=ROFList+" "+MID$(SrcLine,5,LEN(SrcLine)-4)
 GOTO MainLoop

LIBDx
 LibList=LibList+MID$(SrcLine,5,LEN(SrcLine)-4)
 GOTO MainLoop

STRUCTDx
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
 SymTemp.DataType=STRUCT
 GOSUB ClrSym1
 GOSUB SymInsert
 ErrMain
StructLp
 TDataMod=0
 DimStrFlg=0
 SrcNdx=0
 IF InpFilPtr=1 THEN
    INC LineCtr
 ENDIF
 SrcLine=""
StructLp1
 IF EOF(#InpFile(InpFilPtr)) THEN
    PRINT "Fatal Error: EOF in STRUCT"
    END
 ENDIF
 GET #InpFile(InpFilPtr),RawData
 IF ASC(RawData)=$0d THEN StructLp2
 SrcLine=SrcLine+RawData
 GOTOQ StructLp1
StructLp2
 IF LEFT$(SrcLine,1)="*" THEN StructLp
 IF LEFT$(SrcLine,1)="#" THEN
    INC SrcNdx
    GOSUB NexToken
    IF TokenBuf="endstruct" THEN StructEnd
    PRINT "Fatal Error: directive in structure"
    END
 ENDIF
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
 GOTOQ StructLp
StructEnd
 IF MOD(TypeBytes,2)=1 THEN
    INC TypeBytes\ for arrays on 68000
 ENDIF
 SymTable(TypePtr).DataSize=TypeBytes
 SymTable(TypePtr).Detail=TypeVars
 GOTO MainLoop

ENDSTRUCTDx
 ErrNo=ErrEndStr
 GOTO MainLoop

S1
* DATA
 NeedComma=0
DATALoop
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
    GOTOQ DATALoop
 ENDIF
 IF TokenType=TTypQuote THEN
    OutBuf=" dc.b "+TokenSaf+",0"
    GenCode
    OutBuf=" align"
    GenCode
    GOTOQ NextData
 ENDIF
 IF TokenType=TTypInt THEN
    GOSUB ValidInt
    IF IntOK=0 THEN
        ErrNo=ErrIVExp
        GOTO MainLoop
    ENDIF
    OutBuf=" dc.l "+TokenSaf
    GenCode
    GOTOQ NextData
 ENDIF
 IF TokenType=TTypHex THEN
    GOSUB ValidHex
    IF HexOK=0 THEN
        ErrNo=ErrIVExp
        GOTO MainLoop
    ENDIF
    OutBuf=" dc.l "+TokenSaf
    GenCode
    GOTOQ NextData
 ENDIF
 IF TokenType=TTypFloat THEN
    GOSUB ValidFlt
    IF FloatOK=0 THEN
        ErrNo=ErrIVExp
        GOTO MainLoop
    ENDIF
    move.l TokenBuf(a6),a0
    tcall T$Math,T$AtoD
    move.l d1,-(sp)
    move.l d0,Konstant(a6)
    OutBuf=" dc.l "+Hex$(Konstant)
    GenCode
    move.l (sp)+,Konstant(a6)
    OutBuf=" dc.l "+Hex$(Konstant)
    GenCode
    GOTOQ NextData
 ENDIF
 IF TokenType=TTypSym THEN
    IF TokenBuf="true" OR TokenBuf="false" THEN
        IF TokenBuf="true" THEN
            OutBuf=" dc.b $ff"
        ELSE
            OutBuf=" dc.b 0"
        ENDIF
        GenCode
        OutBuf=" align"
        GenCode
        GOTOQ NextData
    ENDIF
    GOSUB TokenSym1
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
    OutBuf=" dc.l "+Hex$(Konstant)
    GenCode
    GOTOQ NextData
 ENDIF
 ErrNo=ErrSyntax
NextData
 NeedComma=$ff
 GOTOQ DATALoop
 
S2
* RESTORE
 LNFlag=$ff
 GOSUB TokenSym
 ErrMain
 IF SymFound=0 THEN
    SymTemp.DataType=LABEL
    GOSUB ClrSym1
    SymTemp.Detail=$ff
    SymTemp.DataMod=0
    GOSUB SymInsert
    ErrMain
 ENDIF
 IF SymTable(SymNdx).DataType<>7 THEN
    ErrNo=ErrTypMis
    GOTO MainLoop
 ENDIF
 IF ProgSize=$ff THEN
    OutBuf=" move.l #"+SymTemp.SymName+"-*-8,a0"
    GenCode
    OutBuf=" lea (pc,a0.l),a0"
 ELSE
    OutBuf=" lea "+SymTemp.SymName+"(pc),a0"
 ENDIF
 GenCode
 OutBuf=" move.l a0,_DataPtr(a6)"
 GenCode
 GOTO MainLoop
 
S3
* POKE
 GOSUB Expr\ get address
 ErrMain
 IF OpClass<>INTClass THEN
    ErrNo=ErrTypMis
    GOTO MainLoop
 ENDIF
 IF SymTemp.SymName<>"~" THEN
    D0Loaded=0
    GOSUB LoadReg
    ErrMain
 ENDIF
 OutBuf=" move.l d0,-(sp)"
 GenCode
 GOSUB NexToken
 IF TokenBuf<>"," THEN
    ErrNo=ErrSyntax
    GOTO MainLoop
 ENDIF
 GOSUB Expr\ get data
 ErrMain
 IF OpClass<>INTClass THEN
    ErrNo=ErrTypMis
    GOTO MainLoop
 ENDIF
 IF TSymName<>"~" THEN
    D0Loaded=0
    GOSUB LoadReg
    ErrMain
 ENDIF
 OutBuf=" move.l (sp)+,a2"
 GenCode
 OutBuf=" move.b d0,(a2)"
 GenCode
 GOTO MainLoop
 
S4
* RETURN
 OutBuf=" rts"
 GenCode
 GOTO MainLoop
 
S5
* SEEK
 DiskIO=$ff
 GOSUB GetPNum
 OutBuf=" move.w d0,_IOPthNum(a6)"
 GenCode
 ErrMain
 GOSUB Expr
 ErrMain
 IF OpClass<>INTClass AND OpClass<>FLTClass THEN
    ErrNo=ErrTypMis
    ErrMain
 ENDIF
 IF TSymName<>"~" THEN
    D0Loaded=0
    GOSUB LoadReg
 ENDIF
 IF OpClass=FLTClass THEN
    OutBuf=MathCall+"T$DtoL"
    GenCode
 ENDIF
 OutBuf=" move.w _IOPthNum(a6),d1"
 GenCode
 OutBuf=" exg d0,d1"
 GenCode
 OutBuf=" os9 I$Seek"
 GenCode
 GOSUB CallErr
 GOTO MainLoop
 
S6
 GOSUB ClrDatTyp
* TYPE
 GOSUB NexToken
 IF NextByte<>"=" THEN
    ErrNo=ErrSyntax
    GOTOQ TYPE2
 ENDIF
 GOSUB TokenSym1
 IF ErrNo<>0 THEN TYPE2
 IF SymFound=$ff THEN
    ErrNo=ErrDupSym
    GOTOQ TYPE2
 ENDIF
 TypeFlag=$ff
 TypePtr=SymNdx
 TypeVars=0
 TypeBytes=0
 SymTemp.DataType=STRUCT
 GOSUB ClrSym1
 GOSUB SymInsert
 IF ErrNo<>0 THEN TYPE2
 GOSUB NexToken
 IF TokenBuf<>"=" THEN
    ErrNo=ErrSyntax
    GOTOQ TYPE2
 ENDIF
TYPE1
 GOSUB DimVar
 IF DimOK=0 THEN TYPE2
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
 IF TokenLen=0 THEN
    IF MOD(TypeBytes,2)=1 THEN
        INC TypeBytes\ for arrays on 68000
    ENDIF
    SymTable(TypePtr).DataSize=TypeBytes
    SymTable(TypePtr).Detail=TypeVars
    GOTOQ TYPE2
 ENDIF
 GOTOQ TYPE1
TYPE2
 GOTO MainLoop
 
S7
* DIM
 GblVarFlg=0
 ExtVarFlg=0
 GOSUB DimVar
 IF DimOK=0 THEN MainLoop
 IF ExtVarFlg=0 THEN
    IF SymTemp.DataSize+VarBytes>$ffff THEN
        DMRemote=$ff
        SymTemp.DataMod=LOR(SymTemp.DataMod,RemoteBit)
    ENDIF
 ENDIF
 GOSUB SymInsert
 ErrMain
 IF ExtVarFlg=$ff THEN MainLoop
 IF VectorFlg=$ff THEN
    IF DMRemote=$ff THEN
        PRINT SrcLine
        PRINT "Fatal Error: Vector in remote data space: in line ";LineCtr
        END
    ENDIF
    VarBytes=VarBytes+12
    OutBuf=" vsect"
    GenCode
    IF GblVarFlg=$ff THEN
        OutBuf=SymTemp.SymName+": ds.l 3"
    ELSE
        OutBuf=SymTemp.SymName+" ds.l 3"
    ENDIF
    GenCode
    OutBuf=" ends"
    GenCode
    GOTO MainLoop
 ENDIF
 IF DTString=$ff AND VarBytes<$ffed AND DMArray+FcnMode+ZeroMode+GblVarFlg=0 THEN
    SymTable(SymNdx).DataMod=LOR(SymTable(SymNdx).DataMod,VectorBit)
    INC StringNum
    OutBuf=" vsect"
    GenCode
    OutBuf=SymTemp.SymName
    OutBuf=OutBuf+" dz.l 1"
    GenCode
    OutBuf=" dc.l "+STR$(SymTemp.Detail)
    GenCode
    OutBuf=" dz.l 1"
    GenCode
    OutBuf=" ends"
    GenCode
    OutBuf=" lea _Str"+STR$(StringNum)+"(a6),a2"
    WRITE #InitFile,OutBuf
    OutBuf=" move.l a2,"+SymTemp.SymName+"(a6)"
    WRITE #InitFile,OutBuf
    SymTemp.SymName="_Str"+STR$(StringNum)
 ENDIF
 IF DMRemote=$ff THEN
    OutBuf=" vsect remote"
 ELSE
    OutBuf=" vsect"
 ENDIF
 GenCode
 IF DTByte=0 AND DTBoolean=0 AND DTString=0 THEN
    IF DMRemote=0 AND MOD(VarBytes,2)=1 THEN
        OutBuf=" align"
        GenCode
        INC VarBytes
    ENDIF
    IF DMRemote=$ff AND MOD(VarBytRem,2)=1 THEN
        OutBuf=" align"
        GenCode
        INC VarBytRem
    ENDIF
 ENDIF
 OutBuf=SymTemp.SymName
 IF GblVarFlg=$ff THEN
    OutBuf=OutBuf+":"
 ENDIF
 OutBuf=OutBuf+SymType
 IF DTString=0 AND DTComplex=0 THEN
    IF TDataType=FLOAT THEN
        ArraySize=ArraySize*2
    ENDIF
    OutBuf=OutBuf+STR$(ArraySize)
 ELSE
    OutBuf=OutBuf+STR$(SymTemp.DataSize)
 ENDIF
 IF DMRemote=0 THEN
    VarBytes=VarBytes+SymTemp.DataSize
 ELSE
    VarBytRem=VarBytRem+SymTemp.DataSize
 ENDIF
 GenCode
 OutBuf=" ends"
 GenCode
 GOTO MainLoop
 
SetFcnPtr
 IF AsmbFlag=$ff THEN
    OutBuf="* "+SrcLine
    GenCode
 ENDIF
 IF LAND(SymTable(SymNdx).DataSize,$00000004)=0 THEN
    ErrNo=ErrTypMis
    GOTO MainLoop
 ENDIF
 Op1Name=SymTable(SymNdx).SymName
 Op1DataSize=SymTable(SymNdx).DataSize
 GOSUB NexToken
 IF TokenBuf<>"=" THEN
    ErrNo=ErrSyntax
    GOTO MainLoop
 ENDIF
 GOSUB NexToken
 SymTemp.SymName=TokenSaf
 GOSUB SymSrch
 IF SymFound=0 THEN
    ErrNo=ErrUDSym
    GOTO MainLoop
 ENDIF
 SymTemp=SymTable(SymNdx)
 IF SymTemp.DataType<>FCN OR LAND(SymTemp.DataSize,$00000004)<>0 OR SymTemp.Detail<1000 THEN
    ErrNo=ErrTypMis
    GOTO MainLoop
 ENDIF
 OutBuf=" lea "+SymTemp.SymName+"(pc),a2"
 GenCode
 OutBuf=" move.l a2,"+Op1Name+"(a6)"
 GenCode
 GOTO MainLoop

S8
* LET
 IF ProcFlag=$ff THEN
    Target=0
 ELSE
    Target=$ff
 ENDIF
 GOSUB Expr
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
 IF Op1Type=1 OR Op1Type=2 THEN
    ByteSize=$ff
 ENDIF
 IF Op1Type=3 THEN
    WordSize=$ff
 ENDIF
 GOSUB NexToken
 IF TokenBuf=":" THEN
    GOSUB NexToken
 ENDIF
 IF TokenBuf<>"=" THEN
    ErrNo=ErrSyntax
    GOTO MainLoop
 ENDIF
 IF Op1Type=LONG THEN
    GOSUB NexToken
    SymTemp.SymName=TokenSaf
    GOSUB SymSrch
    IF SymFound=$ff AND SymTable(SymNdx).DataType=LABEL THEN
        IF ProgSize=$ff THEN
            OutBuf=" move.l #"+SymTable(SymNdx).SymName+"-*-8,a2"
            GenCode
            OutBuf=" lea (pc,a2.l),a2"
        ELSE
            OutBuf=" lea "+SymTable(SymNdx).SymName+"(pc),a2"
        ENDIF
        GenCode
        OutBuf=" move.l a2,d0"
        GenCode
        GOSUB StoreD0
        GOTO MainLoop
    ENDIF
    GOSUB UnDoToken
 ENDIF
 GOSUB GetExp
 ErrMain
 Target=0
 GOSUB ProcExp
 ErrMain
 GOSUB ClassOp
 Op2Name=TSymName
 Op2Class=OpClass
 Op2Type=TDataType
 Op2Mod=TDataMod
 Op2Detail=TDetail
 IF Op2Name="NextArg" THEN ProcCmd
 IF Op1Class<>Op2Class THEN
    IF Op1Class=INTClass AND Op2Class=FLTClass THEN
        GOSUB DemoteInt
    ENDIF
    IF Op1Class=FLTClass AND Op2Class=INTClass THEN
        GOSUB PromInt
    ENDIF
 ENDIF
 IF Op1Class<>Op2Class THEN
    ErrNo=ErrTypMis
    GOTO MainLoop
 ENDIF
 IF Op1Class=INTClass OR Op1Class=FLTClass OR Op1Class=BOOLClass THEN
    IF TSymName<>"~" THEN
        IF LAND(Op1Mod,$7f)=0 AND Op2Mod=ConstBit THEN
            IF Op2Type=FLOAT THEN
                FloatName=Op2Name
                GOSUB SplitFlt
                OutBuf=" move.l #"+HiFltStr+","+Op1Name+"(a6)"
                GenCode
                OutBuf=" move.l #"+LoFltStr+","+Op1Name+"+4(a6)"
                GenCode
                GOTO MainLoop
            ENDIF
            GOSUB GetDataWd
            IF Op2Type=BOOLEAN THEN
                Op2Name=STR$(Op2Detail)
            ENDIF
            IF Op1Mod=0 THEN\ non reg case
                OutBuf=" move"+DataWidth+"#"+Op2Name+","+Op1Name+"(a6)"
            ELSE\ reg case
                OutBuf=" move"+DataWidth+"#"+Op2Name+",d"+STR$(Op1Detail)
            ENDIF
            GenCode
            GOTO MainLoop
        ENDIF
        IF LAND(Op1Mod,$7f)=0 AND LAND(Op2Mod,$7f)=0 AND Op1Type=Op2Type THEN
            GOSUB GetDataWd
            IF Op1Mod=0 And Op2Mod=0 THEN
                OutBuf=" move"+DataWidth+Op2Name+"(a6),"+Op1Name+"(a6)"
                IF Op1Type=FLOAT THEN
                    GenCode
                    OutBuf=" move.l "+Op2Name+"+4(a6),"+Op2Name+"+4(a6)"
                ENDIF
            ENDIF
            IF Op1Mod=RegBit AND Op2Mod=RegBit THEN
                OutBuf=" move"+DataWidth+"d"+STR$(Op2Detail)+",d"+STR$(Op1Detail)
            ENDIF
            IF Op1Mod=RegBit AND Op2Mod=0 THEN
                OutBuf=" move"+DataWidth+Op2Name+"(a6),d"+STR$(Op1Detail)
            ENDIF
            IF Op1Mod=0 AND Op2Mod=RegBit THEN
                OutBuf=" move"+DataWidth+"d"+STR$(Op2Detail)+","+Op1Name+"(a6)"
            ENDIF
            GenCode
            GOTO MainLoop
        ENDIF
        D0Loaded=0
        GOSUB LoadReg
        ErrMain
    ENDIF
    GOSUB StoreD0
    GOTO MainLoop
 ENDIF
 IF Op1Class=STRClass THEN
    OutBuf=" lea "+Op1Name+"(a6),a0"
    GenCode
    OutBuf=" lea "+Op2Name+"(a6),a1"
    GenCode
    GenJsr _MovStr
    GOTO MainLoop
 ENDIF
 IF Op1Class=CPXClass OR Op1Class=ARRClass THEN
    IF LAND(Op1Mod,VectorBit)=0 THEN
        IF LAND(Op1Mod,RemoteBit)=0 THEN
            OutBuf=" lea "+Op1Name+"(a6),a0"
        ELSE
            OutBuf=" move.l #"+Op1Name+",d7"
            GenCode
            OutBuf=" lea (a6,d7.l),a0"
        ENDIF
    ELSE
        OutBuf=" move.l "+Op1Name+"(a6),a0"
    ENDIF
    GenCode
    IF LAND(Op2Mod,VectorBit)=0 THEN
        IF LAND(Op2Mod,RemoteBit)=0 THEN
            OutBuf=" lea "+Op2Name+"(a6),a1"
        ELSE
            OutBuf=" move.l #"+Op2Name+",d7"
            GenCode
            OutBuf=" lea (a6,d7.l),a1"
        ENDIF
    ELSE
        OutBuf=" move.l "+Op2Name+"(a6),a1"
    ENDIF
    GenCode
    INC LoopNum
    IF Op1Class=ARRClass THEN
        OutBuf=" move.l #"+STR$(Op1DataSize)+",d1"
    ELSE
        OutBuf=" move.l #"+STR$(SymTable(Op1Detail).DataSize)+",d1"
    ENDIF
    GenCode
    OutBuf="_Loop"+STR$(LoopNum)+" move.b (a1)+,(a0)+"
    GenCode
    OutBuf=" subq.l #1,d1"
    GenCode
    OutBuf=" bne.s _Loop"+STR$(LoopNum)
    GenCode
    GOTO MainLoop
 ENDIF
 IF Op1Class=BOOLClass THEN
    D0Loaded=0
    GOSUB LoadReg
    ErrMain
    GOSUB StoreD0
    GOTO MainLoop
 ENDIF
 PRINT "Call CDL (314) 236-4373"
 END

ProcCmd
 IF Op1Class<>STRClass THEN
    ErrNo=ErrTypMis
    GOTO MainLoop
 ENDIF
 OutBuf=" lea "+Op1Name+"(a6),a0"
 GenCode
 GenJsr _MovArg
 GOTO MainLoop
 
S9
* FOR
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
 IF DMReg=0 THEN
    CS(CSP).RegVar=0
  ELSE
    CS(CSP).RegVar=TDetail
 ENDIF
 CS(CSP).RemoteVar=DMRemote
 IF TDataType=BYTE THEN
    CS(CSP).ForVarSiz="b"
 ENDIF
 IF TDataType=SHORT THEN
    CS(CSP).ForVarSiz="w"
 ENDIF
 IF TDataType=LONG THEN
    CS(CSP).ForVarSiz="l"
 ENDIF
 GOSUB GetLopVec
 ErrMain
 CS(CSP).LoopVec=LopVarNdx
 CS(CSP).ConType=5
 CS(CSP).ConLine=LineCtr
 ErrMain
 GOSUB NexToken
 IF TokenBuf<>"=" THEN
    ErrNo=ErrSyntax
    GOTO MainLoop
 ENDIF
 GOSUB Expr
 ErrMain
 IF TSymName<>"~" THEN
    D0Loaded=0
    GOSUB LoadReg
    ErrMain
 ENDIF
* set initial value into loop var
 IF CS(CSP).RegVar<>0 THEN
    OutBuf=" move."+CS(CSP).ForVarSiz+" d0,d"+STR$(CS(CSP).RegVar)
    GenCode
 ELSE
    IF CS(CSP).RemoteVar=0 THEN
        OutBuf=" move."+CS(CSP).ForVarSiz+" d0,"+CS(CSP).LoopName+"(a6)"
        GenCode
    ELSE
        OutBuf=" move.l #"+CS(CSP).LoopName+",d7"
        GenCode
        OutBuf=" move."+CS(CSP).ForVarSiz+" d0,(a6,d7.l)"
        GenCode
    ENDIF
 ENDIF
 GOSUB NexToken
 IF TokenBuf<>"to" THEN
    ErrNo=ErrSyntax
    GOTO MainLoop
 ENDIF
 GOSUB Expr
 ErrMain
 CS(CSP).ImmTo=0
 IF TSymName<>"~" THEN
    IF DMConst=0 THEN
        D0Loaded=0
        GOSUB LoadReg
        ErrMain
    ELSE
        CS(CSP).ImmTo=$ff
        CS(CSP).ImmVal=TSymName
    ENDIF
 ENDIF
 IF CS(CSP).ImmTo=0 THEN
    OutBuf=" move.l d0,_LopVec"+STR$(LopVarNdx)+"(a6)"
    GenCode
 ENDIF
 GOSUB NexToken
 IF TokenLen=0 THEN
    CS(CSP).NoStep=$ff
 ELSE
    IF TokenBuf<>"step" THEN
        ErrNo=ErrSyntax
        GOTO MainLoop
    ENDIF
    GOSUB Expr
    ErrMain
    IF TSymName<>"~" THEN
        D0Loaded=0
        GOSUB LoadReg
        ErrMain
    ENDIF
    OutBuf=" move.l d0,_LopVec"+STR$(LopVarNdx)+"+4(a6)"
    GenCode
    CS(CSP).NoStep=0
 ENDIF
 INC LabelNum
 OutBuf="_Lbl"+STR$(LabelNum)
 GenCode
 CS(CSP).LoopLabel=LabelNum
 INC LabelNum
 CS(CSP).TermLabel=LabelNum
 GOTO MainLoop
 
S10
* IF
 GOSUB CmpOps
 ErrMain
 IF TokenBuf<>"then" THEN
    ErrNo=ErrSyntax
    GOTO MainLoop
 ENDIF
 INC LabelNum
 GOSUB NexToken
 IF TokenLen=0 THEN 8102
 LNFlag=$ff
 GOSUB TokenSym1
 ErrMain
 IF SymFound=0 THEN
    GOSUB ClrSym1
    SymTemp.DataType=LABEL
    SymTemp.DataMod=0
    SymTemp.Detail=$ff
    GOSUB SymInsert
    ErrMain
 ENDIF
 IF SymTable(SymNdx).DataType<>7 THEN
    ErrNo=ErrTypMis
    GOTO MainLoop
 ENDIF
 OutBuf=" tst.b _True(a6)"
 GenCode
 OutBuf=" beq.s _Lbl"+STR$(LabelNum)
 GenCode
 IF ProgSize=$ff THEN
    IF Machine<2 THEN\ 68000 or 68010
        OutBuf=" move.l #"+SymTemp.SymName+"-*-8,a2"
        GenCode
        OutBuf=" jmp (pc,a2.l)"
    ELSE
        OutBuf=" bra.l "+SymTemp.SymName
    ENDIF
 ELSE
    OutBuf=" bra "+SymTemp.SymName
 ENDIF
 GenCode
 OutBuf="_Lbl"+STR$(LabelNum)
 GenCode
 GOTO MainLoop
8102 GOSUB IncConStk
 ErrMain
 CS(CSP).TermLabel=LabelNum
 CS(CSP).ConType=0
 CS(CSP).ConLine=LineCtr
 OutBuf=" tst.b _True(a6)"
 GenCode
 OutBuf=" beq _Lbl"+STR$(LabelNum)
 GenCode
 GOTO MainLoop
 
IncConStk INC CSP
 IF CSP>40 THEN
    ErrNo=ErrNDeep
 ENDIF
 RETURN
 
S11
* GOTO
 ToSubFlag=0
GoToSub LNFlag=$ff
 GOSUB NexToken
 IF TokenBuf="[" THEN
    Target=$ff
    For Ctr1=1 to LEN(SrcLine)
        IF MID$(SrcLine,Ctr1,1)="]" THEN
            MID$(SrcLine,Ctr1,1)=CHR$(0)
        ENDIF
    NEXT Ctr1
    GOSUB Expr
    ErrMain
    IF TDataType<>LONG THEN
        ErrNo=ErrTypMis
        GOTO MainLoop
    ENDIF
    IF DMReg=$ff THEN
        OutBuf=" move.l d"+STR$(TDetail)+",a2"
    ELSE
        IF DMVector=0 THEN
            IF DMRemote=0 THEN
                OutBuf=" move.l "+TSymName+"(a6),a2"
            ELSE
                OutBuf=" move.l #"+TSymName+",d7"
                GenCode
                OutBuf=" move.l (a6,d7.l),a2"
            ENDIF
        ELSE
            OutBuf=" move.l "+TSymName+"(a6),a2"
            GenCode
            OutBuf=" move.l (a2),a2"
        ENDIF
    ENDIF
    GenCode
    IF ToSubFlag=0 THEN
        OutBuf=" jmp(a2)"
    ELSE
        OutBuf=" jsr (a2)"
    ENDIF
    GenCode
    GOTO MainLoop
 ENDIF
 GOSUB UnDoToken
 GOSUB TokenSym
 ErrMain
 IF SymFound=0 THEN
    GOSUB ClrSym1
    SymTemp.DataType=LABEL
    SymTemp.DataMod=0
    SymTemp.Detail=$ff
    SymTemp.SymName=SymTemp.SymName
    GOSUB SymInsert
    ErrMain
 ENDIF
 IF SymTable(SymNdx).DataType<>7 THEN
    ErrNo=ErrTypMis
    GOTO MainLoop
 ENDIF
 IF ProgSize=$ff THEN\ big
    IF Machine<2 THEN\ 68000 or 68010
        OutBuf=" move.l #"+SymbolSaf+"-*-8,a2"
        GenCode
        IF ToSubFlag=0 THEN
            OutBuf=" jmp (pc,a2.l)"
        ELSE
            OutBuf=" jsr (pc,a2.l)"
        ENDIF
    ELSE
        IF ToSubFlag=0 THEN
            OutBuf=" bra.l "+SymbolSaf
        ELSE
            OutBuf=" bsr.l "+SymbolSaf
        ENDIF
    ENDIF
 ELSE
    IF ToSubFlag=0 THEN
        OutBuf=" bra "+SymbolSaf
    ELSE
        OutBuf=" bsr "+SymbolSaf
    ENDIF
 ENDIF
 GenCode
 GOTO MainLoop
 
S12
* GOSUB
 ToSubFlag=$ff
 GOTOQ GoToSub
 
S13
* ON
 LNFlag=$ff
 NeedComma=$00
 JmpArgs=0
 GOSUB NexToken
 IF TokenBuf="error" THEN 8135
 GOSUB UnDoToken
 INC LabelNum
 INC TableNum
 GOSUB Expr
 ErrMain
 IF OpClass<>INTClass THEN
    ErrNo=ErrTypMis
    GOTO MainLoop
 ENDIF
 IF TSymName<>"~" THEN
    D0Loaded=0
    GOSUB LoadReg
    ErrMain
 ENDIF
 OutBuf=" subq.l #1,d0"
 GenCode
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
lbl8131 GOSUB NexToken
 IF TokenLen=0 THEN 8132
 IF TokenBuf="," AND NeedComma=$ff THEN
    NeedComma=0
    GOTOQ lbl8131
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
    GOSUB ClrSym1
    SymTemp.DataMod=0
    SymTemp.Detail=$ff
    GOSUB SymInsert
    ErrMain
 ENDIF
 IF SymTable(SymNdx).DataType<>7 THEN
    ErrNo=ErrTypMis
    GOTO MainLoop
 ENDIF
 INC JmpArgs
 NeedComma=$ff
 GOTOQ lbl8131
8132 SrcNdx=SrcNdxSaf
 IF ToSubFlag=$ff THEN
    OutBuf=" pea _Lbl"+STR$(LabelNum)+"(pc)"
    GenCode
 ENDIF
 OutBuf=" tst.l d0"
 GenCode
 OutBuf=" bmi _Lbl"+STR$(LabelNum)
 GenCode
 OutBuf=" cmp.l #"+STR$(JmpArgs-1)+",d0"
 GenCode
 OutBuf=" bhi _Lbl"+STR$(LabelNum)
 GenCode
 OutBuf=" asl.l #2,d0"
 GenCode
 OutBuf=" move.l _Tbl"+STR$(TableNum)+"(pc,d0),a2"
 GenCode
 OutBuf=" jmp (pc,a2.l)"
 GenCode
 OutBuf=" align"
 GenCode
 OutBuf="_Tbl"+STR$(TableNum)
 GenCode
lbl8133 GOSUB NexToken
 IF TokenLen=0 THEN 8134
 IF TokenBuf="," THEN lbl8133
 GOSUB TokenSym1
 OutBuf=" dc.l "+SymTemp.SymName+"+2-_Tbl"+STR$(TableNum)
 GenCode
 GOTOQ lbl8133
8134 OutBuf="_Lbl"+STR$(LabelNum)
 GenCode
 GOTO MainLoop
8135 GOSUB NexToken
 IF TokenLen=0 THEN
    IF ProgSize=$ff THEN
        OutBuf=" move.l #_ERRExit-*-8,a2"
        GenCode
        OutBuf=" lea (pc,a2.l),a2"
    ELSE
        OutBuf=" lea _ERRExit(pc),a2"
    ENDIF
    GenCode
    OutBuf=" move.l a2,_ERRVec(a6)"
    GenCode
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
    GOSUB ClrSym1
    SymTemp.DataMod=0
    SymTemp.Detail=$ff
    GOSUB SymInsert
    ErrMain
 ENDIF
 IF SymTable(SymNdx).DataType<>7 THEN
    ErrNo=ErrTypMis
    GOTO MainLoop
 ENDIF
 IF ProgSize=$ff THEN
    OutBuf=" move.l #"+SymTemp.SymName+"-*-8,a2"
    GenCode
    OutBuf=" lea (pc,a2.l),a2"
 ELSE
    OutBuf=" lea "+SymTemp.SymName+"(pc),a2"
 ENDIF
 GenCode
 OutBuf=" move.l a2,_ERRVec(a6)"
 GenCode
 GOTO MainLoop
 
S14
* PRINT
 OutBuf=" clr.b _FileIO(a6)"
 GenCode
PRINTx
 GOSUB DevChk
 PrintFlag=$ff
 IF DevFlag=$ff THEN
    GOSUB GetPNum1
    ErrMain
 ELSE
    OutBuf=" move.w #1,_IOPthNum(a6)"
    GenCode
 ENDIF
 GOSUB NexToken
 IF TokenBuf="using" THEN PrtUsing
 GOSUB UnDoToken
PrintLp
 GOSUB NexToken
 IF TokenLen=0 THEN PrintEx
 GOSUB UnDoToken
 GOSUB Expr
 ErrMain
 IF TDataType=VOID THEN PrtArgSep
 IF TabFlag=$ff THEN
    TabFlag=0
    GOTOQ PrtArgSep
 ENDIF
 IF TDataType<>STRING OR DMAddr=$ff THEN
    GOSUB MakString
    ErrMain
 ENDIF
 GOSUB ClassOp
 OutBuf=" lea "+TSymName+"(a6),a1"
 GenCode
 OutBuf=" move.l #_BufSize,d1" pass buffer size to function
 GenCode
 GenJsr _PrintStr
 IF FileIO=$ff THEN PrintEx
PrtArgSep
 GOSUB NexToken
 IF TokenBuf="," THEN
    OutBuf=" clr.l d1"
    GenCode
    GenJsr _PrintTab
    IF NextByte="" THEN PrintEx
    GOTOQ PrintLp
 ENDIF
 IF TokenBuf=";" THEN
    IF NextByte="" THEN PrintEx
    GOTOQ PrintLp
 ENDIF
PrintEx
 IF TokenBuf<>"," AND TokenBuf<>";" THEN
    GenJsr _PrntCRLF
 ENDIF
 GOTO MainLoop

PrtUsing
 GOSUB UnDoToken
 GOSUB Expr
 GOTO MainLoop

MakString
 IF OpClass=INTClass THEN
    IF TSymName<>"~" THEN
        D0Loaded=0
        GOSUB LoadReg
        ErrRet
    ENDIF
    GenJsr _LtoA
    GOSUB NumToA
 ENDIF
 IF OpClass=FLTClass THEN
    IF TSymName<>"~" THEN
        D0Loaded=0
        GOSUB LoadReg
        ErrRet
    ENDIF
    GenJsr _DtoA
    GOSUB NumToA
 ENDIF
 IF OpClass=BOOLClass THEN
    IF TSymName<>"~" THEN
        D0Loaded=0
        GOSUB LoadReg
        ErrRet
    ENDIF
    GenJsr _BtoA
    GOSUB NumToA
 ENDIF
 RETURN
 
S15
* INPUT
 GOSUB DevChk
 IF DevFlag=$ff THEN
    GOSUB GetPNum1
    ErrMain
 ELSE
    OutBuf=" move.w #0,_IOPthNum(a6)"
    GenCode
    OutBuf=" move.w #1,d0"
 ENDIF
 IF FileIO=0 THEN
    GenCode
    GOSUB NexToken
    GOSUB UnDoToken
    IF TokenType=TTypQuote THEN
        GOSUB Expr
        ErrMain
        OutBuf=" move.l "+TSymName+"(a6),a0"
        GenCode
        OutBuf=" move.l "+TSymName+"+4(a6),d1"
        GenCode
        GOSUB NexToken
        IF TokenBuf<>"," THEN
            ErrNo=ErrSyntax
            GOTO MainLoop
        ENDIF
    ELSE
        IF ProgSize=$ff THEN
            OutBuf=" move.l #_Prompt-*-8,a0"
            GenCode
            OutBuf=" lea (pc,a0.l),a0"
        ELSE
            OutBuf=" lea _Prompt(pc),a0"
        ENDIF
        GenCode
        OutBuf=" move.l #1,d1"
        GenCode
    ENDIF
    OutBuf=" os9 I$Write"
    GenCode
    GOSUB CallErr
 ENDIF
 OutBuf=" move.w _IOPthNum(a6),d0"
 GenCode
 OutBuf=" move.l #_BufSize,d1"
 GenCode
 OutBuf=" lea _IOBuffer(a6),a0"
 GenCode
 OutBuf=" os9 I$ReadLn"
 GenCode
 GOSUB CallErr
 GOSUB GenXfrCnt
 OutBuf=" move.l d1,d2"
 GenCode
 Target=$ff
 GOSUB Expr
 ErrMain
 IF DMReg=0 THEN
    IF DMVector=0 THEN
        GOSUB Vectorize
        ErrMain
        GOSUB ClassOp
    ENDIF
    IF DMVector=$ff AND DMTemp=0 THEN
        GOSUB MakTmpVec
        ErrMain
    ENDIF
    OutBuf=" clr.l d3"\ tell runsubs this not register op
    GenCode
    OutBuf=" lea "+TSymName+"(a6),a0"
 ELSE
    OutBuf=" move.l #$ff,d3"\ tell runsubs this is register op
 ENDIF
 GenCode
 OutBuf=" move.b #"+STR$(TDataType)+",d0"\ tell runsubs Data Type
 GenCode
 GenJsr _InpData
 IF DMReg=$ff THEN
    IF TDataType=FLOAT OR TDataType=LONG THEN
        OutBuf=" move.l d0,d"+STR$(TDetail)
    ELSE
        IF TDataType=SHORT THEN
            OutBuf=" move.w d0,d"+STR$(TDetail)
        ELSE
            OutBuf=" move.b d0,d"+STR$(TDetail)
        ENDIF
    ENDIF
    GenCode
 ENDIF
 GOTO MainLoop
 
S16
* READ
 NeedComma=0
 GOSUB NexToken
 IF TokenBuf="#" THEN 8165
 Target=$ff
 ReadFlag=$ff
 GOSUB UnDoToken
 OutBuf=" move.l _DataPtr(a6),a2"
 GenCode
lbl8161 IF NeedComma=$ff THEN
    GOSUB NexToken
    IF TokenLen=0 THEN 8163
    IF TokenBuf<>"," THEN
        ErrNo=ErrSyntax
        GOTO MainLoop
    ELSE
        NeedComma=0
    ENDIF
 ENDIF
 GOSUB GetExp
 ErrMain
 IF TokenLen=0 THEN 8163
 GOSUB ProcExp
 ErrMain
 GOSUB ClassOp
 IF DMReg=0 THEN
    IF DMVector=0 THEN
        IF DMRemote=0 THEN
            OutBuf=" lea "+TSymName+"(a6),a1"
            GenCode
        ELSE
            OutBuf=" move.l #"+TSymName+",d7"
            GenCode
            OutBuf=" lea (a6,d7.l),a1"
        ENDIF
    ELSE
        OutBuf=" move.l "+TSymName+"(a6),a1"
        GenCode
    ENDIF
 ENDIF
 IF TDataType=COMPVAR OR TDataType>6 THEN
    ErrNo=ErrTypMis
    GOTO MainLoop
 ENDIF
 GOSUB AlignData
 IF TDataType=BOOLEAN THEN
    OutBuf=" move.b (a2)+,(a1)"
    GenCode
    GOTOQ lbl8164
 ENDIF
 IF TDataType=BYTE THEN
    OutBuf=" lea 3(a2),a2"
    GenCode
    IF DMReg=0 THEN
        OutBuf=" move.b (a2)+,(a1)"
    ELSE
        OutBuf=" move.b (a2)+,d"+STR$(TDetail)
    ENDIF
    GenCode
    GOTOQ lbl8164
 ENDIF
 IF TDataType=SHORT THEN
    OutBuf=" lea 2(a2),a2"
    GenCode
    IF DMReg=0 THEN
        OutBuf=" move.w (a2)+,(a1)"
    ELSE
        OutBuf=" move.w (a2)+,d"+STR$(TDetail)
    ENDIF
    GenCode
    GOTOQ lbl8164
 ENDIF
 IF TDataType=LONG THEN
    IF DMReg=0 THEN
        OutBuf=" move.l (a2)+,(a1)"
    ELSE
        OutBuf=" move.l (a2)+,d"+STR$(TDetail)
    ENDIF
    GenCode
    GOTOQ lbl8164
 ENDIF
 IF TDataType=FLOAT THEN
    OutBuf=" move.l (a2)+,(a1)"
    GenCode
    OutBuf=" move.l (a2)+,4(a1)"
    GenCode
    GOTOQ lbl8164
 ENDIF
 IF TDataType=STRING THEN
    INC LoopNum
    INC LabelNum
    OutBuf=" move.w #"+STR$(SymTemp.Detail-1)+",d1"
    GenCode
    OutBuf="_Loop"+STR$(LoopNum)+" move.b (a2)+,(a1)+"
    GenCode
    OutBuf=" dbeq d1,_Loop"+STR$(LoopNum)
    GenCode
    OutBuf=" tst.w d1"\ test for full string case
    GenCode
    OutBuf=" bpl.s _Lbl"+STR$(LabelNum)\ plus if not full string
    GenCode
    INC LoopNum
    OutBuf="_Loop"+STR$(LoopNum)
    GenCode
    OutBuf=" tst.b (a2)+"\ bump data ptr past string terminator
    GenCode
    OutBuf=" bne.s _Loop"+STR$(LoopNum)
    GenCode
    OutBuf="_Lbl"+STR$(LabelNum)
    GenCode
    GOTOQ lbl8164
 ENDIF
8163 OutBuf=" move.l a2,_DataPtr(a6)"
 GenCode
 GOTO MainLoop
lbl8164 NeedComma=$ff
 GOTOQ lbl8161
8165 GOSUB UnDoToken
 GOSUB ReadWrite
 ErrMain
 OutBuf=" move.l a0,a1"
 GenCode
 OutBuf=" os9 I$ReadLn"
 GenCode
 GOSUB CallErr
 OutBuf=" adda.l d1,a1"
 GenCode
 OutBuf=" clr.b -1(a1)"\ put NULL at end
 GenCode
 GOSUB GenXfrCnt
 GOTO MainLoop
 
S17
* WRITE
 GOSUB ReadWrite
 ErrMain
 GenJsr _DoWrite
 GOTO MainLoop
 
S18
* GET
 GOSUB GetPut
 ErrMain
 OutBuf=" os9 I$Read"
 GenCode
 GOSUB CallErr
 GOSUB GenXfrCnt
 GOTO MainLoop
 
S19
* PUT
 GOSUB GetPut
 ErrMain
 OutBuf=" os9 I$Write"
 GenCode
 GOSUB CallErr
 GOSUB GenXfrCnt
 GOTO MainLoop
 
S20
* END
 IF ProgMode=$ff THEN
    OutBuf=" clr.l d1"
    GenCode
    IF CEnviron=$ff THEN
        OutBuf=" clr.l d0"
        GenCode
        OutBuf=" bsr exit"
    ELSE
        OutBuf=" os9 F$Exit"
    ENDIF
    GenCode
 ENDIF
 IF ProcMode=$ff THEN
    OutBuf=" unlk a5"
    GenCode
    OutBuf=" clr.l d1"
    GenCode
    OutBuf=" rts"
    GenCode
 ENDIF
 IF FcnMode=$ff THEN
    OutBuf=" unlk a5"
    GenCode
    OutBuf=" rts"
    GenCode
 ENDIF
 GOTO MainLoop
 
S21
* CREATE
 Target=$ff
 GOSUB GetPNum
 ErrMain
 Target=0
 GOSUB GetPthNam
 ErrMain
 GOSUB NexToken
 IF TokenBuf<>":" THEN
    ErrNo=ErrSyntax
    GOTO MainLoop
 ENDIF
 GOSUB GetAccMod
 ErrMain
 OutBuf=" move.b #"+STR$(AccMode)+",d0"
 GenCode
 OutBuf=" move.w #$b,d1"
 GenCode
 OutBuf=" clr.l d2"
 GenCode
 OutBuf=" lea _IOBuffer(a6),a0"
 GenCode
 OutBuf=" os9 I$Create"
 GenCode
 GOSUB CallErr
 Op1Name=PathVar
 GOSUB StoreD0
 GOTO MainLoop
 
S22
* OPEN
 TstOpnFlg=0
OpenCommon
 Target=$ff
 GOSUB GetPNum
 ErrMain
 Target=0
 GOSUB GetPthNam
 ErrMain
 GOSUB NexToken
 IF TokenBuf<>":" THEN
    ErrNo=ErrSyntax
    GOTO MainLoop
 ENDIF
 GOSUB GetAccMod
 ErrMain
 OutBuf=" move.b #"+STR$(AccMode)+",d0"
 GenCode
 OutBuf=" lea _IOBuffer(a6),a0"
 GenCode
 OutBuf=" os9 I$Open"
 GenCode
 IF TstOpnFlg=0 THEN
    GOSUB CallErr
 ELSE
    INC LabelNum
    OutBuf=" bcc.s _Lbl"+STR$(LabelNum)
    GenCode
    OutBuf=" move.l d1,ERR(a6)"
    GenCode
    OutBuf="_Lbl"+STR$(LabelNum)
    GenCode
 ENDIF
 Op1Name=PathVar
 GOSUB StoreD0
 GOTO MainLoop
 
S23
* CLOSE
 FileStat=$ff
 DiskIO=$ff
lbl8232 GOSUB GetPNum
 ErrMain
 OutBuf=" os9 I$Close"
 GenCode
 GOSUB CallErr
 GOSUB NexToken
 IF TokenLen=0 THEN MainLoop
 IF TokenBuf<>"," THEN
    ErrNo=ErrSyntax
    GOTO MainLoop
 ENDIF
 GOTOQ lbl8232
 
S24
* WHILE
 INC LabelNum
 OutBuf="_Lbl"+STR$(LabelNum)
 GenCode
 GOSUB CmpOps
 ErrMain
 IF TokenBuf<>"do" THEN
    ErrNo=ErrSyntax
    GOTO MainLoop
 ENDIF
 GOSUB IncConStk
 ErrMain
 CS(CSP).LoopLabel=LabelNum
 INC LabelNum
 CS(CSP).TermLabel=LabelNum
 CS(CSP).ConType=1
 CS(CSP).ConLine=LineCtr
 OutBuf=" tst.b _True(a6)"
 GenCode
 OutBuf=" beq _Lbl"+STR$(LabelNum)
 GenCode
 GOTO MainLoop
 
S25
* ENDWHILE
 TempInt=1
 GOSUBQ CSChk
 ErrMain
 OutBuf=" bra _Lbl"+STR$(CS(CSP).LoopLabel)
 GenCode
 OutBuf="_Lbl"+STR$(CS(CSP).TermLabel)
 GenCode
 DEC CSP
 GOTO MainLoop
 
S26
* NEXT
 GOSUB NexToken
 IF CSP=0 THEN
    ErrNo=ErrUBCon
    GOTO MainLoop
 ENDIF
 IF TokenSaf<>CS(CSP).LoopName THEN
    ErrNo=ErrUBCon
    GOTO MainLoop
 ENDIF
 TempInt=5
 GOSUBQ CSChk
 ErrMain
* compare loopvar to "to" value
 IF CS(CSP).ImmTo=$ff THEN
    IF CS(CSP).RegVar<>0 THEN
        OutBuf=" cmpi."+CS(CSP).ForVarSiz+" #"+CS(CSP).ImmVal+",d"+STR$(CS(CSP).RegVar)
        GenCode
    ELSE
        IF CS(CSP).RemoteVar=0 THEN
            OutBuf=" cmpi."+CS(CSP).ForVarSiz+" #"+CS(CSP).ImmVal+","+CS(CSP).LoopName+"(a6)"
            GenCode
        ELSE
            OutBuf=" move.l #"+CS(CSP).LoopName+",d7"
            GenCode
            OutBuf=" cmpi."+CS(CSP).ForVarSiz+" #"+CS(CSP).ImmVal+",(a6,d7.l)"
            GenCode
        ENDIF
    ENDIF
 ELSE
    OutBuf=" move.l _LopVec"+STR$(CS(CSP).LoopVec)+"(a6),d0"
    GenCode
    IF CS(CSP).RegVar<>0 THEN
        OutBuf=" cmp."+CS(CSP).ForVarSiz+" d"+STR$(CS(CSP).RegVar)+",d0"
        GenCode
    ELSE
        IF CS(CSP).RemoteVar=0 THEN
            OutBuf=" cmp."+CS(CSP).ForVarSiz+" "+CS(CSP).LoopName+"(a6),d0"
            GenCode
        ELSE
            OutBuf=" move.l #"+CS(CSP).LoopName+",d7"
            GenCode
            OutBuf=" cmp."+CS(CSP).ForVarSiz+" (a6,d7.l),d0"
            GenCode
        ENDIF
    ENDIF
 ENDIF
* branch to done if loop var equals "to" val
 OutBuf=" beq.s _Lbl"+STR$(CS(CSP).TermLabel)
 GenCode
* add "step" to loop var
 IF CS(CSP).NoStep=$ff THEN
    IF CS(CSP).RegVar<>0 THEN
        OutBuf=" addq."+CS(CSP).ForVarSiz+" #1,d"+STR$(CS(CSP).RegVar)
        GenCode
    ELSE
        IF CS(CSP).RemoteVar=0 THEN
            OutBuf=" addq."+CS(CSP).ForVarSiz+" #1,"+CS(CSP).LoopName+"(a6)"
            GenCode
        ELSE
            OutBuf=" move.l #"+CS(CSP).LoopName+",d7"
            GenCode
            OutBuf=" addq."+CS(CSP).ForVarSiz+" #1,(a6,d7.l)"
            GenCode
        ENDIF
    ENDIF
 ELSE
    OutBuf=" move.l _LopVec"+STR$(CS(CSP).LoopVec)+"+4(a6),d0"
    GenCode
    IF CS(CSP).RegVar<>0 THEN
        OutBuf=" add."+CS(CSP).ForVarSiz+" d0,d"+STR$(CS(CSP).RegVar)
        GenCode
    ELSE
        IF CS(CSP).RemoteVar=0 THEN
            OutBuf=" add."+CS(CSP).ForVarSiz+" d0,"+CS(CSP).LoopName+"(a6)"
            GenCode
        ELSE
            OutBuf=" move.l #"+CS(CSP).LoopName+",d7"
            GenCode
            OutBuf=" add."+CS(CSP).ForVarSiz+" d0,(a6,d7.l)"
            GenCode
        ENDIF
    ENDIF
 ENDIF
* branch back too loop beginning
 OutBuf=" bra _Lbl"+STR$(CS(CSP).LoopLabel)
 GenCode
* generate done label
 OutBuf="_Lbl"+STR$(CS(CSP).TermLabel)
 GenCode
 DEC CSP
 GOTO MainLoop
 
S27
* REM
 GOTO MainLoop
 
S28
* ELSE
 GOSUB NexToken\ make sure nothing follows
 IF TokenLen<>0 THEN
    ErrNo=ErrSyntax
    GOTO MainLoop
 ENDIF
 TempInt=0
 GOSUBQ CSChk
 ErrMain
 INC LabelNum
 OutBuf=" bra _Lbl"+STR$(LabelNum)
 GenCode
 OutBuf="_Lbl"+STR$(CS(CSP).TermLabel)
 GenCode
 CS(CSP).TermLabel=LabelNum
 GOTO MainLoop
 
S29
* ENDIF
 TempInt=0
 GOSUBQ CSChk
 ErrMain
 OutBuf="_Lbl"+STR$(CS(CSP).TermLabel)
 GenCode
 DEC CSP
 GOTO MainLoop
 
CSChk
 IF CSP<1 THEN
    ErrNo=ErrUBCon
    RETURN
 ENDIF
 IF CS(CSP).ConType<>TempInt THEN
    ErrNo=ErrUBCon
 ENDIF
 RETURN
 
S30
* DELETE
 GOSUB GetPthNam
 ErrMain
 OutBuf=" move.b #1,d0"
 GenCode
 OutBuf=" lea _IOBuffer(a6),a0"
 GenCode
 OutBuf=" os9 I$Delete"
 GenCode
 GOSUB CallErr
 GOTO MainLoop
 
S31
* BUFFER
 GOSUB TokenSym
 ErrMain
 BufName=SymTemp.SymName
 IF SymFound=0 THEN
    IF VarBytes+8>$ffff THEN
        VarBytRem=VarBytRem+8
        SymTemp.DataMod=$08
        OutBuf=" vsect remote"
        DMRemote=$ff
    ELSE
        SymTemp.DataMod=0
        VarBytes=VarBytes+8
        OutBuf=" vsect"
    ENDIF
    GenCode
    GOSUB ClrSym1
    SymTemp.DataMod=0
    SymTemp.DataType=BUFFER
    SymTemp.DataSize=8
    GOSUB SymInsert
    ErrMain
    OutBuf=BufName+" ds.l 2"
    GenCode
    OutBuf=" ends"
    GenCode
 ENDIF
 TDataType=SymTable(SymNdx).DataType
 IF LAND(RemoteBit,TDataMod)=RemoteBit THEN
    DMRemote=$ff
 ENDIF
 IF TDataType<>15 THEN
    ErrNo=ErrTypMis
    GOTO MainLoop
 ENDIF
 GOSUB NexToken
 IF TokenBuf<>"=" THEN
    ErrNo=ErrSyntax
 ENDIF
 GOSUB Expr
 IF DMConst=$ff AND TSymName="$0" THEN
    IF DMRemote=$ff THEN
        OutBuf=" move.l #"+BufName+",d7"
        GenCode
        OutBuf=" move.l (a6,d7.l),a2"
        GenCode
        OutBuf=" move.l 4(a6,d7.l),d0"
        GenCode
    ELSE
        OutBuf=" move.l "+BufName+"(a6),a2"
        GenCode
        OutBuf=" move.l "+BufName+"+4(a6),d0"
        GenCode
    ENDIF
    OutBuf=" os9 F$SRtMem"
    GenCode
    GOSUB CallErr
 ELSE
    IF TSymName<>"~" THEN
        D0Loaded=0
        GOSUB LoadReg
        ErrMain
    ENDIF
    OutBuf=" os9 F$SRqMem"
    GenCode
    GOSUB CallErr
    IF DMRemote=$ff THEN
        OutBuf=" move.l #"+BufName+",d7"
        GenCode
        OutBuf=" move.l a2,(a6,d7.l)"
        GenCode
        OutBuf=" move.l d0,4(a6,d7.l)"
        GenCode
    ELSE
        OutBuf=" move.l a2,"+BufName+"(a6)"
        GenCode
        OutBuf=" move.l d0,"+BufName+"+4(a6)"
        GenCode
    ENDIF
 ENDIF
 GOTO MainLoop
 
S32
* LOOP
 GOSUB IncConStk
 ErrMain
 GOSUB NexToken
 IF TokenLen=0 THEN
    CS(CSP).ConType=3
 ELSE
    IF TokenBuf<>"count" THEN
        ErrNo=ErrSyntax
        GOTO MainLoop
    ENDIF
    GOSUB NexToken
    IF TokenBuf<>"=" THEN
        ErrNo=ErrSyntax
        GOTO MainLoop
    ENDIF
    GOSUB Expr
    ErrMain
    IF OpClass<>INTClass THEN
        ErrNo=ErrTypMis
        GOTO MainLoop
    ENDIF
    IF TSymName<>"~" THEN
        GOSUB LoadReg
    ENDIF
    OutBuf=" move.l d6,-(sp)"
    GenCode
    OutBuf=" move.l d0,d6"
    GenCode
    OutBuf=" subq.l #1,d6"
    GenCode
    CS(CSP).ConType=4
 ENDIF
 CS(CSP).ConLine=LineCtr
 INC LabelNum
 OutBuf="_Lbl"+STR$(LabelNum)
 GenCode
 CS(CSP).LoopLabel=LabelNum
 INC LabelNum
 CS(CSP).TermLabel=LabelNum
 GOTO MainLoop
 
S33
* ENDLOOP
 TempInt=3
 GOSUBQ CSChk
 IF ErrNo<>0 THEN
    ErrNo=0
    TempInt=4
    GOSUBQ CSChk
    ErrMain
 ENDIF
 IF TempInt=3 THEN
    OutBuf=" bra _Lbl"+STR$(CS(CSP).LoopLabel)
 ELSE
    OutBuf=" dbra d6,_Lbl"+STR$(CS(CSP).LoopLabel)
    GenCode
    OutBuf=" addq.w #1,d6"
    GenCode
    OutBuf=" subq.l #1,d6"
    GenCode
    OutBuf=" bcc.s _Lbl"+STR$(CS(CSP).LoopLabel)
 ENDIF
 GenCode
 OutBuf="_Lbl"+STR$(CS(CSP).TermLabel)
 GenCode
 IF TempInt<>3 THEN
    OutBuf=" move.l (sp)+,d6"
    GenCode
 ENDIF
 DEC CSP
 GOTO MainLoop
 
S34
* REPEAT
 GOSUB IncConStk
 ErrMain
 INC LabelNum
 OutBuf="_Lbl"+STR$(LabelNum)
 GenCode
 CS(CSP).LoopLabel=LabelNum
 INC LabelNum
 CS(CSP).TermLabel=LabelNum
 CS(CSP).ConLine=LineCtr
 CS(CSP).ConType=2
 GOTO MainLoop
 
S35
* UNTIL
 TempInt=2
 GOSUBQ CSChk
 ErrMain
 GOSUB CmpOps
 ErrMain
 IF TokenLen<>0 THEN
    ErrNo=ErrSyntax
    GOTO MainLoop
 ENDIF
 OutBuf=" tst.b _True(a6)"
 GenCode
 OutBuf=" beq _Lbl"+STR$(CS(CSP).LoopLabel)
 GenCode
 OutBuf="_Lbl"+STR$(CS(CSP).TermLabel)
 GenCode
 DEC CSP
 GOTO MainLoop
 
S36
* EXITIF
 GOSUB CmpOps
 ErrMain
 IF CSP<1 THEN
    ErrNo=ErrUBCon
    GOTO MainLoop
 ENDIF
 IF TokenLen=0 THEN
    OutBuf=" tst.b _True(a6)"
    GenCode
    OutBuf=" bne _Lbl"+STR$(CS(CSP).TermLabel)
    GenCode
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
 CS(CSP).ConLine=LineCtr
 CS(CSP).ConType=6
 OutBuf=" tst.b _True(a6)"
 GenCode
 OutBuf=" beq _Lbl"+STR$(LabelNum)
 GenCode
 GOTO MainLoop

S37
* SHELL
 OutBuf=" movem.l d0-d7/a0-a6,-(sp)"
 GenCode
 GOSUB Expr
 IF TDataType<>STRING THEN
    ErrNo=ErrTypMis
    GOTO MainLoop
 ENDIF
 OutBuf=" lea "+TSymName+"(a6),a1"
 GenCode
 OutBuf=" lea _IOBufVec(a6),a0"
 GenCode
 GenJsr _MovStr
 OutBuf=" lea _IOBufVec(a6),a0"
 GenCode
 GenJsr _StrLen
 OutBuf=" move.l d1,d2"
 GenCode
 OutBuf=" addq.l #1,d2"
 GenCode
 OutBuf=" lea _IOBuffer(a6),a1"
 GenCode
 IF ProgSize=$ff THEN
    OutBuf=" move.l #_Shell-*-8,a0"
    GenCode
    OutBuf=" lea (pc,a0.l),a0"
 ELSE
    OutBuf=" lea _Shell(pc),a0"
 ENDIF
 GenCode
 OutBuf=" clr.l d0"
 GenCode
 OutBuf=" clr.l d1"
 GenCode
 OutBuf=" clr.l d4"
 GenCode
 OutBuf=" moveq #3,d3"
 GenCode
 OutBuf=" os9 F$Fork"
 GenCode
 OutBuf=" os9 F$Wait"
 GenCode
 OutBuf=" movem.l (sp)+,d0-d7/a0-a6"
 GenCode
 INC LabelNum
 OutBuf=" bcc.s _Lbl"+STR$(LabelNum)
 GenCode
 OutBuf=" os9 F$Exit"
 GenCode
 OutBuf="_Lbl"+STR$(LabelNum)
 GenCode
 goto MainLoop

S38
* FPRINT
 FileIO=$ff
 OutBuf=" move.b $ff,_FileIO(a6)"
 GenCode
 GOTO PRINTx

S39
* FINPUT
 FileIO=$ff
 GOTO S15

S40
* BASE
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

S41
* INC
 DecFlag=0
INCx1
 Target=$ff
 GOSUB Expr
 ErrMain
 IF DMConst=$ff THEN
    ErrNo=ErrIVExp
    GOTO MainLoop
 ENDIF
 IF OpClass<>INTClass THEN
    ErrNo=ErrTypMis
    GOTO MainLoop
 ENDIF
 IF DMAddr=$ff THEN
    IF DecFlag=0 THEN
        AddInst=" addi"
    ELSE
        AddInst=" subi"
    ENDIF
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
 ELSE
    VarSize=1
    IF DecFlag=0 THEN
        AddInst=" addq"
    ELSE
        AddInst=" subq"
    ENDIF
 ENDIF
 GOSUB GetRP1
 IF DMReg=$ff THEN
    OutBuf=AddInst+DataWidth+"#1,d"+STR$(SymTemp.Detail)
 ELSE
    IF LAND(VectorBit,SymTemp.DataMod)=0 THEN
        IF DMRemote=0 THEN
            OutBuf=AddInst+DataWidth+"#"+STR$(VarSize)+","+SymTemp.SymName+"(a6)"
        ELSE
            OutBuf=" move.l #"+SymTemp.SymName+",d7"
            GenCode
            OutBuf=AddInst+DataWidth+"#"+STR$(VarSize)+",(a6,d7.l)"
        ENDIF
    ELSE
        OutBuf=" move.l "+SymTemp.SymName+"(a6),a3"
        GenCode
        OutBuf=AddInst+DataWidth+"#"+STR$(VarSize)+",(a3)"
    ENDIF
 ENDIF
 GenCode
 GOTO MainLoop

S42
* DEC
 DecFlag=$ff
 GOTOQ INCx1

S43
* BUFREAD
 GOSUB BufRW
 ErrMain
 OutBuf=" os9 I$Read"
 GenCode
 GOSUB CallErr
 GOSUB GenXfrCnt
 GOTO MainLoop

S44
* BUFWRITE
 GOSUB BufRW
 ErrMain
 OutBuf=" os9 I$Write"
 GenCode
 GOSUB CallErr
 GOSUB GenXfrCnt
 GOTO MainLoop

S52
* DIGITS
 DigDec=$ff
 bra.s Decimals1

S45
* DECIMALS
 DigDec=0
Decimals1
 GOSUB Expr
 IF OpClass<>INTClass THEN
    ErrNo=ErrTypMis
    GOTO MainLoop
 ENDIF
 IF TSymName<>"~" THEN
    D0Loaded=0
    GOSUB LoadReg
    ErrMain
 ENDIF
 IF DigDec=0 THEN
    OutBuf=" move.w d0,_Decimals(a6)"
 ELSE
    OutBuf=" move.w d0,_Digits(a6)"
 ENDIF
 GenCode
 GOTO MainLoop

S46
* EXCHANGE
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
 GOSUB NexToken
 IF TokenBuf<>"," THEN
    ErrNo=ErrSyntax
    GOTO MainLoop
 ENDIF
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
    ErrNo=ErrTypMis
    GOTO MainLoop
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
    OutBuf=" move.l d2,d0"
    GenCode
    IF Op1Class=FLTClass THEN
        OutBuf=" move.l d3,d1"
        GenCode
    ENDIF
    Op1Name=Op2Name
    GOSUB StoreD0
    GOTO MainLoop
 ENDIF
 IF Op1Type=STRING THEN
    OutBuf=" lea "+Op1Name+"(a6),a0"
    GenCode
    OutBuf=" lea "+Op2Name+"(a6),a1"
    GenCode
    GenJsr _ExgStr
    GOTO MainLoop
 ENDIF
 IF Op1Class=CPXClass OR Op1Class=ARRClass THEN
    IF LAND(Op1Mod,VectorBit)=0 THEN
        IF LAND(Op1Mod,RemoteBit)=0 THEN
            OutBuf=" lea "+Op1Name+"(a6),a0"
        ELSE
            OutBuf=" move.l #"+Op1Name+",d7"
            GenCode
            OutBuf=" lea (a6,d7.l),a0"
        ENDIF
    ELSE
    OutBuf=" move.l "+Op1Name+"(a6),a0"
    ENDIF
    GenCode
    IF LAND(Op1Mod,VectorBit)=0 THEN
        IF LAND(Op1Mod,RemoteBit)=0 THEN
            OutBuf=" lea "+Op2Name+"(a6),a1"
        ELSE
            OutBuf=" move.l #"+Op2Name+",d7"
            GenCode
            OutBuf=" lea (a6,d7.l),a1"
        ENDIF
    ELSE
        OutBuf=" move.l "+Op2Name+"(a6),a1"
    ENDIF
    GenCode
    IF Op1Class=ARRClass THEN
        OutBuf=" move.l #"+STR$(Op1DataSize)+",d1"
    ELSE
        OutBuf=" move.l #"+STR$(SymTable(Op1Detail).DataSize)+",d1"
    ENDIF
    GenCode
    GenJsr _ExgCpx
    GOTO MainLoop
 ENDIF
 ErrNo=ErrIVType
 GOTO MainLoop

GetArgs
 Ctr1=0
 IF FcnMode=$ff THEN
    OutBuf=SymbolSaf+":"
 ELSE
    OutBuf=SymbolSaf
 ENDIF
 GenCode
GetArgs1
 GOSUB NexToken
 IF TokenBuf=")" THEN
    IF FcnMode=$ff THEN
        OutBuf=" link a5,#0"
        GenCode
    ENDIF
    GOTO MainLoop
 ENDIF
 IF TokenLen=0 THEN
    ErrNo=ErrSyntax
    GOTO MainLoop
 ENDIF
 IF TokenBuf="," THEN GetArgs1
 INC Ctr1
 SymTemp.SymName=TokenSaf
 GOSUB SymSrch
 IF SymFound=0 THEN
    ErrNo=ErrUDSym
    GOTO MainLoop
 ENDIF
 SymTemp=SymTable(SymNdx)
 GOSUB ClassOp1
 IF OpClass<>INTClass AND OpClass<>FLTClass THEN\ not int or float
    ErrNo=ErrTypMis
    GOTO MainLoop
 ENDIF
 IF DMAddr=$ff THEN
    DataWidth=".l "
 ELSE
    IF TDataType=BYTE THEN
        DataWidth=".b "
    ENDIF
    IF TDataType=SHORT THEN
        DataWidth=".w "
    ENDIF
    IF TDataType=LONG OR TDataType=FLOAT THEN
        DataWidth=".l "
    ENDIF
 ENDIF
 IF Ctr1=1 THEN
    IF TDataType<>FLOAT THEN
        OutBuf=" move"+DataWidth+"d0,"+TSymName+"(a6)"
        GenCode
    ELSE
        OutBuf=" move.l d0,"+TSymName+"(a6)"
        GenCode
        OutBuf=" move.l d1,"+TSymName+"+4(a6)"
        GenCode
        INC Ctr1
    ENDIF
 GOTOQ GetArgs1
 ENDIF
 IF Ctr1=2 THEN
    IF TDataType=FLOAT THEN
        INC Ctr1
        GOTOQ StackArg
    ENDIF
    OutBuf=" move"+DataWidth+"d1,"+TSymName+"(a6)"
    GenCode
    GOTOQ GetArgs1
 ENDIF
StackArg
 REM Get here if stack stuff
 OutBuf=" move.l "+STR$((Ctr1-2)*4)+"(sp),d2"
 GenCode
 OutBuf=" move"+DataWidth+"d2,"+TSymName+"(a6)"
 GenCode
 IF TDataType=FLOAT THEN
    INC Ctr1
    OutBuf=" move.l "+STR$((Ctr1-2)*4)+"(sp),"+TSymName+"+4(a6)"
    GenCode
 ENDIF
 GOTOQ GetArgs1

S47
* FRETURN
 GOSUB GetRetArg
 ErrMain
 IF FcnMode=$ff THEN
    OutBuf=" unlk a5"
    GenCode
 ENDIF
 GOTO S4\ gen rts code

S48
* ENDEXIT
 TempInt=6
 GOSUBQ CSChk
 ErrMain
 OutBuf=" bra _Lbl"+STR$(CS(CSP-1).TermLabel)
 GenCode
 OutBuf="_Lbl"+STR$(CS(CSP).TermLabel)
 GenCode
 DEC CSP
 GOTO MainLoop

S49
* RUN Statement
 GOSUB NexToken
 ProcName=TokenSaf
 SrcLineCpy=SrcLine
 TempStr=RIGHT$(SrcLine,LEN(SrcLine)-SrcNdx)
 SymTemp.SymName=ProcName
 GOSUB SymSrch
 IF SymFound<>$ff THEN
    SrcLine=CHR$($22)+ProcName+CHR$($22)+" RUN"+TempStr
 ELSE
    IF SymTable(SymNdx).DataType<>STRING THEN
        ErrNo=ErrTypMis
        GOTO MainLoop
    ENDIF
    SrcLine=ProcName+" RUN"+TempStr
 ENDIF
 SrcNdx=0
 GOSUB Expr
 IF ErrNo<>0 THEN
    SrcLine=SrcLineCpy
    GOTO MainLoop
 ENDIF
 OutBuf=" lea "+TSymName+"(a6),a1"
 GenCode
 OutBuf=" lea _IOBufVec(a6),a0"
 GenCode
 GenJsr _MovStr
 GOSUB Expr
 SrcLine=SrcLineCpy
 GOTO MainLoop

S50
* PARAM
 IF ProcMode=0 THEN
    PRINT "FATAL ERROR: PARAM statement while not in Procedure Mode"
    END
 ENDIF
 ParmFlag=$ff
 INC ParmCtr
 GOSUB DimVar
 IF DimOK=0 THEN MainLoop
 GOSUB SymInsert
 ErrMain
 OutBuf=" vsect"
 GenCode
 OutBuf=SymTemp.SymName+" ds.l 3"
 GenCode
 OutBuf=" ends"
 GenCode
 IF ParmCtr=1 THEN
    OutBuf=" move.l _Parm1Addr(a6),"+SymTemp.SymName+"(a6)"
    GenCode
 ELSE
    INC LabelNum
    OutBuf=" cmpi.l #"+STR$(ParmCtr-1)+",_ParmCnt(a6)"
    GenCode
    OutBuf=" bne.s _Lbl"+STR$(LabelNum)
    GenCode
    OutBuf=" move.w #E$Param,d1"
    GenCode
    OutBuf=" ori #Carry,ccr"
    GenCode
    OutBuf=" rts"
    GenCode
    OutBuf="_Lbl"+STR$(LabelNum)
    GenCode
    OutBuf=" move.l _PrmAdrPtr(a6),a0"
    GenCode
    OutBuf=" move.l (a0),"+SymTemp.SymName+"(a6)"
    GenCode
    OutBuf=" addq.l #8,_PrmAdrPtr(a6)"
    GenCode
 ENDIF
 IF SymTemp.DataType=STRING THEN
    OutBuf=" move.l #"+STR$(SymTemp.DataSize)+","+SymTemp.SymName+"+4(a6)"
    GenCode
    OutBuf=" clr.l "+SymTemp.SymName+"+8(a6)"
    GenCode
 ENDIF
 GOTO MainLoop

S51
* SETVEC
 GOSUB TokenSym
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
 IF LAND(TDataMod,VectorBit)=0 THEN
    ErrNo=ErrTypMis
    GOTO MainLoop
 ENDIF
 GOSUB NexToken
 IF TokenBuf<>"=" THEN
    ErrNo=ErrSyntax
    GOTO MainLoop
 ENDIF
 GOSUB Expr
 IF OpClass<>INTClass THEN
    ErrNo=ErrTypMis
    GOTO MainLoop
 ENDIF
 IF TSymName<>"~" THEN
    D0Loaded=0
    GOSUB LoadReg
    ErrRet
 ENDIF
 OutBuf=" move.l d0,"+ProcName+"(a6)"
 GenCode
 IF VDetail<>0 THEN\ must be STRING.. do rest of vector
    OutBuf=" move.l #"+STR$(VDetail)+","+ProcName+"+4(a6)"
    GenCode
    OutBuf=" clr.l "+ProcName+"+8(a6)"
    GenCode
 ENDIF
 GOTO MainLoop

S53
* BITCHG
 BitType=0
BitCommon
 GOSUB NexToken
 IF TokenBuf<>"(" THEN
    ErrNo=ErrSyntax
    GOTO MainLoop
 ENDIF
 GOSUB Expr\ get byte var
 IF OpClass<>INTClass THEN
    ErrNo=ErrTypMis
    GOTO MainLoop
 ENDIF
 IF DMReg<>$ff AND TDataType<>BYTE THEN
    IF TSymName<>"~" THEN
        GOSUB LoadReg
        ErrMain
    ENDIF
    GOSUB GetBase
    TempStr=",d0"
 ELSE
    IF DMReg<>$ff THEN
        GOSUB GetBase
        TempStr=",(a0)"
    ELSE
        TempStr=",d"+STR$(TDetail)
    ENDIF
 ENDIF
 GOSUB NexToken
 IF TokenBuf<>"," THEN
    ErrNo=ErrSyntax
    GOTO MainLoop
 ENDIF
 PseudoFcn=$ff
 GOSUB Expr\ get constant
 GOSUB NexToken
 IF TokenBuf<>")" THEN
    ErrNo=ErrSyntax
    GOTO MainLoop
 ENDIF
 IF OpClass<>INTClass OR DMConst<>$ff THEN
    ErrNo=ErrTypMis
    GOTO MainLoop
 ENDIF
 IF BitType=0 THEN
    OutBuf=" bchg #"+TSymName+TempStr
 ELSE
    IF BitType=1 THEN
        OutBuf=" bclr #"+TSymName+TempStr
    ELSE
        OutBuf=" bset #"+TSymName+TempStr
    ENDIF
 ENDIF
 GenCode
 IF TempStr=",d0" THEN
    OutBuf=" move"+DataWidth+"d0,(a0)"
    GenCode
 ENDIF
 GOTO MainLoop

S54
* BITCLR
 BitType=1
 GOTOQ BitCommon

S55
* BITSET
 BitType=2
 GOTOQ BitCommon

S56
* TESTOPEN
 TstOpnFlg=$ff
 GOTO OpenCommon

F0
* EOF(#FileNum)
 FileStat=$ff
 GOSUB GetPNum2
 OutBuf=" move.w #SS_EOF,d1"
 GenCode
 OutBuf=" os9 I$GetStt"
 GenCode
 OutBuf=" scs d0"
 GenCode
BoolCommon
 OpClass=BOOLClass
 TDataType=BOOLEAN
 GOSUB GetTmp
 ErrRet
 ExpTable(ExpNdx)=SymNdx
 HoldReg="d0"
 StoreFlag=$ff
 OutBuf=" move.b d0,"+SymTemp.SymName+"(a6)"
 GenCode
 RETURN
 
F1
* LEN(String)
 GOSUB ClassOp
 IF TDataType<>STRING OR DMArray=$ff THEN
    ErrNo=ErrFcn
    RETURN
 ENDIF
 OutBuf=" lea "+TSymName+"(a6),a0"
 GenCode
 GenJsr _StrLen
 GOSUB GetIntTmp
 ErrRet
 OutBuf=" move.l d1,"+SymTemp.SymName+"(a6)"
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN
 
F2
* STR$(Number)
 GOSUB ClassOp
 GOSUB LoadReg
 ErrRet
 IF OpClass<>INTClass AND OpClass<>FLTClass THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 IF OpClass=INTClass THEN
    GenJsr _LtoA
 ELSE
    GenJsr _DtoA
 ENDIF
NumToA
 GOSUB GetStrVec
 ErrRet
 OutBuf=" lea "+SymTemp.SymName+"(a6),a0"
 GenCode
 OutBuf=" lea _CBuf1Vec(a6),a1"
 GenCode
 GenJsr _MovStr
 ExpTable(ExpNdx)=SymNdx
 RETURN
 
F3
* VAL(String)
 GOSUB ClassOp
 IF TDataType<>STRING OR DMArray=$ff THEN
 ErrNo=ErrTypMis\ wrong type
    RETURN
 ENDIF
 IF Op1Class=FLTClass AND FcnCode=3 THEN
    FcnCode=23
 ENDIF
 GenJsr _ClrConv
 OutBuf=" lea "+TSymName+"(a6),a1"
 GenCode
 OutBuf=" lea _CBufVec(a6),a0"
 GenCode
 GenJsr _MovStr
 IF FcnCode=23 THEN
    GenJsr _AtoD
 ELSE
    GenJsr _AtoL
 ENDIF
 GOSUB CallErr
 IF FcnCode=23 THEN
    OpClass=FLTClass
    TDataType=FLOAT
 ELSE
    OpClass=INTClass
 ENDIF
 GOSUB GetTmp
 ErrRet
 IF FcnCode=23 THEN
    ExpTable(ExpNdx)=SymNdx
    OutBuf=" move.l d0,"+SymTemp.SymName+"(a6)"
    GenCode
    OutBuf=" move.l d1,"+SymTemp.SymName+"+4(a6)"
    GenCode
 ELSE
    GOSUB SaveD0Tmp
 ENDIF
 RETURN
 
F4
* LAND(Exp1,Exp2)
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
 IF FcnCode=4 THEN
    OutBuf=" and.l d2,d0"
 ENDIF
 IF FcnCode=6 THEN
    OutBuf=" or.l d2,d0"
 ENDIF
 IF FcnCode=8 THEN
    OutBuf=" move.l d2,d1"
    GenCode
    OutBuf=MathCall+"T$LMod"
 ENDIF
 IF FcnCode=18 THEN
    OutBuf=" eor.l d2,d0"
 ENDIF
 GenCode
 GOSUB GetIntTmp
 ErrRet
 GOSUB SaveD0Tmp
 RETURN
 
F5
* MID$(String,Position,Quantity)
 IF ExpRight-ExpLeft<>4 THEN
    ErrNo=ErrFcn
    RETURN
 ENDIF
MidLftRt$
 GOSUB ClassOp
 IF TDataType<>STRING THEN
    ErrNo=ErrFcn
    RETURN
 ENDIF
 IF DMVector=$ff AND DMTemp=0 THEN
    REM need to make a temp vector
    GOSUB MakTmpVec
    ErrRet
 ENDIF
 TempInt=TDetail
 OutBuf=" lea "+TSymName+"(a6),a0"
 GenCode
 INC ExpNdx
 GOSUB ClassOp
 IF OpClass<>INTClass AND OpClass<>FLTClass THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 IF FcnCode=5 THEN
    GOSUB LoadReg\ first arg
    ErrRet
    IF OpClass=FLTClass THEN
        OutBuf=MathCall+"T$DtoL"
        GenCode
    ENDIF
    INC ExpNdx
    GOSUB ClassOp
    IF OpClass<>INTClass AND OpClass<>FLTClass THEN
        ErrNo=ErrTypMis
        RETURN
    ENDIF
    GOSUB LoadReg\ second arg
    ErrRet
    IF OpClass=FLTClass THEN
        OutBuf=" exg d0,d2"
        GenCode
        OutBuf=" move.l d3,d1"
        GenCode
        OutBuf=MathCall+"T$DtoL"
        GenCode
        OutBuf=" move.l d0,d1"
        GenCode
        OutBuf=" move.l d2,d0"
        GenCode
    ELSE
        OutBuf=" move.l d2,d1"
        GenCode
    ENDIF
 OutBuf=" move.l #"+STR$(Target)+",d7"
 GenCode
 GenJsr _Mid$
 ELSE
    GOSUB LoadReg\ load d0
    ErrRet
    IF OpClass=FLTClass THEN
        GenCode
    ENDIF
    OutBuf=" move.l d0,d1"
    GenCode
    OutBuf=" move.l #"+STR$(Target)+",d7"
    GenCode
    IF FcnCode=7 THEN
        GenJsr _Left$
    ELSE
        GenJsr _Right$
    ENDIF
 ENDIF
 ExpNdx=ExpLeft+1
 RETURN
 
F6
* LOR(Exp1,Exp2)
 GOTOQ F4
 
F7
* LEFT$(String,Quantity)
 IF ExpRight-ExpLeft<>3 THEN
    ErrNo=ErrFcn
    RETURN
 ENDIF
 GOTOQ MidLftRt$
 
F8
* MOD(Exp1,Exp2)
 GOTOQ F4
 
F9
* CHR$(Expr)
 GOSUB ClassOp
 IF OpClass<>INTClass THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 GOSUB LoadReg
 ErrRet
 GOSUB GetStrVec
 ErrRet
 OutBuf=" move.b d0,_StrTmp"+STR$(TmpVecUse)+"(a6)"
 GenCode
 OutBuf=" move.l #1,"+SymTemp.SymName+"+4(a6)"
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN
 
F10
* RIGHT$(String,Quantity)
 GOTOQ F7
 
F11
* ASC(String)
 GOSUB ClassOp
 IF TDataType<>STRING OR DMArray=$ff THEN
    ErrNo=ErrFcn
    RETURN
 ENDIF
 OutBuf=" lea "+SymTemp.SymName+"(a6),a0"
 GenCode
 OutBuf=" move.l (a0),a0"
 GenCode
 OutBuf=" clr.l d0"
 GenCode
 OutBuf=" move.b (a0),d0"
 GenCode
 GOSUB GetIntTmp
 IF ErrNo<>0 THEN
    ErrNo=ErrFcn
    RETURN
 ENDIF
 GOSUB SaveD0Tmp
 RETURN
 
F12
* NOT(Boolean)
 GOSUB ClassOp
 IF TDataType<>1 THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 ByteSize=$ff
 D0Loaded=0
 GOSUB LoadReg
 ErrRet
 OutBuf=" not.b d0"
 GenCode
 OpClass=BOOLClass
 TDataType=BOOLEAN
 GOSUB GetTmp
 ErrRet
 ExpTable(ExpNdx)=SymNdx
 HoldReg="d0"
 StoreFlag=$ff
 OutBuf=" move.b d0,"+SymTemp.SymName+"(a6)"
 GenCode
 RETURN

F13
* BUFADR(Buffer)
 GOSUB ClassOp
 IF TDataType<>BUFFER THEN
    ErrNo=ErrTypMis
 ENDIF
 GOSUB GetBase
 IF FcnCode=13 THEN
    OutBuf=" move.l (a0),d0"
 ELSE
    OutBuf=" move.l 4(a0),d0"
 ENDIF
 GenCode
 GOSUB GetIntTmp
 ErrRet
 GOSUB SaveD0Tmp
 RETURN

F14
* BUFSIZ(Buffer)
 GOTOQ F13

F15
* TAB()
 IF PrintFlag=0 THEN
    ErrNo=ErrFcn\ function error
    RETURN
 ENDIF
 TabFlag=$ff
 GOSUB ClassOp
 IF OpClass<>INTClass AND OpClass<>FLTClass THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 GOSUB LoadReg
 ErrRet
 IF OpClass=FLTClass THEN
    OutBuf=MathCall+"T$DtoL"
    GenCode
 ENDIF
 OutBuf=" move.l d0,d1"
 GenCode
 GenJsr _PrintTab
 RETURN

F16
* PEEK(IntExpr)
 GOSUB ClassOp
 IF OpClass<>INTClass THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 D0Loaded=0
 GOSUB LoadReg
 OutBuf=" move.l d0,a2"
 GenCode
 OutBuf=" clr.l d0"
 GenCode
 OutBuf=" move.b (a2),d0"
 GenCode
 GOSUB GetIntTmp
 ErrRet
 GOSUB SaveD0Tmp
 RETURN

F17
* ADDR(Var)
 GOSUB ClassOp
 IF TDataType>STRING AND TDataType<COMPLEX OR DMConst=$ff OR DMReg=$ff THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 GOSUB GetBase
 GOSUB GetIntTmp
 ErrRet
 OutBuf=" move.l a0,"+SymTemp.SymName+"(a6)"
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN

F18
* LXOR(IntExpr)
 GOTOQ F4

F19
* LNOT(IntExpr)
 GOSUB ClassOp
 IF OpClass<>INTClass THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 IF TSymName<>"~" THEN
    D0Loaded=0
    GOSUB LoadReg
    ErrRet
 ENDIF
 OutBuf=" not.l d0"
 GenCode
 GOSUB  GetIntTmp
 ErrRet
 GOSUB SaveD0Tmp
 RETURN

F20
* INDEX(Pointer,IntExpr)
 GOSUB ClassOp
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
 IF DMAddr=0 THEN
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
 IF OpClass<>INTClass THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 OutBuf=" move.l d2,d1"
 GenCode
 OutBuf=" move.l d0,d3"
 GenCode
 OutBuf=" move.l #"+STR$(VarSize)+",d0"
 GenCode
 OutBuf=MathCall+"T$LMul"
 GenCode
 OutBuf=" add.l d0,d3"
 GenCode
 GOSUB GetTmp
 ErrRet
 OutBuf=" move.l d3,"+SymTemp.SymName+"(a6)"
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN

F21
* SIZE(Var)
 GOSUB ClassOp
 IF TDataType<1 OR TDataType>6 THEN SIZE1
 VarSize=TDataSize
 GOTOQ SIZE2
SIZE1
 IF TDataType=BUFFER THEN
    VarSize=8
    GOTOQ SIZE2
 ENDIF
 IF TDataType=COMPLEX THEN
    VarSize=TDataSize
    GOTOQ SIZE2
 ENDIF
 ErrNo=ErrTypMis
 RETURN
SIZE2
 GOSUB GetIntTmp
 ErrRet
 OutBuf=" move.l #"+STR$(VarSize)+","+SymTemp.SymName+"(a6)"
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN

F22
* IVAL(String)
 GOTOQ F3

F23
* FVAL(String)
 GOTOQ F3

F24
* INKEY(#Path)
 FileStat=$ff
 GOSUB GetPNum2
 IF FcnCode=24 THEN
    TempStr="#SS_Ready"
    Reg1Name="d1"
 ENDIF
 IF FcnCode=25 THEN
    TempStr="#SS_Size"
    Reg1Name="d2"
 ENDIF
 IF FcnCode=26 THEN
    TempStr="#SS_Pos"
    Reg1Name="d2"
 ENDIF
 OutBuf=" move.w "+TempStr+",d1"
 GenCode
 OutBuf=" os9 I$GetStt"
 GenCode
 IF FcnCode=24 THEN
    INC LabelNum
    OutBuf=" bcc.s _Lbl"+STR$(LabelNum)
    GenCode
    OutBuf=" clr.l d1"
    GenCode
    OutBuf="_Lbl"+STR$(LabelNum)
    GenCode
 ENDIF
 GOSUB GetIntTmp
 ErrRet
 ExpTable(ExpNdx)=SymNdx
 OutBuf=" move.l "+Reg1Name+","+SymTemp.SymName+"(a6)"
 GenCode
 RETURN

F25
* FILSIZ(#FileNum)
 GOTOQ F24

F26
* FILPOS(#FileNum)
 GOTOQ F24

F27
* SQR(Expr)
 GOSUB ClassOp
 GOSUB LoadReg
 ErrRet
 IF OpClass<>INTClass AND OpClass<>FLTClass THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 IF OpClass=INTClass THEN
    OutBuf=MathCall+"T$LtoD"
    GenCode
 ENDIF
 GOSUB GenPrec
 IF FcnCode=27 THEN
    OutBuf=MathCall+"T$Sqrt"
 ENDIF
 IF FcnCode=30 THEN
    OutBuf=MathCall+"T$Sin"
 ENDIF
 IF FcnCode=31 THEN
    OutBuf=MathCall+"T$Cos"
 ENDIF
 IF FcnCode=32 THEN
    OutBuf=MathCall+"T$Tan"
 ENDIF
 IF FcnCode=33 THEN
    OutBuf=MathCall+"T$Asn"
 ENDIF
 IF FcnCode=34 THEN
    OutBuf=MathCall+"T$Acs"
 ENDIF
 IF FcnCode=35 THEN
    OutBuf=MathCall+"T$Atn"
 ENDIF
 IF FcnCode=36 THEN
    OutBuf=MathCall+"T$Log"
 ENDIF
 IF FcnCode=37 THEN
    OutBuf=MathCall+"T$Log10"
 ENDIF
 GenCode
FloatRet
 OpClass=FLTClass
 TDataType=FLOAT
 GOSUB GetTmp
 ErrRet
 ExpTable(ExpNdx)=SymNdx
 OutBuf=" move.l d0,"+SymTemp.SymName+"(a6)"
 GenCode
 OutBuf=" move.l d1,"+SymTemp.SymName+"+4(a6)"
 GenCode
 RETURN

F28
* INT(FloatExpr)
 GOSUB ClassOp
 IF OpClass<>FLTClass THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 GOSUB LoadReg
 ErrRet
 OutBuf=MathCall+"T$DtoL"
 GenCode
 GOSUB GetIntTmp
 ErrRet
 GOSUB SaveD0Tmp
 RETURN

F29
* ABS(Expr)
 GOSUB ClassOp
 GOSUB LoadReg
 ErrRet
 IF OpClass<>INTClass AND OpClass<>FLTClass THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 INC LabelNum
 OutBuf=" tst.l d0"
 GenCode
 IF OpClass=INTClass THEN
    OutBuf=" bpl.s _Lbl"+STR$(LabelNum)
    GenCode
    OutBuf=" neg.l d0"
    GenCode
 ELSE
    OutBuf=" beq.s _Lbl"+STR$(LabelNum)
    GenCode
    OutBuf=" bpl.s _Lbl"+STR$(LabelNum)
    GenCode
    OutBuf=" bchg #31,d0"
    GenCode
 ENDIF
 OutBuf="_Lbl"+STR$(LabelNum)
 GenCode
 GOSUB GetTmp
 ErrRet
 GOSUB SaveD0Tmp
 RETURN

F30
* SIN(Expr)
 GOTOQ F27

F31
* COS(Expr)
 GOTOQ F27

F32
* TAN(Expr)
 GOTOQ F27

F33
* ASN(Expr)
 GOTOQ F27

F34
* ACS(Expr)
 GOTOQ F27

F35
* ATN(Expr)
 GOTOQ F27

F36
* LOG(Expr)
 GOTOQ F27

F37
* LOG10(Expr)
 GOTOQ F27

F38
* JTIM()
 GOTOQ DateTime

F39
* JDAT()
 GOTOQ DateTime

F40
* THOUR()
 GOTOQ DateTime

F41
* TMIN()
 GOTOQ DateTime

F42
* TSEC()
 GOTOQ DateTime

F43
* TYEAR()
 GOTOQ DateTime

F44
* TMON()
 GOTOQ DateTime

F45
* TDAT()
 GOTOQ DateTime

F46
* TDAY()
 GOTOQ DateTime

DateTime
 GOSUB ClassOp
 IF OpClass<>INTClass THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 IF FcnCode=38 OR FcnCode=39 THEN\ Julian
    OutBuf=" move.w #1,d0"
 ELSE
    OutBuf=" clr.w d0"
 ENDIF
 GenCode
 OutBuf=" os9 F$Time"
 GenCode
 IF FcnCode=39 THEN
    OutBuf=" move.l d1,d0"
    GenCode
 ENDIF
 IF FcnCode=40 THEN
    OutBuf=" lsr.l #8,d0"
    GenCode
    OutBuf=" lsr.l #8,d0"
    GenCode
 ENDIF
 IF FcnCode=41 THEN
    OutBuf=" lsr.l #8,d0"
    GenCode
    OutBuf=" and.l #$ff,d0"
    GenCode
 ENDIF
 IF FcnCode=42 THEN
    OutBuf=" and.l #$ff,d0"
    GenCode
 ENDIF
 IF FcnCode>=43 AND FcnCode<=45 THEN
    OutBuf=" move.l d1,d0"
    GenCode
 ENDIF
 IF FcnCode=43 THEN
    OutBuf=" lsr.l #8,d0"
    GenCode
    OutBuf=" lsr.l #8,d0"
    GenCode
 ENDIF
 IF FcnCode=44 THEN
    OutBuf=" lsr.l #8,d0"
    GenCode
    OutBuf=" and.l #$ff,d0"
    GenCode
 ENDIF
 IF FcnCode=45 THEN
    OutBuf=" and.l #$ff,d0"
    GenCode
 ENDIF
 IF FcnCode=46 THEN
    OutBuf=" clr.l d0"
    GenCode
    OutBuf=" move.w d2,d0"
    GenCode
 ENDIF
 GOSUB GetTmp
 ErrRet
 GOSUB SaveD0Tmp
 RETURN

F47
* RUN Function
 NumArgs=ExpRight-ExpLeft-1
 ParamCnt=NumArgs
 StackAdj=0
 ExpNdx=ExpRight-1
 OutBuf=" clr.l -(sp)"\ reserve space for mod ptr
 GenCode
GetParmLp
 GOSUB ClassOp
 IF TDataType<BOOLEAN OR TDataType>STRING THEN
    IF TDataType<>COMPLEX THEN
        ErrNo=ErrFcn
        RETURN
    ENDIF
 ENDIF
 IF OpClass=INTClass OR OpClass=FLTClass THEN
    IF DMConst=$ff THEN
        GOSUB GetTmp
        ErrRet
        IF TDataType=FLOAT THEN
            FloatName=TSymName
            GOSUB SplitFlt
            OutBuf=" move.l #"+HiFltStr+","+SymTemp.SymName+"(a6)"
            GenCode
            OutBuf=" move.l #"+LoFltStr+","+SymTemp.SymName+"+4(a6)"
            GenCode
        ELSE
            OutBuf=" move.l #"+TSymName+","+SymTemp.SymName+"(a6)"
            GenCode
        ENDIF
        ExpTable(ExpNdx)=SymNdx
        TSymName=SymTemp.SymName\ need this for GetBase
    ENDIF
 ENDIF
 OutBuf=" move.l #"+STR$(TDataSize)+",-(sp)"
 GenCode
 StackAdj=StackAdj+4
 GOSUB GetBase
 IF NumArgs<>1 THEN
    StackAdj=StackAdj+4
 ENDIF
 OutBuf=" move.l a0,-(sp)"
 GenCode
 DEC ExpNdx
 DEC NumArgs
 IF NumArgs>0 THEN GetParmLp
 OutBuf=" clr.w d0" any type
 GenCode
 OutBuf=" lea _IOBuffer(a6),a0"
 GenCode
 OutBuf=" os9 F$Link"
 GenCode
 OutBuf=" bcc.s _Lbl"+STR$(LabelNum+2)\ *** CAUTION!!!... LabelNum+2 assumes 2 CallErr's follow
 GenCode
 OutBuf=" move.b #Exec_,d0"\ set for execution dir
 GenCode
 OutBuf=" clr.l d1"\ no colored mem
 GenCode
 OutBuf=" lea _IOBuffer(a6),a0"
 GenCode
 OutBuf=" os9 F$Load"
 GenCode
 GOSUB CallErr
 OutBuf=" clr.w d0"\ any type
 GenCode
 OutBuf=" lea _IOBuffer(a6),a0"
 GenCode
 OutBuf=" os9 F$Link"
 GenCode
 GOSUB CallErr
 OutBuf=" move.l #"+STR$(ParamCnt)+",d0"
 GenCode
 OutBuf=" move.l (sp)+,d1"
 GenCode
 OutBuf=" move.l a2,"+STR$(StackAdj)+"(sp)"\ save mod ptr for unlink
 GenCode
 OutBuf=" jsr (a1)"
 GenCode
 OutBuf=" adda.l #"+STR$(StackAdj)+",sp"
 GenCode
 GOSUB CallErr
 OutBuf=" move.l (sp)+,a2"\ get mod ptr
 GenCode
 OutBuf=" os9 F$UnLink"
 GenCode
 GOSUB CallErr
 ExpTable(ExpNdx)=21\ return zero
 RETURN

F48
* HEX$(INT)
 GOSUB ClassOp
 GOSUB LoadReg
 ErrRet
 IF OpClass<>INTClass THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 GenJsr _LtoH
 GOTOQ NumToA

F49
* BITTST(ByteVar,Bit#)
 GOSUB ClassOp
 IF OpClass<>INTClass THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 IF DMReg<>$ff AND TDataType<>BYTE THEN
    IF TSymName<>"~" THEN
        GOSUB LoadReg
        ErrRet
    ENDIF
    TempStr=",d0"
 ELSE
    IF DMReg<>$ff THEN
        GOSUB GetBase
        TempStr=",(a0)"
    ELSE
        TempStr=",d"+STR$(TDetail)
    ENDIF
 ENDIF
 INC ExpNdx
 GOSUB ClassOp
 IF OpClass<>INTClass OR DMConst<>$ff THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 OutBuf=" btst #"+TSymName+TempStr
 GenCode
 OutBuf=" sne d0"
 GenCode
 GOTO BoolCommon

F50
* SHL
 GOSUB ClassOp
 IF OpClass<>INTClass THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 IF TSymName<>"~" THEN
    GOSUB LoadReg
    ErrRet
 ENDIF
 DWSafe=DataWidth
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
 IF FcnCode=50 THEN
    OutBuf=" lsl"+DWSafe+"d2,d0"
 ENDIF
 IF FcnCode=51 THEN
    OutBuf=" lsr"+DWSafe+"d2,d0"
 ENDIF
 IF FcnCode=52 THEN
    OutBuf=" rol"+DWSafe+"d2,d0"
 ENDIF
    IF FcnCode=53 THEN
    OutBuf=" ror"+DWSafe+"d2,d0"
 ENDIF
 IF FcnCode=54 THEN
    OutBuf=" bchg d2,d0"
 ENDIF
 IF FcnCode=55 THEN
    OutBuf=" bclr d2,d0"
 ENDIF
 IF FcnCode=56 THEN
    OutBuf=" bset d2,d0"
 ENDIF
 GenCode
 GOSUB GetIntTmp
 ErrRet
 GOSUB SaveD0Tmp
 RETURN

F51
* SHR
 GOTOQ F50

F52
* ROL
 GOTOQ F50

F53
* ROR
 GOTOQ F50

F54
* BITCHG
 GOTOQ F50

F55
* BITCLR
 GOTOQ F50

F56
* BITSET
 GOTOQ F50

F57
* SUBSTR(Str1,Str2)
 GOSUB ClassOp
 IF TDataType<>STRING THEN
    ErrNo=ErrFcn
    RETURN
 ENDIF
 IF DMVector=$ff AND DMTemp=0 THEN
    GOSUB MakTmpVec
    ErrRet
 ENDIF
 OutBuf=" move.l "+TSymName+"(a6),_SStr1(a6)"
 GenCode
 OutBuf=" move.l "+TSymName+"+4(a6),_SStr1+4(a6)"
 GenCode
 OutBuf=" move.l "+TSymName+"+8(a6),_SStr1+8(a6)"
 GenCode
 INC ExpNdx
 GOSUB ClassOp
 IF TDataType<>STRING THEN
    ErrNo=ErrFcn
    RETURN
 ENDIF
 IF DMVector=$ff AND DMTemp=0 THEN
    GOSUB MakTmpVec
    ErrRet
 ENDIF
 OutBuf=" move.l "+TSymName+"(a6),_SStr2(a6)"
 GenCode
 OutBuf=" move.l "+TSymName+"+4(a6),_SStr2+4(a6)"
 GenCode
 OutBuf=" move.l "+TSymName+"+8(a6),_SStr2+8(a6)"
 GenCode
 GenJsr _SubStr
 GOSUB GetIntTmp
 ErrRet
 GOSUB SaveD0Tmp
 RETURN

F58
* ZSTR$(INT)
 GOSUB ClassOp
 GOSUB LoadReg
 ErrRet
 IF OpClass<>INTClass THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 GenJsr _ZLtoA
 GOTO NumToA

F59
* ZHEX$(INT)
 GOSUB ClassOp
 GOSUB LoadReg
 ErrRet
 IF OpClass<>INTClass THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 GenJsr _ZLtoH
 GOTO NumToA

F60
* USING()
 NumArgs=ExpRight-ExpLeft-1
 ExpNdx=ExpRight-1
 StackAdj=NumArgs*4+4
 FOR Ctr1=1 TO NumArgs
    GOSUB ClassOp
    IF TDataType<>STRING OR DMAddr=$ff THEN
        GOSUB MakString
        ErrRet
        GOSUB ClassOp
    ENDIF
    OutBuf=" lea "+TSymName+"(a6),a0"
    GenCode
    OutBuf=" move.l a0,-(sp)"
    GenCode
    DEC ExpNdx
 NEXT Ctr1
 OutBuf=" move.l #"+STR$(NumArgs)+",-(sp)"
 GenCode
 OutBuf=" move.l #_BufSize,d1" pass buffer size to function
 GenCode
 GenJsr _PUsing
 OutBuf=" adda.l #"+STR$(StackAdj)+",sp"
 GenCode
 ExpTable(ExpNdx)=21\ return zero
 RETURN

UsrFcn
 TempInt=TempInt-1001\ now TempInt=number of args
 IF TempInt=10 THEN
    NumArgs=ExpRight-ExpLeft-1
 ELSE
    NumArgs=TempInt
    IF ExpRight-ExpLeft<>NumArgs+1 THEN
        ErrNo=ErrFcn
        RETURN
    ENDIF
 ENDIF
 StackAdj=0
 FcnType=LAND($00000003,SymTemp.DataSize)
 FcnPtrFlg=LAND($00000004,SymTemp.DataSize)
 ExpNdx=ExpRight-1\ point to last arg
 D1Loaded=0
GetFcnLp
 GOSUB GetFcnArg
 ErrRet
 IF NumArgs=2 AND OpClass<>FLTClass THEN
    OutBuf=" move.l d0,d1"
    GenCode
    D1Loaded=$ff
 ENDIF
 IF NumArgs=2 AND OpClass=FLTClass OR NumArgs>2 THEN
    IF OpClass=FLTClass THEN
        OutBuf=" move.l d1,-(sp)"
        GenCode
        INC StackAdj
    ENDIF
    OutBuf=" move.l d0,-(sp)"
    GenCode
    INC StackAdj
 ENDIF
 DEC ExpNdx
 DEC NumArgs
 IF NumArgs>0 THEN GetFcnLp
 IF FcnPtrFlg=0 THEN
    IF ProgSize=$ff THEN
        IF Machine<2 THEN
            OutBuf=" move.l #"+UsrFcnNam+"-*-8,a2"
            GenCode
            OutBuf=" jsr (pc,a2.l)"
        ELSE
            OutBuf=" bsr.l "+UsrFcnNam
        ENDIF
    ELSE
        OutBuf=" bsr "+UsrFcnNam
    ENDIF
 ELSE
    OutBuf=" move.l "+UsrFcnNam+"(a6),a2"
    GenCode
    OutBuf=" jsr (a2)"
 ENDIF
 GenCode
 IF StackAdj>0 THEN
    OutBuf=" adda.l #"+STR$(StackAdj*4)+",sp"
    GenCode
 ENDIF
 IF FcnType=0 THEN\ VOID
    GOSUB GetIntTmp
    ErrRet
    ExpTable(ExpNdx)=SymNdx
 ENDIF
 IF FcnType=1 THEN\ INT
    GOSUB GetIntTmp
    ErrRet
    GOSUB SaveD0Tmp
 ENDIF
 IF FcnType=2 THEN\ FLOAT
    GOSUB FloatRet
 ENDIF
 GOTO FcnReturn

SaveD0Tmp
 HoldReg="d0"
 StoreFlag=$ff
 OutBuf=" move.l d0,"+SymTemp.SymName+"(a6)"
 GenCode
 ExpTable(ExpNdx)=SymNdx
 RETURN

GetFcnArg
 GOSUB ClassOp
 D0Loaded=0
 IF D1Loaded=$ff AND OpClass=FLTClass THEN
    OutBuf=" move.l d1,-(sp)"
    GenCode
    INC StackAdj
 ENDIF
 IF OpClass=INTClass OR OpClass=FLTClass THEN
    GOSUB LoadReg
 ELSE
    IF OpClass=STRClass OR OpClass=ARRClass OR OpClass=CPXClass THEN
        GOSUB GetBase
        OutBuf=" move.l a0,d0"
        GenCode
    ELSE
        ErrNo=ErrTypMis
        RETURN
    ENDIF
 ENDIF
 RETURN

GetRetArg
 GOSUB Expr
 ErrRet
 IF OpClass<>INTClass AND OpClass<>FLTClass THEN
    ErrNo=ErrTypMis
    RETURN
 ENDIF
 IF SymTemp.SymName<>"~" THEN
    D0Loaded=0
    GOSUB LoadReg
    ErrRet
 ENDIF
 RETURN

KeyTable
 DATA "data"
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
 DATA "freturn"
 DATA "endexit"
 DATA "run"
 DATA "param"
 DATA "setvec"
 DATA "digits"
 DATA "bitchg"
 DATA "bitclr"
 DATA "bitset"
 DATA "testopen"
 DATA "align"
 DATA "os9"
 DATA "tcall"
 DATA "pag"
 DATA "ttl"
 DATA "dc"
 DATA "do"
 DATA "ds"
 DATA "dz"
 DATA "equ"
 DATA "set"
 DATA "blo"
 DATA "bhs"
 DATA "slo"
 DATA "shs"
 DATA "vsect"
 DATA "psect"
 DATA "ends"
 DATA "abcd"
 DATA "add"
 DATA "adda"
 DATA "addi"
 DATA "addq"
 DATA "addx"
 DATA "and"
 DATA "andi"
 DATA "asl"
 DATA "asr"
 DATA "bchg"
 DATA "bclr"
 DATA "bset"
 DATA "btst"
 DATA "chk"
 DATA "clr"
 DATA "cmp"
 DATA "cmpa"
 DATA "cmpi"
 DATA "cmpm"
 DATA "divs"
 DATA "divu"
 DATA "eor"
 DATA "eori"
 DATA "exg"
 DATA "ext"
 DATA "lea"
 DATA "link"
 DATA "lsl"
 DATA "lsr"
 DATA "move"
 DATA "movea"
 DATA "movem"
 DATA "movep"
 DATA "moveq"
 DATA "muls"
 DATA "mulu"
 DATA "nbcd"
 DATA "neg"
 DATA "negx"
 DATA "not"
 DATA "or"
 DATA "ori"
 DATA "pea"
 DATA "ror"
 DATA "rol"
 DATA "roxr"
 DATA "roxl"
 DATA "sbcd"
 DATA "scc"
 DATA "scs"
 DATA "seq"
 DATA "sge"
 DATA "sgt"
 DATA "shi"
 DATA "sle"
 DATA "sls"
 DATA "slt"
 DATA "smi"
 DATA "sne"
 DATA "spl"
 DATA "svc"
 DATA "sf"
 DATA "st"
 DATA "sub"
 DATA "suba"
 DATA "subi"
 DATA "subq"
 DATA "subx"
 DATA "swap"
 DATA "tas"
 DATA "tst"
 DATA "unlk"
 DATA "bcc"
 DATA "bcs"
 DATA "beq"
 DATA "bge"
 DATA "bgt"
 DATA "bhi"
 DATA "ble"
 DATA "bls"
 DATA "blt"
 DATA "bmi"
 DATA "bne"
 DATA "bpl"
 DATA "bra"
 DATA "bsr"
 DATA "jmp"
 DATA "jsr"
 DATA "bvc"
 DATA "nop"
 DATA "reset"
 DATA "rtr"
 DATA "rte"
 DATA "rts"
 DATA "stop"
 DATA "trap"
 DATA "trapv"
 DATA "dbcc"
 DATA "dbcs"
 DATA "dbeq"
 DATA "dbf"
 DATA "dbge"
 DATA "dbgt"
 DATA "dbhi"
 DATA "dble"
 DATA "dbls"
 DATA "dblt"
 DATA "dbmi"
 DATA "dbne"
 DATA "dbpl"
 DATA "dbra"
 DATA "dbt"
 DATA "dbvc"
 DATA "dbvs"
 DATA "%"
 
DefineTbl
 DATA "set"
 DATA "macro"
 DATA "endm"
 DATA "if"
 DATA "else"
 DATA "endif"
 DATA "use"
 DATA "fcn"
 DATA "fix"
 DATA "rof"
 DATA "lib"
 DATA "struct"
 DATA "endstruct"
 DATA "%"

ErrorTbl
 DATA "Undefined symbol"
 DATA "Invalid symbol name"
 DATA "Type mismatch or wrong type"
 DATA "Invalid Expression"
 DATA "Syntax Error"
 DATA "Symbol already defined"
 DATA "Symbol table full"
 DATA "Undefined error"
 DATA "Invalid data type"
 DATA "Invalid data type modifier"
 DATA "Macro argument error"
 DATA "Invalid directive"
 DATA "Macro already defined"
 DATA "ENDSTRUCT without STRUCT"
 DATA "Nested macro"
 DATA "Macro buffer full"
 DATA "Invalid macro"
 DATA "ENDM without MACRO"
 DATA "Unbalanced control structure"
 DATA "Nested too deep"
 DATA "Undefined error"
 DATA "Invalid parameter"
 DATA "Undefined error"
 DATA "Expression too complex"
 DATA "Invalid function"
 DATA "No more temps available"
 DATA "Unbalanced parens"
 DATA "Function error"
 DATA "Invalid target"
 DATA "No more registers available"
 
PreDefTbl
 DATA "(",9,0,0,0,0
 DATA ")",9,0,0,0,0
 DATA "(",9,0,0,0,0
 DATA ")",9,0,0,0,0
 DATA "(",9,0,0,0,0
 DATA ")",9,0,0,0,0
 DATA "=",9,0,0,0,0
 DATA "<",9,0,0,0,0
 DATA ">",9,0,0,0,0
 DATA "<=",9,0,0,0,0
 DATA ">=",9,0,0,0,0
 DATA "<>",9,0,0,0,0
 DATA ".",9,0,0,0,0
 DATA ",",9,0,0,0,0
 DATA "+",9,0,0,0,0
 DATA "-",9,0,0,0,0
 DATA "*",9,0,0,0,0
 DATA "/",9,0,0,0,0
 DATA "~",9,4,0,0,0
 DATA "_NullStr",$06,$00,0,0,0
 DATA "$0",4,4,0,0,4
 DATA "(",9,0,0,0,0
 DATA ")",9,0,0,0,0
 DATA "(",9,0,0,0,0
 DATA ")",9,0,0,0,0
 DATA "[",9,0,0,0,0
 DATA "]",9,0,0,0,0
 DATA "true",1,4,$ff,0,0
 DATA "false",1,4,0,0,0
 DATA "eof",10,0,0,0,0
 DATA "len",10,0,1,0,0
 DATA "str$",10,0,2,0,0
 DATA "val",10,0,3,0,0
 DATA "land",10,0,4,0,0
 DATA "mid$",10,0,5,0,0
 DATA "lor",10,0,6,0,0
 DATA "left$",10,0,7,0,0
 DATA "mod",10,0,8,0,0
 DATA "chr$",10,0,9,0,0
 DATA "right$",10,0,10,0,0
 DATA "asc",10,0,11,0,0
 DATA "not",10,0,12,0,0
 DATA "bufadr",10,0,13,0,0
 DATA "bufsiz",10,0,14,0,0
 DATA "tab",10,0,15,0,0
 DATA "peek",10,0,16,0,0
 DATA "addr",10,0,17,0,0
 DATA "lxor",10,0,18,0,0
 DATA "lnot",10,0,19,0,0
 DATA "index",10,0,20,0,0
 DATA "size",10,0,21,0,0
 DATA "ival",10,0,22,0,0
 DATA "fval",10,0,23,0,0
 DATA "inkey",10,0,24,0,0
 DATA "filsiz",10,0,25,0,0
 DATA "filpos",10,0,26,0,0
 DATA "sqr",10,0,27,0,0
 DATA "int",10,0,28,0,0
 DATA "abs",10,0,29,0,0
 DATA "sin",10,0,30,0,0
 DATA "cos",10,0,31,0,0
 DATA "tan",10,0,32,0,0
 DATA "asn",10,0,33,0,0
 DATA "acs",10,0,34,0,0
 DATA "atn",10,0,35,0,0
 DATA "log",10,0,36,0,0
 DATA "log10",10,0,37,0,0
 DATA "jtim",10,0,38,0,0
 DATA "jdat",10,0,39,0,0
 DATA "thour",10,0,40,0,0
 DATA "tmin",10,0,41,0,0
 DATA "tsec",10,0,42,0,0
 DATA "tyear",10,0,43,0,0
 DATA "tmon",10,0,44,0,0
 DATA "tdat",10,0,45,0,0
 DATA "tday",10,0,46,0,0
 DATA "run",10,0,47,0,0
 DATA "hex$",10,0,48,0,0
 DATA "bittst",10,0,49,0,0
 DATA "shl",10,0,50,0,0
 DATA "shr",10,0,51,0,0
 DATA "rol",10,0,52,0,0
 DATA "ror",10,0,53,0,0
 DATA "bitchg",10,0,54,0,0
 DATA "bitclr",10,0,55,0,0
 DATA "bitset",10,0,56,0,0
 DATA "substr",10,0,57,0,0
 DATA "zstr$",10,0,58,0,0
 DATA "zhex$",10,0,59,0,0
 DATA "using",10,0,60,0,0
 DATA "ERR",4,0,0,0,4
 DATA "ModAddr",4,0,0,0,4
 DATA "POS",4,0,0,0,4
 DATA "_DummyArg",4,0,0,0,4
 DATA "errno",4,0,0,0,4
 DATA "_Tmp1",4,$40,0,0,4
 DATA "_Tmp2",4,$40,0,0,4
 DATA "_Tmp3",4,$40,0,0,4
 DATA "_Tmp4",4,$40,0,0,4
 DATA "_Tmp5",4,$40,0,0,4
 DATA "_Tmp6",4,$40,0,0,4
 DATA "_Tmp7",4,$40,0,0,4
 DATA "_Tmp8",4,$40,0,0,4
 DATA "_Tmp9",4,$40,0,0,4
 DATA "_Tmp10",4,$40,0,0,4
 DATA "_Tmp11",4,$40,0,0,4
 DATA "_Tmp12",4,$40,0,0,4
 DATA "_Tmp13",4,$40,0,0,4
 DATA "_Tmp14",4,$40,0,0,4
 DATA "_Tmp15",4,$40,0,0,4
 DATA "_TmpVec1",13,TmpVec,0,0,0
 DATA "_TmpVec2",13,TmpVec,0,0,0
 DATA "_TmpVec3",13,TmpVec,0,0,0
 DATA "_TmpVec4",13,TmpVec,0,0,0
 DATA "_TmpVec5",13,TmpVec,0,0,0
 DATA "_TmpVec6",13,TmpVec,0,0,0
 DATA "_TmpVec7",13,TmpVec,0,0,0
 DATA "_TmpVec8",13,TmpVec,0,0,0
 DATA "_TmpVec9",13,TmpVec,0,0,0
 DATA "_TmpVec10",13,TmpVec,0,0,0
 DATA "_TmpVec11",13,TmpVec,0,0,0
 DATA "_TmpVec12",13,TmpVec,0,0,0
 DATA "_TmpVec13",13,TmpVec,0,0,0
 DATA "_TmpVec14",13,TmpVec,0,0,0
 DATA "_TmpVec15",13,TmpVec,0,0,0
 DATA "&",9,0,0,0,0
 DATA "|",9,0,0,0,0
 DATA "Edition",0,0,0,0,0
 DATA "NextArg",6,TmpVec,0,0,0
 DATA "XferCount",4,0,0,0,0
 DATA "%"
 
 
Finish
 IF InpFilPtr>1 THEN
    CLOSE #InpFile(InpFilPtr)
    DEC InpFilPtr
    GOTO MainLoop
 ENDIF
 CLOSE #PoolFile
 OPEN #PoolFile,"_PoolFile":READ
 CLOSE #InitFile
 OPEN #InitFile,"_InitFile":READ
 CLOSE #InpFile(InpFilPtr)
 IF LastStmt<>"end" AND ProgMode=$ff THEN
    OutBuf=" clr.l d1"
    GenCode
    IF CEnviron=$ff THEN
        OutBuf=" clr.l d0"
        GenCode
        OutBuf=" bsr exit"
    ELSE
        OutBuf=" os9 F$Exit"
    ENDIF
    GenCode
 ENDIF
 IF LastStmt<>"end" AND ProcMode=$ff THEN
    OutBuf=" unlk a5"
    GenCode
    OutBuf=" clr.l d1"
    GenCode
    OutBuf=" rts"
    GenCode
 ENDIF
 IF LastStmt<>"freturn" AND LastStmt<>"end" AND FcnMode=$ff THEN
    OutBuf=" unlk a5"
    GenCode
    OutBuf=" rts"
    GenCode
 ENDIF
 ROFList=ROFList+" -l=LIB/cdllib.l"
 IF ProgMode=$ff THEN
    ROFList=ROFList+" -l=LIB/proglib.l "
 ENDIF
 IF ProcMode=$ff THEN
    ROFList=ROFList+" -l=LIB/proclib.l "
 ENDIF
 IF DrvrMode=$ff THEN
    ROFList=ROFList+" -l=LIB/drvrlib.l "
 ENDIF
 IF ROMMode=$ff THEN
    ROFList=ROFList+" -l=LIB/romlib.l "
 ENDIF
 OutBuf=" vsect"
 GenCode
 VarBytes=VarBytes-4750
 IF TmpMax>0 THEN
    FOR Ctr1=1 TO TmpMax
        OutBuf="_Tmp"+STR$(Ctr1)+" ds.l 2"
        GenCode
        VarBytes=VarBytes+8
    NEXT Ctr1
 ENDIF
 IF StrTmpMax>0 THEN
    FOR Ctr1=1 TO StrTmpMax
        OutBuf="_StrTmp"+STR$(Ctr1)+" ds.b 22"
        GenCode
        VarBytes=VarBytes+22
    NEXT Ctr1
 ENDIF
 IF TmpVecMax>0 THEN
    FOR Ctr1=1 TO TmpVecMax
        OutBuf="_TmpVec"+STR$(Ctr1)+" ds.l 3"
        GenCode
        VarBytes=VarBytes+12
    NEXT Ctr1
 ENDIF
 IF LopVecMax>0 THEN
    FOR Ctr1=1 TO LopVecMax
        OutBuf="_LopVec"+STR$(Ctr1)+" ds.l 2"
        GenCode
        VarBytes=VarBytes+8
    NEXT Ctr1
 ENDIF
 OutBuf=" ends"
 GenCode
Init1
 OutBuf=""
Init2
 IF EOF(#InitFile) THEN Init4
 GET #InitFile,RawData
 IF ASC(RawData)=$0d THEN Init3
 OutBuf=OutBuf+RawData
 GOTOQ Init2
Init3
 GenCode
 GOTOQ Init1
Init4
 Close #InitFile
 DELETE "_InitFile"
 IF FcnMode+ZeroMode=0 THEN
    OutBuf=" move.l #Start-*-8,a2"
    GenCode
    OutBuf=" jmp (pc,a2.l)"
    GenCode
 ENDIF
lbl9994 OutBuf=""
lbl9995 IF EOF(#PoolFile) THEN 9997
 GET #PoolFile,RawData
 IF ASC(RawData)=$0d THEN 9996
 OutBuf=OutBuf+RawData
 GOTOQ lbl9995
9996 GenCode
 GOTOQ lbl9994
9997 CLOSE #PoolFile
 DELETE "_PoolFile"
 CLOSE #OutFile
 FOR Ctr1=1 TO SymTabSiz
    IF SymTable(Ctr1).DataType=LABEL THEN
        IF SymTable(Ctr1).Detail=$ff THEN
            INC ErrCnt
            PRINT "Label ";SymTable(Ctr1).SymName;" unresolved"
        ENDIF
    ENDIF
 NEXT Ctr1
lbl9999 IF CSP<>0 THEN
    PRINT "Unbalanced control structure in line ";CS(CSP).ConLine
    DEC CSP
    INC ErrCnt
    GOTOQ lbl9999
 ENDIF
 IF GFNdx<>1 THEN
    PRINT "Unbalanced conditional stack"
    INC ErrCnt
 ENDIF
 IF ErrCnt<>0 then
    PRINT ErrCnt;" error(s)"
 ELSE
    IF NoGen=0 AND AsmbFlag=0 AND ErrCnt=0 THEN
        IF Machine<2 THEN
            TempStr="r68 "+FileName+".a -qo=RELS/"+FileName+".r"
        ELSE
            TempStr="r68020 "+FileName+".a -qo=RELS/"+FileName+".r"
        ENDIF
        PRINT TempStr
        SHELL TempStr
        IF ProgMode=$ff OR ProcMode=$ff THEN
            TempStr="l68 "+ROFList+LibList+" -l=/dd/LIB/sys.l"+LibOut+l68Opt
            IF ProgMode=$ff THEN
                TempStr=TempStr+" -a"
            ENDIF
            PRINT TempStr
            SHELL TempStr
        ENDIF
    ENDIF
 ENDIF
 IF AsmbFlag=0 OR NoGen=$ff THEN
    DELETE FileName+".a"
 ENDIF
 IF VarReport=$ff THEN
    PRINT
    PRINT "Vsect bytes=";VarBytes,"Remote Vsect Bytes=";VarBytRem
    PRINT
 ENDIF
 IF UDump=$ff THEN
    Fmt=">>>>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ >> >> >>>>>>>> >>>>>>>> >>>>>>>>"
    PRINT
    PRINT "Symbol Table:"
    PRINT
    PRINT USING(Fmt,"SymNm","Symbol Name","DT","DM","Detail","DataAddr","DataSize")
    PRINT
    FOR Ctr3=1 TO SymTabSiz
        TempStr="............................"
        TSymName=SymTable(Ctr3).SymName
    EXITIF TSymName="%"
        LEFT$(TempStr,LEN(TSymName))=TSymName
        TDataType=SymTable(Ctr3).DataType
        TDataMod=SymTable(Ctr3).DataMod
        TDetail=SymTable(Ctr3).Detail
        TDataAddr=SymTable(Ctr3).DataAddr
        TDataSize=SymTable(Ctr3).DataSize
        PRINT USING(Fmt,ZSTR$(Ctr3),TempStr,ZHEX$(TDataType),ZHEX$(TDataMod),ZHEX$(TDetail),ZHEX$(TDataAddr),ZHEX$(TDataSize))
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
 END
NoInpFile
 PRINT "Cannot open file: ";FileName
 END
Help
 PRINT "cb file [opts] {CompVar=Const}"
 PRINT "Options:"
 PRINT "    -a        Compile to assembler (.a file)"
 PRINT "    -b        Big (> 32k total object code anticipated)"
 PRINT "    -e        Compile with no output but check for errors"
 PRINT "    -m[=]<n>  Target CPU: 0=68000, 1=68010, 2=68020, 3=68030"
 PRINT "    -s        Symbol Table Dump to stdout"
 PRINT "    -d        I/O driver mode"
 PRINT "    -f        Function mode"
 PRINT "    -r        ROM mode (free-standing)"
 PRINT "    -g        Generate symbol module for debugger"
 PRINT "    -v        Report variable size"
 PRINT "    -p        Procedure mode"
 PRINT "    -c        Set up C environment"
 PRINT "    -u        Unabridged symble table dump"
 PRINT "    -z        Zero psect (subroutine to link with l68)"
 PRINT "    -o=pthlst Output of linker to pathlist"
 END
BadOpt
 PRINT "Bad option"
 END
 
