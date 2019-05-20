;System Variable Assignments
XSafe    equ $00EC
 
;Varible Assignments
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

; Variable Assignments
GAINlimit	equ $0E12; VarGAINlimit	equ $21D6; GainLimit
// DIM GainLimit AS INTEGER
BLANKdata *16	equ $0E14; VarBLANKdata	equ $21E6; BlankData
// DIM BlankData(16) AS INTEGER
TESTRTN		equ $0E26; VarTESTRTN	equ $21F4; TestRtn
// DIM TestRtn AS INTEGER
CALflg		equ $0E28; VarCALflg	equ $2201; CalFlag
// DIM CalFlag AS INTEGER
CALok		equ $0E2A; VarCALok	equ $220D; CalOK
// DIM CalOK AS BOOLEAN
TESTR0		equ $0E2C; VarTESTR0	equ $221A; TestR0
// DIM TestR0 AS INTEGER
fABORT		equ $0E2E; VarfABORT	equ $2227; FAbort
// DIM FAbort AS BOOLEAN
CLKBUF	*30	equ $0E30; VarCLKBUF	equ $2234; ClkBuf
// DIM ClkBuf(30) AS INTEGER
MUXset		equ $0E50; VarMUXset	equ $2241; MuxSet
// DIM MuxSet AS INTEGER
MUXstat		equ $05E4; VarMUXstat	equ $224F; MuxStat
// DIM MuxStat AS INTEGER
fDSPLY		equ $0E52; VarfDSPLY	equ $226A; FDisplay
// DIM FDisplay AS INTEGER
fVIAL		equ $0E54; VarfVIAL	equ $2276; FVial
// DIM FVial AS INTEGER
RESULTS	 *12	equ $0E56; VarRESULTS	equ $2284; Results
// DIM Results(12) AS INTEGER
nFresult  	equ $0E64; VarnFresult	equ $2293; NFResult
// DIM NFResult AS INTEGER
>990err		equ $0E6E; Var>990err	equ $22A1; Over990Err
// DIM Over990Err AS INTEGER
QAflg		equ $0E70; VarQAflg	equ $22A2; QAFlag
// DIM QAFlag AS BOOLEAN
f>MENU		equ $0E72; Varf>MENU	equ $3292; FMenu
// DIM FMenu AS INTEGER
MINx		equ $0E74; VarMINx	equ $3371; MinX
// DIM MinX AS INTEGER
MAXx		equ $0E76; VarMAXx	equ $337C; MaxX
// DIM MaxX AS INTEGER
INITVLU		equ $0E78; VarINITVLU	equ $338A; InitValue
// DIM InitValue AS INTEGER
f+/-#		equ $0E80; Varf+/-#	equ $33A4; Havis1
// DIM Havis1 AS INTEGER
F#SGN		equ $0E82; VarF#SGN	equ $33B0; FSgn
// DIM FSgn AS INTEGER
fDPok		equ $0E84; VarfDPok	equ $33BC; FDPok
// DIM FDPok AS INTEGER
fDP		equ $0E86; VarfDP	equ $33D5; FDP
// DIM FDP AS INTEGER
fDP0		equ $0E88; VarfDP0	equ $33E0; FDP0
// DIM FDP0 AS INTEGER
OUTBUF	*40	equ $0E8A; VarOUTBUF	equ $3502; OutBuf
// DIM OutBuf(40) AS INTEGER
REM		equ $0EB4; VarREM	equ $3558; Remm
// DIM Remm AS INTEGER
Rsgn		equ $0EB6; VarRsgn	equ $3563; Rsgn
// DIM RSgn AS INTEGER
2DIGrslt  *6	equ $0EB8; Var2DIGrslt	equ $3572; TwoDigitResult
// DIM TwoDigitResult(6) AS INTEGER
NUMLEN		equ $0EC0; VarNUMLEN	equ $383C; NumLen
// DIM NumLen AS INTEGER
ACQcntrl	equ $0EC2; VarACQcntrl	equ $3ADF; ACQCntl
// DIM ACQCntl AS INTEGER
LMPstat		equ $0EC4; VarLMPstat	equ $3B4C; LampStat
//DIM LampStat AS INTEGER
BTST		equ $0EC6; VarBTST	equ $3B57; BTest
// DIM BTest AS INTEGER
A/Ddta		equ $0EC8; VarA/Ddta	equ $3B64; ADData
// DIM ADData AS INTEGER
GAINvlu		equ $0ECA; VarGAINvlu	equ $3B72; GainValue
// DIM GainValue AS INTEGER
GAINexp		equ $0ECC; VarGAINexp	equ $3B80; GainExp
// DIM GainExp AS INTEGER
ACQRmode	equ $0ECE; VarACQRmode	equ $3BFD; AcqrMode
// DIM AcqrMode AS INTEGER
LMPERR		equ $0ED0; VarLMPERR	equ $3C0A; LampErr
// DIM LampErr AS INTEGER
flMPERR		equ $0ED2; VarflMPERR	equ $3C26; FLampErr
// DIM FLampErr AS INTEGER
#LMPERR		equ $0ED4; Var#LMPERR	equ $3C6f; PLampErr
// DIM PLampErr AS INTEGER
TRIGerr		equ $0ED6; VarTRIGerr	equ $3C8D; TrigErr
// DIM TrigErr AS INTEGER
TRIGDLY		equ $0ED8; VarTRIGDLY	equ $3C9B; TrigDly
// DIM TrigDly AS INTEGER
Rt~		equ $0EDA; VarRt~	equ $3DCE; RtQ
// DIM RtQ AS INTEGER
TmpX		equ $0EDC; VarTmpX	equ $3DD9; TmpX
// DIM TmpX AS INTEGER
SIG[Offset]	equ $0EDE; VarSIG[Offset] equ $3E54; SigOffset
DIM SigOffset AS INTEGER
SVstat		equ $0EE0; VarSVstat	equ $3E61; SVStat
// DIM SVStat AS INTEGER
'GET[Sig]	equ $0EE2; Var'GET[Sig]	equ $3E71; GetSigVar
// DIM GetSigVar AS INTEGER
#PRIMES		equ $0EE4; Var#PRIMES	equ $3E7F; PPrimes
// DIM PPrimes AS INTEGER
Temp		equ $0EE6; VarTemp	equ $3EF7; Temp
// DIM Temp AS INTEGER
rtn		equ $0EE8; Varrtn	equ $3F01; rtn
// DIM rtn AS INTEGER

DltaGains  *20	equ $0EEC; VarDltaGains	equ $3FBf; DltaGains
// DIM DltaGains(20) AS INTEGER
s0		equ $0F02; Vars0	equ $403D; S0
// DIM S0 AS INTEGER
CYCL[n]		equ $0F04; VarCYCL[n]	equ $4097; CycleN
// DIM CycleN AS INTEGER
MINSMPL#	equ $0F06; VarMINSMPL#	equ $40A6; MinSampleNum
// DIM MinSampleNum AS INTEGER
R[Hi]		equ $0F08; VarR[Hi]	equ $40B2; RHi
// DIM RHi AS INTEGER
R[Lo]		equ $0F0A; VarR[Lo]	equ $40BE; RLo
// DIM RLo AS INTEGER
Dlta		equ $0F0C; VarDlta	equ $40C9; Dlta
// DIM Dlta AS INTEGER
SUM[Rn]	 *4	equ $0F0E; VarSUM[Rn]	equ $40D7; SumRn
// DIM SumRn(4) AS INTEGER
1/Dlta		equ $0F14; Var1/Dlta	equ $40E4; RDlta
// DIM RDlta AS INTEGER
fNFg>Lim	equ $0F1A; VarfNFg>Lim equ $410E; Havis2
// DIM Havis2 AS INTEGER
fOffset		equ $0F1C; VarfOffset	equ $411C; FOffset
// DIM FOffset AS INTEGER
fGERR		equ $0F1E; VarfGERR	equ $44A8; FGErr
// DIM FGErr AS INTEGER
AVE[S/R]   *8 	equ $0F20; VarAVE[S/R]	equ $4754; AverSigRef
// DIM AverSigRef(8) AS INTEGER
SIG[Ave]   *8	equ $0F2A; VarSIG[Ave]	equ $4763; SigAver
// DIM SigAver(8) AS INTEGER
REF[Ave]	equ $0F34; VarREF[Ave]	equ $4772; RefAver
// DIM RefAver(8) AS INTEGER
SIG[Ave]/REF[Ave] equ $0F3E ; VarSIG[Ave]/REF[Ave] equ 478A; SigRefAver
// DIM SigRefAver AS INTEGER
SIGQUE	 *200	equ $0F48; VarSIGQUE	equ $47C5; SigQue
// DIM SigQue(200) AS INTEGER
REFQUE		equ $1012; VarREFQUE	equ $47D2; RegQue
// DIM RefQue(200) AS INTEGER
S/RQUE	 *200	equ $10DC; VarS/RQUE	equ $47C9; SigRefQue
// DIM SigRefQue(200) AS INTEGER
#SMPLS		equ $11A6; Var#SMPLS	equ $47EC; NumSamples
// DIM NumSamples AS INTEGER
#OUTLYERS	equ $11A8; Var#OUTLYERS	equ $47FC; NumOutlyers
// DIM NumOutlyers AS INTEGER
SMPL#		equ $11AA; VarSMPL#	equ $4808; SampleNum
// DIM SampleNum AS INTEGER
SMPLtotal	equ $11AC; VarSMPLtotal	equ $481C; SampleTotal
// DIM SampleTotal AS INTEGER
SMPLNDX		equ $11AE; VarSMPLNDX	equ $4826; SampleNdx
// DIM SampleNdx AS INTEGER
NDXlimit	equ $11B0; VarNDXlimit	equ $4835; NdxLimit
// DIM NdxLimit AS INTEGER
f1stTEST	equ $11B2; Varf1stTEST	equ $4844; FirstTest
// DIM FirstTest AS INTEGER
ASMBLY		equ $11B4; VarASMBLY	equ $4851; Assembly
// DIM Assembly AS INTEGER
#SMPLtbl   *8	equ $11B6; Var#SMPLtbl	equ $4860; SampleTable
// DIM SampleTable(8) AS INTEGER
#OUTLYRtbl   *8	equ $11C0; Var#OUTLYRtbl equ $4871; OutlyerTable
// DIM  OutlyerTable(8) AS INTEGER
MAXSMPL		equ $11CA; VarMAXSMPL	equ $4A12; MaxSample
// DIM MaxSample AS INTEGER
MINSMPL		equ $11CE: VarMINSMPL	equ $4A2D; MinSample
// DIM MinSample AS INTEGER
MINNDX		equ $11D0; VarMINNDX	equ $4A3A; MinNdx
// DIM MinNdx AS INTEGER
%DIF		equ $11D2; Var%DIF	equ $4B70; PctDif
// DIM PctDif AS INTEGER
S/Rjst		equ $11D4; VarS/Rjst	equ $4BD7; SRJst
// DIM SRJst AS INTEGER
SIGok		equ $11D6; VarSIGok	equ $4C79; SigOK
// DIM SigOK AS INTEGER
REFok		equ $11D8; VarREFok	equ $4C85; RefOK
// DIM RefOK AS INTEGER
#BADPNTS	equ $11DA; Var#BADPNTS	equ $4C94; NumBadPnts
// DIM NumBadPnts AS INTEGER
f-		equ $11DC; Varf-	equ $4E1D; FMinus
// DIM FMinus AS INTEGER
DTALINE		equ $11DE; VarDTALINE	equ $4E2B; DataLine
// DIM DataLine AS INTEGER
XPNTR		equ $11E0; VarXPNTR	equ $505A; XPtr
// DIM XPtr AS INTEGER
Xrd		equ $11E2; VarXrd	equ $5064; XRd
// DIM XRd AS INTEGER
Xwrt		equ $11E4; VarXwrt	equ $506F; XWrt
// DIM XWrt AS INTEGER
fFAIL		equ $11E6; VarfFAIL	equ $5178; FFail
// DIM FFail AS INTEGER


; Constant Assignments
CHANmux		equ $7007; ConstCHANmux	equ $225D; ChanMux
// Const ChanMux=$7007
#DIGITS		equ $0003; Const#DIGITS equ $3398; NumDigits
// Const NumDigits=$0003
DPdigits	equ $0001; ConstDPdigits equ $33CB; DPDigits
// Const DPDigits=$0001
A/DHiByte	equ $7002; ConstA/DHiByte equ $3AAF; ADHiByte
// DIM ADHiByte AS BYTE VECTOR
// SETVEC ADHiByte=$7002
A/DLowByte	equ $7001; ConstA/DLoByte equ $3AC0; ADLoByte
// DIM ADLoByte AS BYTE VECTOR
// SETVEC ADLoByte=$7001
A/DStatus	equ $7002; ConstA/DStatus equ $3AD0; ADStatus
// DIM ADStatus AS BYTE VECTOR
// SETVEC ADStatus=$7002
VIALSWI/O	equ $7002; ConstVIALSWI/O equ $3AEF; VialSw
// DIM VialSw AS BYTE VECTOR
// SETVEC VialSw=$7002
VIALbit		equ $0020; ConstVIALbit	equ $3AFD; VialBit
// CONST VialBit=$0020
X1		equ $0007; ConstX1	equ $3B89; GainX1
// CONST GainX1=$0007
X10		equ $0006; ConstX10	equ $3B93; GainX10
// CONST GainX10=$0006
X100		equ $0004; ConstX100	equ $3B9E; GainX100
// CONST GainX100=$0004
X1000		equ $0000; ConstX1000	equ $3BAA; GainX1000
// CONST GainX1000=$0000
REFchan		equ $0090; ConstREFchan	equ $3BB8; RefChan
// CONST RefChan=$0090
SIGchan		equ $0050; ConstSIGchan	equ $3BC6; SigChan
// CONST SigChan=$0050
LMPinten	equ $0030; ConstLMPinten equ $3BD5; LampIntensity
// CONST LampIntensity=$0030
Agnd		equ $0000; ConstAgnd	equ $3BE0; AGnd
// CONST AGnd=$0000
ACQRI/O		equ $7002; ConstACQRI/O	equ $3BEE; AcqrIO
// CONST AcqrIO=$7002
RUNmode		equ $0000; ConstRUNmode	equ $3C18; RunMode
// CONST RunMode=$0000
TESTmode	equ $0060; ConstTESTmode equ $3C35; TestMode
// CONST TestMode=$0060
OSmode		equ $0020; ConstOSmode	equ $3C42; OSMode
// CONST OSMode=$0020
STARTacqr	equ $0080; ConstSTARTacqr equ $3C52; StartAcqr
// CONST StartAcqr=$0080
LMPreset	equ $007F; ConstLMPreset equ $36C1; LampReset
// CONST LampReset
LMPDtaRdy	equ $0040; ConstLMPDtaRdy equ $3C7F; LampDataRdy
// CONST LampDataRdy=$0040
#GTRIES		equ $0032; Const#GTRIES	equ $40F2; NumGTries
// CONST NumGTries=$0032
GLimit		equ $03E8; ConstGLimit	equ $40FF; GLimit
// CONST GLimit=$03E8
QSIZ		equ $0064; ConstQSIZ	equ $47B8; QueSize
// Const QueSize=$0064
RAMEND		equ $2000; ConstRAMEND	equ $5111; RAMEnd
// Const RAMEnd=$1FFF
RMSTRT		equ $0000; ConstRMSTRT	equ $511E; RAMBegin
// Const RAMBegin=$0000
DTAREQI/O	equ $6010; ConstDTAREQI/O equ $52BC; RTCDataReq
// DIM RTCDataReq AS BYTE VECTOR
// SETVEC RTCDataReq=$6010 
DTAREGI/O	equ $6011; ConstDTAREGI/O equ $52CC; RTCDataReg
// DIM RTCDataReg AS BYTE VECTOR
// SETVEC RTCDataReg=$6011
RTCsec		equ $0000; ConstRTCsec	equ $52D9; RTCSeconds
// CONST RTCSeconds=$0000
RTCmin		equ $0002; ConstRTCmin	equ $52E6; RTCMinutes
// CONST RTCMinutes=$0002
RTChrs		equ $0004; ConstRTChrs	equ $52F3; RTCHours
// CONST RTCHours=$0004
RTCday		equ $0007; ConstRTCday	equ $5300; RTCDay
// CONST RTCDay=$0007
RTCmonth	equ $0008; ConstRTCmonth equ $530F; RTCMonth
// CONST RTCMonth=$0008
RTCyr		equ $0009; ConstRTCyr	equ $531B; RTCYear
// CONST RTCYear=$0009
UIPreg		equ $000A; ConstUIPreg	equ $5328; UIPReg
// CONST UIPReg=$000A
UIPbit		equ $0080; ConstUIPbit	equ $5335; UIPBit
// CONST UIPBit=$0080
CLKset		equ $000B; ConstCLKset	equ $5342; ClkSet
// CONST ClkSet=$000B
SETbit		equ $0080; ConstSETbit	equ $534F; SetBit
// CONST SetBit=$0080
REGA		equ $000A; ConstREGA	equ $535A; RegA
// CONST RegA=$000A
REGB		equ $000B; ConstREGB	equ $5365; RegB
// CONST RegB=$000B
REGC		equ $000C; ConstREGC	equ $5370; RegC
// CONST RegC=$000C
REGD		equ $000D; ConstREGD	equ $537B; RegD
// CONST RegD=$000D
Ainit		equ $0023; ConstAinit	equ $5387; AInit
// CONST AInit=$0023
Binit		equ $000C; ConstBinit	equ $5393; BInit
// CONST BInit=$000C
DAY0		equ $000E; ConstDAY0	equ $539E; Day0
VTRbit		equ $0080; ConstVTRbit	equ $53AB; VTRBit
// CONST VTRBit=$0080
MSBSMPL#	equ $000F; ConstMSBSMPL# equ $53BA; MSBSampleNum
// CONST MSBSampleNum=$000F
LSBSMPL#	equ $0010; ConstLSBSMPL# equ $53C9; LSBSampleNum
// CONST LSBSampleNum=$0010
RUNDLY#		equ $003D; ConstRUNDLY#	equ $53D7; RunDlyP
// CONST RunDlyP=$003D
TSTBYTE#	equ $003F; ConstTSTBYTE# equ $53E6; TestByteP
// CONST TestByteP=$003F


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

2000

 DW $13F0, $F0D0, $5B24, $5B45, $B8CE, $0000, $0000, $0000

;; 2000 RAMadr
2010
     $86; Code
     "RAMadr"; Name
     $FF48; Backward Link
ConstRAMadr:
2019 GetVar
     $2000

;; VARIABLE
201D
     $88; Code
     "VARIABLE"; Name
     $2010; Backward Link
     COLON; Complile The Following Section
     DROPexec; Delete TOS
     ConstRAMadr; Push Constant $2000 to TOS
     DUPexec; Duplicate TOS
     @exec; Push Data Contained in TOS Addr to TOS
     Const2;  Push $0002 onto TOS
     ROTexec
     +!exec; Add NOS to Addr in TOS
     CONSTANTexec
     ;Sexec

;; ALLOT-ROM
203C
     $89; Code
     "ALLOT-ROM"; Name
     $201D; Backward Link
     COLON; Complile The Following Section
     ALLOTexec
     ;Sexec

;; ALLOT-RAM
2048
     $89; Code
     "ALLOT-RAM"; Name
     $203C; Backward Link
     COLON; Complile The Following Section
     ConstRAMadr; Push Constant $2000 to TOS
     +!exec; Add NOS to Addr in TOS
     ;Sexec

;;; 
21B9
     $

;;; 0 VARIABLE GAINlimit
21CA
     $89; Code
     "GAINlimit"; Name
     $21B9; Backward Link
VarGAINlimit:
21D6 GetVar
     $0E12

;;; 0 VARIABLE BLANKdata 16 ALLOT-RAM
21DA
     $89; Code
     "BLANKdata"; Name
     $21CA; Backward Link
VarBLANKdata:
21E6 GetVar
     $0E14

;;; 0 VARIABLE TESTRTN
21EA
     $87; Code
     "TESTRTN"; Name
     $21DA; Backward Link
VarTESTRTN:
21F4 GetVar
     $0E26

;;; 0 VARIABLE CALflg
21F8
     $86; Code
     "CALflg"; Name
     $21EA; Backward Link
VarCALflg:
2201 GetVar
     $0E28

;;; 0 VARIABLE CALok
2205
     $85; Code
     "CALok"; Name
     $21F8; Backward Link
VarCALok:
220D GetVar
     $0E2A

;;; 0 VARIABLE TESTR0
2211
     $86; Code
     "TESTR0"; Name
     $2205; Backward Link
VarTESTR0:
221A GetVar
     $0E2C

;;; 0 VARIABLE fABORT
221E
     $86; Code
     "fABORT" Name
     $2211; Backward Link
VarfABORT:
2227 GetVar
     $0E2E

;;; 0 VARIABLE CLKBUF 30 ALLOT-RAM
222B
     $86; Code
     "CLKBUF"; Name
     $221E; Backward Link
VarCLKBUF:
2234 GetVar
     $0E30

;;; 0 VARIABLE MUXset
2238
     $86; Code
     "MUXset"; Name
     $222B; Backward Link
VarMUXset:
2241 GetVar
     $0E50

;;; LITEstat CONSTANT MUXstat
2245
     $87; Code
     "MUXstat"; Name
     $2238; Backward Link
VarMUXstat:
224F GetVar
     $05E4

;;; 7007 CONSTANT CHANmux
2253
     $87; Code
     "CHANmux"; Name
     $2245; Backward Link
ConstCHANmux:
225D GetVar
     $7007

;;; 0 VARIABLE fDSPLY
2261
     $86; Code
     "fDSPLY"; Name
     $2253; Backward Link
VarfDSPLY:
226A GetVar
     $0E52

;;; 0 VARIABLE fVIAL
226E
     $85; Code
     "fVIAL"; Name
     $2261; Backward Link
VarfVIAL:
2276 GetVar
     $0E54

;;; 0 VARIABLE RESULTS 12 ALLOT-RAM
227A
     $87; Code
     "RESULTS"; Name
     $226E; Backward Link
VarRESULTS:
2284 GetVar
     $0E56

;; 0 VARIABLE nFresult
2288
     $88; Code
     "nFresult"; Name
     $227A; Backward Link
VarnFresult:
2293 GetVar
     $0E64

;; 0 VARIABLE >990err
2297
     $87; Code
     ">990err"; Name
     $2288; Backward Link
>990err:
22A1 GetVar
     $0E6E

;; 0 VARIABLE QAflg
22A5
     $85; Code
     "QAflg"; Name
     $2297; Backward Link
VarQAflg:
22AD GetVar
     $0E70

;; SET-TESTrtn
22B1
     $8B; Code
     "SET-TESTrtn"; Name
     $22A5; Backward Link
     $C53C
     $C3BD
     $21F4
     $C4E7
     $C0A2
     $000A
     $C3BD
     $C3DE
     $C0A2
     $FFFA
     $C4AA
     $21F4
     $C507
     $C5B9
     $C3A7
     $C3A7
     $C5B9
     $F703
     $C507
     $F742
     $C37E

;; TESTrtn
22E9
     $87; Code
     "TESTrtn"; Name
     $22B1; Backward Link
     COLON; Complile The Following Section
     S0exec
     @exec
     SP!exec
     R>exec
     0=exec
     OBRANCHexec
     $FFFA
     Const0;  Push $0000 onto TOS
     >Rexec
     $21F4
     @exec
     >Rexec
     Const0;  Push $0000 onto TOS
     $F703
     !exec
     Const0;  Push $0000 onto TOS
     $22AD
     !exec
     $F742
     ;Sexec
     $DBC1

;; TEST
231F
     $85; Code
     "TEST"; Name
     $22E9; Backward Link
     GetVar
     $231D
     $9B8C

;; 'RECAL
232D
     $86; Code
     "'RECAL";
     $231F; Backward Link
     GetVar
     $232B
     $9A9A

;; 'DO-TEST
233C
     $88; Code
     "'DO-TEST"; Name
     $232D; Backward Link
     GetVar
     $233A
     $34A1

;; 'F#CNVRT
234D
     $88; Code
     "'F#CNVRT"; Name
     $233C; Backward Link
     GetVar
     $234B
     $DBC1

;; '711ROM
235E
     $87; Code
     "'711ROM"; Name
     $234D; Backward Link
     GetVar
     $235C
     $BD1A

;; '711TESTS
236E
     $89; Code
     "'711TESTS"; Name
     $235E; Backward Link
     GetVar
     $236C
     $5AD8

;; 'DATE/TIME
2380
     $8A; Code
     "236E; Backward Link
     GetVar
     $237E
     $8429

;; 'PRINT-CALIB
2393
     $8C; Code
     "'PRINT-CALIB"; Name
     $2380; Backward Link
     GetVar
     $2391
     $8F55

;; 'PRINT-RESULTS
23A8
     $8E; Code
     "'PRINT-RESULTS"
     $2393; Backward Link
     GetVar
     $23A6
     $812D

;; 'PRNTRDaTm
23BF
     $8A; Code
     "'PRNTRDaTm"; Name
     $23A8; Backward Link
     GetVar
     $23BD
     $5664

;; 'GET-SMPL#
23D2
     $8A; Code
     "'GET-SMPL#"; Name
     $23BF; Backward Link
     GetVar
     $23D0
     $5B2D

;; 'CALC-CHKSUM2
23E5
     $8D; Code
     "'CALC-CHKSUM2"; Name
     $23D2; Backward Link
     GetVar
     $23E3
     CkROM8exec

;; 'CALC-CHKSUM8
23FB
     $8D; Code
     "'CALC-CHKSUM8"; Name
     $23E5; Backward Link
     GetVar
     $23F9
     $BE1B

;; INIT-OPTIONS
2411
     $8D; Code
     "INIT-OPTIONS"; Name
     $23FB; Backward Link
     GetVar
     $240F
     $FEF9

;; 'PRNTcrlf
2427
     $89; Code
     "'PRNTcrlf"; Name
     $2411; Backward Link
     GetVar
     $2425
     $DBC1

;; 'PRNTRoff
2439
     $89; Code
     "'PRNTRoff"; Name
     $2427; Backward Link
     GetVar
     $2437
     $848E

;; 'INIT-PRINTER
244B
     $8D; Code
     "'INIT-PRINTER"; Name
     "2439; Backward Link
     GetVar
     $2449
     $82D7

;; 'COMNTS
2461
     $87; Code
     "'COMNTS"; Name
     $244B; Backward Link
     GetVar
     $245F
     $FDC8

;; 'WAIT-PRNTCLR
2471
     $8D; Code
     "'WAIT-PRNTCLR
     $2461; Backward Link
     GetVar
     $246F
     $FE97

;; 'RECHECK-PRNTR
2487
     $8E; Code
     "'RECHECK-PRNTR"; Name
     $2471; Backward Link
     GetVar
     $2485
     $54AC

;; '@TSTBYTE
249E
     $89; Code
     "'@TSTBYTE"; Name
     $2487; Backward Link
     GetVar
     $249C
     $AF41

;; 'DO-RUNIn
24B0
     $89; Code
     "'DO-RUNIn"
     $249E; Backward Link
     GetVar
     $24AE
     $13B1

;; 'TrigDly'''
24C2
     $88; Code
     "'TrigDly"; Name
     $24B0; Backward Link
'TrigDlyrefx:
24CD GetVar
     $24C0
     $AD96

;; 'FIRE-TEST
24D3
     $8A; Code
     "'FIRE-TEST; Name
     $24C2; Backward Link
     GetVar
     $24D1
     $8C43

;; 'M#PRNT
24E6
     $87; Code
     "'M#PRNT"; Name
     $24D3; Backward Link
     GetVar
     $24E4

;; 2000.EXE
24F4
     $88; Code
     "2000.EXE"; Name
     $24E6; Backward Link
     COLON; Complile The Following Section
     @exec
     EXECUTEexec
     ;Sexec

;; 711.EXE
2507
     $87; Code
     "711.EXE"; Name
     $24F4; Backward Link
     COLON; Complile The Following Section
     $237A
     @exec
     EXECUTEexec
     ;Sexec

;; "STRNG" "NAME     |  Romer Labs Fluorometer  |
251B
     $85; Code
     ""NAME"; Name
     "2507; Backward Link
     String1exec
     String2exec
     " Romer Labs Fluorometer "; Name
     $00

;; "STRNG" "MODEL100     |  Romer Labs Fluorometer  | 
2540
     $89; Code
     ""MODEL100"; Name
     $251B; Backward Link
     String1exec
     String2exec
     "FLQ100      Rev. J 6.9.0"
     $00

;; "STRNG" "ROMER     | <<<    ROMER LABS    >>> |
2569
     $86; Code
     ""ROMER"; Name
     $2540; Backward Link
     String1exec
     String2exec
     "<<<    ROMER LABS    >>>"
     $00

;; "STRNG" "BLANK    |                          |
258F
     $86; Code
     ""BLANK"; Name
     $2569; Backward Link
     String1exec
     String2exec
     "                        "
     $00

;; "STRNG" "LMPFAIL1     | LAMP DATA READY ERROR    |
25B5
     $89; Code
     ""LMPFAIL1"; Name
     $258F; Backward Link
     String1exec
     String2exec
     "LAMP DATA READY ERROR   "
     $00 

;; "STRNG" "ACK     | Press ENTER to continue  |
25DE
     $84; Code
     ""ACK"; Name
     $25B5; Backward Link
     String1exec
     String2exec
     "Press ENTER to continue "
     $00

;; "STRNG" ""SELFTST2    | Performing Self Tests   |
2602
     $89; Code
     ""SELFTST2"; Name
     $25DE; Backward Link
     String1exec
     String2exec
     "Performing Self Tests  "
     $00

;; "STRNG" ""ROMCK1    | ROM1 CHECK |
262B
     $87; Code
     ""ROMCK1"; Name
     $2602; Backward Link
     String1exec
     String2exec
     "ROM1 CHECK"
     $00

;; "STRNG" ""ROMCK2    | ROM2 CHECK |
2644
     $87; Code
     ""ROMCK2"; Name
     $262B; Backward Link
     String1exec
     String2exec
     "ROM2 CHECK"
     $00

;; "STRNG" ""RAMCK     | RAM CHECK |
265D
     $87; Code
     ""RAMCK"; Name
     $2644; Backward Link
     String1exec
     String2exec
     "RAM CHECK"
     $00

;; "STRNG" ""LMPCK     | LAMP CHECK |
2675
     $86; Code
     ""LMPCK"; Name
     $265D; Backward Link
     String1exec
     String2exec
     "LAMP CHECK"
     $00

;; "STRNG" ""RNGCK     | RANGE CHECK |
268D
     $86; Code
     ""RNGCK"; Name
     $2675; Backward Link
     String1exec
     String2exec
     "RANGE CHECK"
     $00

;; "STRNG" ""FAIL     | FAIL |
26A6
     $86; Code
     ""FAIL"; Name
     $268D; Backward Link
     String1exec
     String2exec
     "FAIL"
     $00

;; "STRNG" ""PASED    | PASSED |
26B7
     $86; Code
     ""PASED"; Name
     $26A6; Backward Link
     String1exec
     String2exec
     "PASSED"
     $00

;; "STRNG" ""STOPED    | INSTRUMENT NON-OPERATIVE |
26CB
     $86; Code
     ""STOPED"; Name
     $26B7; Backward Link
26D5 String1exec
     String2exec
     "INSTRUMENT NON-OPERATIVE"
     $00

;; "STRNG" ""DTAerr    | DATA ACQUISITION ERROR   |
26F2
     $86; Code
     ""DTAerr"; Name
     $26CB; Backward Link
"DTAerrStr:
26FC String1exec
     String2exec
     "DATA ACQUISITION ERROR  "
     $00

;; "STRNG" ""RDCAL    |  MEASURE HIGH/LOW CALIB  |
2719
     $86; Code
     ""RDCAL"; Name
     $26F2; Backward Link
     String1exec
     String2exec
     " MEASURE HIGH/LOW CALIB "
     $00

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; "STRNG" "SMPL#     | SAMPLE NUMBER  |
2FE3
     $87; Code
     ""SMPL#"; Name
     $2FCC; Backward Link
SMPL#text:
2FEC String1exec
     String2exec
     "SAMPLE NUMBER  "
     $00

;;; "STRNG" "UPPM     |  Parts Per Billion|
301F
     $87; Code
     ""UPPM"; Name
     $2FE3; Backward Link
UPPMtext:
3027 String1exec
     String2exec
     " Parts Per Billion"
     $00

;;; "STRNG" "COMNTS     | Comments:|
303E
     $87; Code
     ""COMNTS"; Name
     $301F; Backward Link
COMNTStext:
3048 String1exec
     String2exec
     "Comments:"
     $00

;;; "STRNG" "QA1     | <<<  ROMER LABS  >>>|
3056
     $84
     ""QA2"; Name
     $303E; Backward Link
QA1text:
305D String1exec
     String2exec
     "<<<  ROMER LABS  >>>"
     $00

;;; "STRNG" "QA2     | QA TEST BATTERY         |
3076
     $84; Code
     ""QA2"; Name
     $3056; Backward Link
QA2text:
307D String1exec
     String2exec
     "QA TEST BATTERY        "
     $00

;;; "STRNG" "QASELF  | SELFTEST FUNCTIONS      |
309A
     $87; Code
     ""QASELF"; Name
     $3076; Backward Link
QASELFtext:
30A4 String1exec
     String2exec
     "SELFTEST FUNCTIONS     "
     $00

;;; "STRNG" "OSTST1  | OFFSET MEASUREMENT      |
30C1
     $87; Code
     ""OSTST1"; Name
     $309A; Backward Link
OSTST1text:
30CB String1exec
     String2exec
     "OFFSET MEASUREMENT     "
     $00

;;; "STRNG" "OSHDR1  | OFFSET/GAIN Gain     1    10   100  1000|
30E8
     $87; Code
     ""OSHDR1"; Name
     $30C1; Backward Link
OSHDR1text:
30F2 String1exec
     String2exec
     "OFFSET/GAIN Gain     1    10   100  1000"
     $00

;;; "STRNG" "LEKTST  | FEEDTHROUGH MEASUREMENT |
311F
     $87; Code
     ""LEKTST"; Name
     $30E8; Backward Link
LEKTSTtext:
3129 String1exec
     String2exec
     "FEEDTHROUGH MEASUREMENT "
     $00

;;; "STRNG" "OSHDR3  | FEEDTHROUGH Gain     1    10   100  1000|
3146
     $87; Code
     ""OSHDR3"; Name
     $311F; Backward Link
OSHDR3text:
3150 String1exec
     String2exec
     "FEEDTHROUGH Gain     1    10   100  1000"
     $00

;;; "STRNG" "OSHDR2  |           Counts|
317D
     $87; Code
     ""OSHDR2"; Name
     $3146; Backward Link
OSHDR2text:
3187 String1exec
     String2exec
     "           Counts"
     $00
     

;;; "STRNG" "QA#1    | <<< QA TEST# |
319C
     $85; Code
     ""QA#1"; Name
     $317D; Backward Link
QA#1text:
31A4 String1exec
     String2exec
     ">>> "
     $00

;;; "STRNG" "QA#2    |  >>>|
31B6
     $85; Code
     ""QA#2"; Name
     $319C; Backward Link
QA#2:
31BE String1exec
     String2exec
     " >>>"
     $00

;;; "STRNG" "CALTST  | CALIBRATOR MEASUREMENT  |
31C7
     $87; Code
     ""CALTST"; Name
     $31B6; Backward Link
CALTSTtext:
31D1 String1exec
     String2exec
     "CALIBRATOR MEASUREMENT  "
     $00

;;; "STRNG" "CVhdr   | CALIBRATOR        Sig   Gain    Ref|
31EE
     $86; Code
     ""CVhdr"; Name
     $31C7; Backward Link
CVhdrtext:
31F7 String1exec
     String2exec
     "CALIBRATOR        Sig   Gain    Ref"
     $00

;;; "STRNG" "CVhdr1  | SIGNAL LEVELS|
321F
     $87; Code
     ""CVhdr1"; Name
     $31EE; Backward Link
CVhdr1text:
3229 String1exec
     String2exec
     "SIGNAL LEVELS"
     $00

;;; "STRNG" "QADON1  | QA TESTS COMPLETE       |
323B
     $87; Code
     ""QADON1"; Name
     $321F; Backward Link
