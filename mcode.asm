;System Variable Assignments
XSafe    equ $00EC
TickCtr	 equ $020E

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
msTIMER		equ $020B; VarmsTIMER	equ $DAA2; MSTimer
// DIM MSTimer AS INTEGER

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
// DIM RDlta AS LONG
fNFg>Lim	equ $0F1A; VarfNFg>Lim equ $410E; OverLimit
// DIM OverLimit AS INTEGER
fOffset		equ $0F1C; VarfOffset	equ $411C; FOffset
// DIM FOffset AS INTEGER
fGERR		equ $0F1E; VarfGERR	equ $44A8; FGErr
// DIM FGErr AS INTEGER
AVE[S/R]   *8 	equ $0F20; VarAVE[S/R]	equ $4754; AverSigRef
// DIM AverSigRef(8) AS LONG
SIG[Ave]   *8	equ $0F2A; VarSIG[Ave]	equ $4763; SigAver
// DIM SigAver(8) AS LONG
REF[Ave]	equ $0F34; VarREF[Ave]	equ $4772; RefAver
// DIM RefAver(8) AS LONG
SIG[Ave]/REF[Ave] equ $0F3E ; VarSIG[Ave]/REF[Ave] equ 478A; SigRefAver
// DIM SigRefAver AS LONG
SIGQUE	 *200	equ $0F48; VarSIGQUE	equ $47C5; SigQue
// DIM SigQue(200) AS INTEGER
REFQUE		equ $1012; VarREFQUE	equ $47D2; RegQue
// DIM RefQue(200) AS INTEGER
S/RQUE	 *200	equ $10DC; VarS/RQUE	equ $47C9; SigRefQue
// DIM SigRefQue(200) AS INTEGER
#SMPLS		equ $11A6; Var#SMPLS	equ Varf1stTEST; NumSamples
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
TMPhrs		equ $11E8; VarTMPhrs	equ $53F3; TmpHours
// DIM TmpHours AS INTEGER
CLKERRcnt	equ $11EA; VarCLKERRcnt	equ $5403; ClkErrCnt
// DIM ClkErrCnt AS INTEGER
fPM		equ $11EC; VarfPM	equ $540D; PMFlag
// DIM PMFlag AS BOOLEAN
PRNBUF1		equ $12F0; VarPRNBUF1	equ $8048; PrintBuf1
// DIM PrintBuf1 AS STRING*41
PRNBUF2		equ $131B; VarPRNBUF2	equ $8056; PrintBuf2
// DIM PrintBuf2 AS STRING*41
fNMIOFF		equ $0204; VarfNMIOFF	equ $DB25; NMIOffFlag
// DIM NMIOffFlag AS BOOLEAN
J1		equ $05BE; VarJ1	equ $E0F8; J1
// DIM J1 AS INTEGER
J2		equ $05C0; VarJ2	equ $E101; J2
// DIM J2 AS INTEGER
sgn1		equ $05C2; Varsgn1	equ $E10C; Sgn1
// DIM Sgn1 AS INTEGER
sgn2		equ $05C4; Varsgn2	equ $E117; Sgn2
// DIM Sgn2 AS INTEGER
j1		equ $05C6; Varj1	equ $E120; j1
// DIM J1 AS INTEGER
j2		equ $05C8; Varj2	equ $E120; j1
// DIM J2 AS INTEGER
n		equ $05CA; Varn		equ $E131; n
// DIM n AS INTEGER
CALCERR		equ $05CC; VarCALCERR	equ $E13F; CalcErr
// DIM CalcErr AS INTEGER
n1		equ $05CE; Varn1	equ $E148; n1
// DIM n1(6) AS INTEGER
n2		equ $05D4; Varn2	equ $E151; n2
// DIM n2(6) AS INTEGER
n3		equ $05DA; Varn3	equ $E45A; n3
// DIM n3 AS INTEGER
Fsgn		equ $05E0; VFsgn	equ $E465; FSgn
// DIM FSgn AS INTEGER

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
GLimit		equ 1000; ConstGLimit	equ $40FF; GLimit
// CONST GLimit=1000
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
MDELAY		equ $0000; ConstMDELAY	equ $84F2; MDelay
// CONST MDelay=$0000
MUNITS		equ $0002; ConstMUNITS	equ $84FF; MUnits
// CONST MUnits=$0002
MFORMAT		equ $0004; ConstMFORMAT	equ $850D; MFormat
// CONST MFormat=$0004
HCALVLU		equ $0006; ConstHCALVLU	equ $851B; HiCalValue
// CONST HiCalValue=$0006
LCALVLU		equ $000C; ConstLCALVLU	equ $8529; LoCalValue
// Const LoCalValue=$000C
MDATE		equ $0012; ConstMDATE	equ $8503; MDate
// Const MDate=$0012
MCKSUM		equ $001A; ConstMCKSUM	equ $8542; MChecksum
// CONST MChecksum=$001A
MDEFAULT	equ $8546; ConstMDEFAULT equ $856D; MDefault
// CONST MDefault=$8546
VBOOT		equ $0556; ConstVBOOT	equ $D02B; VBoot
// CONST VBoot=$0556
RUNHR		equ $0210; ConstRUNHR	equ $DA78; RunHour
// CONST RunHour=$0210
RUNMIN		equ $0211; ConstRUNMIN	equ $DA85; RunMinute
// CONST RunMinute=$0211
RUNSEC		equ $0212; ConstRUNSEC	equ $DA92; RunSecond
// CONST RunSecond=$0212
'EXTIRQ		equ $BFFC; Const'EXTIRQ	equ $DB33; ExtIRQ
// CONST ExtIRQ=$BFFC
'EXTSWI		equ $BFF6; Const'EXTSWI	equ $DB41; ExtSWI
// CONST ExtSWI=$BFF6
'EXTNMI		equ $BFFA; Const'EXTNMI	equ $DB4F; ExtNMI
// CONST ExtNMI=$BFFA
'EXTRST		equ $BFFA; Const'EXTRST	equ $DB5D; ExtRST
// CONST ExtRST=$BFFA
'EXTROM		equ $BFFE; Const'EXTROM	equ $DB6B; ExtROM
// CONST ExtROM=$BFFE
'DP0		equ $C01E; Const'DP0	equ $C01E; DP0
// CONST DP0=$C01E
'FENCE0		equ $C01C; Const'FENCE0	equ $DB84; Fence
// CONST XFence=$C01C
WARMSTART	equ $FFFF; ConstWARMSTART equ $DEE6; WarmStart
// CONST WarmStart=$FFFF
PPUSHBA		equ $FFEC; ConstPPUSHBA	equ $DEF4; PPushBA
// CONST PPushBA=$FFEC
'PUSHBA		equ $C032; Const'PUSHBA	equ $DF02; XPushBA
// CONST XPushBA=$C032
'PCEMIT		equ $DF10; Const'PCEMIT	equ $DF10; XPCEmit
// CONST XPCEmit=$DF10
'PCKEY		equ $D3FC; Const'PCKEY	equ $DF1D; XPCKey
// CONST XPCKey=$D3FC
'PEDIT		equ $D0FD; Const'PEDIT	equ $DF2A; XPEdit
// CONST XPEdit=$D0FD
'PASSEM		equ $D0EA; Const'PASSEM	equ $DF38; XPAssember
// CONST XPAssember=$D0EA
'PFORTH		equ $DF46; Const'PFORTH	equ $DF46; XPForth
// CONST XPForth=$DF46
JSTTB`		equ $E08C; ConstJSTTB`	equ $E0EF; JSTTB
// CONST JSTTB=$E08C


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
Key	  equ $7003
MuxControl equ $7007

2000

 DW $13F0, $F0D0, $5B24, $5B45, $B8CE, $0000, $0000, $0000

;; 2000 RAMadr
2010
	$86; Code
	"RAMadr"; Name
	$FF48; Backward Link
ConstRAMadr:
2019	GetVar
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
	ROTexec;    Rotate top 3 on stack
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

;; METHODQ
20DD
	$87; Code
	"METHODQ"; Name
	$20CA
ConstMETHODQ:
	GetVar
	$0A8E

;; METHOD#
20EB
	$87; Code
	"METHOD#"; Name
	$20DD; Backward Link
VarMETHOD#
20F5	GetVar
	$0DD6

;; `55AA'
2059
	$86; Code
	"`55AA'
	$20EB; Backward Link
Var`55AA':
2102	GetVar
	$0DD8

;; MQsiz
2106
	$85; Code
	"MQsiz" Name
	$20F9; Backward Link
ConstMQsiz:
210E	GetVar
	$034C

;; RESTPARS
212B
	$88; Code
	"RESTPARS" Name
	$211F; Backward Link
ConstRESTPARS:
2136	GetVar
	0DE2	

;; SMPLDLY
213A
	$87; Code
	"SMPLDLY"; Name
	$212B; Backward Link
ConstSMPLDLY:
2144	GetVar
	$0DE2

;; PPM/PPB
2148
	$87; Code
	"PPM/PPB"; Name
	$213A; Backward Link
VarPPM/PPB:
2152 GetVar
	$0DE4

;; FORMAT
2156
	$86; Code
	"FORMAT"; Name
	$2148; Backward Link
VarFORMAT:
215F	GetVar
	$0DE6

;; CALIBVLU
2163
	$88; Code
	"CALIBVLU"; Name
	$2156; Backward Link
VarCALIBVLU:
216E GetVar
	$0DE8

;; BLNKVLU
2172
	$87; Code
	"BLNKVLU"; Name
	$2163; Backward Link
VarBLNKVLU:
217C GetVar
	$0DEE

;; CALDATE
2180
	$87; Code
	"CALDATE"; Name
	$2172; Backward Link
VarCALDATE:
218A	GetVar
	$0DF4

;; CALTIME
218E
	$87; Code
	"CALTIME"; Name
	$2180; Backward LinkC576 0DFD
VarCALTIME:
2198	C576
	$0DFD

;; CALdata
219C
	$87; Code
	"CALdata"; Name
	$218E; Backward Link
VarCALdata:
21A6	GetVar
	$0E08

;; CALdata
219C
	$87; Code
	"CALdata; Name
	$219C; Backward Link
VarCALdata:
21A6 GetVar
	$0E0E

;; CAL%Dlta
21AA
	$88; Code
	"CAL%Dlta"; Name
	$219C; Backward Link
VarCAL%Dlta:
21B5	GetVar
	$0E0E

;; BLANK%Dlta
21B9
	$88; Code
	"BLANK%Dlta"; Name
	$21AA
VarBLANK%Dlta:
21C6	GetVar
	$0E10

;;; 0 VARIABLE GAINlimit
21CA
	$89; Code
	"GAINlimit"; Name
	$21B9; Backward Link
VarGAINlimit:
21D6	GetVar
	$0E12

;;; 0 VARIABLE BLANKdata 16 ALLOT-RAM
21DA
	$89; Code
	"BLANKdata"; Name
	$21CA; Backward Link
VarBLANKdata:
21E6	GetVar
	$0E14

;;; 0 VARIABLE TESTRTN
21EA
	$87; Code
	"TESTRTN"; Name
	$21DA; Backward Link
VarTESTRTN:
21F4	GetVar
	$0E26

;;; 0 VARIABLE CALflg
21F8
	$86; Code
	"CALflg"; Name
	$21EA; Backward Link
VarCALflg:
2201	GetVar
	$0E28

;;; 0 VARIABLE CALok
2205
	$85; Code
	"CALok"; Name
	$21F8; Backward Link
VarCALok:
220D	GetVar
	$0E2A

;;; 0 VARIABLE TESTR0
2211
	$86; Code
	"TESTR0"; Name
	$2205; Backward Link
VarTESTR0:
221A	GetVar
	$0E2C

;;; 0 VARIABLE fABORT
221E
	$86; Code
	"fABORT" Name
	$2211; Backward Link
VarfABORT:
2227	GetVar
	$0E2E

;;; 0 VARIABLE CLKBUF 30 ALLOT-RAM
222B
	$86; Code
	"CLKBUF"; Name
	$221E; Backward Link
VarCLKBUF:
2234	GetVar
	$0E30

;;; 0 VARIABLE MUXset
2238
	$86; Code
	"MUXset"; Name
	$222B; Backward Link
VarMUXset:
2241	GetVar
	$0E50

;;; LITEstat CONSTANT MUXstat
2245
	$87; Code
	"MUXstat"; Name
	$2238; Backward Link
VarMUXstat:
224F	GetVar
	$05E4

;;; 7007 CONSTANT CHANmux
2253
	$87; Code
	"CHANmux"; Name
	$2245; Backward Link
ConstCHANmux:
225D	GetVar
	$7007

;;; 0 VARIABLE fDSPLY
2261
	$86; Code
	"fDSPLY"; Name
	$2253; Backward Link
VarfDSPLY:
226A	GetVar
	$0E52

;;; 0 VARIABLE fVIAL
226E
	$85; Code
	"fVIAL"; Name
	$2261; Backward Link
VarfVIAL:
2276	GetVar
	$0E54

;;; 0 VARIABLE RESULTS 12 ALLOT-RAM
227A
	$87; Code
	"RESULTS"; Name
	$226E; Backward Link
VarRESULTS:
2284	GetVar
	$0E56

;; 0 VARIABLE nFresult
2288
	$88; Code
	"nFresult"; Name
	$227A; Backward Link
VarnFresult:
2293	GetVar
	$0E64

;; 0 VARIABLE >990err
2297
	$87; Code
	">990err"; Name
	$2288; Backward Link
Var>990err:
22A1	GetVar
	$0E6E

;; 0 VARIABLE QAflg
22A5
	$85; Code
	"QAflg"; Name
	$2297; Backward Link
VarQAflg:
22AD	GetVar
	$0E70

;; SET-TESTrtn
22B1
	$8B; Code
	"SET-TESTrtn"; Name
	$22A5; Backward Link
SET-TESTrtnexec:
22BF	COLON
	R>exec;   Retrieve TOS from return stack.
	VarTESTRTN
	@exec; Push Data Contained in TOS Addr to TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$000A
	   BEGIN
			R>exec;   Retrieve TOS from return stack.
			0=exec; Set TOS to TRUE if 0, ELSE FALSE
		OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
		$FFFA
	ENDIF
	DUPexec; Duplicate TOS
	VarTESTRTN
	!exec; Store NOS to Addr in TOS
	Const0;  Push $0000 onto TOS
	>Rexec; Move TOS to Return Stack
	>Rexec; Move TOS to Return Stack
	Const0;  Push $0000 onto TOS
	VarfTEST
	!exec; Store NOS to Addr in TOS
	INIT-keyQexec
	;Sexec

;; TESTrtn
22E8
	$87; Code
	"TESTrtn"; Name
	$22B1; Backward Link
TESTrtnexec:
22F3	COLON; Complile The Following Section
	S0exec
	@exec
	SP!exec
	BEGIN
		R>exec;   Retrieve TOS from return stack.
		0=exec; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
	$FFFA
	Const0;  Push $0000 onto TOS
	>Rexec; Move TOS to Return Stack
	VarTESTRTN
	@exec
	>Rexec; Move TOS to Return Stack
	Const0;  Push $0000 onto TOS
	VarfTEST
	!exec; Store NOS to Addr in TOS
	Const0;  Push $0000 onto TOS
	VarQAflg
	!exec; Store NOS to Addr in TOS
	INIT-keyQexec
	;Sexec

231D $DBC1
;; 'TEST
231F
	$85; Code
	"'TEST"; Name
	$22E9; Backward Link
'TESTexec:
2327	GetVar
	$231D

232B [METHOD&CALIB]
;; 'RECAL
232D
	$86; Code
	"'RECAL";
	$231F; Backward Link
Ptr'RECAL:
2336	GetVar
	$232B

233A [DO-TEST]
;; 'DO-TEST
233C
	$88; Code
	"'DO-TEST"; Name
	$232D; Backward Link
Ptr'DO-TEST:
2347	GetVar
	$233A

234B [F#CNVRT]
;; 'F#CNVRT
234D
	$88; Code
	"'F#CNVRT"; Name
	$233C; Backward Link
Ptr'F#CNVRT:
2358	GetVar
	$234B

235C [711ROM]
;; '711ROM
235E
	$87; Code
	"'711ROM"; Name
	$234D; Backward Link
Ptr'711ROM:
2368	GetVar
	$235C

236C [711TESTS]
;; '711TESTS
236E
	$89; Code
	"'711TESTS"; Name
	$235E; Backward Link
Ptr'711TESTS:
237A	GetVar
	$236C

237E [DATE/TIME]
;; 'DATE/TIME
2380
	$8A; Code
	"'DATE/TIME"; Backward Link
	"236E; Backward Link
Ptr'DATE/TIME:
238D	GetVar
	$237E

2391 [PRINT-CALIB]
;; 'PRINT-CALIB
2393
	$8C; Code
	"'PRINT-CALIB"; Name
	$2380; Backward Link
Ptr'PRINT-CALIB:
23A2	GetVar
	$2391

23A6 [PRINT-RESULTS]
;; 'PRINT-RESULTS
23A8
	$8E; Code
	"'PRINT-RESULTS"
	$2393; Backward Link
Ptr'PRINT-RESULTS:
23B6	GetVar
	$23A6

23BD [PRNTRDaTm]
;; 'PRNTRDaTm
23BF
	$8A; Code
	"'PRNTRDaTm"; Name
	$23A8; Backward Link
Ptr'PRNTRDaTm:
23CC	GetVar
	$23BD

23D0 [GET-SMPL#]
;; 'GET-SMPL#
23D2
	$8A; Code
	"'GET-SMPL#"; Name
	$23BF; Backward Link
Ptr'GET-SMPL#:
23DF	GetVar
	$23D0
 
23E3 [CALC-CHKSUM2]
;; 'CALC-CHKSUM2
23E5
	$8D; Code
	"'CALC-CHKSUM2"; Name
	$23D2; Backward Link
Ptr'CALC-CHKSUM2:
23F5	GetVar
	$23E3

23F9 [CkROM8exec]
;; 'CALC-CHKSUM8
23FB
	$8D; Code
	"'CALC-CHKSUM8"; Name
	$23E5; Backward Link
Ptr'CALC-CHKSUM8:
240B	GetVar
	$23F9

240F [INIT-OPTIONS]
;; 'INIT-OPTIONS
2411
	$8D; Code
	"INIT-OPTIONS"; Name
	$23FB; Backward Link
'INIT-OPTIONS
2420	GetVar
	$240F

2425 [PRNTcrlf]
;; 'PRNTcrlf
2427
	$89; Code
	"'PRNTcrlf"; Name
	$2411; Backward Link
Ptr'PRNTcrlf:
2433	GetVar
	$2425

2437 [PRNTRoff]
;; 'PRNTRoff
2439
	$89; Code
	"'PRNTRoff"; Name
	$2427; Backward Link
Ptr'PRNTRoff:
2445	GetVar
	$2437

2449 [INIT-PRINTER]
;; 'INIT-PRINTER
244B
	$8D; Code
	"'INIT-PRINTER"; Name
	"2439; Backward Link
Ptr'INIT-PRINTER:
245B	GetVar
	$2449

245F [COMNTS]
;; 'COMNTS
2461
	$87; Code
	"'COMNTS"; Name
	$244B; Backward Link
Ptr'COMNTS:
246B	GetVar
	$245F

246F [WAIT-PRNTCLR]
;; 'WAIT-PRNTCLR
2471
	$8D; Code
	"'WAIT-PRNTCLR
	$2461; Backward Link
Ptr'WAIT-PRNTCLR
2481	GetVar
	$246F

2485 RECHECK-PRNTR
;; 'RECHECK-PRNTR
2487
	$8E; Code
	"'RECHECK-PRNTR"; Name
	$2471; Backward Link
Ptr'RECHECK-PRNTR:
2498	GetVar
	$2485

249C [@TSTBYTE]
;; '@TSTBYTE
249E
	$89; Code
	"'@TSTBYTE"; Name
	$2487; Backward Link
Ptr'@TSTBYTE:
24AA	GetVar
	$249C

24AE [DO-RUNIn]
;; 'DO-RUNIn
24B0
	$89; Code
	"'DO-RUNIn"
	$249E; Backward Link
Ptr'DO-RUNIn:
24BC	GetVar
	$24AE

24C0 [TrigDly]
;; 'TrigDly
24C2
	$88; Code
	"'TrigDly"; Name
	$24B0; Backward Link
Ptr'TrigDlyrefx:
24CD	GetVar
	$24C0

24D1 [FIRE-TEST]
;; 'FIRE-TEST
24D3
	$8A; Code
	"'FIRE-TEST; Name
	$24C2; Backward Link
Ptr'FIRE-TEST:
24E0	GetVar
	$24D1

24E4 [M#PRNT]
;; 'M#PRNT
24E6
	$87; Code
	"'M#PRNT"; Name
	$24D3; Backward Link
Ptr'M#PRNT:
24F0	GetVar
	$24E4

;; 2000.EXE
24F4
	$88; Code
	"2000.EXE"; Name
	$24E6; Backward Link
2000.EXEexec:
24FF	COLON; Complile The Following Section
	@exec
	EXECUTEexec
	;Sexec

;; 711.EXE
2507
	$87; Code
	"711.EXE"; Name
	$24F4; Backward Link
711.EXEexec:
2511	COLON; Complile The Following Section
	Ptr'711TESTS
	@exec
	EXECUTEexec
	;Sexec

;; "STRNG" "NAME	|  Romer Labs Fluorometer  |
251B
	$85; Code
	""NAME"; Name
	"2507; Backward Link
2523 String1exec
	String2exec
	" Romer Labs Fluorometer "; Name
	$00

;; "STRNG" "MODEL100	|  Romer Labs Fluorometer  | 
2540
	$89; Code
	""MODEL100"; Name
	$251B; Backward Link
	String1exec
	String2exec
	"FLQ100	 Rev. J 6.9.0"
	$00

;; "STRNG" "ROMER	| <<<    ROMER LABS    >>> |
2569
	$86; Code
	""ROMER"; Name
	$2540; Backward Link
TxtROMER:
2572	String1exec
	String2exec
	"<<<    ROMER LABS    >>>"
	$00

;; "STRNG" "BLANK    |					 |
258F
	$86; Code
	""BLANK"; Name
TxtBLANK:
2598	$2569; Backward Link
	String1exec
	String2exec
	"				    "
	$00

;; "STRNG" "LMPFAIL1	| LAMP DATA READY ERROR    |
25B5
	$89; Code
	""LMPFAIL1"; Name
	$258F; Backward Link
TxtLMPFAIL1:
25C1	String1exec
	String2exec
	"LAMP DATA READY ERROR   "
	$00 

;; "STRNG" "ACK	| Press ENTER to continue  |
25DE
	$84; Code
	""ACK"; Name
TxtACK:
25E5	$25B5; Backward Link
	String1exec
	String2exec
	"Press ENTER to continue "
	$00

;; "STRNG" ""SELFTST2    | Performing Self Tests   |
2602
	$89; Code
	""SELFTST2"; Name
	$25DE; Backward Link
TxtSELFTST2:
260E	String1exec
	String2exec
	"Performing Self Tests  "
	$00

;; "STRNG" ""ROMCK1    | ROM1 CHECK |
262B
	$87; Code
	""ROMCK1"; Name
	$2602; Backward Link
TxtROMCK1:
2635	String1exec
	String2exec
	"ROM1 CHECK"
	$00

;; "STRNG" ""ROMCK2    | ROM2 CHECK |
2644
	$87; Code
	""ROMCK2"; Name
	$262B; Backward Link
TxtROMCK2:
264E	String1exec
	String2exec
	"ROM2 CHECK"
	$00

;; "STRNG" ""RAMCK	| RAM CHECK |
265D
	$87; Code
	""RAMCK"; Name
	$2644; Backward Link
TxtRAMCK:
2666	String1exec
	String2exec
	"RAM CHECK"
	$00

;; "STRNG" ""LMPCK	| LAMP CHECK |
2675
	$86; Code
	""LMPCK"; Name
	$265D; Backward Link
TxtLMPCK:
267E	String1exec
	String2exec
	"LAMP CHECK"
	$00

;; "STRNG" ""RNGCK	| RANGE CHECK |
268D
	$86; Code
	""RNGCK"; Name
	$2675; Backward Link
	String1exec
	String2exec
	"RANGE CHECK"
	$00

;; "STRNG" ""FAIL	| FAIL |
26A6
	$86; Code
	""FAIL"; Name
	$268D; Backward Link
TxtFAIL:
26AE	String1exec
	String2exec
	"FAIL"
	$00

;; "STRNG" ""PASED    | PASSED |
26B7
	$86; Code
	""PASED"; Name
	$26A6; Backward Link
TxtPASED:
26C0	String1exec
	String2exec
	"PASSED"
	$00

;; "STRNG" ""STOPED    | INSTRUMENT NON-OPERATIVE |
26CB
	$86; Code
	""STOPED"; Name
	$26B7; Backward Link
26D5 	String1exec
	String2exec
	"INSTRUMENT NON-OPERATIVE"
	$00

;; "STRNG" ""DTAerr    | DATA ACQUISITION ERROR   |
26F2
	$86; Code
	""DTAerr"; Name
	$26CB; Backward Link
"DTAerrStr:
26FC 	String1exec
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

;; "RSLTS
2B55
	$86; Code
	""RSLTS"; Name
	$2B2C; Backward Link
"RSLTSStr:
2B5E String1exec
	$FAC4
	"TEST RESULT		   "
	DB 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; "STRNG" "SMPL#	| SAMPLE NUMBER  |
2FE3
	$87; Code
	""SMPL#"; Name
	$2FCC; Backward Link
TxtSMPL#:
2FEC String1exec
	String2exec
	"SAMPLE NUMBER  "
	$00

;; ''UPPB
3000
	$85; Code
	"''UPPB"; Name
	$2FE3; Backward Link
TxtUPPB:
3008	String1exec FAC4 2050 6172 7473 2050 6572 2042 696C 6C69 6F6E 00

;;; "STRNG" "UPPM	|  Parts Per Billion|
301F
	$87; Code
	""UPPM"; Name
	$2FE3; Backward Link
TxtUPPM:
3027 String1exec
	String2exec
	" Parts Per Billion"
	$00

;;; "STRNG" "COMNTS	| Comments:|
303E
	$87; Code
	""COMNTS"; Name
	$301F; Backward Link
TxtCOMNTS:
3048 String1exec
	String2exec
	"Comments:"
	$00

;;; "STRNG" "QA1	| <<<  ROMER LABS  >>>|
3056
	$84
	""QA2"; Name
	$303E; Backward Link
TxtQA1:
305D String1exec
	String2exec
	"<<<  ROMER LABS  >>>"
	$00

;;; "STRNG" "QA2	| QA TEST BATTERY	    |
3076
	$84; Code
	""QA2"; Name
	$3056; Backward Link
TxtQA2:
307D String1exec
	String2exec
	"QA TEST BATTERY	   "
	$00

;;; "STRNG" "QASELF  | SELFTEST FUNCTIONS	 |
309A
	$87; Code
	""QASELF"; Name
	$3076; Backward Link
TxtQASELF:
30A4 String1exec
	String2exec
	"SELFTEST FUNCTIONS	"
	$00

;;; "STRNG" "OSTST1  | OFFSET MEASUREMENT	 |
30C1
	$87; Code
	""OSTST1"; Name
	$309A; Backward Link
TxtOSTST1:
30CB String1exec
	String2exec
	"OFFSET MEASUREMENT	"
	$00

;;; "STRNG" "OSHDR1  | OFFSET/GAIN Gain	1    10   100  1000|
30E8
	$87; Code
	""OSHDR1"; Name
	$30C1; Backward Link
TxtOSHDR1:
30F2 String1exec
	String2exec
	"OFFSET/GAIN Gain	1    10   100  1000"
	$00

;;; "STRNG" "LEKTST  | FEEDTHROUGH MEASUREMENT |
311F
	$87; Code
	""LEKTST"; Name
	$30E8; Backward Link
TxtLEKTST:
3129 String1exec
	String2exec
	"FEEDTHROUGH MEASUREMENT "
	$00

;;; "STRNG" "OSHDR3  | FEEDTHROUGH Gain	1    10   100  1000|
3146
	$87; Code
	""OSHDR3"; Name
	$311F; Backward Link
TxtOSHDR3:
3150 String1exec
	String2exec
	"FEEDTHROUGH Gain	1    10   100  1000"
	$00

;;; "STRNG" "OSHDR2  |		 Counts|
317D
	$87; Code
	""OSHDR2"; Name
	$3146; Backward Link
TxtOSHDR2:
3187 String1exec
	String2exec
	"		 Counts"
	$00
	

;;; "STRNG" "QA#1    | <<< QA TEST# |
319C
	$85; Code
	""QA#1"; Name
	$317D; Backward Link
TxtQA#1:
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
TxtCALTST:
31D1 String1exec
	String2exec
	"CALIBRATOR MEASUREMENT  "
	$00

;;; "STRNG" "CVhdr   | CALIBRATOR	   Sig   Gain    Ref|
31EE
	$86; Code
	""CVhdr"; Name
	$31C7; Backward Link
TxtCVhdr:
31F7 String1exec
	String2exec
	"CALIBRATOR	   Sig   Gain    Ref"
	$00

;;; "STRNG" "CVhdr1  | SIGNAL LEVELS|
321F
	$87; Code
	""CVhdr1"; Name
	$31EE; Backward Link
TxtCVhdr1:
3229 String1exec
	String2exec
	"SIGNAL LEVELS"
	$00

;;; "STRNG" "QADON1  | QA TESTS COMPLETE	  |
323B
	$87; Code
	""QADON1"; Name
	$321F; Backward Link
TxtQADON1:
3245 String1exec
	String2exec
	"QA TESTS COMPLETE	  "
	$00   

;;; "STRNG" "QADON2  | POWER OFF/ON TO RESTART |
3262
	$87; Code
	""QADON2"; Name
	$323B; Backward Link
TxtQADON2:
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
3292	GetVar
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
32A3	COLON; Complile The Following Section
	VarfTEST
	@exec; Push Data Contained in TOS Addr to TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	MONITORkeyQexec
	VarfTEST
	@exec; Push Data Contained in TOS Addr to TOS
	ANDexec;  AND NOS with TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004; Branch Offset
		711.EXEexec
	ENDIF
	ConstF1key
	@exec; Push Data Contained in TOS Addr to TOS
	VarCALflg
	@exec; Push Data Contained in TOS Addr to TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	ANDexec;  AND NOS with TOS
	VarfTEST
	@exec; Push Data Contained in TOS Addr to TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	ANDexec;  AND NOS with TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$000C; Branch Offset
		DROPexec; Delete TOS
		Ptr'RECAL
		@exec; Push Data Contained in TOS Addr to TOS
		EXECUTEexec
		TESTrtnexec
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
32E5	COLON; Complile The Following Section
	VarfTEST
	@exec; Push Data Contained in TOS Addr to TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	$F998
	SWAPexec; Swap TOS with NOS
	VarfTEST
	@exec; Push Data Contained in TOS Addr to TOS
	ANDexec;  AND NOS with TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004; Branch Offset
		711.EXEexec
	ENDIF
	VarfTEST
	@exec; Push Data Contained in TOS Addr to TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0042; Branch Offset
		DUPexec; Duplicate TOS
		ConstF1
		=exec
		VarCALflg
		@exec; Push Data Contained in TOS Addr to TOS
		0=exec; Set TOS to TRUE if 0, ELSE FALSE
	ANDexec;  AND NOS with TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$000C; Branch Offset
		DROPexec; Delete TOS
		Ptr'RECAL
		@exec; Push Data Contained in TOS Addr to TOS
		EXECUTEexec
		TESTrtnexec
		ENDIF
	DUPexec; Duplicate TOS
	ConstF1
	=exec
	OVERexec; Duplicate NOS at TOS
	ConstF2
	=exec
	ORexec;  OR NOS with TOS
	OVERexec; Duplicate NOS at TOS
	ConstF3
	=exec
	ORexec;  OR NOS with TOS
	Varf>MENU; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	ANDexec;  AND NOS with TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0006; Branch Offset
		DROPexec; Delete TOS
		TESTrtnexec
		ENDIF
	ENDIF
	;Sexec

;;; : WAIT-ENT "ACK DISPLAY2 w-TYPE BEGIN PCkey 13 ( ENT) = UNTIL ;
3349
	$88; Code
	"WAIT-ENT"; Name
	 $32DD; Backward Link
WAIT-ENTexec:
3354	COLON; Complile The Following Section
	TxtACK
	ConstDISPLAY2; Push $0002 onto TOS
	w-TYPEexec
	BEGIN
		PCkeyexec
		LITexec; Put value that follows on TOS
		$000D; Literal Value
		=exec
	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
	$FFF6; Branch Offset
	;Sexec

;;; 0 VARIABLE MINx
336A
	$84; Code
	"MINx"; Name
	$3349; Backward Link
VarMINx:
3371	GetVar
	$0E74

;;; 0 VARIABLE MAXx
3375
	$84; Code
	"MAXx"; Name
	$336A; Backward Link
VarMAXx:
337C	GetVar
	$0E76

;;; 0 VARIABLE INITVLU 6 ALLOT-RAM
3380
	$87; Code
	"INITVLU"; Name
	$3375; Backward Link
VarINITVLU:
338A	GetVar
	$0E78

;;; 3 CONSTANT #DIGITS
338E
	$87; Code
	"#DIGITS"; Name
	$3380; Backward Link
Const#DIGITS:;		Push $0003 onto TOS
3398	GetVar
	$0003

;;; 0 VARIABLE f+/-#
339C
	$85; Code
	"f+/-#"; Name
	$338E; Backward Link
Varf+/-#:
33A4	GetVar
	$0E80

;;; 0 VARIABLE F#SGN
33A8
	$85; Code
	"F#SGN"; Name
	$339C; Backward Link
VarF#SGN:
33B0	GetVar
	$0E82

;;; 0 VARIABLE fDPok
33B4
	$82; Code
	"fDPok"; Name
	$33A8; Backward Link
VarfDPok:
33BC	GetVar
	$0E84

;;; 1 CONSTANT DPdigits
33C0
	$88; Code
	"DPdigits"; Name
	$33B4; Backward Link
VarDPdigits:;	 Push Constant $0001 to TOS
33CB	GetVar
	$0001

;;; 0 VARIABLE fDP
33CF
	$89; Code
	"fDP"; Name
	$33C0; Backward Link
VarfDP:
33D5	GetVar
	$0E86

;;; 0 VARIABLE fDP0
33D9
	$84
	"fDP0"; Name
	$33CF; Backward Link
VarfDP0:
33E0	GetVar
	$0E88

;;; : N#CNVRT 0 <# #S #> ;
33E4
	$87; Code
	"N#CNVRT"; Name
	$33D9; Backward Link
N#CNVRTexec:
33EE	COLON; Complile The Following Section
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
3404	COLON; Complile The Following Section
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
3430	COLON; Complile The Following Section
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
344C	COLON; Complile The Following Section
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
346A	COLON; Complile The Following Section
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
VarCNVRTTBL:
3493	GetVar
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
34A1	COLON; Complile The Following Section
	ABSexec;	   Absolute Value of TOS
	>Rexec; Move TOS to Return Stack
	DROPexec; Delete TOS
	Rexec
	LITexec; Put value that follows on TOS
	$0004; Literal Value
	>exec;	 NOS > TOS?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0014; Branch Offset
		Rexec for Loop Limit
		LITexec; Put value that follows on TOS
		$0004; Literal Value for Loop Index
		(DO)exec; Beginning of DO Loop
			LITexec; Put value that follows on TOS
			$000A; Literal Value
			/exec;   Divide TOS by NOS
		(LOOP)exec
		$FFF8
	ENDIF
	Rexec
	Const3;  Push $0003 onto TOS
	>exec;	 NOS > TOS?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0016; Branch Offset
		LITexec; Put value that follows on TOS
		$000A; Literal Value
		/MODexec
		SWAPexec; Swap TOS with NOS
		LITexec; Put value that follows on TOS
		$0004; Literal Value
		>exec;	 NOS > TOS?
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$0004; Branch Offset
			1+exec;    Add 1 TO TOS
	ENDIF
	ENDIF
	Const0;  Push $0000 onto TOS
	R>exec;   Retrieve TOS from return stack.
	Const3;  Push $0003 onto TOS
	MINexec
	2*exec; Multiply TOS by 2; (Arithmetic Shift Left TOS)
	VarCNVRTTBL
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
3502	GetVar
	$0E8A

;;; : FORMAT-ANSWER ( d,j -- adr,cnt) OVER >R >R DABS R>
	F#CNVRT OUTBUF 1+ SWAP DUP 1+ >R CMOVE
	R> R> 0< IF 45 ELSE 32 ENDIF OUTBUF C! OUTBUF SWAP ;
3506
	$8A; Code
	"FORMAT-ANSWER"; Name
	$34F9; Backward Link
FORMAT-ANSWERexec:
3516	COLON; Complile The Following Section
	OVERexec; Duplicate NOS at TOS
	>Rexec; Move TOS to Return Stack
	>Rexec; Move TOS to Return Stack
	DABSexec;   Double Absolute Value
	R>exec;   Retrieve TOS from return stack.
	F#CNVRTexec
	VarOUTBUF; Push Var Addr onto TOS
	1+exec;    Add 1 TO TOS
	SWAPexec; Swap TOS with NOS
	DUPexec; Duplicate TOS
	1+exec;    Add 1 TO TOS
	>Rexec; Move TOS to Return Stack
	CMOVEexec
	R>exec;   Retrieve TOS from return stack.
	R>exec;   Retrieve TOS from return stack.
	0<exec ;	    TOS  <0?
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
3558	GetVar
	$0EB4

;;; 0 VARIABLE Rsgn 4
355C
	$84; Code
	"Rsgn"; Name
	$3552; Backward Link
VarRsgn:
3563	GetVar
	$0EB6

;;; 0 VARIABLE 2DIGrslt 6 ALLOT-RAM
3567
	$88; Code
	"2DIGrslt"; Name
	$355C; Backward Link
Var2DIGrslt:
3572	GetVar
	$0EB8

;;; : j,d>2DIG ( j,d --   j2,d2 saved,  j2&d2 limited to 2 DIGITS)
	0 REM ! DUP Rsgn !  DABS ROT			  ( j,d -- dABS,j)
	>R BEGIN 2DUP 99. D>
	IF 10 M/MOD ROT REM ! R> 1+ >R 0 ELSE 1 ENDIF UNTIL
	REM @ 4 >			   ( Rnd up then ensure 2 digits only)
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
3581	COLON; Complile The Following Section
	Const0;  Push $0000 onto TOS
	VarREM; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	DUPexec; Duplicate TOS
	VarRsgn; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	DABSexec;   Double Absolute Value
	ROTexec;    Rotate top 3 on stack
	>Rexec; Move TOS to Return Stack
	2DUPexec; Duplicate TOS/NOS
	BEGIN
    	LITexec; Put value that follows on TOS
		$0063; Literal Value
		LITexec; Put value that follows on TOS
		$0000; Literal Value
		d>exec; 3rd and 4th > 1st and 2nd?
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$001A; Branch Offset
			LITexec; Put value that follows on TOS
			$000A; Literal Value
			M/MODexec
			ROTexec;    Rotate top 3 on stack
			VarREM; Push Var Addr onto TOS
			!exec; Store NOS to Addr in TOS
			R>exec;   Retrieve TOS from return stack.
			1+exec;    Add 1 TO TOS
			>Rexec; Move TOS to Return Stack
			Const0;  Push $0000 onto TOS
			BRANCHexec
			$0004
		ELSE
			Const1;  Push $0001 onto TOS
		ENDIF
	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
	$FFD4; Branch Offset
	VarREM; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	LITexec; Put value that follows on TOS
	$0004; Literal Value
	>exec;	 NOS > TOS?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0028; Branch Offset
		LITexec; Put value that follows on TOS
		$0001; Literal Value
		LITexec; Put value that follows on TOS
		$0000; Literal Value
		D+exec; Add Double Numbers on Stack
		2DUPexec; Duplicate TOS/NOS
		LITexec; Put value that follows on TOS
		$0063; Literal Value
		LITexec; Put value that follows on TOS
		$0000; Literal Value
		d>exec; 3rd and 4th > 1st and 2nd?
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$000E; Branch Offset
			LITexec; Put value that follows on TOS
			$000A; Literal Value
			D/exec;	 Double Divide
			R>exec;   Retrieve TOS from return stack.
			1+exec;    Add 1 TO TOS
			>Rexec; Move TOS to Return Stack
	ENDIF
	ENDIF
	Const0;  Push $0000 onto TOS
	Var>990err
	!exec; Store NOS to Addr in TOS
	R>exec;   Retrieve TOS from return stack.
	DUPexec; Duplicate TOS
	>exec;	 TOS>0?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0032; Branch Offset
		Const3;  Push $0003 onto TOS
		MINexec
		>Rexec; Move TOS to Return Stack
		BEGIN
			LITexec; Put value that follows on TOS
			$000A; Literal Value
			D*exec;	 Double Multiply
			2DUPexec; Duplicate TOS/NOS
			LITexec; Put value that follows on TOS
			$26AC; Literal Value
			LITexec; Put value that follows on TOS
			$0000; Literal Value
			d>exec; 3rd and 4th > 1st and 2nd?
			OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
			$000A; Branch Offset
				LITexec; Put value that follows on TOS
				$FFFF; Literal Value
				Var>990err
				!exec; Store NOS to Addr in TOS
	   	ENDIF
			R>exec;   Retrieve TOS from return stack.
			1-exec; Subtract 1 from TOS (DEC TOS)
			DUPexec; Duplicate TOS
			;  TOS <= 0?
		OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
		$FFD6; Branch Offset
	ENDIF
	>Rexec; Move TOS to Return Stack
	VarRsgn; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	0<exec ;	    TOS  <0?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004; Branch Offset
		DMINUSexec;   Double Negate
	ENDIF
	Var2DIGrslt; Push Var Addr onto TOS
	2!exec; Store NOS and 2nd NOS to Addr in TOS
	R>exec;   Retrieve TOS from return stack.
	LITexec; Put value that follows on TOS
	$0EBC; Literal Value
	!exec; Store NOS to Addr in TOS
	;Sexec

;;; : TST2DIG j,d>2DIG 2DIGrslt 2@ 2DIGrslt 4 + @ F#CNVRT  ( **)	CR TYPE ;
3653
	$87; Code
	"TST2DIG"; Name
	$3576; Backward Link
	COLON; Complile The Following Section
	j,d>2DIGexec
	Var2DIGrslt; Push Var Addr onto TOS
	2@exec;  fetches a double integer to the stack
	Var2DIGrslt; Push Var Addr onto TOS
	LITexec; Put value that follows on TOS
	$0004; Literal Value
	+exec; Add NOS To TOS
	@exec; Push Data Contained in TOS Addr to TOS
	F#CNVRTexec
	CRexec; Send Carriage Return
	TYPEexec
	;Sexec

;;; : CLR-OLDDATA  CHRBUF2 ( 1+) BUF2pntr !
	x2 @ 1+ MINx @ ( Clear the display)
	DO 32 I DISPLAY2 wx-emit
	I BUF2pntr @ + C@ 32 = IF LEAVE ENDIF LOOP
	MINx @ x2 !					 ( Reset dsply clmn pntr)
	fDPok @ IF #DIGITS MAXx ! ENDIF  ( Reset max number of digits)
	0 F#SGN ! 0 fDP ! CLR-CHRBUF2 ;
3677
	$8B; Code
	"CLR-OLDDATA"; Name
	$3653; Backward Link
CLR-OLDDATAexec:
3685	COLON; Complile The Following Section
	VarCHRBUF2
	VarBUF2pntr
	!exec; Store NOS to Addr in TOS
	Varx2
	@exec; Push Data Contained in TOS Addr to TOS
	1+exec;    Add 1 TO TOS for Loop Limit
	VarMINx; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS for Loop Index
	(DO)exec; Beginning of DO Loop
		LITexec; Put value that follows on TOS
		$0020; Literal Value
		)exec
    	ConstDISPLAY2; Push $0002 onto TOS
		wx-emitexec
		)exec
		VarBUF2pntr
		@exec; Push Data Contained in TOS Addr to TOS
		+exec; Add NOS To TOS
		C@exec;  Push (Char) Data Contained in TOS Addr to TOS
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
	Varx2
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
	CLR-CHRBUF2exec
	;Sexec

;;; : ENTER-DP -1 fDP ! 1 MAXx +! ;
36E3
	$88; Code
	"ENTER-DP"; Name
	$3677; Backward Link
ENTER-DPexec:
36EE	COLON; Complile The Following Section
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
372D	COLON; Complile The Following Section
	DUPexec; Duplicate TOS
	ConstF1
	=exec
	OVERexec; Duplicate NOS at TOS
	ConstF2
	=exec
	ORexec;  OR NOS with TOS
	OVERexec; Duplicate NOS at TOS
	ConstF3
	=exec
	ORexec;  OR NOS with TOS
	VarCALflg
	@exec; Push Data Contained in TOS Addr to TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	ANDexec;  AND NOS with TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0006; Branch Offset
		DROPexec; Delete TOS
    	TESTrtnexec
	ENDIF
	LITexec; Put value that follows on TOS
	$002F; Literal Value
	OVERexec; Duplicate NOS at TOS
	<exec;	 NOS<TOS?
	OVERexec; Duplicate NOS at TOS
	LITexec; Put value that follows on TOS
	$003A; Literal Value
	<exec;	 NOS<TOS?
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
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	ANDexec;  AND NOS with TOS
	ORexec;  OR NOS with TOS
	OVERexec; Duplicate NOS at TOS
	LITexec; Put value that follows on TOS
	$002D; Literal Value
	=exec
	Varf+/-#; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	ANDexec;  AND NOS with TOS
	VarBUF2pntr
	@exec; Push Data Contained in TOS Addr to TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	ANDexec;  AND NOS with TOS
	ORexec;  OR NOS with TOS
	;Sexec

;;; : getF# ( --  CHRBUF2 contains char string)
	BEGIN x2 @ MAXx @ >	   ( Display clmn pntr > last clmn ?)
	IF 0 BUF2pntr ! 0 fDP ! ENDIF	 ( clear char buffer pntr)
	BEGIN ?KEYPAD UNTIL PCkey
	LEGAL-DIGIT? ( Ensure 0->9 digit, legal DP, or legal - sgn)
	IF BUF2pntr @ 0= IF CLR-OLDDATA ENDIF
	DUP x2 @ DISPLAY2 wx-emit 1 x2 +!   ( Display character)
	( DUP 45 = IF ENTER-SGN ENDIF	   ( If -,set sgn,0->dig)
	DUP 46 = IF ENTER-DP ENDIF  ( Enter dp or exit if dp err)
	95 ( _) x2 @ DISPLAY2 wx-emit  ( Display nxt chr prompt)
	DUP BUF2pntr @ C! 1 BUF2pntr +!    ( Enter digit in buf)
	ENDIF
	x2 @ MAXx @ >	   ( Display clmn pntr > last clmn ?)
	IF 32 ( sp) x2 @ DISPLAY2 wx-emit ENDIF ( If so, clr prompt)
	ENT = UNTIL ;
3799
	$85; Code
	"getF#"; name
	$371E; Backward Link
getF#exec:
37A1	COLON; Complile The Following Section
	BEGIN
		Varx2
		@exec; Push Data Contained in TOS Addr to TOS
		VarMAXx; Push Var Addr onto TOS
		@exec; Push Data Contained in TOS Addr to TOS
		>exec;	 NOS > TOS?
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$000E; Branch Offset
			Const0;  Push $0000 onto TOS
			VarBUF2pntr
			!exec; Store NOS to Addr in TOS
			Const0;  Push $0000 onto TOS
			VarfDP; Push Var Addr onto TOS
			!exec; Store NOS to Addr in TOS
		ENDIF
		BEGIN
			?KEYPADexec
		OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
		$FFFC; Branch Offset
		PCkeyexec
		LEGAL-DIGIT?exec
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$0046; Branch Offset
			VarBUF2pntr
			@exec; Push Data Contained in TOS Addr to TOS
			0=exec; Set TOS to TRUE if 0, ELSE FALSE
			OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
			$0004; Branch Offset
				CLR-OLDDATAexec
	   	ENDIF
			DUPexec; Duplicate TOS
			Varx2
			@exec; Push Data Contained in TOS Addr to TOS
			ConstDISPLAY2; Push $0002 onto TOS
			wx-emitexec
			Const1;  Push $0001 onto TOS
			Varx2
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
			Varx2
			@exec; Push Data Contained in TOS Addr to TOS
			ConstDISPLAY2; Push $0002 onto TOS
			wx-emitexec
			DUPexec; Duplicate TOS
			VarBUF2pntr
			@exec; Push Data Contained in TOS Addr to TOS
			C!exec;  Store NOS (Char)  to Addr in TOS
			Const1;  Push $0001 onto TOS
	ENDIF
		VarBUF2pntr
		+!exec; Add NOS to Addr in TOS
	ENDIF
	Varx2
		@exec; Push Data Contained in TOS Addr to TOS
		VarMAXx; Push Var Addr onto TOS
		@exec; Push Data Contained in TOS Addr to TOS
		>exec;	 NOS > TOS?
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$000E; Branch Offset
			LITexec; Put value that follows on TOS
			$0020; Literal Value
			Varx2
			@exec; Push Data Contained in TOS Addr to TOS
			ConstDISPLAY2; Push $0002 onto TOS
    		wx-emitexec
		ENDIF
		ConstEnt
		=exec
	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
	$FF74; Branch Offset
	;Sexec

;;; 0 VARIABLE NUMLEN
3833
	$86; Code
	"NUMLEN"; Name
	$3799; Backward Link 
VarNUMLEN:
383C	GetVar
	$0EC0

;;; : INIT-GET#
	CLR-CHRBUF2						( Clear digit buffer)
	0 fDP ! 0 fDP0 !				    ( Clr dp entered flag)
	INITVLU 2@ DUP 0< F#SGN ! DABS INITVLU 4 + @ F#CNVRT
	2DUP OVER + SWAP		   ( Check for INITVLU=n.m with m>0)
	DO I C@ DUP 46 ( .) = fDP0 +! 48 > fDP0 @ 0> AND fDP +! LOOP
	( DUP F#SGN @ IF 1+ ENDIF MAXx !
	( Set max num of chars dsplyed DUP NUMLEN ! CHRBUF2 ( 1+) F#SGN @
	IF 45 OVER C! 1 NUMLEN +! 1 MAXx +! 1+ ENDIF
	SWAP DUP MAXx +! CMOVE	  ( Put init value strng in buffer)
	CHRBUF2 NUMLEN @ MINx @ DISPLAY2 wx-TYPE  ( Dsply init vlu)
	MAXx @ 1+ x2 ! ;			( Set dsply clmn > max allowed)
3840
	$89; Code
	"INIT-GET#"; Name
	$3833; Backward Link
INIT-GET#exec:
384C	COLON; Complile The Following Section
	CLR-CHRBUF2exec
	Const0;  Push $0000 onto TOS
	VarfDP; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	Const0;  Push $0000 onto TOS
	VarfDP0; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	VarINITVLU; Push Var Addr onto TOS
	2@exec;  fetches a double integer to the stack
	DUPexec; Duplicate TOS
	0<exec ;	    TOS  <0?
	VarF#SGN; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	DABSexec;   Double Absolute Value
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
	(DO)exec; Beginning of DO Loop
    	)exec
		C@exec;  Push (Char) Data Contained in TOS Addr to TOS
		DUPexec; Duplicate TOS
    	LITexec; Put value that follows on TOS
		$002E; Literal Value
		=exec
		VarfDP0; Push Var Addr onto TOS
		+!exec; Add NOS to Addr in TOS
		LITexec; Put value that follows on TOS
		$0030; Literal Value
		>exec;	 NOS > TOS?
		VarfDP0; Push Var Addr onto TOS
		@exec; Push Data Contained in TOS Addr to TOS
		>exec;	 TOS>0?
		ANDexec;  AND NOS with TOS
		VarfDP; Push Var Addr onto TOS
		+!exec; Add NOS to Addr in TOS
	(LOOP)exec
	$FFDC
	DUPexec; Duplicate TOS
	VarNUMLEN; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	VarCHRBUF2
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
		1+exec;    Add 1 TO TOS
	ENDIF
	SWAPexec; Swap TOS with NOS
	DUPexec; Duplicate TOS
	VarMAXx; Push Var Addr onto TOS
	+!exec; Add NOS to Addr in TOS
	CMOVEexec
	VarCHRBUF2
	VarNUMLEN; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	VarMINx; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	ConstDISPLAY2; Push $0002 onto TOS
	wx-TYPEexec
	VarMAXx; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	1+exec;    Add 1 TO TOS
	Varx2
	!exec; Store NOS to Addr in TOS
	;Sexec

;;;: GET[F#] ( -- j,d)
	 #DIGITS MAXx ! -1 fDPok !    ( Init for dp entry allowed)
	INIT-GET# getF#	( Init digit entry & get float dp number)
	CHRBUF2 1- NUMBER
	( **F#SGN @ IF DMINUS ENDIF**)
	2DUP INITVLU 2! >R >R
	DPL @ 0 MAX MINUS DUP INITVLU 4 + ! R> R> ; 
38F0
	$87; Code
	"GET[F#]"; Name
	$3840; Backward Link
"GET[F#]exec:
38FA	COLON; Complile The Following Section
	Const#DIGITS;  Push $0003 onto TOS
	VarMAXx; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	LITexec; Put value that follows on TOS
	$FFFF; Literal Value
	VarfDPok; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	INIT-GET#exec
	getF#exec
	VarCHRBUF2
	1-exec; Subtract 1 from TOS (DEC TOS)
	NUMBERexec
	2DUPexec; Duplicate TOS/NOS
	VarINITVLU; Push Var Addr onto TOS
	2!exec; Store NOS and 2nd NOS to Addr in TOS
	>Rexec; Move TOS to Return Stack
	>Rexec; Move TOS to Return Stack
	DPLexec
	@exec; Push Data Contained in TOS Addr to TOS
	Const0;  Push $0000 onto TOS
	MAXexec
	MINUSexec;	  Negate TOS
	DUPexec; Duplicate TOS
	VarINITVLU; Push Var Addr onto TOS
	LITexec; Put value that follows on TOS
	$0004; Literal Value
	+exec; Add NOS To TOS
	!exec; Store NOS to Addr in TOS
	R>exec;   Retrieve TOS from return stack.
	R>exec;   Retrieve TOS from return stack.
	;Sexec

;;; : GET[n#] ( -- n) 0 fDPok ! ( Init for whole number entry only)
	INIT-GET# getF#	 ( Init digit entry & get whole number)
	CHRBUF2 1- NUMBER 2DUP INITVLU 2! DROP >R
	DPL @ 0 MAX MINUS INITVLU 4 + ! R> ;
393A
	$87; Code
	"GET[n#]"; Name
	$38F0; Backward Link
GET[n#]exec:
3944	COLON; Complile The Following Section
	Const0;  Push $0000 onto TOS
	VarfDPok; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	INIT-GET#exec
	getF#exec
	VarCHRBUF2
	1-exec; Subtract 1 from TOS (DEC TOS)
	NUMBERexec
	2DUPexec; Duplicate TOS/NOS
	VarINITVLU; Push Var Addr onto TOS
	2!exec; Store NOS and 2nd NOS to Addr in TOS
	DROPexec; Delete TOS
	>Rexec; Move TOS to Return Stack
	DPLexec
	@exec; Push Data Contained in TOS Addr to TOS
	Const0;  Push $0000 onto TOS
	MAXexec
	MINUSexec;	  Negate TOS
	VarINITVLU; Push Var Addr onto TOS
	LITexec; Put value that follows on TOS
	$0004; Literal Value
	+exec; Add NOS To TOS
	!exec; Store NOS to Addr in TOS
	R>exec;   Retrieve TOS from return stack.
	;Sexec

;;; : D-SPACES ( n --) DUP 0= IF DROP EXIT ENDIF
	0 DO 32 DSPLYwrite LOOP ;
3978
	$88; Code
	"D-SPACES"; Name
	$393A; Backward Link
D-SPACESexec:
3983	COLON; Complile The Following Section
	DUPexec; Duplicate TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0006; Branch Offset
		DROPexec; Delete TOS
		EXITexec
	ENDIF
	Const0;  Push $0000 onto TOS for Loop Index
	(DO)exec; Beginning of DO Loop
		LITexec; Put value that follows on TOS
		$0020; Literal Value
		DSPLYwriteexec
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
39AC	COLON; Complile The Following Section
	VarCHRBUF2
	COUNTexec
	Const1;  Push $0001 onto TOS
	ConstDISPLAY2; Push $0002 onto TOS
	wx-TYPEexec
	LITexec; Put value that follows on TOS
	$0004; Literal Value
	VarCHRBUF2
	C@exec;  Push (Char) Data Contained in TOS Addr to TOS
	-exec	; Subtract TOS From NOS
	Const0;  Push $0000 onto TOS
	MAXexec
	D-SPACESexec
	Const2;  Push $0002 onto TOS
	VarCHRBUF2
	C@exec;  Push (Char) Data Contained in TOS Addr to TOS
	SETcurserexec
	;Sexec

;;; : INIT-DLYTME
	CLR-CHRBUF2						( Clear digit buffer)
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
39E0	COLON; Complile The Following Section
	CLR-CHRBUF2exec
	VarINITVLU; Push Var Addr onto TOS
	2@exec;  fetches a double integer to the stack
	DABSexec;   Double Absolute Value
	<#exec
	#Sexec
	#>exec
	VarCHRBUF2
	C!exec;  Store NOS (Char)  to Addr in TOS
	VarCHRBUF2
	COUNTexec
	CMOVEexec
	Const2;  Push $0002 onto TOS
	Const1;  Push $0001 onto TOS
	SETcurserexec
	LITexec; Put value that follows on TOS
	$0005; Literal Value
	D-SPACESexec
	VarCHRBUF2
	COUNTexec
	Const1;  Push $0001 onto TOS
	ConstDISPLAY2; Push $0002 onto TOS
	wx-TYPEexec
	LITexec; Put value that follows on TOS
	$0004; Literal Value
	VarCHRBUF2
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
	TYPE-SEC		   \ Display Dly Sec Data
	ENDIF
	ENT = UNTIL
	CHRBUF2 NUMBER 2DUP INITVLU 2! DROP >R
	0 INITVLU 4 + ! R> ;
3A1A
	$88; Code
	GET[sec]; Name
	$39D2; Backward Link
GET[sec]exec:
3A25	COLON; Complile The Following Section
	BEGIN
		INIT-DLYTME
		BEGIN
		?KEYPADexec
		OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
		$FFFC; Branch Offset
		PCkeyexec
		LITexec; Put value that follows on TOS
		$002F; Literal Value
		OVERexec; Duplicate NOS at TOS
		<exec;	 NOS<TOS?
		OVERexec; Duplicate NOS at TOS
		LITexec; Put value that follows on TOS
		$003B; Literal Value
		<exec;	 NOS<TOS?
		ANDexec;  AND NOS with TOS
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$0038; Branch Offset
			VarCHRBUF2
			C@exec;  Push (Char) Data Contained in TOS Addr to TOS
			LITexec; Put value that follows on TOS
			$0004; Literal Value
			>=exec;	 NOS >= TOS?
			OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
			$0014; Branch Offset
				VarCHRBUF2
				LITexec; Put value that follows on TOS
				$0005; Literal Value
				LITexec; Put value that follows on TOS
				$0020; Literal Value
				FILLexec
				Const0;  Push $0000 onto TOS
				VarCHRBUF2
				C!exec;  Store NOS (Char)  to Addr in TOS
		ENDIF
			DUPexec; Duplicate TOS
			VarCHRBUF2
			COUNTexec
			+exec; Add NOS To TOS
			C!exec;  Store NOS (Char)  to Addr in TOS
			VarCHRBUF2
			C@exec;  Push (Char) Data Contained in TOS Addr to TOS
			1+exec;    Add 1 TO TOS
			VarCHRBUF2
			C!exec;  Store NOS (Char)  to Addr in TOS
			TYPE-SECexec
		ENDIF
		ConstEnt
		=exec
	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
	$FFA6; Branch Offset
	VarCHRBUF2
	NUMBERexec
	2DUPexec; Duplicate TOS/NOS
	VarINITVLU; Push Var Addr onto TOS
	2!exec; Store NOS and 2nd NOS to Addr in TOS
	DROPexec; Delete TOS
	>Rexec; Move TOS to Return Stack
	Const0;  Push $0000 onto TOS
	VarINITVLU; Push Var Addr onto TOS
	LITexec; Put value that follows on TOS
	$0004; Literal Value
	+exec; Add NOS To TOS
	!exec; Store NOS to Addr in TOS
	R>exec;   Retrieve TOS from return stack.
	;Sexec

;; A/DHiByte
3AA3
	$89; Code
	"A/DHiByte"; Name
	$3A1A; Backward Link
VarA/DHiByte:
3AAF	GetVar
	$7002

;; A/DLowByte
3AB3
	$8A; Code
	"A/DLowByte"; Name
	$3AA3; Backward Link
VarA/DLowByte:
3AC0	GetVar
	$7001

;; A/DStatus
3AC4
	$89; Code
	"A/DStatus"; Name
	$3AB3; Backward Link
VarA/DStatus:
3AD0	GetVar
	$7002

;; 0 VARIABLE ACQcntrl
3AD4
	$88; Code
	"ACQcntrl"; Name
	$3AC4; Backward Link
VarACQcntrl:
3ADF	GetVar
	$0EC2

;; VIALSWI/O
3AE3
	$89; Code
	"VIALSWI/O"; Name
	$3AD4; Backward Link
VarVIALSWI/O:
3AEF	GetVar
	$7002

;; 20 CONSTANT VIALbit
3AF3
	$87; Code
	"VIALbit"; Name
ConstVIALbit:
3AFD $3AE3; Backward Link
	GetVar
	$0020; Constant value

;; ?VIAL-IN
3B01
	$88; Code
	"?VIAL-IN"; Name
	$3AF3; Backward Link
?VIAL-INexec:
3B0C	COLON; Complile The Following Section
	VarVIALSWI/O
	C@exec;  Push (Char) Data Contained in TOS Addr to TOS
	ConstVIALbit
	ANDexec;  AND NOS with TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
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
3B2C	COLON; Complile The Following Section
	VarVIALSWI/O
	C@exec;  Push (Char) Data Contained in TOS Addr to TOS
	ConstVIALbit
	ANDexec;  AND NOS with TOS
	DUPexec; Duplicate TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	$2276
	!exec; Store NOS to Addr in TOS
	0<>exec
	;Sexec

;; 0 VARIABLE LMPstat
3B42
	$87; Code
	"LMPstat"; Name
	$3B20; Backward Link
VarLMPstat:;	Push Var Addr onto TOS
3B4C	GetVar
	$0EC4

;; BTST
3B50
	$84; Code
	"BTST"; Name
	$3B42; Backward Link
BTSTexec:
3B57	GetVar
	$0EC6

;; A/Ddta
3B5B
	$86; Code
	"A/Ddta"; Name
	$3B50; Backward Link
A/Ddtaexec:
3B64	GetVar
	$0EC8

;; GAINvlu
3B68
	$87; Code
	"GAINvlu"; Name
	$3B5B; Backward Link
VarGAINvlu:
3B72	GetVar
	$0ECA

;; 0 VARIABLE GAINexp
3B76
	$87; Code
	"GAINexp"; Name
	$3B68; Backward Link
VarGAINexp:
3B80	GetVar
	$0ECC

;; 0007 CONSTANT X1
3B84
	$82; Code
	"X1"; Name
	$3B76; Backward Link
ConstX1:
3B89	GetVar
	$0007

;; 0006 CONSTANT X10
3B8D
	$83; Code
	"X10"; Name
	$3B84; Backward Link
ConstX10:
3B93	GetVar
	$0006

;; 0004 CONSTANT X100
3B97
	$84; Code
	"X100"; Name
	$3B8D; Backward Link
ConstX100:
3B9E	GetVar
	$0004

;; 0000 CONSTANT X1000
3BA2
	$85; Code
	"X1000"; Name
	$3B97; Backward Link
ConstX1000;
3BAA	GetVar
	$0000

;; 90 CONSTANT REFchan
3BAE
	$87; Code
	"REFchan"; Name
	$3BA2; Backward Link
ConstREFchan:
3BB8	GetVar
	$0090

;; 50 CONSTANT SIGchan
3BBC
	$87; Code
	"SIGchan"; Name
	$3BAE; Backward Link
ConstSIGchan:
3BC6	GetVar
	$0050

;; 30 CONSTANT LMPinten
3BCA
	$88; Code
	"LMPinten"; Name
	$3BBC; Backward Link
ConstLMPinten:
3BD5	GetVar
	$0030

;; 0 CONSTANT Agnd
3BD9
	$84; Code
	"AGnd"; Name
	$3BCA; Backward Link
ConstAGnd:
3BE0	GetVar
	$0000

;;; 7002 CONSTANT ACQRI/O
3BE4
	$87; Code
	"ACQRI/O"; Name
	$3BD9; Backward Link
ConstACQRI/O:
3BEE	GetVar
	$7002; Constant value

;;; 0 VARIABLE ACQRmode
3BF2
	$88; Code
	"ACQRmode"; Name
	$3BE4; Backward Link
VarACQRmode:
3BFD	GetVar
	0ECE; Var Addr

;;; 0 VARIABLE LMPERR
3C01
	$87; Code
	"LMPERR"; Name
	$3BF2; Backward Link
VarLMPERR:
3C0A	GetVar
	0ED0; Var Addr

;;; 0 CONSTANT RUNmode
3C0E
	$87; Code    
	"RUNmode"; Name
	$3C01; Backward Link
ConstRUNmode:
3C18	GetVar
	$0000; Constant value

;;; 0 VARIABLE flMPERR
3C1C
	$87; Code
	"flMPERR"; Name
	$3C0E; Backward Link
VarflMPERR:
3C26	GetVar
	0ED2; Var Addr

;;; 60 CONSTANT TESTmode
3C2A
	$88; Code
	"TESTmode"; Name
	$3C1C; Backward Link
ConstTESTmode;		  Push $0060 onto TOS
3C35	GetVar
	$0060; Constant value

;;; 20 CONSTANT OSmode
3C39
	$86; Code
	"OSmode"; Name
	$3C2A; Backward Link
ConstOSmode:
3C42	GetVar
	$0020; Constant value

;;; 80 CONSTANT STARTacqr
3C46
	$89; Code
	"STARTacqr"; Name
	$3C39; Backward Link
ConstSTARTacqr:
3C52	GetVar
	$0080; Constant value

;;; 7F CONSTANT LMPreset
3C56
	$88; Code
	"LMPreset"; Name
	$3C46; Backward Link
ConstLMPreset:;		 Push Constant $007F to TOS
3C61	GetVar
	$007F; Constant value

;;; 0 VARIABLE #LMPERR
3C65
	$87; Code
	"#LMPERR"; Name
	$3C56; Backward Link
Var#LMPERR:
3C6F	GetVar
	0ED4; Var Addr

;;; 40 CONSTANT LMPDtaRdy
3C73
	$89; Code
	"LMPDtaRdy"; Name
	$3C65; Backward Link
ConstLMPDtaRdy:
3C7F	GetVar
	$0040; Constant value

;;; 0 VARIABLE TRIGerr
3C83
	$87; Code
	"TRIGerr"; Name
	$3C73; Backward Link
VarTRIGerr:
3C8D	GetVar
	$0ED6; Var Addr

;;; 0 VARIABLE TRIGDLY
3C91
	$87; Code
	"TRIGDLY"; Name
	$3C83; Backward Link
VarTRIGDLY:
3C9B	GetVar
	$0ED8; Var Addr
	
;;; DECIMAL


;;; : TRIGER-LAMP LMPstat @ LMPreset AND ( Set bit for lamp HV reset)
	Place LMPstat on Stack (@) then AND with LMPreset (7F)
	DUP ACQRI/O C! TRIGDLY @ 50 MAX DELAY[ms] 
	Place bottom 8 bits in ACQRI/O , Place TRIGDLY on Stack Then Delay for the greater of TRIGDLY or 50
 	( Wait for HV recharge)(			  50 DELAY[ms]		( Wait for HV recharge)
	STARTacqr OR DUP LMPstat ! ACQRI/O C! ; ( Fire lamp)
	STARTacqr = 80 OR DUPLICATE and place in LMPstat place HEX 7002 in Stack

	COMMENT LMPstat Placed on Stack ANDED with LMPreset Then DUP leave a copy on the stack and store LSB in ACQRI/O 


;;; : TRIGER-LAMP @ LMPreset AND ( Set bit for lamp HV reset)
3C9F
	$8B; Code
	"TRIGER-LAMP"; Name
	$3C91; Backward Link
TRIGER-LAMPexec:
3CAD	COLON; Complile The Following Section
	VarLMPstat  ; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	ConstLMPreset; Push Constant $007F to TOS
	ANDexec;  AND NOS with TOS
	DUPexec; Duplicate TOS
	ConstACQRI/O
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
	VarLMPstat  ; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	ConstACQRI/O
	C!exec;  Store NOS (Char)  to Addr in TOS
	;Sexec

;; : LMPFAIL -1 fABORT ! -1 TRIGerr ! fTEST @ 0=
	IF "LMPFAIL1 DISPLAY1 w-TYPE ( ** WAIT-ENT*) ENDIF ;
3CD9
	$87
	"LMPFAIL"
	$3C9F; Backward Link
LMPFAILexec:
3CE3	COLON; Complile The Following Section
	LITexec; Put value that follows on TOS
	$FFFF; Literal Value
	VarfABORT
	!exec; Store NOS to Addr in TOS
	LITexec; Put value that follows on TOS
	$FFFF; Literal Value
	VarTRIGerr; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	VarfTEST
	@exec; Push Data Contained in TOS Addr to TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	$OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0008; Branch Offset
		TxtLMPFAIL1
		ConstDISPLAY1; Push $0001 Onto TOS
		w-TYPEexec
	ENDIF
	;Sexec

;;; : FIRE-LAMP 0 LMPERR ! -1 fLMPERR !
	BEGIN TRIGER-LAMP  0 BEGIN 1+ DUP  10 >   
	( Wait for dta rdy or timeout error)		   
	A/DStatus C@ 255 XOR LMPDtaRdy AND OR
	?VIAL-OUT IF -1 DUP fABORT ! ELSE 0 THEN OR UNTIL 10 >
	IF 1 LMPERR +! 1 #LMPERR +! LMPERR @  3 > IF LMPFAIL
	   ELSE	 
		0 fLMPERR !
	   ENDIF
	fLMPERR @ 0= fABORT @ OR							   
	UNTIL LMPERR @ 0>										   
	IF CR LMPERR @ . ." DATA READY ERROR(s) " CR ENDIF;

;; FIRE-LAMP
3D07
	$89; Code
	"FIRE-LAMP"; Name
	$3CD9; Backward Link
FIRE-LAMPexec:
3D13	COLON; Complile The Following Section
	Const0;  Push $0000 onto TOS
	VarLMPERR; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	LITexec; Put value that follows on TOS
	$FFFF; Literal Value
	VarflMPERR; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	BEGIN
		TRIGER-LAMPexec
		Const0;  Push $0000 onto TOS
	   BEGIN
			1+exec;    Add 1 TO TOS
			DUPexec; Duplicate TOS
			LITexec; Put value that follows on TOS
			$000A; Literal Value
			>exec;	 NOS > TOS?
			VarA/DStatus; Push Var Addr onto TOS
			C@exec;  Push (Char) Data Contained in TOS Addr to TOS
			LITexec; Put value that follows on TOS
			$00FF; Literal Value
			XORexec;  XOR NOS with TOS
			ConstLMPDtaRdy
			ANDexec;  AND NOS with TOS
			ORexec;  OR NOS with TOS
			?VIAL-OUT
			OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
			$0010
				LITexec; Put value that follows on TOS
				$FFFF
				DUPexec; Duplicate TOS
				VarfABORT
				!exec; Store NOS to Addr in TOS
				BRANCHexec
				$0004
			ELSE
				Const0;  Push $0000 onto TOS
			ENDIF
			ORexec;  OR NOS with TOS
		OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
		$FFCC
		LITexec; Put value that follows on TOS
		$000A
		>exec;	 NOS > TOS?
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$0020
			Const1;  Push $0001 onto TOS
			VarLMPERR
			+!exec; Add NOS to Addr in TOS
			Const1;  Push $0001 onto TOS
			Var#LMPERR
			+!exec; Add NOS to Addr in TOS
			VarLMPERR
			@exec; Push Data Contained in TOS Addr to TOS
			Const3;  Push $0003 onto TOS
			>exec;	 NOS > TOS?
			OBRANCHexec
			$0004
				LMPFAILexec
			ENDIF
			BRANCHexec
			$0008
		ELSE
			Const0;  Push $0000 onto TOS
			VarflMPERR
			!exec; Store NOS to Addr in TOS
		ENDIF
		VarflMPERR
		@exec; Push Data Contained in TOS Addr to TOS
		0=exec; Set TOS to TRUE if 0, ELSE FALSE
		VarfABORT
		@exec; Push Data Contained in TOS Addr to TOS
		ORexec;  OR NOS with TOS
		OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
		$FF8A
	VarLMPERR
	@exec; Push Data Contained in TOS Addr to TOS
	>exec;	 TOS>0?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0023
		CRexec; Send Carriage Return
		VarLMPERR
		@exec; Push Data Contained in TOS Addr to TOS
		.exec
		."exec;  Print Literal String
		$14
		"DATA READY ERROR(s)"
		CRexec; Send Carriage Return
	ENDIF
	;Sexec

org 3DB0
DRError db 'DATA READY ERROR(s)'

;; Rt~
3DC8
	$83
	"Rt~"
	$3D07; Backward Link
VarRt~:
3DCE	GetVar
	$0EDA

;Gain and Mux Control Assembly Code Subroutine

;; 0 VARIABLE TmpX
3DD2
	$84
	"TmpX"
	$3DC8; Backward Link
VarTmpX:
3DD9	GetVar
	$0EDC

3DDD
;; @GAINCode
	$89
	"@GAINCode"
	$3DD2; Backward Link
@GAINCodeexec:
3DE9	$3DEB

3DEB   @GAINCode:  LDX	 #$0000; clear GAINexp
3DEE		   STX   GAINexp   
3DF1		   LDX	 #$0007; default value
3DF4		   CLR B; default value
3DF5		   LDA A GAINvlu+1; get gain request code   
3DF8		   CMP A #$E8; is it 1000?
3DFA		   BNE	 Gain100; no, try 100   
3DFC   Gain1000:   LDX	 #$0000; value for 1000
3DFF		   LDA B #$03; value for 1000
3E01   Gain100:    CMP A #$64; is it 100?
3E03		   BNE	 Gain10; no, try 10   
3E05		   LDX	 #$0004; value for 100
3E08		   LDA B #$02; value for 1000
3E0A   Gain10:     CMP A #$0A; is it 10?
3E0C		   BNE	 GainDflt; no, use default (1?)   
3E0E		   LDX	 #$0006; value for 10
3E11		   LDA B #$01; value for 10
3E13   GainDflt:   STX	 $Tmpx   
3E16		   STA B GAINexp+1   
3E19		   LDA A Tmpx; gets calculated value stored from x into acc a,b 
3E1C		   LDA B Tmpx+1   
3E1F		   RTS

;; SET-ANALOG-CNTRL
3E20 $90; Code
	"SET-ANALOG-CNTRL"; Name
	$3DDD; Backward Link
SET-ANALOG-CNTRLexec:
3E33 $3E35 (SetADCtl:)

3E35   SetADCtl:   JSR	   GainCode   
3E38		   ORA B   MUXset+1   
3E3B		   ORA B   #$08; BKLite bit
3E3D		   STA B   MUXstat+1; Store code in image safe   
3E40		   STA B   MuxControl   
3E43		   JMP	NEXT


;; 0 VARIABLE SIG[Offset]
3E46 $8B
	"SIG[Offset]"
	$3E20; Backward Link
VarSIG[Offset]:
3E54	GetVar
	$0EDE

;; 0 VARIABLE SVstat
3E58
	$86
	"SVstat"
	$3E46; Backward Link
VarSVstat:
3E61	GetVar
	$0EE0

;; 0 VARIABLE 'GET[Sig] 
3E65
	$89
	"'GET[Sig]"
	$3E58; Backward Link
Var'GET[Sig]:
3E71	GetVar
	$0EE2

;; 0 VARIABLE #PRIMES
3E75
	$87
	"#PRIMES"
	$3E65; Backward Link
Var#PRIMES:
3E7F	GetVar
	$0EE4

;;; : SET[Offset] LMPstat @ DUP SVstat !   ( Save original LMPstat)
	9F AND 20 OR LMPstat ! ;    ( Then set for OFFSET measure)

;; SET[Offset]
3E83
	$8B; Code
	"SET[Offset]"; Name
	$3E75; Backward Link
SET[Offset]exec:
3E91	COLON; Complile The Following Section
	VarLMPstat  ; Push Var Addr onto TOS
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
	VarLMPstat  ; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	;Sexec
;;; : SET[Normal] SVstat @ LMPstat ! ; ( Reset NORMAL mode)
;; SET[Normal]
3EAF
	$8B; Code
	"SET[Normal]"; Name    
	$3E83; Backward Link
SET[Normal]exec:
3EBD	COLON; Complile The Following Section
	VarSVstat; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	VarLMPstat  ; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	;Sexec

: PRIME-LAMP-CONTROL ( Fire lamp to establish lamp control sig)   
	#PRIMES @ 0 DO TRIGER-LAMP LOOP ;

;; PRIME-LAMP-CONTROL
3EC9
	$92
	"PRIME-LAMP-CONTROL" 
	$3EAF; Backward Link
PRIME-LAMP-CONTROLexec:
3EDE	COLON; Complile The Following Section
	Var#PRIMES; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS for Loop Limit
	Const0;  Push $0000 onto TOS for Loop Index
	(DO)exec; Beginning of DO Loop
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
3EF7	GetVar
	$0EE6

;; 0 VARIABLE rtn
3EFB
	$83; Code
	"rtn"; Name
	$3EF0; Backward Link
Varrtn:
3F01	GetVar
	$0EE8

;; A/D!
3F05
	$84; Code
	"A/D!"; Name
	$3EFB; Backward Link
A/D!exec:
3F0C	$3F0E

3F0E   A/D!       LDA A   $0EC5   
3F11		  AND A   #$F0
3F13		  ORA A   A/Ddta   
3F16		  STA A   A/DHiByte   
3F19		  LDA B   A/Ddta+1   
3F1C		  STA B   A/DLowByte   
3F1F		  RTS

;; A/D>LMPstat  
3F20
	$8B; Code
	"A/D>LMPstat"; Name
	$3F05; Backward Link
A/D>LMPstatexec:
3F2E	$3F30
    
3F30   S_3F30     AND A   #$0F
3F32		  LDA B   $0EC5   
3F35		  AND B   $00F0   
3F37		  ABA  
3F38		  STA A   $0EC5   
3F3B		  RTS

;;; 0 VARIABLE LOOPcntr
3F3C
	 $88; Code
	 "LOOPcntr"; Name
	 $3F20; Backward Link
VarLOOPcntr:
3F47 	GetVar
	 $0EEA

;; A/DCNVRT
3F4B
	 $88
	 "A/DCNVRT"
	 $3F3C; Backward Link
A/DCNVRTexec:
3F56 $3F58

3F58   L_3F58     LDA A   #$0C
3F5A		  STA A   $0EEA   
3F5D		  LDX	  #$0800; Midpoint value for 12 bits
3F60		  STX	  $0EC6   
3F63		  LDX	  #$0000
3F66		  STX	  A/Ddta   
3F69   L_3F69     LDA A   A/Ddta   
3F6C		  LDA B   $0EC9   
3F6F		  ORA A   $0EC6   
3F72		  ORA B   $0EC7   
3F75		  STA A   A/Ddta   
3F78		  STA B   $0EC9   
3F7B		  JSR	  A/D!   
3F7E		  LDA A   A/DStatus   
3F81		  BMI	  L_3F95   
3F83		  LDA A   A/Ddta   
3F86		  LDA B   $0EC9   
3F89		  EOR A   $0EC6   
3F8C		  EOR B   $0EC7   
3F8F		  STA A   A/Ddta   
3F92		  STA B   $0EC9   
3F95   L_3F95     CLC  
3F96		  ROR	  $0EC6   
3F99		  ROR	  $0EC7   
3F9C		  DEC	  $0EEA   
3F9F		  LDA A   $0EEA   
3FA2		  BNE	  L_3F69   
3FA4		  LDA A   A/Ddta   
3FA7		  LDA B   $0EC9   
3FAA		  JMP	  PUSHD
	
3FAD   L_3FAD     JSR	  S_3F30   
3FB0		  JMP	  NEXT

*******************************************************
;;; The following line's comment is very telling: rather than
    alloting 20 Words, it really is alloting 22 bytes!!! This occurs
    many times in the program, but this one is unique in that the
    comment proves that the programmer had no clue what was
    acually happening. In some cases the effect is just that of wasting memory
    bytes. In others, it may cause variables following to be clobbered
    because the programmer thought he was alloting bytes instead of
    words. The VARIABLE word allots 2 bytes in addition to the
    ALLOT bytes (not words). That is why we see wierd amounts of
    storage allocation in many places (such as 6 and 10 bytes).

    So, in the following example, the guy thinks he is asking for
    20 WORDS of storage, but is actually getting 2+20 or 22 bytes)

;;; 0 VARIABLE DltaGains 20 ALLOT-RAM (Allot 20 words of RAM to DltaGains)
3FB3
	$89; Code
	"DltaGains"; Name
	$3F4B; Backward Link
VarDltaGains:
3FBF	GetVar
	$0EEC

;;; : SCALE-GAIN ( n -- exp,N) 0 SWAP -4 1000 0 DltaGains @ nF*/ ;  
	Swap 0 and -4 1000 0 Leave DltaGains
3FC3
	$8A; Code
	"SCALE-GAIN"; Name
	$3FB3; Backward Link
SCALE-GAINexec:
3FD0	COLON; Complile The Following Section
	Const0;  Push $0000 onto TOS
	SWAPexec; Swap TOS with NOS
	LITexec; Put value that follows on TOS
	$FFFC; Literal Value
	LITexec; Put value that follows on TOS
	1000; Literal Value
	Const0;  Push $0000 onto TOS
	VarDltaGains; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	nF*/exec
	;Sexec

;;; : DSPLYGc's			 ( Display correction factors on CRT)   
	CR ." Gain factors Gc0,Gc1,Gc2,Gc3 "					   
	[ DltaGains 16 + ] LITERAL DltaGains  
 	 LITERAL if compiling, compile stack val n as 16bit literal when executed will leave n on stack				    
	DO ( DUP) I 2@ 0 ROT FORMAT-ANSWER SPACE TYPE 4 +LOOP ;
3FE8
	$89; Code
	"DSPLYGc's"; Name
	$3FC3; Backward Link
DSPLYGc'sexec:
3FF4	COLON; Complile The Following Section
	CRexec; Send Carriage Return
	."exec
	$1D	; Number of Chars in print String
	" Gain factors Gc0,Gc1,Gc2,Gc3 "
	LITexec; Put value that follows on TOS
	$0EFC; Literal Value
	VarDltaGains; Push Var Addr onto TOS
	(DO)exec; Beginning of DO Loop
		)exec
		2@exec;  fetches a double integer to the stack
		Const0;  Push $0000 onto TOS
		ROTexec;    Rotate top 3 on stack
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
403D	GetVar
	$0F02

;;; : FORMAT-GAIN ( n10 -- adr,cnt) 0 SWAP -2 100 0 s0 @ nF*/
	0 ROT FORMAT-ANSWER ;
4041
	$8B; Code
	"FORMAT-GAIN"; Name 
	$4038; Backward Link
FORMAT-GAINexec:
404F	COLON; Complile The Following Section
	Const0;  Push $0000 onto TOS
	SWAPexec; Swap TOS with NOS
	LITexec; Put value that follows on TOS
	$FFFE; Literal Value
	LITexec; Put value that follows on TOS
	$0064; Literal Value
	Const0;  Push $0000 onto TOS
	Vars0; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	nF*/exec
	Const0;  Push $0000 onto TOS
	ROTexec;    Rotate top 3 on stack
	FORMAT-ANSWERexec
	;Sexec

;;; : TYPEGAINS ."   GAIN " DUP FORMAT-GAIN TYPE ;
406D
	$89; Code
	"TYPEGAINS"; Name
	$4041; Backward Link
TYPEGAINSexec:
4079	COLON; Complile The Following Section
	."exec;  Print Literal String
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
4097	GetVar
	$0F04

;;; 0 VARIABLE MINSMPL#
409B
	$88; Code
	"MINSMPL#"; Name
	$408D; Backward Link
VarMINSMPL#:
40A6	GetVar
	$0F06

;;; 0 VARIABLE R[Hi]
40AA
	$85; Code
	"R[Hi]:; Name
	$409B; Backward Link
VarR[Hi]:
40B2	GetVar
	$0F08

;;; 0 VARIABLE R[Lo]
40B6
	$85; Code
	"R[Lo]"; Name
	$40AA; Backward Link
VarR[Lo]:
40BE	GetVar
	$0F0A

;;; 0 VARIABLE Dlta
40C2
	$84; Code
	"Dlta"; Name
	$40B6; Backward Link
VarDlta:
40C9	GetVar
	$0F0C

;;; 0 VARIABLE SUM[Rn] 4 ALLOT-RAM
40CD
	$87; Code
	"SUM[Rn]"; Name
	$40C2; Backward Link
VarSUM[Rn]:
40D7	GetVar
	$0F0E

;;; 0 VARIABLE 1/Dlta 4 ALLOT-RAM
40DB
	$86; Code
	"1/Dlta; Name
	$40CD; Backward Link
Var1/Dlta:
40E4	GetVar
	$0F14

;;; 50 CONSTANT #GTRIES
40E8
	$87; Code
	"#GTRIES; Name
	$40DB; Backward Link
Const#GTRIES:;	Push $0032 onto TOS
40F2	GetVar
	$0032

;;; 1000 CONSTANT GLimit
40F6
	$86; Code
	"GLimit"; Name
	$40E8; Backward Link
ConstGLimit:
40FF	GetVar
	1000

;;; 0 VARIABLE fNFg>Lim
4103
	$88; Code
	"fNFg>Lim; Name
	$40F6; Backward Link
VarfNFg>Lim:
410E	GetVar
	$0F1A

;;; 0 VARIABLE fOffset
4112
	$87; Code
	"fOffset" Name
	$4103; Backward Link
VarfOffset:
411C	GetVar
	$0F1C

;;; : INIT-SIGFILTER 0. SUM[Rn] 2! 0 R[Hi] ! 32767 R[Lo] ! 0 CYCL[n] ! ;
4120
	$8E; Code
	"INIT-SIGFILTER"
	$4112; Backward Link
INIT-SIGFILTERexec:
4131	COLON; Complile The Following Section
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
TYPE-%Dltaexec:
4162	COLON; Complile The Following Section
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

;;; : GTYPE-ALL CR SUM[Rn] 2@ CYCL[n] @ 8 * D/				    ." GAINSIG=" D.									    
4178
	 $89			   
	 "GTYPE-ALL"; Name
	 $4155; Backward Link
GTYPE-ALLexec:
4184	COLON; Complile The Following Section
	 CRexec; Send Carriage Return
	 VarSUM[Rn]; Push Var Addr onto TOS
	 2@exec;  fetches a double integer to the stack
	 VarCYCL[n]; Push Var Addr onto TOS
	 @exec; Push Data Contained in TOS Addr to TOS
	 LITexec; Put value that follows on TOS
	 $0008; Literal Value
	 *exec ;  Multiply TOS by NOS
	 D/exec;	 Double Divide
	 ."exec;  Print Literal String
	 $08	; Number of Chars in print String
	 "GAINSIG="
	 D.exec
	 ."exec;  Print Literal String
	 $07	; Number of Chars in print String
	 "%DLTA="
	 VarDlta; Push Var Addr onto TOS
	 @exec; Push Data Contained in TOS Addr to TOS
	 Const0;  Push $0000 onto TOS
	 TYPE-%Dltaexec
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
41C5	COLON; Complile The Following Section
	Const0;  Push $0000 onto TOS
	LITexec; Put value that follows on TOS
	$0008; Literal Value for Loop Limit
	Const0;  Push $0000 onto TOS for Loop Index
	(DO)exec; Beginning of DO Loop
		FIRE-LAMPexec
		A/DCNVRTexec
		+exec; Add NOS To TOS
	(LOOP)exec
	$FFF8
	DUPexec; Duplicate TOS
	VarR[Hi]; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	>exec;	 NOS > TOS?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0008; Branch Offset
		DUPexec; Duplicate TOS
		VarR[Hi]; Push Var Addr onto TOS
		!exec; Store NOS to Addr in TOS
	ENDIF
	DUPexec; Duplicate TOS
	VarR[Lo]; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	<exec;	 NOS<TOS?
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
4210	COLON; Complile The Following Section
	Var1/Dlta; Push Var Addr onto TOS
	2@exec;  fetches a double integer to the stack
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$000A; Branch Offset
		DROPexec; Delete TOS
		Const0;  Push $0000 onto TOS
		BRANCHexec
		$001E
	ELSE
		DUPexec; Duplicate TOS
		0<exec ;	    TOS  <0?
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
		/exec;   Divide TOS by NOS
	ENDIF
	VarDlta; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	GTYPE-ALLexec
	VarCYCL[n]; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	Const#GTRIES;  Push $0032 onto TOS
	>exec;	 NOS > TOS?
	LITexec; Put value that follows on TOS
	$0064; Literal Value
	Const#GTRIES;  Push $0032 onto TOS
	*exec ;  Multiply TOS by NOS
	Const0;  Push $0000 onto TOS
	VarSUM[Rn]; Push Var Addr onto TOS
	2@exec;  fetches a double integer to the stack
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
		CRexec; Send Carriage Return
		."exec;  Print Literal String
		$13	; Number of Chars in print String
		"UNSTABLE GAIN DATA "
		CRexec; Send Carriage Return
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

;; GET-TEST-SIG
4292
	$8C; Code
	"GET-TEST-SIG"; Name
	$4203; Backward Link
GET-TEST-SIGexec:
42A1	COLON; Complile The Following Section
	INIT-SIGFILTERexec
	SPACEexec
	Const#GTRIES;  Push $0032 onto TOS
	2+exec;    Add 2 TO TOS for Loop Limit
	Const0;  Push $0000 onto TOS for Loop Index
	(DO)exec; Beginning of DO Loop
		@TEST-SIGexec
		VarSUM[Rn]; Push Var Addr onto TOS
		2@exec;  fetches a double integer to the stack
		D+exec; Add Double Numbers on Stack
    	VarSUM[Rn]; Push Var Addr onto TOS
		2!exec; Store NOS and 2nd NOS to Addr in TOS
		Const1;  Push $0001 onto TOS
		VarCYCL[n]; Push Var Addr onto TOS
		+!exec; Add NOS to Addr in TOS
		VarCYCL[n]; Push Var Addr onto TOS
		@exec; Push Data Contained in TOS Addr to TOS
		DUPexec; Duplicate TOS
		.exec;	   Print to Screen
		VarMINSMPL#; Push Var Addr onto TOS
		@exec; Push Data Contained in TOS Addr to TOS
		>exec;	 NOS > TOS?
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$0044; Branch Offset
			VarSUM[Rn]; Push Var Addr onto TOS
			2@exec;  fetches a double integer to the stack
			VarR[Hi]; Push Var Addr onto TOS
			@exec; Push Data Contained in TOS Addr to TOS
			VarR[Lo]; Push Var Addr onto TOS
			@exec; Push Data Contained in TOS Addr to TOS
			-exec	; Subtract TOS From NOS
			Const1;  Push $0001 onto TOS
			MAXexec
			D/exec;	 Double Divide
			2DUPexec; Duplicate TOS/NOS
			Var1/Dlta; Push Var Addr onto TOS
			2!exec; Store NOS and 2nd NOS to Addr in TOS
			ConstGLimit
			Const0;  Push $0000 onto TOS
			d>exec; 3rd and 4th > 1st and 2nd?
			VarfABORT
			@exec; Push Data Contained in TOS Addr to TOS
			ORexec;  OR NOS with TOS
			VarSUM[Rn]; Push Var Addr onto TOS
			2@exec;  fetches a double integer to the stack
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
	2@exec;  fetches a double integer to the stack
	VarCYCL[n]; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	LITexec; Put value that follows on TOS
	$0008; Literal Value
	*exec ;  Multiply TOS by NOS
	D/exec;	 Double Divide
	DROPexec; Delete TOS
	;Sexec

;;; : READtest CR ." Sig " 0 fOffset ! GET-TEST-SIG ;			
432F
	$88; Code
	"READtest" Name
	$4292; Backward Link
READtestexec:
433A	COLON; Complile The Following Section
	CRexec; Send Carriage Return
	."exec;  Print Literal String
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
 	$432F; Backward Link
READoffsetexec:
435C	COLON; Complile The Following Section
	CRexec; Send Carriage Return
	."exec;  Print Literal String
	$07	; Number of Chars in print String
	"Offset "
	SET[Offset]exec
	LITexec; Put value that follows on TOS
	$0007; Literal Value

;;; ( GAIN MEASUREMENT					    08:04 10/23/89 )
;;; : SETtestSIG ( Set test signal input) LMPstat @ TESTmode OR LMPstat ! ;
4382
	$8A; Code
	"SETtestSIG"; Name
	$434F; Backward Link
SETtestSIGexec:
438F	COLON; Complile The Following Section
	VarLMPstat  ; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	ConstTESTmode;  Push $0060 onto TOS
	ORexec;  OR NOS with TOS
	VarLMPstat  ; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	;Sexec

;;; : SETnormalSIG ( Set normal detector signal input)   LMPstat @ TESTmode 255 XOR AND  LMPstat ! ;
439F
	$8C; Code
	"SETnormalSIG" Name
	$4382; Backward Link
SETnormalSIGexec:
43AE	COLON; Complile The Following Section
	VarLMPstat  ; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	ConstTESTmode;  Push $0060 onto TOS
	LITexec; Put value that follows on TOS
	$00FF; Literal Value
	XORexec;  XOR NOS with TOS
	ANDexec;  AND NOS with TOS
	VarLMPstat  ; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	;Sexec

;;; : @TEST[sig0] SIGchan  7 OR ConstBKLITEbit OR DUP MUXstat !		
   CHANmux C! 8 1- MINSMPL# ! READtest READoffset - ; 
43C4
	$8B; Code
	"@TEST[sig0]"; Name
	$439F; Backward Link
@TEST[sig0]exec:
43D2	COLON; Complile The Following Section
	ConstSIGchan
	LITexec; Put value that follows on TOS
	$0007; Literal Value
	ORexec;  OR NOS with TOS
	ConstBKLITEbit
	ORexec;  OR NOS with TOS
	DUPexec; Duplicate TOS
	VarMUXstat
	!exec; Store NOS to Addr in TOS
	ConstCHANmux
	C!exec;  Store NOS (Char)  to Addr in TOS
	LITexec; Put value that follows on TOS
	$0008; Literal Value
	1-exec; Subtract 1 from TOS (DEC TOS)
	VarMINSMPL#; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	READtestexec
	READoffsetexec
	-exec	; Subtract TOS From NOS
	;Sexec

;;; : @TEST[sig1] MUXstat @ 7 OR 1 XOR DUP MUXstat ! CHANmux C!	
  3 MINSMPL# ! READtest READoffset - ;
43FC
	$8B; Code
	"@TEST[sig1]"; Name
	$43C4; Backward Link
@TEST[sig1]exec:
440A	COLON; Complile The Following Section
	VarMUXstat
	@exec; Push Data Contained in TOS Addr to TOS
	LITexec; Put value that follows on TOS
	$0007; Literal Value
	ORexec;  OR NOS with TOS
	Const1;  Push $0001 onto TOS
	XORexec;  XOR NOS with TOS
	DUPexec; Duplicate TOS
	VarMUXstat
	!exec; Store NOS to Addr in TOS
	ConstCHANmux
	C!exec;  Store NOS (Char)  to Addr in TOS
	Const3;  Push $0003 onto TOS
	VarMINSMPL#; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	READtestexec
	READoffsetexec
	-exec	; Subtract TOS From NOS
	;Sexec

;;; : @TEST[sig2] MUXstat @ 7 OR 2 XOR DUP MUXstat ! CHANmux C!	
  3 MINSMPL# ! READtest READoffset - ;
4432
	$8B; Code
	"@TEST[sig2]" Name
	$43FC; Backward Link
@TEST[sig2]exec:
4440	COLON; Complile The Following Section
	VarMUXstat
	@exec; Push Data Contained in TOS Addr to TOS
	LITexec; Put value that follows on TOS
	$0007; Literal Value
	ORexec;  OR NOS with TOS
	Const2;  Push $0002 onto TOS
	XORexec;  XOR NOS with TOS
	DUPexec; Duplicate TOS
	VarMUXstat
	!exec; Store NOS to Addr in TOS
	ConstCHANmux
	C!exec;  Store NOS (Char)  to Addr in TOS
	Const3;  Push $0003 onto TOS
	VarMINSMPL#; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	READtestexec
	READoffsetexec
	-exec	; Subtract TOS From NOS
	;Sexec

;;; : @TEST[sig3] MUXstat @ 7 OR 4 XOR DUP MUXstat ! CHANmux C!	
  3 MINSMPL# ! READtest READoffset - ;
4468
	$8B
	"@TEST[sig3]; Name
	$4432; Backward Link
@TEST[sig3]exec:
4476	COLON; Complile The Following Section
	VarMUXstat
	@exec; Push Data Contained in TOS Addr to TOS
	LITexec; Put value that follows on TOS
	$0007; Literal Value
	ORexec;  OR NOS with TOS
	LITexec; Put value that follows on TOS
	$0004; Literal Value
	XORexec;  XOR NOS with TOS
	DUPexec; Duplicate TOS
	VarMUXstat
	!exec; Store NOS to Addr in TOS
	ConstCHANmux
	C!exec;  Store NOS (Char)  to Addr in TOS
	Const3;  Push $0003 onto TOS
	VarMINSMPL#; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	READtestexec
	READoffsetexec
	-exec	; Subtract TOS From NOS
	;Sexec

;;; 0 VARIABLE fGERR
44A0
	$85; Code
	"fGERR"; Name
	$4468; Backward Link
VarfGERR:
44A8	GetVar
	$0F1E

;;; "STRNG" "RNGERR  | GAIN RANGE ERROR	   |
44AC
	$87; Code
	""RNGERR"; Name
	$44A0; Backward Link
TxtRNGERR:
44B6 "GAIN RANGE ERROR	   "
	$00

;;; : Stop "STOPED DISPLAY1 w-TYPE
44D3
	$84; Code
	"Stop"; Name
	$44AC; Backward Link
Stopexec:
44DA	COLON; Complile The Following Section
	''STOPED
	ConstDISPLAY1; Push $0001 Onto TOS
	w-TYPEexec
	LITexec; Put value that follows on TOS
	$FFFF; Literal Value
	VarCALflg
	!exec; Store NOS to Addr in TOS
	SET-TESTrtn
	BKliteONexec
	BEGIN
		?BKliteOFFexec
		UPDATEkeyQexec
		Const0;  Push $0000 onto TOS
	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
	$FFF8; Branch Offset
	;Sexec

;;; : EVALGAIN ( n --   fGERR updated) DUP  9 < SWAP 12 > OR fNFg>Lim @ OR fGERR @ OR fGERR ! ;
44FA
	$88; Code
	"EVALGAIN"; Name
	$44D3; Backward Link
EVALGAINexec:
4505	COLON; Complile The Following Section
	DUPexec; Duplicate TOS
	LITexec; Put value that follows on TOS
	$0009; Literal Value
	<exec;	 NOS<TOS?
	SWAPexec; Swap TOS with NOS
	LITexec; Put value that follows on TOS
	$000C; Literal Value
	>exec;	 NOS > TOS?
	ORexec;  OR NOS with TOS
	VarfNFg>Lim; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	ORexec;  OR NOS with TOS
	VarfGERR; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	ORexec
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
4536	COLON; Complile The Following Section
	VarfGERR; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$000A; Branch Offset
		TxtRNGERR
		ConstDISPLAY2; Push $0002 onto TOS
		w-TYPEexec
		Stopexec
	ENDIF
	;Sexec

;;; ( GAIN MEASUREMENT					    11:29 09/23/89 )
;;; : CALC-GAINS  0 fGERR ! 0 fNFg>Lim ! PRIME-LAMP-CONTROL		 
	SETtestSIG  ( Set test mode)   
	CR ." Test Signals G0,G1,G2,G3 "						  
	@TEST[sig0] DUP >R DUP s0 ! DltaGains !					
	@TEST[sig1] TYPEGAINS DUP R / EVALGAIN					 
	SCALE-GAIN DltaGains 4 + 2!			   ( Gc10)		  
	@TEST[sig2] TYPEGAINS DUP R / EVALGAIN					 
	SCALE-GAIN DltaGains 4 + 2@ -4 10000 nF*/				   
	DltaGains 8 + 2!					   ( Gc100)		  
	@TEST[sig3] TYPEGAINS DUP R> / EVALGAIN					
	SCALE-GAIN DltaGains 8 + 2@ -4 10000 nF*/				   
	DltaGains 12 + 2!					 ( Gc1000)		  
	SETnormalSIG						 ( Set normal mode)   
	-4 10000 DltaGains 2! DSPLYGc's   ( Set Gc0=1.0000 & display)   GAINTEST ;
454A
	$8A; Code
	"CALC-GAINS"; Name
	$452B; Backward Link
CALC-GAINSexec:
4557	COLON; Complile The Following Section
	Const0;  Push $0000 onto TOS
	VarfGERR; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	Const0;  Push $0000 onto TOS
	VarfNFg>Lim; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	PRIME-LAMP-CONTROLexec
	SETtestSIGexec
	CRexec; Send Carriage Return
	."exec;  Print Literal String
	$19	; Number of Chars in print String
	"Test Signals G0,G1,G2,G3 "
	@TEST[sig0]exec
	DUPexec; Duplicate TOS
	>Rexec; Move TOS to Return Stack
	DUPexec; Duplicate TOS
	Vars0; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	VarDltaGains; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	@TEST[sig1]exec
	TYPEGAINSexec
	DUPexec; Duplicate TOS
	Rexec
	/exec;   Divide TOS by NOS
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
	/exec;   Divide TOS by NOS
	EVALGAINexec
	SCALE-GAINexec
	VarDltaGains; Push Var Addr onto TOS
	LITexec; Put value that follows on TOS
	$0004; Literal Value
	+exec; Add NOS To TOS
	2@exec;  fetches a double integer to the stack
	LITexec; Put value that follows on TOS
	$FFFC; Literal Value
	LITexec; Put value that follows on TOS
	$2710; Literal Value
	nF*/exec
	VarDltaGains; Push Var Addr onto TOS
	LITexec; Put value that follows on TOS
	$0008; Literal Value
	+exec; Add NOS To TOS
	2!exec; Store NOS and 2nd NOS to Addr in TOS
	@TEST[sig3]exec
	TYPEGAINSexec
	DUPexec; Duplicate TOS
	R>exec;   Retrieve TOS from return stack.
	/exec;   Divide TOS by NOS
	EVALGAINexec
	SCALE-GAINexec
	VarDltaGains; Push Var Addr onto TOS
	LITexec; Put value that follows on TOS
	$0008; Literal Value
	+exec; Add NOS To TOS
	2@exec;  fetches a double integer to the stack
	LITexec; Put value that follows on TOS
	$FFFC; Literal Value
	LITexec; Put value that follows on TOS
	$2710; Literal Value
	nF*/exec
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
4626	COLON; Complile The Following Section
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
463D	COLON; Complile The Following Section
	LITexec; Put value that follows on TOS
	$0000; Literal Value
	LITexec; Put value that follows on TOS
	$0000; Literal Value
	LITexec; Put value that follows on TOS
	$000A; Literal Value for Loop Limit
	Const0;  Push $0000 onto TOS for Loop Index
	(DO)exec; Beginning of DO Loop
		FIRE-LAMPexec
		GET[Sig]exec
		Const0;  Push $0000 onto TOS
    	D+exec; Add Double Numbers on Stack
		?VIAL-OUTexec
		VarfABORT
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
	D/exec;	 Double Divide
	DROPexec; Delete TOS
	;Sexec

;;; : UPDATE-OFFSET SET[Offset] GETAVE SET[Normal] SIG[Offset] ! ;  
4673
	$8D; Code
	"UPDATE-OFFSET"; Name
	$4634; Backward Link
UPDATE-OFFSETexec:
4683	COLON; Complile The Following Section
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
469C	COLON; Complile The Following Section
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
AGCGAINexec:
46B4	COLON; Complile The Following Section
	PRIME-LAMP-CONTROLexec
	CRexec; Send Carriage Return
	."exec;  Print Literal String
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
		*exec ;  Multiply TOS by NOS
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
		-exec	; Subtract TOS From NOS
		."exec;  Print Literal String
		$02;	Number of Chars in print String
		", "
		VarGAINvlu; Push Var Addr onto TOS
		@exec; Push Data Contained in TOS Addr to TOS
		.exec;	   Print to Screen
		."exec;  Print Literal String
		$02;	Number of Chars in print String
		"/ "
		DUPexec; Duplicate TOS
		.exec;	   Print to Screen
		LITexec; Put value that follows on TOS
		$012C; Literal Value
		>exec;	 NOS > TOS?
		VarGAINvlu; Push Var Addr onto TOS
		@exec; Push Data Contained in TOS Addr to TOS
		LITexec; Put value that follows on TOS
		1000; Literal Value
		>=exec;	 NOS >= TOS?
		ORexec;  OR NOS with TOS
		VarGAINexp; Push Var Addr onto TOS
		@exec; Push Data Contained in TOS Addr to TOS
		VarGAINlimit
		@exec; Push Data Contained in TOS Addr to TOS
		>=exec;	 NOS >= TOS?
		ORexec;  OR NOS with TOS
		VarfABORT
		@exec; Push Data Contained in TOS Addr to TOS
		ORexec;  OR NOS with TOS
	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
	$FFA6; Branch Offset
	;Sexec

;;; : SETGAIN  ( n -- ) 1 MAX GAINvlu ! SET-ANALOG-Cntrl ;
4731
	$87; Code
	"SETGAIN"; Name
	$46AA; Backward Link
SETGAINexec:
473B	COLON; Complile The Following Section
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
4754	GetVar
	$0F20

;;; 0 VARIABLE SIG[Ave] 8 ALLOT-RAM
4758
	$88; Code
	"SIG[Ave]"; Name
	$4749; Backward Link
VarSIG[Ave]:
4763	GetVar
	$0F2A

;;; 0 VARIABLE REF[Ave] 8 ALLOT-RAM
4767
	$88; Code
	"REF[Ave]"; Name
	$4758; Backward Link
VarREF[Ave]:
4772	GetVar
	$0F34

;;; 0 VARIABLE SIG[Ave]/REF[Ave] 8 ALLOT-RAM
4776
	$91; Code
	"SIG[Ave]/REF[Ave]"; Name
	$4767; Backward Link
VarSIG[Ave]/REF[Ave]:
478A	GetVar
	$0F3E

;;; : /RND ( d,n1 -- n2 rounded)
	DUP >R M/MOD DROP SWAP R> 2/ 1- > IF 1+ ENDIF ;
478E
	$84; Code
	"/RND; Name
	$4776; Backward Link
/RNDexec:
4795	COLON; Complile The Following Section
	DUPexec; Duplicate TOS
	>Rexec; Move TOS to Return Stack
	M/MODexec
	DROPexec; Delete TOS
	SWAPexec; Swap TOS with NOS
	R>exec;   Retrieve TOS from return stack.
	2/exec;  Divide TOS by 2
	1-exec; Subtract 1 from TOS (DEC TOS)
	>exec;	 NOS > TOS?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004; Branch Offset
		1+exec;    Add 1 TO TOS
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
47B8	GetVar
	$0064

;;; 0 VARIABLE SIGQUE QSIZ 2* ALLOT-RAM
47BC
	$86; Code
	"SIGQUE"; Name
	$47B1; Backward Link
VarSIGQUE:
47C5	GetVar
	$0F48

;;; 0 VARIABLE REFQUE QSIZ 2* ALLOT-RAM
47C9
	$86; Code
	"REFQUE"; Name
	$47BC; Backward Link
VarREFQUE:
47D2	GetVar
	$1012

;;; 0 VARIABLE S/RQUE QSIZ 2* ALLOT-RAM
47D6
	$86; Code
	"S/RQUE"; Name
	$47C9; Backward Link
VarS/RQUE:
47DF	GetVar
	$10DC

;;; 0 VARIABLE #SMPLS
47E3
	$86; Code
	"#SMPLS"; Name
	$47D6; Backward Link
Var#SMPLS:
47EC	GetVar
	$11A6
 
;;; 0 VARIABLE #OUTLYERS
47F0
	$89; Code
	"#OUTLYERS"; Name
	$47E3; Backward Link
Var#OUTLYERS:
47FC	GetVar
	$11A8

;;; 0 VARIABLE SMPL#
4800
	$85; Code
	"SMPL#"; Name
	$47F0; Backward Link
VarSMPL#:
4808	GetVar
	$11AA
 
;;; 0 VARIABLE SMPLtotal
480C
	$89; Code
	"SMPLtotal" Name
	$4800; Backward Link
VarSMPLtotal:
4818	GetVar
	$11AC

;;; 0 VARIABLE SMPLNDX
481C
	$87; Code
	"SMPLNDX"; Name
	$480C; Backward Link
VarSMPLNDX:
4826	GetVar
	$11AE

;;; 0 VARIABLE NDXlimit
482A
	$88; Code
	"NDXlimit"; Name
	$481C; Backward Link
VarNDXlimit:
4835	GetVar
	$11B0

;;; 0 VARIABLE f1stTEST
4839
	$88; Code
	"f1stTEST"; Name
	$482A; Backward Link
Varf1stTEST:
4844	GetVar
	$11B2
 
;;; 0 VARIABLE ASMBLY
4848
	$86; Code
	"ASMBLY"; Name
	$4839; Backward Link
VarASMBLY:
4851	GetVar
	$11B4

;;; 0 VARIABLE #SMPLtbl 8 ALLOT-RAM
4855
	$88; Code
	"#SMPLtbl"; Name
	$4848; Backward Link
Var#SMPLtbl:
4860	GetVar
	$11B6

;;; 0 VARIABLE #OUTLYRtbl 8 ALLOT-RAM
4864
	$8A; Code
	"#OUTLYRtbl"; Name
	$4855; Backward Link
Var#OUTLYRtbl:
4871	GetVar
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
Var#OUTLYRtbl0:
488B	GetVar
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
48A3	GetVar
	$488F

;;; : INIT-FLTRTBLS 8 0 DO #SMPLtbl0 I + @ #SMPLtbl I + !
	#OUTLYRtbl0 I + @ #OUTLYRtbl I + ! 2 +LOOP ;
48A7
	$8D; Code
	"INIT-FLTRTBLS"; Name
	$4897; Backward Link
INIT-FLTRTBLSexec:
48B7	COLON; Complile The Following Section
	LITexec; Put value that follows on TOS
	$0008; Literal Value for Loop Limit
	Const0;  Push $0000 onto TOS for Loop Index
	(DO)exec; Beginning of DO Loop
		Var#SMPLtbl0; Push Var Addr onto TOS
		)exec
		+exec; Add NOS To TOS
		@exec; Push Data Contained in TOS Addr to TOS
		Var#SMPLtbl; Push Var Addr onto TOS
		)exec
		+exec; Add NOS To TOS
		!exec; Store NOS to Addr in TOS
		Var#OUTLYRtbl0
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

;;; ( DATA READ							 1 17:26 05/10/81 
;;; : SET-#SMPLS ( gain --) 2* #SMPLtbl + @ #SMPLS ! ;
48E9
	$8A; Code
	"SET-#SMPLS"; Name
	$48A7; Backward Link
SET-#SMPLSexec:
48F6	COLON; Complile The Following Section
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
4915	COLON; Complile The Following Section
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
INIT-MEASURE-CYCLEexec:
493A	COLON; Complile The Following Section
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
READ-SAMPLEexec:
497A	COLON; Complile The Following Section
	LITexec; Put value that follows on TOS
	$2710; Literal Value
	FIRE-LAMPexec
	GET[Sig]exec
	VarSIG[Offset]; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	-exec	; Subtract TOS From NOS
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
INIT-MEASURE-DATAexec:
49D4	COLON; Complile The Following Section
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
4A12	GetVar
	$11CA

;;; 0 VARIABLE MAXNDX
4A16
	$86; Code
	"MAXNDX"; Name
	$4A08; Backward Link
VarMAXNDX:
4A1F	GetVar
	$11CC

;;; 0 VARIABLE MINSMPL
4A23
	$87; Code
	"MINSMPL"; Name
	$4A16; Backward Link
VarMINSMPL:
4A2D	GetVar
	$11CE

;;; 0 VARIABLE MINNDX
4A31
	$86; Code
	"MINNDX"; Name
	$4A23; Backward Link
VarMINNDX:
4A3A	GetVar
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
4A4C	COLON; Complile The Following Section
	>Rexec; Move TOS to Return Stack
	DUPexec; Duplicate TOS
	VarMAXSMPL; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	>exec;	 NOS > TOS?
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
	<exec;	 NOS<TOS?
	VarMAXNDX; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	Rexec
	<>exec;		    NOS <> TOS?
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
	R>exec;   Retrieve TOS from return stack.
	2DROPexec; Remove TOS and NOS
	;Sexec

;;; ( OUTLYER REJECT						 16:10 10/23/89 ) 
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
4AA1	COLON; Complile The Following Section
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
	>exec;	 TOS>0?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$007A; Branch Offset
		VarNDXlimit; Push Var Addr onto TOS
		@exec; Push Data Contained in TOS Addr to TOS for Loop Limit
		Const0;  Push $0000 onto TOS for Loop Index
		(DO)exec; Beginning of DO Loop
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
			ELSE
				DROPexec; Delete TOS
			ENDIF
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
		<exec;	 NOS<TOS?
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
		ELSE
			DROPexec; Delete TOS
		ENDIF
		VarMINNDX; Push Var Addr onto TOS
		@exec; Push Data Contained in TOS Addr to TOS
		DUPexec; Duplicate TOS
		0>=exec
		OVERexec; Duplicate NOS at TOS
		VarNDXlimit; Push Var Addr onto TOS
		@exec; Push Data Contained in TOS Addr to TOS
		<exec;	 NOS<TOS?
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
		ELSE
			DROPexec; Delete TOS
		ENDIF
	ENDIF
	;Sexec

;;; : REJECT-OUTLYERS #OUTLYERS @ 0 DO REJECT-OUTLYER LOOP ;
4B45
	$8F; Code
	"REJECT-OUTLYERS"; Name
	$4A90; Backward Link
REJECT-OUTLYERS:
4B57	COLON; Complile The Following Section
	Var#OUTLYERS; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS for Loop Limit
	Const0;  Push $0000 onto TOS for Loop Index
	(DO)exec; Beginning of DO Loop
		REJECT-OUTLYERexec
	(LOOP)exec
	$FFFC
	;Sexec

;;; ( AVERAGE RATIO CALCULATION				06:29 10/24/89 ) 

;;; 0 VARIABLE %DIF 
4B69
	$84; Code
	"%DIF"; Name
	$4B45; Backward Link
Var%DIF:
4B70	GetVar
	$11D2

;;; 0 VARIABLE S/Rjst
4B74
	$86; Code
	"S/Rjst"; Name
	$4B69; Backward Link
VarS/Rjst:
4B7D	GetVar
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
SHFTDATAexec:
4B8C	COLON; Complile The Following Section
	VarAVE[S/R]; Push Var Addr onto TOS
	2@exec;  fetches a double integer to the stack
	LITexec; Put value that follows on TOS
	$0F24; Literal Value
	2!exec; Store NOS and 2nd NOS to Addr in TOS
	VarSIG[Ave]; Push Var Addr onto TOS
	2@exec;  fetches a double integer to the stack
	LITexec; Put value that follows on TOS
	$0F2E; Literal Value
	2!exec; Store NOS and 2nd NOS to Addr in TOS
	VarREF[Ave]; Push Var Addr onto TOS
	2@exec;  fetches a double integer to the stack
	LITexec; Put value that follows on TOS
	$0F38; Literal Value
	2!exec; Store NOS and 2nd NOS to Addr in TOS
	VarSIG[Ave]/REF[Ave]; Push Var Addr onto TOS
	2@exec;  fetches a double integer to the stack
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
@AVE[S/R]exec:
4BC4	COLON; Complile The Following Section
	VarGAINexp; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	MINUSexec;	  Negate TOS
	VarAVE[S/R]; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	EXITexec
	Const0;  Push $0000 onto TOS
	LITexec; Put value that follows on TOS
	$0F24; Literal Value
	@exec; Push Data Contained in TOS Addr to TOS
	Const0;  Push $0000 onto TOS
	D+exec; Add Double Numbers on Stack
	Const2;  Push $0002 onto TOS
	D/exec;	 Double Divide
	Const0;  Push $0000 onto TOS
	VarS/Rjst; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	LITexec; Put value that follows on TOS
	$000A; Literal Value for Loop Limit
	Const0;  Push $0000 onto TOS for Loop Index
	(DO)exec; Beginning of DO Loop
		2DUPexec; Duplicate TOS/NOS
		LITexec; Put value that follows on TOS
		$7FFF; Literal Value
		LITexec; Put value that follows on TOS
		$0000; Literal Value
		d>exec; 3rd and 4th > 1st and 2nd?
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$0012; Branch Offset
			Const1;  Push $0001 onto TOS
			VarS/Rjst; Push Var Addr onto TOS
			+!exec; Add NOS to Addr in TOS
			LITexec; Put value that follows on TOS
			$000A; Literal Value
			D/exec;	 Double Divide
			BRANCHexec
			$0004
    	ELSE
			LEAVEexec
    	ENDIF
	(LOOP)exec
	$FFDC
	DROPexec; Delete TOS
	VarGAINexp; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	VarS/Rjst; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	+exec; Add NOS To TOS
	MINUSexec;	  Negate TOS
	SWAPexec; Swap TOS with NOS
	;Sexec

;;; : ?DATA-STABLE ( -- f	Difference < 5%? of AVE or .0015 ABS)
	AVE[S/R] @ [ AVE[S/R] 4 + ] LITERAL @ 2DUP + 2/ >R
	- ABS DUP 15 < SWAP 10000 R> */ DUP %DIF ! 500 < OR ;
4C28
	$8C; Code
	"?DATA-STABLE"; Name
	$4BB8; Backward Link
?DATA-STABLEexec:
4C37	COLON; Complile The Following Section
	VarAVE[S/R]; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	LITexec; Put value that follows on TOS
	$0F24; Literal Value
	@exec; Push Data Contained in TOS Addr to TOS
	2DUPexec; Duplicate TOS/NOS
	+exec; Add NOS To TOS
	2/exec;  Divide TOS by 2
	>Rexec; Move TOS to Return Stack
	-exec	; Subtract TOS From NOS
	ABSexec;	   Absolute Value of TOS
	DUPexec; Duplicate TOS
	LITexec; Put value that follows on TOS
	$000F; Literal Value
	<exec;	 NOS<TOS?
	SWAPexec; Swap TOS with NOS
	LITexec; Put value that follows on TOS
	$2710; Literal Value
	R>exec;   Retrieve TOS from return stack.
	*/exec
	DUPexec; Duplicate TOS
	Var%DIF; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	LITexec; Put value that follows on TOS
	$01F4; Literal Value
	<exec;	 NOS<TOS?
	ORexec;  OR NOS with TOS
	;Sexec

;;; 0 VARIABLE SIGok
4C71
	$85; code
	"SIGok"; Name
	$4C28; Backward Link
VarSIGok:
4C79	GetVar
	$11D6

;;; 0 VARIABLE REFok
4C7D
	$85; Code
	"REFok"; Name
	$4C71; Backward Link
VarREFok:
4C85	GetVar
	$11D8

;;; 0 VARIABLE #BADPNTS
4C89
	$88; Code
	"#BADPNTS"; Name
	$4C7D; Backward Link
Var#BADPNTS:
4C94	GetVar
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
4CA3	COLON; Complile The Following Section
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
	(DO)exec; Beginning of DO Loop
		VarS/RQUE; Push Var Addr onto TOS
		)exec
		+exec; Add NOS To TOS
		@exec; Push Data Contained in TOS Addr to TOS
		DUPexec; Duplicate TOS
		0<exec ;	    TOS  <0?
		0=exec; Set TOS to TRUE if 0, ELSE FALSE
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
			>exec;	 NOS > TOS?
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
			<exec;	 NOS<TOS?
			OVERexec; Duplicate NOS at TOS
			LITexec; Put value that follows on TOS
			1000; Literal Value
			<exec;	 NOS<TOS?
			ORexec;  OR NOS with TOS
			DUPexec; Duplicate TOS
			OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
			$0008; Branch Offset
				Const0;  Push $0000 onto TOS
				VarREFok; Push Var Addr onto TOS
				!exec; Store NOS to Addr in TOS
			ENDIF
			ROTexec;    Rotate top 3 on stack
			ORexec;  OR NOS with TOS
			0=exec; Set TOS to TRUE if 0, ELSE FALSE
			OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
			$0022; Branch Offset
				Const0;  Push $0000 onto TOS
				VarREF[Ave]; Push Var Addr onto TOS
				2@exec;  fetches a double integer to the stack
				D+exec; Add Double Numbers on Stack
				VarREF[Ave]; Push Var Addr onto TOS
				2!exec; Store NOS and 2nd NOS to Addr in TOS
				Const0;  Push $0000 onto TOS
				VarSIG[Ave]; Push Var Addr onto TOS
				2@exec;  fetches a double integer to the stack
				D+exec; Add Double Numbers on Stack
				VarSIG[Ave]; Push Var Addr onto TOS
				2!exec; Store NOS and 2nd NOS to Addr in TOS
				Const0;  Push $0000 onto TOS
				D+exec; Add Double Numbers on Stack
				BRANCHexec
				$001A
			ELSE
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
			ENDIF
			BRANCHexec
			$0004
		ELSE
			DROPexec; Delete TOS
		ENDIF
		Const2;  Push $0002 onto TOS
	(+LOOP)exec
	$FF5A
	;Sexec

;;; (AVERAGE RATIO CALCULATION				06:29 10/24/89 )
;;; ( CALC[AveS/R] calculates the averages of sig/ref, sig, & ref.  
;;; ( In the process it rejects saturated sig points and points	
;;; ( where the ref is saturated or too low  
;;; : CALC[AveS/R] ( -- n   n = 0->10000 = 0.0->1.0000 )
	0. SIG[Ave] 2! 0. REF[Ave] 2! -1 SIGok ! -1 REFok !
	AVE-DATA						    ( Rtn with SUM S/R)
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
CALC[AveS/R]exec:
4D74	COLON; Complile The Following Section
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
	>Rexec; Move TOS to Return Stack
	/RNDexec
	DUPexec; Duplicate TOS 
	VarAVE[S/R]; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	LITexec; Put value that follows on TOS
	$2710; Literal Value
	VarSIG[Ave]; Push Var Addr onto TOS
	2@exec;  fetches a double integer to the stack
	Rexec
	/RNDexec
	DUPexec; Duplicate TOS
	VarSIG[Ave]; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	VarREF[Ave]; Push Var Addr onto TOS
	2@exec;  fetches a double integer to the stack
	R>exec;   Retrieve TOS from return stack.
	/RNDexec
	DUPexec; Duplicate TOS
	VarREF[Ave]; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	*/exec
	DUPexec; Duplicate TOS
	0<exec ;	    TOS  <0?
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
	ABSexec;	   Absolute Value of TOS
	Const1;  Push $0001 onto TOS
	MAXexec
	/exec;   Divide TOS by NOS
	Const1;  Push $0001 onto TOS
	>exec;	 NOS > TOS?
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

;;; ( DATA DISPLAY						   11:44 05/25/89 )

;;; 0 VARIABLE f-
4E18
    $82; Code
	"f-"; Name
	$4D65; Backward Link
Varf-:
4E1D	GetVar
	$11DC; Var Addr

;;; 0 VARIABLE DTALINE
4E21
	$87; Code
	"DTALINE"; Name
	$4E18; Backward Link
VarDTALINE:
4E2B	GetVar
	$11DE; Var Addr

;;; : TYPEdata DUP 0< MINUS f- ! ABS 0 <# #S #> 6 OVER - f- @ +
;;;	0 DO 32 EMIT LOOP f- @ IF 45 ( -) EMIT ENDIF TYPE ;
4E2F
	$88; Code
	"TYPEdata"; Name
	$4E21; Backward Link
4E3A	COLON; Complile The Following Section
TYPEdataexec:
	DUPexec; Duplicate TOS
	0<exec ;	    TOS  <0?
	MINUSexec;	  Negate TOS
	Varf-; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	ABSexec;	   Absolute Value of TOS
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
	(DO)exec; Beginning of DO Loop
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
4E8D	COLON; Complile The Following Section
	VarNDXlimit; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS for Loop Limit
	Const0;  Push $0000 onto TOS for Loop Index
	(DO)exec; Beginning of DO Loop
		CRexec; Send Carriage Return
		CRexec; Send Carriage Return
		."exec;  Print Literal String
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
		(DO)exec; Beginning of DO Loop
			VarSIGQUE; Push Var Addr onto TOS
			)exec
			+exec; Add NOS To TOS
			@exec; Push Data Contained in TOS Addr to TOS
			TYPEdataexec
			Const2;  Push $0002 onto TOS for Loop Index
		(+LOOP)exec
		$FFF2
		CRexec; Send Carriage Return
		."exec;  Print Literal String
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
		(DO)exec; Beginning of DO Loop
			VarREFQUE; Push Var Addr onto TOS
			)exec
			+exec; Add NOS To TOS
			@exec; Push Data Contained in TOS Addr to TOS
			TYPEdataexec
			Const2;  Push $0002 onto TOS
		(+LOOP)exec
		$FFF2
    	 CRexec; Send Carriage Return
		."exec;  Print Literal String
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
		(DO)exec; Beginning of DO Loop
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
DISPLAY-DATAexec:
4F33	COLON; Complile The Following Section
	VarfDSPLY
	@exec; Push Data Contained in TOS Addr to TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004; Branch Offset
		EXITexec
	ENDIF
	DISPLAY-QUESexec
	CRexec; Send Carriage Return
	."exec;  Print Literal String
	$05	; Number of Chars in print String
	"GAIN="
	VarGAINvlu; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	.exec;	   Print to Screen
	."exec;  Print Literal String
	$0A	; Number of Chars in print String
	"AVE[S/R]=GT"
	@exec; Push Data Contained in TOS Addr to TOS
	.exec;	   Print to Screen
	."exec;  Print Literal String
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
	."exec;  Print Literal String
	$0C	; Number of Chars in print String
	VarGAINexp; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	LITexec; Put value that follows on TOS
	$0004; Literal Value
	*exec ;  Multiply TOS by NOS
	VarBLANKdata
	+exec; Add NOS To TOS
	@exec; Push Data Contained in TOS Addr to TOS
	.exec;	   Print to Screen
	CRexec; Send Carriage Return
	."exec;  Print Literal String
	$09	; Number of Chars in print String
	"AVE[Sig]="
	VarSIG[Ave]; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	.exec;	   Print to Screen
	."exec;  Print Literal String
	"<LF> AVE[Ref]="
	VarREF[Ave]; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	.exec;	   Print to Screen
	CRexec; Send Carriage Return
	CRexec; Send Carriage Return
	;Sexec

;;; ( SELF TEST							 06:52 10/22/89 )

;;; DECIMAL
											  
;;; : TSTMSG "BLANK DISPLAY2 w-TYPE 1 DISPLAY2 wx-TYPE ;
4FD6
	$86; Code
	"TSTMSG"; Name
	$4F24; Backward Link
TSTMSGexec:
4FDF	COLON; Complile The Following Section
	TxtBLANK
	ConstDISPLAY2; Push $0002 onto TOS
	w-TYPEexec
	Const1;  Push $0001 onto TOS
	ConstDISPLAY2; Push $0002 onto TOS
	wx-TYPEexec
	;Sexec

;;; : STOP "STOPED DISPLAY1 w-TYPE 
	-1 CALflg ! SET-TESTrtn  ( Disable RECAL key & force rtn here)
	BKliteON BEGIN ?BKliteOFF UPDATEkeyQ 0 UNTIL ;
4FEF
	$84; Code
	"STOP"; Name
	$4FD6; Backward Link
STOPexec:
4FF6	COLON; Complile The Following Section
	''STOPED
	ConstDISPLAY1; Push $0001 Onto TOS
	w-TYPEexec
	LITexec; Put value that follows on TOS
	$FFFF; Literal Value
	VarCALflg
	!exec; Store NOS to Addr in TOS
	SET-TESTrtn
	BKliteONexec
	BEGIN
		?BKliteOFFexec
		UPDATEkeyQexec
		Const0;  Push $0000 onto TOS
	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
	$FFF8; Branch Offset
	;Sexec

;;; : PASSED "PASED 6 19 DISPLAY2 wx-TYPE 1000 DELAY[ms] ;
5016
	$86; Code
	"PASSED"; Name
	$4FEF; Backward Link
PASSEDexec:
501F	COLON; Complile The Following Section
	TxtPASED
	LITexec; Put value that follows on TOS
	$0006; Literal Value
	LITexec; Put value that follows on TOS
	$0013; Literal Value
	ConstDISPLAY2; Push $0002 onto TOS
	wx-TYPEexec
	LITexec; Put value that follows on TOS
	1000; Literal Value
	DELAY[ms]exec
	;Sexec

;;; : FAIL "FAIL 4 21 DISPLAY2 wx-TYPE STOP ;
5037
	$84; Code
	"FAIL"; Name
	;5016; Backward Link
FAILexec:
503E	COLON; Complile The Following Section
	$26AE
	LITexec; Put value that follows on TOS
	$0004; Literal Value
	LITexec; Put value that follows on TOS
	$0015; Literal Value
	ConstDISPLAY2; Push $0002 onto TOS
	wx-TYPEexec
	STOPexec
	;Sexec

( SELF TEST RAM CHECK					 06:38 02/27/90 ) 
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
505A	GetVar
	$11E0; Var Addr

;;; 0 VARIABLE Xrd
505E
	$83; Code
	"Xrd"; Name
	$5052; Backward Link
VarXrd:
5064	GetVar
	$11E2; Var Addr

;;; 0 VARIABLE Xwrt
5068 $84; Code
	"Xwrt"; Name
	$505E; Backward Link
VarXwrt:
506F	GetVar
	11E4; Var Addr

;;; CODE

;;; ERRxab
5073 $86; Code
	"ERRxab" ; Name
	$5068; Backward Link
ERRxabexec:
507C	$507E

507E   ERRxab:  STA A   Xwrt   
5081		  STA B   $11E5   
5084		  PUL A
5085		  STA A   XPNTR   
5088		  PUL A
5089		  STA A   XPNTR+1   
508C		  PUL A
508D		  CLR A
508E		  PSH A
508F		  LDA A   XPNTR+1   
5092		  PSH A
5093		  LDA A   XPNTR   
5096		  PSH A
5097		  STX	XPNTR   
509A		  LDA A   $00,X
509C		  STA A   Xrd   
509F		  LDA A   $01,X
50A1		  STA A   $11E3   
50A4		  CLR A
50A5		  RTS  

;; WORDchk
50A6
	$87
	"WORDchk"
	$5073; Backward Link
WORDchkexec:
5080	$50B2

50B2   WORDchk: CPX	#$0410
50B5		  BNE	L_50BD   
50B7		  LDX	#$0430
50BA		  LDA A   #$FF
50BC		  RTS
 
50BD   L_50BD     LDA A   $00,X
50BF		  LDA B   $01,X
50C1		  PSH B
50C2		  PSH A
50C3		  LDA A   #$FF
50C5		  PSH A
50C6		  LDA A   #$55
50C8		  LDA B   #$AA
50CA		  STA A   $00,X
50CC		  STA B   $01,X
50CE		  CMP A   $00,X
50D0		  BEQ	L_50D5   
50D2		  JSR	ERRxab   
50D5   L_50D5     TST A
50D6		  BEQ	L_50DF   
50D8		  CMP B   $01,X
50DA		  BEQ	L_50DF   
50DC		  JSR	ERRxab   
50DF   L_50DF     TST A
50E0		  BEQ	L_50EA   
50E2		  LDA A   #$AA
50E4		  LDA B   #$55
50E6		  STA A   $00,X
50E8		  STA B   $01,X
50EA   L_50EA     TST A
50EB		  BEQ	L_50F4   
50ED		  CMP A   $00,X
50EF		  BEQ	L_50F4   
50F1		  JSR	ERRxab   
50F4   L_50F4     TST A
50F5		  BEQ	L_50FE   
50F7		  CMP B   $01,X
50F9		  BEQ	L_50FE   
50FB		  JSR	ERRxab   
50FE   L_50FE     PUL A
50FF		  PUL B
5100		  STA B   $00,X
5102		  PUL B
5103		  STA B   $01,X
5105		  RTS

5106   L_5106   JMP	NEXT

;;; FORTH
  
;;; 2000 CONSTANT RAMEND
5109
	$85; Code
	"RAMEND"; Name
	$50A6; Backward Link
ConstRAMEND:
5111	GetVar
	$2000; Constant value

;;; 0000 CONSTANT RMSTRT
5115
	$86; Code
	"RMSTRT"; Name
	$5109; Backward Link
ConstRMSTRT:
511E	GetVar
	$0000

;;; CODE

;;; CLR-RAM
5122
	$87; Code
	"CLR-RAM"
	$5115; Backward Link
CLR-RAMexec:
512C $512E

512E   CLR-RAM: LDX	#$0DDC
5131   L_5131   CLR	$00,X
5133		  INX  
5134		  CPX	#RAMEND
5137		  BNE	L_5131   
5139		  JMP	NEXT   

;;; CHKRAM
513C
	$85; Code
	"CHKRAM"; Name
	$5122; Backward Link
CHKRAMexec:
5144 $5146

5146   CHKRAM:  LDA A   #$FF
5148		  STA A   fNMIOFF; Disable NMI   
514B		  LDX	#$0000
514E		  LDA A   #$FF
5150		  PSH A
5151		  PSH A
5152   L_5152   JSR	WORDchk   
5155		  TST A
5156		  BNE	L_515F   
5158		  TSX  
5159		  CLR	$00,X
515B		  CLR	$01,X
515D		  BRA	L_5167  
515F   L_515F   INX  
5160		  INX  
5161		  CPX	#RAMEND
5164		  BNE	L_5167   
5166		  CLR A
5167   L_5167   TST A
5168		  BNE	L_5152   
516A		  CLR	fNMIOFF; Enable printer NMI routine  
516D		  JMP	NEXT

;;; DECIMAL

;;; FORTH

; Analog Gain Check

;;; 0 VARIABLE fFAIL
5170
	$85; Code
	"fFAIL"; Name
	$513C; Backward Link
VarfFAIL:
5178	GetVar
	$11E6; Var Addr

;;; : LMPCHK
	16 #PRIMES ! PRIME-LAMP-CONTROL 50 'TrigDly @ !
	   0 #LMPERR ! 0. 10 0 DO 'FIRE-TEST @ EXECUTE
	   GET[Ref] 0 D+ fLMPERR @ IF 1 #LMPERR +! ENDIF LOOP ;
517C
	$86; Code
	"LMPCHK"; Name
	$5170; Backward Link
LMPCHKexec:
5185	COLON; Complile The Following Section
	LITexec; Put value that follows on TOS
	$0010; Literal Value
	Var#PRIMES; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	PRIME-LAMP-CONTROLexec
	LITexec; Put value that follows on TOS
	$0032; Literal Value
	Ptr'TrigDly
	@exec; Push Data Contained in TOS Addr to TOS
	!exec; Store NOS to Addr in TOS
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
	(DO)exec; Beginning of DO Loop
		Ptr'FIRE-TEST
		@exec; Push Data Contained in TOS Addr to TOS
		EXECUTEexec
		GET[Ref]exec
		Const0;  Push $0000 onto TOS
		D+exec; Add Double Numbers on Stack
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
SELFTESTexec:
51DC	COLON; Complile The Following Section
	Const0;  Push $0000 onto TOS
	VarfABORT
	!exec; Store NOS to Addr in TOS
	Const0;  Push $0000 onto TOS
	Var#LMPERR; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	CHK-DSPLYSexec
	Const3;  Push $0003 onto TOS
	DELAY[sec]exec
	TxtROMER
	ConstDISPLAY1; Push $0001 Onto TOS
	w-TYPEexec
	TxtSELFTST2
	ConstDISPLAY2; Push $0002 onto TOS
	w-TYPEexec
	Const2;  Push $0002 onto TOS
	DELAY[sec]exec
	TxtROMCK1
	Countexec
	TSTMSGexec
	Ptr'CALC-CHKSUM2
	@exec; Push Data Contained in TOS Addr to TOS
	EXECUTEexec
	1+exec;    Add 1 TO TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0008; Branch Offset
		FAILexec
		BRANCHexec
		$0004
	ELSE
		PASSEDexec
	ENDIF
	TxtROMCK2
	Countexec
	TSTMSGexec
	Ptr'CALC-CHKSUM2
	@exec; Push Data Contained in TOS Addr to TOS
	EXECUTEexec
	1+exec;    Add 1 TO TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0008; Branch Offset
		FAILexec
		BRANCHexec
		$0004
	ELSE
		PASSEDexec
	ENDIF
	CLR-RAMexec
	TxtRAMCK
	Countexec
	TSTMSGexec
	CHKRAMexec
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0008; Branch Offset
		FAILexec
		BRANCHexec
		$0004
	ELSE
		PASSEDexec
	ENDIF
	TxtLMPCK
	LITexec; Put value that follows on TOS
	$000A; Literal Value
	TSTMSGexec
	LMPCHKexec
	2DUPexec; Duplicate TOS/NOS
	CRexec; Send Carriage Return
	."exec;  Print Literal String
	$04	; Number of Chars in print String
	"REF="
	LITexec; Put value that follows on TOS
	$000A; Literal Value
	D/exec;	 Double Divide
	D.exec
	LITexec; Put value that follows on TOS
	1000; Literal Value
	LITexec; Put value that follows on TOS
	$0000; Literal Value
	D<exec
	Var#LMPERR; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	DUPexec; Duplicate TOS
	."exec;  Print Literal String
	$0E	; Number of Chars in print String
	"LAMP FAILURES="
	.exec;	   Print to Screen
	LITexec; Put value that follows on TOS
	$0005; Literal Value
	>exec;	 NOS > TOS?
	ORexec;  OR NOS with TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0008; Branch Offset
		FAILexec
		BRANCHexec
		$0004
	ELSE
		PASSEDexec
	ENDIF
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
52BC	GetVar; Processing Routine
	$6010; Constant value

;;; 6011 CONSTANT DTAREGI/O
52C0
	$89; CODE
	"DTAREGI/O"; Name
	$52B0; Backward Link
ConstDTAREGI/O:
52CC	GetVar; Processing Routine
	$6011; Constant value

;;; 00 CONSTANT RTCsec
52D0
	$86; CODE
	"RTCsec"; Name
	$52C0; Backward Link
ConstRTCsec:
52D9	GetVar; Processing Routine
	$0000; Constant value

;;; 02 CONSTANT RTCmin
52DD
	$86; CODE
	"RTCmin"; Name
	$52D0; Backward Link
ConstRTCmin:
52E6	GetVar; Processing Routine
	$0002; Constant value

;;; 04 CONSTANT RTChrs
52EA
	$86; CODE
	"RTChrs"; Name
	$52DD; Backward Link
ConstRTChrs:
52F3	GetVar; Processing Routine
	$0004; Constant value

;;; 07 CONSTANT RTCday
52F7
	$86; CODE
	"RTCday"; Name
	$52EA; Backward Link
ConstRTCday:
5300	GetVar; Processing Routine
	$0007; Constant value

;;; 08 CONSTANT RTCmonth
5304
	$86; CODE
	"RTCmonth"; Name
	$52F7; Backward Link
ConstRTCmonth:
530F	GetVar; Processing Routine
	$0008; Constant value

;;; 09 CONSTANT RTCyr
5313
	$85; CODE
	"RTCyr"; Name
	$5304; Backward Link
ConstRTCyr:
531B	GetVar; Processing Routine
	$0009; Constant value

;;; 0A CONSTANT UIPreg
531F
	$86; CODE
	"UIPreg"; Name
	$5313; Backward Link
ConstUIPreg:
5328	GetVar; Processing Routine
	$000A; Constant value

;;; 80 CONSTANT UIPbit
532C
	$86; CODE
	"UIPbit"; Name
	$531F; Backward Link
ConstUIPbit
5335	GetVar; Processing Routine
	$0080; Constant value

;;; 0B CONSTANT CLKset
5339
	$86; CODE
	"CLKset"; Name
	$532C; Backward Link
Const
5342	GetVar; Processing Routine
	$000B; Constant value

;;; 80 CONSTANT SETbit
5346
	$86; CODE
	"SETbit"; Name
	$5339; Backward Link
ConstSETbit:
534F	GetVar; Processing Routine
	$0080; Constant value

;;; 0A CONSTANT REGA
5353
	$84; CODE
	"REGA"; Name
	$5346; Backward Link
ConstREGA:
535A	GetVar; Processing Routine
	$000A; Constant value

;;; 0B CONSTANT REGB
535E
	$84; CODE
	"REGB"; Name
	$5353; Backward Link
ConstREGB:
5365	GetVar; Processing Routine
	$000B; Constant value

;;; 0C CONSTANT REGC
5369
	$84; CODE
	"REGC"; Name
	$535E; Backward Link
ConstREGC:
5370	GetVar; Processing Routine
	$000C; Constant value

;;; 0D CONSTANT REGD
5374
	$84; CODE
	"REGD"; Name
	$5369; Backward Link
ConstREGD:
537B	GetVar; Processing Routine
	$000D; Constant value

;;; 23 CONSTANT Ainit
537F
	$85; CODE
	"Ainit"; Name
	$5374; Backward Link
ConstAinit:
5387	GetVar; Processing Routine
	$0023; Constant value

;;; 0C CONSTANT Binit
538B
	$85; CODE
	"Binit"; Name
	$537F; Backward Link
ConstBinit:
5393	GetVar; Processing Routine
	$000C; Constant value

;;; 0E CONSTANT DAY0
5397
	$84; CODE
	"DAY0"; Name
	$538B; Backward Link
ConstDAY0:
539E	GetVar; Processing Routine
	$000E; Constant value

;;; 80 CONSTANT VTRbit
53A2
	$86; CODE
	"VTRbit"; Name
	$5397; Backward Link
ConstVTRbit:
53AB	GetVar; Processing Routine
	$0080; Constant value

;;; 0F CONSTANT MSBSMPL#
53AF
	$88; CODE
	"MSBSMPL#"; Name
	$53A2; Backward Link
ConstMSBSMPL#:
53BA	GetVar; Processing Routine
	$000F; Constant value

;;; 10 CONSTANT LSBSMPL#
53BE
	$88; CODE
	"LSBSMPL#"; Name
	$53AF; Backward Link
ConstLSBSMPL#:
53C9	GetVar; Processing Routine
	$0010; Constant value

;;; 3D CONSTANT RUNDLY#
53CD
	$87; CODE
	"RUNDLY#"; Name
 	$53BE; Backward Link
ConstRUNDLY#:
53D7	GetVar; Processing Routine
	$003D; Constant value

;;; 3F CONSTANT TSTBYTE#
53DB
	$88; CODE
	"TSTBYTE#"; Name
	$53CD; Backward Link
ConstTSTBYTE#:
53E6	GetVar; Processing Routine
	$003F; Constant value

;;; DECIMAL

;;; 0 VARIABLE TMPhrs
53EA
	$86; CODE
	"TMPhrs"; Name
	$53DB; Backward Link
VarTMPhrs:
53F3	GetVar; Processing Routine
	$11E8; Var Addr

;;; 0 VARIABLE CLKERRcnt
53F7
	$89; CODE
	"CLKERRcnt"; Name
	$53EA; Backward Link
VarCLKERRcnt:
5403	GetVar; Processing Routine
	$11EA; Var Addr

;;; 0 VARIABLE fPM
5407
	$83; CODE
	"fPM"; Name
	$53F7; Backward Link
VarfPM:
540D	GetVar; Processing Routine
	$11EC; Var Addr

;;; ?CLKerr 1 CLKERRcnt +! CLKERRcnt @ 1000 >
	  IF CR."CLOCK DATA RDY ERROR" QUIT ENDIF;
5411
	$87; Code
	"?CLKerr"; Name
	$5407; Backward Link
?CLKerrexec:
541B	COLON; Complile The Following Section
	Const1;  Push $0001 onto TOS
	VarCLKERRcnt; Push Var Addr onto TOS
	+!exec; Add NOS to Addr in TOS
	VarCLKERRcnt; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	LITexec; Put value that follows on TOS
	1000; Literal Value
	>exec;	 NOS > TOS?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$001D; Branch Offset; *** check this offset ***
		CRexec; Send Carriage Return
		."exec;  Print Literal String
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
UIPwaitexec:
5458	$545A

;;; CODE

;Real Time clock
545A   UIPWait:  LDA A   #UIPreg
545C		   STA A   $RTCControl   
545F		   LDA A   $RTCData   
5462		   AND A   #UIPbit
5464		   BNE	UIPWait   
5466		   RTS  

;;; !CLKDTA
5467
	$87; Code
	"!CLKDTA"; Name
	$544E; Backward Link
!CLKDTAexec:
5471 $5473

5473   L_5473    JSR	UIPWait   
5476		   PUL A
5477		   PUL A
5478		   STA A   RTCControl   
547B		   PUL B
547C		   PUL B
547D		   STA B   RTCData   
5480		   JMP	NEXT

;; @CLKDTA
5483
	$87; Code
	"@CLKDTA"; Name
	$5467; Backward Link
@CLKDTAexec:
548D $548F

548F   L_548F    JSR	UIPWait   
5492		   PUL A
5493		   PUL B
5494		   STA B   RTCControl   
5497		   LDA B   RTCData   
549A		   CLR A
549B		   JMP	PUSHD	
549E   L_549E    JMP	NEXT

;;; : @TSTBYTE ( --n) TSTBYTE# @CLKDTA ;
	' @TSTBYTE CFA '@TSTBYTE !
54A1
	$88; Code
	"@TSTBYTE"; Name
	$5483; Backward Link
@TSTBYTEexec:
54AC	COLON; Complile The Following Section
	ConstTSTBYTE#
	@CLKDTAexec
	;Sexec

;;; : !TSTBYTE ( n--) TSTBYTE# !CLKDTA ;
54B4
	$88; Code
	"!TSTBYTE"; Name
	$54A1; Backward Link
!TSTBYTEexec:
54BF	COLON; Complile The Following Section
	ConstTSTBYTE#
	!CLKDTAexec
	;Sexec

;;; : @RUNDLY ( --n) RUNDLY# @CLKDTA 256 * RUNDLY# 1+ @CLKDTA OR ;
54C7
	$87; Code
	"@RUNDLY"; Name
	$54B4; Backward Link
@RUNDLYexec:
54D1	COLON; Complile The Following Section
	RUNDLY#exec
	@CLKDTAexec
	LITexec; Put value that follows on TOS
	$0100; Literal Value
	*exec ;  Multiply TOS by NOS
	RUNDLY#exec
	1+exec;    Add 1 TO TOS
	@CLKDTAexec
	ORexec;  OR NOS with TOS
	;Sexec

;;; : !RUNDLY ( n--) DUP 256 / RUNDLY# !CLKDTA RUNDLY# 1+ !CLKDTA ;
54E7
	$87; Code
	"!RUNDLY"; Name
	$57C7; Backward Link
!RUNDLYexec:
54F1	COLON; Complile The Following Section
	DUPexec; Duplicate TOS
	LITexec; Put value that follows on TOS
	$0100; Literal Value
	/exec;   Divide TOS by NOS
	RUNDLY#exec
	!CLKDTAexec
	RUNDLY#exec
	1+exec;    Add 1 TO TOS
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

5513   L_5513      JSR	   UIPWait   
5516		   LDA A   #$0B
5518		   STA A   RTCControl   
551B		   LDA B   RTCData   
551E		   ORA B   #$80
5520		   STA A   RTCControl   
5523		   STA B   RTCData   
5526		   JMP	NEXT

;; STRTCLK
5529
	$87; Code
	"STRTCLK"; Name
	$5507; Backward Link
STRTCLKexec:
5533 $5535	  

5535   L_5535    JSR	UIPWait   
5538		   LDA A   #$0B
553A		   STA A   RTCControl  
553D		   LDA B   RTCData   
5540		   AND B   #$7F
5542		   STA A   RTCControl   
5545		   STA B   RTCData   
5548		   JMP	NEXT

;;; : @SMPL# ( -- n) MSBSMPL# @CLKDTA 256 * LSBSMPL# @CLKDTA OR ;
554B
	$86; Code
	"@SMPL#"; Name
	$5529; Backward Link
@SMPL#exec:
5554	COLON; Complile The Following Section
	ConstMSBSMPL#
	@CLKDTAexec
	LITexec; Put value that follows on TOS
	$0100; Literal Value
	*exec ;  Multiply TOS by NOS
	ConstLSBSMPL#
	@CLKDTAexec
	ORexec;  OR NOS with TOS
	;Sexec

;;; : !SMPL# ( n--) 256 /MOD MSBSMPL# !CLKDTA LSBSMPL#
5568
	$86; Code
	"!SMPL#"; Name
	$554B; Backward Link
!SMPL#exec:
5571	COLON; Complile The Following Section
	LITexec; Put value that follows on TOS
	$0100; Literal Value
	/MODexec
	ConstMSBSMPL#
	!CLKDTAexec
	ConstLSBSMPL#
	!CLKDTAexec
	;Sexec

;;; : +!SMPL# ( n --) @SMPL# + !SMPL# ;
5583
	$87; Code
	"+!SMPL#"; Name
	$5568; Backward Link
+!SMPL#exec:
558D	COLON; Complile The Following Section
	@SMPL#exec
	+exec; Add NOS To TOS
	!SMPL#exec
	;Sexec

;;; : CNVRTdate ( --adr,cnt) RTCmonth @CLKDTA 0 100 D* 
	RTCday @CLKDTA 0 D+ 100 D* RTCyr  @CLKDTA 0 D+
5597
	$89; Code
	"CNVRTdate"; Name
	$5583; Backward Link
CNVRTdateexec:
55A3	COLON; Complile The Following Section
	Constmonth
	@CLKDTAexec
	Const0;  Push $0000 onto TOS
	LITexec; Put value that follows on TOS
	$0064; Literal Value
	D*exec;	 Double Multiply
	ConstRTCday
	@CLKDTAexec
	Const0;  Push $0000 onto TOS
	D+exec; Add Double Numbers on Stack
	LITexec; Put value that follows on TOS
	$0064
	D*exec;	 Double Multiply
	ConstRTCyr
	@CLKDTAexec
	Const0;  Push $0000 onto TOS
	D+exec; Add Double Numbers on Stack
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
55EF	COLON; Complile The Following Section
	ConstRTChrs
	@CLKDTAexec
	DUPexec; Duplicate TOS
	LITexec; Put value that follows on TOS
	$007F; Literal Value
	>exec;	 NOS > TOS?
	VarfPM; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	LITexec; Put value that follows on TOS
	$007F; Literal Value
	ANDexec;  AND NOS with TOS
	Const0;  Push $0000 onto TOS
	LITexec; Put value that follows on TOS
	$0064; Literal Value
	D*exec;	 Double Multiply
	ConstRTCmin
	@CLKDTAexec
	Const0;  Push $0000 onto TOS
	D+exec; Add Double Numbers on Stack
	LITexec; Put value that follows on TOS
	$0064; Literal Value
	D*exec;	 Double Multiply
	ConstRTCsec
	@CLKDTAexec
	Const0;  Push $0000 onto TOS
	D+exec; Add Double Numbers on Stack
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
!CLKBUFxexec:
564C	COLON; Complile The Following Section
	VarCLKBUF
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
GET-SMPL#exec:
5664	COLON; Complile The Following Section
	ConstRTCday
	@CLKDTAexec
	ConstDAY0
	@CLKDTAexec
	OVERexec; Duplicate NOS at TOS
	ConstDAY0
	!CLKDTAexec
	<>exec;		    NOS <> TOS?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$000A; Branch Offset
		Const1;  Push $0001 onto TOS
		!SMPL#exec
		BRANCHexec
		$0006
	ELSE
		Const1;  Push $0001 onto TOS
		+!SMPL#exec
	ENDIF
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
CLKTSTexec:
5693	COLON; Complile The Following Section
	BEGIN
		STRTCLKexec
		CRexec; Send Carriage Return
		."exec;  Print Literal String
		$01	; Number of Chars in print String
		"["
		CNVRTdateexec
		TYPEexec
		."exec;  Print Literal String
		$01	; Number of Chars in print String
		" "
		CNVRTtimeexec
		TYPEexec
		."exec;  Print Literal String
		$02	; Number of Chars in print String
		"] "
		LITexec; Put value that follows on TOS
		$000E; Literal Value
		LITexec; Put value that follows on TOS for Loop Limit
		$000A; Literal Value for Loop Index
		(DO)exec; Beginning of DO Loop
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
			."exec;  Print Literal String
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
	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
	$FFA9; Branch Offset
	;Sexec

;;; ( NUMBER ENTRY

;;; : CLR-NUMBER  CLR-CHRBUF2 CHRBUF2 1+ BUF2pntr !
	x2 @ 1+ MINx @ DO 32 I DISPLAY2 wx-emit LOOP    ( Clr digits)
	MINx @ x2 ! ;				    ( Reset dsply clmn pntr)
56F2
	$8A: Code
	"CLR-NUMBER"; Name
	$568A; Backward Link
CLR-NUMBERexec:
56FF	COLON; Complile The Following Section
	CLR-CHRBUF2exec
	VarCHRBUF2
	1+exec;    Add 1 TO TOS
	VarBUF2pntr
	!exec; Store NOS to Addr in TOS
	Varx2
	@exec; Push Data Contained in TOS Addr to TOS
	1+exec;    Add 1 TO TOS
	VarMINx; Push Var Addr onto TOS for Loop Limit
	@exec; Push Data Contained in TOS Addr to TOS for Loop Index
	(DO)exec; Beginning of DO Loop
		LITexec; Put value that follows on TOS
		$0020; Literal Value
		)exec
		ConstDISPLAY2; Push $0002 onto TOS
		wx-emitexec
	(LOOP)exec
	$FFF4
	VarMINx; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	Varx2
	!exec; Store NOS to Addr in TOS
	;Sexec    

;;; : get[num] ( --  CHRBUF2 contains char string)
	BEGIN x2 @ MAXx @ >	   ( Display clmn pntr > last clmn ?)
	IF 0 BUF2pntr ! 0 fDP ! ENDIF	 ( clear char buffer pntr)
	BEGIN ?KEYPAD UNTIL PCkey 
	47 OVER < OVER 58 < AND ( 0->9 DIGITS only entered) 
	IF BUF2pntr @ 0= IF CLR-NUMBER ENDIF
	DUP x2 @ DISPLAY2 wx-emit 1 x2 +!   ( Display character)
	95 ( _) x2 @ DISPLAY2 wx-emit  ( Display nxt chr prompt)
	DUP BUF2pntr @ C! 1 BUF2pntr +!    ( Enter digit in buf)
	ENDIF x2 @ MAXx @ >	  ( Display clmn pntr > last clmn ?)
	IF 32 ( sp) x2 @ DISPLAY2 wx-emit ENDIF ( If so, clr prompt)
	ENT = UNTIL ;
572F
	$88; Code
	"get[num]"; Name
	$56F2; Backward Link
get[num]exec:
573A	COLON; Complile The Following Section
	BEGIN
		Varx2
		@exec; Push Data Contained in TOS Addr to TOS
		VarMAXx; Push Var Addr onto TOS
		@exec; Push Data Contained in TOS Addr to TOS
		>exec;	 NOS > TOS?
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$000E; Branch Offset
			Const0;  Push $0000 onto TOS
			VarBUF2pntr
			!exec; Store NOS to Addr in TOS
			Const0;  Push $0000 onto TOS
			VarfDP; Push Var Addr onto TOS
			!exec; Store NOS to Addr in TOS
			BEGIN
				?KEYPADexec
			OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
			$FFFC; Branch Offset
		ENDIF
		PCkeyexec
		LITexec; Put value that follows on TOS
		$002F; Literal Value
		OVERexec; Duplicate NOS at TOS
		<exec;	 NOS<TOS?
		OVERexec; Duplicate NOS at TOS
		LITexec; Put value that follows on TOS
		$003A; Literal Value
		<exec;	 NOS<TOS?
		ANDexec;  AND NOS with TOS
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$0038; Branch Offset
			VarBUF2pntr
			@exec; Push Data Contained in TOS Addr to TOS
			0=exec; Set TOS to TRUE if 0, ELSE FALSE
			OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
			$0004; Branch Offset
				CLR-NUMBERexec
			ENDIF
			DUPexec; Duplicate TOS
			Varx2
			@exec; Push Data Contained in TOS Addr to TOS
			ConstDISPLAY2; Push $0002 onto TOS
			wx-emitexec
			Const1;  Push $0001 onto TOS
			Varx2
			+!exec; Add NOS to Addr in TOS
			LITexec; Put value that follows on TOS
			$005F; Literal Value
			Varx2
			@exec; Push Data Contained in TOS Addr to TOS
			ConstDISPLAY2; Push $0002 onto TOS
			wx-emitexec
			DUPexec; Duplicate TOS
			VarBUF2pntr
			@exec; Push Data Contained in TOS Addr to TOS
			C!exec;  Store NOS (Char)  to Addr in TOS
			Const1;  Push $0001 onto TOS
			VarBUF2pntr
			+!exec; Add NOS to Addr in TOS
		ENDIF
		Varx2
		@exec; Push Data Contained in TOS Addr to TOS
		VarMAXx; Push Var Addr onto TOS
		@exec; Push Data Contained in TOS Addr to TOS
		>exec;	 NOS > TOS?
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$000E; Branch Offset
			LITexec; Put value that follows on TOS
			$0020; Literal Value
			Varx2
			@exec; Push Data Contained in TOS Addr to TOS
			ConstDISPLAY2; Push $0002 onto TOS
			wx-emitexec
		ENDIF
		ConstEnt
		=exec
	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
	$FF72; Branch Offset
	;Sexec

;;; : SET-INITVLU ( n--) 0 INITVLU 2! 0 INITVLU 4 + ! ;
57CE
	$8B; Code
	"SET-INITVLU"; Name
	$572F; Backward Link
SET-INITVLUexec:
57DC	COLON; Complile The Following Section
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
	CLR-CHRBUF2					   ( Clear digit buffer)
	0 fDP ! 0 f+/-# !  ( Clr dp entered flag & set POS NUM only)
	0 F#SGN !						 ( Clr neg data sign)
	INITVLU 2@ INITVLU 4 + @ F#CNVRT    ( Get init value string)
	2DUP CHRBUF2 1+ SWAP CMOVE ( Put init value strng in buffer)
	MINx @ DISPLAY2 wx-TYPE			 ( Display init value)
	MINx @ 1+ MAXx !				( Set for 2 digit input)
	MAXx @ 1+ x2 !			( Set dsply clmn > max allowed)
	get[num]		    ( Init digit entry & get whole number)
	CHRBUF2 NUMBER 2DUP INITVLU 2! DROP >R
	DPL @ 0 MAX MINUS INITVLU 4 + ! R> ;
57F2
	$88; Code
	"GET[num]"; Name
	$57CE; Backward Link
GET[num]exec:
57FD	COLON; Complile The Following Section
	CLR-CHRBUF2exec
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
	2@exec;  fetches a double integer to the stack
	VarINITVLU; Push Var Addr onto TOS
	LITexec; Put value that follows on TOS
	$0004; Literal Value
	+exec; Add NOS To TOS
	@exec; Push Data Contained in TOS Addr to TOS
	F#CNVRTexec
	2DUPexec; Duplicate TOS/NOS
	VarCHRBUF2
	1+exec;    Add 1 TO TOS
	SWAPexec; Swap TOS with NOS
	CMOVEexec
	VarMINx; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	ConstDISPLAY2; Push $0002 onto TOS
	wx-TYPEexec
	VarMINx; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	1+exec;    Add 1 TO TOS
	VarMAXx; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	VarMAXx; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	1+exec;    Add 1 TO TOS
	Varx2
	!exec; Store NOS to Addr in TOS
	get[num]exec
	VarCHRBUF2
	NUMBERexec
	2DUPexec; Duplicate TOS/NOS
	VarINITVLU; Push Var Addr onto TOS
	2!exec; Store NOS and 2nd NOS to Addr in TOS
	DROPexec; Delete TOS
	>Rexec; Move TOS to Return Stack
	DPLexec
	@exec; Push Data Contained in TOS Addr to TOS
	Const0;  Push $0000 onto TOS
	MAXexec
	MINUSexec;	  Negate TOS
	VarINITVLU; Push Var Addr onto TOS
	LITexec; Put value that follows on TOS
	$0004; Literal Value
	+exec; Add NOS To TOS
	!exec; Store NOS to Addr in TOS
	R>exec;   Retrieve TOS from return stack.
	;Sexec

;;; 0 VARIABLE SEC0
5871
	$84; Code
	"SEC0"; Name
	$57F2; Backward Link
VarSEC0:
5878	GetVar
	$11EE

;;; :DaTmDSPLY (--) STOPCLK ...
587C
	$89; CODE
	"DaTmDSPLY"; Name
	$5871; Backward Link
DaTmDSPLYexec:
5888	COLON; Complile The Following Section
	STOPCLKexec
	CNVRTdateexec
	LITexec; Put value that follows on TOS
	$0006; Literal Value
	LITexec; Put value that follows on TOS
	$0008; Literal Value
	ConstDISPLAY1; Push $0001 Onto TOS
	FORMAT-wxTYPEexec
	CNVRTtimeexec
	LITexec; Put value that follows on TOS
	$0011; Literal Value
	LITexec; Put value that follows on TOS
	$0008; Literal Value
	ConstDISPLAY1; Push $0001 Onto TOS
	FORMAT-wxTYPEexec
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
58B5	COLON; Complile The Following Section
	BEGIN
		DaTmDSPLYexec
		ConstRTCsec
		@CLKDTAexec
		VarSEC0; Push Var Addr onto TOS
		@exec; Push Data Contained in TOS Addr to TOS
		OVERexec; Duplicate NOS at TOS
		VarSEC0; Push Var Addr onto TOS
		!exec; Store NOS to Addr in TOS
		<>exec;		    NOS <> TOS?
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$0004; Branch Offset
			DaTmDSPLYexec
		ENDIF
		?KEYPADexec
		DUPexec; Duplicate TOS
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$0020; Branch Offset
			DROPexec; Delete TOS
			PCkeyexec
			ConstF1
			OVERexec; Duplicate NOS at TOS
			=exec
			OVERexec; Duplicate NOS at TOS
			ConstF3
			=exec
			ORexec;  OR NOS with TOS
			DUPexec; Duplicate TOS
			0=exec; Set TOS to TRUE if 0, ELSE FALSE
			OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
			$0006; Branch Offset
				SWAPexec; Swap TOS with NOS
				DROPexec; Delete TOS
			ENDIF
		ENDIF
	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
	$FFC2; Branch Offset
	ConstF3
	=exec
	;Sexec

;;; : ?CHNGtime "DaTm3 DISPLAY2 w-TYPE ?F3KEY ;
58FF
	$89; Code
	"?CHNGtime"; Name
	$58AC; Backward Link
?CHNGtimeexec:
590B	COLON; Complile The Following Section
	TxtDaTm3
	ConstDISPLAY2; Push $0002 onto TOS
	w-TYPEexec
	?F3KEYexec
	;Sexec

;;; : ?PM "AM/PM DISPLAY2 w-TYPE ?F3KEY ;
5917
	$83; Code
	"?PM"; Name
	$58FF; Backward Link
?PMexec:
591D	COLON; Complile The Following Section
	TxtAM/PM
	ConstDISPLAY2; Push $0002 onto TOS
	w-TYPEexec
	?F3KEYexec
	;Sexec

;;; : ?DaTmOK "DaTm1 DISPLAY1 w-TYPE
5929
	$87; Code
	"?DatmOK"; Name
	$5917; Backward Link
?DaTmOKexec:
5933	COLON; Complile The Following Section
	TxtDaTm1
	ConstDISPLAY1; Push $0001 Onto TOS
	w-TYPEexec
	TxtDaTm2
	ConstDISPLAY2; Push $0002 onto TOS
	w-TYPEexec
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
594F	COLON; Complile The Following Section
	STOPCLKexec
	Const0;  Push $0000 onto TOS
	ConstRTCsec
	!CLKDTAexec
	Const2;  Push $0002 onto TOS
	BLANKlineexec
	TxtYY
	Countexec
	DUPexec; Duplicate TOS
	2+exec;    Add 2 TO TOS
	DUPexec; Duplicate TOS
	VarMINx; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	2+exec;    Add 2 TO TOS
	VarMAXx; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	Const1;  Push $0001 onto TOS
	ConstDISPLAY2; Push $0002 onto TOS
	wx-TYPEexec
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
		<exec;	 NOS<TOS?
	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
	$FFE6; Branch Offset
	VarTMPhrs; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	Const2;  Push $0002 onto TOS
	BLANKlineexec
	TxtMIN
	Countexec
	DUPexec; Duplicate TOS
	2+exec;    Add 2 TO TOS
	DUPexec; Duplicate TOS
	VarMINx; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	2+exec;    Add 2 TO TOS
	VarMAXx; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	Const1;  Push $0001 onto TOS
	ConstDISPLAY2; Push $0002 onto TOS
	wx-TYPEexec
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
		<exec;	 NOS<TOS?
	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
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
	ELSE
		Const0;  Push $0000 onto TOS
	ENDIF
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
59FB	COLON; Complile The Following Section
	STOPCLKexec
	Const2;  Push $0002 onto TOS
	BLANKlineexec
	TxtMM
	Countexec
	DUPexec; Duplicate TOS
	2+exec;    Add 2 TO TOS
	DUPexec; Duplicate TOS
	VarMINx; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	1+exec;    Add 1 TO TOS
	VarMAXx; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	Const1;  Push $0001 onto TOS
	ConstDISPLAY2; Push $0002 onto TOS
	wx-TYPEexec
	ConstRTCmonth
	@CLKDTAexec
	SET-INITVLUexec
	GET[num]exec
	ConstRTCmonth
	!CLKDTAexec
	Const2;  Push $0002 onto TOS
	BLANKlineexec
	TxtDD
	Countexec
	DUPexec; Duplicate TOS
	2+exec;    Add 2 TO TOS
	DUPexec; Duplicate TOS
	VarMINx; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	1+exec;    Add 1 TO TOS
	VarMAXx; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	Const1;  Push $0001 onto TOS
	ConstDISPLAY2; Push $0002 onto TOS
	wx-TYPEexec
	ConstRTCday
	@CLKDTAexec
	SET-INITVLUexec
	GET[num]exec
	ConstRTCday
	!CLKDTAexec
	Const2;  Push $0002 onto TOS
	BLANKlineexec
	$2EDD
	Countexec
	DUPexec; Duplicate TOS
	2+exec;    Add 2 TO TOS
	DUPexec; Duplicate TOS
	VarMINx; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	1+exec;    Add 1 TO TOS
	VarMAXx; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	Const1;  Push $0001 onto TOS
	ConstDISPLAY2; Push $0002 onto TOS
	wx-TYPEexec
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
	REGC @CLKDTA DROP			 ( Clr any pending interrupt)
	1 !SMPL#				  ( Initialize the sample number)
	REGD @CLKDTA DROP						( Set VTR bit)
	STRTCLK ;
5A81
	$88; Code
	"INIT-RTC"; Name
	$59F1; Backward Link
INIT-RTCexec:
5A8C	COLON; Complile The Following Section
	ConstBinit
	ConstSETbit
	ORexec;  OR NOS with TOS
	ConstREGB
	!CLKDTAexec
	ConstAinit
	ConstREGA
	!CLKDTAexec
	ConstREGC
	@CLKDTAexec
	DROPexec; Delete TOS
	Const1;  Push $0001 onto TOS
	!SMPL#exec
	ConstREGD
	@CLKDTAexec 
	DROPexec; Delete TOS 
	STRTCLKexec
	;Sexec

;;; : ?CLKDTAok REGD @CLKDTA VTRbit AND 0> ;
5AB2
	$89; Code
	"?CLKDTAok"; Name
	$5A81; Backward Link
?CLKDTAokexec:
5ABE	COLON; Complile The Following Section
	ConstREGD
	@CLKDTAexec
	VTRbitrefx
	ANDexec;  AND NOS with TOS
	>exec;	 TOS>0?
	;Sexec 

;;; : DATE/TIME -1 CALflg ! STRTCLK ( Ensure NO RECAL & clk running)
	BEGIN REGD @CLKDTA VTRbit AND			 ( Check VTR bit)
	IF ?DaTmOK IF 0 CALflg ! EXIT ENDIF   ( Operator change req)
	?CHNGtime IF NEWTIME ELSE NEWDATE ENDIF
	ELSE INIT-RTC		   ( If VRT bad, force operator set)
	"CLKRST DISPLAY1 w-TYPE
	NEWDATE NEWTIME
	ENDIF
	0 UNTIL ;
5ACC
	$89; Code
	"DATE/TIME"; Name
	$5AB2; Backward Link
DATE/TIMEexec:
5AD8	COLON; Complile The Following Section
	BEGIN
		LITEX
		$FFFF
		VarCALflg
		!exec; Store NOS to Addr in TOS
		STRTCLKexec
		ConstREGD
		@CLKDTAexec
		VTRbitrefx
		ANDexec;  AND NOS with TOS
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0 
		$0022; Branch Offset
			?DaTmOKexec
			OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
			$000A; Branch Offset
			Const0;  Push $0000 onto TOS
			VarCALflg
			!exec; Store NOS to Addr in TOS
			EXITexec
			?CHNGtimeexec
			OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
			$0008; Branch Offset
				NEWTIMEexec
				BRANCHexec
				$0004
			ELSE
				NEWDATEexec
			ENDIF
			BRANCHexec
			$000E
		INIT-RTCexec
		''CLKRST
		ConstDISPLAY1; Push $0001 Onto TOS
		w-TYPEexec
		NEWDATEexec
		NEWTIMEexec
		Const0;  Push $0000 onto TOS
	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
	$FFC4; Branch Offset
	;Sexec

;;;??? 	' DATE/TIME CFA 'DATE/TIME ! ( Addr of DATE/TIME entry routine) 

;;;???	' GET-SMPL# CFA 'GET-SMPL# ! ( Addr of SAMPLE# routine)

;;; CkROM2 (Calculate Checksum)
5B24
	$86; Code
	"CkROM2"; Name
	$5ACC; Backward Link
CkROM2exec:
5B2D	$5B2F

5B2F   L_5B2F     LDX	#$2000; Start of rom
5B32		  CLR A; Clear checkword
5B33		  CLR B
5B34   L_5B34     ADD B $01,X
5B36		  ADC A $00,X
5B38		  INX	; Bump by 2  
5B39		  INX  
5B3A		  CPX	#$6000; Done?
5B3D		  BNE	L_5B34; No, loop   
5B3F		  JMP	PUSHD; Push result	
5B42   L_5B42     JMP	NEXT

 dw $0121

 db "						  for 2000 ROM checksum 09/96

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
ConstRAMend:
8018	GetVar
	$8000

;; CkROM8
801D
	$86; Code
	"CkROM8"; Name
	$8010; Backward Link
CkROM8exec:
8026 $8028
8028   L_8028   LDX	#$8000
802B		  CLR A
802C		  CLR B
802D   L_802D   ADD B   $01,X
802F		  ADC A   $00,X
8031		  INX  
8032		  INX  
8033		  CPX	#$0000
8036		  BNE	L_802D   
8038		  JMP	PUSHD   
803B   L_803B   JMP	NEXT

;; PRNBUF1
803E
	$87; Code
	"PRNBUF1"; Name
	$801D; Backward Link
VarPRNBUF1:
8048	GetVar
	$12F0

;;
804C
	$87; Code
	"PRNBUF2"; Name
	$803E; Backward Link
VarPRNBUF2:
8056	GetVar
	$131B

;; !PRNBUF1x
805A
	$89; Code
	"!PRNBUF1x"; Name
	$804C; Backward Link
!PRNBUF1xexec:
8066	COLON; Complile The Following Section
	VarPRNBUF1
	+exec
	1-exec; Subtract 1 from TOS (DEC TOS)
	C!exec;  Store NOS (Char)  to Addr in TOS
	;Sexec

;; CLR-PRNBUF1
8072
	$8B; Code
	"CLR-PRNBUF1"; Name
	$805A; Backward Link
CLR-PRNBUF1exec:
8080	COLON; Complile The Following Section
	LITexec; Put value that follows on TOS
	$1318; Literal Value for Loop Limit
	VarPRNBUF1  for Loop Index
	(DO)exec; Beginning of DO Loop
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
CLR-PRNBUF2exec:
800E	COLON; Complile The Following Section
	LITexec; Put value that follows on TOS
	$1343; Literal Value for Loop Limit
	VarPRNBUF2 for Loop Index
	(DO)exec; Beginning of DO Loop
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
BOLDexec:
80D5	COLON; Complile The Following Section
	LITexec; Put value that follows on TOS
	$001B; Literal Value
	PRNTCHARexec
	LITexec; Put value that follows on TOS
	$0047; Literal Value
	PRNTCHARexec
	;Sexec

;; BIG
80E5
	$83; Code
	"BIG"; Name
	$80CE; Backward Link
BIGexec:
80EB	COLON; Complile The Following Section
	LITexec; Put value that follows on TOS
	$000E; Literal Value
	PRNTCHARexec
	;Sexec

;; BIGBOLD
80F5
	$87; Code
	"BIGBOLD"; Name
	$80E5; Backward Link
BIGBOLDexec:
80FF	COLON; Complile The Following Section
	BIGexec
	BOLDexec
	;Sexec

;; PNORMAL
8107
	$87; Code
	"PNORMAL"; Name
	$80F5; Backward Link
PNORMALexec:
8111	COLON; Complile The Following Section
	LITexec; Put value that follows on TOS
	$001B; Literal Value
	PRNTCHARexec
	LITexec; Put value that follows on TOS
	$0048; Literal Value
	PRNTCHARexec
	;Sexec

;; PRNTRDaT
8121
	$89; Code
	"PRNTRDaTm"; Name
	$8107; Backward Link
PRNTRDaTexec:
812D	COLON; Complile The Following Section
	CLR-PRNBUF1exec
	STOPCLKexec
	CNVRTdateexec
	VarPRNBUF1
	SWAPexec; Swap TOS with NOS
	CMOVEexec
	CNVRTtimeexec
	VarPRNBUF1
	LITexec; Put value that follows on TOS
	$000F; Literal Value
	+exec
	SWAPexec; Swap TOS with NOS
	2DUPexec; Duplicate TOS/NOS
	+exec
	>Rexec; Move TOS to Return Stack
	CMOVEexec
	VarfPM
	@exec; Push Data Contained in TOS Addr to TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0008
		TxtPM
		BRANCHexec
		$0004
	ELSE
		TxtAM
	ENDIF
	Countexec
	R>exec;   Retrieve TOS from return stack.
	SWAPexec; Swap TOS with NOS
	2DUPexec; Duplicate TOS/NOS
	+exec
	>Rexec; Move TOS to Return Stack
	CMOVEexec
	Const0;  Push $0000 onto TOS
	R>exec;   Retrieve TOS from return stack.
	1+exec;    Add 1 TO TOS
	C!exec;  Store NOS (Char)  to Addr in TOS
	STRTCLKexec
	;Sexec

;; PRNanswer
8179
	$89; Code
	"PRNanswer"; Name
	$8121; Backward Link
PRNanswerexec:
8185	COLON; Complile The Following Section
	Var>990err
	@exec; Push Data Contained in TOS Addr to TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0040
		Var2DIGrslt
		2@exec;  fetches a double integer to the stack
		DUPexec; Duplicate TOS
		0<exec ;	    TOS  <0?
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$0008
			LITexec; Put value that follows on TOS
			$002D
			PRNTCHARexec
	   ENDIF
		DABSexec;   Double Absolute Value
		Var2DIGrslt
		LITexec; Put value that follows on TOS
		$0004; Literal Value
		+exec; Add NOS To TOS
		@exec; Push Data Contained in TOS Addr to TOS
		Ptr'F#CNVRT
		@exec; Push Data Contained in TOS Addr to TOS
		EXECUTEexec
		PRINTSTRINGexec
		VarPPM/PPB
		@exec; Push Data Contained in TOS Addr to TOS
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$0008
			TxtUPPM
			BRANCHexec
			$0004
    	ELSE
			TxtUPPB
    	ENDIF
		Countexec
		PRINTSTRINGexec
		BRANCHexec
		$0008
	ELSE
		Txt>990err
		Countexec
		PRINTSTRINGexec
	ENDIF
	PRNTcrlfexec
	;Sexec

;; PRNCALDATA
81D9
	$8A; Code
	"PRNCALDATE"; Name
	$8179; Backward Link
PRNCALDATAexec:
81E6	COLON; Complile The Following Section
	CLR-PRNBUF2exec
	TxtCalDate
	Countexec
	VarPRNBUF2
	C!exec;  Store NOS (Char)  to Addr in TOS
	VarPRNBUF2
	COUNTexec
	CMOVEexec
	VarCALDATE
	COUNTexec
	DUPexec; Duplicate TOS
	>Rexec; Move TOS to Return Stack
	VarPRNBUF2
	COUNTexec
	2+exec;    Add 2 TO TOS
	DUPexec; Duplicate TOS
	>Rexec; Move TOS to Return Stack
	+exec; Add NOS To TOS
	SWAPexec; Swap TOS with NOS
	CMOVEexec
	R>exec;   Retrieve TOS from return stack.
	R>exec;   Retrieve TOS from return stack.
	+exec; Add NOS To TOS
	VarPRNBUF2
	C!exec;  Store NOS (Char)  to Addr in TOS
	VarCALTIME
	COUNTexec
	DUPexec; Duplicate TOS
	>Rexec; Move TOS to Return Stack
	VarPRNBUF2
	COUNTexec
	2+exec;    Add 2 TO TOS
	DUPexec; Duplicate TOS
	>Rexec; Move TOS to Return Stack
	+exec; Add NOS To TOS
	SWAPexec; Swap TOS with NOS
	CMOVEexec
	R>exec;   Retrieve TOS from return stack.
	R>exec;   Retrieve TOS from return stack.
	+exec; Add NOS To TOS
	VarPRNBUF2
	C!exec;  Store NOS (Char)  to Addr in TOS
	BOLDexec
	VarPRNBUF2
	COUNTexec
	PRINTSTRINGexec
	PRNTcrlfexec
	PNORMALexec
	;Sexec

;; PRINT-RESULTS
824A
	$8D; code
	"PRINT-RESULTS"; Name
	$81D9; Backward Link
PRINT-RESULTSexec:
825A	COLON; Complile The Following Section
	VarPRNTOPTI/O
	C@exec;  Push (Char) Data Contained in TOS Addr to TOS
	ConstPRNTOPTbit
	ANDexec;  AND NOS with TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004
		EXITexec
	ENDIF
	CLR-PRNBUF2exec
	PRNTcrlfexec
	BOLDexec
	TxtSMPL#
	Countexec
	PRINTSTRINGexec
	PNORMALexec
	Ptr'GET-SMPL#
	@exec; Push Data Contained in TOS Addr to TOS
	EXECUTEexec
	Const0;  Push $0000 onto TOS
	<#exec
	#Sexec
	#>exec
	PRINTSTRINGexec
	PRNTcrlfexec
	Ptr'M#PRNT
	@exec; Push Data Contained in TOS Addr to TOS
	EXECUTEexec
	PRNCALDATAexec
	BOLDexec
	TxtPDq
	Countexec
	PRINTSTRINGexec
	PNORMALexec
	VarPRNBUF1
	LITexec; Put value that follows on TOS
	$000A; Literal Value
	PRINTSTRINGexec
	BOLDexec
	TxtPTm
	Countexec
	PRINTSTRINGexec
	PNORMALexec
	VarPRNBUF1
	LITexec; Put value that follows on TOS
	$000F; Literal Value
	+exec; Add NOS To TOS
	LITexec; Put value that follows on TOS
	$000B; Literal Value
	PRINTSTRINGexec
	PRNTcrlfexec
	BOLDexec
	TxtPRslts
	Countexec
	PRINTSTRINGexec
	PNORMALexec
	PRNanswerexec
	PRNTcrlfexec
	;Sexec

;; COMNTS
82CE
	$86; Code
	"COMNTS"; Name
	$824A; Backward Link
COMNTSexec:
82D7	COLON; Complile The Following Section
	BOLDexec
	$3048
	Countexec
	DUPexec; Duplicate TOS
	>Rexec; Move TOS to Return Stack
	PRINTSTRINGexec
	PNORMALexec
	LITexec; Put value that follows on TOS
	$0028; Literal Value for Loop Limit
	R>exec;   Retrieve TOS from return stack.  for Loop Index
	(DO)exec; Beginning of DO Loop
    	 LITexec; Put value that follows on TOS
		$005F; Literal Value
		PRNTCHARexec
	(LOOP)exec
	$FFF8
	LITexec; Put value that follows on TOS
	$0006; Literal Value for Loop Limit
	Const0;  Push $0000 onto TOS for Loop Index
	(DO)exec; Beginning of DO Loop
		PRNTcrlfexec
	(LOOP)exec
	$FFFC
	;Sexec

;; PRN-CALVLUS
8309
	$8B; Code
	"PRN-CALVLUS"; Name
	$82CE; Backward Link
PRN-CALVLUSexec:
8317	COLON; Complile The Following Section
	CLR-PRNBUF2exec
	BOLDexec
	TxtPCAL
	Countexec
	PRINTSTRINGexec
	PRNTcrlfexec
	PNORMALexec
	CLR-PRNBUF2exec
	VarCALIBVLU
	2@exec;  fetches a double integer to the stack
	DUPexec; Duplicate TOS
	>Rexec; Move TOS to Return Stack
	DABSexec;   Double Absolute Value
	VarCALIBVLU
	LITexec; Put value that follows on TOS
	$0004; Literal Value
	+exec; Add NOS To TOS
	@exec; Push Data Contained in TOS Addr to TOS
	F#CNVRTexec
	LITexec; Put value that follows on TOS
	$0004; Literal Value
	MINexec
	VarPRNBUF2
	R>exec;   Retrieve TOS from return stack.
	0<exec ;	    TOS  <0?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$000C
		LITexec; Put value that follows on TOS
		$002D; Literal Value
		OVERexec; Duplicate NOS at TOS
		C!exec;  Store NOS (Char)  to Addr in TOS
		1+exec;    Add 1 TO TOS
	ENDIF
	SWAPexec; Swap TOS with NOS
	2DUPexec; Duplicate TOS/NOS
	+exec; Add NOS To TOS
	>Rexec; Move TOS to Return Stack
	CMOVEexec
	VarPPM/PPB
	@exec; Push Data Contained in TOS Addr to TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0008
		TxtPPM
		BRANCHexec
		$0004
	ELSE
		TxtPPB
	ENDIF
	Countexec
	R>exec;   Retrieve TOS from return stack.
	1+exec;    Add 1 TO TOS
	SWAPexec; Swap TOS with NOS
	CMOVEexec
	VarBLNKVLU
	2@exec;  fetches a double integer to the stack
	DUPexec; Duplicate TOS
	>Rexec; Move TOS to Return Stack
	DABSexec;   Double Absolute Value
	2DUPexec; Duplicate TOS/NOS
	+exec; Add NOS To TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$000A
		LITexec; Put value that follows on TOS
		$FFFF; Literal Value
		BRANCHexec
		$000C
	ELSE
		VarBLNKVLU
		LITexec; Put value that follows on TOS
		$0004; Literal Value
		+exec; Add NOS To TOS
		@exec; Push Data Contained in TOS Addr to TOS
	ENDIF
	F#CNVRTexec
	LITexec; Put value that follows on TOS
	$0004; Literal Value
	MINexec
	VarPRNBUF2
	LITexec; Put value that follows on TOS
	$000F; Literal Value
	+exec; Add NOS To TOS
	R>exec;   Retrieve TOS from return stack.
	0<exec ;	    TOS  <0?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$000C
		LITexec; Put value that follows on TOS
		$002D; Literal Value
		OVERexec; Duplicate NOS at TOS
		C!exec;  Store NOS (Char)  to Addr in TOS
		1+exec;    Add 1 TO TOS
	ENDIF
	SWAPexec; Swap TOS with NOS
	2DUPexec; Duplicate TOS/NOS
	+exec; Add NOS To TOS
	>Rexec; Move TOS to Return Stack
	CMOVEexec
	VarPPM/PPB
	@exec; Push Data Contained in TOS Addr to TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0008
		TxtPPM
		BRANCHexec
		$0004
	ELSE
		TxtPPB
	ENDIF
	Countexec
	R>exec;   Retrieve TOS from return stack.
	1+exec;    Add 1 TO TOS
	SWAPexec; Swap TOS with NOS
	CMOVEexec
	ConstSMPLDLY
	@exec; Push Data Contained in TOS Addr to TOS
	Const0;  Push $0000 onto TOS
	<#exec
	#Sexec
	#>exec
	VarPRNBUF2
	LITexec; Put value that follows on TOS
	$0019; Literal Value
	+exec; Add NOS To TOS
	SWAPexec; Swap TOS with NOS
	2DUPexec; Duplicate TOS/NOS
	+exec; Add NOS To TOS
	>Rexec; Move TOS to Return Stack
	CMOVEexec
	TxtDsec
	Countexec
	R>exec;   Retrieve TOS from return stack.
	SWAPexec; Swap TOS with NOS
	CMOVEexec
	VarPRNBUF2
	Countexec
	PRINTSTRINGexec
	PRNTcrlfexec
	;Sexec

;; PRINT-CALIB
841B
	$8B; Code
	"PRINT-CALIB"; Name
	$8309; Backward Link
PRINT-CALIBexec:
8429	COLON; Complile The Following Section
	PRNTcrlfexec
	CLR-PRNBUF2exec
	BIGBOLDexec
	TxtPNAME1
	Countexec
	PRINTSTRINGexec
	PRNTcrlfexec
	BOLDexec
	CFAexec
	Ptr'M#PRNT
	@exec; Push Data Contained in TOS Addr to TOS
	EXECUTEexec
	BOLDexec
	TxtPNAM2
	Countexec
	PRINTSTRINGexec
	PRNTcrlfexec
	BOLDexec
	TxtPDaTm
	Countexec
	PRINTSTRINGexec
	PRNTcrlfexec
	PNORMALexec
	VarPRNBUF1
	Countexec
	PRINTSTRINGexec
	PRNTcrlfexec
	PRN-CALVLUSexec
	PRNTcrlfexec
	PRNTcrlfexec
	PRNTcrlfexec
	PRNTcrlfexec
	;Sexec

;; PRNTHDR
846D
	$87; Code
	"PRNTHDR"; Name
	$841B; Backward Link
PRNTHDRexec:
8477	COLON; Complile The Following Section
	PRNTRDaTexec
	PRINT-CALIBexec
	;Sexec

;; INIT-PRINTER
847F
	$8C; Code
	"INIT-PRINTER"; Name
	$846D; Backward Link
INIT-PRINTERexec:
848E	COLON; Complile The Following Section
	LITexec; Put value that follows on TOS
	$FFFF; Literal Value
	VarPRNTerr
	!exec; Store NOS to Addr in TOS
	INIT-PORT2exec
	ConstTerr
	VarPRNTIMER
	!exec; Store NOS to Addr in TOS
	Const0;  Push $0000 onto TOS
	VarPRNTerr
	!exec; Store NOS to Addr in TOS
	LITexec; Put value that follows on TOS
	$0018; Literal Value
	PRNTCHARexec
	PRNTcrlfexec
	LITexec; Put value that follows on TOS
	$0014; Literal Value
	DELAY[ms]exec
	@RUNTIME[10ths]exec
	LITexec; Put value that follows on TOS
	$0028; Literal Value
	LITexec; Put value that follows on TOS
	$0000; Literal Value
	D+exec; Add Double Numbers on Stack
	BEGIN
		2DUPexec; Duplicate TOS/NOS
		@RUNTIME[10ths]exec
		D<exec
		PBUF!pntr
		@exec; Push Data Contained in TOS Addr to TOS
		VarPBUF@pntr
		@exec; Push Data Contained in TOS Addr to TOS
		=exec
		ORexec;  OR NOS with TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$FFEC
	2DROPexec; Remove TOS and NOS
	PRNTcrlfexec
	;Sexec

;; METHOD
84DC
	$86; Code
	"METHOD"; Name
	$847F; Backward Link
METHODexec:
84E5	COLON; Complile The Following Section
	;Sexec

;; MDELAY
84E9
	$86; Code
	"MDELAY"; Name
	$84DC; Backward Link
ConstMDELAY:
84F2	GetVar
	$0000

;; MUNITS
84F6
	$86; Code
	"MUNITS"; Name
	$84E9; Backward Link
ConstMUNITS:
84FF	GetVar
	$0002

;; MFORMAT
8503
	 $87; Code
	 "MFORMAT"; Name
	 $84F6; Backward Link
ConstMFORMAT:
850D	GetVar
	 $0004

;; HCALVLU
8511
	$87; Code
	"HCALVLU"; Name
	$8503; Backward Link
ConstHCALVLU:
851B	GetVar
	$0006

;; LCALVLU
851F
	$87; Code
	"LCALVLU"; Name
	$8511; Backward Link
8529	GetVar
ConstHCALVLU:
	$000C

;; MDATE
852D
	$85; Code
	"MDATE"; Name
	$851F; Backward Link
ConstMDATE:
8535	GetVar
	$0012

;; MCKSUM
8539
	$86; Code
	"MCKSUM"; Name
	$852D; Backward Link
ConstMCKSUM:
8542	GetVar
	$001A

 DW $003C, $0000, $0000, $0000, $00F0, $FFFF, $FFFF
 DW $FFF6, $FFFF, $0000, $0000, $0000, $0000, $0000

;; MDEFAULT
8562
	$88; Code
	"MDEFAULT"; Name
	$8539; Backward Link
ConstMDEFAULT:
856D	GetVar
	$8546

;; @METHODadr
8571
	$8A; Code
	"@METHODadr"; Name
	$8562; Backward Link
@METHODadrexec:
857E	COLON; Complile The Following Section
	VarMETHOD#
	@exec; Push Data Contained in TOS Addr to TOS
	VarBYTES/METHOD
	*exec ;  Multiply TOS by NOS
	+exec; Add NOS To TOS
	ConstMETHODQ
	+exec; Add NOS To TOS
	;Sexec

;; @MCKSUM
8590
	$87; Code
	"@MCKSUM"; Name
	$8571; Backward Link
@MCKSUMexec:
859A	COLON; Complile The Following Section
	Const0;  Push $0000 onto TOS
	ConstMDELAY
	@METHODadrexec
	DUPexec; Duplicate TOS
	VarBYTES/METHOD
	+exec for Loop Limit
	SWAPexec; Swap TOS with NOS for Loop Index
	(DO)exec; Beginning of DO Loop
		)exec
		@exec; Push Data Contained in TOS Addr to TOS
		+exec; Add NOS To TOS
		Const2;  Push $0002 onto TOS
	(+LOOP)exec
	$FFF6
	;Sexec

;; CKSUM-METHOD
85BA
	$8C; Code
	"CKSUM-METHOD"; Name
	$8590; Backward Link
CKSUM-METHODexec:
85C9	COLON; Complile The Following Section
	Const0;  Push $0000 onto TOS
	ConstMCKSUM
	@METHODadrexec
	!exec; Store NOS to Addr in TOS
	@MCKSUMexec
	LITexec; Put value that follows on TOS
	$FFFF; Literal Value
	XORexec;  XOR NOS with TOS
	ConstMCKSUM
	@METHODadrexec
	!exec; Store NOS to Addr in TOS
	;Sexec

;; SET-DEFAULTS
85E3
	$8C; Code
	"SET-DEFAULTS"; Name
	$85BA; Backward Link
SET-DEFAULTSexec:
85F2	COLON; Complile The Following Section
	ConstMDEFAULT
	ConstMETHODQ
	VarBYTES/METHOD
	VarMETHOD#
	@exec; Push Data Contained in TOS Addr to TOS
	*exec ;  Multiply TOS by NOS
	+exec; Add NOS To TOS
	VarBYTES/METHOD
	CMOVEexec
	CNVRTdateexec
	ConstMDATE
	@METHODadrexec
	SWAPexec; Swap TOS with NOS
	CMOVEexec
	CKSUM-METHODexec
	ConstMDEFAULT
	ConstMDELAY
	+exec; Add NOS To TOS
	@exec; Push Data Contained in TOS Addr to TOS
	ConstSMPLDLY
	!exec; Store NOS to Addr in TOS
	ConstMDEFAULT
	ConstMUNITS
	+exec; Add NOS To TOS
	@exec; Push Data Contained in TOS Addr to TOS
	VarPPM/PPB; ??? Appears to be setting PPM/PPB
	!exec; Store NOS to Addr in TOS
	ConstMDEFAULT
	$850D
	+exec; Add NOS To TOS
	@exec; Push Data Contained in TOS Addr to TOS
	VarFORMAT
	!exec; Store NOS to Addr in TOS
	ConstMDEFAULT
	ConstHCALVLU
	+exec; Add NOS To TOS
	VarCALIBVLU
	LITexec; Put value that follows on TOS
	$0006; Literal Value
	CMOVEexec
	ConstMDEFAULT
	$8529
	+exec; Add NOS To TOS
	VarBLNKVLU
	LITexec; Put value that follows on TOS
	$0006; Literal Value
	CMOVEexec
	;Sexec

;; "MQRESET1
8654
	$89; Code
	""MQRESET1"; Name
	$85E3; Backward Link
8660	String1exec
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
TxtMQRESET3:
86B2	String1exec
	String2exec
	"INITIALIZING METHOD QUE "
	DB $00

;; RESET-METHODQ
86CF
	$8D; Code
	"RESET-METHODQ"; Name
	$86A6; Backward Link
RESET-METHODQexec:
86DF	COLON; Complile The Following Section
	''MQRESET1
	ConstDISPLAY1; Push $0001 Onto TOS
	w-TYPEexec
	''MQRESET2
	ConstDISPLAY2; Push $0002 onto TOS
	w-TYPEexec
	PCkeyexec
	DROPexec; Delete TOS
	TxtMQRESET3
	ConstDISPLAY1; Push $0001 Onto TOS
	w-TYPEexec
	TxtBLANK
	ConstDISPLAY2; Push $0002 onto TOS
	w-TYPEexec
	ConstMETHODQ
	ConstMQsiz
	LITexec; Put value that follows on TOS
	$FFFF; Literal Value
	FILLexec
	Const0;  Push $0000 onto TOS
	VarMETHOD#
	!exec; Store NOS to Addr in TOS
	SET-DEFAULTSexec
	LITexec; Put value that follows on TOS
	$55AA; Literal Value
	Var`55AA'
	!exec; Store NOS to Addr in TOS
	;Sexec

;; GET-DELAYTIME
8719
	$8D; Code
	"GET-DELAYTIME"; Name
	$86CF; Backward Link
GET-DELAYTIMEexec:
8729	COLON; Complile The Following Section
	TxtTESTDLY
	ConstDISPLAY1; Push $0001 Onto TOS
	w-TYPEexec
	TxtSECS
	ConstDISPLAY2; Push $0002 onto TOS
	w-TYPEexec
	ConstSMPLDLY
	@exec; Push Data Contained in TOS Addr to TOS
	Const0;  Push $0000 onto TOS
	VarINITVLU
	2!exec; Store NOS and 2nd NOS to Addr in TOS
	Const0;  Push $0000 onto TOS
	VarINITVLU
	LITexec; Put value that follows on TOS
	$0004; Literal Value
	+exec; Add NOS To TOS
	!exec; Store NOS to Addr in TOS
	GET[sec]exec
	ConstSMPLDLY
	!exec; Store NOS to Addr in TOS
	;Sexec

;; GETUNITS
8755
	$88; Code
	"GETUNITS"; Name
	$8719; Backward Link
GETUNITSexec:
8760	COLON; Complile The Following Section
	Const0;  Push $0000 onto TOS
	Varf>MENU
	!exec; Store NOS to Addr in TOS
	VarQAflg
	@exec; Push Data Contained in TOS Addr to TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$000A
		Const0;  Push $0000 onto TOS
		VarFORMAT
		!exec; Store NOS to Addr in TOS
		EXITexec
	ENDIF
	TxtUNITS1
	ConstDISPLAY1; Push $0001 Onto TOS
	w-TYPEexec
	Txt?UNITS2
	ConstDISPLAY2; Push $0002 onto TOS
	w-TYPEexec
	Const0;  Push $0000 onto TOS
	DROPexec; Delete TOS
	PCkeyexec
	ConstF1
	OVERexec; Duplicate NOS at TOS
	=exec
	OVERexec; Duplicate NOS at TOS
	ConstF3
	=exec
	ORexec;  OR NOS with TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$FFEC
	ConstF1
	=exec
	VarFORMAT
	!exec; Store NOS to Addr in TOS
	LITexec; Put value that follows on TOS
	$FFFF; Literal Value
	Varf>MENU
	!exec; Store NOS to Addr in TOS
	;Sexec

;; GET-DSPLYUNITS
87AE
	$8E; Code
	"GET-DSPLYUNITS"; Name
	$8755; Backward Link
GET-DSPLYUNITSexec:
87BF	COLON; Complile The Following Section
	Const0;  Push $0000 onto TOS
	Varf>MENU
	!exec; Store NOS to Addr in TOS
	Txt?PPM1
	ConstDISPLAY1; Push $0001 Onto TOS
	w-TYPEexec
	Txt?PPM2
	ConstDISPLAY2; Push $0002 onto TOS
	w-TYPEexec
	Const0;  Push $0000 onto TOS
	DROPexec; Delete TOS
	PCkeyexec
	ConstF1
	OVERexec; Duplicate NOS at TOS
	=exec
	OVERexec; Duplicate NOS at TOS
	ConstF3
	=exec
	ORexec;  OR NOS with TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$FFEC
	ConstF1
	=exec
	VarPPM/PPB
	!exec; Store NOS to Addr in TOS
	LITexec; Put value that follows on TOS
	$FFFF; Literal Value
	Varf>MENU
	!exec; Store NOS to Addr in TOS
	;Sexec

;; ?CALvlu>BLNKvlu
87FD
	$8F; Code
	"?CALvlu>BLNKvlu"; Name
	$87AE; Backward Link
?CALvlu>BLNKvluexec:
880F	COLON; Complile The Following Section
	>Rexec; Move TOS to Return Stack
	2DUPexec; Duplicate TOS/NOS
	LITexec; Put value that follows on TOS
	$0DEC; Literal Value
	@exec; Push Data Contained in TOS Addr to TOS
	VarCALIBVLU
	2@exec;  fetches a double integer to the stack
	DROPexec; Delete TOS
	nF-exec
	SWAPexec; Swap TOS with NOS
	DROPexec; Delete TOS
	Const0;  Push $0000 onto TOS
	<=exec;		   NOS <= TOS?
	DUPexec; Duplicate TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0008
		TxtBLKv>CALv
		ConstDISPLAY1; Push $0001 Onto TOS
		w-TYPEexec
	ENDIF
	R>exec;   Retrieve TOS from return stack.
	SWAPexec; Swap TOS with NOS
	;Sexec

;; GET-CAL-VALUE
883F
	$8D; Code
	"GET-CAL-VALUE"
	$87FD; Backward Link
GET-CAL-VALUEexec:
884F	COLON; Complile The Following Section
	TxtCALVLU
	ConstDISPLAY1; Push $0001 Onto TOS
	w-TYPEexec
	VarPPM/PPB
	@exec; Push Data Contained in TOS Addr to TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0008
		TxtNTRppm
		BRANCHexec
		$0004
	ELSE
		TxtNTRppb
	ENDIF
	ConstDISPLAY2; Push $0002 onto TOS
	w-TYPEexec
	Const1;  Push $0001 onto TOS
	VarMINx
	!exec; Store NOS to Addr in TOS
	Const2;  Push $0002 onto TOS
	VarMAXx
	!exec; Store NOS to Addr in TOS
	Const0;  Push $0000 onto TOS
	Varf+/-#
	!exec; Store NOS to Addr in TOS
	VarCALIBVLU
	2@exec;  fetches a double integer to the stack
	LITexec; Put value that follows on TOS
	1000; Literal Value
	LITexec; Put value that follows on TOS
	$0000; Literal Value
	DMINexec
	2DUPexec; Duplicate TOS/NOS
	VarCALIBVLU
	2!exec; Store NOS and 2nd NOS to Addr in TOS
	VarINITVLU
	2!exec; Store NOS and 2nd NOS to Addr in TOS
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
	VarINITVLU
	LITexec; Put value that follows on TOS
	$0004; Literal Value
	+exec; Add NOS To TOS
	@exec; Push Data Contained in TOS Addr to TOS
	LITexec; Put value that follows on TOS
	$FFFF; Literal Value
	<exec;	 NOS<TOS?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0032
		VarINITVLU
		2@exec;  fetches a double integer to the stack
		VarINITVLU
		LITexec; Put value that follows on TOS
		$0004; Literal Value
		+exec; Add NOS To TOS
		@exec; Push Data Contained in TOS Addr to TOS
		ABSexec; Absolute Value of TOS for Loop Limit
		Const1;  Push $0001 onto TOS for Loop Index
		(DO)exec; Beginning of DO Loop
			LITexec; Put value that follows on TOS
			$000A; Literal Value
			D/exec
		(LOOP)exec
		$FFF8
		VarINITVLU
    	 2!exec; Store NOS and 2nd NOS to Addr in TOS
    	 LITexec; Put value that follows on TOS
    	$FFFF; Literal Value
		VarINITVLU
		LITexec; Put value that follows on TOS
		$0004; Literal Value
		+exec; Add NOS To TOS
		!exec; Store NOS to Addr in TOS
	ENDIF
	Const0;  Push $0000 onto TOS
	LITexec; Put value that follows on TOS
	$0000; Literal Value
	LITexec; Put value that follows on TOS
	$0000; Literal Value
	BEGIN
		2DROPexec; Remove TOS and NOS
		DROPexec; Delete TOS
		"GET[F#]exec
		2DUPexec; Duplicate TOS/NOS
		LITexec; Put value that follows on TOS
		$0000; Literal Value
		LITexec; Put value that follows on TOS
		$0000; Literal Value
		d>exec; 3rd and 4th > 1st and 2nd?
	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
	$FFEC
	ROTexec;    Rotate top 3 on stack
	>Rexec; Move TOS to Return Stack
	BEGIN
		2DUPexec; Duplicate TOS/NOS
		LITexec; Put value that follows on TOS
		1000
		LITexec; Put value that follows on TOS
		$0000; Literal Value
		D<=exec
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
			$0014
			LITexec; Put value that follows on TOS
			$000A; Literal Value
    		D*exec;	 Double Multiply
			R>exec;   Retrieve TOS from return stack.
			1-exec; Subtract 1 from TOS (DEC TOS)
			>Rexec; Move TOS to Return Stack
			Const0;  Push $0000 onto TOS
			BRANCHexec
			$0006
		ELSE
			LITexec; Put value that follows on TOS
			$FFFF; Literal Value
		ENDIF
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$FFD8
	R>exec;   Retrieve TOS from return stack.
	LITexec; Put value that follows on TOS
	$0DEC; Literal Value
	!exec; Store NOS to Addr in TOS
	VarCALIBVLU
	2!exec; Store NOS and 2nd NOS to Addr in TOS
	;Sexec

;; GET-BLANK-VALUE
894D
	$8F; Code
	"GET-BLANK-VALUE"; Name
	$883F; Backward Link
GET-BLANK-VALUEexec:
895F	COLON; Complile The Following Section
	TxtBLNKVLU
	ConstDISPLAY1; Push $0001 Onto TOS
	w-TYPEexec
	Const0;  Push $0000 onto TOS
	LITexec; Put value that follows on TOS
	$0000; Literal Value
	LITexec; Put value that follows on TOS
	$0000; Literal Value
	BEGIN
		2DROPexec; Remove TOS and NOS
		DROPexec; Delete TOS
		VarPPM/PPB
		@exec; Push Data Contained in TOS Addr to TOS
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$0008
			TxtNTRppm
			BRANCHexec
			$0004
		ELSE
			TxtNTRppb
		ENDIF
		ConstDISPLAY2; Push $0002 onto TOS
		w-TYPEexec
		Const1;  Push $0001 onto TOS
		VarMINx
		!exec; Store NOS to Addr in TOS
		Const2;  Push $0002 onto TOS
		VarMAXx
		!exec; Store NOS to Addr in TOS
		LITexec; Put value that follows on TOS
		$FFFF; Literal Value
		Varf+/-#
		!exec; Store NOS to Addr in TOS
		VarBLNKVLU
		2@exec;  fetches a double integer to the stack
		LITexec; Put value that follows on TOS
		$FC18; Literal Value
		LITexec; Put value that follows on TOS
		$FFFF; Literal Value
		DMAXexec
		2DUPexec; Duplicate TOS/NOS
		VarBLNKVLU
		2!exec; Store NOS and 2nd NOS to Addr in TOS
		VarINITVLU
		2!exec; Store NOS and 2nd NOS to Addr in TOS
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
		"GET[F#]exec
		?CALvlu>BLNKvluexec
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$FF9E
	VarBLNKVLU
	2!exec; Store NOS and 2nd NOS to Addr in TOS
	LITexec; Put value that follows on TOS
	$0DF2; Literal Value
	!exec; Store NOS to Addr in TOS
	;Sexec

;; SETUP-METHOD
89E1
	$8C; Code
	"SETUP-METHOD"; Name
	$894D; Backward Link
SETUP-METHODexec:
89F0	COLON; Complile The Following Section
	ConstSMPLDLY
	@exec; Push Data Contained in TOS Addr to TOS
	0<exec ;	    TOS  <0?
	ConstSMPLDLY
	@exec; Push Data Contained in TOS Addr to TOS
	LITexec; Put value that follows on TOS
	1000; Literal Value
	>exec;	 NOS > TOS?
	ORexec;  OR NOS with TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004
		SET-DEFAULTSexec
	ENDIF
	GET-DELAYTIMEexec
	GET-DSPLYUNITSexec
	Const0;  Push $0000 onto TOS
	VarQAflg
	!exec; Store NOS to Addr in TOS
	GETUNITSexec
	GET-CAL-VALUEexec
	GET-BLANK-VALUEexec
	ConstRESTPARS
	ConstMDELAY
	@METHODadrexec
	LITexec; Put value that follows on TOS
	$0012; Literal Value
	CMOVEexec
	CNVRTdateexec
	ConstMDATE
	@METHODadrexec
	SWAPexec; Swap TOS with NOS
	CMOVEexec
	CKSUM-METHODexec
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

;; GET-METHOD''''
8E01
	$8A; Code
	"GET-METHOD"; Name
	$8DD9; Backward Link
8E0E	Colon
	Const0
	Const0
	Varf>MENU
	!exec
	DROPexec
	$8D44
	ConstDISPLAY1
	w-TYPEexec
	$8D6C
	$F4CB
	w-TYPEexec
	PCkeyexec
	DUPexec
	ConstF2
	=exec
	OBRANCHexec
	$0018
	LITexec
	$FFFF
	Varf>MENU
	!exec
	$8CB5
	Const0
	Varf>MENU
	!exec
	Const0
	BRANCHexec
	$0010
	DUPexec
	ConstF1
	=exec
	OVERexec
	$F71E
	=exec
	ORexec
	OBRANCHexec
	$FFC0
	$8D94
	ConstDISPLAY1
	w-TYPEexec
	$8DBC
	$F4CB
	w-TYPEexec
	LITexec
	$FFFF
	Varf>MENU
	!exec
	VarMETHOD#
	@exec
	Const0
	MAXexec
	LITexec
	$001D
	MINexec
	1+exec
	Const0
	VarINITVLU
	$D74E
	Const0
	VarINITVLU
	LITexec
	$0004
	+exec
	!exec
	Const2
	VarMAXx
	!exec
	Const1
	VarMINx
	!exec
	GET[n#]exec
	DUPexec
	1-exec
	VarMETHOD#
	!exec
	DUPexec
	0>exec
	SWAPexec
	LITexec
	$001F
	<exec
	ANDexec
	DUPexec
	0=exec
	OBRANCHexec
	$0008
	$8DE4
	ConstDISPLAY1
	w-TYPEexec
	OBRANCHexec
	$FFAA
	ConstMDELAY
	$857E
	$2136
	LITexec
	$0012
	$C285
	DUPexec
	$F71E
	=exec
	OBRANCHexec
	$0004
	$89F0
	ConstMDELAY
	$857E
	@exec
	0>exec
	0=exec
	$859A
	1+exec
	ORexec
	DUPexec
	OBRANCHexec
	$0004
	$8A90
	0=exec
	SWAPexec
	$F71E
	$D7EE
	ANDexec
	OBRANCHexec
	$FF0E
	;Sexec

;; SELECT-METHOD
8F06
	$8D; Code
	"SELECT-METHOD"; Name
	$8E01; Backward Link
8F16	COLON
	CLEARSCREEN
	BKliteONexec
	Const0
	VarfTEST
	!exec
	LITexec
	$FFFF
	VarCALflg
	!exec
	Var`55AA'
	@exec
	LITexec
	$55AA
	<>exec
	OBRANCHexec
	$0004
	RESET-METHODQexec
	GET-METHOD
	;Sexec	

;; MODEL#
8F78
	$86; Code
	"MODEL#"; Name
	$8F6B; Backward Link
ConstMODEL#:
8F81	GetVar
	$1348

;; REMOV
8F85
	$85; Code
	"REMOV"; Name
	$8F78; Backward Link
REMOVexec:
8F8D	COLON
	TxtREMOV
	ConstDISPLAY2
	w-TYPEexec
	;Sexec

;; TESTTYPE
8FC5
	$88; Code
	"TESTTYPE"; Name
	$8F97; Backward Link
VarTESTTYPE:
8FD0	GetVar
	$134A

;; GET-ABORTMSG
8FD4
	$8C; Code
	"GET-ABORTMSG"; Name
	$8FC5; Backward Link
GET-ABORTMSGexec:
8FE3	COLON
	$8FD0
	@exec
	DUPexec
	$CC9C
	$78BC
	$0A20
	$008C4832B0FD6BBC5C1C78BC0A200062B38D6BB2ACBC37E

;;;;;;;;;;;;;;;;;;;;;;;;

;; KEYLOCK
9009
	$87; Code
	"KEYLOCK" Name
	$8FD4; Backward Link
VarKEYLOCK:
9013	GetVar
	$134C

;; CHK-PRNTok
9017
	$8A; Code
	"CHK-PRNTok"; Name
	$9009; Backward Link
CHK-PRNTokexec:
9024	COLON
	VarPRNTerr
	@exec
	PRNTR_exec
	@exec
	0=exec
	ANDexec
	OBRANCHexec
	$0006
	Ptr'RECHECK-PRNTR
	2000.EXEexec
	;Sexec

;; fEr<Limit
903C
	$89; Code
	"fEr<Limit" Name
	$9017; Backward Link
ConstfEr<Limit:
9048	GetVar
	$134E

;; ?DATAok
904C
	$87; Code
	"?DATAok"; Name
	$903C; Backward Link
?DATAokexec:
9056	COLON
	LITexec
	$FFFF
	VarfABORT
	!exec
	?VIAL-OUTexec
	OBRANCHexec
	$000C
	GET-ABORTMSGexec
	ConstDISPLAY1
	w-TYPEexec
	Const0
	EXITexec
	VarTRIGerr
	@exec
	OBRANCHexec
	$000C
	TxtLMPFAIL1
	ConstDISPLAY1
	w-TYPEexec
	Const0
	EXITexec
	VarGAINexp
	@exec
	VarGAINlimit
	@exec
	>=exec
	OBRANCHexec
	$0014
	TxtUNRNGE
	ConstDISPLAY1
	w-TYPEexec
	LITexec
	$FFFF
	Var>990err
	!exec
	Const0
	EXITexec
	VarSIGok
	@exec
	0=exec
	OBRANCHexec
	$0014
	TxtSIGerr
	ConstDISPLAY1
	w-TYPEexec
	LITexec
	$FFFF
	Var>990err
	!exec
	Const0
	EXITexec
	VarREFok
	@exec
	0=exec
	OBRANCHexec
	$0014
	TxtREFERR
	ConstDISPLAY1
	w-TYPEexec
	LITexec
	$FFFF
	Var>990err
	!exec
	Const0
	EXITexec
	ConstfEr<Limit
	@exec
	0=exec
	OBRANCHexec
	$0014
	TxtUNSTBL
	ConstDISPLAY1
	w-TYPEexec
	LITexec
	$FFFF
	Var>990err
	!exec
	Const0
	EXITexec
	Const0
	VarfABORT
	!exec
	LITexec
	$FFFF
	;Sexec	

;; fNEGOK
9102
	$86; Code
	"fNEGOK" Name
	$904C; Backward Link
ConstfNEGOK:
910B	GetVar
	$1350

;;; : WAIT[VialIn]										
   BEGIN CHK-PRNTok ?BKliteOFF UPDATEkeyQ				   
	F2key @ IF -1 fNEGOK ! "RDCAL DISPLAY2 w-TYPE THEN	    
	VIALSWI/O C@ VIALbit AND 0=						  
	IF 250 DELAY[ms] VIALSWI/O C@ VIALbit AND 0= ELSE 0 THEN   
	IF -1 fVIAL ! ELSE 0 fVIAL ! THEN fVIAL @ UNTIL BKliteON ;
910F
	$8c; Code
	"WAIT[VialIn]"; Name
	$9102; Backward Link
WAIT[VialIn]exec:
911D	COLON
	CHK-PRNTokexec
	?BKliteOFFexec
	$32A3
	VarVIALSWI/O
	C@exec;  Push (Char) Data Contained in TOS Addr to TOS
	ConstVIALbit
	ANDexec;  AND NOS with TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0016
	LITexec; Put value that follows on TOS
	$00FA
	DELAY[ms]exec
	VarVIALSWI/O
	C@exec;  Push (Char) Data Contained in TOS Addr to TOS
	ConstVIALbit
	ANDexec;  AND NOS with TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	BRANCH
	$0004
	Const0
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$000E
	LITexec; Put value that follows on TOS
	$FFFF
	$2276
	!exec; Store NOS to Addr in TOS
	BRANCH
	$0008
	?????
	$2276
	!exec; Store NOS to Addr in TOS
	$2276
	@exec; Push Data Contained in TOS Addr to TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$FFBA
	BKliteONexec
	;Sexec

;;; WAIT[VialOut]
916C
	$8D; Code
	"WAIT[VialOut]"; Name
	$910F; Backward Link
WAIT[VialOut]exec:
917C	COLON
	Const0
	ConstF3key
	!exec; Store NOS to Addr in TOS
	ConstF3key
	@exec; Push Data Contained in TOS Addr to TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0010
	Ptr'DO-TEST
	@exec; Push Data Contained in TOS Addr to TOS
	EXECUTEexec
	Const0
	ConstF3key
	!exec; Store NOS to Addr in TOS
	REMOVexec
	VarKEYLOCK
	@exec; Push Data Contained in TOS Addr to TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004
	$32A3
	CHK-PRNTokexec
	?BKliteOFFexec
	VarVIALSWI/O
	C@exec;  Push (Char) Data Contained in TOS Addr to TOS
	ConstVIALbit
	ANDexec;  AND NOS with TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$000A
	LITexec; Put value that follows on TOS
	$FFFF
	BRANCH
	$0012
	LITexec; Put value that follows on TOS
	$0064
	DELAY[ms]exec
	VarVIALSWI/O
	C@exec;  Push (Char) Data Contained in TOS Addr to TOS
	ConstVIALbit
	ANDexec;  AND NOS with TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$000E
	LITexec; Put value that follows on TOS
	$FFFF
	$2276
	!exec; Store NOS to Addr in TOS
	BRANCH
	$0008
	Const0
	$2276
	!exec; Store NOS to Addr in TOS
	$2276
	@exec; Push Data Contained in TOS Addr to TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$FF96
	Const0
	$2276
	!exec; Store NOS to Addr in TOS
	Const0
	ConstfNEGOK
	!exec; Store NOS to Addr in TOS
	BKliteONexec
	;Sexec

;; #TRIES
92EB
	$7E; Code
	"#TRIES"; Name
	$9267; Backward Link
Const#TRIES:
92F4	GetVar
	$0032

;; Limit
92F8
	$85; Code
	"Limit"; Name
	$92EB; Backward Link
ConstLimit:
9300	GetVar
	$0028

;; ACQUIRE-SAMPLES
9304
	$8F; Code
	"ACQUIRE-SAMPLES"; Name
	$92F8; Backward link
ACQUIRE-SAMPLESexec:
9316	COLON
	VarSMPLtotal
	@exec
	Const0
	(DO)exec
	READ-SAMPLEexec
	?VIAL-OUTexec
	VarfABORT
	@exec
	ORexec
	OBRANCHexec
	$0004
	LEAVEexec
	(LOOP)exec
	$FFEE
	?VIAL-INexec
	VarfABORT
	@exec
	0=exec
	ANDexec
	OBRANCHexec
	$0004
	REJECT-OUTLYERS
	;Sexec

;; TYPE-ANSWER
9346
	$8B; Code
	"TYPE-ANSWER"; Name
	$9304; Backward link
TYPE-ANSWERexec:
9354	COLON
	$D5E1
	$D61E
	$D61E
	$D61E
	$D61E
	LITexec
	$002E
	$CC61
	$D646
	$D5F0
	$CA72
	;Sexec

;; TYPE-ALL
936E
	$88; Code
	"TYPE-ALL" Name
	$9346; Backward link
TYPE-ALLexec:
9379	COLON
	CRexec
	$40D7
	$D735
	$4097
	@exec
	D/exec
	OVERexec
	VarAVE[S/R]
	!exec
	."exec;  Print Literal String
	$04
	"S/R="
	TYPE-ANSWERexec
	."exec;  Print Literal String
	$04
	" 10^"
	VarGAINexp
	@exec
	MINUSexec
	.exec
	."exec;  Print Literal String
	$07
	" %DLTA="
	VarDlta
	@exec
	Const0
	$4162
	;Sexec

;; @AVEDTA
93B9
	$87; Code
	"@AVEDTA" Name
	$936E; Backward link
@AVEDTAexec:
93C3	COLON
	LITexec
	$0005
	Const0
	(DO)exec
	SHFTDATAexec
	INIT-MEASURE-CYCLEexec
	ACQUIRE-SAMPLESexec
	CALC[AveS/R]exec
	DROPexec
	VarSIGok
	@exec
	DUPexec
	0=exec
	OBRANCHexec
	$0022
	VarGAINvlu
	@exec
	LITexec
	$000A
	/exec
	DUPexec
	0=exec
	OBRANCHexec
	$000A
	LITexec
	$FFFF
	VarfABORT
	!exec
	SETGAINexec
	INIT-SIGFILTERexec
	INIT-MEASURE-DATAexec
	VarfABORT
	@exec
	ORexec
	OBRANCHexec
	$0004
	LEAVEexec
	(LOOP)exec
	$FFBC
	VarAVE[S/R]
	@exec
	DUPexec
	VarR[Hi]
	@exec
	>exec
	OBRANCHexec
	$0008
	DUPexec
	VarR[Hi]
	!exec
	DUPexec
	VarR[Lo]
	@exec
	<exec
	OBRANCHexec
	$0008
	DUPexec
	VarR[Lo]
	!exec
	Const0
	;Sexec

;; ACQUIRE-READING
943F
	$8F; Code
	"ACQUIRE-READING"; Name
	$93B9; Backward link
ACQUIRE-READINGexec:
9451	COLON; Complile The Following Section
	Const0;	Push $0000 onto TOS
	VarfABORT
	!exec; Store NOS to Addr in TOS
	Const0;	Push $0000 onto TOS
	VarTRIGerr
	!exec; Store NOS to Addr in TOS
	INIT-MEASURE-DATAexec
	VarGAINexp
	@exec; Push Data Contained in TOS Addr to TOS
	Const2
	>exec;	 NOS > TOS?
	OBRANCHexec
	$000A
	LITexec; Put value that follows on TOS
	$0008
	BRANCH
	$0006
	LITexec; Put value that follows on TOS
	$0004
	1-exec		; Subtract 1 from TOS (DEC TOS)
	VarMINSMPL#
	!exec; Store NOS to Addr in TOS
	INIT-SIGFILTERexec
	PRIME-LAMP-CONTROLexec
	CRexec; 	Send Carriage Return
	Const#TRIES
	2+exec
	Const0;	Push $0000 onto TOS
	(DO)exec; Beginning of DO Loop
	@AVEDTAexec
	VarSUM[Rn]
	2@exec	; Push Data Contained in TOS Addr to NOS/TOS (32Bit)
	D+exec; Add Double Numbers on Stack
	VarSUM[Rn]
	2!exec	; Store NOS and 2nd NOS to Addr in TOS
	Const1;    Push $0001 onto TOS
	VarCYCL[n]
	+!exec;	  Add NOS to Addr in TOS
	VarCYCL[n]
	@exec; Push Data Contained in TOS Addr to TOS
	DUPexec; Duplicate TOS
	.exec
	VarMINSMPL#
	@exec; Push Data Contained in TOS Addr to TOS
	>exec;	 NOS > TOS?
	OBRANCHexec
	$0042
	VarSUM[Rn]
	2@exec	; Push Data Contained in TOS Addr to NOS/TOS (32Bit)
	VarR[Hi]
	@exec; Push Data Contained in TOS Addr to TOS
	VarR[Lo]
	@exec; Push Data Contained in TOS Addr to TOS
	-exec; Subtract TOS From NOS
	Const1;    Push $0001 onto TOS
	MAXexec
	D/exec
	2DUPexec:; Duplicate TOS/NOS
	Var1/Dlta
	2!exec	; Store NOS and 2nd NOS to Addr in TOS
	ConstLimit
	Const0;	Push $0000 onto TOS
	D>exec;	   3rd and 4th > 1st and 2nd?
	VarfABORT
	@exec; Push Data Contained in TOS Addr to TOS
	ORexec
	VarSUM[Rn]
	2@exec	; Push Data Contained in TOS Addr to NOS/TOS (32Bit)
	LITexec; Put value that follows on TOS
	$0064
	VarCYCL[n]
	@exec; Push Data Contained in TOS Addr to TOS
	*exec;  Multiply TOS by NOS
	Const0;	Push $0000 onto TOS
	D<exec
	ORexec
	OBRANCHexec
	$0004
	LEAVEexec
	(LOOP)exec
	$FF9A
	Var1/Dlta
	2@exec	; Push Data Contained in TOS Addr to NOS/TOS (32Bit)
	OBRANCHexec
	$000A
	DROPexec; Delete TOS
	Const0;	Push $0000 onto TOS
	BRANCH
	$001E
	DUPexec; Duplicate TOS
	0<exec
	OBRANCHexec
	$000A
	DROPexec; Delete TOS
	Const0;	Push $0000 onto TOS
	BRANCH
	$000E
	LITexec; Put value that follows on TOS
	$2710
	SWAPexec; Swap TOS with NOS
	Const1;    Push $0001 onto TOS
	MAXexec
	/exec;   Divide TOS by NOS
	VarDlta
	!exec; Store NOS to Addr in TOS
	VarCYCL[n]
	@exec; Push Data Contained in TOS Addr to TOS
	Const#TRIES
	>exec;	 NOS > TOS?
	LITexec; Put value that follows on TOS
	$0064
	Const#TRIES
	*exec;  Multiply TOS by NOS
	Const0;	Push $0000 onto TOS
	VarSUM[Rn]
	2@exec	; Push Data Contained in TOS Addr to NOS/TOS (32Bit)
	D<exec
	ANDexec;  AND NOS with TOS
	OBRANCHexec
	$001B
	CRexec; 	Send Carriage Return
	."exec;  Print Literal String
	$0E; Number of bytes
	"UNSTABLE DATA "
	Const0;	Push $0000 onto TOS
	BRANCH
	$0006
	LITexec; Put value that follows on TOS
	$FFFF
	ConstfEr<Limit
	!exec; Store NOS to Addr in TOS
	TYPE-ALLexec
	;Sexec

;; MEASURE-SAMPLE
9568
	$8E; Code
	"MEASURE-SAMPLE"; Name
	$943F; Backward Link
MEASURE-SAMPLEexec:
9579	COLON
	Const0
	VarfABORT
	!exec
	Const0
	VarTRIGerr
	!exec
	AGCGAINexec
	VarfABORT
	@exec
	OBRANCHexec
	$0004
	EXITexec
	VarGAINexp
	@exec
	VarGAINlimit
	@exec
	<exec
	OBRANCHexec
	$0004
	ACQUIRE-READINGexec
	;Sexec

;; ?CAL>BLANK''''
95A5
	$8A; Code
	"?CAL>BLANK"; Name
	$9568; Backward Link
?CAL>BLANKexec:
95B2	COLON
	$21A6
	$D735
	SWAPexec
	$D1F1
	>Rexec
	$C3D0
	LITexec
	$0004
	$D149
	VarBLANKdata
	+exec
	@exec
	>exec
	R>exec
	$21D6
	@exec
	<exec
	ANDexec
	DUPexec
	0=exec
	OBRANCHexec
	$0010
	$2949
	ConstDISPLAY1
	w-TYPEexec
	$3354
	$2598
	$F4CB
	w-TYPEexec
	;Sexec

;; GET-CAL-DATA
95F0
	$8C; Code
	"GET-CAL-DATA"; Name
	$95A5; Backward Link
GET-CAL-DATAexec:
95FF	COLON
	LITexec
	$0004
	VarGAINlimit
	!exec
	TxtINCAL1
	ConstDISPLAY1
	w-TYPEexec
	WAIT-ENTexec
	?VIAL-INexec
	OBRANCHexec
	$FFFA
	TxtCTEST
	ConstDISPLAY1
	w-TYPEexec
	TxtBLANK
	ConstDISPLAY2
	w-TYPEexec
	MEASURE-SAMPLEexec
	?DATAokexec
	DUPexec
	OBRANCHexec
	$0018
	VarAVE[S/R]
	@exec
	DISPLAY-DATAexec
	VarGAINexp
	@exec
	MINUSexec
	SWAPexec
	VarCALdata
	2!exec
	BRANCHexec
	$0004
	WAIT-ENTexec
	?VIAL-INexec
	ANDexec
	OBRANCHexec
	$FFB6
	;Sexec

;; GET-BLANK-DATA
964F
	$8E; Code
	"GET-BLANK-DATA"; Name
	$95F0; Backward Link
GET-BLANK-DATAexec:
9660	COLON
	TxtINBLNK1
	ConstDISPLAY1
	w-TYPEexec
	WAIT-ENTexec
	?VIAL-INexec
	OBRANCHexec
	$FFFA
	Const0
	VarfABORT
	!exec
	LITexec
	$0004
	VarGAINlimit
	!exec
	TxtBTEST
	ConstDISPLAY1
	w-TYPEexec
	TxtBLANK
	ConstDISPLAY2
	w-TYPEexec
	CRexec
	."exec
	$0E
	"BLANK READINGS"
	CRexec
	Const1
	LITexec
	$0004
	Const0
	(DO)exec
	DUPexec
	SETGAINexec
	UPDATE-OFFSETexec
	ACQUIRE-READINGexec
	?DATAokexec
	OBRANCHexec
	$0066
	CRexec
	."exec
	$04
	"SIG="
	VarSIG[Ave]
	@exec
	.exec
	."exec
	$04
	"REF="
	VarREF[Ave]
	@exec
	.exec
	VarSIG[Ave]
	@exec
	LITexec
	$0FA0
	<exec
	VarGAINexp
	@exec
	)exec
	=exec
	ANDexec
	OBRANCHexec
	$000A
	)exec
	2+exec
	BRANCHexec
	$000C
	DROPexec
	LITexec
	$FFFF
	)exec
	LEAVEexec
	VarGAINlimit
	!exec
	VarGAINexp
	@exec
	MINUSexec
	VarAVE[S/R]
	@exec
	VarBLANKdata
	)exec
	LITexec
	$0004
	*exec
	+exec
	2!exec
	DISPLAY-DATAexec
	?VIAL-INexec
	0=exec
	VarfABORT
	@exec
	ORexec
	OBRANCHexec
	$0004
	LEAVEexec
	LITexec
	$000A
	*exec
	(LOOP)exec
	ConstKEYPADI/O
	DROPexec
	?VIAL-INexec
	VarfABORT
	@exec
	0=exec
	ANDexec
	DUPexec
	0=exec
	OBRANCHexec
	$0004
	WAIT-ENTexec
	OBRANCHexec
	$FF15
	;Sexec

;; CHK-VIALOUT
9751
	$8B; Code
	"CHK-VIALOUT"; Name
	$964F; Backward Link
CHK-VIALOUTexec:
975F	COLON
	?VIAL-INexec
	OBRANCHexec
	$0010
	TxtREMOV
	ConstDISPLAY1
	w-TYPEexec
	TxtBLANK
	ConstDISPLAY2
	w-TYPEexec
	WAIT[VialOut]exec
	;Sexec

;; DO-CALIBRATION
9777
	$8E; Code
	"DO-CALIBRATION"; Name
	$9751; Backward Link
DO-CALIBRATIONexec:
9788	COLON
	LITexec
	$FFFF
	VarKEYLOCK
	!exec;	Store NOS to Addr in TOS
	LITexec
	$FFFF
	VarCALflg
	!exec;	Store NOS to Addr in TOS
	CHK-VIALOUTexec
	TxtSigErr
	ConstDISPLAY2
	w-TYPEexec
	CALSTRT
	ConstDISPLAY1
	w-TYPEexec
	CALC-GAINSexec
	Const2
	VarTESTTYPE
	!exec;	Store NOS to Addr in TOS
	GET-CAL-DATAexec
	VarDlta
	@exec; Push Data Contained in TOS Addr to TOS
	VarCAL%Dlta
	!exec;	Store NOS to Addr in TOS
	?VIAL-INexec
	OBRANCHexec
	$000A
	TxtREMOVCAL
	ConstDISPLAY1
	w-TYPEexec
	WAIT[VialOut]exec
	Const1
	VarTESTTYPE
	!exec;	Store NOS to Addr in TOS
	GET-BLANK-DATAexec
	VarDlta
	@exec; Push Data Contained in TOS Addr to TOS
	VarBLANK%Dlta
	!exec;	Store NOS to Addr in TOS
	?VIAL-INexec
	OBRANCHexec
	$0008
	?CAL>BLANKexec
	BRANCHexec
	$0004
	Const0
	OBRANCHexec
	$FFB2
	VarGAINlimit
	@exec; Push Data Contained in TOS Addr to TOS
	Const3
	<=exec
	OBRANCHexec
	$000A
	TxtBLNKLIM
	ConstDISPLAY1
	w-TYPEexec
	WAIT-ENTexec
	?VIAL-INexec
	OBRANCHexec
	$0018
	Ptr'PRNTRDaTm
	2000.EXEexec
	TxtREMOVBLNK
	ConstDISPLAY1
	w-TYPEexec
	TxtBLANK
	ConstDISPLAY2
	w-TYPEexec
	WAIT[VialOut]exec
	Ptr'PRINT-CALIB
	2000.EXEexec
	CNVRTdateexec
	VarCALDATE
	C!exec
	VarCALDATE
	COUNTexec
	CMOVEexec
	CNVRTtimeexec
	Const3
	-exec
	VarCALTIME
	C!exec
	VarCALTIME
	COUNTexec
	CMOVEexec
	VarfPM
	@exec; Push Data Contained in TOS Addr to TOS
	OBRANCHexec
	$0008
	TxtPM
	BRANCHexec
	$0004
	TxtAM
	Const3
	VarCALTIME
	COUNTexec
	+exec
	SWAPexec
	CMOVEexec
	VarCALTIME
	C@exec
	Const3
	+exec
	VarCALTIME
	C!exec
	Const0
	VarKEYLOCK
	!exec;	Store NOS to Addr in TOS
	Const0
	VarCALflg
	!exec;	Store NOS to Addr in TOS
	LITexec
	$FFFF
	VarCALok
	!exec;	Store NOS to Addr in TOS
	Const0
	ConstF1key
	!exec;	Store NOS to Addr in TOS
	;Sexec

;; SHOW-LAST-RESULTS
987A
	$91; Code
	"SHOW-LAST-RESULTS"; Name
	$9777; Backward Link
SHOW-LAST-RESULTSexec:
988E	COLON
	Var>990err
	@exec; Push Data Contained in TOS Addr to TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec
	$0010
	$2B83
	Countexec
	Const1
	ConstDISPLAY1
	wx-TYPEexec
	BRANCHexec
	$0008
	$2B9F
	ConstDISPLAY1
	w-TYPEexec
	;Sexec

;; "R1
91B0
	$83; Code
	""R1"; Name
	$987A; Backward Link
"R1exec:
91B6	COLON
	VarfTEST
	@exec
	OBRANCHexec
	$0004
	EXITexec
	CRexec
	."exec
	$09
	"AVE[Sig]="
	VarSIG[Ave]
	@exec
	.exec
	."exec
	$09
	"AVE[Ref]="
	$4772
	@exec
	.exec
	;Sexec

;; NOdp
9200
	$84; Code
	"NOdp"; Name
	$916C; Backward Link
NOdpexec:
9207	COLON
	DUPexec
	0<exec
	OBRANCHexec
	$0054
	Const0
	(DO)exec
	LITexec
	$000A
	M/MODexec
	ROTexec
	VarREM
	!exec
	LITexec
	$FFFF
	(+LOOP)exec
	$FFEE
	VarREM
	@exec
	LITexec
	$0004
	>exec
	OBRANCHexec
	$000C
	LITexec
	$0001
	LITexec
	$0000
	(+LOOP)exec
	2DUPexec
	VarRESULTS
	@exec
	0<exec
	OBRANCHexec
	$0004
	DMINUSexec
	Var2DIGrslt
	2!exec
	Const0
	Var2DIGrslt
	LITexec
	$0004
	+exec
	!exec
	BRANCHexec
	$0004
	DROPexec
	;Sexec

;; SHOW-ANSWER
9267
	$8B; Code
	"SHOW-ANSWER"; Name
	$9200; Backward Link
9275	COLON
	LITexec
	$0005
	VarMAXx
	!exec
	OVERexec
	>Rexec
	>Rexec
	DABSexec
	R>exec
	VarFORMAT
	@exec
	OBRANCHexec
	$000A
	NOdpexec
	d#CNVRTexec
	BRANCHexec
	$0004
	F#CNVRTexec
	Var>990err
	@exec
	OBRANCHexec
	$000A
	R>exec
	DROPexec
	2DROPexec
	EXITexec
	LITexec
	$0010
	ConstDISPLAY1
	wx-TYPEexec
	R>exec
	0<exec
	OBRANCHexec
	$000A
	LITexec
	$002D
	BRANCHexec
	$0006
	LITexec
	$0020
	LITexec
	$000F
	ConstDISPLAY1
	wx-emitexec
	VarPPM/PPB
	@exec
	OBRANCHexec
	$0008
	"PPM"
	BRANCHexec
	$0004
	"PPB"
	Const3
	LITexec
	$0016
	ConstDISPLAY1
	wx-TYPEexec
	;Sexec

;;; : CALC-RESULTS @AVE[S/R] "R1 ( --J,n  "Rn are display routines) 
  GAINexp @ 4 * BLANKdata + 2@ nF-				 ( Sg-Bg) 
  CALIBVLU 4 + @ CALIBVLU 2@ DROP						 
  BLNKVLU 4 + @ BLNKVLU 2@ DROP						   
  DUP >R OVER >R nF-						 ( Cvlu-Bvlu) 
  CALdata 2@ OVER ABS 4 * BLANKdata + 2@				    
  nF- 1 MAX								( Csig-Bsig) 
  nF*/							  ( Uncorrected delta) 
  CALdata 2@ DROP ABS 4 * DltaGains + 2@   ( Get Cal gain corr) 
  GAINexp @ 4 * DltaGains + 2@			  ( Sig gain corr) 
  nF*/						    ( Gain corrected delta) 
  R> R>								 ( Retreve Bvlu) 
  nF+ "R12 2DUP nFresult 2!							  
  2DUP S->D RESULTS 2! [ RESULTS 4 + ] LITERAL !			 
  S->D j,d>2DIG ;			 ( Go calc& sav 2 digit result)
9925
	$8C; Code
	"CALC-RESULTS"; Name
	$98EA; Backward Link
CALC-RESULTSexec:
9934	COLON
	@AVE[S/R]exec
	"R1exec
	VarGAINexp
	@exec; Push Data Contained in TOS Addr to TOS
	LITexec; Put value that follows on TOS
	$0004
	*exec	  ;  Multiply TOS by NOS
	VarBLANKdata
	+exec; Add NOS To TOS
	2@exec;  fetches a double integer to the stack
	nF-exec
	VarCALIBVLU
	LITexec; Put value that follows on TOS
	$0004
	+exec; Add NOS To TOS
	@exec; Push Data Contained in TOS Addr to TOS
	VarCALIBVLU
	2@exec;  fetches a double integer to the stack
	DROPexec; Delete TOS
	VarBLNKVLU
	LITexec; Put value that follows on TOS
	$0004
	+exec; Add NOS To TOS
	@exec; Push Data Contained in TOS Addr to TOS
	VarBLNKVLU
	2@exec;  fetches a double integer to the stack
	DROPexec; Delete TOS
	DUPexec; Duplicate TOS
	>Rexec; Move TOS to Return Stack
	OVERexec; Duplicate NOS at TOS
	>Rexec; Move TOS to Return Stack
	nF-exec
	VarCALdata
	2@exec;  fetches a double integer to the stack
	OVERexec; Duplicate NOS at TOS
	ABSexec;	   Absolute Value of TOS
	LITexec; Put value that follows on TOS
	$0004
	*exec	  ;  Multiply TOS by NOS
	VarBLANKdata
	+exec; Add NOS To TOS
	2@exec;  fetches a double integer to the stack
	nF-exec
	Const1;  Push $0001 onto TOS
	MAXexec
	nF*/exec
	VarCALdata
	2@exec;  fetches a double integer to the stack
	DROPexec; Delete TOS
	ABSexec;	   Absolute Value of TOS
	LITexec; Put value that follows on TOS
	$0004
	*exec	  ;  Multiply TOS by NOS
	VarDltaGains
	+exec; Add NOS To TOS
	2@exec;  fetches a double integer to the stack
	VarGAINexp
	@exec; Push Data Contained in TOS Addr to TOS
	LITexec; Put value that follows on TOS
	$0004
	*exec	  ;  Multiply TOS by NOS
	VarDltaGains
	+exec; Add NOS To TOS
	2@exec;  fetches a double integer to the stack
	nF*/exec
	R>exec;   Retrieve TOS from return stack.
	R>exec;   Retrieve TOS from return stack.
	nF+exec
	"R12
	2DUPexec; Duplicate TOS/NOS
	VarnFresult
	2!exec; Store NOS and 2nd NOS to Addr in TOS; Store NOS and 2nd NOS to Addr in TOS
	2DUPexec; Duplicate TOS/NOS
	S->Dexec
	VarRESULTS
	2!exec; Store NOS and 2nd NOS to Addr in TOS
	LITexec; Put value that follows on TOS
	$0E5A
	!exec; Store NOS to Addr in TOS
	S->Dexec
	j,d>2DIGexec
	;Sexec

;; DISPLAY-RESULTS
99DA
	$8F; Code
	"DISPLAY-RESULTS"; Name
	$9925; Backward Link
DISPLAY-RESULTSexec:
99EC	COLON
	Var>990err
	@exec; Push Data Contained in TOS Addr to TOS
	OBRANCHexec
	$000A
	Txt>990err
	ConstDISPLAY1
	w-TYPEexec
	EXITexec
	TxtRSLTS
	ConstDISPLAY1
	w-TYPEexec
	Var2DIGrslt
	2@exec	; Push Data Contained in TOS Addr to NOS/TOS (32Bit)
	ConstfNEGOK
	@exec; Push Data Contained in TOS Addr to TOS
	0=exec:; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec
	$000C
	LITexec
	$0000
	LITexec
	$0000
	DMAXexec
	Const0
	ConstF2key
	!exec; Store NOS to Addr in TOS
	Const0
	ConstfNEGOK
	!exec; Store NOS to Addr in TOS
	2DUPexec:; Duplicate TOS/NOS
	Var2DIGrslt
	2!exec	; Store NOS and 2nd NOS to Addr in TOS
	2DUPexec:; Duplicate TOS/NOS
	VarRESULTS
	2!exec	; Store NOS and 2nd NOS to Addr in TOS
	LITexec
	$0EBC
	@exec; Push Data Contained in TOS Addr to TOS
	DUPexec
	LITexec
	$0E5A
	!exec; Store NOS to Addr in TOS
	$9275
	;Sexec

;; DO-TEST
9A90
	$87; Code
	"DO-TEST"; Name
	$9A53
DO-TESTexec:
9A9A	COLON
	LITexec
	$0005
	VarMAXx
	!exec; Store NOS to Addr in TOS
	?VIAL-INexec
	OBRANCHexec
	$003A
	$2AA2
	ConstDISPLAY1
	w-TYPEexec
	TxtBLANK
	ConstDISPLAY2
	w-TYPEexec
	MEASURE-SAMPLEexec
	?VIAL-INexec
	?DATAokexec
	ANDexec;	AND NOS with TOS
	OBRANCHexec
	$0020
	CALC-RESULTSexec
	DISPLAY-RESULTSexec
	Var>990err
	@exec; Push Data Contained in TOS Addr to TOS
	0=exec:; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec
	$0012
	PRNTRDaTexec
	PRINT-RESULTSexec
	VarfTEST
	@exec; Push Data Contained in TOS Addr to TOS
	0=exec:; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec
	$0004
	COMNTSexec
	DISPLAY-DATAexec
	;Sexec

;; METHOD&CALIB
9B7D
	$8C; Code
	"METHOD&CALIB"; Name
	$9B33; Backward Link
METHOD&CALIBexec:
9B8C	COLON
	$8F16
	DO-CALIBRATIONexec
	;Sexec

;; INIT-SYSTEM1''''
9B94
	$8C; Code
	"INIT-SYSTEM1"; Name
	$9B7D; Backward Link
9BA3	COLON
	Const0
	VarLMPstat
	!exec
	Const0
	VarfDSPLY
	!exec
	VarBLANKdata
	LITexec
	$0010
	OVERexec
	+exec
	SWAPexec
	(DO)exec
	Const0
	)exec
	!exec
	Const2
	(+LOOP)exec
	$FFF6
	LITexec
	$FFFF
	Varf1stTEST
	!exec
	LITexec
	$000A
	Var#SMPLS
	!exec
	Const2
	Var#OUTLYERS
	!exec
	Const0
	VarKEYLOCK
	!exec
	INIT-FLTRTBLSexec
	LITexec
	$0010
	Var#PRIMES
	!exec
	LITexec
	$003C
	ConstSMPLDLY
	!exec
	;Sexec

;; START
9C6D
	$85; Code
	"START"; Name
	$9BFB
	$C53C
	$C9CE
	$24AA
	$C4E7
	$C083
	$C05D
	$007B
	$C78B
	$C0A2
	$0008
	$24BC
	$C4E7
	$C083
	$FD95
	$F35A
	$C627
	$C4E7
	$C35F
	$C5B9
	$21F4
	$C507
	$F142
	$C05D
	$0032
	$3C9B
	$C507
	$51DC
	$8F74
	$8F81
	$C507
	$9C09
	$2421
	$24FF
	$22BF
	$C5B9
	$F703
	$C507
	$238D
////24 FF22 BF9B 8CC5 B932 92C5 0722 BF8F A922 BFC0 5DFF FF48 44C5 07C5 B98F D0C5 072A 07F4 BCF5 1E29 BCF4 CBF5 1EC6 27C4 E7C3 5FC5 B922 01C5 0791 1E9B 4129 E1F4 CBF5 1EC3 4EC6 27C4 E7D7 EEC0 A200 18C2 75CA D30B 4449 5254 5920 5354 4143 4BC6 27C4 E7C3 5FC5 B9C0 A2FF CAC3 7E88 4658 3130 3045 4EC4 9C6D C53C C37E	

;; "SETGAIN1
9DB4
	$89; Code
	""SETGAIN1"; Name
	$9D8C; Backward Link
"SETGAIN1:
9DC0 	String1exec
	$FAC4
	"SET SIGNAL CHANNEL GAIN "
	DB 0

;; "SETGAIN2
9DDD
	$89; Code
	""SETGAIN2"; Name
	$9DB4; Backward Link
"SETGAIN2:
9DE9 	String1exec
	$FAC4
	"GAIN 10^[0-3] =    "
	DB 0

;; "CALreq
9F19
	$87; Code
	""CALreq"; Name
	$9EF1; Backward Link
TxtCALreq:
9F23 	String1exec
	$FAC4
	"CALIB REQRED"
	DB 0	

;; MINxSV
A737
	$86; Code
	"MINxSV" Name
	$A6DC; Backward Link
VarMINxSV:
A740 	GetVar
	$1380

;; MAXxSV
A744
	$86; Code
	"MAXxSV" Name
	$A737; Backward Link
VarMAXxSV:
A74D 	GetVar
	$137E

;; GAINSET'''
A76E
	$87; Code
	"GAINSET"; Name
	$A751; Backward Link
GAINSETexec:
A778 	COLON; Complile The Following Section
	VarMINx
	@exec; Push Data Contained in TOS Addr to TOS
	VarMINxSV
	!exec; Store NOS to Addr in TOS
	VarMAXx
	@exec; Push Data Contained in TOS Addr to TOS
	VarMAXx
	!exec; Store NOS to Addr in TOS
	"SETGAIN1
	ConstDISPLAY1
	w-TYPEexec
	"SETGAIN2
	ConstDISPLAY2
	w-TYPEexec
	LITexec; Put value that follows on TOS
	$0011
	VarMINx
	!exec; Store NOS to Addr in TOS
	LITexec; Put value that follows on TOS
	$0011
	VarMAXx
	!exec; Store NOS to Addr in TOS
	VarGAINexp
	@exec; Push Data Contained in TOS Addr to TOS
	Const0;	Push $0000 onto TOS
	VarINITVLU
	2!exec	; Store NOS and 2nd NOS to Addr in TOS
	Const0;	Push $0000 onto TOS
	VarINITVLU
	LITexec; Put value that follows on TOS
	$0004
	+exec; Add NOS To TOS
	!exec; Store NOS to Addr in TOS
	Const0;	Push $0000 onto TOS
	Varf+/-#
	!exec; Store NOS to Addr in TOS
	GET[n#]exec
	DUPexec; Duplicate TOS
	VarGAINexp
	!exec; Store NOS to Addr in TOS
	Const0;	Push $0000 onto TOS
	OVERexec; Duplicate NOS at TOS
	<=exec;		   NOS <= TOS?
	SWAPexec; Swap TOS with NOS
	Const3
	<=exec;		   NOS <= TOS?
	ANDexec;  AND NOS with TOS
	OBRANCHexec
	$FFBC
	Const0;	Push $0000 onto TOS
	VarGAINexp
	@exec; Push Data Contained in TOS Addr to TOS
	1+exec;    Add 1 TO TOS
	Const0;	Push $0000 onto TOS
	(DO)exec; Beginning of DO Loop
	LITexec; Put value that follows on TOS
	$000A
	*exec;  Multiply TOS by TOS
	Const1;    Push $0001 onto TOS
	MAXexec
	(LOOP)exec
	$FFF4
	SETGAINexec
	VarMINxSV
	@exec; Push Data Contained in TOS Addr to TOS
	VarMINx
	!exec; Store NOS to Addr in TOS
	VarMAXx
	@exec; Push Data Contained in TOS Addr to TOS
	VarMAXx
	!exec; Store NOS to Addr in TOS
	;Sexec

;;; : SHOW-RSLTS  ACQUIRE-READING							
    SIG[Ave] @ N#CNVRT 5 DISPLAY1 wx-TYPE				   
    REF[Ave] @ N#CNVRT 14 DISPLAY1 wx-TYPE				  
    GAINexp  @ N#CNVRT 24 DISPLAY1 wx-TYPE				  
    SIGok @ 0= REFok @ 0= OR fEr<Limit @ 0= OR fABORT @ OR	 
    LMPERR @ 0> OR									 
    IF "DTAerr DISPLAY2 w-TYPE -1 DTAerr? !				 
    ELSE DTAerr? @ IF "SIG/REF DISPLAY2 w-TYPE 0 DTAerr? ! THEN 
	 @AVE[S/R] SWAP DROP S->D -4						 
	 FORMAT-ANSWER 6 MIN 6 DISPLAY2 wx-TYPE				
	 CALok @ IF CALC-RESULTS RESULTS 2@ RESULTS 4 + @		
			  FORMAT-ANSWER 5 MIN 20 DISPLAY2 wx-TYPE	   
		    ELSE "CALreq Count 13 DISPLAY2 wx-TYPE THEN	  
    THEN ;
AA3C
	$8A; Code
	"SHOW-RSLTS"; Name
	$AA2E; Backward Link
SHOW-RSLTSexec:
AA49	COLON
	ACQUIRE-READINGexec
	VarSIG[Ave]
	@exec; Push Data Contained in TOS Addr to TOS
	N#CNVRTexec
	LITexec; Put value that follows on TOS
	$0005
	ConstDISPLAY1
	wx-TYPEexec
	VarREF[Ave]
	@exec; Push Data Contained in TOS Addr to TOS
	N#CNVRTexec
	LITexec; Put value that follows on TOS
	$000E
	ConstDISPLAY1
	wx-TYPEexec
	VarGAINexp
	@exec; Push Data Contained in TOS Addr to TOS
	N#CNVRTexec
	LITexec; Put value that follows on TOS
	$0018
	ConstDISPLAY1
	wx-TYPEexec
	VarSIGok
	@exec; Push Data Contained in TOS Addr to TOS
	0=exec:; Set TOS to TRUE if 0, ELSE FALSE
	VarREFok
	@exec; Push Data Contained in TOS Addr to TOS
	0=exec:; Set TOS to TRUE if 0, ELSE FALSE
	ORexec
	ConstfEr<Limit
	@exec; Push Data Contained in TOS Addr to TOS
	0=exec:; Set TOS to TRUE if 0, ELSE FALSE
	ORexec
	VarfABORT
	@exec; Push Data Contained in TOS Addr to TOS
	ORexec
	VarLMPERR
	@exec; Push Data Contained in TOS Addr to TOS
	0>exec
	ORexec
	OBRANCHexec
	$0014
	''DTAerrStr
	ConstDISPLAY2
	w-TYPEexec
	LITexec; Put value that follows on TOS
	$FFFF
	VarDTAerr?
	!exec; Store NOS to Addr in TOS
	BRANCH
	$006A
	VarDTAerr?
	@exec; Push Data Contained in TOS Addr to TOS
	OBRANCHexec
	$000E
	TxtSIG/REF
	ConstDISPLAY2
	w-TYPEexec
	Const0;	Push $0000 onto TOS
	VarDTAerr?
	!exec; Store NOS to Addr in TOS
	@AVE[S/R]exec
	SWAPexec; Swap TOS with NOS
	DROPexec; Delete TOS
	S->Dexec
	LITexec; Put value that follows on TOS
	$FFFC
	FORMAT-ANSWERexec
	LITexec; Put value that follows on TOS
	$0006
	MINexec
	LITexec; Put value that follows on TOS
	$0006
	ConstDISPLAY2
	wx-TYPEexec
	VarCALok
	@exec; Push Data Contained in TOS Addr to TOS
	OBRANCHexec
	$0026
	CALC-RESULTSexec
	VarRESULTS
	2@exec;  fetches a double integer to the stack
	VarRESULTS
	LITexec; Put value that follows on TOS
	$0004
	+exec; Add NOS To TOS
	@exec; Push Data Contained in TOS Addr to TOS
	FORMAT-ANSWERexec
	LITexec; Put value that follows on TOS
	$0005
	MINexec
	LITexec; Put value that follows on TOS
	$0014
	ConstDISPLAY2
	wx-TYPEexec
	BRANCH
	$000E
	TxtCALreq
	Countexec
	LITexec; Put value that follows on TOS
	$000D
	ConstDISPLAY2
	wx-TYPEexec
	;Sexec

;; OUTcnt
AB1B
	$86; Code
	"OUTcnt"; Name
	$AA3C; Backward Link
VarOUTcnt
AB24	GetVar
	$1384

;; RSTLMP
AD27
	$86; Code
	"RSTLMP"; Name
RSTLMP:
AD30	$AD32

AD32   L_AD32	  LDA A   $0EC4   
AD35		  AND A   #$7F
AD37		  STA A   A/DHiByte   
AD3A		  LDA B   $13B2   
AD3D		  PSH B
AD3E		  LDA B   $13B1   
AD41		  PSH B
AD42   L_AD42     JMP	  NEXT   

;; PLSELMP
AD45
	$87; Code
	"PLSELMP"; Name
	$AD27; Backward Link
PLSELMP:
AD4F	$AD51

AD51   L_AD51     LDA A   $0EC4   
AD54		  ORA A   #$80
AD56		  STA A   $0EC4   
AD59		  STA A   A/DHiByte   
AD5C   L_AD5C     JMP	NEXT   

;; RDYWAIT
AD5F
	$87
	"RDYWAIT"
	$AD45
RDYWAIT:
AD69	$AD6B

AD6B   L_AD6B     CLR B
AD6C   L_AD6C     INC B
AD6D		  CMP B   #$64
AD6F		  BNE	L_AD7A   
AD71		  LDX	#$FFFF
AD74		  STX	flMPERR   
AD77   L_AD77     JMP	NEXT   
AD7A   L_AD7A     LDA A   A/DStatus   
AD7D		  AND A   #$40
AD7F		  BNE	L_AD6C   
AD81		  LDX	#$0000
AD84		  STX	flMPERR   
AD87   L_AD87     JMP	NEXT

;; FIRE-TEST
AD8A
	$89; Code
	"FIRE-TEST"; Name
	$AD5F; Backward Link
FIRE-TESTexec:
AD96	COLON
	RSTLMP
	DELAY[ms]exec
	PLSELMP
	RDYWAIT
	;Sexec

;;
AE90
	

;; DO-RUNIN
AF36
	$88; Code
	"DO-RUNIN"; Name
	$AF1F; Backward Link''''
DO-RUNINexec:
AF41	COLON
	RSTLMP
	DROPexec:; Delete TOS
	@RUNDLYexec
	DELAY[ms]exec
	PLSELMP
	RDYWAIT
	?KEYPADexec
	OBRANCHexec
	$000C
	PCkeyexec
	ConstEnt
	=exec
	BRANCHexec
	$0004
	Const0
	OBRANCHexec
	$FFE0
	Const0
	!TSTBYTEexec
	$AF2C
	;Sexec

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
TxtBADLMP:
B77C	String1exec
	String2exec
	"BAD LAMP DETECTION TEST "
	$00

;;; : LOOP-FIRE  0 10 0 DO FIRE-LAMP LMPERR @ + LOOP ;
B799
	$89; Code
	"LOOP-FIRE"; Name
	$B772; Backward Link
LOOP-FIREexec:
B7A5	COLON; Complile The Following Section
	Const0;  Push $0000 onto TOS
	LITexec; Put value that follows on TOS
	$000A; Literal Value for Loop Limit
	Const0;  Push $0000 onto TOS for Loop Index
	(DO)exec; Beginning of DO Loop
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
	"ACK	DISPLAY2 w-TYPE
	BEGIN PCkey 13 = UNTIL
	LOOP-FIRE 7 < PRNT-FAIL/PASS
	"OPAQOUT DISPLAY2 w-TYPE WAIT[VialOut] ;
B7BF
	$8A; Code
	"BADLMP-DET"; Name
	$B799; Backward Link
BADLMP-DETexec:
B7CC	COLON; Complile The Following Section
	BOLDexec
	TxtBADLMP
	Countexec
	PRINTSTRINGexec
	PRNTcrlfexec
	$B72D
	ConstDISPLAY1; Push $0001 Onto TOS
	w-TYPEexec
	TxtACK
	ConstDISPLAY2; Push $0002 onto TOS
	w-TYPEexec
	BEGIN
		PCkeyexec
		LITexec; Put value that follows on TOS
		$000D; Literal Value
		=exec
	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
	$FFF6
	LOOP-FIREexec
	LITexec; Put value that follows on TOS
	$0007; Literal Value
	<exec;	 NOS<TOS?
	$A50C
	TxtOPAQOUT
	ConstDISPLAY2; Push $0002 onto TOS
	w-TYPEexec
	WAIT[VialOut]exec
	;Sexec
 

BE5A   L_BE5A   RTS  
BE5B   L_BE5B   JMP	NEXT

;; EXTIRQ
BE5E
	$86
	"EXTIRQ"
	$BE4F
	$BE69

BE69   L_BE69   RTS
BE6A   L_BE6A   JMP	NEXT   

;; EXTNMI
BE6D
	$86
	"EXTNMI"
	$BE5E
	$BE78

BE78   L_BE78     JSR	S_FCFE   
BE7B		  RTS  
BE7C   L_BE7C     JMP	NEXT

;; EXTRST
BE7F
	$86
	"EXTRST"
	$BE6D
BE88 $BE8A

BE8A   L_BE8A     LDX	#$0DDC
BE8D   L_BE8D     CLR	$00,X
BE8F		  INX  
BE90		  CPX	#$1FFE
BE93		  BNE	L_BE8D   
BE95		  LDX	#PrintBuf
BE98		  STX	$0A82   
BE9B		  STX	PBufPtr   
BE9E		  LDX	#$0000
BEA1		  STX	$0A8A   
BEA4		  LDX	#$0C00
BEA7		  STX	$067E   
BEAA		  LDX	D_8004   
BEAD		  STX	$0568   
BEB0		  LDX	D_8002   
BEB3		  STX	$057E   
BEB6		  LDX	D_8000   
BEB9		  STX	$0512   
BEBC		  LDX	#$9C75
BEBF		  STX	$0556   
BEC2		  PUL A
BEC3		  PUL B
BEC4		  DES  
BEC5		  TSX  
BEC6		  CLR	$00,X
BEC8		  PSH B
BEC9		  PSH A
BECA		  RTS
  
BECB   L_BECB   JMP	NEXT

C000   L_C000   NOP  
C001		JMP	Init1   
C004   L_C004   NOP  
C005		JMP	L_D086

C008		  FCB	$68,  $00,  $00,  $01,  $00,  $00,  $00,  $08
C010   D_C010   FCB	$05,  $00
C012   D_C012   FCB	$04,  $30
C014   D_C014   FCB	$04,  $FE,  $04,  $30,  $00,  $1F,  $00,  $00
C01C   D_C01C   FCB	$0A,  $8E
C01E   D_C01E   FCB	$0A,  $8E
C020   D_C020   FCB	$05,  $93
C022   D_C022   FCB	$00,  $50
C024   D_C024   FCB	$00,  $00

C026   StorTOS: PUL A
C027		PUL B
C028   StoreD:  STA A   $00,X
C02A		STA B   $01,X
C02C		BRA	NEXT
  
C02E   LoadD:   LDA A   $00,X
C030		LDA B   $01,X
C032   PUSHD:   PSH B
C033		PSH A
C034   NEXT:    LDX	XSafe   
C036   NEXT1:   INX  
C037		INX  
C038		STX	XSafe   
C03A		LDX	$00,X
C03C   Disptch: STX	$00EA   
C03E		LDX	$00,X
C040		JMP	$00,X
C041		NOP

;; ASSEMBLER-RAM
C043
	$8D
	"ASSEMBLER-RAM"
	$0000; First Entry (or seed)?
	USER
	$0042

;; LIT
C057
	$83; Code
	"LIT"; Name
	$C043; Backward Link
LITexec:			; Literal that follows is pushed onto TOS
C05D $C05F	

C05F   L_C05F     LDX	XSafe   
C061		  INX  
C062		  INX  
C063		  STX	XSafe   
C065		  LDA A   $00,X
C067		  LDA B   $01,X
C069		  JMP	PUSHD   

C06C   ChrLit:    SUB B   #$6E; This makes no sense... LDA B   $01,X follows
C06E		  LDX	XSafe   
C070		  INX  
C071		  STX	XSafe   
C073		  CLR A
C074		  LDA B   $01,X
C076		  JMP	PUSHD   

;; EXECUTE
C079
	$87; Code
	"EXECUTE"; Name
	$C057; Backward Link
EXECUTEexec:
C083 $C085

C085   L_C085 	  TSX  ; Get TOS addr
C086		  LDX  $00,X; Load contents of TOS into X
C088		  INS  ; Drop TOS
C089		  INS  
C08A		  JMP	Disptch

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

C0A4   L_C0A4     PUL A
C0A5		  PUL B
C0A6		  ABA  
C0A7		  BNE	L_C0BC; Check to see if TOS<>0 (TRUE)  
C0A9		  BCS	L_C0BC   
C0AB   L_C0AB     LDX	XSafe; Get here if TOS=0 (FALSE)  
C0AD		  LDA B   $03,X; First Offset Arg Byte
C0AF		  LDA A   $02,X; Second Offset Arg Byte
C0B1		  ADD B   XSafe+1; Compute amount of code to skip  
C0B3		  ADC A   XSafe   
C0B5		  STA B   XSafe+1   
C0B7		  STA A   XSafe   
C0B9   L_C0B9     JMP	NEXT   
C0BC   L_C0BC     LDX	XSafe   
C0BE		  INX  
C0BF		  INX  
C0C0		  STX	XSafe   
C0C2   L_C0C2     JMP	NEXT   

;; (LOOP)
C0C5
	$86; Code
	"(LOOP)"; Name
	$C098; Backward Link
(LOOP)exec:
C0CE $C0D0

C0D0   L_C0D0     CLR A
C0D1		  LDA B #$01
C0D3		  BRA	L_C0E3   

;; (+LOOP)
C0D5
	$87; Code
	"(+LOOP)"; Name
	$C0C5; Backwark Link
(+LOOP)exec:
C0DF $C0E1

C0E1   L_C0E1     PUL A
C0E2		  PUL B
C0E3   L_C0E3     TST A
C0E4		  BPL	L_C0FC   
C0E6		  BSR	S_C0F1   
C0E8		  SEC  
C0E9		  SBC B   $05,X
C0EB		  SBC A   $04,X
C0ED		  BPL	L_C0AB   
C0EF		  BRA	L_C104
   
C0F1   S_C0F1     LDX	$00EE   
C0F3		  ADD B   $03,X
C0F5		  ADC A   $02,X
C0F7		  STA B   $03,X
C0F9		  STA A   $02,X
C0FB		  RTS
  
C0FC   L_C0FC     BSR	S_C0F1   
C0FE		  SUB B   $05,X
C100		  SBC A   $04,X
C102		  BMI	L_C0AB   
C104   L_C104     INX  
C105		  INX  
C106		  INX  
C107		  INX  
C108		  STX	$00EE   
C10A		  BRA	L_C0BC   

;; (DO)
C10C
	$84; Code
	"(DO)"; Name
	$C0D5; Backward Link
(DO)exec:; Beginning of DO Loop
C113 $C115

C115   L_C115     LDX	$00EE   
C117		  DEX  
C118		  DEX  
C119		  DEX  
C11A		  DEX  
C11B		  STX	$00EE   
C11D		  PUL A
C11E		  PUL B
C11F		  STA A $02,X
C121		  STA B $03,X
C123		  PUL A
C124		  PUL B
C125		  STA A $04,X
C127		  STA B $05,X
C129   L_C129     JMP	NEXT   

;; )
C12C
	$81; Code
	")"; Name
	$C10C; Backward Link
)exec:
C130 $C132

C132   L_C132     LDX	$00EE   
C134		  INX  
C135		  INX  
C136		  JMP	LoadD   

;; DIGIT
C139
	$85; Code
	"DIGIT"; Name
	$C12C; Backward Link
DIGITexec:
C141 $C143

C143   L_C143   TSX  
C144		  LDA A $03,X
C146		  SUB A #$30
C148		  BMI	L_C165   
C14A		  CMP A #$0A
C14C		  BMI	L_C158   
C14E		  CMP A #$11
C150		  BMI	L_C165   
C152		  CMP A #$2B
C154		  BPL	L_C165   
C156		  SUB A #$07
C158   L_C158     CMP A $01,X
C15A		  BPL	L_C165   
C15C		  LDA B #$01
C15E		  STA A $03,X
C160   L_C160     STA B $01,X
C162   L_C162     JMP	NEXT   
C165   L_C165     CLR B
C166		  INS  
C167		  INS  
C168		  TSX  
C169		  STA B $00,X
C16B		  BRA	L_C160

;; (FIND)
C16D
	$86; Code
	"(FIND)"; Name
	$C139; Backward Link
(FIND)exec:
C176 $C178

C178		  NOP  
C179		  NOP  
C17A		  LDX	#$00E0
C17D		  LDA B #$04
C17F   L_C17F   PUL A
C180   FindX:     STA A $00,X
C182		  INX  
C183		  DEC B
C184		  BNE	L_C17F   
C186		  LDX	$00E0   
C188   L_C188     LDA B $00,X
C18A		  STA B $00E6   
C18C		  AND B #$3F
C18E		  INX  
C18F		  STX	$00E0   
C191		  LDX	$00E2   
C193		  LDA A $00,X
C195		  INX  
C196		  STX	$00E4   
C198		  CBA  
C199		  BNE	L_C1BD   
C19B   L_C19B     LDX	$00E4   
C19D		  LDA A $00,X
C19F		  INX  
C1A0		  STX	$00E4   
C1A2		  LDX	$00E0   
C1A4		  LDA B $00,X
C1A6		  INX  
C1A7		  STX	$00E0   
C1A9		  TST B
C1AA		  BPL	L_C1BA   
C1AC		  AND B #$7F
C1AE		  CBA  
C1AF		  BEQ	L_C1C6   
C1B1   L_C1B1     LDX	$00,X
C1B3		  BNE	L_C188   
C1B5		  CLR A
C1B6		  CLR B
C1B7		  JMP	PUSHD 
  
C1BA   L_C1BA     CBA  
C1BB		  BEQ	L_C19B   
C1BD   L_C1BD     LDX	$00E0   
C1BF   L_C1BF     LDA B $00,X
C1C1		  INX  
C1C2		  BPL	L_C1BF   
C1C4		  BRA	L_C1B1   
C1C6   L_C1C6     LDA A   $00E0   
C1C8		  LDA B   $00E1   
C1CA		  ADD B   #$04
C1CC		  ADC A   #$00
C1CE		  PSH B
C1CF		  PSH A
C1D0		  LDA A   $00E6   
C1D2		  PSH A
C1D3		  CLR A
C1D4		  PSH A
C1D5		  LDA B   #$01
C1D7		  JMP	PUSHD

C1DA   L_C1DA     PSH A
C1DB		  CLR A
C1DC		  PSH A
C1DD		  LDA B   #$01
C1DF		  JMP	PUSHD   

;; ENCLOSE
C1E2
	$87; Code
	"ENCLOSE"; Name
	$C16D; Backward Link
ENCLOSEexec:
C1EB $C1EE

C1EE   L_C1EE     INS  
C1EF		  PUL B
C1F0		  TSX  
C1F1		  LDX	$00,X
C1F3		  CLR	$00E0   
C1F6   L_C1F6     LDA A   $00,X
C1F8		  BEQ	L_C221   
C1FA		  CBA  
C1FB		  BNE	L_C206   
C1FD		  INX  
C1FE		  INC	$00E0   
C201		  BRA	L_C1F6   
C203   L_C203     JMP	L_C004   
C206   L_C206     LDA A   $00E0   
C208		  PSH A
C209		  CLR A
C20A		  PSH A
C20B   L_C20B     LDA A   $00,X
C20D		  BEQ	L_C228   
C20F		  CBA  
C210		  BEQ	L_C218   
C212		  INX  
C213		  INC	$00E0   
C216		  BRA	L_C20B
   
C218   L_C218     LDA B   $00E0   
C21A		  CLR A
C21B		  PSH B
C21C		  PSH A
C21D		  INC B
C21E		  JMP	PUSHD
   
C221   L_C221     LDA B   $00E0   
C223		  PSH B
C224		  PSH A
C225		  INC B
C226		  BRA	L_C22A   
C228   L_C228     LDA B   $00E0   
C22A   L_C22A     PSH B
C22B		  PSH A
C22C		  LDA B   $00E0   
C22E		  JMP	PUSHD   

;; EMIT
C231
	$84; Code
	"EMIT"; Name
	$C1E2; Backward Link
EMITexec:
C238 $C23A

C23A   L_C23A     PUL A
C23B		  PUL A
C23C		  JSR	S_D3E3   
C23F		  LDX	$00F0   
C241		  INC	$1B,X
C243		  BNE	L_C247   
C245		  INC	$1A,X
C247   L_C247     JMP	NEXT   

;; KEY
C24A
	$83; Code
	"KEY"; Name
	$C231; Backward Link
KEYexec:
C250 $C252

C252   L_C252     JSR	S_D3FC   
C255		  PSH A
C256		  CLR A
C257		  PSH A
C258   L_C258     JMP	NEXT   

;; TERMINAL
C25B
	$89
	"TERMINAL"
	$C24A
TERMINALexec:
C267 $C269

C269   L_C269     JSR	S_D416   
C26C		  CLR B
C26D		  JMP	PUSHD   

;; CR
C270
	$82; Code
	"CR"; Name
	$C25B; Backward Link
CRexec:; 	Send Carriage Return
C275 $C277


C277   L_C277   JSR	S_D423   
C27A   L_C27A   JMP	NEXT   

;; CMOVE
C27D
	$85; Code
	"CMOVE"; Name
	$C270; Backward Link
CMOVEexec:
C285 $C287

C287   L_C287     LDX	#$00E0; Point to CMove control block
C28A		  LDA B   #$06  ; Num Args
C28C   L_C28C     PUL A		 ; Get stack args
C28D		  STA A   $00,X ; Store Arg into block
C28F		  INX  		 ; Point to next byte in block
C290		  DEC B		 ; Dec Num Args
C291		  BNE	L_C28C; Get next byte if not done  
C293   L_C293     LDA A   $00E0 ; Dec count and test for done 
C295		  LDA B   $00E1 ; 
C297		  SUB B   #$01  ;
C299		  SBC A   #$00  ;
C29B		  STA A   $00E0 ; 
C29D		  STA B   $00E1 ;
C29F		  BCS	L_C2B1; Done...Quit  
C2A1		  LDX	$00E4; Get Src Ptr  
C2A3		  LDA A   $00,X; Get Src Data
C2A5		  INX  		; Inc Src Ptr
C2A6		  STX	$00E4; Save Src Ptr   
C2A8		  LDX	$00E2; Get Dest Ptr  
C2AA		  STA A   $00,X; Store Dest Data
C2AC		  INX  		; Inc Dest Ptr
C2AD		  STX	$00E2; Save Dest Ptr
C2AF		  BRA	L_C293   
C2B1   L_C2B1     JMP	NEXT   

;; U)
C2B4
	$82; Code
	"U)"; Name
	$C27D; Backward link
U)exec:
C2B9 $C2BB

C2BB   L_C2BB     BSR	IntMult   
C2BD		  INS  
C2BE		  INS  
C2BF		  JMP	PUSHD   
C2C2   IntMult    LDA A   #$10; Starting Shift Count
C2C4		  PSH A
C2C5		  CLR A
C2C6		  CLR B
C2C7		  TSX  
C2C8   L_C2C8     ROR	$05,X
C2CA		  ROR	$06,X
C2CC		  DEC	$00,X; Decrement Shift Count
C2CE		  BMI	L_C2DA; If 0, we are done  
C2D0		  BCC	L_C2D6   
C2D2		  ADD B   $04,X
C2D4		  ADC A   $03,X
C2D6   L_C2D6     ROR A
C2D7		  ROR B
C2D8		  BRA	L_C2C8   
C2DA   L_C2DA     INS  
C2DB		  RTS  

;; U/
C2DC
	$82
	"U/"
	$C2B4
U/exec:
C2E1 $C2E3

C2E3   L_C2E3     LDA A   #$11
C2E5		  PSH A
C2E6		  TSX  
C2E7		  LDA A   $03,X
C2E9		  LDA B   $04,X
C2EB   L_C2EB     CMP A   $01,X
C2ED		  BHI	L_C2F8   
C2EF		  BCS	L_C2F5   
C2F1		  CMP B   $02,X
C2F3		  BCC	L_C2F8   
C2F5   L_C2F5     CLC  
C2F6		  BRA	L_C2FD   
C2F8   L_C2F8     SUB B   $02,X
C2FA		  SBC A   $01,X
C2FC		  SEC  
C2FD   L_C2FD     ROL	$06,X
C2FF		  ROL	$05,X
C301		  DEC	$00,X
C303		  BEQ	L_C30B   
C305		  ROL B
C306		  ROL A
C307		  BCC	L_C2EB   
C309		  BRA	L_C2F8   
C30B   L_C30B     INS  
C30C		  INS  
C30D		  INS  
C30E		  INS  
C30F		  INS  
C310		  JMP	L_C495   

;; AND
C313
	$83; Code
	"AND"; Name
	$C2DC; Backward Link
ANDexec:;	AND NOS with TOS
C319 $C31B

C31B   L_C31B     PUL A
C31C		  PUL B
C31D		  TSX  
C31E		  AND B   $01,X
C320		  AND A   $00,X
C322		  JMP	StoreD   

;; OR
C325
	$82; Code
	"OR"; Name
	$C313; Backward Link
ORexec:;	OR NOS with TOS
C32A $C32C

C32C   L_C32C     PUL A
C32D		  PUL B
C32E		  TSX  
C32F		  ORA B $01,X
C331		  ORA A $00,X
C333		  JMP	StoreD   

;; XOR
C336
	$83; Code
	"XOR"; Name
	$C325; Backward Link
XORexec:;	XOR NOS with TOS
C33C $C33E

C33E   L_C33E     PUL A
C33F		  PUL B
C340		  TSX  
C341		  EOR B $01,X
C343		  EOR A $00,X
C345		  JMP	StoreD   

;; SP@
C348
	$83; Code
	"SP@"; Name
	$C336; Backward Link
SP@exec:
C34E $C350

C350   L_C350     TSX  
C351		  STX	$00E0   
C353		  LDX	#$00E0
C356		  JMP	LoadD   

;; SP!
C359
	$83; Code
	"SP!"; Name
	$C348; Backward Link
SP!exec:
C35F $C361

C361   L_C361     LDX	$00F0   
C363		  LDX	$06,X
C365		  TXS
C366   L_C366     JMP	NEXT   

;; RP!
C369
	$83: Code
	"RP!"; Name
	$C359; Backward Link
RP!exec:
C36F $C371

C371   L_C371     LDX	D_C014   
C374		  STX	$00EE   
C376   L_C376     JMP	NEXT   

;; ;S
C379
	$82; Code
	";S"; Name
	$3BD3; Backward Link
	RP!
;Sexec:
C37E $C380

C380   L_C380     LDX	$00EE   
C382		  INX  
C383		  INX  
C384		  STX	$00EE   
C386		  LDX	$00,X
C388		  JMP	NEXT1   

;; LEAVE
C38B
	$85; Code
	"LEAVE"; Name
	$C379; Backward Link
LEAVEexec:
C393 $C395

C395   L_C395     LDX	$00EE   
C397		  LDA A   $02,X
C399		  LDA B   $03,X
C39B		  STA A   $04,X
C39D		  STA B   $05,X
C39F   L_C39F     JMP	NEXT   

;; >R
C3A2
	$82
	">R"
	LEAVE
>Rexec:; Move TOS to Return Stack
C3A7 $C3A9

C3A9   L_C3A9     LDX	$00EE   
C3AB		  DEX  
C3AC		  DEX  
C3AD		  STX	$00EE   
C3AF		  PUL A
C3B0		  PUL B
C3B1		  STA A   $02,X
C3B3		  STA B   $03,X
C3B5   L_C3B5     JMP	NEXT   

;; R>
C3B8
	$82; Code
	"R>"; Name
	$C3A2; Backward Link
R>exec:;   Retrieve TOS from return stack.
C3BD $C3Bf

C3BF   L_C3BF     LDX	$00EE   
C3C1		  LDA A   $02,X
C3C3		  LDA B   $03,X
C3C5		  INX  
C3C6		  INX  
C3C7		  STX	$00EE   
C3C9		  JMP	PUSHD

;; R
C3CC
	$81; Code
	"R"; Name
	$C3B8; Backward Link
Rexec:
C3D0 $C3D2

C3D2   L_C3D2     LDX	$00EE   
C3D4		  INX  
C3D5		  INX  
C3D6		  JMP	LoadD

;; 0=
C3D9
	$82; Code
	"0="; Name
	$C3CC; Backward Link
0=exec:; Set TOS to TRUE if 0, ELSE FALSE
C3DE $C3E0

C3E0   L_C3E0     TSX; Pick up TOS addr 
C3E1		  CLR A; Clear Indicator
C3E2		  CLR B; to FALSE
C3E3   L_C3E3     LDX	$00,X; Load TOS
C3E5		  BNE	L_C3E8;    
C3E7		  INC B; Set Indicator to TRUE
C3E8   L_C3E8     TSX; Pick up TOS addr 
C3E9		  JMP	StoreD; Put indicator on TOS

;; 0<
C3EC
	$82; Code
	"0<"; Name
	$3CD9; Backward Link
0<exec:  	; Destructive Test of TOS for <0
C3F1 $C3F3

C3F3   L_C3F3     TSX  
C3F4		  LDA A   #$80
C3F6		  AND A   $00,X
C3F8		  BEQ	L_C400   
C3FA		  CLR A; Clear MSB of Result
C3FB		  LDA B   #$01; Set TRUE
C3FD		  JMP	StoreD   
C400   L_C400     CLR B; Set FALSE
C401		  JMP	StoreD   

;; +
C404
	$81; Code
	"+"; Name
	$C3EC; Backward Link
+exec:	Add NOS To TOS
C408 $C40A

C40A   L_C40A     PUL A
C40B		  PUL B
C40C		  TSX  
C40D		  ADD B   $01,X
C40F		  ADC A   $00,X
C411		  JMP	StoreD   

;; D+
C414
	$82; Code
	"D+"; Name
	$C404; Backward Link
D+exec:; Add Double Numbers on Stack
C419 $C41B

C41B   L_C41B     TSX  
C41C		  CLC  
C41D		  LDA B   #$04
C41F   L_C41F     LDA A   $03,X
C421		  ADC A   $07,X
C423		  STA A   $07,X
C425		  DEX  
C426		  DEC B
C427		  BNE	L_C41F   
C429		  INS  
C42A		  INS  
C42B		  INS  
C42C		  INS  
C42D   L_C42D     JMP	NEXT   

;; MINUS
C430
	$85; Code
	"MINUS"; Name
	$C414; Backward Link
MINUSexec:;	  Negate TOS
C438 $C43A

C43A   L_C43A     TSX  
C43B		  NEG	$01,X
C43D		  BCS	L_C443   
C43F		  NEG	$00,X
C441		  BRA	L_C445   
C443   L_C443     COM	$00,X
C445   L_C445     JMP	NEXT   

;; DMINUS
C448
	$86; Code
	"DMINUS"; Name
	$C430; Backward Link
DMINUSexec:;   Double Negate
C451 $C453

C453   L_C453     TSX  
C454		  COM	$00,X
C456		  COM	$01,X
C458		  COM	$02,X
C45A		  NEG	$03,X
C45C		  BNE	L_C468   
C45E		  INC	$02,X
C460		  BNE	L_C468   
C462		  INC	$01,X
C464		  BNE	L_C468   
C466		  INC	$00,X
C468   L_C468     JMP	NEXT   

;; OVER
C46B
	$84; Code
	"OVER"; name
	$C448; Backward Link
OVERexec:; Duplicate NOS at TOS
C472 $C474

C474   L_C474     TSX; Point to TOS 
C475		  LDA A   $02,X; Load first half of NOS
C477		  LDA B   $03,X; Load second half of NOS
C479		  JMP	PUSHD; Place on TOS  

;; DROP
C47C
	$84; Code
	"DROP"; Name
	$C46B; Backward Link
DROPexec:; Delete TOS
C483 $C485

C485   L_C485     INS; Bump SP past TOS 
C486		  INS  
C487   L_C487     JMP	NEXT   

;; SWAP
C48A
	$84; Code
	"SWAP"; Name
	$C47C; Backward Link
SWAPexec:		; Swap TOS with NOS
C491 $C493

C493   L_C493     PUL A
C494		  PUL B
C495		  TSX  
C496		  LDX	$00,X
C498		  INS  
C499		  INS  
C49A		  PSH B
C49B		  PSH A
C49C		  STX	$00E0   
C49E		  LDX	#$00E0
C4A1		  JMP	LoadD   

;; DUP
C4A4
	$83; Code
	"DUP"; Name
	$C48A; Backward Link
DUPexec:; 	Duplicate TOS
C4AA $C4AC

C4AC   L_C4AC     PUL A
C4AD		  PUL B
C4AE		  PSH B
C4AF		  PSH A
C4B0		  JMP	PUSHD   

;; +!
C4B3
	$82; Code
	"+!"; Name
	$C4A4; Backward Link
+!exec:;		Add NOS to Addr in TOS
C4B8 $C4BA

C4BA   L_C4BA     TSX  
C4BB		  LDX	$00,X; Get Addr
C4BD		  INS  
C4BE		  INS  
C4BF		  PUL A
C4C0		  PUL B
C4C1		  ADD B   $01,X
C4C3		  STA B   $01,X
C4C5		  ADC A   $00,X
C4C7		  STA A   $00,X
C4C9   L_C4C9     JMP	NEXT   

;; TOGGLE
TOGGLE:
C4CC
	$86; Code
	"TOGGLE"; Name
	$C4B3; Backward Link
TOGGLEexec:
C4D5	COLON; Complile The Following Section
	OVERexec; Duplicate NOS at TOS
	C@exec;  Push (Char) Data Contained in TOS Addr to TOS
	XORexec;  XOR NOS with TOS
	SWAPexec; Swap TOS with NOS
	C!exec;  Store NOS (Char)  to Addr in TOS
	;Sexec

;; @
C4E3
	$81; Code
	"@"; Name
	$C4CC; Backward Link
@exec:		; Push Data Contained in TOS Addr to TOS
C4E7 $C4E9

C4E9   L_C4E9     TSX  
C4EA		  LDX	$00,X
C4EC		  INS  
C4ED		  INS  
C4EE		  JMP	LoadD   

;; C@
C4F1
	$82; Code
	"C@"; Name
	$C4E3; Backward Link
C@exec: ;  Push (Char) Data Contained in TOS Addr to TOS:
C4F6 $C4F8

C4F8   L_C4F8     TSX  
C4F9		  LDX	$00,X
C4FB		  CLR A
C4FC		  LDA B   $00,X
C4FE		  INS  
C4FF		  INS  
C500		  JMP	PUSHD   

;; !
C503
	$81; Code
	"!"; Name
	$C4F1; Backward Link
!exec:			Store NOS to Addr in TOS			
C507 $C509

C509   L_C509     TSX  
C50A		  LDX	$00,X
C50C		  INS  
C50D		  INS  
C50E		  JMP	StorTOS   

;; C!
C511
	$82; Code
	"C!"; Name
	$C503; Backward Link
C!exec:;  Store NOS (Char)  to Addr in TOS
C516 $C518

C518   L_C518     TSX  
C519		  LDX	$00,X	; Load X with Addr
C51B		  INS 		; Adj SP for Addr + 1 Byte
C51C		  INS  
C51D		  INS  
C51E		  PUL B		; Pull data byte off stack
C51F		  STA B   $00,X	; Store data byte at Addr
C521   L_C521     JMP	NEXT

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

C53C  	COLON:    LDX	$00EE   
C53E		  DEX  
C53F		  DEX  
C540		  STX	$00EE   
C542		  LDA A XSafe   
C544		  LDA B XSafe+1   
C546		  STA A $02,X
C548		  STA B $03,X
C54A		  LDX	$00EA   
C54C		  JMP	NEXT1

;; ;
C54F
	$C1; Code
	";"; Name
	$C524; Backward Link
	COLON; Complile The Following Section
	?CSP
	COMPILEexec
	;Sexec
	$C9A8
	[exec
	;Sexec

;; CONSTANT
C561
	$88; Code
	"CONSTANT"; Name
	$C54F; Backward Link
CONSTANTexec:
C56C	COLON; Complile The Following Section
	CREATEexec
	SMUDGEexec
	,exec
	(;CODE)exec

C576 	GetVar:   LDX	$00EA; Points to Processing Routine Token   
C578		  LDA A $02,X; Get 1st byte after Token Addr (VarHi)
C57A		  LDA B $03,X; Get 2nd byte after Token Addr (VarLo)
C57C		  JMP	PUSHD; Put them on stack and get Next

;; VARIABLE
C57F
	$88; Code
	"VARIABLE"; Name
	$C561; Backward Link
	COLON; Complile The Following Section
	CONSTANTexec
	(;CODE)exec
C590   L_C590     LDA A   $00EA   
C592		  LDA B   $00EB   
C594		  ADD B   #$02
C596		  ADC A   #$00
C598		  JMP	  PUSHD

;; USER
C59B
	$84; Code
	"USER"; Name
	$C57F; Backward Link
	COLON; Complile The Following Section
	CONSTANTexec
	(;CODE)exec

C5A8   USER:   	  LDX	  $00EA   
C5AA		  LDA A   $02,X
C5AC		  LDA B   $03,X
C5AE		  ADD B   $00F1   
C5B0		  ADC A   $00F0   
C5B2		  JMP	  PUSHD

;;; 0 CONSTANT 0
C5B5
	$81; Code
	"0"; Name
	$C59B; Backward Link
Const0:;		Push $0000 onto TOS
C5B9	GetVar
	$0000; Constant value

;;; 1 CONSTANT 1
C5BD
	$81; Code
	"1"; Name
	$C5B5; Backward Link
Const1:;		Push $0001 onto TOS
C5C1	GetVar
	$0001; Constant value

;;; 2 CONSTANT 2
C5C5
	$81; Code
	"2"; Name
	$C5BD; Backward Link
Const2:;		Push $0002 onto TOS
C5C9	GetVar
	$0002; Constant value

;;; 3 CONSTANT 3
C5CD
	$81; Code
	"3"; Name
	$C5C5; Backward Link
Const3:;		Push $0003 onto TOS
C5D1	GetVar
	$0003; Constant value

;; BL
C5D5
	$82; Code
	"BL"; Name
	$C5CD; Backward Link
ConstBL:
C5DA	GetVar
	$0000

;; FIRST
C5DE
	$85; Code
	"FIRST"; Name
	$C5D5; Backward Link
	GetVar
	$0500

;; LIMIT
C5EA
	$85; Code
	"LIMIT"; Name
	$C5DE; Backward Link
	GetVar
	$0500

;; B/BUF
C5F6
	$85; Code
	"B/BUF"; Name
	$C5EA; Backward Link
	GetVar
	$4000

;; B/SCR
C602
	$85; Code
	"B/SCR"; Name
	$C5F6; Backward Link
ConstB/SCR:
C60A	GetVar
	$0001

;; +ORIGIN
C60E
	$87; Code
	"+ORIGIN"; Name
	$C602; Backward Link
+ORIGINexec:
C618	COLON; Complile The Following Section
	LITexec; Put value that follows on TOS
	$C000
	+exec; Add NOS To TOS
	;Sexec

;; S0
C622
	$82; Code
	"S0"; Name
	$C60E; Backward Link
S0exec:
C627 	USER
	$0006

;; R0
C62B
	$82; Code
	"R0"; Name
	$C622; Backward Link
	USER
	$0008

;; TIB
C634
	$83
	"TIB"
	$C62B; Backward Link
TIBexec:
C63A	 USER
	$000A

;; WIDTH
C63E
	$85
	"WIDTH"
	$C634; Backward Link
UsrWIDTH:
C646 	USER
	$000C

;; WARNING
C64A
	$87
	"WARNING"
	$C63E; Backward Link
WARNINGexec:
C654	USER
	$000E

;; FENCE
C658
	$85
	"FENCE"
	$C64A; Backward Link
	USER
	$0010

;; DP
C664
	$82
	"DP"
	$C658; Backward Link
	USER
	$0012

;; VOC-LINK
C66D
	$88
	"VOC-LINK"
	$C664; Backward Link
VOC-LINKexec:
C678 	USER
	$0014

;; BLK
6C7C
	$83
	"BLK"
	$C66D; Backward Link
BLKexec:
C682 	USER
	$0016

;; IN
6C86
	$82
	"IN"
	$C67C; Backward Link
INexec:
C68B USER
	$0018

;; OUT
6C8F
	$83
	"OUT"
	$C686; Backward Link
	USER
	$001A

;; OFFSET
C699
	$86
	"OFFSET"
	$C68F; Backward Link
OFFSETexec:
C6A2 	USER
	$001E

;; CONTEXT
C6A6
	$87
	"CONTEXT"
	$C699; Backward Link
CONTEXTexec:
C6B0 	USER
	$0020

;; CURRENT
C6B4
	$87
	"CURRENT"
	$C6A6; Backward Link
CURRENTexec:
C6BE 	USER
	$002A

;; STATE
C6C2
	$85
	"STATE"
	$C6B4; Backward Link
STATEexec:
C6CA	USER
	$002C

;; BASE
C6CE
	$84
	"BASE"
	$C6C2; Backward Link
BASEexec:
C6D5 	USER
	$002E

;; DPL
C6D9
	$83
	"DPL"
	$C6CE; Backward Link
DPLexec:
C6Df 	USER
	$0030

;; FLD
C6E3
	$83
	"FLD"
	$C6D9; Backward Link
	USER
	$0032

;; CSP
C6ED
	$83
	"CSP"
	$C6E3; Backward Link
CSPexec:
C6F3 	USER
	$0036

;; R#
C6F7
	$82
	"R#"
	$C6ED; Backward Link
	USER
	$0036

;; HLD
C700
	$83
	"HLD"
	$C6F7; Backward Link
VarHLD:
C706 	GetVar
	$0538

;; COLUMNS
C70A
	$87
	"COLUMNS"
	$C700; Backward Link
COLUMNSexec:
C714 	USER
	$003C

;; 1+
C718
	$82
	"1+"
	$C70A; Backward Link
1+exec:;    Add 1 TO TOS
C71D	COLON; Complile The Following Section
	Const1;  Push $0001 onto TOS
	+exec; Add NOS To TOS
	;Sexec

;; 2+
C725
	$82
	"2+"
	$C718; Backward Link
2+exec:;    Add 2 TO TOS
C72A 	COLON; Complile The Following Section
	Const2
	+exec; Add NOS To TOS
	;Sexec

;; HERE
C732
	$84
	"HERE"
	$C725; Backward Link
HEREexec:
C739 	COLON; Complile The Following Section
	$C669
	@exec; Push Data Contained in TOS Addr to TOS
	;Sexec

;; ALLOT
C741
	$85
	"ALLOT"
	$C732; Backward Link
ALLOTexec:
C749	COLON; Complile The Following Section
	$C669
	+!exec; Add NOS to Addr in TOS
	;Sexec

;; ,
C751
	$81
	","
	$C741; Backward Link
,exec:
C755	COLON; Complile The Following Section
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

C778   L_C778     TSX  
C779		  LDA A   $02,X
C77B		  LDA B   $03,X
C77D		  SUB B   $01,X
C77F		  SBC A   $00,X
C781		  INS  
C782		  INS  
C783		  TSX  
C784		  JMP	StoreD

;; =
C787
	$81
	"="
	$C772; Backward Link
=exec:
C78B $C78D

C78D   L_C78D     PUL A
C78E		  PUL B
C78F		  TSX  
C790		  SUB B   $01,X
C792		  SBC A   $00,X
C794		  STA B   $01,X
C796		  STA A   $00,X
C798		  JMP	  L_C3E0

;; <
C79B
	$81
	"<"
	$C787; Backward Link
<exec:;	 NOS<TOS?
C79F $C7A1

C7A1   L_C7A1   PUL A
C7A2		  PUL B
C7A3		  TSX  
C7A4		  CMP A   $00,X
C7A6		  INS  
C7A7		  BGT	L_C7B2   
C7A9		  BNE	L_C7AF   
C7AB		  CMP B   $01,X
C7AD		  BHI	L_C7B2   
C7AF   L_C7AF   CLR B
C7B0		  BRA	L_C7B4   
C7B2   L_C7B2   LDA B   #$01
C7B4   L_C7B4   CLR A
C7B5		  INS  
C7B6		  JMP	PUSHD

;; >
C7B9
	$81
	">"
	$C79B; Backward Link
>exec:;	 NOS > TOS?
C7BD $C7BF

C7BF   L_C7BF   TSX  
C7C0		  LDA A   $00,X
C7C2		  LDA B   $02,X
C7C4		  STA B   $00,X
C7C6		  STA A   $02,X
C7C8		  LDA A   $01,X
C7CA		  LDA B   $03,X
C7CC		  STA A   $03,X
C7CE		  STA B   $01,X
C7D0		  JMP	L_C7A1

;; U<
C7D3
	$82
	"U<"
	$C7B9
	$C7DA

C7DA   L_C7DA   PUL A
C7DB		  PUL B
C7DC		  TSX  
C7DD		  CMP A   $00,X
C7DF		  INS  
C7E0		  BHI	L_C7EB   
C7E2		  BNE	L_C7E8   
C7E4		  CMP B   $01,X
C7E6		  BHI	L_C7EB   
C7E8   L_C7E8   CLR B
C7E9		  BRA	L_C7ED   
C7EB   L_C7EB   LDA B   #$01
C7ED   L_C7ED   CLR A
C7EE		  INS  
C7EF		  JMP	PUSHD

;; U>
C7F2
	$82
	"U>"
	$C7D3; Backward Link
U>exec:
C7F7	COLON; Complile The Following Section
	SWAPexec; Swap TOS with NOS
	$C7D8
	;Sexec

;; ROT
C7FF
	$83; Code
	"ROT"; Name
	$C7F2; Backward Link
ROTexec:; Rotate top 3 on stack
C805	COLON; Complile The Following Section
	>Rexec; Move TOS to Return Stack
	SWAPexec; Swap TOS with NOS
	R>exec;   Retrieve TOS from return stack.
	SWAPexec; Swap TOS with NOS
	;Sexec

;; SPACE
C811
	$85; Code
	"SPACE"; Name
	$C7FF; Backward Link
SPACEexec:
C819	COLON; Complile The Following Section
	ConstBL
	EMITexec
	;Sexec

;; MIN
C821
	$83; Code
	"MIN"; Name
	$C811; Backward Link
MINexec:
C827	COLON; Complile The Following Section
	OVERexec; Duplicate NOS at TOS
	OVERexec; Duplicate NOS at TOS
	>exec;	 NOS > TOS?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004
		SWAPexec; Swap TOS with NOS
	ENDIF
	DROPexec; Delete TOS
	;Sexec

;; MAX
C839
	$83; Code
	"MAX"; Name
	$C821; Backward Link
MAXexec:
C83F	COLON; Complile The Following Section
	OVERexec; Duplicate NOS at TOS
	OVERexec; Duplicate NOS at TOS
	<exec;	 NOS<TOS?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004
		SWAPexec; Swap TOS with NOS
	ENDIF
	DROPexec; Delete TOS
	;Sexec

;; -DUP
C851
	$84; Code
	"-DUP"; Name
	$C839; Backward Link
-DUPexec:
C858	COLON; Complile The Following Section
	DUPexec; Duplicate TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004
		DUPexec; Duplicate TOS
	ENDIF
	;Sexec 

;; TRAVERSE
C864
	$88; Code
	"TRAVERSE"
	$C851; Backward Link
TRAVERSEexec:
C86F	COLON; Complile The Following Section
	SWAPexec; Swap TOS with NOS
	BEGIN
		OVERexec; Duplicate NOS at TOS
		+exec; Add NOS To TOS
		ChrLit; Put (Char) value that follows on TOS
		$7F
		OVERexec; Duplicate NOS at TOS
		C@exec;  Push (Char) Data Contained in TOS Addr to TOS
		<exec;	 NOS<TOS?
	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
	$FFF1
	SWAPexec; Swap TOS with NOS
	DROPexec; Delete TOS
	;Sexec


;; LATEST
C88A
	$86; Code
	"LATEST"; Name
	$C864; Backward Link
LATESTexec:
C893	COLON; Complile The Following Section
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
C8A3	COLON; Complile The Following Section
	ChrLit; Put (Char) value that follows on TOS
	$04
	-exec	; Subtract TOS From NOS
	;Sexec

;; CFA
C8AC
	$83; Code
	"CFA"; Name
	$C89D; Backward Link
CFAexec:
C8B2	COLON; Complile The Following Section
	ChrLit; Put (Char) value that follows on TOS
	$05; Literal Chr Value
	-exec	; Subtract TOS From NOS
	Const1;  Push $0001 onto TOS
	MINUSexec;	  Negate TOS
	TRAVERSEexec
	;Sexec

;; NFA
C8BA
	$83; Code
	"NFA"; Name
	$C8AC; Backward Link
NFAexec:
C8C0	COLON; Complile The Following Section
	ChrLit
	$05
	-exec; Subtract TOS From NOS
	Const1;    Push $0001 onto TOS
	MINUSexec;	  Negate TOS
	TRAVERSEexec
	;Sexec

;; PFA
C8CF
	$83; Code
	"PFA"; Name
	$C8BA; Backward Link
PFAexec:
C8D5	COLON; Complile The Following Section
	Const1;  Push $0001 onto TOS
	TRAVERSEexec
	ChrLit; Put (Char) value that follows on TOS
	$05; Literal Chr Value
	+exec; Add NOS To TOS
	;Sexec

;; !CSP
C8E2
	$84; Code
	"!CSP"; Name
	$C8CF; Backward Link
!CSPexec:
C8E9	COLON; Complile The Following Section
	SP@exec
	CSPexec
	!exec; Store NOS to Addr in TOS
	;Sexec

;; ?ERROR
C8F3
	$86; Code
	"?ERROR"; Name
	$C8E2; Backward Link
?ERRORexec:
C8FC	COLON; Complile The Following Section
	SWAPexec; Swap TOS with NOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0008
		ERRORexec
		BRANCHexec
		$0004
	ELSE
		DROPexec; Delete TOS
	ENDIF
	;Sexec

;; ?COMP
C90E
	$85; Code
	"?COMP"; Name
	$C8F3; Backward Link
?COMPexec:
C916	COLON; Complile The Following Section
	STATEexec
	@exec
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	ChrLit; Put (Char) value that follows on TOS
	$11; Literal Chr Value
	?ERRORexec
	;Sexec

;; ?EXEC
C925
	$85; Code
	"?EXEC"; Name
	$C90E
?EXECexec:
C92D	COLON; Complile The Following Section
	STATEexec
	@exec
	ChrLit; Put (Char) value that follows on TOS
	$12; Literal Chr Value
	?ERRORexec
	;Sexec

;; ?PAIRS
C93A
	$86; Code
	"?PAIRS"; Name
	$C925; Backward Link
?PAIRSexec:
C943	COLON; Complile The Following Section
	-exec	; Subtract TOS From NOS
	ChrLit; Put (Char) value that follows on TOS
	$13; Literal Chr Value
	?ERRORexec
	;Sexec

;; ?CSP
C94E
	$84; Code
	"?CSP" Name
	$C93A; Backward Link
?CSPexec:
C955	COLON; Complile The Following Section
	SP@exec
	CSPexec
	@exec
	-exec	; Subtract TOS From NOS
	ChrLit; Put (Char) value that follows on TOS
	$14; Literal Chr Value
	?ERRORexec
	;Sexec

;; COMPILE
C966
	$87; Code
	"COMPILE"; Name
	$C94E; Backward Link
COMPILEexec:
C970	COLON; Complile The Following Section
	?COMPexec
	R>exec;   Retrieve TOS from return stack.
	2+exec;    Add 2 TO TOS
	DUPexec; Duplicate TOS
	>Rexec; Move TOS to Return Stack
	@exec
	,exec
	;Sexec

;; [
C982
	$C1; Code
	"["; Name
	$C966; Backward Link
[exec:
C986	COLON; Complile The Following Section
	Const0;  Push $0000 onto TOS
	STATEexec
	!exec; Store NOS to Addr in TOS
	;Sexec

;; ]
C990
	$81; Code
	"]"; Name
	$C982; Backward Link
]exec:
C994	COLON; Complile The Following Section
	ChrLit; Put (Char) value that follows on TOS
	$C0; Literal Chr Value
	STATEexec
	!exec; Store NOS to Addr in TOS
	;Sexec

;; SMUDGE
C99F
	$86; Code
	"SMUDGE"; Name
	$C990; Backward Link
SMUDGEexec:
C9A8	COLON; Complile The Following Section
	LATESTexec
	ChrLit; Put (Char) value that follows on TOS
	$20; Literal Chr Value
	TOGGLEexec
	;Sexec

;; HEX
C9B3
	$83; Code
	"HEX"; Name
	$C99F; Backward Link
HEXexec:
C9B9	COLON; Complile The Following Section
	ChrLit; Put (Char) value that follows on TOS
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
C9CE	COLON; Complile The Following Section
	ChrLit; Put (Char) value that follows on TOS
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
C9E3	COLON; Complile The Following Section
	R>exec;   Retrieve TOS from return stack.
	2+exec;    Add 2 TO TOS
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
;CODE:
C9FB	COLON; Complile The Following Section
	?CSP
	COMPILEexec
	(;CODE)exec
	SMUDGEexec
	[exec
	?STACKexec
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
	R>exec;   Retrieve TOS from return stack.
	2+exec;    Add 2 TO TOS
	LATESTexec
	$C8D5
	!exec; Store NOS to Addr in TOS
String1exec:
CA33 (;CODE)exec
	$96EC
	REBOOTexec
CA37   L_CA37     LDX	$00EE   
CA39		  DEX  
CA3A		  DEX  
CA3B		  STX	$00EE   
CA3D		  STA A $02,X
CA3F		  STA B $03,X
CA41		  LDX	$00EA   
CA43		  INX  
CA44		  INX  
CA45		  STX	$00E0   
CA47		  LDX	$00,X
CA49		  STX	$00EC   
CA4B		  CLR A
CA4C		  LDA B   #$02
CA4E		  ADD B   $00E1   
CA50		  ADC A   $00E0   
CA52		  PSH B
CA53		  PSH A
CA54		  JMP	L_C03A

;; COUNT
CA57
	$85; Code
	"COUNT"; Name
	$CA1D; Backward Link
COUNTexec:
CA5F	COLON; Complile The Following Section
	DUPexec; Duplicate TOS
	1+exec;    Add 1 TO TOS
	SWAPexec; Swap TOS with NOS
	C@exec;  Push (Char) Data Contained in TOS Addr to TOS
	;Sexec

;; TYPE
CA6B
	$84; Code
	"TYPE"; Name
	$CA57; Backward Link
TYPEexec:
CA72	COLON; Complile The Following Section
	$C858
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0018
		OVERexec; Duplicate NOS at TOS
		+exec; Add NOS To TOS for Loop Limit
		SWAPexec; Swap TOS with NOS for Loop Index
		(DO)exec; Beginning of DO Loop
			)exec
			C@exec;  Push (Char) Data Contained in TOS Addr to TOS
			EMITexec
		(LOOP)exec
		$FFF8
		BRANCHexec
		$0004
	ELSE
		DROPexec; Delete TOS
	ENDIF
	;Sexec

;;; TRAILING
CA94
	$89; Code
	"-TRAILING"; Name
	$CA6B; Backward Link
-TRAILINGexec:
CAA0	COLON; Complile The Following Section
	DUPexec; Duplicate TOS; Duplicate TOS for Loop Limit
	Const0;  Push $0000 onto TOS for Loop Index
	(DO)exec; Beginning of DO Loop
		OVERexec; Duplicate NOS at TOS
		OVERexec; Duplicate NOS at TOS
		+exec; Add NOS To TOS
		Const1;  Push $0001 onto TOS
		-exec	; Subtract TOS From NOS
		C@exec;  Push (Char) Data Contained in TOS Addr to TOS
		ConstBL
		-exec	; Subtract TOS From NOS
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$0008; Branch Offset
			LEAVEexec
			BRANCHexec
			$0006
		ELSE
			Const1;  Push $0001 onto TOS
			-exec	; Subtract TOS From NOS
		ENDIF
	(LOOP)exec
	$FFE0
	;Sexec

;;; (.")
CACC
	$84; Code
	"(.")"; Name
	$CA94; Backward Link
."exec:;  Print Literal String
CAD3	COLON; Complile The Following Section
 	Rexec
	2+exec;    Add 2 TO TOS
	COUNTexec
	DUPexec; Duplicate TOS; Duplicate TOS
	1+exec;    Add 1 TO TOS
	R>exec;   Retrieve TOS from return stack.
	+exec; Add NOS To TOS
	>Rexec; Move TOS to Return Stack
	TYPEexec
??????????

;; ?STACK
CB17
	$86; Code
	"?STACK"; Name
	$CAE9; Backward Link
?STACKexec:
CB20	COLON
	ChrLit; Put (Char) value that follows on TOS
	$12
	+ORIGINexec
	@exec; Push Data Contained in TOS Addr to TOS
	Const2;  Push $0002 onto TOS
	1-exec; Subtract 1 from TOS (DEC TOS)
	SP@exec
	<exec;	 NOS<TOS?
	Const1;  Push $0001 onto TOS
	?ERRORexec
	SP@exec
	LITexec; Put value that follows on TOS
	$0300
	ChrLit; Put (Char) value that follows on TOS
	$20
	+exec; Add NOS To TOS
	<exec;	 NOS<TOS?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0006
		Const2;  Push $0002 onto TOS
		?ERRORexec
	ENDIF
	;Sexec

;; EXPECT
CB4C
	$86; Code
	"EXPECT"; Name
	$CB17; Backward Link
EXPECTexec:
CB55	COLON
	OVERexec; Duplicate NOS at TOS
	+exec; Add NOS To TOS
	OVERexec; Duplicate NOS at TOS
	(DO)exec; Beginning of DO Loop
		KEYexec
		DUPexec; Duplicate TOS
		ChrLit; Put (Char) value that follows on TOS
		$0E
		+ORIGINexec
		@exec; Push Data Contained in TOS Addr to TOS
		=exec
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$0029
			DROPexec; Delete TOS
			ChrLit; Put (Char) value that follows on TOS
			$08
			EMITexec
			ChrLit; Put (Char) value that follows on TOS
			$20
			EMITexec
			ChrLit; Put (Char) value that follows on TOS
			$08
			OVERexec; Duplicate NOS at TOS
			)exec
			=exec
			DUPexec; Duplicate TOS
			R>exec;   Retrieve TOS from return stack.
			Const2;  Push $0002 onto TOS
			1-exec; Subtract 1 from TOS (DEC TOS)
			+exec; Add NOS To TOS
			>Rexec; Move TOS to Return Stack
			1-exec; Subtract 1 from TOS (DEC TOS)
			BRANCHexec
			$0027
	   ELSE
			DUPexec; Duplicate TOS
			ChrLit; Put (Char) value that follows on TOS
			$0D
			=exec
			OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
			$000E
				LEAVEexec
				DROPexec; Delete TOS
				ConstBL
				Const0;  Push $0000 onto TOS
				BRANCHexec
				$0004
	   	ENDIF
			DUPexec; Duplicate TOS
			)exec
			C!exec;  Store NOS (Char)  to Addr in TOS
			Const0;  Push $0000 onto TOS
			)exec
			1+exec;    Add 1 TO TOS
			!exec; Store NOS to Addr in TOS
	   ENDIF
		EMITexec
	(LOOP)exec
	$FF9F
	DROPexec; Delete TOS
	;Sexec

;; QUERY
CBC6
	$85; Code
	"QUERY"; Name
	$CB4C; Backward Link
QUERYexec:
CBCE	COLON
	TIBexec
	@exec; Push Data Contained in TOS Addr to TOS
	COLUMNSexec
	@exec; Push Data Contained in TOS Addr to TOS
	EXPECTexec
	Const0;  Push $0000 onto TOS
	INexec
	!exec; Store NOS to Addr in TOS
	;Sexec
??????? New one here?
	FindX
	QUERY
	COLON
	BLKexec
	@exec; Push Data Contained in TOS Addr to TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0026
		Const1;  Push $0001 onto TOS
		BLKexec
		+!exec; Add NOS to Addr in TOS
		Const0;  Push $0000 onto TOS
		INexec
		!exec; Store NOS to Addr in TOS
		BLKexec
		@exec; Push Data Contained in TOS Addr to TOS
		ConstB/SCR
		MODexec
		0=exec; Set TOS to TRUE if 0, ELSE FALSE
		OBRANCHexec
		$0008
			$C92D
			R>exec;   Retrieve TOS from return stack.
			DROPexec; Delete TOS
		ENDIF
		BRANCHexec
		$0006
	ELSE
		R>exec;   Retrieve TOS from return stack.
		DROPexec; Delete TOS
	ENDIF
	;Sexec

;; FILL
CC1A
	$84; Code
	"FILL"; Name
	$CBE2; Backward Link
FILLexec:
CC21	COLON; Complile The Following Section
	SWAPexec; Swap TOS with NOS
	>Rexec; Move TOS to Return Stack
	OVERexec; Duplicate NOS at TOS
	C!exec;  Store NOS (Char)  to Addr in TOS
	DUPexec; Duplicate TOS
	1+exec;    Add 1 TO TOS
	R>exec;   Retrieve TOS from return stack.
	Const1;  Push $0001 onto TOS
	-exec	; Subtract TOS From NOS
	CMOVEexec
	;Sexec

;; ERASE
CC39
	$85; Code
	"ERASE"; Name
	$CC1A; Backward Link
ERASEexec:
CC41	COLON; Complile The Following Section
	Const0;  Push $0000 onto TOS
	FILLexec
	;Sexec

;; BLANKS
CC49
	$86; Code
	"BLANKS"; Name
	$CC39; Backward Link
BLANKSexec:
CC52	COLON; Complile The Following Section
	ConstBL
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
	VarHLD
	+!exec; Add NOS to Addr in TOS
	VarHLD
	@exec; Push Data Contained in TOS Addr to TOS
	C!exec;  Store NOS (Char)  to Addr in TOS
	;Sexec

;; PAD
CC73
	$83; Code
	"PAD"; Name
	$CC5A
PADexec:
CC79	COLON; Complile The Following Section
	HEREexec
	ChrLit; Put (Char) value that follows on TOS
	$44; Literal Chr Value
	+exec; Add NOS To TOS
	;Sexec

;; WORD
CC84
	$84; Code
	"WORD"; Name
	$CC73; Backward Link
WORDexec:
CC8B	COLON; Complile The Following Section
	BLKexec
	@exec; Push Data Contained in TOS Addr to TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0011
		."exec;  Print Literal String
		$05;	Number of Chars in print String (Error here... should be $0A)
		"WORD ERROR"
		QUITexec
	ENDIF
	TIBexec
	@exec; Push Data Contained in TOS Addr to TOS
	INexec
	@exec; Push Data Contained in TOS Addr to TOS
	+exec; Add NOS To TOS
	SWAPexec; Swap TOS with NOS
	TIBexec
	HEREexec
	ChrLit; Put (Char) value that follows on TOS
	$22; Literal Chr Value
	BLANKSexec
	INexec
	+!exec; Add NOS to Addr in TOS
	OVERexec; Duplicate NOS at TOS
	-exec	; Subtract TOS From NOS
	>Rexec; Move TOS to Return Stack
	Rexec
	HEREexec
	C!exec;  Store NOS (Char)  to Addr in TOS
	+exec; Add NOS To TOS
	HEREexec
	1+exec;    Add 1 TO TOS
	R>exec;   Retrieve TOS from return stack.
	CMOVEexec
	;Sexec

;; (NUMBER)
CCD5
	$88; Code
	"(NUMBER); Name
	$CC84; Backward Link
(NUMBER)exec:
CCE0	COLON; Complile The Following Section
	1+exec;    Add 1 TO TOS
	DUPexec; Duplicate TOS
	>Rexec; Move TOS to Return Stack
	C@exec;  Push (Char) Data Contained in TOS Addr to TOS
	BASEexec
	@exec; Push Data Contained in TOS Addr to TOS
	$C141
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$002C
		SWAPexec; Swap TOS with NOS
		BASEexec
		@exec; Push Data Contained in TOS Addr to TOS
		U)exec
		DROPexec; Delete TOS
		ROTexec;    Rotate top 3 on stack
		BASEexec
		@exec; Push Data Contained in TOS Addr to TOS
		U)exec
		D+exec; Add Double Numbers on Stack
		DPLexec
		@exec; Push Data Contained in TOS Addr to TOS
		1+exec;    Add 1 TO TOS
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$0008
			Const1;  Push $0001 onto TOS
			DPLexec
			+!exec; Add NOS to Addr in TOS
	   ENDIF
		R>exec;   Retrieve TOS from return stack.
		BRANCHexec
		$FFC6
	ENDIF
	R>exec;   Retrieve TOS from return stack.
	;Sexec

;; NUMBER
CD22
	$86; Code
	"NUMBER"; Name
	$CCD5; Backward Link
NUMBERexec:
CD2B	COLON; Complile The Following Section
	Const0;  Push $0000 onto TOS
	Const0;  Push $0000 onto TOS
	ROTexec;    Rotate top 3 on stack
	DUPexec; Duplicate TOS
	1+exec;    Add 1 TO TOS
	C@exec;  Push (Char) Data Contained in TOS Addr to TOS
	ChrLit; Put (Char) value that follows on TOS
	$2D; Literal Chr Value
	=exec
	DUPexec; Duplicate TOS
	>Rexec; Move TOS to Return Stack
	+exec; Add NOS To TOS
	LITexec; Put value that follows on TOS
	$FFFF; Literal Value
	DPLexec
	!exec; Store NOS to Addr in TOS
	(NUMBER)exec
	DUPexec; Duplicate TOS
	C@exec;  Push (Char) Data Contained in TOS Addr to TOS
	ConstBL
	-exec	; Subtract TOS From NOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0015
		DUPexec; Duplicate TOS
		C@exec;  Push (Char) Data Contained in TOS Addr to TOS
		ChrLit; Put (Char) value that follows on TOS
		$2E; Literal Chr Value
		-exec	; Subtract TOS From NOS
		Const0;  Push $0000 onto TOS
		?ERRORexec
		Const0;  Push $0000 onto TOS
		BRANCHexec
		$FFDD
	ENDIF
	DROPexec; Delete TOS
	R>exec;   Retrieve TOS from return stack.
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004
		DMINUSexec;   Double Negate
	ENDIF
	;Sexec

;; -FIND
CD79
	$85; Code
	"-FIND"; Name
	$CD22; Backward Link
-FINDexec:
CD81	COLON; Complile The Following Section
	ConstBL
	WORDexec
	HEREexec
	CONTEXTexec
	@exec; Push Data Contained in TOS Addr to TOS
	@exec; Push Data Contained in TOS Addr to TOS
	(FIND)exec
	DUPexec; Duplicate TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$000A
		DROPexec; Delete TOS
		HEREexec
		LATESTexec
		(FIND)exec
	ENDIF
	;Sexec

;; (ABORT)
CDA3
	$87; Code
	"(ABORT); Name
	$CD79
(ABORT)exec:
CDAD	COLON; Complile The Following Section
	ABORTexec
	;Sexec

;; ERROR
CDB3
	$85; Code
	"ERROR"; Name
	$CDA3; Backward Link
ERRORexec:
CDBB	COLON; Complile The Following Section
	WARNINGexec
	@exec; Push Data Contained in TOS Addr to TOS
	0<exec ;	    TOS  <0?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004
		(ABORT)exec
	ENDIF
	HEREexec
	COUNTexec
	TYPEexec
	."exec;  Print Literal String
	$04;	Msg Bytes
	"<BELL> ? "
	MESSAGEexec
	SP!exec
	QUITexec
	;Sexec

;; ID.
CDDE
	$83; Name
	"ID."; Name
	$CDB3; Backward Link
ID.exec:
CDE4	COLON; Complile The Following Section
	PADexec
	ChrLit; Put (Char) value that follows on TOS
	$20; Literal Chr Value
	ChrLit; Put (Char) value that follows on TOS
	$5F; Literal Chr Value
	FILLexec
	DUPexec; Duplicate TOS
	$C8D5
	LFAexec
	OVERexec; Duplicate NOS at TOS
	-exec	; Subtract TOS From NOS
	PADexec
	SWAPexec; Swap TOS with NOS
	CMOVEexec
	PADexec
	COUNTexec
	ChrLit; Put (Char) value that follows on TOS
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
CE18	COLON; Complile The Following Section
	-FINDexec
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0015
		DROPexec; Delete TOS
		LITexec; Put value that follows on TOS
		$0007; Literal Value
		EMITexec
		NFAexec
		ID.exec
		ChrLit; Put (Char) value that follows on TOS
		$04; Literal Chr Value
		MESSAGEexec
		SPACEexec
	ENDIF
	HEREexec
	DUPexec; Duplicate TOS
	C@exec;  Push (Char) Data Contained in TOS Addr to TOS
	UsrWIDTH
	@exec; Push Data Contained in TOS Addr to TOS
	MINexec
	1+exec;    Add 1 TO TOS
	ALLOTexec
	DUPexec; Duplicate TOS
	ChrLit; Put (Char) value that follows on TOS
	$A0; Literal Chr Value
	TOGGLEexec
	HEREexec
	Const1;  Push $0001 onto TOS
	-exec	; Subtract TOS From NOS
	ChrLit; Put (Char) value that follows on TOS
	$80; Literal Chr Value
	TOGGLEexec
	LATESTexec
	,exec
	CURRENTexec
	@exec; Push Data Contained in TOS Addr to TOS
	!exec; Store NOS to Addr in TOS
	HEREexec
	2+exec;    Add 2 TO TOS
	,exec
	;Sexec

;; [COMPILE]
CE67
	$C9; Code
	"[COMPILE]"; Name
	$CE0F; Backward Link
[COMPILE]exec:
CE72	COLON; Complile The Following Section
	-FINDexec
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	Const0;  Push $0000 onto TOS
	?ERRORexec
	DROPexec; Delete TOS
	CFAexec
	,exec
	;Sexec

;; LITERAL
CE85
	$C7; Code
	"LITERAL"; Name
	$CE67; Backward Link
LITERALexec:
CE8F	COLON; Complile The Following Section
	STATEexec
	@exec; Push Data Contained in TOS Addr to TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0008
		COMPILEexec
		LITexec; Put value that follows on TOS
		,exec; Literal Value
	ENDIF
	;Sexec

;; DLITERAL
CEA1
	$C9; Code
	"DLITERAL"; Name
	$CE85; Backward Link
DLITERALexec:
CEAC	COLON; Complile The Following Section
	STATEexec
	@exec; Push Data Contained in TOS Addr to TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0008
		SWAPexec; Swap TOS with NOS
		LITERALexec
		LITERALexec
	ENDIF
	;Sexec

;; INTERPRET
CEBE
	$89; Code
	"INTERPRET"; Name
	$CEA1; Backward Link
INTERPRETexec:
CECA	COLON; Complile The Following Section
	-FINDexec
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$001C
		STATEexec
		@exec; Push Data Contained in TOS Addr to TOS
		<exec;	 NOS<TOS?
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$000A
			CFAexec
			,exec
			BRANCHexec
			$0006
	   ELSE
			CFAexec
			EXECUTEexec
	   ENDIF
		BRANCHexec
		$001A
	ELSE
		HEREexec
		NUMBERexec
		DPLexec
		@exec; Push Data Contained in TOS Addr to TOS
		1+exec;    Add 1 TO TOS
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$0008
			DLITERALexec
			BRANCHexec
			$0006
		ENDIF
	ENDIF
	DROPexec; Delete TOS
	LITERALexec
	?STACKexec
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
	ChrLit; Put (Char) value that follows on TOS
	$40; Literal Chr Value
	TOGGLEexec
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
	2+exec;    Add 2 TO TOS
	CONTEXTexec
	!exec; Store NOS to Addr in TOS
	;Sexec

;; DEFINITIONS
CF58
	$8B; Code
	"DEFINITIONS"; Name
	$CF23; Backward Link
DEFINITIONSexec:
CF66	COLON; Complile The Following Section
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
	ChrLit; Put (Char) value that follows on TOS
	$29; Literal Chr Value
	WORDexec
	;Sexec

;; QUIT
CF7F
	$84; Code
	"QUIT"; Name
	$CF72
QUITexec:
CF86	COLON; Complile The Following Section
	Const0;  Push $0000 onto TOS
	BLKexec
	!exec; Store NOS to Addr in TOS
	[exec
	RP!exec
	CRexec; Send Carriage Return
	QUERYexec
	INTERPRETexec
	STATEexec
	@exec; Push Data Contained in TOS Addr to TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0008
		."exec;  Print Literal String
		$03;	Msg Bytes
		" OK"
	BRANCHexec
	$FFE6

;; ABORT1
CFAC
	$86; Code
	"ABORT1"; Name
	$CF7F; Backward Link
ABORT1exec:
CFB5	COLON; Complile The Following Section
	SP!exec
	DECIMALexec
	?STACKexec
	Const0;  Push $0000 onto TOS
	OFFSETexec
	!exec; Store NOS to Addr in TOS
	CRexec; Send Carriage Return
	."exec;  Print Literal String
	$22;	Msg Bytes
	"Oxbridge FORTH79/6800	  3/8/90"
	CRexec; Send Carriage Return
	."exec;  Print Literal String
	$1E;	Msg Bytes
	"(C) 1989,1990 by Oxbridge Inc."
	$0562
	DEFINITIONSexec
	;Sexec

;; ABORT
D013
	$85; Code
	"ABORT"; Name
	$CFAC; Backward Link
ABORTexec:
D01B	COLON; Complile The Following Section
	ABORT1exec
	QUITexec
	;Sexec

;; VBOOT
D023
	$85; Code
	"VBOOT"; Name
 	$D013; Backward Link
ConstVBOOT:
D02B	GetVar
	$0556

;; BOOT
D02F
	$84; Code
	"BOOT"; Name
	$D023; Backward Link
BOOTexec:
D036	COLON; Complile The Following Section
	ABORT1exec
	ConstVBOOT
	@exec; Push Data Contained in TOS Addr to TOS
	EXECUTEexec
	QUITexec
	;Sexec

;; COLD
D044
	$84; Code
	"COLD"; Name
	"D02F; Backward Link
COLDexec:
D04B 	$D04D
D04D   Init1:     LDX	#Init2
D050		  STX	$0000   
D052   BlkMov1:   LDS	#$05BD
D055		  LDX	#$D12A
D058   MovLop1:   DEX  
D059		  LDA A   $00,X
D05B		  PSH A
D05C		  CPX	#$D0BE
D05F		  BNE	MovLop1   
D061		  LDS	#$050F
D064		  LDX	D_C022   
D067		  STX	$053C   
D06A		  LDX	D_C024   
D06D		  STX	$053A   
D070		  LDX	D_C020   
D073		  STX	$0514   
D076		  LDX	D_C01E   
D079		  STX	$0512   
D07C		  LDX	D_C01C   
D07F		  STX	$0510   
D082		  LDX	$0000   
D084		  JMP	$00,X
D086   Init2:     LDS	#$050F
D089		  LDX	#$C01C
D08C   MovLop2:   DEX  
D08D		  LDA A   $00,X
D08F		  PSH A
D090		  CPX	#$C012
D093		  BNE	MovLop2   
D095		  LDX	#$D01B
D098		  STX	XSafe   
D09A		  BRA	L_D0B0   
D09C   L_D09C     LDS	#$050F
D09F		  LDX	#$C01C
D0A2   MovLop3:   DEX  
D0A3		  LDA A   $00,X
D0A5		  PSH A
D0A6		  CPX	#$C012
D0A9		  BNE	MovLop3   
D0AB		  LDX	#$D036
D0AE		  STX	XSafe   
D0B0   L_D0B0     LDS	D_C012   
D0B3		  LDX	D_C010   
D0B6		  STX	$00F0   
D0B8		  JSR	Init3   
D0BB		  JMP	L_C371

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
D13B	COLON; Complile The Following Section
	DUPexec; Duplicate TOS
	0<exec ;	    TOS  <0?
	MINUSexec;	  Negate TOS
	;Sexec

;; *
D145
	$81; Code
	"*"; Name
	$D134; Backward Link
*exec:;  Multiply TOS by TOS
D149 $D14B

D14B   L_D14B     JSR	IntMult   
D14E		  INS  
D14F		  INS  
D150   L_D150     JMP	NEXT

;; /MOD
D153
	$84; Code
	"/MOD"; Name
	$D145; Backward Link
/MODexec:
D15A	COLON; Complile The Following Section
	DUPexec; Duplicate TOS
	0<exec ;	    TOS  <0?
	>Rexec; Move TOS to Return Stack
	ABSexec;	   Absolute Value of TOS
	SWAPexec; Swap TOS with NOS
	DUPexec; Duplicate TOS
	0<exec ;	    TOS  <0?
	>Rexec; Move TOS to Return Stack
	ABSexec;	   Absolute Value of TOS
	S->Dexec
	ROTexec;    Rotate top 3 on stack
	U/exec;   Unsigned Divide?
	SWAPexec; Swap TOS with NOS
	)exec
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004
		MINUSexec;	  Negate TOS
	ENDIF
	SWAPexec; Swap TOS with NOS
	R>exec;   Retrieve TOS from return stack.
	R>exec;   Retrieve TOS from return stack.
	XORexec;  XOR NOS with TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004
		MINUSexec;	  Negate TOS
	ENDIF
	;Sexec

;; /
D18E
	$81; Code
	"/"; Name
	$D153; Backward Link
/exec:;   Divide TOS by NOS
D192	COLON; Complile The Following Section
	/MODexec
	SWAPexec; Swap TOS with NOS
	DROPexec; Delete TOS
	;Sexec

;; MOD
D19C
	$83; Code
	"MOD"; Name
	$D18E; Backward Link
MODexec:
D1A2	COLON; Complile The Following Section
	/MODexec
	DROPexec; Delete TOS
	;Sexec

;; */MOD
D1AA
	$85; Code
	"*/MOD"; Name
	$D19C; Backward Link
*/MODexec:;  Multiply and then divide (n1*n2/n3)
D1B2	COLON; Complile The Following Section
	>Rexec; Move TOS to Return Stack
	U)exec
	R>exec;   Retrieve TOS from return stack.
	U/exec;   Unsigned Divede?
	;Sexec

;; */
D1BE
	$82; Code
	"*/"; Name
	$D1AA; Backward Link
*/exec:
D1C3	COLON; Complile The Following Section
	*/MODexec;  Multiply and then divide (n1*n2/n3)
	SWAPexec; Swap TOS with NOS
	DROPexec; Delete TOS
	;Sexec

;; M/MOD
D1CD
	$85; Code
	"M/MOD"; Name
	$D1BE; Backward Link
M/MODexec:
D1D5	COLON; Complile The Following Section
	>Rexec; Move TOS to Return Stack
	Const0;  Push $0000 onto TOS
	Rexec
	U/exec
	R>exec;   Retrieve TOS from return stack.
	SWAPexec; Swap TOS with NOS
	>Rexec; Move TOS to Return Stack
	U/exec
	R>exec;   Retrieve TOS from return stack.
	;Sexec

;; ABS
D1EB
	$83; Code
	"ABS"; Name
	$D1CD; Backward Link
ABSexec:;	   Absolute Value of TOS
D1F1	COLON; Complile The Following Section
	DUPexec; Duplicate TOS
	0<exec ;	    TOS  <0?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004
		MINUSexec;	  Negate TOS
	ENDIF
	;Sexec

;; DABS 
D1FF
	$84; Code
	"DABS"; Name
	$D1EB; Backward Link
DABSexec:;   Double Absolute Value
D206	COLON; Complile The Following Section
	DUPexec; Duplicate TOS
	0<exec ;	    TOS  <0?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004
		DMINUSexec;   Double Negate
	ENDIF
	;Sexec

D214
	DB $0B
	"NOT defined"
;;;;;;;;;;;

D39F   L_D39F     LDA A #$20
D3A1		  JSR	S_D3E3   
D3A4		  LDX	#$D214
D3A7		  PUL A
D3A8		  PUL B
D3A9		  BIT B #$F0
D3AB		  BEQ	L_D3B1   
D3AD		  AND B #$0F
D3AF		  ADD B #$0A
D3B1   L_D3B1     CMP B #$14
D3B3		  BMI	L_D3B7   
D3B5		  LDA B #$13
D3B7   L_D3B7     TST B
D3B8		  BEQ	L_D3C5   
D3BA		  DEC B
D3BB		  LDA A $00,X
D3BD		  ADD A #$01
D3BF   L_D3BF     INX  
D3C0		  DEC A
D3C1		  BNE	L_D3BF   
D3C3		  BRA	L_D3B7   
D3C5   L_D3C5     LDA B $00,X
D3C7   L_D3C7     INX  
D3C8		  LDA A $00,X
D3CA		  JSR	S_D3E3   
D3CD		  DEC B
D3CE		  BNE	L_D3C7
D3D0   L_D3D0     JMP	NEXT

;; MESSAGE
D3D3
	$87; Code
	"MESSAGE"; Name
	$D1FF; Backward Link
MESSAGEexec:
D3DD	COLON; Complile The Following Section
	$D39D
	;Sexec  

D3D3		  FCB	$87,  $4D,  $45,  $53,  $53,  $41,  $47,  $C5
D3DB		  FCB	$D1,  $FF,  $C5,  $3C,  $D3,  $9D,  $C3,  $7E

D3E3   S_D3E3   STA B   $00E0   
D3E5		  STX	$00E1   
D3E7   L_D3E7   LDA B   $0200   
D3EA		  BEQ	L_D3E7   
D3EC		  STA A   $0201   
D3EF		  CLR	$0200   
D3F2		  LDX	$00F0   
D3F4		  STA B   $3E,X
D3F6		  NOP  
D3F7		  LDA B   $00E0   
D3F9		  LDX	$00E1   
D3FB		  RTS
  
D3FC   S_D3FC     STA B $00E0   
D3FE		  STX	$00E1   
D400   L_D400     LDA B $0202   
D403		  BEQ	L_D400   
D405		  LDA A $0203   
D408		  CLR	$0202   
D40B		  AND A #$7F
D40D		  LDX	$00F0   
D40F		  STA B $3F,X
D411		  LDA B $00E0   
D413		  LDX	$00E1   
D415		  RTS  
D416   S_D416     LDA A $0202   
D419		  AND A #$11
D41B		  BEQ	L_D422   
D41D		  LDA A $0203   
D420		  LDA A #$01
D422   L_D422     RTS  
D423   S_D423     LDA A #$0D
D425		  BSR	S_D3E3   
D427		  LDA A #$0A
D429		  BSR	S_D3E3   
D42B		  LDA A #$7F
D42D		  LDX	$00F0   
D42F		  LDA B $3B,X
D431   L_D431     DEC B
D432		  BMI	L_D422   
D434		  PSH B
D435		  BSR	S_D3E3   
D437		  PUL B
D438		  BRA	L_D431

;; '
D43A
	$C1; Code
	"'"; Name
	$D3D3; Backward Link
'exec:
D43E	COLON; Complile The Following Section
	-FINDexec
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	Const0;  Push $0000 onto TOS
	?ERRORexec
	DROPexec; Delete TOS
	LITERALexec
	;Sexec

;; FORGET
D44E
	$86; Code
	"FORGET" Name
	$D43A; Backward Link
FORGETexec:
D457	COLON; Complile The Following Section
	CURRENTexec
	@exec
	CONTEXTexec
	@exec
	-exec	; Subtract TOS From NOS
	ChrLit; Put (Char) value that follows on TOS
	$18; Literal Chr Value
	?ERRORexec
	$D43E
	DUPexec; Duplicate TOS
	$C660
	@exec
	$C7D8
	ChrLit; Put (Char) value that follows on TOS
	$15; Literal Chr Value
	?ERRORexec
	DUPexec; Duplicate TOS
	Const0;  Push $0000 onto TOS
	+ORIGINexec
	U>exec
	ChrLit; Put (Char) value that follows on TOS
	$15; Literal Chr Value
	?ERRORexec
	DUPexec; Duplicate TOS
	NFAexec
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
BACKexec:
D49F	COLON; Complile The Following Section
	HEREexec
	-exec	; Subtract TOS From NOS
	,exec
	;Sexec

;; BEGIN
D4A9
	$C5; Code
	"BEGIN"; Name
BEGINexec:
D4B1	$D498; Backward Link
	COLON; Complile The Following Section
	?COMPexec
	HEREexec
	Const1;  Push $0001 onto TOS
	;Sexec

;; ENDIF
D4BB
	$C5; Code
	"ENDIF"; Name
	$D4A9; Backward Link
ENDIFexec:
D4C3	COLON; Complile The Following Section
	?COMPexec
	Const2;  Push $0002 onto TOS
	?PAIRSexec
	HEREexec
	OVERexec; Duplicate NOS at TOS
	-exec	; Subtract TOS From NOS
	SWAPexec; Swap TOS with NOS
	!exec
	;Sexec

;; THEN
D4D7
	$C4; Code
	"THEN"; Name
	$D4BB; Backward Link
D4DE	COLON; Complile The Following Section
	ENDIFexec
	;Sexec

;; DO
D4E4
	$C2; Code
	"DO"; Name
	$D4D7; Backward Link
DOexec:
D4E9	COLON; Complile The Following Section
	COMPILEexec
	(DO)exec; Beginning of DO Loop
	HEREexec
	Const3;  Push $0003 onto TOS
	;Sexec

;; LOOP
D4F5
	$C4; Code
	"LOOP"; Name
	$D4E4; Backward Link
LOOPexec:
D4FC	COLON; Complile The Following Section
	Const3;  Push $0003 onto TOS
	?PAIRSexec
	COMPILEexec
	(LOOP)exec
	BACKexec
	;Sexec

;; +LOOP
D50A
	$C5; Code
	"+Loop"; Name
	$D4F5; Backward Link
	COLON; Complile The Following Section
	Const3;  Push $0003 onto TOS
	?PAIRSexec
	COMPILEexec
	(+LOOP)exec
	BACKexec
	;Sexec

;; UNTIL
D520
	$C5; Code
	"UNTIL"; Name
	$D50A; Backward Link
UNTILexec:
D528	COLON; Complile The Following Section
	Const1;  Push $0001 onto TOS
	?PAIRSexec
	COMPILEexec
	OBRANCHexec; ???
	BACKexec
	;Sexec

;; END
D536
	$C3; Code
	"END"; Name
	$D520; Backward Link
	COLON; Complile The Following Section
	UNTILexec
	;Sexec

;; AGAIN
D542
	$C5; Code
	"AGAIN"; Name
	$D536; Backward Link
AGAINexec:
D54A	COLON; Complile The Following Section
	Const1;  Push $0001 onto TOS
	?PAIRSexec
	COMPILEexec
	BRANCHexec
	BACKexec
	;Sexec

;; 
D558
	$C6; Code
	"REPEAT"; Name
	$D542; Backward Link
	COLON; Complile The Following Section
	>Rexec; Move TOS to Return Stack
	>Rexec; Move TOS to Return Stack
	AGAINexec
	R>exec;   Retrieve TOS from return stack.
	R>exec;   Retrieve TOS from return stack.
	Const2;  Push $0002 onto TOS
	-exec	; Subtract TOS From NOS
	ENDIFexec
	;Sexec

;; 
D575
	$C2; Code
	"IF"; Name
	$D558; Backward Link
IFexec:
D57A	COLON; Complile The Following Section
	COMPILEexec
	OBRANCHexec; ???
	HEREexec
	Const0;  Push $0000 onto TOS
	,exec
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
	COMPILEexec
	BRANCHexec
	HEREexec
	Const0;  Push $0000 onto TOS
	,exec
	SWAPexec; Swap TOS with NOS
	Const2;  Push $0002 onto TOS
	ENDIFexec
	Const2;  Push $0002 onto TOS
	;Sexec

;; WHILE
D5AB
	$C5; Code
	"WHILE"; Name
	$D58A; Backward Link
	COLON; Complile The Following Section
	IFexec
	2+exec
	;Sexec

;; SPACES
D5BB
	$86; Code
	"SPACES"; Name
	$D5AB; Backward Link
SPACESexec:
D5C4	COLON; Complile The Following Section
	Const0;  Push $0000 onto TOS
	MAXexec
	$C858
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$000C
		Const0;  Push $0000 onto TOS for Loop Index
		(DO)exec; Beginning of DO Loop
		SPACEexec
		(LOOP)exec
		$FFFC
	ENDIF
	;Sexec

;; <#
D5DC
	$82; Code
	"<#"; Name
	$D5BB; Backward Link
<#exec:
D5E1	COLON; Complile The Following Section
	PADexec
	VarHLD
	!exec
	;Sexec

;; #>
D5EB
	$82; Code
	"#>"; Name
	$D5DC; Backward Link
#>exec:
D5F0	COLON; Complile The Following Section
	DROPexec; Delete TOS
	DROPexec; Delete TOS
	VarHLD
	@exec
	PADexec
	OVERexec; Duplicate NOS at TOS
	-exec	; Subtract TOS From NOS
	;Sexec


;; SIGN
D602
	$84; Code
	"SIGN"; Name
	$D5EB; Backward Link
SIGNexec:
D609	COLON; Complile The Following Section
	ROTexec;    Rotate top 3 on stack
	0<exec ;	    TOS  <0?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0007
		ChrLit; Put (Char) value that follows on TOS
		$2D; Literal Chr Value
		HOLDexec
	ENDIF
	;Sexec

;; #
D61A
	$81; Code
	"#"; Name
	$D602; Backward Link
#exec:
D61E	COLON; Complile The Following Section
	BASEexec
	@exec
	M/MODexec
	ROTexec;    Rotate top 3 on stack
	ChrLit; Put (Char) value that follows on TOS
	$09; Literal Chr Value
	OVERexec; Duplicate NOS at TOS
	<exec;	 NOS<TOS?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0007
		ChrLit; Put (Char) value that follows on TOS
		$07; Literal Chr Value
		+exec; Add NOS To TOS
	ENDIF
	ChrLit; Put (Char) value that follows on TOS
	$30; Literal Chr Value
	+exec; Add NOS To TOS
	HOLDexec
	;Sexec

;; #S
D641
	$82; Code
	"#S"; Name
	$D61A; Backward Link
#Sexec:
D646	COLON; Complile The Following Section
	BEGIN
		#exec
		OVERexec; Duplicate NOS at TOS
		OVERexec; Duplicate NOS at TOS
		ORexec;  OR NOS with TOS
		0=exec; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
	$FFF4
	;Sexec

;; .R
D658
	$82; Code
	".R"; Name
	$D641; Backward Link
.Rexec:
D65D	COLON; Complile The Following Section
	>Rexec; Move TOS to Return Stack
	S->Dexec
	R>exec;   Retrieve TOS from return stack.
	D.Rexec
	;Sexec

;; D.R
D669
	$83; Code
	"D.R"; Name
	$D658; Backward Link
D.Rexec:
D66F	COLON; Complile The Following Section
	>Rexec; Move TOS to Return Stack
	SWAPexec; Swap TOS with NOS
	OVERexec; Duplicate NOS at TOS
	DABSexec;   Double Absolute Value
	<#exec
	#Sexec
	SIGNexec
	#>exec
	R>exec;   Retrieve TOS from return stack.
	OVERexec; Duplicate NOS at TOS
	-exec	; Subtract TOS From NOS
	SPACESexec
	TYPEexec
	;Sexec

;; D.
D68D
	$82; Code
	"D."; Name
	$D669; Backward Link
D.exec:
D692	COLON; Complile The Following Section
	Const0;  Push $0000 onto TOS
	D.Rexec
	SPACEexec
	;Sexec

;; .
D69C
	$81; Code
	"."; Name
	$D68D; Backward Link
.exec:	Print to Screen:
D6A0	COLON; Complile The Following Section
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
	.exec;	   Print to Screen
	;Sexec   

;; EXIT
D6B4
	$84; Code
	"EXIT"; Name
	D6A8; Backward Link
EXITexec:
D6BB	COLON; Complile The Following Section
	R>exec;   Retrieve TOS from return stack.
	DROPexec; Delete TOS
	;Sexec

;; 'I
D6C3
	82; Code
	"'I"; Name
	D6B4; Backward Link
'Iexec:
D6C8   $D6CA
D6CA   L_D6CA     LDX	$00EE   
D6CC		  INX  
D6CD		  INX  
D6CE		  INX  
D6CF		  INX  
D6D0		  JMP	LoadD

;; J
D6D3
	81; Code
	"J"; Name
	D6C3; Backward link
	$D6D9
Jexec:
D6D9   L_D6D9     LDX	$00EE   
D6DB		  INX  
D6DC		  INX  
D6DD		  INX  
D6DE		  INX  
D6DF		  INX  
D6E0		  INX  
D6E1		  JMP	LoadD

;; REBOOT
D6E4
	$86; Code
	"REBOOT"; Name
	$D6D3; Backward Link
REBOOTexec:
D6ED $D6EF
D6EF   L_D6EF     JMP	L_DD8D

;; 1-
D6F2
	$82; Code
	"1-" Name
	$D6E4; Backward Link
1-exec:		; Subtract 1 from TOS (DEC TOS)
D6F7 $D6F9
D6F9   L_D6F9     PUL A
D6FA		  PUL B
D6FB		  SUB B   #$01
D6FD		  SBC A   #$00
D6FF		  PSH B
D700		  PSH A
D701   L_D701     JMP	NEXT

;; 2*
D704
	$82; Code
	"2*"; Name
	$D6F2 Backward Link
2*exec:		; Multiply TOS by 2
D709 $D70B
D70B   L_D70B     PUL A
D70C		  PUL B
D70D		  ASL B
D70E		  ROL A
D70F		  JMP	PUSHD

;; 2/
D712
	$82; Code
	"2/"; Name
	$D704; Backward Link
2/exec:;  Divide TOS by 2
D717 $D719
D719   L_D719     PUL A
D71A		  PUL B
D71B		  ASR A
D71C		  ROR B
D71D		  JMP	PUSHD

;; 2-
D720
	$82; Code
	"2-"; Name
	$D712; Backward Link
2-exec:
D725 $D727
D727   L_D727     PUL A
D728		  PUL B
D729		  SUB B   #$02
D72B		  SBC A   #$00
D72D		  JMP	PUSHD

;; 2@
D730
	$82; Code
	"2@"; Name
	$D720; Backward Link
2@exec:		; Push Data Contained in TOS Addr to NOS/TOS (32Bit)
D735 $D737
D737   L_D737   TSX  
D738		  LDX	 $00,X; Get addr
D73A		  INS  ; Adj stack
D73B		  INS  
D73C		  LDA A  $02,X; Get 1st Byte
D73E		  LDA B  $03,X; Get 2nd Byte
D740		  PSH B; Put in NOS
D741		  PSH A
D742		  LDA A  $00,X; Get 3rd Byte
D744		  LDA B  $01,X; Get 4th Byte
D746		  JMP	PUSHD; Put in TOS

;; 2!
D749
	$82; Code
	"2!"; Name
	$D730; Backward Link
2!exec:		; Store NOS and 2nd NOS to Addr in TOS
D74E $D750
D750   L_D750     TSX  
D751		  LDX	$00,X; Pick up store addr
D753		  INS; Point to first data 
D754		  INS  
D755		  PUL A; Get first data
D756		  PUL B
D757		  STA A   $00,X; Store first data
D759		  STA B   $01,X
D75B		  PUL A; Get second data
D75C		  PUL B
D75D		  STA A   $02,X; Store second data
D75F		  STA B   $03,X
D761   L_D761     JMP	NEXT

;; 2OVER
D764
	$85; Code
	"2OVER"; Name
	$D749; Backward Link
2OVERexec:
D76C $D76E
D76E   L_D76E     TSX  
D76F		  LDA A   $07,X
D771		  PSH A
D772		  LDA A   $06,X
D774		  PSH A
D775		  LDA B   $05,X
D777		  LDA A   $04,X
D779		  JMP	  PUSHD

;; 2SWAP
D77C
	$85; Code
	"2SWAP"; Name
	$D764
2SWAPexec:
D784 $D786
D786   L_D786	  DES  
D787		  DES  
D788		  DES  
D789		  DES  
D78A		  TSX  
D78B		  LDA A   $0A,X
D78D		  LDA B   $0B,X
D78F		  STA A   $02,X
D791		  STA B   $03,X
D793		  LDA A   $08,X
D795		  LDA B   $09,X
D797		  STA A   $00,X
D799		  STA B   $01,X
D79B		  LDA B   #$04
D79D   L_D79D     LDA A   $04,X
D79F		  STA A   $08,X
D7A1		  LDA A   $00,X
D7A3		  STA A   $04,X
D7A5		  INX  
D7A6		  DEC B
D7A7		  BNE	L_D79D   
D7A9		  INS  
D7AA		  INS  
D7AB		  INS  
D7AC		  INS  
D7AD   L_D7AD     JMP	NEXT

;; 2DROP
D7B0
	$85; Code
	"2DROP"; Name
	$D77C; Backward Link
2DROPexec:	;Remove TOS and NOS
D7B8 $D7BA
D7BA   L_D7BA     INS  
D7BB		  INS  
D7BC		  INS  
D7BD		  INS  
D7BE   L_D7BE     JMP	NEXT

;; 2DUP
D7C1
	$84; Code
	"2DUP"; Name
	$D7B0; Backward Link
2DUPexec:; Duplicate TOS/NOS
D7C8 $D7CA
D7CA   L_D7CA     DES  
D7CB		  DES  
D7CC		  DES  
D7CD		  DES  
D7CE		  TSX  
D7CF		  LDA B   #$04; Loop Counter
D7D1   L_D7D1     LDA A   $04,X; Load Src
D7D3		  STA A   $00,X; Store Dest
D7D5		  INX; Inc Data Ptr  
D7D6		  DEC B; Dec Loop Counter
D7D7		  BNE	L_D7D1; Loop Back if not 0  
D7D9   L_D7D9     JMP	NEXT

;; U.
D7DC
	$82; Code
	"U."; Name
	$D7C1; Backward Link
U.exec:
D7E1	COLON; Complile The Following Section
	Const0;  Push $0000 onto TOS
	D.exec
	;Sexec

;; <>
D7E9
	$82; Code
	"<>"; Name
	$D7DC; Backward Link
<>exec:; NOS <> TOS?
D7EE $D7F0
D7F0   L_D7F0     PUL A; Get MSByte of TOS
D7F1		  PUL B; Get LSByte of TOS
D7F2		  TSX; X now points to NOS 
D7F3		  SUB B   $01,X; Subtract NOS LSByte from TOS LSByte
D7F5		  SBC A   $00,X; Subtract (with carry) NOS MSByte from TOS LSByte
D7F7		  BNE	L_D804; TOS and NOS MSBytes Not Equal, Set TRUE   
D7F9		  TST B; Test LSBytes
D7FA		  BNE	L_D804 ; TOS and NOS LSBytes Not Equal, Set TRUE  
D7FC		  CLR A; Assume FALSE
D7FD   L_D7FD     STA A   $00,X; PUSH Result
D7FF		  STA A   $01,X; PUSH Result; TOS will be $0000 for FALSE or $FFFF for TRUE
D801   L_D801     JMP	NEXT   
D804   L_D804     LDA A   #$FF; Set TRUE
D806		  BRA	L_D7FD; PUSH TRUE

;; <=
D808
	$82; Code
	",="; Name
	$D7E9; Backward Link
<=exec:; NOS <= TOS?
D80D $D80F
D80F   L_D80F     PUL A; Get MSByte of TOS
D810		  PUL B; Get LSByte of TOS
D811		  TSX; X now points to NOS 
D812		  SUB B   $01,X; Subtract NOS LSByte from TOS LSByte
D814		  SBC A   $00,X; Subtract (with carry) NOS MSByte from TOS LSByte
D816		  BGE	L_D820; TOS Greater, Set TRUE   
D818		  CLR A; Assume FALSE
D819   L_D819     STA A   $00,X; PUSH Result
D81B		  STA A   $01,X; PUSH Result; TOS will be $0000 for FALSE or $FFFF for TRUE
D81D   L_D81D     JMP	NEXT   
D820   L_D820     LDA A   #$FF; Set TRUE
D822		  BRA	L_D819; PUSH TRUE

;; >=
D824
	$82; Code
	">=" Name
	$D808; Backward Link
>=exec:;	 NOS >= TOS?
D829 $D82B
D82B   L_D82B     TSX  
D82C		  LDA B   $03,X
D82E		  LDA A   $01,X
D830		  STA A   $03,X
D832		  STA B   $01,X
D834		  LDA B   $02,X
D836		  LDA A   $00,X
D838		  STA A   $02,X
D83A		  STA B   $00,X
D83C		  JMP	L_D80F

;; 0>
D83F
	$82; Code
	"0>" Name
	$D824; Backward Link
0>exec: ;Test of TOS for >0
D844 $D846
D846   L_D846     PUL A; Get MSByte from Stack
D847		  PUL B; Get LSByte from Stack
D848		  TST A; Test MSByte
D849		  BMI	L_D850; <0, FALSE  
D84B		  BNE	L_D856; MSByte<>0, TRUE 
D84D		  TST B; Test LSByte
D84E		  BNE	L_D856; LSByte<>0, TRUE   
D850   L_D850     CLR A; Assume FALSE
D851   L_D851     PSH A; PUSH Result
D852		  PSH A; PUSH Result; TOS will be $0000 for FALSE or $FFFF for TRUE
D853   L_D853     JMP	NEXT   
D856   L_D856     LDA A   #$FF; Set TRUE
D858		  BRA	L_D851; PUSH TRUE

;; DUMP
D85A
	$84; Code
	"DUMP"; Name
	$D83F; Backward Link
	COLON; Complile The Following Section
	BASEexec
	@exec; Push Data Contained in TOS Addr to TOS
	>Rexec; Move TOS to Return Stack
	HEXexec
	OVERexec; Duplicate NOS at TOS
	+exec; Add NOS To TOS for Loop Limit
	SWAPexec; Swap TOS with NOS for Loop Index
	(DO)exec; Beginning of DO Loop
		CRexec; Send Carriage Return
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
	(DO)exec; Beginning of DO Loop
		)exec
		C@exec;  Push (Char) Data Contained in TOS Addr to TOS
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
	(DO)exec; Beginning of DO Loop
		)exec
		C@exec;  Push (Char) Data Contained in TOS Addr to TOS
		DUPexec; Duplicate TOS
		LITexec; Put value that follows on TOS
		$0021; Literal Value
		<exec;	 NOS<TOS?
		OVERexec; Duplicate NOS at TOS
		LITexec; Put value that follows on TOS
		$007E; Literal Value
		>exec;	 NOS > TOS?
		ORexec;  OR NOS with TOS
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$0008
			DROPexec; Delete TOS
			LITexec; Put value that follows on TOS
			$002E; Literal Value
		ENDIF
		EMITexec
	(LOOP)exec
	$FFDC
	LITexec; Put value that follows on TOS
	$0010; Literal Value
	(+LOOP)exec
	$FF86
	R>exec;   Retrieve TOS from return stack.
	BASEexec
	!exec; Store NOS to Addr in TOS
	;Sexec
	Const0
	$0218
	Const0
	$0216
	Const0
	$021A
	COLON; Complile The Following Section
	$D8F7
	@exec; Push Data Contained in TOS Addr to TOS
	LITexec; Put value that follows on TOS
	$0013; Literal Value
	>exec;	 NOS > TOS?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$004F
		."exec;  Print Literal String
		$22;	Msg Bytes
		""Press 'Esc'to quit,'Enter'to cont."
		KEYexec
		LITexec; Put value that follows on TOS
		$001B; Literal Value
		=exec
		OBRANCHexec
		$0014
			DROPexec; Delete TOS
			$D8FF
			@exec; Push Data Contained in TOS Addr to TOS
			BASEexec
			!exec; Store NOS to Addr in TOS
			."exec;  Print Literal String
			$03;	Msg Bytes
			" OK"
			QUITexec
		ENDIF
		LITexec; Put value that follows on TOS
		$0000; Literal Value
		$D8F7
		!exec; Store NOS to Addr in TOS
		CRexec; Send Carriage Return
		;Sexec
		COLON; Complile The Following Section
		$D8FB
		@exec; Push Data Contained in TOS Addr to TOS
    	 LITexec; Put value that follows on TOS
		$003C; Literal Value
		>exec;	 NOS > TOS?
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$001A
			CRexec; Send Carriage Return
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
		ELSE
			LITexec; Put value that follows on TOS
			$0014; Literal Value
			$D8FB
			@exec; Push Data Contained in TOS Addr to TOS
			LITexec; Put value that follows on TOS
			$0014; Literal Value
			MODexec
			-exec	; Subtract TOS From NOS
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
		ENDIF
	ENDIF
	;Sexec
	COLON; Complile The Following Section
	DUPexec; Duplicate TOS
	C@exec;  Push (Char) Data Contained in TOS Addr to TOS
	LITexec; Put value that follows on TOS
	$001F; Literal Value
	ANDexec;  AND NOS with TOS
	+exec; Add NOS To TOS
	LITexec; Put value that follows on TOS
	$0003; Literal Value
	+exec; Add NOS To TOS
	;Sexec
	COLON; Complile The Following Section
	DUPexec; Duplicate TOS
	C@exec;  Push (Char) Data Contained in TOS Addr to TOS
	LITexec; Put value that follows on TOS
	$001F; Literal Value
	ANDexec;  AND NOS with TOS
	+exec; Add NOS To TOS
	1+exec;    Add 1 TO TOS
	@exec; Push Data Contained in TOS Addr to TOS
	;Sexec
	COLON; Complile The Following Section
	DUPexec; Duplicate TOS
	C@exec;  Push (Char) Data Contained in TOS Addr to TOS
	LITexec; Put value that follows on TOS
	$001F; Literal Value
	ANDexec;  AND NOS with TOS
	DUPexec; Duplicate TOS
	$D8FB
	+!exec; Add NOS to Addr in TOS
	OVERexec; Duplicate NOS at TOS
	1+exec;    Add 1 TO TOS
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
	C@exec;  Push (Char) Data Contained in TOS Addr to TOS
	LITexec; Put value that follows on TOS
	$0020; Literal Value
	ANDexec;  AND NOS with TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
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
	ENDIF
	$D9C6
	DUPexec; Duplicate TOS
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0006
		BRANCHexec
		$FFC2
	ENDIF
	DROPexec; Delete TOS
	CRexec; Send Carriage Return
	$D8FF
	@exec; Push Data Contained in TOS Addr to TOS
	BASEexec
	!exec; Store NOS to Addr in TOS
	CRexec; Send Carriage Return
	;Sexec

;; RUNHR
DA70
	$85; Code
	"RUNHR"; Name
	$D9F6; Backward Link
ConstRUNHR:
DA78	GetVar
	$0210

;; RUNMIN
DA7C
	$86; Code
	"RUNMIN"; Name
	$DA70; Backward Link
ConstRUNMIN:
DA85	GetVar
	$0211

;; RUNSEC
DA89
	$86; Code
	"RUNSEC"; Name
	$DA7C; Backward Link
ConstRUNSEC:
DA92	GetVar
	$0212

;; msTIMER
DA96
	$87; Code
	"msTIMER"; Name
	$DA89; Backward link
ConstmsTIMER:
DAA0	GetVar
	$020B

;; 
DAA4
	$86; Code
	"@RUNHR" Name
	$DA96; Backward Link
@RUNHRexec:
DAAD	COLON; Complile The Following Section
	LITexec; Put value that follows on TOS
	$0210; Literal Value
	C@exec;  Push (Char) Data Contained in TOS Addr to TOS
	;Sexec

;; @RUNMIN
DAB7
	$87; Code
	"@RUNMIN"; Name
	$DAA4; Backward Link
	COLON; Complile The Following Section
	LITexec; Put value that follows on TOS
	$0211; Literal Value
	C@exec;  Push (Char) Data Contained in TOS Addr to TOS
	;Sexec

;; @RUNSEC
DACB
	$87; Code
	"@RUNSEC"; Name
	$DAB7
@RUNSECexec:
DAD5	COLON; Complile The Following Section
	LITexec; Put value that follows on TOS
	$0212; Literal Value
	C@exec;  Push (Char) Data Contained in TOS Addr to TOS
	;Sexec

;; @RUN10TH
DADF
	$88; Code
	"@RUN10TH"; Name
	$DACB; Backward Link
	COLON; Complile The Following Section
	LITexec; Put value that follows on TOS
	1000; Literal Value
	LITexec; Put value that follows on TOS
	TickCtr; Literal Value
	@exec; Push Data Contained in TOS Addr to TOS
	-exec	; Subtract TOS From NOS
	LITexec; Put value that follows on TOS
	$0064; Literal Value
	/exec;   Divide TOS by NOS
	;Sexec

;; #RUNmsec
DB00
	$88; Code
	"#RUNmsec"
	$DADF; Backward link
	COLON; Complile The Following Section
	LITexec; Put value that follows on TOS
	1000; Literal Value
	LITexec; Put value that follows on TOS
	TickCtr; Literal Value
	@exec; Push Data Contained in TOS Addr to TOS
	-exec	; Subtract TOS From NOS
	;Sexec

;; fNMIOFF
DB1B
	$87; Code
	"fNMIOFF"; Name
	$DB00; Backward Link
VarfNMIOFF:
DB25	GetVar
	$0204

;; 'EXTIRQ
DB29
	$87; Code
	"'EXTIRQ"; Name
	$DB1B; Backward Link
Const'EXTIRQ:
DB33	GetVar
	$BFFC

;; 'EXTSWI
DB37
	$87; Code
	"'EXTSWI"; Name
	$DB29; Backward Link
Const'EXTSWI:
DB41	GetVar
	$BFF6

;; 'EXTNMI
DB45
	$87; Code
	"'EXTNMI"; Name
	$DB37; Backward Link
Const'EXTNMI:
DB4F	GetVar
	$BFFA

;; 'EXTRST
DB53
	$87; Code
	"'EXTRST" Name
	$DB45; Backward Link
Const'EXTRST:
DB5D	GetVar
	$BFFA

;; 'EXTROM
DB61
	$87; Code
	"'EXTROM"; Name
	$DB53; Backward Link
Const'EXTROM:
DB6B	GetVar
	$BFFE

;; 'DP0
DB6F
	$84; Code
	"'DP0"; Name
	$DB61; Backward Link
Const'DP0:
DB76	GetVar
	$C01E

;; 'FENCE0
DB7A
	$87; Code
	"'FENCE0" Name
	$DB6F; Backward Link
Const'FENCE0:
DB84	GetVar
	$C01C

;; @KERNALEND; PUSH $FF72 on TOS
DB88
	$8A; Code
	"@KERNALEND"; Name
	$DB7A; Backward Link
	$DB97
DB97   L_DB97     LDA A D_DDE6; $FF  
DB9A		  LDA B D_DDE7; $72   
DB9D		  JMP	PUSHD

;; !KERNALEND
DBA0
	$8A; Code
	"!KERNALEND"; Name
	$DB88; Backward Link
DBAD $DBAF
DBAF   L_DBAF     PUL A
DBB0		  PUL B
DBB1		  STA A   D_DDE6
DBB4		  STA B   D_DDE7
DBB7   L_DBB7     JMP	NEXT

;; NOON
DBBA
	$84; Code	
	"NOON"; Name
	$DBA0; Backward Link
NOONexec:
DBC1 NEXT

DBC3   DB 0; This is probably an error in the code

DBC4   Init3:     LDA A D_DBC3; 0  
DBC7		  LDA B #$FF
DBC9		  STA B D_DBC3; Read Only Loc  
DBCC		  LDA B D_DBC3   
DBCF		  STA A D_DBC3; Read Only Loc   
DBD2		  STA B $021D   
DBD5		  STA B $021C   
DBD8		  LDA A #$25
DBDA		  STA A CmdRegA   
DBDD		  LDA A #$35
DBDF		  STA A CmdRegA   
DBE2		  LDA A #$45
DBE4		  STA A CmdRegA   
DBE7		  LDA A #$55
DBE9		  STA A CmdRegA   
DBEC		  LDA A #$15
DBEE		  STA A CmdRegA   
DBF1		  LDA A #$93
DBF3		  STA A ModeRegA   
DBF6		  LDA A #$07
DBF8		  STA A ModeRegA   
DBFB		  LDA A #$BB
DBFD		  STA A ClkRegA   
DC00		  CLR A
DC01		  STA A ImaskRgA   
DC04		  LDA A #$B0
DC06		  STA A $ACRA   
DC09		  LDA A #$03
DC0B		  STA A $602E   
DC0E		  LDA A #$13
DC10		  STA A $6000   
DC13		  LDA A #$11
DC15		  STA A $6000   
DC18		  LDA A #$FF
DC1A		  STA A $0200   
DC1D		  CLR	$0201   
DC20		  CLR	$0202   
DC23		  CLR	$0203   
DC26		  CLR	$020A   
DC29		  CLR	MSTimer  
DC2C		  CLR	$020C   
DC2F		  CLR	$0206   
DC32		  CLR	$020D   
DC35		  CLR	fNMIOFF; Enable NMI  
DC38		  CLR	$0205   
DC3B		  LDX	#$1FFE
DC3E		  JSR	S_DC42   
DC41		  RTS
  
DC42   S_DC42     LDA A #$AA
DC44		  STA A $01,X
DC46		  LDA A $01,X
DC48		  CMP A #$AA
DC4A		  BNE	L_DC5B   
DC4C		  LDA A #$55
DC4E		  STA A $00,X
DC50		  LDA A $00,X
DC52		  CMP A #$55
DC54		  BNE	L_DC5B   
DC56		  STX	$0213   
DC59		  PUL B
DC5A		  PUL B
DC5B   L_DC5B     RTS
  
DC5C   NMILOC:    TST	fNMIOFF; See if NMI Disabled  
DC5F		  BEQ	ProcNMI; NMI Not Disabled   
DC61		  RTI		; Restore state
  
DC62   ProcNMI:   LDX	#$020A
DC65		  LDA A $02,X
DC67		  ADD A #$01
DC69		  STA A $02,X
DC6B		  LDA A $01,X
DC6D		  ADC A #$00
DC6F		  STA A $01,X
DC71		  LDA A $00,X
DC73		  ADC A #$00
DC75		  STA A $00,X
DC77		  LDX	TickCtr   
DC7A		  DEX  
DC7B		  STX	TickCtr   
DC7E		  BNE	L_DCA3   
DC80		  LDX	#1000
DC83		  STX	TickCtr   
DC86		  INC	$0212   
DC89		  LDA A $0212   
DC8C		  CMP A #$3C
DC8E		  BMI	L_DCA3   
DC90		  CLR	$0212   
DC93		  INC	$0211   
DC96		  LDA A $0211   
DC99		  CMP A #$3C
DC9B		  BMI	L_DCA3   
DC9D		  CLR	$0211   
DCA0		  INC	$0210   
DCA3   L_DCA3     LDA A $0206   
DCA6		  BEQ	L_DCAC   
DCA8		  INC	$020D   
DCAB		  RTI
  
DCAC   L_DCAC     COM $0206   
DCAF		  TST $021C   
DCB2		  BEQ L_DCC2   
DCB4		  JSR S_DCCB   
DCB7		  LDA A $021D   
DCBA		  BNE L_DCC8   
DCBC		  JSR S_DD33   
DCBF		  JMP L_DD47   
DCC2   L_DCC2     JSR S_DD09   
DCC5		  JSR S_DCF5   
DCC8   L_DCC8     JMP L_DD47   
DCCB   S_DCCB     LDA B $6000   
DCCE		  BIT B #$01
DCD0		  BEQ L_DCDD   
DCD2		  LDA B $6001   
DCD5   L_DCD5     STA B $0203   
DCD8		  LDA B #$FF
DCDA		  STA B $0202   
DCDD   L_DCDD     LDA B $6000   
DCE0		  BIT B #$02
DCE2		  BEQ	L_DCF4   
DCE4		  LDA B   $0200   
DCE7		  BNE	L_DCF4   
DCE9		  LDA B   $0201   
DCEC		  STA B   $6001   
DCEF		  LDA B   #$FF
DCF1		  STA B   $0200   
DCF4   L_DCF4     RTS
  
DCF5   S_DCF5     LDA B   $6000   
DCF8		  BIT B   #$01
DCFA		  BEQ	L_DD08   
DCFC		  LDA B   $6001   
DCFF		  CMP B   #$0D
DD01		  BNE	L_DD08   
DD03		  STA B   $021C   
DD06		  BRA	L_DCD5   
DD08   L_DD08     RTS
  
DD09   S_DD09   LDA B $StatRegA   
DD0C		BIT B #$01
DD0E		BEQ   L_DD1B   
DD10		LDA B $RcvDtaA   
DD13   L_DD13   STA B $0203   
DD16		LDA B #$FF
DD18		STA B $0202   
DD1B   L_DD1B   LDA B $StatRegA   
DD1E		BIT B #$04
DD20		BEQ   L_DD32   
DD22		LDA B $0200   
DD25		BNE   L_DD32   
DD27		LDA B $0201   
DD2A		STA B $XmitDtaA   
DD2D		LDA B #$FF
DD2F		STA B $0200   
DD32   L_DD32   RTS
  
DD33   S_DD33     LDA B $StatRegA   
DD36		  BIT B #$01
DD38		  BEQ	L_DD46   
DD3A		  LDA B $RcvDtaA   
DD3D		  CMP B #$0D
DD3F		  BNE	L_DD46   
DD41		  CLR	$021C   
DD44		  BRA	L_DD13   
DD46   L_DD46     RTS
  
DD47   L_DD47     LDX	D_BFFE   
DD4A		  CPX	#$55AA
DD4D		  BNE	L_DD54   
DD4F		  LDX	D_BFFA   
DD52		  JSR	$00,X
DD54   L_DD54     CLR	$0206   
DD57		  LDA A   $0203   
DD5A		  AND A   #$7F
DD5C		  CMP A   #$02
DD5E		  BNE	L_DD63   
DD60		  JMP	L_C004   
DD63   L_DD63     CMP A   #$03
DD65		  BNE	L_DD6A   
DD67		  JMP	RSTLOC   
DD6A   L_DD6A     RTI
  
DD6B   RSTLOC     LDS	#$007F
DD6E		  LDA A   #$55
DD70		  STA A   $0206   
DD73		  LDX	#$0080
DD76		  CLR A
DD77		  NOP  
DD78		  NOP  
DD79		  NOP  
DD7A		  NOP  
DD7B		  NOP  
DD7C		  NOP  
DD7D		  NOP  
DD7E		  NOP  
DD7F		  LDX	#$0000
DD82		  STX	D_BFFE   
DD85		  LDX	#$DD8D; Save rtn addr in 0
DD88		  STX	$0000   
DD8A		  JMP	BlkMov1; Effectively jsr   
DD8D   L_DD8D     LDS	#$007F
DD90		  LDA A   #$55
DD92		  STA A   $0206   
DD95		  LDA B   #$FF
DD97		  PSH B
DD98		  LDX	#$0209
DD9B   L_DD9B     CLR	$00,X
DD9D		  INX  
DD9E		  CPX	#$021E
DDA1		  BNE	L_DD9B   
DDA3		  LDX	#1000
DDA6		  STX	TickCtr   
DDA9		  LDA A   #$FF
DDAB		  STA A   $0215   
DDAE		  LDX	D_BFFE   
DDB1		  CPX	#$55AA
DDB4		  BNE	L_DDBB   
DDB6		  LDX	D_BFF8   
DDB9		  JSR	$00,X
DDBB   L_DDBB     PUL B
DDBC		  TST B
DDBD		  BNE	L_DDC2   
DDBF		  JMP	L_D09C   
DDC2   L_DDC2     JMP	L_C000   
DDC5   IRQLOC     LDA A $0209   
DDC8		  BEQ	L_DDD7   
DDCA		  LDX	D_BFFE   
DDCD		  CPX	#$55AA
DDD0		  BNE	L_DDD7   
DDD2		  LDX	D_BFFC   
DDD5		  JSR	$00,X
DDD7   L_DDD7     RTI
  
DDD8   SWILOC     LDX	D_BFFE   
DDDB		  CPX	#$55AA
DDDE		  BNE	L_DDE5   
DDE0		  LDX	D_BFF6   
DDE3		  JSR	$00,X
DDE5   L_DDE5     RTI

 dw $FF72

;; 
DDE8
	$88; Code
	"vARIABLE; Name
	$05B3' ??? Normally this is the Backward Link
	COLON; Complile The Following Section
	DROPexec; Delete TOS
	Const'DP0
	@exec; Push Data Contained in TOS Addr to TOS
	DUPexec; Duplicate TOS
	CONSTANTexec
	2+exec;    Add 2 TO TOS
	DUPexec; Duplicate TOS
	Const'DP0
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
	Const'DP0
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
	."exec;  Print Literal String
	$2C;	Msg Bytes
	"ALLOT DISABLED. Use ALLOT-ROM or ALLOT-RAM. "
	;Sexec

;; WRTc1
DE74
	$85; Code
	"WRTc1"; Name
	$DE39; Backward Link
WRTc1exec:
DE7C	COLON; Complile The Following Section
	LITexec; Put value that follows on TOS
	$DDF5; Literal Value
	NFAexec
	1+exec;    Add 1 TO TOS
	C!exec;  Store NOS (Char)  to Addr in TOS
	DUPexec; Duplicate TOS
	LITexec; Put value that follows on TOS
	$DE1B; Literal Value
	NFAexec
	1+exec;    Add 1 TO TOS
	C!exec;  Store NOS (Char)  to Addr in TOS
	LITexec; Put value that follows on TOS
	$DE2D; Literal Value
	NFAexec
	1+exec;    Add 1 TO TOS
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
ConstWARMSTART:
DEE6	GetVar
	$FFFF

;; PPUSHBA
DEEA
	$87; Code
	"PPUSHBA"; Name
	$DED9; Backward Link
ConstPPUSHBA:
DEF4	GetVar
	$FFEC

;; 'PUSHBA
DEF8
	$87; Code
	"'PUSHBA"; Name
	$DEEA; Backward Link
Const'PUSHBA:
DF02	GetVar
	$C032

;; 'PCEMIT
DF06
	$87; Code
	"'PCEMIT"; Name
	$DEF8; Backward Link
Const'PCEMIT:
DF10	GetVar
	$D3E3

;; 'PCKEY
DF14
	$86; Code
	"'PCKEY"; Name
	$DF06; Backward Link
Const'PCKEY:
	GetVar
	$D3FC

;; 'PEDIT
DF21
	$86; Code
	"'PEDIT"; Name
	$DF14; Backward Link
Const'PEDIT:
DF2A	GetVar
	$D0FD

;; 'PASSEM
DF2E
	$87; Code
	"'PASSEM"; Name
	$DF21; Backward Link
Const'PASSEM:
DF38	GetVar
	$D0EA

;; 'PFORTH
DF3C
	$87; Code
	"'PFORTH"; Name
	$DF2E; Backward Link
Const'PFORTH:
DF46	GetVar
	$D0D4

;; 0<>
DF4A
	$83; Code
	"0<>"; Name
	$DF3C; Backward Link
0<>exec:
DF50	COLON; Complile The Following Section
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	;Sexec

;; 0<=
DF58
	$83; Code
	"0<="; Name
	$DF4A; Backward Link
0<=exec:;  TOS <= 0?
DF5E	COLON; Complile The Following Section
	Const0;  Push $0000 onto TOS
	>exec;	 NOS > TOS?
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	;Sexec

;; 0>=
DF68
	$83; Code
	"0>="; Name
	$DF58; Backward Link
0>=exec:;		TOS >= 0?
DF6E	COLON; Complile The Following Section
	0<exec ;	    TOS  <0?
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	;Sexec

;; D-
DF76
	$82; Code
	"D-"; Name
	$DF68; Backward Link
D-exec:
DF7B	COLON; Complile The Following Section
	DMINUSexec;   Double Negate
	D+exec; Add Double Numbers on Stack
	;Sexec

;; D=
DF83
	$82; Code
	"D="; Name
	$DF76; Backward Link
	COLON; Complile The Following Section
	D-exec
	ORexec;  OR NOS with TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	;Sexec

;; D<>
DF92
	$83; Code
	"D<>"; Name
	$DF83; Backward Link
	COLON; Complile The Following Section
	$DF88
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	;Sexec

;; D<
DFA0
	$82; Code
	"D<"; Name
	$DF92; Backward Link
D<exec:
DFA5	COLON; Complile The Following Section
	D-exec
	SWAPexec; Swap TOS with NOS
	DROPexec; Delete TOS
	Const0;  Push $0000 onto TOS
	<exec;	 NOS<TOS?
	;Sexec

;; D>
DFB3
	$82; Code
	"D>"; Name
	$DFA0; Backward Link
D>exec:;	   3rd and 4th > 1st and 2nd?
DFB8	COLON; Complile The Following Section
	2SWAPexec
	D<exec
	;Sexec

;; D<=
DFC0
	$83; Code
	"D<="; Name
	$DFB3; Backward Link
D<=exec:
DFC6	COLON; Complile The Following Section
	d>exec; 3rd and 4th > 1st and 2nd?
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	;Sexec

;; D>=
DFCE
	$83; Code
	"D>="; Name
	$DFC0; Backward Link
	COLON; Complile The Following Section
	D<exec
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	;Sexec

;; D*
DFDC
	$82; Code
	"D*"
	$DFCE; Backward Link
D*exec:;	 Double Multiply
DFE1	COLON; Complile The Following Section
	DUPexec; Duplicate TOS
	>Rexec; Move TOS to Return Stack
	OVERexec; Duplicate NOS at TOS
	>Rexec; Move TOS to Return Stack
	>Rexec; Move TOS to Return Stack
	DABSexec;   Double Absolute Value
	R>exec;   Retrieve TOS from return stack.
	ABSexec;	   Absolute Value of TOS
	SWAPexec; Swap TOS with NOS
	OVERexec; Duplicate NOS at TOS
	;  Multiply TOS by TOS
	>Rexec; Move TOS to Return Stack
	U)exec
	Const0;  Push $0000 onto TOS
	R>exec;   Retrieve TOS from return stack.
	D+exec; Add Double Numbers on Stack
	R>exec;   Retrieve TOS from return stack.
	R>exec;   Retrieve TOS from return stack.
	XORexec;  XOR NOS with TOS
	0<exec ;	    TOS  <0?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$0004
	ENDIF
	DMINUSexec;   Double Negate
	;Sexec

;; D/
E013
	$82; Code
	"D/"; Name
	$DFDC; Backward Link
D/exec:;	 Double Divide
E018	COLON; Complile The Following Section
	DUPexec; Duplicate TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0006
		DROPexec; Delete TOS
		Const1;  Push $0001 onto TOS
	ENDIF
	OVERexec; Duplicate NOS at TOS
	>Rexec; Move TOS to Return Stack
	>Rexec; Move TOS to Return Stack
	DABSexec;   Double Absolute Value
	Rexec
	ABSexec;	   Absolute Value of TOS
	/MODexec
	ROTexec;    Rotate top 3 on stack
	ROTexec;    Rotate top 3 on stack
	Rexec
	ABSexec;	   Absolute Value of TOS
	M/MODexec
	ROTexec;    Rotate top 3 on stack
	DROPexec; Delete TOS
	ROTexec;    Rotate top 3 on stack
	Const0;  Push $0000 onto TOS
	SWAPexec; Swap TOS with NOS
	D+exec; Add Double Numbers on Stack
	R>exec;   Retrieve TOS from return stack.
	R>exec;   Retrieve TOS from return stack.
	XORexec;  XOR NOS with TOS
	0<exec ;	    TOS  <0?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004
		DMINUSexec;   Double Negate
	ENDIF
	;Sexec

;; DMAX
E05A
	$84; Code
	"DMAX"; Name
	$E013; Backward Link
DMAXexec:
E061	COLON; Complile The Following Section
	2OVERexec
	2OVERexec
	D<exec
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004
		2SWAPexec
	ENDIF
	2DROPexec; Remove TOS and NOS
	;Sexec

;; DMIN
E073
	$84; Code
	"DMIN"; Name
	$E05A; Backward Link
DMINexec:
E07A	COLON; Complile The Following Section
	2OVERexec
	2OVERexec
	d>exec; 3rd and 4th > 1st and 2nd?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004
		2SWAPexec
	ENDIF
	2DROPexec; Remove TOS and NOS
	;Sexec

E08Cdref:
E08C 	$0001
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
	1000
	$0080
	$0003
	1000
	$0100
	$0003
	1000
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
ConstJSTTB`:
E0EF	GetVar
	E08C

;; J1
E0F3
	$82; Code
	"J1"; Name
	$E0E6; Backward Link
VarJ1:;	  Push $05BE onto TOS
E0F8	GetVar
	$05BE

;; J2
E0FC
	$82; Code
	"J2"; Name
	$E0F3; Backward Link
VarJ2; Push Var Addr onto TOS:
E101	GetVar
	$05C0

;; sgn1
E105
	$84; Code
	"sgn1"; Name
	$E0FC; Backward Link
Varsgn1:;	Push Var Addr onto TOS
E10C	GetVar
	$05C2

;; 0 VARIABLE sgn2
E110
	$84; Code
	"sgn2"; Name
	$E105; Backward Link
Varsgn2:; 	 Push Var Addr onto TOS
E117	GetVar
	$05C4

;; j1
E11B
	$82; Code
	"j1"; Name
	$E110; Backward Link
Varj1:
E120	GetVar
	$05C6

;; j2
E124
	$82; Code
	"j2"; Name
	$E11B; Backward Link
Varj2:
E129	GetVar
	$05C8

;; n
E12D
	$81; Code
	"n"; Name
	$E124; Backward Link
Varn:
E131	GetVar
	$05CA

;; CALCERR
E135
	$87; Code
	"CALCERR"; Name
	$E12D; Backward Link
VarCALCERR:
E13F	GetVar
	$05CC

;; n1
E143
	$82; code
	"n1"; Name
	$E135; Backward Link
Varn1:		; Push Var Addr onto TOS
E148	GetVar
	$05CE

;; n2
E14C
	$82; Code
	"n2" Name
	$E143; Backward Link
n2:
E151	GetVar
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
	>Rexec; Move TOS to Return Stack
	>Rexec; Move TOS to Return Stack
	LITexec; Put value that follows on TOS
	$8001; Literal Value
	MAXexec
	R>exec;   Retrieve TOS from return stack.
	R>exec;   Retrieve TOS from return stack.
	DUPexec; Duplicate TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0016
		2DROPexec; Remove TOS and NOS
		2DROPexec; Remove TOS and NOS
		LITexec; Put value that follows on TOS
		$FFFF; Literal Value
		VarCALCERR
		!exec; Store NOS to Addr in TOS
		LITexec; Put value that follows on TOS
		$000A; Literal Value
		Const1;  Push $0001 onto TOS
		EXITexec
	ENDIF
	DUPexec; Duplicate TOS
	Varsgn2; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	SWAPexec; Swap TOS with NOS
	VarJ2; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	ABSexec;	   Absolute Value of TOS
	LITexec; Put value that follows on TOS
	$0010; Literal Value for Loop Limit
	Const0;  Push $0000 onto TOS for Loop Index
	(DO)exec; Beginning of DO Loop
		)exec
		Varj2
		!exec; Store NOS to Addr in TOS
		DUPexec; Duplicate TOS
		LITexec; Put value that follows on TOS
		$3E80; Literal Value
		>exec;	 NOS > TOS?
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$0008
			LEAVEexec
			BRANCHexec
			$0004
		ELSE
			2*exec; Multiply TOS by 2; (Arithmetic Shift Left TOS)
		ENDIF
	(LOOP)exec
	$FFE4
	>Rexec; Move TOS to Return Stack
	DUPexec; Duplicate TOS
	Varsgn1; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	SWAPexec; Swap TOS with NOS
	VarJ1; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	ABSexec;	   Absolute Value of TOS
	LITexec; Put value that follows on TOS
	$0010; Literal Value for Loop Limit
	Const0;  Push $0000 onto TOS for Loop Index
	(DO)exec
		)exec
		Varj1
		!exec; Store NOS to Addr in TOS
		DUPexec; Duplicate TOS
		LITexec; Put value that follows on TOS
		$3E80; Literal Value
		>exec;	 NOS > TOS?
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$0008
			LEAVEexec
			BRANCHexec
			$0004
		ELSE
			;  Multiply TOS by TOS; Multiply TOS by 2; (Arithmetic Shift Left TOS)
		ENDIF
	(LOOP)exec
	$FFE4
	LITexec; Put value that follows on TOS
	$2710; Literal Value
	LITexec; Put value that follows on TOS
	$FFFC; Literal Value
	VarJ1; Push Var Addr onto TOS
	+!exec; Add NOS to Addr in TOS; Store NOS to Addr in TOS
	R>exec;   Retrieve TOS from return stack.
	*/exec
	Varj2
	@exec; Push Data Contained in TOS Addr to TOS
	Varj1
	@exec; Push Data Contained in TOS Addr to TOS
	-exec	; Subtract TOS From NOS
	DUPexec; Duplicate TOS
	>exec;	 TOS>0?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0028
		LITexec; Put value that follows on TOS
		$0006; Literal Value
		;  Multiply TOS by TOS
		ConstJSTTB`
		+exec; Add NOS To TOS
		DUPexec; Duplicate TOS
		LITexec; Put value that follows on TOS
		$0004; Literal Value
		+exec; Add NOS To TOS
		@exec; Push Data Contained in TOS Addr to TOS
		VarJ1; Push Var Addr onto TOS
		+!exec; Add NOS to Addr in TOS
		DUPexec; Duplicate TOS
		2+exec;    Add 2 TO TOS
		@exec; Push Data Contained in TOS Addr to TOS
		SWAPexec; Swap TOS with NOS
		@exec; Push Data Contained in TOS Addr to TOS
		*/exec
		Const0;  Push $0000 onto TOS
	ENDIF
	DUPexec; Duplicate TOS
	0<exec ;	    TOS  <0?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0036
		ABSexec;	   Absolute Value of TOS
		LITexec; Put value that follows on TOS
		$0006; Literal Value
		;  Multiply TOS by TOS
		ConstJSTTB`
		+exec; Add NOS To TOS
		DUPexec; Duplicate TOS
		LITexec; Put value that follows on TOS
		$0004; Literal Value
		+exec; Add NOS To TOS
		@exec; Push Data Contained in TOS Addr to TOS
		1-exec; Subtract 1 from TOS (DEC TOS)
		MINUSexec;	  Negate TOS
		VarJ1; Push Var Addr onto TOS
		+!exec; Add NOS to Addr in TOS
		DUPexec; Duplicate TOS
		@exec; Push Data Contained in TOS Addr to TOS
		LITexec; Put value that follows on TOS
		$000A; Literal Value
		/exec;   Divide TOS by NOS
		SWAPexec; Swap TOS with NOS
		2+exec;    Add 2 TO TOS
		@exec; Push Data Contained in TOS Addr to TOS
    	 */exec
		BRANCHexec
		$0004
	ELSE
		DROPexec; Delete TOS
	ENDIF
	Varsgn1; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	Varsgn2; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	XORexec;  XOR NOS with TOS
	0<exec ;	    TOS  <0?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004
		MINUSexec;	  Negate TOS
	ENDIF
	VarJ1; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	VarJ2; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	-exec	; Subtract TOS From NOS
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
	>Rexec; Move TOS to Return Stack
	>Rexec; Move TOS to Return Stack
	LITexec; Put value that follows on TOS
	$8001; Literal Value
	MAXexec
	R>exec;   Retrieve TOS from return stack.
	R>exec;   Retrieve TOS from return stack.
	DUPexec; Duplicate TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0016
		2DROPexec; Remove TOS and NOS
		2DROPexec; Remove TOS and NOS
		LITexec; Put value that follows on TOS
		$FFFF; Literal Value
		VarCALCERR
		!exec; Store NOS to Addr in TOS
		LITexec; Put value that follows on TOS
		$000A; Literal Value
		Const1;  Push $0001 onto TOS
		EXITexec
	ENDIF
	DUPexec; Duplicate TOS
	Varsgn2; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	SWAPexec; Swap TOS with NOS
	VarJ2; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	ABSexec;	   Absolute Value of TOS
	>Rexec; Move TOS to Return Stack
	DUPexec; Duplicate TOS
	Varsgn1; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	SWAPexec; Swap TOS with NOS
	VarJ1; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	ABSexec;	   Absolute Value of TOS
	Const0;  Push $0000 onto TOS
	R>exec;   Retrieve TOS from return stack.
	D*exec;	 Double Multiply
	BEGIN
		2DUPexec; Duplicate TOS/NOS
		LITexec; Put value that follows on TOS
		$7FFE; Literal Value
		LITexec; Put value that follows on TOS
		$0000; Literal Value
		d>exec; 3rd and 4th > 1st and 2nd?
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$001A
			LITexec; Put value that follows on TOS
			$000A; Literal Value
			M/MODexec
			Const1;  Push $0001 onto TOS
			VarJ1; Push Var Addr onto TOS
			+!exec; Add NOS to Addr in TOS
			ROTexec;    Rotate top 3 on stack
			Varn
			!exec; Store NOS to Addr in TOS
			Const0;  Push $0000 onto TOS
			BRANCHexec
			$0006
		ELSE
			LITexec; Put value that follows on TOS
			$FFFF; Literal Value
		ENDIF
	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
	$FFD2
	DROPexec; Delete TOS
	Varn
	@exec; Push Data Contained in TOS Addr to TOS
	LITexec; Put value that follows on TOS
	$0004; Literal Value
	>exec;	 NOS > TOS?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004
		1+exec;    Add 1 TO TOS
	ENDIF
	Varsgn1; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	Varsgn2; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	XORexec;  XOR NOS with TOS
	0<exec ;	    TOS  <0?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004
		MINUSexec;	  Negate TOS
	ENDIF
	VarJ1; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	VarJ2; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	+exec; Add NOS To TOS
	SWAPexec; Swap TOS with NOS
	;Sexec

;; nF-
E35B
	$83; Code
	"nF-"; Name
	$E29D; Backward Link
nF-exec:
E361	COLON; Complile The Following Section
	DUPexec; Duplicate TOS
	0<exec ;	    TOS  <0?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$000A
		LITexec; Put value that follows on TOS
		$FFFF; Literal Value
		BRANCHexec
		$0004
	ELSE
		Const0;  Push $0000 onto TOS
	Varn2
	ENDIF
	2!exec; Store NOS and 2nd NOS to Addr in TOS
	VarJ2; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	DUPexec; Duplicate TOS
	0<exec ;	    TOS  <0?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$000A
		LITexec; Put value that follows on TOS
		$FFFF; Literal Value
		BRANCHexec
		$0004
	ELSE
		Const0;  Push $0000 onto TOS
	ENDIF
	Varn1; Push Var Addr onto TOS
	2!exec; Store NOS and 2nd NOS to Addr in TOS
	VarJ1; Push Var Addr onto TOS
	!exec; Store NOS to Addr in TOS
	VarJ1; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	VarJ2; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	-exec	; Subtract TOS From NOS
	DUPexec; Duplicate TOS
	>exec;	 TOS>0?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0024
		DUPexec; Duplicate TOS
		Varn1; Push Var Addr onto TOS
		2@exec;  fetches a double integer to the stack
		ROTexec; Rotate top 3 on stack for Loop Limit
		Const0;  Push $0000 onto TOS for Loop Index
		(DO)exec; Beginning of DO Loop
			LITexec; Put value that follows on TOS
			$000A; Literal Value
			D*exec;	 Double Multiply
		(LOOP)exec
		$FFF8
		Varn1; Push Var Addr onto TOS
		2!exec; Store NOS and 2nd NOS to Addr in TOS
		VarJ2; Push Var Addr onto TOS
		@exec; Push Data Contained in TOS Addr to TOS
		VarJ1; Push Var Addr onto TOS
		!exec; Store NOS to Addr in TOS
	ENDIF
	DUPexec; Duplicate TOS
	0<exec ;	    TOS  <0?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0026
		DUPexec; Duplicate TOS
		ABSexec;	   Absolute Value of TOS
		Varn2
		2@exec;  fetches a double integer to the stack
		ROTexec; Rotate top 3 on stack for Loop Limit
		Const0;  Push $0000 onto TOS for Loop Index
		(DO)exec; Beginning of DO Loop
			LITexec; Put value that follows on TOS
			$000A; Literal Value
			D*exec;	 Double Multiply
		(LOOP)exec
		$FFF8
		Varn2
    	 2!exec; Store NOS and 2nd NOS to Addr in TOS
		VarJ1; Push Var Addr onto TOS
		@exec; Push Data Contained in TOS Addr to TOS
		VarJ2; Push Var Addr onto TOS
		!exec; Store NOS to Addr in TOS
	ENDIF
	DROPexec; Delete TOS
	Varn1; Push Var Addr onto TOS
	2@exec;  fetches a double integer to the stack
	Varn2
	2@exec;  fetches a double integer to the stack
	D-exec
	DUPexec; Duplicate TOS
	>Rexec; Move TOS to Return Stack
	DABSexec;   Double Absolute Value
	LITexec; Put value that follows on TOS
	$000A; Literal Value
	D*exec;	 Double Multiply
	LITexec; Put value that follows on TOS
	$FFFF
	VarJ1; Push Var Addr onto TOS
	+!exec; Add NOS to Addr in TOS
	BEGIN
		Const1;  Push $0001 onto TOS
		VarJ1; Push Var Addr onto TOS
		+!exec; Add NOS to Addr in TOS
		LITexec; Put value that follows on TOS
		$000A; Literal Value
		D/exec;	 Double Divide
		2DUPexec; Duplicate TOS/NOS
		LITexec; Put value that follows on TOS
		$7FFF; Literal Value
		LITexec; Put value that follows on TOS
		$0000; Literal Value
		D<=exec
	OBRANCHexec
	$FFE6
	DROPexec; Delete TOS
	R>exec;   Retrieve TOS from return stack.
	0<exec ;	    TOS  <0?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004
		MINUSexec;	  Negate TOS
	ENDIF
	VarJ1; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	SWAPexec; Swap TOS with NOS
	;Sexec

;; nF+
E447
	$83; Code
	"nF+"; Name
	$E35B; Backward Link
nF+exec:
E44D	COLON; Complile The Following Section
	MINUSexec;	  Negate TOS
	nF-exec
	;Sexec

;; n3
E455
	$82; Code
	"n3"; Name
	$E447; Backward Link
Varn3:
E45A	GetVar
	$05DA

;; Fsgn
E45E
	$84; Code
	"Fsgn"; Name
	$E455; Backward Link
VarFsgn:
E465	GetVar
	$05E0

;; nF*/
E469
	$84; Code
	"nF*/"; name
	$E45E; Backward Link
nF*/exec:
E470	COLON; Complile The Following Section
	DUPexec; Duplicate TOS
	VarFsgn
	!exec; Store NOS to Addr in TOS
	ABSexec;	   Absolute Value of TOS
	Varn3
	2!exec; Store NOS and 2nd NOS to Addr in TOS
	DUPexec; Duplicate TOS
	VarFsgn
	@exec; Push Data Contained in TOS Addr to TOS
	XORexec;  XOR NOS with TOS
	VarFsgn
	!exec; Store NOS to Addr in TOS
	ABSexec;	   Absolute Value of TOS
	Varn2
	2!exec; Store NOS and 2nd NOS to Addr in TOS
	DUPexec; Duplicate TOS
	VarFsgn
	@exec; Push Data Contained in TOS Addr to TOS
	XORexec;  XOR NOS with TOS
	VarFsgn
	!exec; Store NOS to Addr in TOS
	ABSexec;	   Absolute Value of TOS
	Varn1; Push Var Addr onto TOS
	2!exec; Store NOS and 2nd NOS to Addr in TOS
	Varn1; Push Var Addr onto TOS
	2+exec;    Add 2 TO TOS
	@exec; Push Data Contained in TOS Addr to TOS
	Varn2
	2+exec;    Add 2 TO TOS
	@exec; Push Data Contained in TOS Addr to TOS
	+exec; Add NOS To TOS
	Varn3
	2+exec;    Add 2 TO TOS
	@exec; Push Data Contained in TOS Addr to TOS
	-exec	; Subtract TOS From NOS
	Varn3
	2+exec;    Add 2 TO TOS
	!exec; Store NOS to Addr in TOS
	Varn1; Push Var Addr onto TOS
	@exec; Push Data Contained in TOS Addr to TOS
	S->Dexec
	Varn2
	@exec; Push Data Contained in TOS Addr to TOS
	D*exec;	 Double Multiply
	Varn3
	@exec; Push Data Contained in TOS Addr to TOS
	D/exec;	 Double Divide
	2DUPexec; Duplicate TOS/NOS
	LITexec; Put value that follows on TOS
	$7530; Literal Value
	LITexec; Put value that follows on TOS
	$0000; Literal Value
	d>exec; 3rd and 4th > 1st and 2nd?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$003C
	BEGIN
			LITexec; Put value that follows on TOS
			$000A; Literal Value
			M/MODexec
			ROTexec;    Rotate top 3 on stack
			Varn1; Push Var Addr onto TOS
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
		OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
    	$FFDE
		Varn1; Push Var Addr onto TOS
		LITexec; Put value that follows on TOS
		$0004; Literal Value
		>exec;	 NOS > TOS?
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$000C
			LITexec; Put value that follows on TOS
			$0001; Literal Value
			LITexec; Put value that follows on TOS
			$0000; Literal Value
			D+exec; Add Double Numbers on Stack
    	 ENDIF
	ENDIF
	DROPexec; Delete TOS
	LITexec; Put value that follows on TOS
	$05DC; Literal Value
	@exec; Push Data Contained in TOS Addr to TOS
	SWAPexec; Swap TOS with NOS
	VarFsgn
	@exec; Push Data Contained in TOS Addr to TOS
	0<exec ;	    TOS  <0?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004
		MINUSexec;	  Negate TOS
	ENDIF
	;Sexec

;; CLRtimer
E532
	$88; Code
	"CLRtimer"; Name
	$E469; Backward Link
CLRtimerexec:
E53D	COLON
	Const0;	Push $0000 onto TOS
	ConstmsTIMER
	!exec; Store NOS to Addr in TOS
	;Sexec

;; @RUNTIME[10ths]
E5F6
	$8F; Code
	"@RUNTIME[10ths]"; Name
	$E5CB; Backward Link
@RUNTIME[10ths]exec:
E608	COLON
	LITexec
	$0000
	LITexec
	$0000
	Const0
	DROPexec
	$D7B8
	@RUNSECexec
	>Rexec
	$E5D6
	$DB0B
	@RUNSECexec
	R>exec
	=exec
	OBRANCHexec
	$FFEC
	>Rexec
	LITexec
	$000A
	$DFE1
	R>exec
	LITexec
	$0064
	/exec
	Const0
	(+LOOP)exec
	;Sexec

;; DELAY[ms]
E677
	$89; Code
	"DELAY[ms]"; Name
	$E640; Backward Link
DELAY[ms]exec:
E683 	COLON
	Const0;  Push $0000 onto TOS
	MAXexec
	CLRtimerexec
	BEGIN
		DUPexec; Duplicate TOS
		ConstmsTIMER Push ($020B) on TOS ; Using Const for Addr!!!
		@exec; Push Data Contained in TOS Addr to TOS
		<=exec;		   NOS <= TOS?
	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
	$FFF6; Branch Offset
	DROPexec; Delete TOS
	;Sexec

;; DELAY[sec]
E69B
	$8A; Code
	"DELAY[sec]" Name
	$E677; Backward Link
DELAY[sec]exec:
E6A8	COLON
	Const0
	LITexec
	$000A
	$DFE1
	$E555
	@RUNTIME[10ths]exec
	(+LOOP)exec
	2DUPexec
	@RUNTIME[10ths]exec
	$DFA5
	OBRANCHexec
	$FFF8
	$D7B8
	;Sexec

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

;;BKliteON
F137
	$88; CODE
	"BKliteON"; Name
	$F129; Backward Link
BKliteONexec:
F142	COLON
	$F116
	$F107
	!exec; Store NOS to Addr in TOS
	$F125
	@exec; Push Data Contained in TOS Addr to TOS
	$F0F9
	XORexec;  XOR NOS with TOS
	$F0E9
	C!exec;  Store NOS (Char)  to Addr in TOS
	;Sexec

;; ?BKliteOFF
F180
	$8A; Code
	"?BKliteOFF"; Name
	$F158; Backward Link
?BKliteOFFexec:
F18D	COLON
	$F133
	$D735
	$E5D6
	2DUPexec
	$F133
	2!exec
	$DF98
	OBRANCHexec
	$001A
	$F107
	@exec
	0>exec
	OBRANCHexec
	$000E
	C05D
	$FFFF
	$F107
	$C4B8
	BRANCHexec
	$0004
	$F164
	;Sexec

;; DSPLYwdth
F1F5
	$89; Code
	"DSPLYwdth"; Name
	$F1E9; Backward Link
ConstDSPLYwdth:
F201	GetVar
	$0018

;; 0 VARIABLE CHRBUF1
F205
	$87; Code
	"CHRBUF2" Name
	$F1F5; Backward Link
VarCHRBUF1:
F20F	GetVar
	$05EC

;; 0 VARIABLE CHRBUF2
F213
	$87; Code
	"CHRBUF2" Name
	$F205; Backward Link
VarCHRBUF2:
F21D	GetVar
	$0607

;; 0 VARIABLE BUF1pntr
F221
	$88; Code
	"BUF2pntr"; Name
	$F213; Backward Link
VarBUF1pntr:
F22C	GetVar
	$0622

;; 0 VARIABLE BUF2pntr
F230
	$88; Code
	"BUF2pntr"; Name
	$F221; Backward Link
VarBUF2pntr:
F23B	GetVar
	$0624

;; CLR-CHRBUF1
F23F
	$8B; Code
	"CLR-CHRBUF1"; Name
	$F230; Backward Link
CLR-CHRBUF1exec:
F24D	COLON
	VarCHRBUF1
	ConstDSPLYwdth
	+exec; Add NOS To TOS
	VarCHRBUF1
	(DO)exec; Beginning of DO Loop
		LITexec; Put value that follows on TOS
		$0020
		)exec
		C!exec;  Store NOS (Char)  to Addr in TOS
	(LOOP)exec
	$FFF6
	VarCHRBUF1
	VarBUF1pntr
	!exec; Store NOS to Addr in TOS
	;Sexec

;; CLR-CHRBUF2
F26D
	$8B; Code
	"CLR-CHRBUF2" Name
	$F23F; Backward Link
CLR-CHRBUF2exec:
F27B	COLON
	VarCHRBUF2
	ConstDSPLYwdth
	+exec; Add NOS To TOS
	VarCHRBUF2
	(DO)exec; Beginning of DO Loop
		LITexec; Put value that follows on TOS
		$0020
		)exec
		C!exec;  Store NOS (Char)  to Addr in TOS
	(LOOP)exec
	$FFF6
	VarCHRBUF2
	VarBUF2pntr
	!exec; Store NOS to Addr in TOS
	;Sexec

;; LOCKup
F29B
	$86; Code
	"LOCKup"; Name
	$F26D; Backward Link
VarLOCKup:
F2A4	GetVar
	$0626

;; MAJOR_ERROR
F2A8
	$8B; Code
	"MAJOR_ERROR"; Name
	$F29B; Backward Link
	COLON
	CRexec;
	."exec;  Print Literal String
	$16
	"DISPLAY NOT RESPONDING"
	QUITexec
	;Sexec

;; ?LOCKup
F2D7
	$87; Code
	"?LOCKup"; Name
	$F2A8; Backward Link
?LOCKupexec:
F2E1	COLON
	Const1;  Push $0001 onto TOS
	VarLOCKup
	+!exec; Add NOS to Addr in TOS
	VarLOCKup
	@exec; Push Data Contained in TOS Addr to TOS
	LITexec; Put value that follows on TOS
	1000
	>exec;	 NOS > TOS?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0004
		$F2B6
	ENDIF
	;Sexec

;; RESET_LOCKup
F2FB
	$8C; Code
	"RESET_LOCKup"; Name
	$F2D7; Backward Link
	COLON
	Const0;  Push $0000 onto TOS
	VarLOCKup
	!exec; Store NOS to Addr in TOS
	;Sexec

;; ?DSPLY_RDY
F314
	$8A; Code
	"?DSPLY_RDY"; Name
	$F2FB; Backward Link
	COLON
	ConstDSPLY_INSTR
	C@exec;  Push (Char) Data Contained in TOS Addr to TOS
	LITexec; Put value that follows on TOS
	$0080
	ANDexec;  AND NOS with TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	;Sexec

;; DSPLY_WAIT
F331
	$8A; Code
	"DSPLY_WAIT"; Name
	$F314; Backward Link
DSPLY_WAITexec:
F33E	COLON
	RESET_LOCKup
	BEGIN
		?LOCKup
		$F321
	OBRANCHexec; 'UNTIL' Statement: Check TOS... Branch Back to BEGIN if Not 0
	$FFFA
	;Sexec

;; CLEARSCREEN
F34C
	$8B; Code
	$"CLEARSCREEN"; Name
	$F331; Backward Link
	COLON
	DSPLY_WAITexec
	LITexec; Put value that follows on TOS
	$0038
	ConstDSPLY_INSTR
	C!exec;  Store NOS (Char)  to Addr in TOS
	DSPLY_WAITexec
	LITexec; Put value that follows on TOS
	$000C
	ConstDSPLY_INSTR
	C!exec;  Store NOS (Char)  to Addr in TOS
	DSPLY_WAITexec
	LITexec; Put value that follows on TOS
	$0006
	ConstDSPLY_INSTR
	C!exec;  Store NOS (Char)  to Addr in TOS
	DSPLY_WAITexec
	LITexec; Put value that follows on TOS
	$0001
	ConstDSPLY_INSTR
	C!exec;  Store NOS (Char)  to Addr in TOS
	$F24D
	CLR-CHRBUF2exec
	;Sexec

;; DSPLYwrite
F38A
	$8A; Code
	"DSPLYwrite"; name
	$F34C; Backward Link
DSPLYwriteexec:
F397	COLON
	$F1C7
	C!exec;  Store NOS (Char)  to Addr in TOS
	;Sexec

;; SETcurserexec
F39F
	$89; Code
	"SETcurserexec"; Name
	$F38A; Backward Link
SETcurserexec:
F3AB	COLON
	DSPLY_WAITexec
	SWAPexec; Swap TOS with NOS
	Const1;  Push $0001 onto TOS
	>exec;	 NOS > TOS?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$000A
		LITexec; Put value that follows on TOS
		$00C0
		BRANCHexec
		$0006
	ENDIF
	LITexec; Put value that follows on TOS
	$0080
	+exec; Add NOS To TOS
	1-exec; Subtract 1 from TOS (DEC TOS)
	ConstDSPLY_INSTR
	C!exec;  Store NOS (Char)  to Addr in TOS
	;Sexec

;; BLANKline
F3CF
	$89; Code
	"BLANKline"; Name
	$F39F; Backward Link
BLANKlineexec:
F3DB	COLON
	DUPexec; Duplicate TOS
	Const1;  Push $0001 onto TOS
	SETcurser
	ConstDSPLYwdth
	Const0;  Push $0000 onto TOS
	(DO)exec; Beginning of DO Loop
		DSPLY_WAITexec
		LITexec; Put value that follows on TOS
		$0020
		DSPLYwriteexec
	(LOOP)exec
	$FFF6
	DROPexec; Delete TOS
	;Sexec

;; CLEAR-DISPLAY
F3F9
	$F3CF; Backward Link
	COLON
	Const1;  Push $0001 onto TOS
	BLANKlineexec
	Const2
	BLANKlineexec
	;Sexec

;; DSPLYline
F415
	$89; Code
	"DSPLYline"; Name
	$F3F9; Backward Link
	COLON
	Const1;  Push $0001 onto TOS
	SETcurser
	>Rexec; Move TOS to Return Stack
	$F1F1
	Rexec
	+exec; Add NOS To TOS
	$F1E5
	R>exec;   Retrieve TOS from return stack.
	+exec; Add NOS To TOS
	OVERexec; Duplicate NOS at TOS
	>Rexec; Move TOS to Return Stack
	(DO)exec; Beginning of DO Loop
		)exec
		C@exec;  Push (Char) Data Contained in TOS Addr to TOS
		DUPexec; Duplicate TOS
		0=exec; Set TOS to TRUE if 0, ELSE FALSE
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$000C
			)exec
			SWAPexec; Swap TOS with NOS
			LEAVEexec
			BRANCHexec
			$0004
		ELSE
			DSPLYwriteexec
		ENDIF
	(LOOP)exec
	$FFE6
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0012
		Rexec
		SWAPexec; Swap TOS with NOS
		(DO)exec; Beginning of DO Loop
			LITexec; Put value that follows on TOS
			$0020
			DSPLYwriteexec
		(LOOP)exec
    	$FFF8
	ENDIF
	R>exec;   Retrieve TOS from return stack.
	DROPexec; Delete TOS
	;Sexec

;; DSPLYstring
F473
	$8B; Code
	"DSPLYstring"; Name
	"F415; Backward Link
DSPLYstringexec:
F481	COLON
	SETcurser
	>Rexec; Move TOS to Return Stack
	$F1F1
	Rexec
	+exec; Add NOS To TOS
	$F1E5
	R>exec;   Retrieve TOS from return stack.
	+exec; Add NOS To TOS
	(DO)exec; Beginning of DO Loop
		)exec
		C@exec;  Push (Char) Data Contained in TOS Addr to TOS
		DUPexec; Duplicate TOS
		0=exec; Set TOS to TRUE if 0, ELSE FALSE
		OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
		$000A
			DROPexec; Delete TOS
			LEAVEexec
			BRANCHexec
			$0004
    	ELSE
			DSPLYwriteexec
		ENDIF
	(LOOP)exec
	$FFE8
	;Sexec

;; DISPLAY1
F4B1
	$88; Code
	"DISPLAY1"; Name
	$F473; Backward Link
ConstDISPLAY1:
F4BC	GetVar
	$0001

;; DISPLAY2
F4C0
	$88; Code
	"DISPLAY2"; Name
	$F4B1; Backward Link
ConstDISPLAY2:
F4CB	GetVar
	$0002

;; x1
F4CF
	$82; Code
	"x1"; Name
	$F4C0; Backward Link
Const0
	$0628

;; x2
F4D8
	$82; Code
	"x2"; Name
	$F4CF; Backward Link
Varx2:
F4DD	GetVar
	$062A

;; 
F4E1
	$84; Code
	"SETx
	$F4D8; Backward Link
	COLON
	OVERexec; Duplicate NOS at TOS
	ConstDISPLAY1; Push $0001 Onto TOS
	=exec
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0008
		$F4D4
		BRANCHexec
		$0004
	ELSE
		Varx2
	ENDIF
	!exec; Store NOS to Addr in TOS
	;Sexec

;; w-home
F500
	$86; Code
	"w-home"; Name
	$F4E1; Backward Link
	COLON
	Const0;  Push $0000 onto TOS
	$F4E8
	Const1;  Push $0001 onto TOS
	SETcurser
	;Sexec

;; w-TYPE
F515
	$86; Code
	"w-TYPE"; Name
	$F500; Backward Link
w-TYPEexec:
F51E	COLON
	Const1;  Push $0001 onto TOS
	DSPLYstringexec
	;Sexec

;; wx-TYPE
F526
	$86; Code
	"wx-TYPE"; Name
	$F515; Backward Link
wx-TYPEexec:
F530	COLON
	SWAPexec; Swap TOS with NOS
	SETcurser
	OVERexec; Duplicate NOS at TOS
	+exec; Add NOS To TOS
	SWAPexec; Swap TOS with NOS
	(DO)exec; Beginning of DO Loop
		)exec
		C@exec;  Push (Char) Data Contained in TOS Addr to TOS
		DSPLYwriteexec
	(LOOP)exec
	$FFF8
	;Sexec

;; 
F54A
	$87; Code
	"wx-emit"; Name
	$F526; Backward Link
wx-emitexec:
F554	COLON
	SWAPexec; Swap TOS with NOS
	SETcurser
	DSPLYwriteexec
	;Sexec

;; FORMAT-wxTYPE
F55E
	$8D; Code
	"FORMAT-wxTYPE"
FORMAT-wxTYPEexec:
F56E	$F54A; Backward Link
	COLON
	SWAPexec; Swap TOS with NOS
	>Rexec; Move TOS to Return Stack
	SWAPexec; Swap TOS with NOS
	SETcurser
	R>exec;   Retrieve TOS from return stack.
	OVERexec; Duplicate NOS at TOS
	-exec	; Subtract TOS From NOS
	Const0;  Push $0000 onto TOS
	MAXexec
	DUPexec; Duplicate TOS
	>exec;	 TOS>0?
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0014
		Const0;  Push $0000 onto TOS
		(DO)exec; Beginning of DO Loop
			LITexec; Put value that follows on TOS
			$0020
			DSPLYwriteexec
		(LOOP)exec
		$FFF8
		BRANCHexec
		$0004
	ELSE
		DROPexec; Delete TOS
	ENDIF
	OVERexec; Duplicate NOS at TOS
	+exec; Add NOS To TOS
	SWAPexec; Swap TOS with NOS
	(DO)exec; Beginning of DO Loop
		)exec
    	 C@exec;  Push (Char) Data Contained in TOS Addr to TOS
		DSPLYwriteexec
	(LOOP)exec
	$FFF8
	;Sexec

;; REFRESH1
F5B2
	$88; Code
	"REFRESH1"; Name
	$F55E; Backward Link
Const0
	$062C

;; REFRESH2
F5C1
	$88; Code
	"REFRESH2"; Name
	$F5B2; Backward Link
Const0
	$0647

;; LINEsav
F5D0
	$87; Code
	"LINEsav"; Name
	$F5C1; Backward Link
	COLON
	Const1;  Push $0001 onto TOS
	SETcurser
	Const0;  Push $0000 onto TOS
	OVERexec; Duplicate NOS at TOS
	LITexec; Put value that follows on TOS
	$0019
	+exec; Add NOS To TOS
	C!exec;  Store NOS (Char)  to Addr in TOS
	LITexec; Put value that follows on TOS
	$0018
	OVERexec; Duplicate NOS at TOS
	+exec; Add NOS To TOS
	SWAPexec; Swap TOS with NOS
	(DO)exec; Beginning of DO Loop
		$F1C7
		C@exec;  Push (Char) Data Contained in TOS Addr to TOS
		)exec
		C!exec;  Store NOS (Char)  to Addr in TOS
	(LOOP)exec
	$FFF6
	;Sexec

;; LINE#1sav
F606
	$89; Code
	"LINE#1sav"; Name
	$F5D0; Backward Link
	COLON
	$F5BD
	Const1;  Push $0001 onto TOS
	$F5DA
	;Sexec

;; LINE#2sav
F61C
	$89; Code
	"LINE#2sav"; Name
	$F606; Backward Link
	COLON
	$F5CC
	Const2
	$F5DA
	;Sexec

;; #1REFRESH
F632
	$89; Code
	"#1REFRESH" Name
	$F61C; Backward Link
	COLON
	$F5BD
	ConstDISPLAY1; Push $0001 Onto TOS
	w-TYPEexec
	;Sexec

;; #2REFRESH
F648
	$89; Code
	"#2REFRESH"; Name
	$F632; Backward Link
	COLON
	$F5CC
	ConstDISPLAY2; Push $0002 onto TOS
	w-TYPEexec
	;Sexec

;; CHK-DSPLYS
F65E
	$8A; Code
	"CHK-DSPLYS"; Name
	$F648; Backward Link
CHK-DSPLYSexec:
F66B	COLON
	LITexec; Put value that follows on TOS
	$0019
	Const1;  Push $0001 onto TOS
	(DO)exec; Beginning of DO Loop
		LITexec; Put value that follows on TOS
		$00FF
		)exec
		ConstDISPLAY1; Push $0001 Onto TOS
		wx-emitexec
	(LOOP)exec
	$FFF4
	LITexec; Put value that follows on TOS
	$0019
	Const1;  Push $0001 onto TOS
	(DO)exec; Beginning of DO Loop
		LITexec; Put value that follows on TOS
		$00FF
		)exec
		ConstDISPLAY2; Push $0002 onto TOS
		wx-emitexec
	(LOOP)exec
	$FFF4
	;Sexec

;;fTEST
F6FB
	$85; CODE
	"fTEST"; Name
	$F6EC; Backward Link
VarfTEST:
F703 GetVar
	$0674

;; F1
F707
	$82; Code
	"F1"; Name
	$F6FB; Backward Link
ConstF1:
F70C	GetVar
	$003B

;; F2
F710
	$82; Code
	"F2"; Name
	$F707; Backward Link
ConstF2:
F715	GetVar
	$003C

;; F3
F719
	$82; Code
	"F3"; Name
	$F710; Backward Link
ConstF3:
F71E	GetVar
	$003D

;; ENT	
F72C
	$83; code
	"ENT"; Name
	$F722; Backward Link
ConstEnt:
F732	GetVar
	$000D

;; INIT-keyQ
F736
	$89; Code
	"INIT-keyQ"; Name
	$F72C; Backward Link
F742	COLON
	VarKEYTABLE
	LITexec
	$000D
	OVERexec
	C!exec
	1+exec
	LITexec
	$0020
	OVERexec
	C!exec
	LITexec
	$0020
	OVERexec
	1+exec
	C!exec
	VarbufWRT
	!exec
	LITexec
	$55AA
	VarkeyQMARK
	!exec
	Const0
	VarfTEST
	!exec
	;Sexec

;; KEYPADI/O
F776
	$89; Code
	"KEYPADI/O"
	$F736; Backward Link
ConstKEYPADI/O:
F782 GetVar
	$7003

;; Vkey
F786
	$84; Code
	"Vkey
	$F776; Backward Link
VarVkey:
F78D GetVar
	$0676

;; ?KEYPAD
F908
	$87; Code
	"?KEYPAD"; Name
	$F8CE; Backward Link
?KEYPADexec:
F912	COLON
Const0
	ConstKEYPADI/O
	C!exec;  Store NOS (Char)  to Addr in TOS
	ConstKEYPADI/O
	C@exec;  Push (Char) Data Contained in TOS Addr to TOS
	LITexec; Put value that follows on TOS
	$000F
	ANDexec;  AND NOS with TOS
	LITexec; Put value that follows on TOS
	$000F
	XORexec;  XOR NOS with TOS
	0<>exec
	DUPexec; Duplicate TOS
	0=exec; Set TOS to TRUE if 0, ELSE FALSE
	OBRANCHexec; 'IF' Statement: Check TOS... Branch to next ENDIF if 0
	$0008
		Const0
		VarVkey
		!exec; Store NOS to Addr in TOS
	ENDIF
	;Sexec

;; F3key
F9DC
	$85; Code
	"F3key" Name
	$F992; Backward Link
ConstF3key:
F9E4	GetVar
	$0678

;; F2key
F9E8
	$85; Code
	"F2key"; Name
	$F9DC; Backward Link
ConstF2key:
F9F0	GetVar
	$067A

;; F1key
F9F4
	$85; Code
	"F1key"; Name
	$F9E8
ConstF1key:
F9FC	GetVar
	$067C

;; Count
FAC6
	$85; Code
	"Count"; Name
	$FA9A; Backward Link
Countexec:
FACE	$FAD0
	$30EE
	$005F
	$4F6D
	$0026
	$067E
	$C032
	$7EC0
	$3408
	$5C26
	$F27E
	$C032 7EC0 34''' Fix area

;; PRNTOPTI/O
FB95
	$8A; Code
	"PRNTOPTI/O"; Name
	$FB85; Backward Link
VarPRNTOPTI/O;
FBA2	GetVar
	$7002

;; PRNTOPTbit
FBA6
	$8A; Code
	"PRNTOPTbit"; Name
	$FB95; Backward Link
ConstPRNTOPTbit:
FBB3	GetVar
	$0002

;; Terr
FBB7
	$84; Code
	"Terr"
	$FBA6; Backward Link
ConstTerr:
FBBE	GetVar
	$0FA0

;; PRNTIMER
FBCF
	$88; Code
	"PRNTIMER"
	$FBC2; Backward Link
VarPRNTIMER:
FBDA	GetVar
	$067E

;; PBUF!pntr
FBFB
	$89; Code
	"PBUF!pntr"; Name
	$FBED; Backward Link
PBUF!pntr
FC07	GetVar
	$0A82

;; PBUF@pntr
FC1B
	$89; Code
	"PBUF@pntr"; Name
	$FBFB; Backward Link
VarPBUF@pntr:
FC17	GetVar
	$0A84

;; PRNTerr
FC33
	$87; Code
	"PRNTerr"; Name
	$FC26; Backward Link
VarPRNTerr:
FC3D	GetVar
	$0A8A

;; INIT-PORT2
FC50
	$8A; Code
	"INIT-PORT2" Name
	$FC41; Backward Link
INIT-PORT2exec:
5C5D	$FC5F

FC5F		  LDA A #$25
FC61		  STA A $602A   
FC64		  LDA A #$35
FC66		  STA A $602A   
FC69		  LDA A #$45
FC6B		  STA A $602A   
FC6E		  LDA A #$55
FC70		  STA A $602A   
FC73		  LDA A #$15
FC75		  STA A $602A   
FC78		  LDA A #$83
FC7A		  STA A $ModeRegB   
FC7D		  LDA A #$07
FC7F		  STA A $ModeRegB   
FC82		  LDA A #$99
FC84		  STA A $ClkRegB   
FC87		  LDX	#PrintBuf
FC8A		  STX	$0A82   
FC8D		  STX	PBufPtr   
FC90		  LDX	#$55AA
FC93		  STX	$0A8C   
FC96   L_FC96     JMP	NEXT

;; PRNTRDY?
FC99
	$88
	PRNTRDY?
	$FC50
	$FCA6

FCA6   S_FCA6     LDA A   $StatRegB   
FCA9		  AND A   #$04; Xmit Rdy?
FCAB		  BNE	L_FCB0; Yes, Print   
FCAD		  RTS  

FCAE		  FCB	$20,  $0C

FCB0   L_FCB0     LDA A   $PortChg   
FCB3		  AND A   #$04
FCB5		  BNE	L_FCBB   
FCB7		  LDA A   #$FF
FCB9		  BRA	L_FCBC   
FCBB   L_FCBB     CLR A
FCBC   L_FCBC     RTS
  
FCBD   L_FCBD     JMP	NEXT

;; PRNTER!
FCC0
	$87
	PRNTER!
	$FC99
	$FCCC

FCCC   S_FCCC     LDX	#$0000
FCCF		  STX	$0A8A   
FCD2		  LDX	#$0FA0
FCD5		  STX	$067E   
FCD8		  LDX	PBufPtr   
FCDB		  LDA A   $00,X; Get char from PrintBuf
FCDD		  STA A   XmitDtaB   
FCE0		  INX; Incr PBufPtr 
FCE1		  CPX	#$0A7F; End of PrintBuf?
FCE4		  BNE	SavePtr; no   
FCE6		  LDX	#PrintBuf; Point back to beginning
FCE9   SavePtr:   STX	PBufPtr   
FCEC		  RTS
 
FCED   L_FCED     JMP	NEXT

FCF0
	$89
	"CHK-PRINT"
	$FCC0
	$FCFE

FCFE   S_FCFE     LDX	$0A8C   
FD01		  CPX	#$55AA
FD04		  BEQ	L_FD07   
FD06		  RTS
  
FD07   L_FD07   LDA A   $0A88   
FD0A		  BEQ	L_FD1C   
FD0C		  JSR	S_FCA6   
FD0F		  TST A
FD10		  BEQ	L_FD1B   
FD12		  LDX	#$0000
FD15		  STX	$0A88   
FD18		  STX	$0A8A   
FD1B   L_FD1B     RTS
  
FD1C   L_FD1C     LDX	$0A84   
FD1F		  CPX	$0A82   
FD22		  BNE	L_FD2B   
FD24		  LDX	#$0FA0
FD27		  STX	$067E   
FD2A		  RTS
  
FD2B   L_FD2B     JSR	S_FCA6   
FD2E		  TST A
FD2F		  BNE	L_FD42   
FD31		  LDX	$067E   
FD34		  BNE	L_FD3D   
FD36		  LDX	#$FFFF
FD39		  STX	$0A8A   
FD3C		  RTS
 
FD3D   L_FD3D     DEX  
FD3E		  STX	$067E   
FD41		  RTS
  
FD42   L_FD42     JSR	S_FCCC   
FD45		  RTS
 
FD46   L_FD46     JMP	NEXT   

FD49		  FCB	$88,  $50,  $72,  $6E,  $74,  $43,  $68,  $61
FD51		  FCB	$F2,  $FC,  $F0,  $FD,  $56,  $B6,  $0A,  $88
FD59		  FCB	$BA,  $0A,  $8A,  $27,  $05,  $32,  $33

FD60   L_FD60   JMP	NEXT   

FD63		  FCB	$FE,  $0A,  $82,  $32,  $33,  $E7,  $00,  $08
FD6B		  FCB	$8C,  $0A,  $7F,  $26,  $03,  $CE,  $06,  $80
FD73		  FCB	$B6,  $0A,  $8A,  $27,  $03

FD78   L_FD78   JMP	NEXT

;; PRNTcrlf
FEEE
	$88; Code
	"PRNTcrlf" Name
	$FEC5; Backward Link
PRNTcrlfexec:
FEF9	COLON
	LITexec
	$000D
	PRNTCHARexec
	LITexec
	$000A
	PRNTCHARexec
	;Sexec

;; PRINTSTRING
FF09
	$8B; Code
	"PRINTSTRING"; Name
	$FEEE; Backward Link
PRINTSTRINGexec:
FF17	COLON
	OVERexec
	+exec
	SWAPexec
	(DO)exec
	)exec
	C@exec
	PRNTCHARexec
	(LOOP)exec
	$FFF8
	;Sexec