QADON1text:
3245 String1exec
     String2exec
     "QA TESTS COMPLETE       "
     $00   

;;; "STRNG" "QADON2  | POWER OFF/ON TO RESTART |
3262
     $87; Code
     ""QADON2"; Name
     $323B; Backward Link
QADON2text:
326C String1exec
     String2exec
     "POWER OFF/ON TO RESTART "
     $00

;;; 0 VARIABLE f>MENU ( not in supplied source )
3289
     $86; Code
     "f>MENU"; Name
     $3262; Backward Link
Varf>MENU:
3292 GetVar
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
UPDATEkeyQexec:
32A3 COLON; Complile The Following Section
     $F703
     @exec; Push Data Contained in TOS Addr to TOS
     0=exec
     $FA0E
     $F703
     @exec; Push Data Contained in TOS Addr to TOS
     ANDexec;  AND NOS with TOS
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0004; Branch Offset
     	$2511
     ENDIF
     $F9FC
     @exec; Push Data Contained in TOS Addr to TOS
     $2201
     @exec; Push Data Contained in TOS Addr to TOS
     0=exec
     ANDexec;  AND NOS with TOS
     $F703
     @exec; Push Data Contained in TOS Addr to TOS
     0=exec
     ANDexec;  AND NOS with TOS
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $000C; Branch Offset
     	DROPexec; Delete TOS
     	$2336
     	@exec; Push Data Contained in TOS Addr to TOS
     	EXECUTEexec
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
32E5 COLON; Complile The Following Section
     $F703
     @exec; Push Data Contained in TOS Addr to TOS
     0=exec
     $F998
     SWAPexec; Swap TOS with NOS
     $F703
     @exec; Push Data Contained in TOS Addr to TOS
     ANDexec;  AND NOS with TOS
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0004; Branch Offset
     	$2511
     ENDIF
     $F703
     @exec; Push Data Contained in TOS Addr to TOS
     0=exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0042; Branch Offset
     	DUPexec; Duplicate TOS
     	$F70C
     	=exec
     	$2201
     	@exec; Push Data Contained in TOS Addr to TOS
     	0=exec
	ANDexec;  AND NOS with TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$000C; Branch Offset
		DROPexec; Delete TOS
		$2336
		@exec; Push Data Contained in TOS Addr to TOS
		EXECUTEexec
		$22F3
     	ENDIF
	DUPexec; Duplicate TOS
	$F70C
	=exec
	OVERexec; Duplicate NOS at TOS
	$F715
	=exec
	ORexec;  OR NOS with TOS
	OVERexec; Duplicate NOS at TOS
	$F71E
	=exec
	ORexec;  OR NOS with TOS
	Varf>MENU; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	ANDexec;  AND NOS with TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0006; Branch Offset
		DROPexec; Delete TOS
		$22F3
     	ENDIF
     ENDIF
     ;Sexec

;;; : WAIT-ENT "ACK DISPLAY2 w-TYPE BEGIN PCkey 13 ( ENT) = UNTIL ;
3349
     $88; Code
     "WAIT-ENT"; Name
      $32DD; Backward Link
WAIT-ENTexec:
3354 COLON; Complile The Following Section
     $25E5
     $F4CB
     $F51E
     BEGIN
     	PCkeyexec
     	LITexec; Put value that follows on TOS
     	$000D; Literal Value
     	=exec
     OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     $FFF6; Branch Offset
     ;Sexec

;;; 0 VARIABLE MINx
336A
     $84; Code
     "MINx"; Name
     $3349; Backward Link
VarMINx:
3371 GetVar
     $0E74

;;; 0 VARIABLE MAXx
3375
     $84; Code
     "MAXx"; Name
     $336A; Backward Link
VarMAXx:
337C GetVar
     $0E76

;;; 0 VARIABLE INITVLU 6 ALLOT-RAM
3380
     $87; Code
     "INITVLU"; Name
     $3375; Backward Link
VarINITVLU:
338A GetVar
     $0E78

;;; 3 CONSTANT #DIGITS
338E
     $87; Code
     "#DIGITS"; Name
     $3380; Backward Link
Const#DIGITS:;		Push $0003 onto TOS
3398 GetVar
     $0003

;;; 0 VARIABLE f+/-#
339C
     $85; Code
     "f+/-#"; Name
     $338E; Backward Link
Varf+/-#:
33A4 GetVar
     $0E80

;;; 0 VARIABLE F#SGN
33A8
     $85; Code
     "F#SGN"; Name
     $339C; Backward Link
VarF#SGN:
33B0 GetVar
     $0E82

;;; 0 VARIABLE fDPok
33B4
     $82; Code
     "fDPok"; Name
     $33A8; Backward Link
VarfDPok:
33BC GetVar
     $0E84

;;; 1 CONSTANT DPdigits
33C0
     $88; Code
     "DPdigits"; Name
     $33B4; Backward Link
DPdigitsrefx:;	 Push Constant $0001 to TOS
33CB GetVar
     $0001

;;; 0 VARIABLE fDP
33CF
     $89; Code
     "fDP"; Name
     $33C0; Backward Link
VarfDP:
33D5 GetVar
     $0E86

;;; 0 VARIABLE fDP0
33D9
     $84
     "fDP0"; Name
     $33CF; Backward Link
VarfDP0:
33E0 GetVar
     $0E88

;;; : N#CNVRT 0 <# #S #> ;
33E4
     $87; Code
     "N#CNVRT"; Name
     $33D9; Backward Link
     COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     <#exec
     #Sexec
     #>exec
     ;Sexec

;;; : d#CNVRT <# #S #> MAXx @ MIN ;
33FA
     $87; Code
     "d#CNVRT"; Name
     $33E4; Backward Link
d#CNVRTexec:
3404 COLON; Complile The Following Section
     <#exec
     #Sexec
     #>exec
     VarMAXx; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     MINexec
     ;Sexec

;;; : n#CNVRT ( n -- adr,cnt) 0 d#CNVRT ;
3414
     $87; Code
     "n#CNVRT"; Name
     $33FA; Backward Link 
     COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     d#CNVRTexec
     ;Sexec

;;; : .1CNVRT ( d --)  <# # 46 HOLD #S #> ;
3426
     $87; Code
     ".1CNVRT"; Name
     $3414; Backward Link
.1CNVRTexec:
3430 COLON; Complile The Following Section
     <#exec
     #exec
     LITexec; Put value that follows on TOS
     $002E; Literal Value
     HOLDexec
     #Sexec
     #>exec
     ;Sexec

;;; : .2CNVRT ( d --)  <# # # 46 HOLD #S #> ;
3442
     $87; Code
     ".2CNVRT"; Name
     $3426; Backward Link
.2CNVRTexec:
344C COLON; Complile The Following Section
     <#exec
     #exec
     #exec
     LITexec; Put value that follows on TOS
     $002E; Literal Value
     HOLDexec
     #Sexec
     #>exec
     ;Sexec

;;; : .3CNVRT ( d --)  <# # # # 46 HOLD #S #> ;
3460
     $87; Code
     ".3CNVRT"; Name
     $3442; Backward Link
.3CNVRTexec:
346A COLON; Complile The Following Section
     <#exec
     #exec
     #exec
     #exec
     LITexec; Put value that follows on TOS
     $002E; Literal Value
     HOLDexec
     #Sexec
     #>exec
     ;Sexec
     d#CNVRTexec
     .1CNVRTexec
     .2CNVRTexec
     .3CNVRTexec

;;; CONSTANT CNVRTTBL
3488
     $88
     "CNVRTTBL"; Name
     $3460; Backward Link
CNVRTTBLrefx:
3493 GetVar
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
F#CNVRTexec:
34A1 COLON; Complile The Following Section
     ABSexec
     >Rexec
     DROPexec; Delete TOS
     Rexec
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     >exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0014; Branch Offset
     	Rexec for Loop Limit
     	LITexec; Put value that follows on TOS
     	$0004; Literal Value for Loop Index
     	(DO)exec
     		LITexec; Put value that follows on TOS
     		$000A; Literal Value
     		/exec
     	(LOOP)exec
     	$FFF8
     ENDIF
     Rexec
     Const3;  Push $0003 onto TOS
     >exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0016; Branch Offset
     	LITexec; Put value that follows on TOS
     	$000A; Literal Value
     	/MODexec
     	SWAPexec; Swap TOS with NOS
     	LITexec; Put value that follows on TOS
     	$0004; Literal Value
     	>exec
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0004; Branch Offset
     	1+exec
     ENDIF
     Const0;  Push $0000 onto TOS
     R>exec
     Const3;  Push $0003 onto TOS
     MINexec
     2*exec; Multiply TOS by 2; (Arithmetic Shift Left TOS)
     CNVRTTBLrefx
     +exec; Add NOS To TOS
     @exec; Push Data Contained in TOS Addr to TOS
     EXECUTEexec
     ;Sexec

;;; 0 VARIABLE OUTBUF 40 ALLOT-RAM
34F9
     $86; Code
     "OUTBUF"; Name
     $3497; Backward Link
VarOUTBUF:
3502 GetVar
     $0E8A

;;; : FORMAT-ANSWER ( d,j -- adr,cnt) OVER >R >R DABS R>
	F#CNVRT OUTBUF 1+ SWAP DUP 1+ >R CMOVE
	R> R> 0< IF 45 ELSE 32 ENDIF OUTBUF C! OUTBUF SWAP ;
3506
     $8A; Code
     "FORMAT-ANSWER"; Name
     $34F9; Backward Link
FORMAT-ANSWERexec:
3516 COLON; Complile The Following Section
     OVERexec; Duplicate NOS at TOS
     >Rexec
     >Rexec
     DABSexec
     R>exec
     F#CNVRTexec
     VarOUTBUF; Push Var Addr onto TOS
     1+exec
     SWAPexec; Swap TOS with NOS
     DUPexec; Duplicate TOS
     1+exec
     >Rexec
     CMOVEexec
     R>exec
     R>exec
     0<exec ;Destructive Test of TOS for <0
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $000A; Branch Offset
     	LITexec; Put value that follows on TOS
     	$002D; Literal Value
     	BRANCHexec
     	$0006
     	LITexec; Put value that follows on TOS
	$0020; Literal Value
     ENDIF
     VarOUTBUF; Push Var Addr onto TOS
     C!exec;  Store NOS (Char)  to Addr in TOS
     VarOUTBUF; Push Var Addr onto TOS
     SWAPexec; Swap TOS with NOS
     ;Sexec    

;;; ( j,d->2DIGIT WITH ROUNDUP

;;; 0 VARIABLE REM
3552
     $83; Code
     "REM"; Name
     $3506; Backward Link
VarREM:
3558 GetVar
     $0EB4

;;; 0 VARIABLE Rsgn 4
355C
     $84; Code
     "Rsgn"; Name
     $3552; Backward Link
VarRsgn:
3563 GetVar
     $0EB6

;;; 0 VARIABLE 2DIGrslt 6 ALLOT-RAM
3567
     $88; Code
     "2DIGrslt"; Name
     $355C; Backward Link
Var2DIGrslt:
3572 GetVar
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
j,d>2DIGexec:
3581 COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     VarREM; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     DUPexec; Duplicate TOS
     VarRsgn; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     DABSexec
     ROTexec
     >Rexec
     2DUPexec; Duplicate TOS/NOS
     BEGIN
    	LITexec; Put value that follows on TOS
     	$0063; Literal Value
     	LITexec; Put value that follows on TOS
     	$0000; Literal Value
     	D>exec
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$001A; Branch Offset
     		LITexec; Put value that follows on TOS
     		$000A; Literal Value
     		M/MODexec
     		ROTexec
     		VarREM; Push Var Addr onto TOS
     		!exec; Store NOS to Addr in TOS
     		R>exec
     		1+exec
     		>Rexec
     		Const0;  Push $0000 onto TOS
     		BRANCHexec
     		$0004
     	ENDIF
     	Const1;  Push $0001 onto TOS
     OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     $FFD4; Branch Offset
     VarREM; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     >exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0028; Branch Offset
     	LITexec; Put value that follows on TOS
     	$0001; Literal Value
     	LITexec; Put value that follows on TOS
     	$0000; Literal Value
     	D+exec
     	2DUPexec; Duplicate TOS/NOS
     	LITexec; Put value that follows on TOS
     	$0063; Literal Value
     	LITexec; Put value that follows on TOS
     	$0000; Literal Value
     	D>exec
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$000E; Branch Offset
     		LITexec; Put value that follows on TOS
     		$000A; Literal Value
     		D/exec
     		R>exec
     		1+exec
     		>Rexec
	ENDIF
     ENDIF
     Const0;  Push $0000 onto TOS
     $22A1
     !exec; Store NOS to Addr in TOS
     R>exec
     DUPexec; Duplicate TOS
     0>exec ;Destructive Test of TOS for >0
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0032; Branch Offset
     	Const3;  Push $0003 onto TOS
     	MINexec
     	>Rexec
     	BEGIN
     		LITexec; Put value that follows on TOS
     		$000A; Literal Value
     		D*exec
     		2DUPexec; Duplicate TOS/NOS
     		LITexec; Put value that follows on TOS
     		$26AC; Literal Value
     		LITexec; Put value that follows on TOS
     		$0000; Literal Value
     		D>exec
     		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     		$000A; Branch Offset
     			LITexec; Put value that follows on TOS
     			$FFFF; Literal Value
     			$22A1
     			!exec; Store NOS to Addr in TOS
        	ENDIF
     		R>exec
     		1-exec; Subtract 1 from TOS (DEC TOS)
     		DUPexec; Duplicate TOS
     		0<=exec
     	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     	$FFD6; Branch Offset
     ENDIF
     >Rexec
     VarRsgn; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     0<exec ;Destructive Test of TOS for <0
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0004; Branch Offset
     	DMINUSexec
     ENDIF
     Var2DIGrslt; Push Var Addr onto TOS
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     R>exec
     LITexec; Put value that follows on TOS
     $0EBC; Literal Value
     !exec; Store NOS to Addr in TOS
     ;Sexec

;;; : TST2DIG j,d>2DIG 2DIGrslt 2@ 2DIGrslt 4 + @ F#CNVRT  ( **)     CR TYPE ;
3653
     $87; Code
     "TST2DIG"; Name
     $3576; Backward Link
     COLON; Complile The Following Section
     j,d>2DIGexec
     Var2DIGrslt; Push Var Addr onto TOS
     2@exec
     Var2DIGrslt; Push Var Addr onto TOS
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     +exec; Add NOS To TOS
     @exec; Push Data Contained in TOS Addr to TOS
     F#CNVRTexec
     CRexec
     TYPEexec
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
CLR-OLDDATAexec:
3685 COLON; Complile The Following Section
     $F21D
     $F23B
     !exec; Store NOS to Addr in TOS
     $F4DD
     @exec; Push Data Contained in TOS Addr to TOS
     1+exec for Loop Limit
     VarMINx; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS for Loop Index
     (DO)exec
     	LITexec; Put value that follows on TOS
     	$0020; Literal Value
     	)exec
    	 $F4CB
     	$F554
     	)exec
     	$F23B
     	@exec; Push Data Contained in TOS Addr to TOS
     	+exec; Add NOS To TOS
     	C@exec
     	LITexec; Put value that follows on TOS
     	$0020; Literal Value
     	=exec
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0004; Branch Offset
     		LEAVEexec
     	ENDIF
     	(LOOP)exec
     $FFDE
     VarMINx; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     $F4DD
     !exec; Store NOS to Addr in TOS
     VarfDPok; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0008; Branch Offset
     	Const#DIGITS;  Push $0003 onto TOS
     	VarMAXx; Push Var Addr onto TOS
     	!exec; Store NOS to Addr in TOS
     ENDIF
     Const0;  Push $0000 onto TOS
     VarF#SGN; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     Const0;  Push $0000 onto TOS
     VarfDP; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     $F27B
     ;Sexec

;;; : ENTER-DP -1 fDP ! 1 MAXx +! ;
36E3
     $88; Code
     "ENTER-DP"; Name
     $3677; Backward Link
ENTER-DPexec:
36EE COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     VarfDP; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     Const1;  Push $0001 onto TOS
     VarMAXx; Push Var Addr onto TOS
     +!exec; Add NOS to Addr in TOS
     ;Sexec

;;; : ENTER-SGN ( c[-] -- c[0]) F#SGN ! 48 ( 0) 1 MAXx +! ;
3700
     $89; Code
     "ENTER-SGN"; Name
     $36E3; Backward Link
     COLON; Complile The Following Section
     VarF#SGN; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $0030; Literal Value
     Const1;  Push $0001 onto TOS
     VarMAXx; Push Var Addr onto TOS
     +!exec; Add NOS to Addr in TOS
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
LEGAL-DIGIT?exec:
372D COLON; Complile The Following Section
     DUPexec; Duplicate TOS
     $F70C
     =exec
     OVERexec; Duplicate NOS at TOS
     $F715
     =exec
     ORexec;  OR NOS with TOS
     OVERexec; Duplicate NOS at TOS
     $F71E
     =exec
     ORexec;  OR NOS with TOS
     $2201
     @exec; Push Data Contained in TOS Addr to TOS
     0=exec
     ANDexec;  AND NOS with TOS
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0006; Branch Offset
     	DROPexec; Delete TOS
    	$22F3
     ENDIF
     LITexec; Put value that follows on TOS
     $002F; Literal Value
     OVERexec; Duplicate NOS at TOS
     <exec
     OVERexec; Duplicate NOS at TOS
     LITexec; Put value that follows on TOS
     $003A; Literal Value
     <exec
     ANDexec;  AND NOS with TOS
     OVERexec; Duplicate NOS at TOS
     LITexec; Put value that follows on TOS
     $002E; Literal Value
     =exec
     VarfDPok; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     ANDexec;  AND NOS with TOS
     VarfDP; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     0=exec
     ANDexec;  AND NOS with TOS
     ORexec;  OR NOS with TOS
     OVERexec; Duplicate NOS at TOS
     LITexec; Put value that follows on TOS
     $002D; Literal Value
     =exec
     Varf+/-#; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     ANDexec;  AND NOS with TOS
     $F23B
     @exec; Push Data Contained in TOS Addr to TOS
     0=exec
     ANDexec;  AND NOS with TOS
     ORexec;  OR NOS with TOS
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
getF#exec:
37A1 COLON; Complile The Following Section
     BEGIN
     	$F4DD
     	@exec; Push Data Contained in TOS Addr to TOS
     	VarMAXx; Push Var Addr onto TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	>exec
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$000E; Branch Offset
     		Const0;  Push $0000 onto TOS
     		$F23B
     		!exec; Store NOS to Addr in TOS
     		Const0;  Push $0000 onto TOS
     		VarfDP; Push Var Addr onto TOS
     		!exec; Store NOS to Addr in TOS
     	ENDIF
     	BEGIN
     		$F912
     	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     	$FFFC; Branch Offset
     	PCkeyexec
     	LEGAL-DIGIT?exec
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0046; Branch Offset
     	$F23B
     	@exec; Push Data Contained in TOS Addr to TOS
     	0=exec
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0004; Branch Offset
     		CLR-OLDDATAexec
        ENDIF
     	DUPexec; Duplicate TOS
     	$F4DD
     	@exec; Push Data Contained in TOS Addr to TOS
     	$F4CB
     	$F554
     	Const1;  Push $0001 onto TOS
     	$F4DD
     	+!exec; Add NOS to Addr in TOS
     	DUPexec; Duplicate TOS
     	LITexec; Put value that follows on TOS
     	$002E; Literal Value
     	=exec
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0004; Branch Offset
     		ENTER-DPexec
	ENDIF
     	LITexec; Put value that follows on TOS
     	$005F; Literal Value
     	$F4DD
     	@exec; Push Data Contained in TOS Addr to TOS
     	$F4CB
     	$F554
     	DUPexec; Duplicate TOS
     	$F23B
     	@exec; Push Data Contained in TOS Addr to TOS
     	C!exec;  Store NOS (Char)  to Addr in TOS
     	Const1;  Push $0001 onto TOS
     	$F23B
     	+!exec; Add NOS to Addr in TOS
     ENDIF
     $F4DD
     	@exec; Push Data Contained in TOS Addr to TOS
     	VarMAXx; Push Var Addr onto TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	>exec
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$000E; Branch Offset
     		LITexec; Put value that follows on TOS
     		$0020; Literal Value
     		$F4DD
     		@exec; Push Data Contained in TOS Addr to TOS
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
VarNUMLEN:
383C GetVar
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
INIT-GET#exec:
384C COLON; Complile The Following Section
     $F27B
     Const0;  Push $0000 onto TOS
     VarfDP; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     Const0;  Push $0000 onto TOS
     VarfDP0; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     VarINITVLU; Push Var Addr onto TOS
     2@exec
     DUPexec; Duplicate TOS
     0<exec ;Destructive Test of TOS for <0
     VarF#SGN; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     DABSexec
     VarINITVLU; Push Var Addr onto TOS
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     +exec; Add NOS To TOS
     @exec; Push Data Contained in TOS Addr to TOS
     F#CNVRTexec
     2DUPexec; Duplicate TOS/NOS
     OVERexec; Duplicate NOS at TOS
     +exec; Add NOS To TOS
     SWAPexec; Swap TOS with NOS
     	(DO)exec
    	 )exec
     	C@exec
     	DUPexec; Duplicate TOS
    	 LITexec; Put value that follows on TOS
     	$002E; Literal Value
     	=exec
     	VarfDP0; Push Var Addr onto TOS
     	+!exec; Add NOS to Addr in TOS
     	LITexec; Put value that follows on TOS
     	$0030; Literal Value
     	>exec
     	VarfDP0; Push Var Addr onto TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	0>exec ;Destructive Test of TOS for >0
     	ANDexec;  AND NOS with TOS
     	VarfDP; Push Var Addr onto TOS
     	+!exec; Add NOS to Addr in TOS
     (LOOP)exec
     $FFDC
     DUPexec; Duplicate TOS
     VarNUMLEN; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     $F21D
     VarF#SGN; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0018; Branch Offset
     	LITexec; Put value that follows on TOS
     	$002D; Literal Value
     	OVERexec; Duplicate NOS at TOS
     	C!exec;  Store NOS (Char)  to Addr in TOS
     	Const1;  Push $0001 onto TOS
     	VarNUMLEN; Push Var Addr onto TOS
     	+!exec; Add NOS to Addr in TOS
     	Const1;  Push $0001 onto TOS
     	VarMAXx; Push Var Addr onto TOS
     	+!exec; Add NOS to Addr in TOS
     	1+exec
     ENDIF
     SWAPexec; Swap TOS with NOS
     DUPexec; Duplicate TOS
     VarMAXx; Push Var Addr onto TOS
     +!exec; Add NOS to Addr in TOS
     CMOVEexec
     $F21D
     VarNUMLEN; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     VarMINx; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     $F4CB
     $F530
     VarMAXx; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     1+exec
     $F4DD
     !exec; Store NOS to Addr in TOS
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
     COLON; Complile The Following Section
     Const#DIGITS;  Push $0003 onto TOS
     VarMAXx; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     VarfDPok; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     INIT-GET#exec
     getF#exec
     $F21D
     1-exec; Subtract 1 from TOS (DEC TOS)
     NUMBERexec
     2DUPexec; Duplicate TOS/NOS
     VarINITVLU; Push Var Addr onto TOS
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     >Rexec
     >Rexec
     DPLexec
     @exec; Push Data Contained in TOS Addr to TOS
     Const0;  Push $0000 onto TOS
     MAXexec
     MINUSexec
     DUPexec; Duplicate TOS
     VarINITVLU; Push Var Addr onto TOS
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     +exec; Add NOS To TOS
     !exec; Store NOS to Addr in TOS
     R>exec
     R>exec
     ;Sexec

;;; : GET[n#] ( -- n) 0 fDPok ! ( Init for whole number entry only)
	INIT-GET# getF#      ( Init digit entry & get whole number)
	CHRBUF2 1- NUMBER 2DUP INITVLU 2! DROP >R
	DPL @ 0 MAX MINUS INITVLU 4 + ! R> ;
393A
     $87; Code
     "GET[n#]"; Name
     $38F0; Backward Link
     COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     VarfDPok; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     INIT-GET#exec
     getF#exec
     $F21D
     1-exec; Subtract 1 from TOS (DEC TOS)
     NUMBERexec
     2DUPexec; Duplicate TOS/NOS
     VarINITVLU; Push Var Addr onto TOS
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     DROPexec; Delete TOS
     >Rexec
     DPLexec
     @exec; Push Data Contained in TOS Addr to TOS
     Const0;  Push $0000 onto TOS
     MAXexec
     MINUSexec
     VarINITVLU; Push Var Addr onto TOS
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     +exec; Add NOS To TOS
     !exec; Store NOS to Addr in TOS
     R>exec
     ;Sexec

;;; : D-SPACES ( n --) DUP 0= IF DROP EXIT ENDIF
	0 DO 32 DSPLYwrite LOOP ;
3978
     $88; Code
     "D-SPACES"; Name
     $393A; Backward Link
D-SPACESexec:
3983 COLON; Complile The Following Section
     DUPexec; Duplicate TOS
     0=exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0006; Branch Offset
     	DROPexec; Delete TOS
     	EXITexec
     ENDIF
     Const0;  Push $0000 onto TOS for Loop Index
     (DO)exec
     	LITexec; Put value that follows on TOS
     	$0020; Literal Value
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
TYPE-SECexec:
39AC COLON; Complile The Following Section
     $F21D
     COUNTexec
     Const1;  Push $0001 onto TOS
     $F4CB
     $F530
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     $F21D
     C@exec
     -exec:	; Subtract TOS From NOS
     Const0;  Push $0000 onto TOS
     MAXexec
     D-SPACESexec
     Const2;  Push $0002 onto TOS
     $F21D
     C@exec
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
39E0 COLON; Complile The Following Section
     $F27B
     VarINITVLU; Push Var Addr onto TOS
     2@exec
     DABSexec
     <#exec
     #Sexec
     #>exec
     $F21D
     C!exec;  Store NOS (Char)  to Addr in TOS
     $F21D
     COUNTexec
     CMOVEexec
     Const2;  Push $0002 onto TOS
     Const1;  Push $0001 onto TOS
     $F3AB
     LITexec; Put value that follows on TOS
     $0005; Literal Value
     D-SPACESexec
     $F21D
     COUNTexec
     Const1;  Push $0001 onto TOS
     $F4CB
     $F530
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     $F21D
     C!exec;  Store NOS (Char)  to Addr in TOS
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
     COLON; Complile The Following Section
     BEGIN
     	INIT-DLYTME
     	BEGIN
     		$F912
     	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     	$FFFC; Branch Offset
     	PCkeyexec
     	LITexec; Put value that follows on TOS
     	$002F; Literal Value
     	OVERexec; Duplicate NOS at TOS
     	<exec
     	OVERexec; Duplicate NOS at TOS
     	LITexec; Put value that follows on TOS
     	$003B; Literal Value
     	<exec
     	ANDexec;  AND NOS with TOS
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0038; Branch Offset
     		$F21D
     		C@exec
     		LITexec; Put value that follows on TOS
     		$0004; Literal Value
     		>=exec
     		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     		$0014; Branch Offset
     		$F21D
     		LITexec; Put value that follows on TOS
     		$0005; Literal Value
     		LITexec; Put value that follows on TOS
     		$0020; Literal Value
     		FILLexec
     		Const0;  Push $0000 onto TOS
     		$F21D
     		C!exec;  Store NOS (Char)  to Addr in TOS
     		DUPexec; Duplicate TOS
     		$F21D
     		COUNTexec
     		+exec; Add NOS To TOS
     		C!exec;  Store NOS (Char)  to Addr in TOS
     		$F21D
     		C@exec
     		1+exec
     		$F21D
     		C!exec;  Store NOS (Char)  to Addr in TOS
     		TYPE-SECexec
     	ENDIF
     	$F732
     	=exec
     OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     $FFA6; Branch Offset
     $F21D
     NUMBERexec
     2DUPexec; Duplicate TOS/NOS
     VarINITVLU; Push Var Addr onto TOS
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     DROPexec; Delete TOS
     >Rexec
     Const0;  Push $0000 onto TOS
     VarINITVLU; Push Var Addr onto TOS
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     +exec; Add NOS To TOS
     !exec; Store NOS to Addr in TOS
     R>exec
     ;Sexec

;; A/DHiByte
3AA3
     $89; Code
     "A/DHiByte"; Name
     $3A1A; Backward Link
VarA/DHiByte:
3AAF $C596; Processing Routine Token
     $7002

;; A/DLowByte
3AB3
     $8A; Code
     "A/DLowByte"; Name
     $3AA3; Backward Link
VarA/DLowByte:
3AC0 GetVar
     $7001

;; A/DStatus
3AC4
     $89; Code
     "A/DStatus"; Name
     $3AB3; Backward Link
VarA/DStatus:
3AD0 GetVar
     $7002

;; 0 VARIABLE ACQcntrl
3AD4
     $88; Code
     "ACQcntrl"; Name
     $3AC4; Backward Link
VarACQcntrl:
3ADF GetVar
     $0EC2

;; VIALSWI/O
3AE3
     $89; Code
     "VIALSWI/O"; Name
     $3AD4; Backward Link
VIALSWI/Orefx:
3AEF GetVar
     $7002

;; 20 CONSTANT VIALbit
3AF3
     $87; Code
     "VIALbit"; Name
VIALbitrefx:
3AFD $3AE3; Backward Link
     GetVar
     $0020; Constant value

;; ?VIAL-IN
3B01
     $88; Code
     "?VIAL-IN"; Name
     $3AF3; Backward Link
     COLON; Complile The Following Section
     VIALSWI/Orefx
     C@exec
     VIALbitrefx
     ANDexec;  AND NOS with TOS
     0=exec
     DUPexec; Duplicate TOS
     $2276
     !exec; Store NOS to Addr in TOS
     ;Sexec    

;; ?VIAL-OUT
3B20
     $89; Code
     "?VIAL-OUT"; Name
     $3B01; Backward Link
?VIAL-OUTexec:
3B2C COLON; Complile The Following Section
     VIALSWI/Orefx
     C@exec
     VIALbitrefx
     ANDexec;  AND NOS with TOS
     DUPexec; Duplicate TOS
     0=exec
     $2276
     !exec; Store NOS to Addr in TOS
     0<>exec
     ;Sexec

;; 0 VARIABLE LMPstat
3B42
     $87; Code
     "LMPstat"; Name
     $3B20; Backward Link
LMPstatrefx:;	Push Var Addr onto TOS
3B4C GetVar
     $0EC4

;; BTST
3B50
     $84; Code
     "BTST"; Name
     $3B42; Backward Link
BTSTexec:
3B57 GetVar
     $0EC6

;; A/Ddta
3B5B
     $86; Code
     "A/Ddta"; Name
     $3B50; Backward Link
A/Ddtaexec:
3B64 GetVar
     $0EC8

;; GAINvlu
3B68
     $87; Code
     "GAINvlu"; Name
     $3B5B; Backward Link
VarGAINvlu:
3B72 GetVar
     $0ECA

;; 0 VARIABLE GAINexp
3B76
     $87; Code
     "GAINexp"; Name
     $3B68; Backward Link
VarGAINexp:
3B80 GetVar
     $0ECC

;; 0007 CONSTANT X1
3B84
     $82; Code
     "X1"; Name
     $3B76; Backward Link
ConstX1:
3B89 GetVar
     $0007

;; 0006 CONSTANT X10
3B8D
     $83; Code
     "X10"; Name
     $3B84; Backward Link
ConstX10:
3B93 GetVar
     $0006

;; 0004 CONSTANT X100
3B97
     $84; Code
     "X100"; Name
     $3B8D; Backward Link
ConstX100:
3B9E GetVar
     $0004

;; 0000 CONSTANT X1000
3BA2
     $85; Code
     "X1000"; Name
     $3B97; Backward Link
ConstX1000;
3BAA GetVar
     $0000

;; 90 CONSTANT REFchan
3BAE
     $87; Code
     "REFchan"; Name
     $3BA2; Backward Link
ConstREFchan:
3BB8 GetVar
     $0090

;; 50 CONSTANT SIGchan
3BBC
     $87; Code
     "SIGchan"; Name
     $3BAE; Backward Link
ConstSIGchan:
3BC6 GetVar
     $0050

;; 30 CONSTANT LMPinten
3BCA
     $88; Code
     "LMPinten"; Name
     $3BBC; Backward Link
ConstLMPinten:
3BD5 GetVar
     $0030

;; 0 CONSTANT Agnd
3BD9
     $84; Code
     "AGnd"; Name
     $3BCA; Backward Link
ConstAGnd:
3BE0 GetVar
     $0000

;;; 7002 CONSTANT ACQRI/O
3BE4
     $87; Code
     "ACQRI/O"; Name
     $3BD9; Backward Link
ACQRI/Orefx:
3BEE GetVar
     $7002; Constant value

;;; 0 VARIABLE ACQRmode
3BF2
     $88; Code
     "ACQRmode"; Name
     $3BE4; Backward Link
ACQRmoderefx:
3BFD GetVar
     0ECE; Var Addr

;;; 0 VARIABLE LMPERR
3C01
     $87; Code
     "LMPERR"; Name
     $3BF2; Backward Link
VarLMPERR:
3C0A GetVar
     0ED0; Var Addr

;;; 0 CONSTANT RUNmode
3C0E
     $87; Code    
     "RUNmode"; Name
     $3C01; Backward Link
ConstRUNmode:
3C18 GetVar
     $0000; Constant value

;;; 0 VARIABLE flMPERR
3C1C
     $87; Code
     "flMPERR"; Name
     $3C0E; Backward Link
VarflMPERR:
3C26 GetVar
     0ED2; Var Addr

;;; 60 CONSTANT TESTmode
3C2A
     $88; Code
     "TESTmode"; Name
     $3C1C; Backward Link
ConstTESTmode;		  Push $0060 onto TOS
3C35 GetVar
     $0060; Constant value

;;; 20 CONSTANT OSmode
3C39
     $86; Code
     "OSmode"; Name
     $3C2A; Backward Link
ConstOSmode:
3C42 GetVar
     $0020; Constant value

;;; 80 CONSTANT STARTacqr
3C46
     $89; Code
     "STARTacqr"; Name
     $3C39; Backward Link
ConstSTARTacqr:
3C52 GetVar
     $0080; Constant value

;;; 7F CONSTANT LMPreset
3C56
     $88; Code
     "LMPreset"; Name
     $3C46; Backward Link
ConstLMPreset:;		 Push Constant $007F to TOS
3C61 GetVar
     $007F; Constant value

;;; 0 VARIABLE #LMPERR
3C65
     $87; Code
     "#LMPERR"; Name
     $3C56; Backward Link
Var#LMPERR:
3C6F GetVar
     0ED4; Var Addr

;;; 40 CONSTANT LMPDtaRdy
3C73
     $89; Code
     "LMPDtaRdy"; Name
     $3C65; Backward Link
ConstLMPDtaRdy:
3C7F GetVar
     $0040; Constant value

;;; 0 VARIABLE TRIGerr
3C83
     $87; Code
     "TRIGerr"; Name
     $3C73; Backward Link
VarTRIGerr:
3C8D GetVar
     $0ED6; Var Addr

;;; 0 VARIABLE TRIGDLY
3C91
     $87; Code
     "TRIGDLY"; Name
     $3C83; Backward Link
VarTRIGDLY:
3C9B GetVar
     $0ED8; Var Addr
     
;;; DECIMAL

;;; : TRIGER-LAMP @ LMPreset AND ( Set bit for lamp HV reset)
3C9F
     $8B; Code
     "TRIGER-LAMP"; Name
     $3C91; Backward Link
TRIGER-LAMPexec:
3CAD COLON; Complile The Following Section
     LMPstatrefx  ; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     ConstLMPreset; Push Constant $007F to TOS
     ANDexec;  AND NOS with TOS
     DUPexec; Duplicate TOS
     ACQRI/Orefx
     C!exec;  Store NOS (Char)  to Addr in TOS
     VarTRIGDLY; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     LITexec; Put value that follows on TOS
     $0032; Literal Value
     MAXexec
     DELAY[ms]exec
     ConstSTARTacqr
     ORexec;  OR NOS with TOS
     DUPexec; Duplicate TOS
     LMPstatrefx  ; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     ACQRI/Orefx
     C!exec;  Store NOS (Char)  to Addr in TOS
     ;Sexec

;; : LMPFAIL -1 fABORT ! -1 TRIGerr ! fTEST @ 0=
	IF "LMPFAIL1 DISPLAY1 w-TYPE ( ** WAIT-ENT*) ENDIF ;
3CD9
     $87
     "LMPFAIL"
     $3C9F; Backward Link
     COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     $2227
     !exec; Store NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     VarTRIGerr; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     $F703
     @exec; Push Data Contained in TOS Addr to TOS
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
FIRE-LAMPexec:
3D13 COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     VarLMPERR; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     VarflMPERR; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     TRIGER-LAMPexec
     Const0;  Push $0000 onto TOS
     1+exec
     DUPexec; Duplicate TOS
     LITexec; Put value that follows on TOS
     $000A; Literal Value
     >exec
     VarA/DStatus; Push Var Addr onto TOS
     C@exec
     LITexec; Put value that follows on TOS
     $00FF; Literal Value
;;;;;;;;;;

org 3DB0
DRError db 'DATA READY ERROR(s)'

;; Rt~
3DC8
     $83
     "Rt~"
     $3D07; Backward Link
VarRt~:
3DCE GetVar
     $0EDA

;Gain and Mux Control Assembly Code Subroutine

;; 0 VARIABLE TmpX
3DD2
     $84
     "TmpX"
     $3DC8; Backward Link
VarTmpX:
3DD9 GetVar
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
3E20 $90; Code
     "SET-ANALOG-CNTRL"; Name
     $3DDD; Backward Link
SET-ANALOG-CNTRLexec:
3E33 $3E35 (SetADCtl:)

3E35   SetADCtl: JSR     GainCode   
3E38             ORA B   $MUXset+1   
3E3B             ORA B   #$08; BKLite bit
3E3D             STA B   $MUXstat+1; Store code in image safe   
3E40             STA B   $MuxControl   
3E43             JMP     NEXT


;; 0 VARIABLE SIG[Offset]
3E46 $8B
     "SIG[Offset]"
     $3E20; Backward Link
VarSIG[Offset]:
3E54 GetVar
     $0EDE

;; 0 VARIABLE SVstat
3E58
     $86
     "SVstat"
     $3E46; Backward Link
VarSVstat:
3E61 GetVar
     $0EE0

;; 0 VARIABLE 'GET[Sig] 
3E65
     $89
     "'GET[Sig]"
     $3E58; Backward Link
Var'GET[Sig]:
3E71 GetVar
     $0EE2

;; 0 VARIABLE #PRIMES
3E75
     $87
     "#PRIMES"
     $3E65; Backward Link
Var#PRIMES:
3E7F GetVar
     $0EE4

;; SET[Offset]
3E83
     $8B; Code
     "SET[Offset]"; Name
     $3E75; Backward Link
SET[Offset]exec:
3E91 COLON; Complile The Following Section
     LMPstatrefx  ; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     DUPexec; Duplicate TOS
     VarSVstat; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $009F; Literal Value
     ANDexec;  AND NOS with TOS
     LITexec; Put value that follows on TOS
     $0020; Literal Value
     ORexec;  OR NOS with TOS
     LMPstatrefx  ; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     ;Sexec

;; SET[Normal]
3EAF
     $8B; Code
     "SET[Normal]"; Name    
     $3E83; Backward Link
SET[Normal]exec:
3EBD COLON; Complile The Following Section
     VarSVstat; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     LMPstatrefx  ; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     ;Sexec

;; PRIME-LAMP-CONTROL
3EC9
     $92
     "PRIME-LAMP-CONTROL" 
     $3EAF; Backward Link
PRIME-LAMP-CONTROLexec:
3EDE COLON; Complile The Following Section
     Var#PRIMES; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS for Loop Limit
     Const0;  Push $0000 onto TOS for Loop Index
     (DO)exec'''
     	TRIGER-LAMPexec  
     (LOOP)exec
     $FFFC
     ;Sexec

;; 0 VARIABLE Temp
3EF0
     $84
     "Temp"
     $3EC9; Backward Link
VarTemp:
3EF7 GetVar
     $0EE6

;; 0 VARIABLE rtn
3EFB
     $83; Code
     "rtn"; Name
     $3EF0; Backward Link
Varrtn:
3F01 GetVar
     $0EE8

;; A/D!
3F05
     $84; Code
     "A/D!"; Name
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
     $8B; Code
     "A/D>LMPstat"; Name
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
      $88; Code
      "LOOPcntr"; Name
      $3F20; Backward Link
VarLOOPcntr:
3F47  GetVar
      $0EEA

;; A/DCNVRT
3F4B
      $88
      "A/DCNVRT"
      $3F3C; Backward Link
A/DCNVRTexec:
3F56 $3F58

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

;;; 0 VARIABLE DltaGains 20 ALLOT-RAM (Allot 20 words of RAM to DltaGains)
3FB3
     $89; Code
     "DltaGains"; Name
     $3F4B; Backward Link
VarDltaGains:
3FBF GetVar
     $0EEC

;;; : SCALE-GAIN ( n -- exp,N) 0 SWAP -4 1000 0 DltaGains @ nF*/ ;  
	Swap 0 and -4 1000 0 Leave DltaGains
3FC3
     $8A; Code
     "SCALE-GAIN"; Name
     $3FB3; Backward Link
SCALE-GAINexec:
3FD0 COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     SWAPexec; Swap TOS with NOS
     LITexec; Put value that follows on TOS
     $FFFC; Literal Value
     LITexec; Put value that follows on TOS
     $03E8; Literal Value
     Const0;  Push $0000 onto TOS
     VarDltaGains; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
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
DSPLYGc'sexec:
3FF4 COLON; Complile The Following Section
     CRexec
     $."exec;  Print Literal String
     $1D	; Number of Chars in print String
     " Gain factors Gc0,Gc1,Gc2,Gc3 "
     LITexec; Put value that follows on TOS
     $0EFC; Literal Value
     VarDltaGains; Push Var Addr onto TOS
     (DO)exec
     	)exec
     	2@exec
     	Const0;  Push $0000 onto TOS
     	ROTexec
     	FORMAT-ANSWERexec
     	SPACEexec
     	TYPEexec
     	LITexec; Put value that follows on TOS
     $0004; Literal Value
     (+LOOP)exec
     $FFEC
     ;Sexec

;;; 0 VARIABLE s0
4038
     $82; Code
     "s0"; Name
     $3FE8; Backward Link
Vars0:
403D GetVar
     $0F02

;;; : FORMAT-GAIN ( n10 -- adr,cnt) 0 SWAP -2 100 0 s0 @ nF*/
	0 ROT FORMAT-ANSWER ;
4041
     $8B; Code
     "FORMAT-GAIN"; Name 
     $4038; Backward Link
FORMAT-GAINexec:
404F COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     SWAPexec; Swap TOS with NOS
     LITexec; Put value that follows on TOS
     $FFFE; Literal Value
     LITexec; Put value that follows on TOS
     $0064; Literal Value
     Const0;  Push $0000 onto TOS
     Vars0; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     $E470
     Const0;  Push $0000 onto TOS
     ROTexec
     FORMAT-ANSWERexec
     ;Sexec

;;; : TYPEGAINS ."   GAIN " DUP FORMAT-GAIN TYPE ;
406D
     $89; Code
     "TYPEGAINS"; Name
     $4041; Backward Link
TYPEGAINSexec:
4079 COLON; Complile The Following Section
     $."exec;  Print Literal String
     $07	; Number of Chars in print String
     "  GAIN "
     DUPexec; Duplicate TOS
     FORMAT-GAINexec
     TYPEexec
     ;Sexec

;;; 0 VARIABLE CYCL[n]
408D
     $87; Code
     "CYCL[n]"; Name
     $406D; Backward Link
VarCYCL[n]:
4097 GetVar
     $0F04

;;; 0 VARIABLE MINSMPL#
409B
     $88; Code
     "MINSMPL#"; Name
     $408D; Backward Link
VarMINSMPL#:
40A6 GetVar
     $0F06

;;; 0 VARIABLE R[Hi]
40AA
     $85; Code
     "R[Hi]:; Name
     $409B; Backward Link
VarR[Hi]:
40B2 GetVar
     $0F08

;;; 0 VARIABLE R[Lo]
40B6
     $85; Code
     "R[Lo]"; Name
     $40AA; Backward Link
VarR[Lo]:
40BE GetVar
     $0F0A

;;; 0 VARIABLE Dlta
40C2
     $84; Code
     "Dlta"; Name
     $40B6; Backward Link
VarDlta:
40C9 GetVar
     $0F0C

;;; 0 VARIABLE SUM[Rn] 4 ALLOT-RAM
40CD
     $87; Code
     "SUM[Rn]"; Name
     $40C2; Backward Link
VarSUM[Rn]:
40D7 GetVar
     $0F0E

;;; 0 VARIABLE 1/Dlta 4 ALLOT-RAM
40DB
     $86; Code
     "1/Dlta; Name
     $40CD; Backward Link
Var1/Dlta:
40E4 GetVar
     $0F14

;;; 50 CONSTANT #GTRIES
40E8
     $87; Code
     "#GTRIES; Name
     $40DB; Backward Link
Const#GTRIES:;	Push $0032 onto TOS
40F2 GetVar
     $0032

;;; 1000 CONSTANT GLimit
40F6
     $86; Code
     "GLimit"; Name
     $40E8; Backward Link
GLimitrefx:
40FF GetVar
     $03E8

;;; 0 VARIABLE fNFg>Lim
4103
     $88; Code
     "fNFg>Lim; Name
     $40F6; Backward Link
VarfNFg>Lim:
410E GetVar
     $0F1A

;;; 0 VARIABLE fOffset
4112
     $87; Code
     "fOffset" Name
     $4103; Backward Link
VarfOffset:
411C GetVar
     $0F1C

;;; : INIT-SIGFILTER 0. SUM[Rn] 2! 0 R[Hi] ! 32767 R[Lo] ! 0 CYCL[n] ! ;
4120
     $8E; Code
     "INIT-SIGFILTER"
     $4112; Backward Link
INIT-SIGFILTERexec:
4131 COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     VarSUM[Rn]; Push Var Addr onto TOS
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     Const0;  Push $0000 onto TOS
     VarR[Hi]; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $7FFF; Literal Value
     VarR[Lo]; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     Const0;  Push $0000 onto TOS
     VarCYCL[n]; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     ;Sexec

;;; : TYPE-%Dlta <# # # 46 HOLD #S #> TYPE ;
4155
     $8A; Code
     "TYPE-%Dlta"; Name
     $4120; Backward Link
     COLON; Complile The Following Section
     <#exec
     #exec
     #exec
     LITexec; Put value that follows on TOS
     $002E; Literal Value
     HOLDexec
     #Sexec
     #>exec
     TYPEexec
     ;Sexec

;;; : GTYPE-ALL CR SUM[Rn] 2@ CYCL[n] @ 8 * D/                        ." GAINSIG=" D.                                                 
4178
      $89                  
      "GTYPE-ALL"; Name
      $4155; Backward Link
GTYPE-ALLexec:
4184 COLON; Complile The Following Section
      CRexec
      VarSUM[Rn]; Push Var Addr onto TOS
      2@exec
      VarCYCL[n]; Push Var Addr onto TOS
      @exec; Push Data Contained in TOS Addr to TOS
      LITexec; Put value that follows on TOS
      $0008; Literal Value
      *exec
      D/exec
      $."exec;  Print Literal String
      $08	; Number of Chars in print String
      "GAINSIG="
      D.exec
      $."exec;  Print Literal String
      $07	; Number of Chars in print String
      "%DLTA="
      VarDlta; Push Var Addr onto TOS
      @exec; Push Data Contained in TOS Addr to TOS
      Const0;  Push $0000 onto TOS
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
@TEST-SIGexec:
41C5 COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     LITexec; Put value that follows on TOS
     $0008; Literal Value for Loop Limit
     Const0;  Push $0000 onto TOS for Loop Index
     (DO)exec
     	FIRE-LAMPexec
     	A/DCNVRTexec
     	+exec; Add NOS To TOS
     (LOOP)exec
     $FFF8
     DUPexec; Duplicate TOS
     VarR[Hi]; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     >exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0008; Branch Offset
     	DUPexec; Duplicate TOS
     	VarR[Hi]; Push Var Addr onto TOS
     	!exec; Store NOS to Addr in TOS
     ENDIF
     DUPexec; Duplicate TOS
     VarR[Lo]; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     <exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0008; Branch Offset
     	DUPexec; Duplicate TOS
     	VarR[Lo]; Push Var Addr onto TOS
     	!exec; Store NOS to Addr in TOS
     ENDIF
     Const0;  Push $0000 onto TOS
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
CHK-GAINokexec:
4210 COLON; Complile The Following Section
     Var1/Dlta; Push Var Addr onto TOS
     2@exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $000A; Branch Offset
     	DROPexec; Delete TOS
     	Const0;  Push $0000 onto TOS
     	BRANCHexec
     	$001E
     ENDIF
     DUPexec; Duplicate TOS
     0<exec ;Destructive Test of TOS for <0
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $000A; Branch Offset
     	DROPexec; Delete TOS
     	Const0;  Push $0000 onto TOS
     	BRANCHexec
     	$000E
     ENDIF
     LITexec; Put value that follows on TOS
     $2710; Literal Value
     SWAPexec; Swap TOS with NOS
     Const1;  Push $0001 onto TOS
     MAXexec
     /exec
     VarDlta; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     GTYPE-ALLexec
     VarCYCL[n]; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     Const#GTRIES;  Push $0032 onto TOS
     >exec
     LITexec; Put value that follows on TOS
     $0064; Literal Value
     Const#GTRIES;  Push $0032 onto TOS
     *exec
     Const0;  Push $0000 onto TOS
     VarSUM[Rn]; Push Var Addr onto TOS
     2@exec
     D<exec
     ANDexec;  AND NOS with TOS
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0030; Branch Offset; *** check this offset ***
     	LITexec; Put value that follows on TOS
     	$FFFF; Literal Value
     	VarfNFg>Lim; Push Var Addr onto TOS
     	!exec; Store NOS to Addr in TOS
     	LITexec; Put value that follows on TOS
     	$0000; Literal Value
    	LITexec; Put value that follows on TOS
     	$0000; Literal Value
     	VarSUM[Rn]; Push Var Addr onto TOS
     	2!exec; Store NOS and 2nd NOS to Addr in TOS
     	CRexec
     	$."exec;  Print Literal String
     	$13	; Number of Chars in print String
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
GET-TEST-SIGexec:
42A1 COLON; Complile The Following Section
     INIT-SIGFILTERexec
     SPACEexec
     Const#GTRIES;  Push $0032 onto TOS
     2+exec for Loop Limit
     Const0;  Push $0000 onto TOS for Loop Index
     (DO)exec
     	@TEST-SIGexec
     	VarSUM[Rn]; Push Var Addr onto TOS
     	2@exec
     	D+exec
    	VarSUM[Rn]; Push Var Addr onto TOS
     	2!exec; Store NOS and 2nd NOS to Addr in TOS
     	Const1;  Push $0001 onto TOS
     	VarCYCL[n]; Push Var Addr onto TOS
     	+!exec; Add NOS to Addr in TOS
     	VarCYCL[n]; Push Var Addr onto TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	DUPexec; Duplicate TOS
     	.exec
     	VarMINSMPL#; Push Var Addr onto TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	>exec
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0044; Branch Offset
     		VarSUM[Rn]; Push Var Addr onto TOS
     		2@exec
     		VarR[Hi]; Push Var Addr onto TOS
     		@exec; Push Data Contained in TOS Addr to TOS
     		VarR[Lo]; Push Var Addr onto TOS
     		@exec; Push Data Contained in TOS Addr to TOS
     		-exec:	; Subtract TOS From NOS
     		Const1;  Push $0001 onto TOS
     		MAXexec
     		D/exec
     		2DUPexec; Duplicate TOS/NOS
     		Var1/Dlta; Push Var Addr onto TOS
     		2!exec; Store NOS and 2nd NOS to Addr in TOS
     		GLimitrefx
     		Const0;  Push $0000 onto TOS
     		D>exec
     		$2227
     		@exec; Push Data Contained in TOS Addr to TOS
     		ORexec;  OR NOS with TOS
     		VarSUM[Rn]; Push Var Addr onto TOS
     		2@exec
     		LITexec; Put value that follows on TOS
     		$0190; Literal Value
     		LITexec; Put value that follows on TOS
     		$0000; Literal Value
     		D<exec
     		VarfOffset; Push Var Addr onto TOS
     		@exec; Push Data Contained in TOS Addr to TOS
     		ANDexec;  AND NOS with TOS
     		ORexec;  OR NOS with TOS
     		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     		$0004; Branch Offset
     			LEAVEexec
 		ENDIF
     	ENDIF
     (LOOP)exec
     $FF98
     CHK-GAINokexec
     VarSUM[Rn]; Push Var Addr onto TOS
     2@exec
     VarCYCL[n]; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     LITexec; Put value that follows on TOS
     $0008; Literal Value
     *exec
     D/exec
     DROPexec; Delete TOS
     ;Sexec

;;; : READtest CR ." Sig " 0 fOffset ! GET-TEST-SIG ;               
432F
     $88; Code
     "READtest" Name
     $4292; Backward Link
READtestexec:
433A COLON; Complile The Following Section
     CRexec
     $."exec;  Print Literal String
     $04	; Number of Chars in print String
     "Sig "
     Const0;  Push $0000 onto TOS
     VarfOffset; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     GET-TEST-SIGexec
     ;Sexec

: READoffset CR ." Offset "                                       
	SET[Offset] 7 MINSMPL# ! -1 fOffset !                           
	GET-TEST-SIG SET[Normal] ;
434F
     $8A; Code
     "READoffset"; Name
READoffsetexec:
435C $432F; Backward Link
     COLON; Complile The Following Section
     CRexec
     $."exec;  Print Literal String
     $07	; Number of Chars in print String
     "Offset "
     SET[Offset]exec
     LITexec; Put value that follows on TOS
     $0007; Literal Value

;;; ( GAIN MEASUREMENT                             08:04 10/23/89 )
;;; : SETtestSIG ( Set test signal input) LMPstat @ TESTmode OR LMPstat ! ;
4382
     $8A; Code
     "SETtestSIG"; Name
     $434F; Backward Link
SETtestSIGexec:
438F COLON; Complile The Following Section
     LMPstatrefx  ; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     ConstTESTmode;  Push $0060 onto TOS
     ORexec;  OR NOS with TOS
     LMPstatrefx  ; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     ;Sexec

;;; : SETnormalSIG ( Set normal detector signal input)   LMPstat @ TESTmode 255 XOR AND  LMPstat ! ;
439F
     $8C; Code
     "SETnormalSIG" Name
     $4382; Backward Link
SETnormalSIGexec:
43AE COLON; Complile The Following Section
     LMPstatrefx  ; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     ConstTESTmode;  Push $0060 onto TOS
     LITexec; Put value that follows on TOS
     $00FF; Literal Value
     XORexec;  XOR NOS with TOS
     ANDexec;  AND NOS with TOS
     LMPstatrefx  ; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     ;Sexec

;;; : @TEST[sig0] SIGchan  7 OR BKLITEbit OR DUP MUXstat ! CHANmux C! 8 1- MINSMPL# ! READtest READoffset - ;
43C4
     $8B; Code
     "@TEST[sig0]"; Name
     $439F; Backward Link
@TEST[sig0]exec:
43D2 COLON; Complile The Following Section
     ConstSIGchan
     LITexec; Put value that follows on TOS
     $0007; Literal Value
     ORexec;  OR NOS with TOS
     $F0F9
     ORexec;  OR NOS with TOS
     DUPexec; Duplicate TOS
     $224F
     !exec; Store NOS to Addr in TOS
     $225D
     C!exec;  Store NOS (Char)  to Addr in TOS
     LITexec; Put value that follows on TOS
     $0008; Literal Value
     1-exec; Subtract 1 from TOS (DEC TOS)
     VarMINSMPL#; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     READtestexec
     READoffsetexec
     -exec:	; Subtract TOS From NOS
     ;Sexec

;;; : @TEST[sig1] MUXstat @ 7 OR 1 XOR DUP MUXstat ! CHANmux C! 3 MINSMPL# ! READtest READoffset - ;                          
43FC
     $8B; Code
     "@TEST[sig1]"; Name
     $43C4; Backward Link
@TEST[sig1]exec:
440A COLON; Complile The Following Section
     $224F
     @exec; Push Data Contained in TOS Addr to TOS
     LITexec; Put value that follows on TOS
     $0007; Literal Value
     ORexec;  OR NOS with TOS
     Const1;  Push $0001 onto TOS
     XORexec;  XOR NOS with TOS
     DUPexec; Duplicate TOS
     $224F
     !exec; Store NOS to Addr in TOS
     $225D
     C!exec;  Store NOS (Char)  to Addr in TOS
     Const3;  Push $0003 onto TOS
     VarMINSMPL#; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     READtestexec
     READoffsetexec
     -exec:	; Subtract TOS From NOS
     ;Sexec

;;; ": @TEST[sig2] MUXstat @ 7 OR 2 XOR DUP MUXstat ! CHANmux C! 3 MINSMPL# ! READtest READoffset - ;
4432
     $8B; Code
     "@TEST[sig2]" Name
     $43FC; Backward Link
@TEST[sig2]exec:
4440 COLON; Complile The Following Section
     $224F
     @exec; Push Data Contained in TOS Addr to TOS
     LITexec; Put value that follows on TOS
     $0007; Literal Value
     ORexec;  OR NOS with TOS
     Const2;  Push $0002 onto TOS
     XORexec;  XOR NOS with TOS
     DUPexec; Duplicate TOS
     $224F
     !exec; Store NOS to Addr in TOS
     $225D
     C!exec;  Store NOS (Char)  to Addr in TOS
     Const3;  Push $0003 onto TOS
     VarMINSMPL#; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     READtestexec
     READoffsetexec
     -exec:	; Subtract TOS From NOS
     ;Sexec

;;; : @TEST[sig3] MUXstat @ 7 OR 4 XOR DUP MUXstat ! CHANmux C! 3 MINSMPL# ! READtest READoffset - ;
4468
     $8B
     "@TEST[sig3]; Name
     $4432; Backward Link
@TEST[sig3]exec:
4476 COLON; Complile The Following Section
     $224F
     @exec; Push Data Contained in TOS Addr to TOS
     LITexec; Put value that follows on TOS
     $0007; Literal Value
     ORexec;  OR NOS with TOS
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     XORexec;  XOR NOS with TOS
     DUPexec; Duplicate TOS
     $224F
     !exec; Store NOS to Addr in TOS
     $225D
     C!exec;  Store NOS (Char)  to Addr in TOS
     Const3;  Push $0003 onto TOS
     VarMINSMPL#; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     READtestexec
     READoffsetexec
     -exec:	; Subtract TOS From NOS
     ;Sexec

;;; 0 VARIABLE fGERR
44A0
     $85; Code
     "fGERR"; Name
     $4468; Backward Link
VarfGERR:
44A8 GetVar
     $0F1E

;;; "STRNG" "RNGERR  | GAIN RANGE ERROR        |
44AC
     $87; Code
     ""RNGERR"; Name
     $44A0; Backward Link
RNGERRexec:
44B6 "GAIN RANGE ERROR        "
     $00

;;; : Stop "STOPED DISPLAY1 w-TYPE
44D3
     $84; Code
     "Stop"; Name
     $44AC; Backward Link
Stopexec:
44DA COLON; Complile The Following Section
     $26D5
     $F4BC
     $F51E
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     $2201
     !exec; Store NOS to Addr in TOS
     $22BF
     $F142
     BEGIN
     	$F18D
     	UPDATEkeyQexec
     	Const0;  Push $0000 onto TOS
     OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     $FFF8; Branch Offset
     ;Sexec

;;; : EVALGAIN ( n --   fGERR updated) DUP  9 < SWAP 12 > OR fNFg>Lim @ OR fGERR @ OR fGERR ! ;
44FA
     $88; Code
     "EVALGAIN"; Name
     $44D3; Backward Link
EVALGAINexec:
4505 COLON; Complile The Following Section
     DUPexec; Duplicate TOS
     LITexec; Put value that follows on TOS
     $0009; Literal Value
     <exec
     SWAPexec; Swap TOS with NOS
     LITexec; Put value that follows on TOS
     $000C; Literal Value
     >exec
     ORexec;  OR NOS with TOS
     VarfNFg>Lim; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     ORexec;  OR NOS with TOS
     VarfGERR; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     4C32A
     VarfGERR; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     ;Sexec

;;; : GAINTEST ( -- f) fGERR @ IF "RNGERR DISPLAY2 w-TYPE Stop ENDIF ;
	IF fGERR True then Send String RNGERR "GAIN RANGE ERROR" to DISPLAY2 w-TYPE STOP
452B
     $88; Code
     "GAINTEST"; Name
     $44FA; Backward Link
GAINTESTexec:
4536 COLON; Complile The Following Section
     VarfGERR; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $000A; Branch Offset
     	RNGERRexec
     	$F4CB
     	$F51E
     	Stopexec
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
     COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     VarfGERR; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     Const0;  Push $0000 onto TOS
     VarfNFg>Lim; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     PRIME-LAMP-CONTROLexec
     SETtestSIGexec
     CRexec
     $."exec;  Print Literal String
     $19	; Number of Chars in print String
     "Test Signals G0,G1,G2,G3 "
     @TEST[sig0]exec
     DUPexec; Duplicate TOS
     >Rexec
     DUPexec; Duplicate TOS
     Vars0; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     VarDltaGains; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     @TEST[sig1]exec
     TYPEGAINSexec
     DUPexec; Duplicate TOS
     Rexec
     /exec
     EVALGAINexec
     SCALE-GAINexec
     VarDltaGains; Push Var Addr onto TOS
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     +exec; Add NOS To TOS
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     @TEST[sig2]exec
     TYPEGAINSexec
     DUPexec; Duplicate TOS
     Rexec
     /exec
     EVALGAINexec
     SCALE-GAINexec
     VarDltaGains; Push Var Addr onto TOS
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     +exec; Add NOS To TOS
     2@exec
     LITexec; Put value that follows on TOS
     $FFFC; Literal Value
     LITexec; Put value that follows on TOS
     $2710; Literal Value
     $E470
     VarDltaGains; Push Var Addr onto TOS
     LITexec; Put value that follows on TOS
     $0008; Literal Value
     +exec; Add NOS To TOS
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     @TEST[sig3]exec
     TYPEGAINSexec
     DUPexec; Duplicate TOS
     R>exec
     /exec
     EVALGAINexec
     SCALE-GAINexec
     VarDltaGains; Push Var Addr onto TOS
     LITexec; Put value that follows on TOS
     $0008; Literal Value
     +exec; Add NOS To TOS
     2@exec
     LITexec; Put value that follows on TOS
     $FFFC; Literal Value
     LITexec; Put value that follows on TOS
     $2710; Literal Value
     $E470
     VarDltaGains; Push Var Addr onto TOS
     LITexec; Put value that follows on TOS
     $000C; Literal Value
     +exec; Add NOS To TOS
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     SETnormalSIGexec
     LITexec; Put value that follows on TOS
     $FFFC; Literal Value
     LITexec; Put value that follows on TOS
     $2710; Literal Value
     VarDltaGains; Push Var Addr onto TOS
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     DSPLYGc'sexec
     GAINTESTexec
     ;Sexec

;;; ( Check that gains OK)
 
;;; ( SIGNAL/REFERENCE CHANNEL READ 
               10:46 10/25/89 ) 
;;; : GET[Sig] ( --n) SIGchan MUXset ! SET-ANALOG-Cntrl A/DCNVRT ;
	'GET[Sig] CFA 'GET[Sig] !                                      
461B
     $88; Code
     "GET[Sig]"; Name
     454A; Backward Link
GET[Sig]exec:
4626 COLON; Complile The Following Section
     ConstSIGchan
     $2241
     !exec; Store NOS to Addr in TOS
     SET-ANALOG-CNTRLexec
     A/DCNVRTexec
     ;Sexec

;;; : GETAVE  0. 10 0 DO FIRE-LAMP GET[Sig] 0 D+                        
	?VIAL-OUT fABORT @ OR IF LEAVE ENDIF LOOP 10 D/ DROP ;
4634
     $86; Code
     "GETAVE"; Name
     $461B; Backward Link
GETAVEexec:
463D COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     LITexec; Put value that follows on TOS
     $000A; Literal Value for Loop Limit
     Const0;  Push $0000 onto TOS for Loop Index
     (DO)exec
     	FIRE-LAMPexec
     	GET[Sig]exec
     	Const0;  Push $0000 onto TOS
    	 D+exec
     	?VIAL-OUTexec
     	$2227
     	@exec; Push Data Contained in TOS Addr to TOS
     	ORexec;  OR NOS with TOS
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0004; Branch Offset
     		LEAVEexec
     	ENDIF
     (LOOP)exec
     $FFE8
     LITexec; Put value that follows on TOS
     $000A; Literal Value
     D/exec
     DROPexec; Delete TOS
     ;Sexec

;;; : UPDATE-OFFSET SET[Offset] GETAVE SET[Normal] SIG[Offset] ! ;  
4673
     $8D; Code
     "UPDATE-OFFSET"; Name
     $4634; Backward Link
UPDATE-OFFSETexec:
4683 COLON; Complile The Following Section
     SET[Offset]exec
     GETAVEexec
     SET[Normal]exec
     VarSIG[Offset]; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     ;Sexec

;;; : GET[Ref] ( --n) REFchan MUXset ! SET-ANALOG-Cntrl A/DCNVRT ;
4691
     $88; Code
     "GET[Ref]"; Name
     $4673; Backward Link
GET[Ref]exec:
469C COLON; Complile The Following Section
     ConstREFchan
     $2241
     !exec; Store NOS to Addr in TOS
     SET-ANALOG-CNTRLexec
     A/DCNVRTexec
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
     COLON; Complile The Following Section
     PRIME-LAMP-CONTROLexec
     CRexec
     $."exec;  Print Literal String
     $10	; Number of Chars in print String
     "-AGC-  GAIN/SIG "
     Const0;  Push $0000 onto TOS
     VarGAINvlu; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     BEGIN
     	VarGAINvlu; Push Var Addr onto TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	LITexec; Put value that follows on TOS
     	$000A; Literal Value
     	*exec
     	Const1;  Push $0001 onto TOS
     	MAXexec
     	VarGAINvlu; Push Var Addr onto TOS
     	!exec; Store NOS to Addr in TOS
     	GET[Sig]exec
     	DROPexec; Delete TOS
     	GETAVEexec
     	UPDATE-OFFSETexec
     	VarSIG[Offset]; Push Var Addr onto TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	-exec:	; Subtract TOS From NOS
     	$."exec;  Print Literal String
     	$02;	Number of Chars in print String
     	", "
     	VarGAINvlu; Push Var Addr onto TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	.exec
     	$."exec;  Print Literal String
     	$02;	Number of Chars in print String
     	"/ "
     	DUPexec; Duplicate TOS
     	.exec
     	LITexec; Put value that follows on TOS
     	$012C; Literal Value
     	>exec
     	VarGAINvlu; Push Var Addr onto TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	LITexec; Put value that follows on TOS
     	$03E8; Literal Value
     	>=exec
     	ORexec;  OR NOS with TOS
     	VarGAINexp; Push Var Addr onto TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	$21D6
     	@exec; Push Data Contained in TOS Addr to TOS
     	>=exec
     	ORexec;  OR NOS with TOS
     	$2227
     	@exec; Push Data Contained in TOS Addr to TOS
     	ORexec;  OR NOS with TOS
     OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     $FFA6; Branch Offset
     ;Sexec

;;; : SETGAIN  ( n -- ) 1 MAX GAINvlu ! SET-ANALOG-Cntrl ;
4731
     $87; Code
     "SETGAIN"; Name
     $46AA; Backward Link
     COLON; Complile The Following Section
     Const1;  Push $0001 onto TOS
     MAXexec
     VarGAINvlu; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     SET-ANALOG-CNTRLexec
     ;Sexec

;;; ( MIXED DIVIDE AND ROUND 
                      06:16 10/24/89 ) 
;;; DECIMAL

;;; 0 VARIABLE AVE[S/R] 8 ALLOT-RAM
4749
     $88; Code
     "AVE[S/R]"; Name
     $4731; Backward Link
VarAVE[S/R]:
4754 GetVar
     $0F20

;;; 0 VARIABLE SIG[Ave] 8 ALLOT-RAM
4758
     $88; Code
     "SIG[Ave]"; Name
     $4749; Backward Link
VarSIG[Ave]:
4763 GetVar
     $0F2A

;;; 0 VARIABLE REF[Ave] 8 ALLOT-RAM
4767
     $88; Code
     "REF[Ave]"; Name
     $4758; Backward Link
VarREF[Ave]:
4772 GetVar
     $0F34

;;; 0 VARIABLE SIG[Ave]/REF[Ave] 8 ALLOT-RAM
4776
     $91; Code
     "SIG[Ave]/REF[Ave]"; Name
     $4767; Backward Link
VarSIG[Ave]/REF[Ave]:
478A GetVar
     $0F3E

;;; : /RND ( d,n1 -- n2 rounded)
	DUP >R M/MOD DROP SWAP R> 2/ 1- > IF 1+ ENDIF ;
478E
     $84; Code
     "/RND; Name
     $4776; Backward Link
/RNDexec:
4795 COLON; Complile The Following Section
     DUPexec; Duplicate TOS
     >Rexec
     M/MODexec
     DROPexec; Delete TOS
     SWAPexec; Swap TOS with NOS
     R>exec
     2/exec
     1-exec; Subtract 1 from TOS (DEC TOS)
     >exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0004; Branch Offset
     	1+exec
     ENDIF
     ;Sexec

;;; ( DATA QUES 
                                   0 17:23 05/10/81
;;; 100 CONSTANT QSIZ
47B1
     $84; Code
     "QSIZ" name
     $478E; Backward Link
ConstQSIZ:
47B8 GetVar
     $0064

;;; 0 VARIABLE SIGQUE QSIZ 2* ALLOT-RAM
47BC
     $86; Code
     "SIGQUE"; Name
     $47B1; Backward Link
VarSIGQUE:
47C5 GetVar
     $0F48

;;; 0 VARIABLE REFQUE QSIZ 2* ALLOT-RAM
47C9
     $86; Code
     "REFQUE"; Name
     $47BC; Backward Link
VarREFQUE:
47D2 GetVar
     $1012

;;; 0 VARIABLE S/RQUE QSIZ 2* ALLOT-RAM
47D6
     $86; Code
     "S/RQUE"; Name
     $47C9; Backward Link
VarS/RQUE:
47DF GetVar
     $10DC

;;; 0 VARIABLE #SMPLS
47E3
     $86; Code
     "#SMPLS"; Name
     $47D6; Backward Link
Var#SMPLS:
47EC GetVar
     $11A6
 
;;; 0 VARIABLE #OUTLYERS
47F0
     $89; Code
     "#OUTLYERS"; Name
     $47E3; Backward Link
Var#OUTLYERS:
47FC GetVar
     $11A8

;;; 0 VARIABLE SMPL#
4800
     $85; Code
     "SMPL#"; Name
     $47F0; Backward Link
VarSMPL#:
4808 GetVar
     $11AA
 
;;; 0 VARIABLE SMPLtotal
480C
     $89; Code
     "SMPLtotal" Name
     $4800; Backward Link
VarSMPLtotal:
4818 GetVar
     $11AC

;;; 0 VARIABLE SMPLNDX
481C
     $87; Code
     "SMPLNDX"; Name
     $480C; Backward Link
VarSMPLNDX:
4826 GetVar
     $11AE

;;; 0 VARIABLE NDXlimit
482A
     $88; Code
     "NDXlimit"; Name
     $481C; Backward Link
VarNDXlimit:
4835 GetVar
     $11B0

;;; 0 VARIABLE f1stTEST
4839
     $88; Code
     "f1stTEST"; Name
     $482A; Backward Link
Varf1stTEST:
4844 GetVar
     $11B2
 
;;; 0 VARIABLE ASMBLY
4848
     $86; Code
     "ASMBLY"; Name
     $4839; Backward Link
VarASMBLY:
4851 GetVar
     $11B4

;;; 0 VARIABLE #SMPLtbl 8 ALLOT-RAM
4855
     $88; Code
     "#SMPLtbl"; Name
     $4848; Backward Link
Var#SMPLtbl:
4860 GetVar
     $11B6

;;; 0 VARIABLE #OUTLYRtbl 8 ALLOT-RAM
4864
     $8A; Code
     "#OUTLYRtbl"; Name
     $4855; Backward Link
Var#OUTLYRtbl:
4871 GetVar
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
#OUTLYRtbl0refx:
488B GetVar
     $4875

;;; HERE  8 ,  8 ,  8 ,  8 , CONSTANT #SMPLtbl0
488F
     $0008
     $0008
     $0008
     $0008

0 VARIABLE #SMPLtbl0
4897
     $89; Code
     "#SMPLtbl0"; Name
     $487D; Backward Link
Var#SMPLtbl0:
48A3 GetVar
     $488F

;;; : INIT-FLTRTBLS 8 0 DO #SMPLtbl0 I + @ #SMPLtbl I + !
	#OUTLYRtbl0 I + @ #OUTLYRtbl I + ! 2 +LOOP ;
48A7
     $8D; Code
     "INIT-FLTRTBLS"; Name
     $4897; Backward Link
     COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $0008; Literal Value for Loop Limit
     Const0;  Push $0000 onto TOS for Loop Index
     (DO)exec
     	Var#SMPLtbl0; Push Var Addr onto TOS
     	)exec
     	+exec; Add NOS To TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	Var#SMPLtbl; Push Var Addr onto TOS
     	)exec
     	+exec; Add NOS To TOS
     	!exec; Store NOS to Addr in TOS
     	#OUTLYRtbl0refx
     	)exec
     	+exec; Add NOS To TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	Var#OUTLYRtbl; Push Var Addr onto TOS
     	)exec
     	+exec; Add NOS To TOS
     	!exec; Store NOS to Addr in TOS
     	Const2;  Push $0002 onto TOS
     (+LOOP)exec
     $FFDC
     ;Sexec

;;; ( DATA READ                                    1 17:26 05/10/81 
;;; : SET-#SMPLS ( gain --) 2* #SMPLtbl + @ #SMPLS ! ;
48E9
     $8A; Code
     "SET-#SMPLS"; Name
     $48A7; Backward Link
SET-#SMPLSexec:
48F6 COLON; Complile The Following Section
     2*exec; Multiply TOS by 2; (Arithmetic Shift Left TOS)
     Var#SMPLtbl; Push Var Addr onto TOS
     +exec; Add NOS To TOS
     @exec; Push Data Contained in TOS Addr to TOS
     Var#SMPLS; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     ;Sexec

: SET-#OUTLYRS ( gain --) 2* #OUTLYRtbl + @ #OUTLYERS ! ;
4906
     $8C; Code
     "SET-#OUTLYRS"; Name
     $48E9; Backward Link
SET-#OUTLYRSexec:
4915 COLON; Complile The Following Section
     2*exec; Multiply TOS by 2; (Arithmetic Shift Left TOS)
     Var#OUTLYRtbl; Push Var Addr onto TOS
     +exec; Add NOS To TOS
     @exec; Push Data Contained in TOS Addr to TOS
     Var#OUTLYERS; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     ;Sexec

;;; : INIT-MEASURE-CYCLE GAINexp @ DUP SET-#SMPLS SET-#OUTLYRS
	#SMPLS @ #OUTLYERS @ 2* +
	DUP SMPLtotal ! 2* NDXlimit ! 0 SMPL# ! 0 SMPLNDX ! ;
4925
     $92; Code
     "INIT-MEASURE-CYCLE"; Name
     $4906; Backward Link
     COLON; Complile The Following Section
     VarGAINexp; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     DUPexec; Duplicate TOS
     SET-#SMPLSexec
     SET-#OUTLYRSexec
     Var#SMPLS; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     Var#OUTLYERS; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     2*exec; Multiply TOS by 2; (Arithmetic Shift Left TOS)
     +exec; Add NOS To TOS
     DUPexec; Duplicate TOS
     VarSMPLtotal; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     2*exec; Multiply TOS by 2; (Arithmetic Shift Left TOS)
     VarNDXlimit; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     Const0;  Push $0000 onto TOS
     VarSMPL#; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     Const0;  Push $0000 onto TOS
     VarSMPLNDX; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
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
     COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $2710; Literal Value
     FIRE-LAMPexec
     GET[Sig]exec
     VarSIG[Offset]; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     -exec:	; Subtract TOS From NOS
     Const1;  Push $0001 onto TOS
     MAXexec
     DUPexec; Duplicate TOS
     VarSIGQUE; Push Var Addr onto TOS
     VarSMPLNDX; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     +exec; Add NOS To TOS
     !exec; Store NOS to Addr in TOS
     GET[Ref]exec
     Const1;  Push $0001 onto TOS
     MAXexec
     DUPexec; Duplicate TOS
     VarREFQUE; Push Var Addr onto TOS
     VarSMPLNDX; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     +exec; Add NOS To TOS
     !exec; Store NOS to Addr in TOS
     */exec
     VarS/RQUE; Push Var Addr onto TOS
     VarSMPLNDX; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     +exec; Add NOS To TOS
     !exec; Store NOS to Addr in TOS
     Const2;  Push $0002 onto TOS
     VarSMPLNDX; Push Var Addr onto TOS
     +!exec; Add NOS to Addr in TOS
     ;Sexec

;;; : INIT-MEASURE-DATA 
	0. AVE[S/R] 2! 0. SIG[Ave] 2! 0. REF[Ave] 2!
	0. SIG[Ave]/REF[Ave] 2! ;
49C0
     $91; Code
     "INIT-MEASURE-DATA"; Name
     $496C; Backward Link
     COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     VarAVE[S/R]; Push Var Addr onto TOS
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     VarSIG[Ave]; Push Var Addr onto TOS
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     VarREF[Ave]; Push Var Addr onto TOS
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     VarSIG[Ave]/REF[Ave]; Push Var Addr onto TOS
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     ;Sexec

;;; ( OUTLYER REJECT
 
;;; 0 VARIABLE MAXSMPL
4A08
     $87; Code
     "MAXSMPL"; Name
     $49C0; Backward Link
VarMAXSMPL:
4A12 GetVar
     $11CA

;;; 0 VARIABLE MAXNDX
4A16
     $86; Code
     "MAXNDX"; Name
     $4A08; Backward Link
VarMAXNDX:
4A1F GetVar
     $11CC

;;; 0 VARIABLE MINSMPL
4A23
     $87; Code
     "MINSMPL"; Name
     $4A16; Backward Link
VarMINSMPL:
4A2D GetVar
     $11CE

;;; 0 VARIABLE MINNDX
4A31
     $86; Code
     "MINNDX"; Name
     $4A23; Backward Link
VarMINNDX:
4A3A GetVar
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
CHK-MIN/MAXexec:
4A4C COLON; Complile The Following Section
     >Rexec
     DUPexec; Duplicate TOS
     VarMAXSMPL; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     >exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $000E; Branch Offset
     	DUPexec; Duplicate TOS
     	VarMAXSMPL; Push Var Addr onto TOS
     	!exec; Store NOS to Addr in TOS
     	Rexec
     	VarMAXNDX; Push Var Addr onto TOS
     	!exec; Store NOS to Addr in TOS
     ENDIF
     DUPexec; Duplicate TOS
     VarMINSMPL; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     <exec
     VarMAXNDX; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     Rexec
     <>exec
     ANDexec;  AND NOS with TOS
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $000E; Branch Offset
     	DUPexec; Duplicate TOS
     	VarMINSMPL; Push Var Addr onto TOS
     	!exec; Store NOS to Addr in TOS
     	Rexec
     	VarMINNDX; Push Var Addr onto TOS
     	!exec; Store NOS to Addr in TOS
     ENDIF
     R>exec
     2DROPexec; Remove TOS and NOS
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
REJECT-OUTLYERexec:
4AA1 COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     VarMAXSMPL; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $7FFF; Literal Value
     VarMINSMPL; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     VarMAXNDX; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     VarMINNDX; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     Var#OUTLYERS; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     0>exec ;Destructive Test of TOS for >0
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $007A; Branch Offset
     	VarNDXlimit; Push Var Addr onto TOS
     	@exec; Push Data Contained in TOS Addr to TOS for Loop Limit
     	Const0;  Push $0000 onto TOS for Loop Index
     	(DO)exec
     		VarS/RQUE; Push Var Addr onto TOS
    		)exec
     		+exec; Add NOS To TOS
     		@exec; Push Data Contained in TOS Addr to TOS
     		DUPexec; Duplicate TOS
     		0>=exec
     		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     		$000A; Branch Offset
     			)exec
     			CHK-MIN/MAXexec
     			BRANCHexec
     			$0004
     		ENDIF
     		DROPexec; Delete TOS
     		Const2;  Push $0002 onto TOS for Loop Increment
     	(+LOOP)exec
     	$FFE2
     	VarMAXNDX; Push Var Addr onto TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	DUPexec; Duplicate TOS
     	0>=exec
     	OVERexec; Duplicate NOS at TOS
     	VarNDXlimit; Push Var Addr onto TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	<exec
     	ANDexec;  AND NOS with TOS
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0012; Branch Offset
     		VarS/RQUE; Push Var Addr onto TOS
     		+exec; Add NOS To TOS
     		LITexec; Put value that follows on TOS
     		$FFFF; Literal Value
     		SWAPexec; Swap TOS with NOS
     		!exec; Store NOS to Addr in TOS
     		BRANCHexec
     		$0004
     	ENDIF
     	DROPexec; Delete TOS
     	VarMINNDX; Push Var Addr onto TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	DUPexec; Duplicate TOS
     	0>=exec
     	OVERexec; Duplicate NOS at TOS
     	VarNDXlimit; Push Var Addr onto TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	<exec
     	ANDexec;  AND NOS with TOS
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0012; Branch Offset
     		VarS/RQUE; Push Var Addr onto TOS
     		+exec; Add NOS To TOS
     		LITexec; Put value that follows on TOS
     		$FFFE; Literal Value
     		SWAPexec; Swap TOS with NOS
     		!exec; Store NOS to Addr in TOS
     		BRANCHexec
     		$0004
     	ENDIF
     	DROPexec; Delete TOS
     ENDIF
     ;Sexec

;;; : REJECT-OUTLYERS #OUTLYERS @ 0 DO REJECT-OUTLYER LOOP ;
4B45
     $8F; Code
     "REJECT-OUTLYERS"; Name
     $4A90; Backward Link
     COLON; Complile The Following Section
     Var#OUTLYERS; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS for Loop Limit
     Const0;  Push $0000 onto TOS for Loop Index
     (DO)exec
     	REJECT-OUTLYERexec
     (LOOP)exec
     $FFFC
     ;Sexec

;;; ( AVERAGE RATIO CALCULATION                    06:29 10/24/89 ) 

;;; 0 VARIABLE %DIF 
4B69
     $84; Code
     "%DIF"; Name
     $4B45; Backward Link
Var%DIF:
4B70 GetVar
     $11D2

;;; 0 VARIABLE S/Rjst
4B74
     $86; Code
     "S/Rjst"; Name
     $4B69; Backward Link
VarS/Rjst:
4B7D GetVar
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
     COLON; Complile The Following Section
     VarAVE[S/R]; Push Var Addr onto TOS
     2@exec
     LITexec; Put value that follows on TOS
     $0F24; Literal Value
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     VarSIG[Ave]; Push Var Addr onto TOS
     2@exec
     LITexec; Put value that follows on TOS
     $0F2E; Literal Value
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     VarREF[Ave]; Push Var Addr onto TOS
     2@exec
     LITexec; Put value that follows on TOS
     $0F38; Literal Value
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     VarSIG[Ave]/REF[Ave]; Push Var Addr onto TOS
     2@exec
     LITexec; Put value that follows on TOS
     $0F42; Literal Value
     2!exec; Store NOS and 2nd NOS to Addr in TOS
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
     COLON; Complile The Following Section
     VarGAINexp; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     MINUSexec
     VarAVE[S/R]; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     EXITexec
     Const0;  Push $0000 onto TOS
     LITexec; Put value that follows on TOS
     $0F24; Literal Value
     @exec; Push Data Contained in TOS Addr to TOS
     Const0;  Push $0000 onto TOS
     D+exec
     Const2;  Push $0002 onto TOS
     D/exec
     Const0;  Push $0000 onto TOS
     VarS/Rjst; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $000A; Literal Value for Loop Limit
     Const0;  Push $0000 onto TOS for Loop Index
     (DO)exec
     	2DUPexec; Duplicate TOS/NOS
     	LITexec; Put value that follows on TOS
     	$7FFF; Literal Value
     	LITexec; Put value that follows on TOS
     	$0000; Literal Value
     	D>exec
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0012; Branch Offset
     		Const1;  Push $0001 onto TOS
     		VarS/Rjst; Push Var Addr onto TOS
     		+!exec; Add NOS to Addr in TOS
     		LITexec; Put value that follows on TOS
     		$000A; Literal Value
     		D/exec
     		BRANCHexec
     		$0004
    	 ENDIF
     	LEAVEexec
     (LOOP)exec
     $FFDC
     DROPexec; Delete TOS
     VarGAINexp; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     VarS/Rjst; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     +exec; Add NOS To TOS
     MINUSexec
     SWAPexec; Swap TOS with NOS
     ;Sexec

;;; : ?DATA-STABLE ( -- f     Difference < 5%? of AVE or .0015 ABS)
	AVE[S/R] @ [ AVE[S/R] 4 + ] LITERAL @ 2DUP + 2/ >R
	- ABS DUP 15 < SWAP 10000 R> */ DUP %DIF ! 500 < OR ;
4C28
     $8C; Code
     "?DATA-STABLE"; Name
     $4BB8; Backward Link
     COLON; Complile The Following Section
     VarAVE[S/R]; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     LITexec; Put value that follows on TOS
     $0F24; Literal Value
     @exec; Push Data Contained in TOS Addr to TOS
     2DUPexec; Duplicate TOS/NOS
     +exec; Add NOS To TOS
     2/exec
     >Rexec
     -exec:	; Subtract TOS From NOS
     ABSexec
     DUPexec; Duplicate TOS
     LITexec; Put value that follows on TOS
     $000F; Literal Value
     <exec
     SWAPexec; Swap TOS with NOS
     LITexec; Put value that follows on TOS
     $2710; Literal Value
     R>exec
     */exec
     DUPexec; Duplicate TOS
     Var%DIF; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $01F4; Literal Value
     <exec
     ORexec;  OR NOS with TOS
     ;Sexec

;;; 0 VARIABLE SIGok
4C71
     $85; code
     "SIGok"; Name
     $4C28; Backward Link
VarSIGok:
4C79 GetVar
     $11D6

;;; 0 VARIABLE REFok
4C7D
     $85; Code
     "REFok"; Name
     $4C71; Backward Link
VarREFok:
4C85 GetVar
     $11D8

;;; 0 VARIABLE #BADPNTS
4C89
     $88; Code
     "#BADPNTS"; Name
     $4C7D; Backward Link
Var#BADPNTS:
4C94 GetVar
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
AVE-DATAexec:
4CA3 COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     Var#BADPNTS; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     VarNDXlimit; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS for Loop Limit
     Const0;  Push $0000 onto TOS for Loop Index
     (DO)exec
     	VarS/RQUE; Push Var Addr onto TOS
     	)exec
     	+exec; Add NOS To TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	DUPexec; Duplicate TOS
     	0<exec ;Destructive Test of TOS for <0
     	0=exec
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0090; Branch Offset
     		VarSIGQUE; Push Var Addr onto TOS
     		)exec
     		+exec; Add NOS To TOS
     		@exec; Push Data Contained in TOS Addr to TOS
     		DUPexec; Duplicate TOS
     		VarSIG[Offset]; Push Var Addr onto TOS
     		@exec; Push Data Contained in TOS Addr to TOS
     		+exec; Add NOS To TOS
     		LITexec; Put value that follows on TOS
     		$0FF5; Literal Value
     		>exec
     		DUPexec; Duplicate TOS
     		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     		$0008; Branch Offset
	     		Const0;  Push $0000 onto TOS
     			VarSIGok; Push Var Addr onto TOS
     			!exec; Store NOS to Addr in TOS
     		ENDIF
     		VarREFQUE; Push Var Addr onto TOS
     		)exec
     		+exec; Add NOS To TOS
     		@exec; Push Data Contained in TOS Addr to TOS
     		LITexec; Put value that follows on TOS
     		$0FF5; Literal Value
     		OVERexec; Duplicate NOS at TOS
     		<exec
     		OVERexec; Duplicate NOS at TOS
     		LITexec; Put value that follows on TOS
     		$03E8; Literal Value
     		<exec
     		ORexec;  OR NOS with TOS
     		DUPexec; Duplicate TOS
     		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     		$0008; Branch Offset
     			Const0;  Push $0000 onto TOS
     			VarREFok; Push Var Addr onto TOS
     			!exec; Store NOS to Addr in TOS
     		ENDIF
     		ROTexec
     		ORexec;  OR NOS with TOS
     		0=exec
     		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     		$0022; Branch Offset
     			Const0;  Push $0000 onto TOS
     			VarREF[Ave]; Push Var Addr onto TOS
     			2@exec
     			D+exec
     			VarREF[Ave]; Push Var Addr onto TOS
     			2!exec; Store NOS and 2nd NOS to Addr in TOS
     			Const0;  Push $0000 onto TOS
     			VarSIG[Ave]; Push Var Addr onto TOS
     			2@exec
     			D+exec
     			VarSIG[Ave]; Push Var Addr onto TOS
     			2!exec; Store NOS and 2nd NOS to Addr in TOS
     			Const0;  Push $0000 onto TOS
     			D+exec
     			BRANCHexec
     			$001A
     		ENDIF
     		2DROPexec; Remove TOS and NOS
     		DROPexec; Delete TOS
     		LITexec; Put value that follows on TOS
     		$FFFD; Literal Value
     		VarS/RQUE; Push Var Addr onto TOS
     		)exec
     		+exec; Add NOS To TOS
     		!exec; Store NOS to Addr in TOS
     		LITexec; Put value that follows on TOS
     		$FFFF; Literal Value
     		Var#BADPNTS; Push Var Addr onto TOS
     		+!exec; Add NOS to Addr in TOS
     		BRANCHexec
     		$0004
     	ENDIF
     	DROPexec; Delete TOS
     	Const2;  Push $0002 onto TOS
     (+LOOP)exec
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
     COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     VarSIG[Ave]; Push Var Addr onto TOS
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     VarREF[Ave]; Push Var Addr onto TOS
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     VarSIGok; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     VarREFok; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     AVE-DATAexec
     Var#SMPLS; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     Var#BADPNTS; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     +exec; Add NOS To TOS
     Const1;  Push $0001 onto TOS
     MAXexec
     DUPexec; Duplicate TOS
     >Rexec
     /RNDexec
     DUPexec; Duplicate TOS 
     VarAVE[S/R]; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $2710; Literal Value
     VarSIG[Ave]; Push Var Addr onto TOS
     2@exec
     Rexec
     /RNDexec
     DUPexec; Duplicate TOS
     VarSIG[Ave]; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     VarREF[Ave]; Push Var Addr onto TOS
     2@exec
     R>exec
     /RNDexec
     DUPexec; Duplicate TOS
     VarREF[Ave]; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     */exec
     DUPexec; Duplicate TOS
     0<exec ;Destructive Test of TOS for <0
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0008; Branch Offset
     	DROPexec; Delete TOS
     	LITexec; Put value that follows on TOS
     	$7D00; Literal Value
     ENDIF
     VarSIG[Ave]/REF[Ave]; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     Var#SMPLS; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     Var#BADPNTS; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     ABSexec
     Const1;  Push $0001 onto TOS
     MAXexec
     /exec
     Const1;  Push $0001 onto TOS
     >exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0012; Branch Offset
     	LITexec; Put value that follows on TOS
     	$FFFF; Literal Value
     	VarSIGok; Push Var Addr onto TOS
     	!exec; Store NOS to Addr in TOS
     	LITexec; Put value that follows on TOS
     	$FFFF; Literal Value
     	VarREFok; Push Var Addr onto TOS
     	!exec; Store NOS to Addr in TOS
     ENDIF
     ;Sexec

;;; ( DATA DISPLAY                                 11:44 05/25/89 )

;;; 0 VARIABLE f-
4E18
    $82; Code
     "f-"; Name
     $4D65; Backward Link
Varf-:
4E1D GetVar
     $11DC; Var Addr

;;; 0 VARIABLE DTALINE
4E21
     $87; Code
     "DTALINE"; Name
     $4E18; Backward Link
VarDTALINE:
4E2B GetVar
     $11DE; Var Addr

;;; : TYPEdata DUP 0< MINUS f- ! ABS 0 <# #S #> 6 OVER - f- @ +
;;;	0 DO 32 EMIT LOOP f- @ IF 45 ( -) EMIT ENDIF TYPE ;
4E2F
     $88; Code
     "TYPEdata"; Name
     $4E21; Backward Link
4E3A COLON; Complile The Following Section
TYPEdataexec:
     DUPexec; Duplicate TOS
     0<exec ;Destructive Test of TOS for <0
     MINUSexec
     Varf-; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     ABSexec
     Const0;  Push $0000 onto TOS
     <#exec
     #Sexec
     #>exec
     LITexec; Put value that follows on TOS
     $0006; Literal Value
     OVERexec; Duplicate NOS at TOS
     -exec; Subtract TOS From NOS
     Varf-; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     +exec; Add NOS To TOS for Loop Limit
     Const0;  Push $0000 onto TOS for Loop Index
     (DO)exec
     	LITexec; Put value that follows on TOS
     	$0020; Literal Value
     	EMITexec
     (LOOP)exec
     $FFF8
     Varf-; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0008; Branch Offset
     	LITexec; Put value that follows on TOS
     	$002D; Literal Value
     	EMITexec
     ENDIF
     TYPEexec
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
DISPLAY-QUESexec:
4E8D COLON; Complile The Following Section
     VarNDXlimit; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS for Loop Limit
     Const0;  Push $0000 onto TOS for Loop Index
     (DO)exec
     	CRexec
     	CRexec
     	$."exec;  Print Literal String
     	$04	; Number of Chars in print String
     	"Sig "
     	)exec
     	LITexec; Put value that follows on TOS
     	$0014; Literal Value
     	+exec; Add NOS To TOS
     	VarNDXlimit; Push Var Addr onto TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	MINexec
     	)exec
     	(DO)exec
     		VarSIGQUE; Push Var Addr onto TOS
     		)exec
     		+exec; Add NOS To TOS
     		@exec; Push Data Contained in TOS Addr to TOS
     		TYPEdataexec
     		Const2;  Push $0002 onto TOS for Loop Index
     	(+LOOP)exec
     	$FFF2
     	CRexec
     	$."exec;  Print Literal String
     	$04	; Number of Chars in print String
     	"Ref "
     	)exec
     	LITexec; Put value that follows on TOS
     	$0014; Literal Value
     	+exec; Add NOS To TOS
     	VarNDXlimit; Push Var Addr onto TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	MINexec for Loop Limit
     	)exec for Loop Index
     	(DO)exec
     		VarREFQUE; Push Var Addr onto TOS
     		)exec
     		+exec; Add NOS To TOS
     		@exec; Push Data Contained in TOS Addr to TOS
     		TYPEdataexec
     		Const2;  Push $0002 onto TOS
     	(+LOOP)exec
     	$FFF2
    	 CRexec
     	$."exec;  Print Literal String
     	$04	; Number of Chars in print String
     	"S/R "
     	)exec
     	LITexec; Put value that follows on TOS
     	$0014; Literal Value
     	+exec; Add NOS To TOS
     	VarNDXlimit; Push Var Addr onto TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	MINexec for Loop Limit
     	)exec for Loop Index
     	(DO)exec
     		VarS/RQUE; Push Var Addr onto TOS
     		)exec
     		+exec; Add NOS To TOS
     		@exec; Push Data Contained in TOS Addr to TOS
     		TYPEdataexec
     		Const2;  Push $0002 onto TOS
     	(+LOOP)exec
     	$FFF2
     	LITexec; Put value that follows on TOS
     	$0014; Literal Value
     (+LOOP)exec
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
     COLON; Complile The Following Section
     $226A
     @exec; Push Data Contained in TOS Addr to TOS
     0=exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0004; Branch Offset
     	EXITexec
     ENDIF
     DISPLAY-QUESexec
     CRexec
     $."exec;  Print Literal String
     $05	; Number of Chars in print String
     "GAIN="
     VarGAINvlu; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     .exec
     $."exec;  Print Literal String
     $0A	; Number of Chars in print String
     "AVE[S/R]=GT"
     @exec; Push Data Contained in TOS Addr to TOS
     .exec
     $."exec;  Print Literal String
     $07	; Number of Chars in print String
     " %DLTA="
     Var%DIF; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     Const0;  Push $0000 onto TOS
     <#exec
     #exec
     #exec
     LITexec; Put value that follows on TOS
     $002E; Literal Value
     HOLDexec
     #Sexec
     #>exec
     TYPEexec
     $."exec;  Print Literal String
     $0C	; Number of Chars in print String
     VarGAINexp; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     *exec
     $21E6
     +exec; Add NOS To TOS
     @exec; Push Data Contained in TOS Addr to TOS
     .exec
     CRexec
     $."exec;  Print Literal String
     $09	; Number of Chars in print String
     "AVE[Sig]="
     VarSIG[Ave]; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     .exec
     $."exec;  Print Literal String
     "<LF> AVE[Ref]="
     VarREF[Ave]; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     .exec
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
TSTMSGexec:
4FDF COLON; Complile The Following Section
     $2598
     $F4CB
     $F51E
     Const1;  Push $0001 onto TOS
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
STOPexec:
4FF6 COLON; Complile The Following Section
     $26D5
     $F4BC
     $F51E
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     $2201
     !exec; Store NOS to Addr in TOS
     $22BF
     $F142
     BEGIN
     	$F18D
     	UPDATEkeyQexec
     	Const0;  Push $0000 onto TOS
     OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     $FFF8; Branch Offset
     ;Sexec

;;; : PASSED "PASED 6 19 DISPLAY2 wx-TYPE 1000 DELAY[ms] ;
5016
     $86; Code
     "PASSED"; Name
     $4FEF; Backward Link
PASSEDexec:
501F COLON; Complile The Following Section
     $26C0
     LITexec; Put value that follows on TOS
     $0006; Literal Value
     LITexec; Put value that follows on TOS
     $0013; Literal Value
     $F4CB
     $F530
     LITexec; Put value that follows on TOS
     $03E8; Literal Value
     DELAY[ms]exec
     ;Sexec

;;; : FAIL "FAIL 4 21 DISPLAY2 wx-TYPE STOP ;
5037
     $84; Code
     "FAIL"; Name
     ;5016; Backward Link
FAILexec:
503E COLON; Complile The Following Section
     $26AE
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     LITexec; Put value that follows on TOS
     $0015; Literal Value
     $F4CB
     $F530
     STOPexec
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
VarXPNTR:
505A GetVar
     $11E0; Var Addr

;;; 0 VARIABLE Xrd
505E
     $83; Code
     "Xrd"; Name
     $5052; Backward Link
VarXrd:
5064 GetVar
     $11E2; Var Addr

;;; 0 VARIABLE Xwrt
5068 $84; Code
     "Xwrt"; Name
     $505E; Backward Link
VarXwrt:
506F GetVar
     11E4; Var Addr

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
ConstRAMEND:
5111 GetVar
     $2000; Constant value

;;; 0000 CONSTANT RMSTRT
5115
     $86; Code
     "RMSTRT"; Name
     $5109; Backward Link
ConstRMSTRT:
511E GetVar
     $0000

;;; CODE

;;; CLR-RAM
5122
     $87; Code
     "CLR-RAM"
     $5115; Backward Link
CLR-RAMexec:
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
CHKRAMexec:
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
VarfFAIL:
5178 GetVar
     $11E6; Var Addr

;;; : LMPCHK
	16 #PRIMES ! PRIME-LAMP-CONTROL 50 'TrigDly @ ! 0 #LMPERR !
	0. 10 0 DO 'FIRE-TEST @ EXECUTE GET[Ref] 0 D+
	fLMPERR @ IF 1 #LMPERR +! ENDIF LOOP ;
517C
     $86; Code
     "LMPCHK"; Name
     $5170; Backward Link
LMPCHKexec:
5185 COLON; Complile The Following Section
// NumPrimes=$10
     LITexec; Put value that follows on TOS
     $0010; Literal Value
     Var#PRIMES; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
// GOSUB PrimeLampControl
     PRIME-LAMP-CONTROLexec'''
// TrigDly=50???
     LITexec; Put value that follows on TOS
     $0032; Literal Value
     'TrigDlyrefx
     @exec; Push Data Contained in TOS Addr to TOS
     !exec; Store NOS to Addr in TOS
// LampErr=0
     Const0;  Push $0000 onto TOS
     Var#LMPERR; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS

     LITexec; Put value that follows on TOS
     $0000; Literal Value
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     LITexec; Put value that follows on TOS
     $000A; Literal Value for Loop Limit
     Const0;  Push $0000 onto TOS for Loop Index
     (DO)exec
     	$24E0
     	@exec; Push Data Contained in TOS Addr to TOS
     	execECUTEexec
     	GET[Ref]exec
     	Const0;  Push $0000 onto TOS
     	D+exec
     	VarflMPERR; Push Var Addr onto TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0008
     		Const1;  Push $0001 onto TOS
     		Var#LMPERR; Push Var Addr onto TOS
     		+!exec; Add NOS to Addr in TOS
     	ENDIF
     (LOOP)exec
     $FFE4
     ;Sexec

;;; : SELFTEST 0 fABORT ! 0 #LMPERR ! CHK-DSPLS 3 DELAY[sec]
51D1
     $88; Code
     "SELFTEST"; Name
     $517C; Backward Link
     COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     $2227
     !exec; Store NOS to Addr in TOS
     Const0;  Push $0000 onto TOS
     Var#LMPERR; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     $F66B
     Const3;  Push $0003 onto TOS
     $E6A8
     $2572
     $F4BC
     $F51E
     $260E
     $F4CB
     $F51E
     Const2;  Push $0002 onto TOS
     $E6A8
     $2635
     $FACE
     TSTMSGexec
     $23F5
     @exec; Push Data Contained in TOS Addr to TOS
     EXECUTEexec
     1+exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0008; Branch Offset
     	FAILexec
     	BRANCHexec
     	$0004
     ENDIF
     PASSEDexec
     $264E
     $FACE
     TSTMSGexec
     $240B
     @exec; Push Data Contained in TOS Addr to TOS
     EXECUTEexec
     1+exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0008; Branch Offset
     	FAILexec
     	BRANCHexec
     	$0004
     ENDIF
     PASSEDexec
     CLR-RAMexec
     $2666
     $FACE
     TSTMSGexec
     CHKRAMexec
     0=exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0008; Branch Offset
     	FAILexec
     	BRANCHexec
     	$0004
     ENDIF
     PASSEDexec
     $267E
     LITexec; Put value that follows on TOS
     $000A; Literal Value
     TSTMSGexec
     LMPCHKexec
     2DUPexec; Duplicate TOS/NOS
     CRexec
     $."exec;  Print Literal String
     $04	; Number of Chars in print String
     "REF="
     LITexec; Put value that follows on TOS
     $000A; Literal Value
     D/exec
     D.exec
     LITexec; Put value that follows on TOS
     $03E8; Literal Value
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     D<exec
     Var#LMPERR; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     DUPexec; Duplicate TOS
     $."exec;  Print Literal String
     $0E	; Number of Chars in print String
     "LAMP FAILURES="
     .exec
     LITexec; Put value that follows on TOS
     $0005; Literal Value
     >exec
     ORexec;  OR NOS with TOS
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $0008; Branch Offset
     	FAILexec
     	BRANCHexec
     	$0004
     ENDIF
     PASSEDexec
     ;Sexec

;;; :FXCLOCK
52A2
     $87; Code
     "FXCLOCK"; Name
     $51D1; Backward Link
     COLON; Complile The Following Section
     ;Sexec

;;; 6010 CONSTANT DTAREQI/O
52B0
     $89; Code
     "DTAREQI/O"; Name
     $52A2; Backward Link
ConstDTAREQI/O:
52BC GetVar; Processing Routine
     $6010; Constant value

;;; 6011 CONSTANT DTAREGI/O
52C0
     $89; CODE
     "DTAREGI/O"; Name
     $52B0; Backward Link
ConstDTAREGI/O:
52CC GetVar; Processing Routine
     $6011; Constant value

;;; 00 CONSTANT RTCsec
52D0
     $86; CODE
     "RTCsec"; Name
     $52C0; Backward Link
ConstRTCsec:
52D9 GetVar; Processing Routine
     $0000; Constant value

;;; 02 CONSTANT RTCmin
52DD
     $86; CODE
     "RTCmin"; Name
     $52D0; Backward Link
ConstRTCmin:
52E6 GetVar; Processing Routine
     $0002; Constant value

;;; 04 CONSTANT RTChrs
52EA
     $86; CODE
     "RTChrs"; Name
     $52DD; Backward Link
ConstRTChrs:
52F3 GetVar; Processing Routine
     $0004; Constant value

;;; 07 CONSTANT RTCday
52F7
     $86; CODE
     "RTCday"; Name
     $52EA; Backward Link
ConstRTCday:
5300 GetVar; Processing Routine
     $0007; Constant value

;;; 08 CONSTANT RTCmonth
5304
     $86; CODE
     "RTCmonth"; Name
     $52F7; Backward Link
ConstRTCmonth:
530F GetVar; Processing Routine
     $0008; Constant value

;;; 09 CONSTANT RTCyr
5313
     $85; CODE
     "RTCyr"; Name
     $5304; Backward Link
ConstRTCyr:
531B GetVar; Processing Routine
     $0009; Constant value

;;; 0A CONSTANT UIPreg
531F
     $86; CODE
     "UIPreg"; Name
     $5313; Backward Link
ConstUIPreg:
5328 GetVar; Processing Routine
     $000A; Constant value

;;; 80 CONSTANT UIPbit
532C
     $86; CODE
     "UIPbit"; Name
     $531F; Backward Link
ConstUIPbit
5335 GetVar; Processing Routine
     $0080; Constant value

;;; 0B CONSTANT CLKset
5339
     $86; CODE
     "CLKset"; Name
     $532C; Backward Link
Const
5342 GetVar; Processing Routine
     $000B; Constant value

;;; 80 CONSTANT SETbit
5346
     $86; CODE
     "SETbit"; Name
     $5339; Backward Link
ConstSETbitrefx:
534F GetVar; Processing Routine
     $0080; Constant value

;;; 0A CONSTANT REGA
5353
     $84; CODE
     "REGA"; Name
     $5346; Backward Link
ConstREGArefx:
535A GetVar; Processing Routine
     $000A; Constant value

;;; 0B CONSTANT REGB
535E
     $84; CODE
     "REGB"; Name
     $5353; Backward Link
ConstREGB:
5365 GetVar; Processing Routine
     $000B; Constant value

;;; 0C CONSTANT REGC
5369
     $84; CODE
     "REGC"; Name
     $535E; Backward Link
ConstREGCrefx:
5370 GetVar; Processing Routine
     $000C; Constant value

;;; 0D CONSTANT REGD
5374
     $84; CODE
     "REGD"; Name
     $5369; Backward Link
ConstREGD:
537B GetVar; Processing Routine
     $000D; Constant value

;;; 23 CONSTANT Ainit
537F
     $85; CODE
     "Ainit"; Name
     $5374; Backward Link
ConstAinit:
5387 GetVar; Processing Routine
     $0023; Constant value

;;; 0C CONSTANT Binit
538B
     $85; CODE
     "Binit"; Name
     $537F; Backward Link
ConstBinit:
5393 GetVar; Processing Routine
     $000C; Constant value

;;; 0E CONSTANT DAY0
5397
     $84; CODE
     "DAY0"; Name
     $538B; Backward Link
ConstDAY0:
539E GetVar; Processing Routine
     $000E; Constant value

;;; 80 CONSTANT VTRbit
53A2
     $86; CODE
     "VTRbit"; Name
     $5397; Backward Link
ConstVTRbit:
53AB GetVar; Processing Routine
     $0080; Constant value

;;; 0F CONSTANT MSBSMPL#
53AF
     $88; CODE
     "MSBSMPL#"; Name
     $53A2; Backward Link
ConstMSBSMPL#:
53BA GetVar; Processing Routine
     $000F; Constant value

;;; 10 CONSTANT LSBSMPL#
53BE
     $88; CODE
     "LSBSMPL#"; Name
     $53AF; Backward Link
ConstLSBSMPL#:
53C9 GetVar; Processing Routine
     $0010; Constant value

;;; 3D CONSTANT RUNDLY#
53CD
     $87; CODE
     "RUNDLY#"; Name
ConstRUNDLY#:
53D7 $53BE; Backward Link
     GetVar; Processing Routine
     $003D; Constant value

;;; 3F CONSTANT TSTBYTE#
53DB
     $88; CODE
     "TSTBYTE#"; Name
     $53CD; Backward Link
ConstTSTBYTE#:
53E6 GetVar; Processing Routine
     $003F; Constant value

;;; DECIMAL

;;; 0 VARIABLE TMPhrs
53EA
     $86; CODE
     "TMPhrs"; Name
     $53DB; Backward Link
VarTMPhrs:
53F3 GetVar; Processing Routine
     $11E8; Var Addr

;;; 0 VARIABLE CLKERRcnt
53F7
     $89; CODE
     "CLKERRcnt"; Name
     $53EA; Backward Link
VarCLKERRcnt:
5403 GetVar; Processing Routine
     $11EA; Var Addr

;;; 0 VARIABLE fPM
5407
     $83; CODE
     "fPM"; Name
     $53F7; Backward Link
VarfPM:
540D GetVar; Processing Routine
     $11EC; Var Addr

;;; ?CLKerr 1 CLKERRcnt +! CLKERRcnt @ 1000 >
       IF CR."CLOCK DATA RDY ERROR" QUIT ENDIF;
5411
     $87; Code
     "?CLKerr"; Name
     $5407; Backward Link
     COLON; Complile The Following Section
     Const1;  Push $0001 onto TOS
     VarCLKERRcnt; Push Var Addr onto TOS
     +!exec; Add NOS to Addr in TOS
     VarCLKERRcnt; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     LITexec; Put value that follows on TOS
     $03E8; Literal Value
     >exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $001D; Branch Offset; *** check this offset ***
     	CRexec
     	$."exec;  Print Literal String
     	$14	; Number of Chars in print String
     	"CLOCK DATA RDY ERROR"
     ENDIF
     QUITexec
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
!CLKDTAexec:
5471 $5473

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
@CLKDTAexec:
548D $548F

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
     COLON; Complile The Following Section
     TSTBYTE#exec
     @CLKDTAexec
     ;Sexec

;;; : !TSTBYTE ( n--) TSTBYTE# !CLKDTA ;
54B4
     $88; Code
     "!TSTBYTE"; Name
     $54A1; Backward Link
     COLON; Complile The Following Section
     TSTBYTE#exec
     !CLKDTAexec
     ;Sexec
     $87

;;; : @RUNDLY ( --n) RUNDLY# @CLKDTA 256 * RUNDLY# 1+ @CLKDTA OR ;
54C7
     $87; Code
     "@RUNDLY"; Name
     $54B4; Backward Link
     COLON; Complile The Following Section
     RUNDLY#exec
     @CLKDTAexec
     LITexec; Put value that follows on TOS
     $0100; Literal Value
     *exec
     RUNDLY#exec
     1+exec
     @CLKDTAexec
     ORexec;  OR NOS with TOS
     ;Sexec

;;; : !RUNDLY ( n--) DUP 256 / RUNDLY# !CLKDTA RUNDLY# 1+ !CLKDTA ;
54E7
     $87; Code
     "!RUNDLY"; Name
     $57C7; Backward Link
     COLON; Complile The Following Section
     DUPexec; Duplicate TOS
     LITexec; Put value that follows on TOS
     $0100; Literal Value
     /exec
     RUNDLY#exec
     !CLKDTAexec
     RUNDLY#exec
     1+exec
     !CLKDTAexec
     ;Sexec

;;; ( STOP/START CLOCK FOR RESET

;;; CODE

;; STOPCLK
5507
     $87; Code
     "STOPCLK"; Name
     $54E7; Backward Link
STOPCLKexec:
5511 $5513

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
STRTCLKexec:
5533 $5535       

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
@SMPL#exec:
5554 COLON; Complile The Following Section
     $53BA
     @CLKDTAexec
     LITexec; Put value that follows on TOS
     $0100; Literal Value
     *exec
     $53C9
     @CLKDTAexec
     ORexec;  OR NOS with TOS
     ;Sexec

;;; : !SMPL# ( n--) 256 /MOD MSBSMPL# !CLKDTA LSBSMPL#
5568
     $86; Code
     "!SMPL#"; Name
     $554B; Backward Link
!SMPL#refx:
5571 COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $0100; Literal Value
     /MODexec
     $53BA
     !CLKDTAexec
     $53C9
     !CLKDTAexec
     ;Sexec

;;; : +!SMPL# ( n --) @SMPL# + !SMPL# ;
5583
     $87; Code
     "+!SMPL#"; Name
     $5568; Backward Link
+!SMPL#exec:
558D COLON; Complile The Following Section
     @SMPL#exec
     +exec; Add NOS To TOS
     !SMPL#refx
     ;Sexec

;;; : CNVRTdate ( --adr,cnt) RTCmonth @CLKDTA 0 100 D* 
	RTCday @CLKDTA 0 D+ 100 D* RTCyr  @CLKDTA 0 D+
5597
     $89; Code
     "CNVRTdate"; Name
     $5583; Backward Link
CNVRTdateexec:
55A3 COLON; Complile The Following Section
     Constmonth
     @CLKDTAexec
     Const0;  Push $0000 onto TOS
     LITexec; Put value that follows on TOS
     $0064; Literal Value
     D*exec
     ConstRTCday
     @CLKDTAexec
     Const0;  Push $0000 onto TOS
     D+exec
     LITexec; Put value that follows on TOS
     $0064
     D*exec
     ConstRTCyr
     @CLKDTAexec
     Const0;  Push $0000 onto TOS
     D+exec
     <#exec
     #exec
     #exec
     LITexec; Put value that follows on TOS
     $002F; Literal Value
     HOLDexec
     #exec
     #exec
     LITexec; Put value that follows on TOS
     $002F; Literal Value
     HOLDexec
     #Sexec
     #>exec
     ;Sexec

;;; : CNVRTtime ( --adr,cnt) RTChrs @CLKDTA DUP 127 > fPM !
	127 AND 0 100 D* RTCmin @CLKDTA 0 D+ 100 D*
	RTCsec @CLKDTA 0 D+ <# # # 58 HOLD # # 58 HOLD #S #> ;
55E3
     $89; Code
     "CNVRTtime"; Name
     $5597; Backward Link
CNVRTtimeexec:
55EF COLON; Complile The Following Section
     ConstRTChrs
     @CLKDTAexec
     DUPexec; Duplicate TOS
     LITexec; Put value that follows on TOS
     $007F; Literal Value
     >exec
     VarfPM; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $007F; Literal Value
     ANDexec;  AND NOS with TOS
     Const0;  Push $0000 onto TOS
     LITexec; Put value that follows on TOS
     $0064; Literal Value
     D*exec
     ConstRTCmin
     @CLKDTAexec
     Const0;  Push $0000 onto TOS
     D+exec
     LITexec; Put value that follows on TOS
     $0064; Literal Value
     D*exec
     ConstRTCsec
     @CLKDTAexec
     Const0;  Push $0000 onto TOS
     D+exec
     <#exec
     #exec
     #exec
     LITexec; Put value that follows on TOS
     $003A; Literal Value
     HOLDexec
     #exec
     #exec
     LITexec; Put value that follows on TOS
     $003A; Literal Value
     HOLDexec
     #Sexec
     #>exec
     ;Sexec

;;; : !CLKBUFx ( c,x-- char saved in CLKBUF at x) CLKBUF + 1- C! ;
5641
     $88
     "!CLKBUFx"; Name
     $55E3; Backward Link
     COLON; Complile The Following Section
     $2234
     +exec; Add NOS To TOS
     1-exec; Subtract 1 from TOS (DEC TOS)
     C!exec;  Store NOS (Char)  to Addr in TOS
     ;Sexec

;;; :GET-SMPL# RTCday @CLKDTA DAY0 @CLKDTA OVER DAY0 !CLKDTA <>
       IF 1 !SMPL# ELSE 1 +!SMPL# ENDIF @SMPL#
5658
     $89; Code
     "GET-SMPL#"; Name
     $5641; Backward Link
     COLON; Complile The Following Section
     ConstRTCday
     @CLKDTAexec
     DAY0refx
     @CLKDTAexec
     OVERexec; Duplicate NOS at TOS
     DAY0refx
     !CLKDTAexec
     <>exec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $000A; Branch Offset
     	Const1;  Push $0001 onto TOS
     	!SMPL#refx
     	BRANCHexec
     	$0006
     ENDIF
     Const1;  Push $0001 onto TOS
     +!SMPL#exec
     @SMPL#exec
     ;Sexec     

;;; : CLKTST STRTCLK
	BEGIN CR ." [" CNVRTdate TYPE ."  " CNVRTtime TYPE ." ] "
	14 10 DO 32 EMIT I @CLKDTA 0 HEX <# # # #> DECIMAL TYPE ." H"
	LOOP ?TERMINAL DUP IF DROP KEY 27 = ENDIF UNTIL ;
568A
     $86; Code
     "CLKTST"; Name
     $5658; Backward Link
     COLON; Complile The Following Section
     BEGIN
     	STRTCLKexec
     	CRexec
     	$."exec;  Print Literal String
     	$01	; Number of Chars in print String
     	"["
     	CNVRTdateexec
     	TYPEexec
     	$."exec;  Print Literal String
     	$01	; Number of Chars in print String
     	" "
     	CNVRTtimeexec
     	TYPEexec
     	$."exec;  Print Literal String
     	$02	; Number of Chars in print String
     	"] "
     	LITexec; Put value that follows on TOS
     	$000E; Literal Value
     	LITexec; Put value that follows on TOS for Loop Limit
     	$000A; Literal Value for Loop Index
     	(DO)exec
     		LITexec; Put value that follows on TOS
     		$0020; Literal Value
     		EMITexec
     		)exec
     		@CLKDTAexec
     		Const0;  Push $0000 onto TOS
     		HEXexec
     		<#exec
     		#exec
     		#exec
     		#>exec
     		DECIMALexec
     		TYPEexec
     		$."exec;  Print Literal String
     		$01	; Number of Chars in print String
     		"H"
     	(LOOP)exec
     	$FFE0
     	TERMINALexec
     	DUPexec; Duplicate TOS
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$000C; Branch Offset
     		DROPexec; Delete TOS
     		KEYexec
     		LITexec; Put value that follows on TOS
     		$001B; Literal Value
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
CLR-NUMBERexec:
56FF COLON; Complile The Following Section
     $F27B
     $F21D
     1+exec
     $F23B
     !exec; Store NOS to Addr in TOS
     $F4DD
     @exec; Push Data Contained in TOS Addr to TOS
     1+exec
     VarMINx; Push Var Addr onto TOS for Loop Limit
     @exec; Push Data Contained in TOS Addr to TOS for Loop Index
     (DO)exec
     	LITexec; Put value that follows on TOS
     	$0020; Literal Value
     	)exec
     	$F4CB
     	$F554
     (LOOP)exec
     $FFF4
     VarMINx; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     $F4DD
     !exec; Store NOS to Addr in TOS
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
get[num]exec:
573A COLON; Complile The Following Section
     BEGIN
     	$F4DD
     	@exec; Push Data Contained in TOS Addr to TOS
     	VarMAXx; Push Var Addr onto TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	>exec
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$000E; Branch Offset
     		Const0;  Push $0000 onto TOS
     		$F23B
     		!exec; Store NOS to Addr in TOS
     		Const0;  Push $0000 onto TOS
     		VarfDP; Push Var Addr onto TOS
     		!exec; Store NOS to Addr in TOS
     		BEGIN
     			$F912
     		OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     		$FFFC; Branch Offset
     	ENDIF
     	PCkeyexec
     	LITexec; Put value that follows on TOS
     	$002F; Literal Value
     	OVERexec; Duplicate NOS at TOS
     	<exec
     	OVERexec; Duplicate NOS at TOS
     	LITexec; Put value that follows on TOS
     	$003A; Literal Value
     	<exec
     	ANDexec;  AND NOS with TOS
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0038; Branch Offset
     		$F23B
     		@exec; Push Data Contained in TOS Addr to TOS
     		0=exec
     		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     		$0004; Branch Offset
     			CLR-NUMBERexec
     		ENDIF
     		DUPexec; Duplicate TOS
     		$F4DD
     		@exec; Push Data Contained in TOS Addr to TOS
     		$F4CB
     		$F554
     		Const1;  Push $0001 onto TOS
     		$F4DD
     		+!exec; Add NOS to Addr in TOS
     		LITexec; Put value that follows on TOS
     		$005F; Literal Value
     		$F4DD
     		@exec; Push Data Contained in TOS Addr to TOS
     		$F4CB
     		$F554
     		DUPexec; Duplicate TOS
     		$F23B
     		@exec; Push Data Contained in TOS Addr to TOS
     		C!exec;  Store NOS (Char)  to Addr in TOS
     		Const1;  Push $0001 onto TOS
     		$F23B
     		+!exec; Add NOS to Addr in TOS
     	ENDIF
     	$F4DD
     	@exec; Push Data Contained in TOS Addr to TOS
     	VarMAXx; Push Var Addr onto TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	>exec
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$000E; Branch Offset
     		LITexec; Put value that follows on TOS
     		$0020; Literal Value
     		$F4DD
     		@exec; Push Data Contained in TOS Addr to TOS
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
SET-INITVLUexec:
57DC COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     VarINITVLU; Push Var Addr onto TOS
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     Const0;  Push $0000 onto TOS
     VarINITVLU; Push Var Addr onto TOS
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     +exec; Add NOS To TOS
     !exec; Store NOS to Addr in TOS
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
GET[num]exec:
57FD COLON; Complile The Following Section
     $F27B
     Const0;  Push $0000 onto TOS
     VarfDP; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     Const0;  Push $0000 onto TOS
     Varf+/-#; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     Const0;  Push $0000 onto TOS
     VarF#SGN; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     VarINITVLU; Push Var Addr onto TOS
     2@exec
     VarINITVLU; Push Var Addr onto TOS
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     +exec; Add NOS To TOS
     @exec; Push Data Contained in TOS Addr to TOS
     F#CNVRTexec
     2DUPexec; Duplicate TOS/NOS
     $F21D
     1+exec
     SWAPexec; Swap TOS with NOS
     CMOVEexec
     VarMINx; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     $F4CB
     $F530
     VarMINx; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     1+exec
     VarMAXx; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     VarMAXx; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     1+exec
     $F4DD
     !exec; Store NOS to Addr in TOS
     get[num]exec
     $F21D
     NUMBERexec
     2DUPexec; Duplicate TOS/NOS
     VarINITVLU; Push Var Addr onto TOS
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     DROPexec; Delete TOS
     >Rexec
     DPLexec
     @exec; Push Data Contained in TOS Addr to TOS
     Const0;  Push $0000 onto TOS
     MAXexec
     MINUSexec
     VarINITVLU; Push Var Addr onto TOS
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     +exec; Add NOS To TOS
     !exec; Store NOS to Addr in TOS
     R>exec
     ;Sexec

;;; 0 VARIABLE SEC0
5871
     $84; Code
     "SEC0"; Name
     $57F2; Backward Link
VarSEC0:
5878 GetVar
     $11EE

;;; :DaTmDSPLY (--) STOPCLK ...
587C
     $89; CODE
     "DaTmDSPLY"; Name
     $5871; Backward Link
DaTmDSPLYexec:
5888 COLON; Complile The Following Section
     STOPCLKexec
     CNVRTdateexec
     LITexec; Put value that follows on TOS
     $0006; Literal Value
     LITexec; Put value that follows on TOS
     $0008; Literal Value
     $F4BC
     $F56E
     CNVRTtimeexec
     LITexec; Put value that follows on TOS
     $0011; Literal Value
     LITexec; Put value that follows on TOS
     $0008; Literal Value
     $F4BC
     $F56E
     STRTCLKexec
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
?F3KEYexec:
58B5 COLON; Complile The Following Section
     BEGIN
     	DaTmDSPLYexec
     	ConstRTCsec
     	@CLKDTAexec
     	VarSEC0; Push Var Addr onto TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	OVERexec; Duplicate NOS at TOS
     	VarSEC0; Push Var Addr onto TOS
     	!exec; Store NOS to Addr in TOS
     	<>exec
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0004; Branch Offset
     		DaTmDSPLYexec
     	ENDIF
     	$F912
     	DUPexec; Duplicate TOS
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0020; Branch Offset
     		DROPexec; Delete TOS
     		PCkeyexec
     		$F70C
     		OVERexec; Duplicate NOS at TOS
     		=exec
     		OVERexec; Duplicate NOS at TOS
     		$F71E
     		=exec
     		ORexec;  OR NOS with TOS
     		DUPexec; Duplicate TOS
     		0=exec
     		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     		$0006; Branch Offset
     			SWAPexec; Swap TOS with NOS
     			DROPexec; Delete TOS
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
?CHNGtimeexec:
590B COLON; Complile The Following Section
     $2E76
     $F4CB
     $F51E
     ?F3KEYexec
     ;Sexec

;;; : ?PM "AM/PM DISPLAY2 w-TYPE ?F3KEY ;
5917
     $83; Code
     "?PM"; Name
     $58FF; Backward Link
?PMexec:
591D COLON; Complile The Following Section
     $2E9C
     $F4CB
     $F51E
     ?F3KEYexec
     ;Sexec

;;; : ?DaTmOK "DaTm1 DISPLAY1 w-TYPE
5929
     $87; Code
     "?DatmOK"; Name
     $5917; Backward Link
?DaTmOKexec:
5933 COLON; Complile The Following Section
     $2E03
     $F4BC
     $F51E
     $2E50
     $F4CB
     $F51E
     ?F3KEYexec
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
NEWTIMEexec:
594F COLON; Complile The Following Section
     STOPCLKexec
     Const0;  Push $0000 onto TOS
     ConstRTCsec
     !CLKDTAexec
     Const2;  Push $0002 onto TOS
     $F3DB
     $2EEC
     $FACE
     DUPexec; Duplicate TOS
     2+exec
     DUPexec; Duplicate TOS
     VarMINx; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     2+exec
     VarMAXx; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     Const1;  Push $0001 onto TOS
     $F4CB
     $F530
     Const0;  Push $0000 onto TOS
     BEGIN
     	DROPexec; Delete TOS
     	ConstRTChrs
     	@CLKDTAexec
     	LITexec; Put value that follows on TOS
     	$007F; Literal Value
     	ANDexec;  AND NOS with TOS
     	SET-INITVLUexec
     	GET[num]exec
     	DUPexec; Duplicate TOS
     	LITexec; Put value that follows on TOS
     	$000D; Literal Value
     	<exec
     OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     $FFE6; Branch Offset
     VarTMPhrs; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     Const2;  Push $0002 onto TOS
     $F3DB
     $2EFC
     $FACE
     DUPexec; Duplicate TOS
     2+exec
     DUPexec; Duplicate TOS
     VarMINx; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     2+exec
     VarMAXx; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     Const1;  Push $0001 onto TOS
     $F4CB
     $F530
     Const0;  Push $0000 onto TOS
     BEGIN
     	DROPexec; Delete TOS
     	ConstRTCmin
     	@CLKDTAexec
     	SET-INITVLUexec
     	GET[num]exec
     	DUPexec; Duplicate TOS
     	LITexec; Put value that follows on TOS
     	$003C; Literal Value
     	<exec
     OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     $FFEC; Branch Offset; Branch Offset
     ConstRTCmin
     !CLKDTAexec
     ?PMexec
     OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     $000A; Branch Offset
     	LITexec; Put value that follows on TOS
     	$0080; Literal Value
     	BRANCHexec
     	$0004
     ENDIF
     Const0;  Push $0000 onto TOS
     VarTMPhrs; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     +exec; Add NOS To TOS
     ConstRTChrs
     !CLKDTAexec
     STRTCLKexec
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
NEWDATEexec:
59FB COLON; Complile The Following Section
     STOPCLKexec
     Const2;  Push $0002 onto TOS
     $F3DB
     $2EBF
     $FACE
     DUPexec; Duplicate TOS
     2+exec
     DUPexec; Duplicate TOS
     VarMINx; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     1+exec
     VarMAXx; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     Const1;  Push $0001 onto TOS
     $F4CB
     $F530
     ConstRTCmonth
     @CLKDTAexec
     SET-INITVLUexec
     GET[num]exec
     ConstRTCmonth
     !CLKDTAexec
     Const2;  Push $0002 onto TOS
     $F3DB
     $2ECF
     $FACE
     DUPexec; Duplicate TOS
     2+exec
     DUPexec; Duplicate TOS
     VarMINx; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     1+exec
     VarMAXx; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     Const1;  Push $0001 onto TOS
     $F4CB
     $F530
     ConstRTCday
     @CLKDTAexec
     SET-INITVLUexec
     GET[num]exec
     ConstRTCday
     !CLKDTAexec
     Const2;  Push $0002 onto TOS
     $F3DB
     $2EDD
     $FACE
     DUPexec; Duplicate TOS
     2+exec
     DUPexec; Duplicate TOS
     VarMINx; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     1+exec
     VarMAXx; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     Const1;  Push $0001 onto TOS
     $F4CB
     $F530
     ConstRTCyr
     @CLKDTAexec
     SET-INITVLUexec
     GET[num]exec
     ConstRTCyr
     !CLKDTAexec
     STRTCLKexec
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
INIT-RTCexec:
5A8C COLON; Complile The Following Section
     Binitrefx
     SETbitrefx
     ORexec;  OR NOS with TOS
     REGBrefx
     !CLKDTAexec
     Ainitrefx
     REGArefx
     !CLKDTAexec
     REGCrefx
     @CLKDTAexec
     DROPexec; Delete TOS
     Const1;  Push $0001 onto TOS
     !SMPL#refx
     REGDrefx
     @CLKDTAexec 
     DROPexec; Delete TOS 
     STRTCLKexec
     ;Sexec

;;; : ?CLKDTAok REGD @CLKDTA VTRbit AND 0> ;
5AB2
     $89; Code
     "?CLKDTAok"; Name
     $5A81; Backward Link
     COLON; Complile The Following Section
     REGDrefx
     @CLKDTAexec
     VTRbitrefx
     ANDexec;  AND NOS with TOS
     0>exec ;Destructive Test of TOS for >0
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
     COLON; Complile The Following Section
     BEGIN
     	LITEX
     	$FFFF
     	$2201
     	!exec; Store NOS to Addr in TOS
     	STRTCLKexec
     	REGDrefx
     	@CLKDTAexec
     	VTRbitrefx
     	ANDexec;  AND NOS with TOS
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0 
     	$0022; Branch Offset
     		?DaTmOKexec
     		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     		$000A; Branch Offset
     		Const0;  Push $0000 onto TOS
     		$2201
     		!exec; Store NOS to Addr in TOS
     		EXITexec
     		?CHNGtimeexec
     		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     		$0008; Branch Offset
     			NEWTIMEexec
     			BRANCHexec
     			$0004
     		ENDIF
     		NEWDATEexec
     		BRANCHexec
     		$000E
     	INIT-RTCexec
     	$2E2A
     	$F4BC
     	$F51E
     	NEWDATEexec
     	NEWTIMEexec
     	Const0;  Push $0000 onto TOS
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

8000
 DW $13F0, $F0D0, $BE41, $BE4F, $8F44, $0000, $0000, $0000

;; 8000 CONSTANT RAMend
8010
     $86; Code
     "RAMend"; Name
     $5B24; Backward Link
     GetVar
     $8000

;; CkROM8
801D
     $86; Code
     "CkROM8"; Name
     $8010; Backward Link
CkROM8exec:
8026 $8028
8028   L_8028   LDX     #$8000
802B            CLR A
802C            CLR B
802D   L_802D   ADD B   $01,X
802F            ADC A   $00,X
8031            INX  
8032            INX  
8033            CPX     #$0000
8036            BNE     L_802D   
8038            JMP     PUSHD   
803B   L_803B   JMP     L_C034

;; PRNBUF1
803E
     $87; Code
     "PRNBUF1"; Name
     $801D; Backward Link
     GetVar
     $12F0

;;
804C
     $87; Code
     "PRNBUF2"; Name
     $803E; Backward Link
     GetVar
     $131B

;; !PRNBUF1x
805A
     $89; Code
     "!PRNBUF1x"; Name
     $804C; Backward Link
     COLON; Complile The Following Section
     $8048
     +exec
     1-exec; Subtract 1 from TOS (DEC TOS)
     C!exec;  Store NOS (Char)  to Addr in TOS
     ;Sexec

;; CLR-PRNBUF1
8072
     $8B; Code
     "CLR-PRNBUF1"; Name
     $805A; Backward Link
     COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $1318; Literal Value for Loop Limit
     $8048  for Loop Index
     (DO)exec
     	LITexec; Put value that follows on TOS
     	$0020; Literal Value
     	)exec
     	C!exec;  Store NOS (Char)  to Addr in TOS
     (LOOP)exec
     $FFF6
     Const0;  Push $0000 onto TOS
     LITexec; Put value that follows on TOS
     $1318; Literal Value
     C!exec;  Store NOS (Char)  to Addr in TOS
     ;Sexec

;; CLR-PRNBUF2
80A0
     $8B; Code
     "CLR-PRNBUF2"; Name
     $8072; Backward Link
     COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $1343; Literal Value for Loop Limit
     $8056 for Loop Index
     (DO)exec
     	LITexec; Put value that follows on TOS
     	$0020; Literal Value
     	)exec
     	C!exec;  Store NOS (Char)  to Addr in TOS
     (LOOP)exec
     $FFF6
     Const0;  Push $0000 onto TOS
     LITexec; Put value that follows on TOS
     $1343; Literal Value
     C!exec;  Store NOS (Char)  to Addr in TOS
     ;Sexec

;; BOLD
80CE
     $84; Code
     "BOLD"; Name
     $80A0; Backward Link
     COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $001B; Literal Value
     $FED0
     LITexec; Put value that follows on TOS
     $0047; Literal Value
     $FED0
     ;Sexec

;; BIG
80E5
     $83; Code
     "BIG"; Name
     $80CE; Backward Link
     COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $000E; Literal Value
     $FED0
     ;Sexec

;; BIGBOLD
80F5
     $87; Code
     "BIGBOLD"; Name
     $80E5; Backward Link
     COLON; Complile The Following Section
     $80EB
     $80D5
     ;Sexec

;; PNORMAL
8107
     $87; Code
     "PNORMAL"; Name
     $80F5; Backward Link
     COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $001B; Literal Value
     $FED0
     LITexec; Put value that follows on TOS
     $0048; Literal Value
     $FED0
     ;Sexec

;; PRNTRDaT
8121
     $89; Code
     "PRNTRDaTm"; Name
     $8107; Backward Link
     COLON; Complile The Following Section
     $8080
     $5511
     $55A3
     $8048
     SWAPexec
     CMOVEexec
     $55EF
     $8048
     LITexec; Put value that follows on TOS
     $000F; Literal Value
     +exec
     SWAPexec
     2DUPexec; Duplicate TOS/NOS
     +exec
     >Rexec
     CMOVEexec
     $540D
     @exec; Push Data Contained in TOS Addr to TOS
     OBRANCHexec
     $0008
     $2F1B
     BRANCHexec
     $0004
     $2F0D
     $FACE
     R>exec
     SWAPexec
     2DUPexec; Duplicate TOS/NOS
     +exec
     >Rexec
     CMOVEexec
     Const0;  Push $0000 onto TOS
     R>exec
     1+exec
     C!exec;  Store NOS (Char)  to Addr in TOS
     $5533
     ;Sexec

;; PRNanswer
8179
     $89; Code
     "PRNanswer"; Name
     $8121; Backward Link
     COLON; Complile The Following Section
     $22A1
     @exec; Push Data Contained in TOS Addr to TOS
     0=exec
     OBRANCHexec
     $0040
     $3572
     2@exec
     DUPexec; Duplicate TOS
     0<exec ;Destructive Test of TOS for <0
     OBRANCHexec
     $0008
     LITexec; Put value that follows on TOS
     $002D
     $FED0
     DABSexec
     $3572
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     +exec
     @exec; Push Data Contained in TOS Addr to TOS
     $2358
     @exec; Push Data Contained in TOS Addr to TOS
     EXECUTEexec
     $FF17
     $2152
     @exec; Push Data Contained in TOS Addr to TOS
     OBRANCHexec
     $0008
     $3027
     BRANCHexec
     $0004
     $3008
     $FACE
     $FF17
     BRANCHexec
     $0008
     $2BC7
     $FACE
     $FF17
     $FEF9
     ;Sexec

;; PRNCALDATA
81D9
     $8A; Code
     "PRNCALDATE"; Name
     $8179; Backward Link
     COLON; Complile The Following Section
     $80AE
     $2AF3
     $FACE
     $8056
     C!exec;  Store NOS (Char)  to Addr in TOS
     $8056
     COUNTexec
     CMOVEexec
     $218A
     COUNTexec
     DUPexec; Duplicate TOS
     >Rexec
     $8056
     COUNTexec
     2+exec
     DUPexec; Duplicate TOS
     >Rexec
     +exec
     SWAPexec
     CMOVEexec
     R>exec
     R>exec
     +exec
     $8056
     C!exec;  Store NOS (Char)  to Addr in TOS
     $2198
     COUNTexec
     DUPexec; Duplicate TOS
     >Rexec
     $8056
     COUNTexec
     2+exec
     DUPexec; Duplicate TOS
     >Rexec
     +exec
     SWAPexec
     CMOVEexec
     R>exec
     R>exec
     +exec
     $8056
     C!exec;  Store NOS (Char)  to Addr in TOS
     $80D5
     $8056
     COUNTexec
     $FF17
     $FEF9
     $8111
     ;Sexec

;; PRINT-RESULTS
824A
     $8D; code
     "PRINT-RESULTS"; Name
     $81D9; Backward Link
     COLON; Complile The Following Section
     $FBA2
     C@exec
     $FBB3
     ANDexec;  AND NOS with TOS
     OBRANCHexec
     $0004
     EXITexec
     $80AE
     $FEF9
     $80D5
     $2FEC
     $FACE
     $FF17
     $8111
     $23DF
     @exec; Push Data Contained in TOS Addr to TOS
     EXECUTEexec
     Const0;  Push $0000 onto TOS
     <#exec
     #Sexec
     #>exec
     $FF17
     $FEF9
     $24F0
     @exec; Push Data Contained in TOS Addr to TOS
     EXECUTEexec
     $81E6
     $80D5
     $2FAF
     $FACE
     $FF17
     $8111
     $8048
     LITexec; Put value that follows on TOS
     $000A; Literal Value
     $FF17
     $80D5
     $2FC1
     $FACE
     $FF17
     $8111
     $8048
     LITexec; Put value that follows on TOS
     $000F; Literal Value
     +exec
     LITexec; Put value that follows on TOS
     $000B; Literal Value
     $FF17
     $FEF9
     $80D5
     $2FD5
     $FACE
     $FF17
     $8111
     $8185
     $FEF9
     ;Sexec

;; COMNTS
82CE
     $86; Code
     "COMNTS"; Name
     $824A; Backward Link
     COLON; Complile The Following Section
     $80D5
     $3048
     $FACE
     DUPexec; Duplicate TOS
     >Rexec
     $FF17
     $8111
     LITexec; Put value that follows on TOS
     $0028; Literal Value for Loop Limit
     R>exec  for Loop Index
     (DO)exec
    	 LITexec; Put value that follows on TOS
     	$005F; Literal Value
     	$FED0
     (LOOP)exec
     $FFF8
     LITexec; Put value that follows on TOS
     $0006; Literal Value for Loop Limit
     Const0;  Push $0000 onto TOS for Loop Index
     (DO)exec
     	$FEF9
     (LOOP)exec
     $FFFC
     ;Sexec

;; PRN-CALVLUS
8309
     $8B; Code
     "PRN-CALVLUS"; Name
     $82CE; Backward Link
     COLON; Complile The Following Section
     $80AE
     $80D5
     $2F74
     $FACE
     $FF17
     $FEF9
     $8111
     $80AE
     $216E
     2@exec
     DUPexec; Duplicate TOS
     >Rexec
     DABSexec
     $216E
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     +exec
     @exec; Push Data Contained in TOS Addr to TOS
     $34A1
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     MINexec
     $8056
     R>exec
     0<exec ;Destructive Test of TOS for <0
     OBRANCHexec
     $000C
     LITexec; Put value that follows on TOS
     $002D; Literal Value
     OVERexec
     C!exec;  Store NOS (Char)  to Addr in TOS
     1+exec
     SWAPexec
     2DUPexec; Duplicate TOS/NOS
     +exec
     >Rexec
     CMOVEexec
     $2152
     @exec; Push Data Contained in TOS Addr to TOS
     OBRANCHexec
     $0008
     $2CD5
     BRANCHexec
     $0004
     $2CE4
     $FACE
     R>exec
     1+exec
     SWAPexec
     CMOVEexec
     $217C
     2@exec
     DUPexec; Duplicate TOS
     >Rexec
     DABSexec
     2DUPexec; Duplicate TOS/NOS
     +exec
     0=exec
     OBRANCHexec
     $000A
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     BRANCHexec
     $000C
     $217C
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     +exec
     @exec; Push Data Contained in TOS Addr to TOS
     $34A1
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     MINexec
     $8056
     LITexec; Put value that follows on TOS
     $000F; Literal Value
     +exec
     R>exec
     0<exec ;Destructive Test of TOS for <0
     OBRANCHexec
     $000C
     LITexec; Put value that follows on TOS
     $002D; Literal Value
     OVERexec
     C!exec;  Store NOS (Char)  to Addr in TOS
     1+exec
     SWAPexec
     2DUPexec; Duplicate TOS/NOS
     +exec
     >Rexec
     CMOVEexec
     $2152
     @exec; Push Data Contained in TOS Addr to TOS
     OBRANCHexec
     $0008
     $2CD5
     BRANCHexec
     $0004
     $2CE4
     $FACE
     R>exec
     1+exec
     SWAPexec
     CMOVEexec
     $2144
     @exec; Push Data Contained in TOS Addr to TOS
     Const0;  Push $0000 onto TOS
     <#exec
     #Sexec
     #>exec
     $8056
     LITexec; Put value that follows on TOS
     $0019; Literal Value
     +exec
     SWAPexec
     2DUPexec; Duplicate TOS/NOS
     +exec
     >Rexec
     CMOVEexec
     $2F9F
     $FACE
     R>exec
     SWAPexec
     CMOVEexec
     $8056
     $FACE
     $FF17
     $FEF9
     ;Sexec

;; PRINT-CALIB
841B
     $8B; Code
     "PRINT-CALIB"; Name
     $8309; Backward Link
     COLON; Complile The Following Section
     $FEF9
     $80AE
     $80FF
     $2DE8
     $FACE
     $FF17
     $FEF9
     $80D5
     CFAexec
     $24F0
     @exec; Push Data Contained in TOS Addr to TOS
     EXECUTEexec
     $80D5
     $2F2C
     $FACE
     $FF17
     $FEF9
     $80D5
     $2F54
     $FACE
     $FF17
     $FEF9
     $8111
     $8048
     $FACE
     $FF17
     $FEF9
     $8317
     $FEF9
     $FEF9
     $FEF9
     $FEF9
     ;Sexec

;; PRNTHDR
846D
     $87; Code
     "PRNTHDR"; Name
     $841B; Backward Link
     COLON; Complile The Following Section
     $812D
     $8429
     ;Sexec

;; INIT-PRINTER
847F
     $8C; Code
     "INIT-PRINTER"; Name
     $846D; Backward Link
     COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     $FC3D
     !exec; Store NOS to Addr in TOS
     $FC5D
     $FBBE
     $FBDA
     !exec; Store NOS to Addr in TOS
     Const0;  Push $0000 onto TOS
     $FC3D
     !exec; Store NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $0018; Literal Value
     $FED0
     $FEF9
     LITexec; Put value that follows on TOS
     $0014; Literal Value
     DELAY[ms]exec
     $E608
     LITexec; Put value that follows on TOS
     $0028; Literal Value
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     D+exec
     2DUPexec; Duplicate TOS/NOS
     $E608
     D<exec
     $FC07
     @exec; Push Data Contained in TOS Addr to TOS
     $FC17
     @exec; Push Data Contained in TOS Addr to TOS
     =exec
     ORexec;  OR NOS with TOS
     OBRANCHexec
     $FFEC
     2DROPexec; Remove TOS and NOS
     $FEF9
     ;Sexec

;; METHOD
84DC
     $86; Code
     "METHOD"; Name
     $847F; Backward Link
     COLON; Complile The Following Section
     ;Sexec

;; MDELAY
84E9
     $86; Code
     "MDELAY"; Name
     $84DC; Backward Link
MDELAYrefx:
84F2 GetVar
     $0000

;; MUNITS
84F6
     $86; Code
     "MUNITS"; Name
     $84E9; Backward Link
     GetVar
     $0002

;; MFORMAT
8503
      $87; Code
      "MFORMAT"; Name
      $84F6; Backward Link
      GetVar
      $0004

;; HCALVLU
8511
     $87; Code
     "HCALVLU"; Name
     $8503; Backward Link
     GetVar
     $0006

;; LCALVLU
851F
     $87; Code
     "LCALVLU"; Name
     $8511; Backward Link
     GetVar
     $000C

;; MDATE
852D
     $85; Code
     "MDATE"; Name
     $851F; Backward Link
     GetVar
     $0012

;; MCKSUM
8539
     $86; Code
     "MCKSUM"; Name
     $852D; Backward Link
     GetVar
     $001A

 DW $003C, $0000, $0000, $0000, $00F0, $FFFF, $FFFF
 DW $FFF6, $FFFF, $0000, $0000, $0000, $0000, $0000

;; MDEFAULT
8562
     $88; Code
     "MDEFAULT"; Name
     $8539; Backward Link
     GetVar
     $8546

;; @METHODadr
8571
     $8A; Code
     "@METHODadr"; Name
     $8562; Backward Link
@METHODadrexec:
857E COLON; Complile The Following Section
     $20F5
     @exec; Push Data Contained in TOS Addr to TOS
     $20D9
     *exec
     +exec
     $20E7
     +exec
     ;Sexec

;; @MCKSUM
8590
     $87; Code
     "@MCKSUM"; Name
     $8571; Backward Link
     COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     MDELAYrefx
     @METHODadrexec
     DUPexec; Duplicate TOS
     $20D9
     +exec for Loop Limit
     SWAPexec for Loop Index
     (DO)exec
     	)exec
     	@exec; Push Data Contained in TOS Addr to TOS
     	+exec
     	Const2;  Push $0002 onto TOS
     (+LOOP)exec
     $FFF6
     ;Sexec

;; CKSUM-METHOD
85BA
     $8C; Code
     "CKSUM-METHOD"; Name
     $8590; Backward Link
     COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     $8542
     @METHODadrexec
     !exec; Store NOS to Addr in TOS
     $859A
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     XORexec;  XOR NOS with TOS
     $8542
     @METHODadrexec
     !exec; Store NOS to Addr in TOS
     ;Sexec

;; SET-DEFAULTS
85E3
     $8C; Code
     "SET-DEFAULTS"; Name
     $85BA; Backward Link
SET-DEFAULTSexec:
85F2 COLON; Complile The Following Section
     $856D
     $20E7
     $20D9
     $20F5
     @exec; Push Data Contained in TOS Addr to TOS
     *exec
     +exec
     $20D9
     CMOVEexec
     $55A3
     $8535
     @METHODadrexec
     SWAPexec
     CMOVEexec
     $85C9
     $856D
     MDELAYrefx
     +exec
     @exec; Push Data Contained in TOS Addr to TOS
     $2144
     !exec; Store NOS to Addr in TOS
     $856D
     $84FF
     +exec
     @exec; Push Data Contained in TOS Addr to TOS
     $2152
     !exec; Store NOS to Addr in TOS
     $856D
     $850D
     +exec
     @exec; Push Data Contained in TOS Addr to TOS
     $215F
     !exec; Store NOS to Addr in TOS
     $856D
     $851B
     +exec
     $216E
     LITexec; Put value that follows on TOS
     $0006; Literal Value
     CMOVEexec
     $856D
     $8529
     +exec
     $217C
     LITexec; Put value that follows on TOS
     $0006; Literal Value
     CMOVEexec
     ;Sexec

;; "MQRESET1
8654
     $89; Code
     ""MQRESET1"; Name
     $85E3; Backward Link
     String1exec
     String2exec
     "METHODS DATA QUE ERROR"
     DB $00

;; "MQRESET2
867D
     $89; Code
     ""MQRESET2"; Name
     $8654; Backward Link
     String1exec
     String2exec
     "PRESS ANY KEY TO RESET  "
     DB $00

;; "MQRESET3
86A6
     $89; Code
     ""MQRESET3"; Name
     $867D; Backward Link
     String1exec
     String2exec
     "INITIALIZING METHOD QUE "
     DB $00

;; RESET-METHODQ
86CF
     $8D; Code
     "RESET-METHODQ"; Name
     $86A6; Backward Link
     COLON; Complile The Following Section
     $8660
     $F4BC
     $F51E
     $8689
     $F4CB
     $F51E
     $32E5
     DROPexec
     $86B2
     $F4BC
     $F51E
     $2598
     $F4CB
     $F51E
     $20E7
     $210E
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     FILLexec
     Const0;  Push $0000 onto TOS
     $20F5
     !exec; Store NOS to Addr in TOS
     SET-DEFAULTSexec
     LITexec; Put value that follows on TOS
     $55AA; Literal Value
     $2102
     !exec; Store NOS to Addr in TOS
     ;Sexec

;; GET-DELAYTIME
8719
     $8D; Code
     "GET-DELAYTIME"; Name
     $86CF; Backward Link
GET-DELAYTIMEexec:
8729 COLON; Complile The Following Section
     $274A
     $F4BC
     $F51E
     $276F
     $F4CB
     $F51E
     $2144
     @exec; Push Data Contained in TOS Addr to TOS
     Const0;  Push $0000 onto TOS
     $338A
     2!exec
     Const0;  Push $0000 onto TOS
     $338A
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     +exec
     !exec; Store NOS to Addr in TOS
     $3A25
     $2144
     !exec; Store NOS to Addr in TOS
     ;Sexec

;; GETUNITS
8755
     $88; Code
     "GETUNITS"; Name
     $8719; Backward Link
     COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     $3292
     !exec; Store NOS to Addr in TOS
     $22AD
     @exec; Push Data Contained in TOS Addr to TOS
     OBRANCHexec
     $000A
     Const0;  Push $0000 onto TOS
     $215F
     !exec; Store NOS to Addr in TOS
     EXITexec
     $2CF7
     $F4BC
     $F51E
     $2D1F
     $F4CB
     $F51E
     Const0;  Push $0000 onto TOS
     DROPexec
     $32E5
     $F70C
     OVERexec
     =exec
     OVERexec
     $F71E
     =exec
     ORexec;  OR NOS with TOS
     OBRANCHexec
     $FFEC
     $F70C
     =exec
     $215F
     !exec; Store NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     $3292
     !exec; Store NOS to Addr in TOS
     ;Sexec

;; GET-DSPLYUNITS
87AE
     $8E; Code
     "GET-DSPLYUNITS"; Name
     $8755; Backward Link
     COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     $3292
     !exec; Store NOS to Addr in TOS
     $2C8B
     $F4BC
     $F51E
     $2CB1
     $F4CB
     $F51E
     Const0;  Push $0000 onto TOS
     DROPexec
     $32E5
     $F70C
     OVERexec
     =exec
     OVERexec
     $F71E
     =exec
     ORexec;  OR NOS with TOS
     OBRANCHexec
     $FFEC
     $F70C
     =exec
     $2152
     !exec; Store NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     $3292
     !exec; Store NOS to Addr in TOS
     ;Sexec

;; ?CALvlu>BLNKvlu
87FD
     $8F; Code
     "?CALvlu>BLNKvlu"; Name
     $87AE; Backward Link
     COLON; Complile The Following Section
     >Rexec
     2DUPexec; Duplicate TOS/NOS
     LITexec; Put value that follows on TOS
     $0DEC; Literal Value
     @exec; Push Data Contained in TOS Addr to TOS
     $216E
     2@exec
     DROPexec
     nF-exec
     SWAPexec
     DROPexec
     Const0;  Push $0000 onto TOS
     <=exec
     DUPexec; Duplicate TOS
     0=exec
     OBRANCHexec
     $0008
     $291F
     $F4BC
     $F51E
     R>exec
     SWAPexec
     ;Sexec

;; GET-CAL-VALUE
883F
     $8D; Code
     "GET-CAL-VALUE"
     $87FD; Backward Link
GET-CAL-VALUEexec:
884F COLON; Complile The Following Section
     $2796
     $F4BC
     $F51E
     $2152
     @exec; Push Data Contained in TOS Addr to TOS
     OBRANCHexec
     $0008
     $280C
     BRANCHexec
     $0004
     $27E5
     $F4CB
     $F51E
     Const1;  Push $0001 onto TOS
     $3371
     !exec; Store NOS to Addr in TOS
     Const2;  Push $0002 onto TOS
     $337C
     !exec; Store NOS to Addr in TOS
     Const0;  Push $0000 onto TOS
     $33A4
     !exec; Store NOS to Addr in TOS
     $216E
     2@exec
     LITexec; Put value that follows on TOS
     $03E8; Literal Value
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     $E07A
     2DUPexec; Duplicate TOS/NOS
     $216E
     2!exec
     $338A
     2!exec
     LITexec; Put value that follows on TOS
     $0DEC; Literal Value
     @exec; Push Data Contained in TOS Addr to TOS
     LITexec; Put value that follows on TOS
     $0004
     MINexec
     LITexec; Put value that follows on TOS
     $FFFC; Literal Value
     MAXexec
     LITexec; Put value that follows on TOS
     $0E7C; Literal Value
     !exec; Store NOS to Addr in TOS
     $338A
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     +exec
     @exec; Push Data Contained in TOS Addr to TOS
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     <exec
     OBRANCHexec
     $0032
     $338A
     2@exec
     $338A
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     +exec
     @exec; Push Data Contained in TOS Addr to TOS
     ABSexec for Loop Limit
     Const1;  Push $0001 onto TOS for Loop Index
     (DO)exec
     	LITexec; Put value that follows on TOS
     	$000A; Literal Value
     	$E018
     (LOOP)exec
     $FFF8
     $338A
     2!exec
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     $338A
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     +exec
     !exec; Store NOS to Addr in TOS
     Const0;  Push $0000 onto TOS
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     2DROPexec; Remove TOS and NOS
     DROPexec
     $38FA
     2DUPexec; Duplicate TOS/NOS
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     D>exec
     OBRANCHexec
     $FFEC
     ROTexec
     >Rexec
     2DUPexec; Duplicate TOS/NOS
     LITexec; Put value that follows on TOS
     $03E8
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     D<=exec
     OBRANCHexec
     $0014
     LITexec; Put value that follows on TOS
     $000A; Literal Value
     D*exec
     R>exec
     1-exec; Subtract 1 from TOS (DEC TOS)
     >Rexec
     Const0;  Push $0000 onto TOS
     BRANCHexec
     $0006
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     OBRANCHexec
     $FFD8
     R>exec
     LITexec; Put value that follows on TOS
     $0DEC; Literal Value
     !exec; Store NOS to Addr in TOS
     $216E
     2!exec
     ;Sexec

;; GET-BLANK-VALUE
894D
     $8F; Code
     "GET-BLANK-VALUE"; Name
     $883F; Backward Link
GET-BLANK-VALUEexec:
895F COLON; Complile The Following Section
     $27BE
     $F4BC
     $F51E
     Const0;  Push $0000 onto TOS
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     2DROPexec; Remove TOS and NOS
     DROPexec
     $2152
     @exec; Push Data Contained in TOS Addr to TOS
     OBRANCHexec
     $0008
     $280C
     BRANCHexec
     $0004
     $27E5
     $F4CB
     $F51E
     Const1;  Push $0001 onto TOS
     $3371
     !exec; Store NOS to Addr in TOS
     Const2;  Push $0002 onto TOS
     $337C
     !exec; Store NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     $33A4
     !exec; Store NOS to Addr in TOS
     $217C
     2@exec
     LITexec; Put value that follows on TOS
     $FC18; Literal Value
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     $E061
     2DUPexec; Duplicate TOS/NOS
     $217C
     2!exec
     $338A
     2!exec
     LITexec; Put value that follows on TOS
     $0DF2; Literal Value
     @exec; Push Data Contained in TOS Addr to TOS
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     MINexec
     LITexec; Put value that follows on TOS
     $FFFC; Literal Value
     MAXexec
     LITexec; Put value that follows on TOS
     $0E7C; Literal Value
     !exec; Store NOS to Addr in TOS
     $38FA
     $880F
     OBRANCHexec
     $FF9E
     $217C
     2!exec
     LITexec; Put value that follows on TOS
     $0DF2; Literal Value
     !exec; Store NOS to Addr in TOS
     ;Sexec

;; SETUP-METHOD
89E1
     $8C; Code
     "SETUP-METHOD"; Name
     $894D; Backward Link
     COLON; Complile The Following Section
     $2144
     @exec; Push Data Contained in TOS Addr to TOS
     0<exec ;Destructive Test of TOS for <0
     $2144
     @exec; Push Data Contained in TOS Addr to TOS
     LITexec; Put value that follows on TOS
     $03E8; Literal Value
     >exec
     ORexec;  OR NOS with TOS
     OBRANCHexec
     $0004
     SET-DEFAULTSexec
     GET-DELAYTIMEexec
     $87BF
     Const0;  Push $0000 onto TOS
     $22AD
     !exec; Store NOS to Addr in TOS
     $8760
     GET-CAL-VALUEexec
     GET-BLANK-VALUEexec
     $2136
     MDELAYrefx
     @METHODadrexec
     LITexec; Put value that follows on TOS
     $0012; Literal Value
     CMOVEexec
     $55A3
     $8535
     @METHODadrexec
     SWAPexec
     CMOVEexec
     $85C9
     ;Sexec

;; "MQERR1
8A34
     $87; Code
     ""MQERR1"; Name
     $89E1; Backward Link
     String1exec
     String2exec
     "METHOD #XX    DATA ERROR"
     DB $00

;;;;;;;;;;;;;;;;;;;;;;;;

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
     String1exec
     String2exec
     "REMOVE OPAQUE SAMPLE    "
     $00

;;; "STRNG" "BADLMP   | BAD LAMP DETECTION TEST |
B772
     $87; Code
     ""BADLMP"; Name
     $B74A; Backward Link
     String1exec
     String2exec
     "BAD LAMP DETECTION TEST "
     $00

;;; : LOOP-FIRE  0 10 0 DO FIRE-LAMP LMPERR @ + LOOP ;
B799
     $89; Code
     "LOOP-FIRE"; Name
     $B772; Backward Link
     COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     LITexec; Put value that follows on TOS
     $000A; Literal Value for Loop Limit
     Const0;  Push $0000 onto TOS for Loop Index
     (DO)exec
     	FIRE-LAMPexec
     	VarLMPERR; Push Var Addr onto TOS
     	@exec; Push Data Contained in TOS Addr to TOS
     	+exec; Add NOS To TOS
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
     COLON; Complile The Following Section
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
     	LITexec; Put value that follows on TOS
     	$000D; Literal Value
     	=exec
     OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if 0
     $FFF6
     $B7A5
     LITexec; Put value that follows on TOS
     $0007; Literal Value
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
BE88 $BE8A

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

C026   StorTOS: PUL A
C027            PUL B
C028   StoreD:  STA A   $00,X
C02A            STA B   $01,X
C02C            BRA     NEXT
  
C02E   LoadD:   LDA A   $00,X
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
     USER
     $0042

;; LIT
C057
     $83
     "LIT"
     $C043
LITexec:			; Literal that follows is pushed onto TOS
C05D $C05F     

C05F   L_C05F   LDX     XSafe   
C061            INX  
C062            INX  
C063            STX     XSafe   
C065            LDA A   $00,X
C067            LDA B   $01,X
C069            JMP     PUSHD   

C06C   ChrLit:  SUB B   #$6E; This makes no sense... LDA B   $01,X follows
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
     $86; Code
     "BRANCH"; Name
     $C079; Backward Link
BRANCHexec:
C096 $C0AB

;; OBRANCH; Used for the FORTH 'IF' and 'Until' Statements
C098
     $87; Code
     "OBRANCH"; Name
     $C08D; Backward Link
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
     $86; Code
     "(LOOP)"; Name
     $C098; Backward Link
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
(+LOOP)exec:
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

;; (DO)'''
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
)exec:
C130 $C132

C132   L_C132   LDX     $00EE   
C134            INX  
C135            INX  
C136            JMP     LoadD   

;; DIGIT
C139
     $85; Code
     "DIGIT"; Name
     $C12C; Backward Link
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
     $86; Code
     "(FIND)"; Name
     $C139; Backward Link
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
     $87; Code
     "ENCLOSE"; Name
     $C16D; Backward Link
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
     $84; Code
     "EMIT"; Name
     $C1E2; Backward Link
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
     $83; Code
     "KEY"; Name
     $C231; Backward Link
KEYexec:
C250 $C252

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
TERMINALexec:
C267 $C269

C269   L_C269   JSR     S_D416   
C26C            CLR B
C26D            JMP     PUSHD   

;; CR
C270
     $82
     "CR"
     $C25B; Backward Link
CRexec:
C275 $C277


C277   L_C277   JSR     S_D423   
C27A   L_C27A   JMP     NEXT   

;; CMOVE
C27D
     $85; Code
     "CMOVE"; Name
     $C270; Backward Link
CMOVEexec:
C285 $C287

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
     $82; Code
     "U)"; Name
     $C27D; Backward link
U)exec:
C2B9 $C2BB

C2BB   L_C2BB   BSR     IntMult   
C2BD            INS  
C2BE            INS  
C2BF            JMP     PUSHD   
C2C2   IntMult   LDA A   #$10; Starting Shift Count
C2C4            PSH A
C2C5            CLR A
C2C6            CLR B
C2C7            TSX  
C2C8   L_C2C8   ROR     $05,X
C2CA            ROR     $06,X
C2CC            DEC     $00,X; Decrement Shift Count
C2CE            BMI     L_C2DA; If 0, we are done  
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
U/exec:
C2E1 $C2E3

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
     $83; Code
     "AND"; Name
     $C2DC; Backward Link
ANDexec:;	AND NOS with TOS
C319 $C31B

C31B   L_C31B   PUL A
C31C            PUL B
C31D            TSX  
C31E            AND B   $01,X
C320            AND A   $00,X
C322            JMP     StoreD   

;; OR
C325
     $82; Code
     "OR"; Name
     $C313; Backward Link
ORexec:;	OR NOS with TOS
C32A $C32C

C32C   L_C32C   PUL A
C32D            PUL B
C32E            TSX  
C32F            ORA B   $01,X
C331            ORA A   $00,X
C333            JMP     StoreD   

;; XOR
C336
     $83; Code
     "XOR"; Name
     $C325; Backward Link
XORexec:;	XOR NOS with TOS
C33C $C33E

C33E   L_C33E   PUL A
C33F            PUL B
C340            TSX  
C341            EOR B   $01,X
C343            EOR A   $00,X
C345            JMP     StoreD   

;; SP@
C348
     $83; Code
     "SP@"; Name
     $C336; Backward Link
     $C350

C350   L_C350   TSX  
C351            STX     $00E0   
C353            LDX     #$00E0
C356            JMP     LoadD   

;; SP!
C359
     $83; Code
     "SP!"; Name
     $C348; Backward Link
SP!exec:
C35F $C361

C361   L_C361   LDX     $00F0   
C363            LDX     $06,X
C365            TXS
C366   L_C366   JMP     NEXT   

;; RP!
C369
     $83: Code
     "RP!"; Name
     $C359; Backward Link
     $C371

C371   L_C371   LDX     D_C014   
C374            STX     $00EE   
C376   L_C376   JMP     NEXT   

;; ;S
C379
     $82; Code
     ";S"; Name
     $3BD3; Backward Link
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
     $85; Code
     "LEAVE"; Name
     $C379; Backward Link
LEAVEexec:
C393 $C395

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
>Rexec:
C3A7 $C3A9

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
C3D6            JMP     LoadD

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
C3E9            JMP     StoreD   

;; 0<
C3EC
     $82; Code
     "0<"; Name
     $3CD9; Backward Link
0<exec:  	; Destructive Test of TOS for <0
C3F1 $C3F3

C3F3   L_C3F3   TSX  
C3F4            LDA A   #$80
C3F6            AND A   $00,X
C3F8            BEQ     L_C400   
C3FA            CLR A; Clear MSB of Result
C3FB            LDA B   #$01; Set TRUE
C3FD            JMP     StoreD   
C400   L_C400   CLR B; Set FALSE
C401            JMP     StoreD   

;; +
C404
     $81; Code
     "+"; Name
     $C3EC; Backward Link
+exec:	Add NOS To TOS
C408 $C40A

C40A   L_C40A   PUL A
C40B            PUL B
C40C            TSX  
C40D            ADD B   $01,X
C40F            ADC A   $00,X
C411            JMP     StoreD   

;; D+
C414
     $82; Code
     "D+"; Name
     $C404; Backward Link
D+exec:
C419 $C41B

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
     $85; Code
     "MINUS"; Name
     $C414; Backward Link
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
     $86; Code
     "DMINUS"; Name
     $C430; Backward Link
DMINUSexec:
C451 $C453

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
     $84; Code
     "OVER"; name
     $C448; Backward Link
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
     $84; Code
     "SWAP"; Name
     $C47C; Backward Link
SWAPexec:		; Swap TOS with NOS
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
C4A1            JMP     LoadD   

;; DUP
C4A4
     $83; Code
     "DUP"; Name
     $C48A; Backward Link
DUPexec:; 	Duplicate TOS
C4AA $C4AC

C4AC   L_C4AC   PUL A
C4AD            PUL B
C4AE            PSH B
C4AF            PSH A
C4B0            JMP     PUSHD   

;; +!
C4B3
     $82; Code
     "+!"; Name
     $C4A4; Backward Link
+!exec:		+!exec; Add NOS to Addr in TOS
C4B8 $C4BA

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
     $86; Code
     "TOGGLE"; Name
     $C4B3; Backward Link
     COLON; Complile The Following Section
     OVERexec; Duplicate NOS at TOS
     C@exec
     XORexec;  XOR NOS with TOS
     SWAPexec; Swap TOS with NOS
     C!exec;  Store NOS (Char)  to Addr in TOS
     ;Sexec
     $81C0
     TOGGLE
@exec:		; Push Data Contained in TOS Addr to TOS
C4E7 $C4E9

C4E9   L_C4E9   TSX  
C4EA            LDX     $00,X
C4EC            INS  
C4ED            INS  
C4EE            JMP     LoadD   

;; C@
C4F1
     $82; Code
     "C@"; Name
     $C4E3; Backward Link
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
     $81; Code
     "!"; Name
     $C4F1; Backward Link
!exec:			 	Store NOS to Addr in TOS			
C507 $C509

C509   L_C509   TSX  
C50A            LDX     $00,X
C50C            INS  
C50D            INS  
C50E            JMP     StorTOS   

;; C!
C511
     $82; Code
     "C!"; Name
     $C503; Backward Link
C!exec:;  Store NOS (Char)  to Addr in TOS
C516 $C518

C518   L_C518   TSX  
C519            LDX     $00,X	; Load X with Addr
C51B            INS 		; Adj SP for Addr + 1 Byte
C51C            INS  
C51D            INS  
C51E            PUL B		; Pull data byte off stack
C51F            STA B   $00,X	; Store data byte at Addr
C521   L_C521   JMP     NEXT

;; :
C524
     $C1; Code
     ":"; Name
     $C511; Backward Link
     COLON; Complile The Following Section
     ?EXECexec
     !CSPexec
     CURRENTexec
     @exec
     CONTEXTexec
     !exec
     CREATEexec
     ]exec
     (;CODE)exec

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
     $C1; Code
     ";"; Name
     $C524; Backward Link
     COLON; Complile The Following Section
;;;;;;;;;;

;; CONSTANT
C561
     $88; Code
     "CONSTANT"; Name
     $C54F; Backward Link
CONSTANTexec:
C56C COLON; Complile The Following Section
     CREATEexec
     SMUDGEexec
     ,exec
     (;CODE)exec

C576  GetVar:   LDX     $00EA; Points to Processing Routine Token   
C578            LDA A   $02,X; Get 1st byte after Token Addr (VarHi)
C57A            LDA B   $03,X; Get 2nd byte after Token Addr (VarLo)
C57C            JMP     PUSHD; Put them on stack and get Next

;; VARIABLE
C57F
     $88; Code
     "VARIABLE"; Name
     $C561; Backward Link
     COLON; Complile The Following Section
     CONSTANTexec
     (;CODE)exec
C590   L_C590   LDA A   $00EA   
C592            LDA B   $00EB   
C594            ADD B   #$02
C596            ADC A   #$00
C598            JMP     PUSHD

;; USER
C59B
     $84; Code
     "USER"; Name
     $C57F; Backward Link
     COLON; Complile The Following Section
     CONSTANTexec
     (;CODE)exec

C5A8   USER:    LDX     $00EA   
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
Const0:;		Push $0000 onto TOS
C5B9 GetVar
     $0000; Constant value

;;; 1 CONSTANT 1
C5BD
     $81; Code
     "1"; Name
     $C5B5; Backward Link
Const1:;		Push $0001 onto TOS
C5C1 GetVar
     $0001; Constant value

;;; 2 CONSTANT 2
C5C5
     $81; Code
     "2"; Name
     $C5BD; Backward Link
Const2:;		Push $0002 onto TOS
C5C9 GetVar
     $0002; Constant value

;;; 3 CONSTANT 3
C5CD
     $81; Code
     "3"; Name
     $C5C5; Backward Link
Const3:;		Push $0003 onto TOS
C5D1 GetVar
     $0003; Constant value

;; BL
C5D5
     $82; Code
     "BL"; Name
     $C5CD; Backward Link
BLrefx:
C5DA GetVar
;;;;;;;;;;

;; FIRST
C5DE
     $85; Code
     "FIRST"; Name
     $C5D5; Backward Link
     GetVar
;;;;;;;;;;

;; LIMIT
C5EA
     $85; Code
     "LIMIT"; Name
     $C5DE; Backward Link
     GetVar
;;;;;;;;;;

;; B/BUF
C5F6
     $85; Code
     "B/BUF"; Name
     $C5EA; Backward Link
     GetVar
;;;;;;;;;;

;; B/SCR
C602
     $85; Code
     "B/SCR"; Name
     $C5F6; Backward Link
     GetVar
;;;;;;;;;;

;; +ORIGIN
C60E
     $87; Code
     "+ORIGIN"; Name
     $C602; Backward Link
     COLON; Complile The Following Section
;;;;;;;;;;

;; S0
C622
     $82; Code
     "S0"; Name
     $C60E; Backward Link
S0exec:
C627 USER
     $0006

;; R0
C62B
     $82; Code
     "R0"; Name
     $C622; Backward Link
     USER
;;;;;;;;;;

;; TIB
C634
     $83
     "TIB"
     $C62B; Backward Link
TIBexec:
C63A USER
;;;;;;;;;;

;; WIDTH
C63E
     $85
     "WIDTH"
     $C634; Backward Link
     USER
;;;;;;;;;;

;; WARNING
C64A
     $87
     "WARNING"
     $C63E; Backward Link
     USER
;;;;;;;;;;

;; FENCE
C658
     $85
     "FENCE"
     $C64A; Backward Link
     USER
;;;;;;;;;;

;; DP
C664
     $82
     "DP"
     $C658; Backward Link
     USER
;;;;;;;;;;

;; VOC-LINK
C66D
     $88
     "VOC-LINK"
     $C664; Backward Link
VOC-LINKexec:
C678 USER
;;;;;;;;;;

;; BLK
6C7C
     $83
     "BLK"
     $C66D; Backward Link
     USER
;;;;;;;;;;

;; IN
6C86
     $82
     "IN"
     $C67C; Backward Link
INexec:
C68B USER
;;;;;;;;;;

;; OUT
6C8F
     $83
     "OUT"
     $C686; Backward Link
     USER
;;;;;;;;;;

;; OFFSET
C699
     $86
     "OFFSET"
     $C68F; Backward Link
OFFSETexec:
C6A2 USER
;;;;;;;;;;

;; CONTEXT
C6A6
     $87
     "CONTEXT"
     $C699; Backward Link
CONTEXTexec:
C6B0 USER
;;;;;;;;;;

;; CURRENT
C6B4
     $87
     "CURRENT"
     $C6A6; Backward Link
CURRENTexec:
C6BE USER
;;;;;;;;;;

;; STATE
C6C2
     $85
     "STATE"
     $C6B4; Backward Link
C6CA USER
;;;;;;;;;;

;; BASE
C6CE
     $84
     "BASE"
     $C6C2; Backward Link
BASEexec:
C6D5 USER
;;;;;;;;;;

;; DPL
C6D9
     $83
     "DPL"
     $C6CE; Backward Link
DPLexec:
C6Df USER
;;;;;;;;;;

;; FLD
C6E3
     $83
     "FLD"
     $C6D9; Backward Link
     USER
;;;;;;;;;;

;; CSP
C6ED
     $83
     "CSP"
     $C6E3; Backward Link
     USER
;;;;;;;;;;

;; R#
C6F7
     $82
     "R#"
     $C6ED; Backward Link
     USER
;;;;;;;;;;

;; HLD
C700
     $83
     "HLD"
     $C6F7; Backward Link
HLDrefx:
C706 GetVar
;;;;;;;;;;

;; COLUMNS
C70A
     $87
     "COLUMNS"
     $C700; Backward Link
     USER
;;;;;;;;;;

;; 1+
C718
     $82
     "1+"
     $C70A; Backward Link
1+exec:
C71D COLON; Complile The Following Section
;;;;;;;;;;

;; 2+
C725
     $82
     "2+"
     $C718; Backward Link
2+exec:
C72A COLON; Complile The Following Section
;;;;;;;;;;

;; HERE
C732
     $84
     "HERE"
     $C725; Backward Link
HEREexec:
C739 COLON; Complile The Following Section
;;;;;;;;;;

;; ALLOT
C741
     $85
     "ALLOT"
     $C732; Backward Link
ALLOTexec:
C749 COLON; Complile The Following Section
;;;;;;;;;;

;; ,
C751
     $81
     ","
     $C741; Backward Link
,exec:
C755 COLON; Complile The Following Section
     HEREexec
     !exec; Store NOS to Addr in TOS
     Const2;  Push $0002 onto TOS
     ALLOTexec
     ;Sexec

;; C,
C761
     $82
     "C,"
     $C751; Backward Link
     COLON; Complile The Following Section
     HEREexec
     C!exec;  Store NOS (Char)  to Addr in TOS
     Const1;  Push $0001 onto TOS
     ALLOTexec
     ;Sexec

;; -
C772
     $81
     "-"
     $C761; Backward Link
-exec:	; Subtract TOS From NOS
C776 $C778

C778   L_C778   TSX  
C779            LDA A   $02,X
C77B            LDA B   $03,X
C77D            SUB B   $01,X
C77F            SBC A   $00,X
C781            INS  
C782            INS  
C783            TSX  
C784            JMP     StoreD

;; =
C787
     $81
     "="
     $C772; Backward Link
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
     $C787; Backward Link
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
     $C79B; Backward Link
>exec:
C7BD $C7BF

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
     $C7D3; Backward Link
     COLON; Complile The Following Section
     SWAPexec; Swap TOS with NOS
     $C7D8
     ;Sexec

;; ROT
C7FF
     $83; Code
     "ROT"; Name
     $C7F2; Backward Link
ROTexec:
C805 COLON; Complile The Following Section
     >Rexec
     SWAPexec; Swap TOS with NOS
     R>exec
     SWAPexec; Swap TOS with NOS
     ;Sexec

;; SPACE
C811
     $85; Code
     "SPACE"; Name
     $C7FF; Backward Link
SPACEexec:
C819 COLON; Complile The Following Section
;;;;;;;;;;

;; MIN
C821
     $83; Code
     "MIN"; Name
     $C811; Backward Link
MINexec:
C827 COLON; Complile The Following Section
;;;;;;;;;;

;; MAX
C839
     $83; Code
     "MAX"; Name
     $C821; Backward Link
MAXexec:
C83F COLON; Complile The Following Section
     OVERexec
     OVERexec
     <exec
     OBRANCHexec
     $0004
     SWAPexec
     DROPexec; Delete TOS
     ;Sexec

;; -DUP
C851
     $84; Code
     "-DUP"; Name
     $C839; Backward Link
     COLON; Complile The Following Section
;;;;;;;;;;

;; TRAVERSE
C864
     $88; Code
     "TRAVERSE"
     $C851; Backward Link
     COLON; Complile The Following Section
;;;;;;;;;;

;; LATEST
C88A
     $86; Code
     "LATEST"; Name
     $C864; Backward Link
LATESTexec:
C893 COLON; Complile The Following Section
     CURRENTexec
     @exec; Push Data Contained in TOS Addr to TOS
     @exec; Push Data Contained in TOS Addr to TOS
     ;Sexec

;; LFA
C89D
     $83; Code
     "LFA"; Name
     $C88A; Backward Link
LFAexec:
C8A3 COLON; Complile The Following Section
;;;;;;;;;;

;; CFA
C8AC
     $83; Code
     "CFA"; Name
     $C89D; Backward Link
CFAexec:
C8B2 COLON; Complile The Following Section
     ChrLit
     $05; Literal Chr Value
     -exec:	; Subtract TOS From NOS
     Const1;  Push $0001 onto TOS
     $C438
     $C86F
     ;Sexec

;; NFA
C8BA
     $83; Code
     "NFA"; Name
     $C8AC; Backward Link
NFAexec:
C8C0 COLON; Complile The Following Section


;; PFA
C8CF
     $83; Code
     "PFA"; Name
     $C8BA; Backward Link
     COLON; Complile The Following Section
     Const1;  Push $0001 onto TOS
     $C86F
     ChrLit
     $05; Literal Chr Value
     $C408
     ;Sexec

;; !CSP
C8E2
     $84; Code
     "!CSP"; Name
     $C8CF; Backward Link
!CSPexec:
C8E9 COLON; Complile The Following Section
     $C34E
     $C6F3
     !exec; Store NOS to Addr in TOS
     ;Sexec

;; ?ERROR
C8F3
     $86; Code
     "?ERROR"; Name
     $C8E2; Backward Link
?ERRORexec:
C8FC COLON; Complile The Following Section
     SWAPexec
     OBRANCHexec
     $0008
     $CDBB
     $C096
     $0004
     DROPexec; Delete TOS
     ;Sexec

;; ?COMP
C90E
     $85; Code
     "?COMP"; Name
     $C8F3; Backward Link
     COLON; Complile The Following Section
     $C6CA
     @exec
     0=exec
     ChrLit
     $11; Literal Chr Value
     ?ERRORexec
     ;Sexec

;; ?EXEC
C925
     $85; Code
     "?EXEC"; Name
     $C90E
?EXECexec:
C92D COLON; Complile The Following Section
     $C6CA
     @exec
     ChrLit
     $12; Literal Chr Value
     ?ERRORexec
     ;Sexec

;; ?PAIRS
C93A
     $86; Code
     "?PAIRS"; Name
     $C925; Backward Link
?PAIRSexec:
C943 COLON; Complile The Following Section
     -exec:	; Subtract TOS From NOS
     ChrLit
     $13; Literal Chr Value
     ?ERRORexec
     ;Sexec

;; ?CSP
C94E
     $84; Code
     "?CSP" Name
     $C93A; Backward Link
     COLON; Complile The Following Section
     $C34E
     $C6F3
     @exec
     -exec:	; Subtract TOS From NOS
     ChrLit
     $14; Literal Chr Value
     ?ERRORexec
     ;Sexec

;; COMPILE
C966
     $87; Code
     "COMPILE"; Name
     $C94E; Backward Link
     COLON; Complile The Following Section
     $C916
     R>exec
     2+exec
     $C4AA
     >Rexec
     @exec
     ,exec
     ;Sexec

;; [
C982
     $C1; Code
     "["; Name
     $C966; Backward Link
     COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     $C6CA
     !exec; Store NOS to Addr in TOS
     ;Sexec

;; ]
C990
     $81; Code
     "]"; Name
     $C982; Backward Link
]exec:
C994 COLON; Complile The Following Section
     ChrLit
     $C0; Literal Chr Value
     $C6CA
     !exec; Store NOS to Addr in TOS
     ;Sexec

;; SMUDGE
C99F
     $86; Code
     "SMUDGE"; Name
     $C990; Backward Link
SMUDGEexec:
C9A8 COLON; Complile The Following Section
     LATESTexec
     ChrLit
     $20; Literal Chr Value
     $C4D5
     ;Sexec

;; HEX
C9B3
     $83; Code
     "HEX"; Name
     $C99F; Backward Link
HEXexec:
C9B9 COLON; Complile The Following Section
     ChrLit
     $10; Literal Chr Value
     BASEexec
     !exec; Store NOS to Addr in TOS
     ;Sexec

;; DECIMAL
C9C4
     $87; Code
     "DECIMAL"; Name
     $C9B3; Backward Link
DECIMALexec:
C9CE COLON; Complile The Following Section
     ChrLit
     $0A; Literal Chr Value
     BASEexec
     !exec; Store NOS to Addr in TOS
     ;Sexec

;; (;CODE)
C9D9
     $87; Code
     "(;CODE)"; Name
     $C9C4; Backward Link
(;CODE)exec:
C9E3 COLON; Complile The Following Section
     R>exec
     2+exec
     LATESTexec
     $C8D5
     CFAexec
     !exec; Store NOS to Addr in TOS
     ;Sexec

;; ;CODE
C9F3
     $C5; Code
     ";CODE"; Name
     $C9D9; Backward Link
     COLON; Complile The Following Section
     $C955
     $C970
     (;CODE)exec
     SMUDGEexec
     $C986
     $CB20
     ;Sexec

;; BUILDS
CA0B
     $87; Code
     "BUILDS"; Name
     $C9F3; Backward Link
     COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     CONSTANTexec
     ;Sexec

;; DOES>
CA1D
     $85; Code
     "DOES>"; Name
     $CA0B; Backward Link
     COLON; Complile The Following Section
     R>exec
     2+exec
     LATESTexec
     $C8D5
     !exec; Store NOS to Addr in TOS
String1exec:
CA33 (;CODE)exec
     $96EC
     REBOOTexec
CA37   L_CA37   LDX     $00EE   
CA39            DEX  
CA3A            DEX  
CA3B            STX     $00EE   
CA3D            STA A   $02,X
CA3F            STA B   $03,X
CA41            LDX     $00EA   
CA43            INX  
CA44            INX  
CA45            STX     $00E0   
CA47            LDX     $00,X
CA49            STX     $00EC   
CA4B            CLR A
CA4C            LDA B   #$02
CA4E            ADD B   $00E1   
CA50            ADC A   $00E0   
CA52            PSH B
CA53            PSH A
CA54            JMP     L_C03A

;; COUNT
CA57
     $85; Code
     "COUNT"; Name
     $CA1D; Backward Link
COUNTexec:
CA5F COLON; Complile The Following Section
     $C4AA
     $C71D
     SWAPexec
     $C4F6
     ;Sexec

;; TYPE
CA6B
     $84; Code
     "TYPE"; Name
     $CA57; Backward Link
TYPEexec:
CA72 COLON; Complile The Following Section
     $C858
     OBRANCHexec
     $0018
     OVERexec
     $C408 for Loop Limit
     SWAPexec for Loop Index
     (DO)exec
     	)exec
     	$C4F6
     	EMITexec
     (LOOP)exec
     $FFF8
     $C096
     $0004
     DROPexec; Delete TOS
     ;Sexec

;;; TRAILING
CA94
     $89; Code
     "-TRAILING"; Name
     $CA6B; Backward Link
     COLON; Complile The Following Section
     DUPexec; Duplicate TOS; Duplicate TOS for Loop Limit
     Const0;  Push $0000 onto TOS for Loop Index
     (DO)exec
     	OVERexec; Duplicate NOS at TOS
     	OVERexec; Duplicate NOS at TOS
     	+exec; Add NOS To TOS
     	Const1;  Push $0001 onto TOS
     	-exec:	; Subtract TOS From NOS
     	C@exec
     	BLrefx
     	-exec:	; Subtract TOS From NOS
     	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
     	$0008; Branch Offset
     		LEAVEexec
     	BRANCHexec
     	$0006
     	ENDIF
     	Const1;  Push $0001 onto TOS
     	-exec:	; Subtract TOS From NOS
     (LOOP)exec
     $FFE0
     ;Sexec

;;; (.")
CACC
     $84; Code
     "(.")"; Name
     $CA94; Backward Link
     COLON; Complile The Following Section
."exec:;  Print Literal String
CAD3 Rexec
     2+exec
     COUNTexec
     DUPexec; Duplicate TOS; Duplicate TOS
     1+exec
     R>exec
     +exec; Add NOS To TOS
     >Rexec
     TYPEexec
??????????

;; FILL
CC1A
     $84; Code
     "FILL"; Name
     $CBE2; Backward Link
FILLexec:
CC21 COLON; Complile The Following Section
     SWAPexec; Swap TOS with NOS
     >Rexec
     OVERexec
     C!exec;  Store NOS (Char)  to Addr in TOS
     DUPexec; Duplicate TOS
     1+exec
     R>exec
     Const1;  Push $0001 onto TOS
     -exec:	; Subtract TOS From NOS
     CMOVEexec
     ;Sexec

;; ERASE
CC39
     $85; Code
     "ERASE"; Name
     $CC1A; Backward Link
     COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     FILLexec
     ;Sexec

;; BLANKS
CC49
     $86; Code
     "BLANKS"; Name
     $CC39; Backward Link
BLANKSexec:
CC52 COLON; Complile The Following Section
     BLrefx
     FILLexec
     ;Sexec

;; HOLD
CC5A
     $84; Code
     "HOLD"; Name
     $CC49; Backward Link
HOLDexec:
CC61 $CC49
     COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     HLDrefx
     +!exec; Add NOS to Addr in TOS
     HLDrefx
     @exec; Push Data Contained in TOS Addr to TOS
     C!exec;  Store NOS (Char)  to Addr in TOS
     ;Sexec

;; PAD
CC73
     $83; Code
     "PAD"; Name
     $CC5A
PADexec:
CC79 COLON; Complile The Following Section
     HEREexec
     ChrLit
     $44; Literal Chr Value
     +exec
     ;Sexec

;; WORD
CC84
     $84; Code
     "WORD"; Name
     $CC73; Backward Link
WORDexec:
CC8B COLON; Complile The Following Section
     $C682
     @exec; Push Data Contained in TOS Addr to TOS
     OBRANCHexec
     $0011
     $."exec;  Print Literal String
     $05;	Number of Chars in print String (Error here... should be $0A)
     "WORD ERROR"
     QUITexec
     TIBexec
     @exec; Push Data Contained in TOS Addr to TOS
     INexec
     @exec; Push Data Contained in TOS Addr to TOS
     +exec
     SWAPexec
     TIBexec
     HEREexec
     ChrLit
     $22; Literal Chr Value
     BLANKSexec
     INexec
     +!exec; Add NOS to Addr in TOS
     OVERexec
     -exec:	; Subtract TOS From NOS
     >Rexec
     Rexec
     HEREexec
     C!exec;  Store NOS (Char)  to Addr in TOS
     +exec
     HEREexec
     1+exec
     R>exec
     CMOVEexec
     ;Sexec

;; (NUMBER)
CCD5
     $88; Code
     "(NUMBER); Name
     $CC84; Backward Link
(NUMBER)exec:
CCE0 COLON; Complile The Following Section
     1+exec
     DUPexec; Duplicate TOS
     >Rexec
     C@exec
     BASEexec
     @exec; Push Data Contained in TOS Addr to TOS
     $C141
     OBRANCHexec
     $002C
     SWAPexec
     BASEexec
     @exec; Push Data Contained in TOS Addr to TOS
     U)exec
     DROPexec
     ROTexec
     BASEexec
     @exec; Push Data Contained in TOS Addr to TOS
     U)exec
     D+exec
     DPLexec
     @exec; Push Data Contained in TOS Addr to TOS
     1+exec
     OBRANCHexec
     $0008
     Const1;  Push $0001 onto TOS
     DPLexec
     +!exec; Add NOS to Addr in TOS
     R>exec
     BRANCHexec
     $FFC6
     R>exec
     ;Sexec

;; NUMBER
CD22
     $86; Code
     "NUMBER"; Name
     $CCD5; Backward Link
NUMBERexec:
CD2B COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     Const0;  Push $0000 onto TOS
     ROTexec
     DUPexec; Duplicate TOS
     1+exec
     C@exec
     ChrLit
     $2D; Literal Chr Value
     =exec
     DUPexec; Duplicate TOS
     >Rexec
     +exec
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     DPLexec
     !exec; Store NOS to Addr in TOS
     (NUMBER)exec
     DUPexec; Duplicate TOS
     C@exec
     BLrefx
     -exec:	; Subtract TOS From NOS
     OBRANCHexec
     $0015
     DUPexec; Duplicate TOS
     C@exec
     ChrLit
     $2E; Literal Chr Value
     -exec:	; Subtract TOS From NOS
     Const0;  Push $0000 onto TOS
     ?ERRORexec
     Const0;  Push $0000 onto TOS
     BRANCHexec
     $FFDD
     DROPexec
     R>exec
     OBRANCHexec
     $0004
     DMINUSexec
     ;Sexec

;; FIND
CD79
     $85; Code
     "FIND"; Name
     $CD22; Backward Link
     COLON; Complile The Following Section
     BLrefx
     WORDexec
     HEREexec
     CONTEXTexec
     @exec; Push Data Contained in TOS Addr to TOS
     @exec; Push Data Contained in TOS Addr to TOS
     $C176
     DUPexec; Duplicate TOS
     0=exec
     OBRANCHexec
     $000A
     DROPexec
     HEREexec
     LATESTexec
     $C176
     ;Sexec

;; (ABORT)
CDA3
     $87; Code
     "(ABORT); Name
     $CD79
     COLON; Complile The Following Section
     ABORTexec
     ;Sexec

;; ERROR
CDB3
     $85; Code
     "ERROR"; Name
     $CDA3; Backward Link
     COLON; Complile The Following Section
     $C654
     @exec; Push Data Contained in TOS Addr to TOS
     0<exec ;Destructive Test of TOS for <0
     OBRANCHexec
     $0004
     $CDAD
     HEREexec
     COUNTexec
     TYPEexec
     $."exec;  Print Literal String
     $04;	Msg Bytes
     "<BELL> ? "
     "
     MESSAGEexec
     SP!exec
     QUITexec
     ;Sexec

;; ID.
CDDE
     $83; Name
     "ID."; Name
     $CDB3; Backward Link
     COLON; Complile The Following Section
     PADexec
     ChrLit
     $20; Literal Chr Value
     ChrLit
     $5F; Literal Chr Value
     FILLexec
     DUPexec; Duplicate TOS
     $C8D5
     LFAexec
     OVERexec
     -exec:	; Subtract TOS From NOS
     PADexec
     SWAPexec
     CMOVEexec
     PADexec
     COUNTexec
     ChrLit
     $1F; Literal Chr Value
     ANDexec;  AND NOS with TOS
     TYPEexec
     SPACEexec
     ;Sexec

;; CREATE
CE0F
     $86; Code
     "CREATE"; Name
     $CDDE; Backward Link
CREATEexec:
CE18 COLON; Complile The Following Section
     $CD81
     OBRANCHexec
     $0015
     DROPexec
     LITexec; Put value that follows on TOS
     $0007; Literal Value
     EMITexec
     $C8C0
     $CDE4
     ChrLit
     $04; Literal Chr Value
     MESSAGEexec
     SPACEexec
     HEREexec
     DUPexec; Duplicate TOS
     C@exec
     $C646
     @exec; Push Data Contained in TOS Addr to TOS
     MINexec
     1+exec
     ALLOTexec
     DUPexec; Duplicate TOS
     ChrLit
     $A0; Literal Chr Value
     $C4D5
     HEREexec
     Const1;  Push $0001 onto TOS
     -exec:	; Subtract TOS From NOS
     ChrLit
     $80; Literal Chr Value
     $C4D5
     LATESTexec
     ,exec
     CURRENTexec
     @exec; Push Data Contained in TOS Addr to TOS
     !exec; Store NOS to Addr in TOS
     HEREexec
     2+exec
     ,exec
     ;Sexec

;; [COMPILE]
CE67
     $C9; Code
     "[COMPILE]"; Name
     $CE0F; Backward Link
     COLON; Complile The Following Section
     $CD81
     0=exec
     Const0;  Push $0000 onto TOS
     ?ERRORexec
     DROPexec
     CFAexec
     ,exec
     ;Sexec

;; LITERAL
CE85
     $C7; Code
     "LITERAL"; Name
     $CE67; Backward Link
     COLON; Complile The Following Section
     $C6CA
     @exec; Push Data Contained in TOS Addr to TOS
     OBRANCHexec
     $0008
     $C970
     LITexec; Put value that follows on TOS
     $C755; Literal Value
     ;Sexec

;; DLITERAL
CEA1
     $C9; Code
     "DLITERAL"; Name
     $CE85; Backward Link
     COLON; Complile The Following Section
     $C6CA
     @exec; Push Data Contained in TOS Addr to TOS
     OBRANCHexec
     $0008
     SWAPexec
     $CE8F
     $CE8F
     ;Sexec

;; INTERPRET
CEBE
     $89; Code
     "INTERPRET"; Name
     $CEA1; Backward Link
     COLON; Complile The Following Section
     $CD81
     OBRANCHexec
     $001C
     $C6CA
     @exec; Push Data Contained in TOS Addr to TOS
     <exec
     OBRANCHexec
     $000A
     CFAexec
     ,exec
     BRANCHexec
     $0006
     CFAexec
     EXECUTEexec
     BRANCHexec
     $001A
     HEREexec
     NUMBERexec
     DPLexec
     @exec; Push Data Contained in TOS Addr to TOS
     1+exec
     OBRANCHexec
     $0008
     $CEAC
     BRANCHexec
     $0006
     DROPexec
     $CE8F
     $CB20
     BRANCHexec
     $FFC4
     ;Sexec

;; IMMEDIATE
CF0C
     $89; Code
     "IMMEDIATE"; Name
     $CEBE; Backward Link
     COLON; Complile The Following Section
     LATESTexec
     ChrLit
     $40; Literal Chr Value
     $C4D5
     ;Sexec

;; VOCABULARY
CF23
     $8A; Code
     "VOCABULARY"; Name
     $CF0C; Backward Link
     COLON; Complile The Following Section
     $CA15
     LITexec; Put value that follows on TOS
     $81A0; Literal Value
     ,exec
     CURRENTexec
     @exec; Push Data Contained in TOS Addr to TOS
     CFAexec
     ,exec
     HEREexec
     VOC-LINKexec
     @exec; Push Data Contained in TOS Addr to TOS
     ,exec
     VOC-LINKexec
     !exec; Store NOS to Addr in TOS
     VOC-LINKexec
     2+exec
     CONTEXTexec
     !exec; Store NOS to Addr in TOS
     ;Sexec

;; DEFINITIONS
CF58
     $8B; Code
     "DEFINITIONS"; Name
     $CF23; Backward Link
     COLON; Complile The Following Section
     CONTEXTexec
     @exec; Push Data Contained in TOS Addr to TOS
     CURRENTexec
     !exec; Store NOS to Addr in TOS
     ;Sexec

;; (
CF72
     $C1; Code
     "("; Name
     $CF58; Backward Link
     COLON; Complile The Following Section
     ChrLit
     $29; Literal Chr Value
     WORDexec
     ;Sexec

;; QUIT
CF7F
     $84; Code
     "QUIT"; Name
     $CF72
QUITexec:
CF86 COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     $C682
     !exec; Store NOS to Addr in TOS
     $C986
     $C36F
     CRexec
     $CBCE
     $CECA
     $C6CA
     @exec; Push Data Contained in TOS Addr to TOS
     0=exec
     OBRANCHexec
     $0008
     $."exec;  Print Literal String
     $03;	Msg Bytes
     " OK"
     BRANCHexec
     $FFE6

;; ABORT1
CFAC
     $86; Code
     "ABORT1"; Name
     $CF7F; Backward Link
     COLON; Complile The Following Section
     SP!exec
     DECIMALexec
     $CB20
     Const0;  Push $0000 onto TOS
     OFFSETexec
     !exec; Store NOS to Addr in TOS
     CRexec
     $."exec;  Print Literal String
     $22;	Msg Bytes
     "Oxbridge FORTH79/6800       3/8/90"
     CRexec
     $."exec;  Print Literal String
     $1E;	Msg Bytes
     "(C) 1989,1990 by Oxbridge Inc."
     $0562
     $CF66
     ;Sexec

;; ABORT
D013
     $85; Code
     "ABORT"; Name
     $CFAC; Backward Link
ABORTexec:
D01B COLON; Complile The Following Section
     $CFB5
     QUITexec
     ;Sexec

;; VBOOT
D023
     $85; Code
     "VBOOT"; Name
VBOOTexec:
D02B $D013; Backward Link
     GetVar
     $0556

;; BOOT
D02F
     $84; Code
     "BOOT"; Name
     $D023; Backward Link
     COLON; Complile The Following Section
     $CFB5
     VBOOTexec
     @exec; Push Data Contained in TOS Addr to TOS
     EXECUTEexec
     QUITexec
     ;Sexec

;; COLD
D044
     $84; Code
     "COLD"; Name
     "D02F; Backward Link
D04B $D04D
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

     $0500
     $0500
     NOONexec
     $0000
     $C5
     "FORTH"
     $DBBA; NOON
     String1exec
     $CF50
     $81A0
     $FF48
     $0000
     $C9
     "ASSEMBLER"
     $055A
     String1exec
     $CF50
     $81A0
     $F0D0
     $056A
     $C6
     "EDITOR"
     $056C
     String1exec
     $CF50
     $81A0
     $0566
     $0580
     "(C) Forth Interest Group, 1979"
     $8454
     $4153
     $CB05
     $823C
     ;Sexec
     "JerryHaney'  

;; S->D
D134
     $84; Code
     "S->D; Name
     $D044; Backward Link
S->Dexec:
D13B COLON; Complile The Following Section
     DUPexec; Duplicate TOS
     0<exec ;Destructive Test of TOS for <0
     $C438
     ;Sexec

;; *
D145
     $81; Code
     "*"; Name
     $D134; Backward Link
*exec:
D149 $D14B

D14B   L_D14B   JSR     IntMult   
D14E            INS  
D14F            INS  
D150   L_D150   JMP     NEXT

;; /MOD
D153
     $84; Code
     "/MOD"; Name
     $D145; Backward Link
/MODexec:
D15A COLON; Complile The Following Section
     $C4AA
     0<exec ;Destructive Test of TOS for <0
     >Rexec
     ABSexec
     SWAPexec; Swap TOS with NOS
     $C4AA
     0<exec ;Destructive Test of TOS for <0
     >Rexec
     ABSexec
     S->Dexec
     ROTexec
     $C2E1
     SWAPexec; Swap TOS with NOS
     )exec
     OBRANCHexec
     $0004
     $C438
     SWAPexec; Swap TOS with NOS
     R>exec
     R>exec
     XORexec;  XOR NOS with TOS
     OBRANCHexec
     $0004
     $C438
     ;Sexec

;; /
D18E
     $81; Code
     "/"; Name
     $D153; Backward Link
/exec:
D192 COLON; Complile The Following Section
     /MODexec
     SWAPexec; Swap TOS with NOS
     DROPexec; Delete TOS
     ;Sexec

;; MOD
D19C
     $83; Code
     "MOD"; Name
     $D18E; Backward Link
     COLON; Complile The Following Section
     /MODexec
     DROPexec; Delete TOS
     ;Sexec

;; */MOD
D1AA
     $85; Code
     "*/MOD"; Name
     $D19C; Backward Link
     COLON; Complile The Following Section
     >Rexec
     U)exec
     R>exec
     $C2E1
     ;Sexec

;; */
D1BE
     $82; Code
     "*/"; Name
     $D1AA; Backward Link
*/exec:
D1C3 COLON; Complile The Following Section
     $D1B2
     SWAPexec; Swap TOS with NOS
     DROPexec; Delete TOS
     ;Sexec

;; M/MOD
D1CD
     $85; Code
     "M/MOD"; Name
     $D1BE; Backward Link
M/MODexec:
D1D5 COLON; Complile The Following Section
     >Rexec
     Const0;  Push $0000 onto TOS
     Rexec
     U/exec
     R>exec
     SWAPexec
     >Rexec
     U/exec
     R>exec
     ;Sexec

;; ABS
D1EB
     $83; Code
     "ABS"; Name
     $D1CD; Backward Link
ABSexec:
D1F1 COLON; Complile The Following Section
     $C4AA
     $C3F1
     OBRANCHexec
     $0004
     $C438
     ;Sexec

;; DABS 
D1FF
     $84; Code
     "DABS"; Name
     $D1EB; Backward Link
DABSexec:
D206 COLON; Complile The Following Section
     DUPexec; Duplicate TOS
     0<exec ;Destructive Test of TOS for <0
     OBRANCHexec
     $0004
     DMINUSexec
     ;Sexec

D214
     DB $0B
     "NOT defined"
;;;;;;;;;;;

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

;; MESSAGE
D3D3
     $87; Code
     "MESSAGE"; Name
     $D1FF; Backward Link
MESSAGEexec:
D3DD COLON; Complile The Following Section
     $D39D
     ;Sexec  

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

;; '
D43A
     $C1; Code
     "'"; Name
     $D3D3; Backward Link
D43E COLON; Complile The Following Section
     $CD81
     0=exec
     Const0;  Push $0000 onto TOS
     ?ERRORexec
     DROPexec; Delete TOS
     $CE8F
     ;Sexec

;; FORGET
D44E
     $86; Code
     "FORGET" Name
     $D43A; Backward Link
     COLON; Complile The Following Section
     CURRENTexec
     @exec
     CONTEXTexec
     @exec
     -exec:	; Subtract TOS From NOS
     ChrLit
     $18; Literal Chr Value
     ?ERRORexec
     $D43E
     $C4AA
     $C660
     @exec
     $C7D8
     ChrLit
     $15; Literal Chr Value
     ?ERRORexec
     $C4AA
     Const0;  Push $0000 onto TOS
     $C618
     $C7F7
     ChrLit
     $15; Literal Chr Value
     ?ERRORexec
     $C4AA
     $C8C0
     $C669
     !exec
     $C8A3
     @exec
     CONTEXTexec
     @exec
     !exec
     ;Sexec

;; BACK
D498
     $84; Code
     "BACK"; Name
     $D44E; Backward Link
     COLON; Complile The Following Section
     $C739
     -exec:	; Subtract TOS From NOS
     $C755
     ;Sexec

;; BEGIN
D4A9
     $C5; Code
     "BEGIN"; Name
     $D498; Backward Link
     COLON; Complile The Following Section
     $C916
     $C739
     Const1;  Push $0001 onto TOS
     ;Sexec

;; ENDIF
D4BB
     $C5; Code
     "ENDIF"; Name
     $D4A9; Backward Link
ENDIFexec:
D4C3 COLON; Complile The Following Section
     $C916
     Const2;  Push $0002 onto TOS
     ?PAIRSexec
     $C739
     OVERexec
     -exec:	; Subtract TOS From NOS
     SWAPexec; Swap TOS with NOS
     !exec
     ;Sexec

;; THEN
D4D7
     $C4; Code
     "THEN"; Name
     $D4BB; Backward Link
D4DE COLON; Complile The Following Section
     ENDIFexec
     ;Sexec

;; DO
D4E4
     $C2; Code
     "DO"; Name
     $D4D7; Backward Link
     COLON; Complile The Following Section
     $C970
     (DO)exec
     $C739
     Const3;  Push $0003 onto TOS
     ;Sexec

;; LOOP
D4F5
     $C4; Code
     "LOOP"; Name
     $D4E4; Backward Link
     COLON; Complile The Following Section
     Const3;  Push $0003 onto TOS
     ?PAIRSexec
     $C970
     (LOOP)exec
     $D49F
     ;Sexec

;; +LOOP
D50A
     $C5; Code
     "+Loop"; Name
     $D4F5; Backward Link
     COLON; Complile The Following Section
     Const3;  Push $0003 onto TOS
     ?PAIRSexec
     $C970
     (+LOOP)exec
     $D49F
     ;Sexec

;; UNTIL
D520
     $C5; Code
     "UNTIL"; Name
     $D50A; Backward Link
     COLON; Complile The Following Section
     Const1;  Push $0001 onto TOS
     ?PAIRSexec
     $C970
     OBRANCHexec
     $D49F
     ;Sexec

;; END
D536
     $C3; Code
     "END"; Name
     $D520; Backward Link
     COLON; Complile The Following Section
     $D528
     ;Sexec

;; AGAIN
D542
     $C5; Code
     "AGAIN"; Name
     $D536; Backward Link
     COLON; Complile The Following Section
     Const1;  Push $0001 onto TOS
     ?PAIRSexec
     $C970
     $C096
     $D49F
     ;Sexec

;; 
D558
     $C6; Code
     "REPEAT"; Name
     $D542; Backward Link
     COLON; Complile The Following Section
     >Rexec
     >Rexec
     $D54A
     R>exec
     R>exec
     Const2;  Push $0002 onto TOS
     -exec:	; Subtract TOS From NOS
     $D4C3
     ;Sexec

;; 
D575
     $C2; Code
     "IF"; Name
     $D558; Backward Link
     COLON; Complile The Following Section
     $C970
     OBRANCHexec
     $C739
     Const0;  Push $0000 onto TOS
     $C755
     Const2;  Push $0002 onto TOS
     ;Sexec

;; ELSE
D58A
     $C4; Code
     "ELSE"; Name
     $D575; Backward Link
     COLON; Complile The Following Section
     Const2;  Push $0002 onto TOS
     ?PAIRSexec
     $C970
     $C096
     $C739
     Const0;  Push $0000 onto TOS
     $C755
     SWAPexec; Swap TOS with NOS
     Const2;  Push $0002 onto TOS
     $D4C3
     Const2;  Push $0002 onto TOS
     ;Sexec

;; WHILE
D5AB
     $C5; Code
     "WHILE"; Name
     $D58A; Backward Link
     COLON; Complile The Following Section
     $D57A
     $C72A
     ;Sexec

;; SPACES
D5BB
     $86; Code
     "SPACES"; Name
     $D5AB; Backward Link
SPACESexec:
D5C4 COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     $C83F
     $C858
     OBRANCHexec
     $000C for Loop Limit
     Const0;  Push $0000 onto TOS for Loop Index
     (DO)exec
     	SPACEexec
     (LOOP)exec
     $FFFC
     ;Sexec

;; <#
D5DC
     $82; Code
     "<#"; Name
     $D5BB; Backward Link
<#exec:
D5E1 COLON; Complile The Following Section
     PADexec
     HLDrefx
     !exec
     ;Sexec

;; #>
D5EB
     $82; Code
     "#>"; Name
     $D5DC; Backward Link
#>exec:
D5F0 COLON; Complile The Following Section
     DROPexec; Delete TOS
     DROPexec; Delete TOS
     HLDrefx
     @exec
     PADexec
     OVERexec
     -exec:	; Subtract TOS From NOS
     ;Sexec


;; SIGN
D602
     $84; Code
     "SIGN"; Name
     $D5EB; Backward Link
SIGNexec:
D609 COLON; Complile The Following Section
     ROTexec
     $C3F1
     OBRANCHexec
     $0007
     ChrLit
     $2D; Literal Chr Value
     $CC61
     ;Sexec

;; #
D61A
     $81; Code
     "#"; Name
     $D602; Backward Link
#exec:
D61E COLON; Complile The Following Section
     BASEexec
     @exec
     M/MODexec
     ROTexec
     ChrLit
     $09; Literal Chr Value
     OVERexec
     <exec
     OBRANCHexec
     $0007
     ChrLit
     $07; Literal Chr Value
     $C408
     ChrLit
     $30; Literal Chr Value
     $C408
     $CC61
     ;Sexec

;; #S
D641
     $82; Code
     "#S"; Name
     $D61A; Backward Link
#Sexec:
D646 COLON; Complile The Following Section
     #exec
     OVERexec
     OVERexec
     ORexec;  OR NOS with TOS
     0=exec
     OBRANCHexec
     $FFF4
     ;Sexec

;; .R
D658
     $82; Code
     ".R"; Name
     $D641; Backward Link
     COLON; Complile The Following Section
     >Rexec
     S->Dexec
     R>exec
     $D66F
     ;Sexec

;; D.R
D669
     $83; Code
     "D.R"; Name
     $D658; Backward Link
     COLON; Complile The Following Section
     >Rexec
     SWAPexec; Swap TOS with NOS
     OVERexec
     DABSexec
     <#exec
     #Sexec
     SIGNexec
     #>exec
     R>exec
     OVERexec
     -exec:	; Subtract TOS From NOS
     SPACESexec
     TYPEexec
     ;Sexec

;; D.
D68D
     $82; Code
     "D."; Name
     $D669; Backward Link
D.exec:
D692 COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     $D66F
     SPACEexec
     ;Sexec

;; .
D69C
     $81; Code
     "."; Name
     $D68D; Backward Link
.exec:
D6A0 COLON; Complile The Following Section
     S->Dexec
     D.exec
     ;Sexec

;; ?
D6A8
     $81; Code
     "?"; Name
     $D69C; Backward Link
     COLON; Complile The Following Section
     @exec
     .exec
     ;Sexec   

;; EXIT
D6B4
     $84; Code
     "EXIT"; Name
     D6A8; Backward Link
EXITexec:
D6BB COLON; Complile The Following Section
     R>exec
     DROPexec
     ;Sexec

;; 'I
D6C3
     82; Code
     "'I"; Name
     D6B4; Backward Link
D6C8 $D6CA
D6CA   L_D6CA   LDX     $00EE   
D6CC            INX  
D6CD            INX  
D6CE            INX  
D6CF            INX  
D6D0            JMP     LoadD

;; J
D6D3
     81; Code
     "J"; Name
     D6C3; Backward Pointer
     $D6D9
D6D9   L_D6D9   LDX     $00EE   
D6DB            INX  
D6DC            INX  
D6DD            INX  
D6DE            INX  
D6DF            INX  
D6E0            INX  
D6E1            JMP     LoadD

;; REBOOT
D6E4
     $86; Code
     "REBOOT"; Name
     $D6D3; Backward Link
REBOOTexec:
D6ED $D6EF
D6EF   L_D6EF   JMP     L_DD8D

;; 1-
D6F2
     $82; Code
     "1-" Name
     $D6E4; Backward Link
1-exec:		; Subtract 1 from TOS (DEC TOS)
D6F7 $D6F9
D6F9   L_D6F9   PUL A
D6FA            PUL B
D6FB            SUB B   #$01
D6FD            SBC A   #$00
D6FF            PSH B
D700            PSH A
D701   L_D701   JMP     L_C034

;; 2*
D704
     $82; Code
     "2*"; Name
     $D6F2 Backward Link
2*exec:		; Multiply TOS by 2
D709 $D70B
D70B   L_D70B   PUL A
D70C            PUL B
D70D            ASL B
D70E            ROL A
D70F            JMP     PUSHD

;; 2/
D712
     $82; Code
     "2/"; Name
     $D704; Backward Link
2/exec:
D717 $D719
D719   L_D719   PUL A
D71A            PUL B
D71B            ASR A
D71C            ROR B
D71D            JMP     PUSHD

;; 2-
D720
     $82; Code
     "2-"; Name
     $D712; Backward Link
     $D727
D727   L_D727   PUL A
D728            PUL B
D729            SUB B   #$02
D72B            SBC A   #$00
D72D            JMP     PUSHD

;; 2@
D730
     $82; Code
     "2@"; Name
     $D720; Backward Link
2@exec:		; Push Data Contained in TOS Addr to NOS/TOS (32Bit)
D735 $D737
D737   L_D737   TSX  
D738            LDX     $00,X
D73A            INS  
D73B            INS  
D73C            LDA A   $02,X
D73E            LDA B   $03,X
D740            PSH B
D741            PSH A
D742            LDA A   $00,X
D744            LDA B   $01,X
D746            JMP     PUSHD

;; 2!
D749
     $82; Code
     "2!"; Name
     $D730; Backward Link
2!exec:		; Store NOS and 2nd NOS to Addr in TOS
D74E $D750
D750   L_D750   TSX  
D751            LDX     $00,X
D753            INS  
D754            INS  
D755            PUL A
D756            PUL B
D757            STA A   $00,X
D759            STA B   $01,X
D75B            PUL A
D75C            PUL B
D75D            STA A   $02,X
D75F            STA B   $03,X
D761   L_D761   JMP     L_C034

;; 2OVER
D764
     $85; Code
     "2OVER"; Name
     $D749; Backward Link
2OVERexec:
D76C $D76E
D76E   L_D76E   TSX  
D76F            LDA A   $07,X
D771            PSH A
D772            LDA A   $06,X
D774            PSH A
D775            LDA B   $05,X
D777            LDA A   $04,X
D779            JMP     PUSHD

;; 2SWAP
D77C
     $85; Code
     "2SWAP"; Name
     $D764
2SWAPexec:
D784 $D786
D786   L_D786   DES  
D787            DES  
D788            DES  
D789            DES  
D78A            TSX  
D78B            LDA A   $0A,X
D78D            LDA B   $0B,X
D78F            STA A   $02,X
D791            STA B   $03,X
D793            LDA A   $08,X
D795            LDA B   $09,X
D797            STA A   $00,X
D799            STA B   $01,X
D79B            LDA B   #$04
D79D   L_D79D   LDA A   $04,X
D79F            STA A   $08,X
D7A1            LDA A   $00,X
D7A3            STA A   $04,X
D7A5            INX  
D7A6            DEC B
D7A7            BNE     L_D79D   
D7A9            INS  
D7AA            INS  
D7AB            INS  
D7AC            INS  
D7AD   L_D7AD   JMP     L_C034

;; 2DROP
D7B0
     $85; Code
     "2DROP"; Name
     $D77C; Backward Link
2DROPexec:	;Remove TOS and NOS
D7B8 $D7BA
D7BA   L_D7BA   INS  
D7BB            INS  
D7BC            INS  
D7BD            INS  
D7BE   L_D7BE   JMP     L_C034

;; 2DUP
D7C1
     $84; Code
     "2DUP"; Name
     $D7B0; Backward Link
2DUPexec:; Duplicate TOS/NOS
D7C8 $D7CA
D7CA   L_D7CA   DES  
D7CB            DES  
D7CC            DES  
D7CD            DES  
D7CE            TSX  
D7CF            LDA B   #$04
D7D1   L_D7D1   LDA A   $04,X
D7D3            STA A   $00,X
D7D5            INX  
D7D6            DEC B
D7D7            BNE     L_D7D1   
D7D9   L_D7D9   JMP     L_C034

;; U.
D7DC
     $82; Code
     "U."; Name
     $D7C1; Backward Link
     COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     D.exec
     ;Sexec

;; <>
D7E9
     $82; Code
     "<>"; Name
     $D7DC; Backward Link
<>exec:
D7EE $D7F0
D7F0   L_D7F0   PUL A
D7F1            PUL B
D7F2            TSX  
D7F3            SUB B   $01,X
D7F5            SBC A   $00,X
D7F7            BNE     L_D804   
D7F9            TST B
D7FA            BNE     L_D804   
D7FC            CLR A
D7FD   L_D7FD   STA A   $00,X
D7FF            STA A   $01,X
D801   L_D801   JMP     L_C034   
D804   L_D804   LDA A   #$FF
D806            BRA     L_D7FD

;; <=
D808
     $82; Code
     ",="; Name
     $D7E9; Backward Link
<=exec:
D80D $D80F
D80F   L_D80F   PUL A
D810            PUL B
D811            TSX  
D812            SUB B   $01,X
D814            SBC A   $00,X
D816            BGE     L_D820   
D818            CLR A
D819   L_D819   STA A   $00,X
D81B            STA A   $01,X
D81D   L_D81D   JMP     L_C034   
D820   L_D820   LDA A   #$FF
D822            BRA     L_D819

;; >=
D824
     $82; Code
     ">=" Name
     $D808; Backward Link
>=exec:
D829 $D82B
D82B   L_D82B   TSX  
D82C            LDA B   $03,X
D82E            LDA A   $01,X
D830            STA A   $03,X
D832            STA B   $01,X
D834            LDA B   $02,X
D836            LDA A   $00,X
D838            STA A   $02,X
D83A            STA B   $00,X
D83C            JMP     L_D80F

;; 0>
D83F
     $82; Code
     "0>" Name
     $D824; Backward Link
0>exec: ;Destructive Test of TOS for >0
D844 $D846
D846   L_D846   PUL A
D847            PUL B
D848            TST A
D849            BMI     L_D850   
D84B            BNE     L_D856   
D84D            TST B
D84E            BNE     L_D856   
D850   L_D850   CLR A; Assume FALSE
D851   L_D851   PSH A
D852            PSH A
D853   L_D853   JMP     L_C034   
D856   L_D856   LDA A   #$FF; Set TRUE
D858            BRA     L_D851

;; DUMP
D85A
     $84; Code
     "DUMP"; Name
     $D83F; Backward Link
     COLON; Complile The Following Section
     BASEexec
     @exec; Push Data Contained in TOS Addr to TOS
     >Rexec
     HEXexec
     OVERexec
     +exec for Loop Limit
     SWAPexec; Swap TOS with NOS for Loop Index
     (DO)exec
     	CRexec
     	)exec
     	LITexec; Put value that follows on TOS
     	$0000; Literal Value
     	<#exec
     	#exec
     	#exec
     	#exec
     	#exec
     	#>exec
     	TYPEexec
     	LITexec; Put value that follows on TOS
     	$0002; Literal Value
     	SPACESexec
     	)exec
     	LITexec; Put value that follows on TOS
     	$0010; Literal Value
     	+exec for Loop Limit
     	)exec for Loop Index
     	(DO)exec
     	)exec
     	C@exec
     	LITexec; Put value that follows on TOS
     	$0000; Literal Value
     	<#exec
     	#exec
     	#exec
     	#>exec
     	TYPEexec
     	SPACEexec
     (LOOP)exec
     $FFEA
     SPACEexec
     )exec
     LITexec; Put value that follows on TOS
     $0010; Literal Value
     +exec for Loop Limit
     )exec for Loop Index
     (DO)exec
     )exec
     C@exec
     DUPexec; Duplicate TOS
     LITexec; Put value that follows on TOS
     $0021; Literal Value
     <exec
     OVERexec
     LITexec; Put value that follows on TOS
     $007E; Literal Value
     >exec
     ORexec;  OR NOS with TOS
     OBRANCHexec
     $0008
     DROPexec
     LITexec; Put value that follows on TOS
     $002E; Literal Value
     EMITexec
     (LOOP)exec
     $FFDC
     LITexec; Put value that follows on TOS
     $0010; Literal Value
     (+LOOP)exec
     $FF86
     R>exec
     BASEexec
     !exec; Store NOS to Addr in TOS
     ;Sexec
     GetVar
     $0218
     GetVar
     $0216
     GetVar
     $021A
     COLON; Complile The Following Section
     $D8F7
     @exec; Push Data Contained in TOS Addr to TOS
     LITexec; Put value that follows on TOS
     $0013; Literal Value
     >exec
     OBRANCHexec
     $004F
     $."exec;  Print Literal String
     $22;	Msg Bytes
     ""Press 'Esc'to quit,'Enter'to cont."
     KEYexec
     LITexec; Put value that follows on TOS
     $001B; Literal Value
     =exec
     OBRANCHexec
     $0014
     DROPexec
     $D8FF
     @exec; Push Data Contained in TOS Addr to TOS
     BASEexec
     !exec; Store NOS to Addr in TOS
     $."exec;  Print Literal String
     $03;	Msg Bytes
     " OK"
     QUITexec
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     $D8F7
     !exec; Store NOS to Addr in TOS
     CRexec
     ;Sexec
     COLON; Complile The Following Section
     $D8FB
     @exec; Push Data Contained in TOS Addr to TOS
     LITexec; Put value that follows on TOS
     $003C; Literal Value
     >exec
     OBRANCHexec
     $001A
     CRexec
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     $D8FB
     !exec; Store NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $0001; Literal Value
     $D8F7
     +!exec; Add NOS to Addr in TOS
     $D903
     BRANCHexec
     $0026
     LITexec; Put value that follows on TOS
     $0014; Literal Value
     $D8FB
     @exec; Push Data Contained in TOS Addr to TOS
     LITexec; Put value that follows on TOS
     $0014; Literal Value
     $D1A2
     -exec:	; Subtract TOS From NOS
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     MAXexec
     LITexec; Put value that follows on TOS
     $0014; Literal Value
     MINexec
     DUPexec; Duplicate TOS
     $D8FB
     +!exec; Add NOS to Addr in TOS
     SPACESexec
     ;Sexec
     COLON; Complile The Following Section
     DUPexec; Duplicate TOS
     C@exec
     LITexec; Put value that follows on TOS
     $001F; Literal Value
     ANDexec;  AND NOS with TOS
     +exec
     LITexec; Put value that follows on TOS
     $0003; Literal Value
     +exec
     ;Sexec
     COLON; Complile The Following Section
     DUPexec; Duplicate TOS
     C@exec
     LITexec; Put value that follows on TOS
     $001F; Literal Value
     ANDexec;  AND NOS with TOS
     +exec
     1+exec
     @exec; Push Data Contained in TOS Addr to TOS
     ;Sexec
     COLON; Complile The Following Section
     DUPexec; Duplicate TOS
     C@exec
     LITexec; Put value that follows on TOS
     $001F; Literal Value
     ANDexec;  AND NOS with TOS
     DUPexec; Duplicate TOS
     $D8FB
     +!exec; Add NOS to Addr in TOS
     OVERexec
     1+exec
     SWAPexec; Swap TOS with NOS
     TYPEexec
     ;Sexec

;; VLIST
D9F6
     $85; Code
     "VLIST"; Name
     $D85A; backward Link
     COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $0050; Literal Value
     $D8FB
     !exec; Store NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     $D8F7
     !exec; Store NOS to Addr in TOS
     BASEexec
     @exec; Push Data Contained in TOS Addr to TOS
     $D8FF
     !exec; Store NOS to Addr in TOS
     HEXexec
     CONTEXTexec
     @exec; Push Data Contained in TOS Addr to TOS
     @exec; Push Data Contained in TOS Addr to TOS
     DUPexec; Duplicate TOS
     C@exec
     LITexec; Put value that follows on TOS
     $0020; Literal Value
     ANDexec;  AND NOS with TOS
     0=exec
     OBRANCHexec
     $0026
     $D962
     DUPexec; Duplicate TOS
     $D9B0
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     <#exec
     #exec
     #exec
     #exec
     #exec
     #>exec
     TYPEexec
     SPACEexec
     LITexec; Put value that follows on TOS
     $0005; Literal Value
     $D8FB
     +!exec; Add NOS to Addr in TOS
     $D9DA
     $D9C6
     DUPexec; Duplicate TOS
     OBRANCHexec
     $0006
     BRANCHexec
     $FFC2
     DROPexec
     CRexec
     $D8FF
     @exec; Push Data Contained in TOS Addr to TOS
     BASEexec
     !exec; Store NOS to Addr in TOS
     CRexec
     ;Sexec

;; RUNHR
DA70
     $85; Code
     "RUNHR"; Name
     $D9F6; Backward Link
     GetVar
     $0210

;; RUNMIN
DA7C
     $86; Code
     "RUNMIN"; Name
     $DA70; Backward Link
     GetVar
     $0211

;; RUNSEC
DA89
     $86; Code
     "RUNSEC
     $DA7C; Backward Link
     GetVar
     $0212

;; msTIMER
DA96
     $87; Code
     "msTIMER"; Name
     $DA89; Backward link
     GetVar
     $020B

;; 
DAA4
     $86; Code
     "@RUNHR" Name
     $DA96; Backward Link
     COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $0210; Literal Value
     C@exec
     ;Sexec

;; @RUNMIN
DAB7
     $87; Code
     "@RUNMIN"; Name
     $DAA4; Backward Link
     COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $0211; Literal Value
     C@exec
     ;Sexec

;; @RUNSEC
DACB
     $87; Code
     "@RUNSEC"; Name
     $DAB7
     COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $0212; Literal Value
     C@exec
     ;Sexec

;; @RUN10TH
DADF
     $88; Code
     "@RUN10TH"; Name
     $DACB; Backward Link
     COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $03E8; Literal Value
     LITexec; Put value that follows on TOS
     $020E; Literal Value
     @exec; Push Data Contained in TOS Addr to TOS
     -exec:	; Subtract TOS From NOS
     LITexec; Put value that follows on TOS
     $0064; Literal Value
     /exec
     ;Sexec

;; #RUNmsec
DB00
     $88; Code
     "#RUNmsec"
     $DADF; Backward link
     COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $03E8; Literal Value
     LITexec; Put value that follows on TOS
     $020E; Literal Value
     @exec; Push Data Contained in TOS Addr to TOS
     -exec:	; Subtract TOS From NOS
     ;Sexec

;; fNMIOFF
DB1B
     $87; Code
     "fNMIOFF"; Name
     $DB00; Backward Link
     GetVar
     $0204

;; 'EXTIRQ
DB29
     $87; Code
     "'EXTIRQ"; Name
     $DB1B; Backward Link
     GetVar
     $BFFC

;; 'EXTSWI
DB37
     $87; Code
     "'EXTSWI"; Name
     $DB29; Backward Link
     GetVar
     $BFF6

;; 'EXTNMI
DB45
     $87; Code
     "'EXTNMI"; Name
     $DB37; Backward Link
     GetVar
     $BFFA

;; 'EXTRST
DB53
     $87; Code
     "'EXTRST" Name
     $DB45; Backward Link
     GetVar
     $BFFA

;; 'EXTROM
DB61
     $87; Code
     "'EXTROM"; Name
     $DB53; Backward Link
     GetVar
     $BFFE

;; 'DP0
DB6F
     $84; Code
     "'DP0"; Name
     $DB61; Backward Link
'DP0exec:
DB76 GetVar
     $C01E

;; 'FENCE0
DB7A
     $87; Code
     "'FENCE0" Name
     $DB6F; Backward Link
     GetVar
     $C01C

;; @KERNALEND
DB88
     $8A; Code
     "@KERNALEND"; Name
     $DB7A; Backward Link
     $DB97
DB97   L_DB97   LDA A   D_DDE6   
DB9A            LDA B   D_DDE7   
DB9D            JMP     PUSHD

;; !KERNALEND
DBA0
     $8A; Code
     "!KERNALEND"; Name
     $DB88; Backward Link
     $DBAF
DBAF   L_DBAF   PUL A
DBB0            PUL B
DBB1            STA A   D_DDE6
DBB4            STA B   D_DDE7
DBB7   L_DBB7   JMP     L_C034

;; NOON
DBBA
     $84; Code     
     "NOON"; Name
     $DBA0; Backward Link
NOONexec:
DBC1 NEXT

DBC3   DB 0; This is probably an error in the code

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

 dw $FF72

;; 
DDE8
     $88; Code
     "vARIABLE; Name
     $05B3' ??? Normally this is the Backward Link
     COLON; Complile The Following Section
     DROPexec
     'DP0exec
     @exec; Push Data Contained in TOS Addr to TOS
     DUPexec; Duplicate TOS
     CONSTANTexec
     2+exec
     DUPexec; Duplicate TOS
     'DP0exec
     !exec; Store NOS to Addr in TOS
     $DB84
     !exec; Store NOS to Addr in TOS
     ;Sexec

;; aLLOT-ROM
DE0D
     $89; Code
     "aLLOT-ROM"; Name
     $DDE8; Backward Link
     COLON; Complile The Following Section
aLLOT-ROMexec:
DE1B ALLOTexec
     ;Sexec

;; aLLOT-RAM
DE1F
     $89; Code
     "aLLOT-RAM"; Name
     $DE0D; backward Link
     COLON; Complile The Following Section
aLLOT-RAMexec:
DE2D DUPexec; Duplicate TOS
     'DP0exec
     +!exec; Add NOS to Addr in TOS
     $DB84
     +!exec; Add NOS to Addr in TOS
     ;Sexec

;; aLLOT
DE39
     $85; Code
     "aLLOT"; Name
     $DE1F; Backward Link
     COLON; Complile The Following Section
     $."exec;  Print Literal String
     $2C;	Msg Bytes
     "ALLOT DISABLED. Use ALLOT-ROM or ALLOT-RAM. "
     ;Sexec

;; WRTc1
DE74
     $85; Code
     "WRTc1"; Name
     $DE39; Backward Link
WRTc1exec:
DE7C COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $DDF5; Literal Value
     NFAexec
     1+exec
     C!exec;  Store NOS (Char)  to Addr in TOS
     DUPexec; Duplicate TOS
     LITexec; Put value that follows on TOS
     $DE1B; Literal Value
     NFAexec
     1+exec
     C!exec;  Store NOS (Char)  to Addr in TOS
     LITexec; Put value that follows on TOS
     $DE2D; Literal Value
     NFAexec
     1+exec
     C!exec;  Store NOS (Char)  to Addr in TOS
     ;Sexec

;; EXTEND-KERNAL
DEA0
     $8D; Code
     "EXTEND-KERNAL"; Name
     $DE74; Backward Link
     COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $0041; Literal Value
     LITexec; Put value that follows on TOS
     $0056; Literal Value
     WRTc1exec
     ;Sexec

;; BEGIN-USER
DEBE
     $8A; Code
     "BEGIN-USER"; Name
     $DEA0; Backward Link
     COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $0061; Literal Value
     LITexec; Put value that follows on TOS
     $0076; Literal Value
     WRTc1exec
     ;Sexec

;; WARMSTART
DED9
     $8A
     "WARMSTART"; Name
     $DEBE; Backward Link
     GetVar
     $FFFF

;; PPUSHBA
DEEA
     $87; Code
     "PPUSHBA"; Name
     $DED9; Backward Link
     GetVar
     $FFEC

;; 'PUSHBA
DEF8
     $87; Code
     "'PUSHBA"; Name
     $DEEA; Backward Link
     GetVar
     $C032

;; 'PCEMIT
DF06
     $87; Code
     "'PCEMIT"; Name
     $DEF8; Backward Link
     GetVar
     $D3E3

;; 'PCKEY
DF14
     $86; Code
     "'PCKEY"; Name
     $DF06; Backward Link
     GetVar
     $D3FC

;; 'PEDIT
DF21
     $86; Code
     "'PEDIT"; Name
     $DF14; Backward Link
     GetVar
     $D0FD

;; 'PASSEM
DF2E
     $87; Code
     "'PASSEM"; Name
     $DF21; Backward Link
     GetVar
     $D0EA

;; 'PFORTH
DF3C
     $87; Code
     "'PFORTH"; Name
     $DF2E; Backward Link
     GetVar
     $D0D4

;; 0<>
DF4A
     $83; Code
     "0<>"; Name
     $DF3C; Backward Link
0<>exec:
DF50 COLON; Complile The Following Section
     0=exec
     0=exec
     ;Sexec

;; 0<=
DF58
     $83; Code
     "0<="; Name
     $DF4A; Backward Link
0<=exec:
DF5E COLON; Complile The Following Section
     Const0;  Push $0000 onto TOS
     >exec
     0=exec
     ;Sexec

;; 0>=
DF68
     $83; Code
     "0>="; Name
     $DF58; Backward Link
0>=exec:
DF6E COLON; Complile The Following Section
     0<exec ;Destructive Test of TOS for <0
     0=exec
     ;Sexec

;; D-
DF76
     $82; Code
     "D-"; Name
     $DF68; Backward Link
     COLON; Complile The Following Section
     DMINUSexec
     D+exec
     ;Sexec

;; D=
DF83
     $82; Code
     "D="; Name
     $DF76; Backward Link
     COLON; Complile The Following Section
     $DF7B
     ORexec;  OR NOS with TOS
     0=exec
     ;Sexec

;; D<>
DF92
     $83; Code
     "D<>"; Name
     $DF83; Backward Link
     COLON; Complile The Following Section
     $DF88
     0=exec
     ;Sexec

;; D<
DFA0
     $82; Code
     "D<"; Name
     $DF92; Backward Link
D<exec:
DFA5 COLON; Complile The Following Section
     $DF7B
     SWAPexec; Swap TOS with NOS
     DROPexec
     Const0;  Push $0000 onto TOS
     <exec
     ;Sexec

;; D>
DFB3
     $82; Code
     "D>"; Name
     $DFA0; Backward Link
D>exec:
DFB8 COLON; Complile The Following Section
     2SWAPexec
     D<exec
     ;Sexec

;; D<=
DFC0
     $83; Code
     "D<="; Name
     $DFB3; Backward Link
D<=exec:
DFC6 COLON; Complile The Following Section
     D>exec
     0=exec
     ;Sexec

;; D>=
DFCE
     $83; Code
     "D>="; Name
     $DFC0; Backward Link
     COLON; Complile The Following Section
     D<exec
     0=exec
     ;Sexec

;; D*
DFDC
     $82; Code
     "D*"
     $DFCE; Backward Link
D*exec:
DFE1 COLON; Complile The Following Section
     DUPexec; Duplicate TOS
     >Rexec
     OVERexec
     >Rexec
     >Rexec
     DABSexec
     R>exec
     ABSexec
     SWAPexec; Swap TOS with NOS
     OVERexec
     *exec
     >Rexec
     U)exec
     Const0;  Push $0000 onto TOS
     R>exec
     D+exec
     R>exec
     R>exec
     XORexec;  XOR NOS with TOS
     0<exec ;Destructive Test of TOS for <0
     OBRANCHexec
     $0004
     DMINUSexec
     ;Sexec

;; D/
E013
     $82; Code
     "D/"; Name
     $DFDC; Backward Link
D/exec:
E018 COLON; Complile The Following Section
     DUPexec; Duplicate TOS
     0=exec
     OBRANCHexec
     $0006
     DROPexec
     Const1;  Push $0001 onto TOS
     OVERexec
     >Rexec
     >Rexec
     DABSexec
     Rexec
     ABSexec
     /MODexec
     ROTexec
     ROTexec
     Rexec
     ABSexec
     M/MODexec
     ROTexec
     DROPexec
     ROTexec
     Const0;  Push $0000 onto TOS
     SWAPexec; Swap TOS with NOS
     D+exec
     R>exec
     R>exec
     XORexec;  XOR NOS with TOS
     0<exec ;Destructive Test of TOS for <0
     OBRANCHexec
     $0004
     DMINUSexec
     ;Sexec

;; DMAX
E05A
     $84; Code
     "DMAX"; Name
     $E013; Backward Link
     COLON; Complile The Following Section
     2OVERexec
     2OVERexec
     D<exec
     OBRANCHexec
     $0004
     2SWAPexec
     2DROPexec; Remove TOS and NOS
     ;Sexec

;; 
E073
     $84; Code
     "DMIN"; Name
     $E05A; Backward Link
     COLON; Complile The Following Section
     2OVERexec
     2OVERexec
     D>exec
     OBRANCHexec
     $0004
     2SWAPexec
     2DROPexec; Remove TOS and NOS
     ;Sexec
E08Cdref:
E08C $0001
     $0001
     $0000
     $000A
     $0002
     $0001
     $000A
     $0004
     $0001
     $000A
     $0008
     $0001
     $0064
     $0010
     $0002
     $0064
     $0020
     $0002
     $0064
     $0040
     $0002
     $03E8
     $0080
     $0003
     $03E8
     $0100
     $0003
     $03E8
     $0200
     $0003
     $2710
     $0400
     $0004
     $2710
     $0800
     $0004
     $2710
     $1000
     $0004
     $2710
     $2000
     $0004
     $2710
     $4000
     $0004

;; JSTTB`
E0E6
     $86; Code
     "JSTTB`"; Name
     $E073; Backward Link
     GetVar
     E08Cdref

;; J1
E0F3
     $82; Code
     "J1"; Name
     $E0E6; Backward Link
J1refx:;	J1refx;  Push $05BE onto TOS
E0F8 GetVar
     $05BE

;; J2
E0FC
     $82; Code
     "J2"; Name
     $E0F3; Backward Link
J2refx:
E101 GetVar
     $05C0

;; sgn1
E105
     $84; Code
     "sgn1"; Name
     $E0FC; Backward Link
sgn1exec:
E10C GetVar
     $05C2

;; 0 VARIABLE sgn2
E110
     $84; Code
     "sgn2"; Name
     $E105; Backward Link
Varsgn2:
E117 GetVar
     $05C4

;; j1
E11B
     $82; Code
     "j1"; Name
     $E110; Backward Link
     GetVar
     $05C6

;; 
E124
     $82; Code
     "j2"; Name
     $E11B; Backward Link
     GetVar
     $05C8

;; n
E12D
     $81; Code
     "n"; Name
     $E124; Backward Link
     GetVar
     $05CA

;; CALCERR
E135
     $87; Code
     "CALCERR"; Name
     $E12D; Backward Link
     GetVar
     $05CC

;; n1
E143
     $82; code
     "n1"; Name
     $E135; Backward Link
n1exec:
E148 GetVar
     $05CE

;; n2
E14C
     $82; Code
     "n2" Name
     $E143; Backward Link
n2exec:
E151 GetVar
     $05D4

;; nF/
E155
     $83; Code
     "nF/"; name
     $E14C; Backward Link
     COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $8001; Literal Value
     MAXexec
     >Rexec
     >Rexec
     LITexec; Put value that follows on TOS
     $8001; Literal Value
     MAXexec
     R>exec
     R>exec
     DUPexec; Duplicate TOS
     0=exec
     OBRANCHexec
     $0016
     2DROPexec; Remove TOS and NOS
     2DROPexec; Remove TOS and NOS
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     $E13F
     !exec; Store NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $000A; Literal Value
     Const1;  Push $0001 onto TOS
     EXITexec
     DUPexec; Duplicate TOS
     Varsgn2; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     SWAPexec; Swap TOS with NOS
     J2refx
     !exec; Store NOS to Addr in TOS
     ABSexec
     LITexec; Put value that follows on TOS
     $0010; Literal Value for Loop Limit
     Const0;  Push $0000 onto TOS for Loop Index
     (DO)exec
     	)exec
     	$E129
     	!exec; Store NOS to Addr in TOS
     	DUPexec; Duplicate TOS
     	LITexec; Put value that follows on TOS
     	$3E80; Literal Value
     	>exec
     	OBRANCHexec
     	$0008
     	LEAVEexec
     	BRANCHexec
     	$0004
     	2*exec; Multiply TOS by 2; (Arithmetic Shift Left TOS)
     (LOOP)exec
     $FFE4
     >Rexec
     DUPexec; Duplicate TOS
     sgn1exec
     !exec; Store NOS to Addr in TOS
     SWAPexec; Swap TOS with NOS
     J1refx;  Push $05BE onto TOS
     !exec; Store NOS to Addr in TOS
     ABSexec
     LITexec; Put value that follows on TOS
     $0010; Literal Value for Loop Limit
     Const0;  Push $0000 onto TOS for Loop Index
     (DO)exec
     )exec
     $E120
     !exec; Store NOS to Addr in TOS
     DUPexec; Duplicate TOS
     LITexec; Put value that follows on TOS
     $3E80; Literal Value
     >exec
     OBRANCHexec
     $0008
     LEAVEexec
     BRANCHexec
     $0004
     2*exec; Multiply TOS by 2; (Arithmetic Shift Left TOS)
     (LOOP)exec
     $FFE4
     LITexec; Put value that follows on TOS
     $2710; Literal Value
     LITexec; Put value that follows on TOS
     $FFFC; Literal Value
     J1refx;  Push $05BE onto TOS
     +!exec; Add NOS to Addr in TOS; Store NOS to Addr in TOS
     R>exec
     */exec
     $E129
     @exec; Push Data Contained in TOS Addr to TOS
     $E120
     @exec; Push Data Contained in TOS Addr to TOS
     -exec:	; Subtract TOS From NOS
     DUPexec; Duplicate TOS
     0>exec ;Destructive Test of TOS for >0
     OBRANCHexec
     $0028
     LITexec; Put value that follows on TOS
     $0006; Literal Value
     *exec
     $E0EF
     +exec
     DUPexec; Duplicate TOS
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     +exec
     @exec; Push Data Contained in TOS Addr to TOS
     J1refx;  Push $05BE onto TOS
     +!exec; Add NOS to Addr in TOS
     DUPexec; Duplicate TOS
     2+exec
     @exec; Push Data Contained in TOS Addr to TOS
     SWAPexec; Swap TOS with NOS
     @exec; Push Data Contained in TOS Addr to TOS
     */exec
     Const0;  Push $0000 onto TOS
     DUPexec; Duplicate TOS
     0<exec ;Destructive Test of TOS for <0
     OBRANCHexec
     $0036
     ABSexec
     LITexec; Put value that follows on TOS
     $0006; Literal Value
     *exec
     $E0EF
     +exec
     DUPexec; Duplicate TOS
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     +exec
     @exec; Push Data Contained in TOS Addr to TOS
     1-exec; Subtract 1 from TOS (DEC TOS)
     MINUSexec
     J1refx;  Push $05BE onto TOS
     +!exec; Add NOS to Addr in TOS
     DUPexec; Duplicate TOS
     @exec; Push Data Contained in TOS Addr to TOS
     LITexec; Put value that follows on TOS
     $000A; Literal Value
     /exec
     SWAPexec; Swap TOS with NOS
     2+exec
     @exec; Push Data Contained in TOS Addr to TOS
     */exec
     BRANCHexec
     $0004
     DROPexec
     sgn1exec
     @exec; Push Data Contained in TOS Addr to TOS
     Varsgn2; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     XORexec;  XOR NOS with TOS
     0<exec ;Destructive Test of TOS for <0
     OBRANCHexec
     $0004
     MINUSexec
     J1refx;  Push $05BE onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     J2refx
     @exec; Push Data Contained in TOS Addr to TOS
     -exec:	; Subtract TOS From NOS
     SWAPexec; Swap TOS with NOS
     ;Sexec

;; nF*
E29D
     $83; Code
     "nF*"; Name
     $E155; Backward Link
     COLON; Complile The Following Section
     LITexec; Put value that follows on TOS
     $8001; Literal Value
     MAXexec
     >Rexec
     >Rexec
     LITexec; Put value that follows on TOS
     $8001; Literal Value
     MAXexec
     R>exec
     R>exec
     DUPexec; Duplicate TOS
     0=exec
     OBRANCHexec
     $0016
     2DROPexec; Remove TOS and NOS
     2DROPexec; Remove TOS and NOS
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     $E13F
     !exec; Store NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $000A; Literal Value
     Const1;  Push $0001 onto TOS
     EXITexec
     DUPexec; Duplicate TOS
     Varsgn2; Push Var Addr onto TOS
     !exec; Store NOS to Addr in TOS
     SWAPexec; Swap TOS with NOS
     J2refx
     !exec; Store NOS to Addr in TOS
     ABSexec
     >Rexec
     DUPexec; Duplicate TOS
     sgn1exec
     !exec; Store NOS to Addr in TOS
     SWAPexec; Swap TOS with NOS
     J1refx;  Push $05BE onto TOS
     !exec; Store NOS to Addr in TOS
     ABSexec
     Const0;  Push $0000 onto TOS
     R>exec
     D*exec
     2DUPexec; Duplicate TOS/NOS
     LITexec; Put value that follows on TOS
     $7FFE; Literal Value
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     D>exec
     OBRANCHexec
     $001A
     LITexec; Put value that follows on TOS
     $000A; Literal Value
     M/MODexec
     Const1;  Push $0001 onto TOS
     J1refx;  Push $05BE onto TOS
     +!exec; Add NOS to Addr in TOS
     ROTexec
     $E131
     !exec; Store NOS to Addr in TOS
     Const0;  Push $0000 onto TOS
     BRANCHexec
     $0006
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     OBRANCHexec
     $FFD2
     DROPexec
     $E131
     @exec; Push Data Contained in TOS Addr to TOS
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     >exec
     OBRANCHexec
     $0004
     1+exec
     sgn1exec
     @exec; Push Data Contained in TOS Addr to TOS
     Varsgn2; Push Var Addr onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     XORexec;  XOR NOS with TOS
     0<exec ;Destructive Test of TOS for <0
     OBRANCHexec
     $0004
     MINUSexec
     J1refx;  Push $05BE onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     J2refx
     @exec; Push Data Contained in TOS Addr to TOS
     +exec
     SWAPexec; Swap TOS with NOS
     ;Sexec

;; nF-
E35B
     $83; Code
     "nF-"; Name
     $E29D; Backward Link
nF-exec:
E361 COLON; Complile The Following Section
     DUPexec; Duplicate TOS
     0<exec ;Destructive Test of TOS for <0
     OBRANCHexec
     $000A
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     BRANCHexec
     $0004
     Const0;  Push $0000 onto TOS
     n2exec
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     J2refx
     !exec; Store NOS to Addr in TOS
     DUPexec; Duplicate TOS
     0<exec ;Destructive Test of TOS for <0
     OBRANCHexec
     $000A
     LITexec; Put value that follows on TOS
     $FFFF; Literal Value
     BRANCHexec
     $0004
     Const0;  Push $0000 onto TOS
     n1exec
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     J1refx;  Push $05BE onto TOS
     !exec; Store NOS to Addr in TOS
     J1refx;  Push $05BE onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     J2refx
     @exec; Push Data Contained in TOS Addr to TOS
     -exec:	; Subtract TOS From NOS
     DUPexec; Duplicate TOS
     0>exec ;Destructive Test of TOS for >0
     OBRANCHexec
     $0024
     DUPexec; Duplicate TOS
     n1exec
     2@exec
     ROTexec for Loop Limit
     Const0;  Push $0000 onto TOS for Loop Index
     (DO)exec
     	LITexec; Put value that follows on TOS
     	$000A; Literal Value
     	D*exec
     (LOOP)exec
     $FFF8
     n1exec
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     J2refx
     @exec; Push Data Contained in TOS Addr to TOS
     J1refx;  Push $05BE onto TOS
     !exec; Store NOS to Addr in TOS
     DUPexec; Duplicate TOS
     0<exec ;Destructive Test of TOS for <0
     OBRANCHexec
     $0026
     DUPexec; Duplicate TOS
     ABSexec
     n2exec
     2@exec
     ROTexec for Loop Limit
     Const0;  Push $0000 onto TOS for Loop Index
     (DO)exec
     	LITexec; Put value that follows on TOS
     	$000A; Literal Value
     	D*exec
     (LOOP)exec
     $FFF8
     n2exec
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     J1refx;  Push $05BE onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     J2refx
     !exec; Store NOS to Addr in TOS
     DROPexec
     n1exec
     2@exec
     n2exec
     2@exec
     $DF7B
     DUPexec; Duplicate TOS
     >Rexec
     DABSexec
     LITexec; Put value that follows on TOS
     $000A; Literal Value
     D*exec
     LITexec; Put value that follows on TOS
     $FFFF
     J1refx;  Push $05BE onto TOS
     +!exec; Add NOS to Addr in TOS
     Const1;  Push $0001 onto TOS
     J1refx;  Push $05BE onto TOS
     +!exec; Add NOS to Addr in TOS
     LITexec; Put value that follows on TOS
     $000A; Literal Value
     D/exec
     2DUPexec; Duplicate TOS/NOS
     LITexec; Put value that follows on TOS
     $7FFF; Literal Value
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     D<=exec
     OBRANCHexec
     $FFE6
     DROPexec
     R>exec
     0<exec ;Destructive Test of TOS for <0
     OBRANCHexec
     $0004
     MINUSexec
     J1refx;  Push $05BE onto TOS
     @exec; Push Data Contained in TOS Addr to TOS
     SWAPexec; Swap TOS with NOS
     ;Sexec

;; nF+
E447
     $83; Code
     "nF+"; Name
     $E35B; Backward Link
     COLON; Complile The Following Section
     MINUSexec
     nF-exec
     ;Sexec

;; n3
E455
     $82; Code
     "n3"; Name
     $E447; Backward Link
     GetVar
     $05DA

;; Fsgn
E45E
     $84; Code
     "Fsgn"; Name
     $E455; Backward Link
     GetVar
     $05E0

;; nF*/
E469
     $84; Code
     "nF*/"; name
     $E45E; Backward Link
     COLON; Complile The Following Section
     DUPexec; Duplicate TOS
     $E465
     !exec; Store NOS to Addr in TOS
     ABSexec
     $E45A
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     DUPexec; Duplicate TOS
     $E465
     @exec; Push Data Contained in TOS Addr to TOS
     XORexec;  XOR NOS with TOS
     $E465
     !exec; Store NOS to Addr in TOS
     ABSexec
     n2exec
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     DUPexec; Duplicate TOS
     $E465
     @exec; Push Data Contained in TOS Addr to TOS
     XORexec;  XOR NOS with TOS
     $E465
     !exec; Store NOS to Addr in TOS
     ABSexec
     n1exec
     2!exec; Store NOS and 2nd NOS to Addr in TOS
     n1exec
     2+exec
     @exec; Push Data Contained in TOS Addr to TOS
     n2exec
     2+exec
     @exec; Push Data Contained in TOS Addr to TOS
     +exec
     $E45A
     2+exec
     @exec; Push Data Contained in TOS Addr to TOS
     -exec:	; Subtract TOS From NOS
     $E45A
     2+exec
     !exec; Store NOS to Addr in TOS
     n1exec
     @exec; Push Data Contained in TOS Addr to TOS
     S->Dexec
     n2exec
     @exec; Push Data Contained in TOS Addr to TOS
     D*exec
     $E45A
     @exec; Push Data Contained in TOS Addr to TOS
     D/exec
     2DUPexec; Duplicate TOS/NOS
     LITexec; Put value that follows on TOS
     $7530; Literal Value
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     D>exec
     OBRANCHexec
     $003C
     LITexec; Put value that follows on TOS
     $000A; Literal Value
     M/MODexec
     ROTexec
     n1exec
     !exec; Store NOS to Addr in TOS
     Const1;  Push $0001 onto TOS
     LITexec; Put value that follows on TOS
     $05DC; Literal Value
     +!exec; Add NOS to Addr in TOS
     2DUPexec; Duplicate TOS/NOS
     LITexec; Put value that follows on TOS
     $7530; Literal Value
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     D<exec
     OBRANCHexec
     $FFDE
     n1exec
     LITexec; Put value that follows on TOS
     $0004; Literal Value
     >exec
     OBRANCHexec
     $000C
     LITexec; Put value that follows on TOS
     $0001; Literal Value
     LITexec; Put value that follows on TOS
     $0000; Literal Value
     D+exec
     DROPexec
     LITexec; Put value that follows on TOS
     $05DC; Literal Value
     @exec; Push Data Contained in TOS Addr to TOS
     SWAPexec; Swap TOS with NOS
     $E465
     @exec; Push Data Contained in TOS Addr to TOS
     0<exec ;Destructive Test of TOS for <0
     OBRANCHexec
     $0004
     MINUSexec
     ;Sexec

;; DELAY[ms]
E677
     $89; Code
     "DELAY[ms]"; Name
     $E640; Backward Link
DELAY[ms]exec:
E683 $C53C
     $C5B9
     $C83F
     $E53D
     $C4AA
     $DAA0
     $C4E7
     $D80D
     $C0A2
     $FFF6
     $C483
     $C37E

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

;; 0 VARIABLE BUF2pntr
F230
     $88; Code
     "BUF2pntr"; Name
     $F221; Backward Link
VarBUF2pntr:
F23B GetVar
     $0624

;; CLR-CHRBUF1
F23F
     $8B; Code
     "CLR-CHRBUF1"; Name
     $F230; Backward Link
CLR-CHRBUF1exec:
F24D $C53C
     $F20F
     $F201
     $C408
     $F20F
     $C113
     $C05D
     $0020
     $C130
     $C516
     $C0CE
     $FFF6
     $F20F
     $F22C
     $C507
     $C37E

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

