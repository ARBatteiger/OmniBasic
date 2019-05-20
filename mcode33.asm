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

;; INIT-DLYTME
39D2
     $8B; Code
     "INIT-DLYTME"
     $39A1; Backward Link
     COLON
     $F27B
     $338A
     $D735
     $D206
     $D5E1
     $D646
     $D5F0
     $F21D
     $C516
     $F21D
     $CA5F
     $C285
     $C5C9
     $C5C1
     $F3AB
     LITEX
     $0005
     $3983
     $F21D
     $CA5F
     $C5C1
     $F4CB
     $F530
     LITEX
     $0004
     $F21D
     $C516
     ;SEX

;; GET[sec]
3A1A
     $88; Code
     GET[sec]; Name
     $39D2; Backward Link
     COLON
     $39E0
     $F912
     $C0A2
     $FFFC
     $32E5
     LITEX
     $002F
     OVEREX
     $C79F
     OVEREX
     LITEX
     $003B
     $C79F
     $C319
     $C0A2
     $0038
     $F21D
     C@EX
     LITEX
     $0004
     $D829
     $C0A2
     $0014
     $F21D
     LITEX
     $0005
     LITEX
     $0020
     $CC21
     $C5B9
     $F21D
     $C516
     $C4AA
     $F21D
     $CA5F
     $C408
     $C516
     $F21D
     C@EX
     $C71D
     $F21D
     $C516
     $39AC
     $F732
     $C78B
     $C0A2
     $FFA6
     $F21D
     $CD2B
     $D7C8
     $338A
     $D74E
     $C483
     $C3A7
     $C5B9
     $338A
     LITEX
     $0004
     $C408
     !EX
     $C3BD
     ;SEX

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
     GetVar; Processing Routine Token
     A/DStatus

;; 20 CONSTANT VIALbit
3AF3
     $87; Code
     "VIALbit"; Name
     $3AE3; Backward Link
     GetVar; Processing Routine Token
     $0020

;; ?VIAL-IN
3B01
     $88; Code
     "?VIAL-IN"; Name
     $3AF3; Backward Link
     COLON
     $3AEF
     C@EX
     $3AFD
     $C319
     $C3DE
     $C4AA
     $2276
     !EX
     ;SEX    

;; ?VIAL-OUT
3B20
     $89; Code
     "?VIAL-OUT"; Name
     $3B01; Backward Link
     COLON
     $3AEF
     C@EX
     $3AFD
     $C319
     $C4AA
     $C3DE
     $2276
     !EX
     $DF50
     ;SEX

;; LMPstat
3B42
     $87; Code
     "LMPstat"; Name
     $3B20; Backward Link
     GetVar; Processing Routine Token
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
     GetVar; Processing Routine Token
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
     GetVar; Processing Routine Token
     $0030

;; AGnd
3BD9
     $84; Code
     "AGnd"; Name
     $3BCA; Backward Link
     GetVar; Processing Routine Token
     $0000

;;; LAMP CONTROL

;;; HEX

;;; 7002 CONSTANT ACQRI/O
3BE4
     $87; Code
     "ACQRI/O"; Name
     $3BD9; Backward Link
3BEE GetVar; Processing Routine Token
     $7002; Constant value

;;; 0 VARIABLE ACQRmode
3BF2
     $88; Code
     "ACQRmode"; Name
     $3BE4; Backward Link
3BFD GetVar; Processing Routine Token
     ACQRmode; Var Addr

;;; 0 VARIABLE LMPERR
3C01
     $87; Code
     "LMPERR"; Name
     $3BF2; Backward Link
3C0A GetVar; Processing Routine Token
     LMPERR; Var Addr

;;; 0 CONSTANT RUNmode
3C0E
     $87; Code    
     "RUNmode"; Name
     $3C01; Backward Link
3C18 GetVar; Processing Routine Token
     $0000; Constant value

;;; 0 VARIABLE flMPERR
3C1C
     $87; Code
     "flMPERR"; Name
     $3C0E; Backward Link
3C26 GetVar; Processing Routine Token
     flMPERR; Var Addr

;;; 60 CONSTANT TESTmode
3C2A
     $88; Code
     "TESTmode"; Name
     $3C1C1; Backward Link
3C35 GetVar; Processing Routine Token
     $0060; Constant value

;;; 20 CONSTANT OSmode
3C39
     $86; Code
     "OSmode"; Name
     $3C2A; Backward Link
3C42 GetVar; Processing Routine Token
     $0020; Constant value

;;; 80 CONSTANT STARTacqr
3C46
     $89; Code
     "STARTacqr"; Name
     $3C39; Backward Link
3C52 GetVar; Processing Routine Token
     $0080; Constant value

;;; 7F CONSTANT LMPreset
3C56
     $88; Code
     "LMPreset"; Name
     $3C46; Backward Link
3C61 GetVar; Processing Routine Token
     $007F; Constant value

;;; 0 VARIABLE #LMPERR
3C65
     $87; Code
     "#LMPERR"; Name
     $3C56; Backward Link
3C6F GetVar; Processing Routine Token
     #LMPERR; Var Addr

;;; 40 CONSTANT LMPDtaRdy
3C73
     $89; Code
     "LMPDtaRdy"; Name
     $3C65; Backward Link
3C7F GetVar; Processing Routine Token
     $0040; Constant value

;;; 0 VARIABLE TRIGerr
3C83
     $87; Code
     "TRIGerr"; Name
     $3C73; Backward Link
3C8D GetVar; Processing Routine Token
     TRIGerr; Var Addr

;;; 0 VARIABLE TRIGDLY
3C91
     $87; Code
     "TRIGDLY"; Name
     $3C83; Backward Link
3C9B GetVar; Processing Routine Token
     TRIGDLY; Var Addr
     
;;; DECIMAL

;;; : TRIGER-LAMP @ LMPreset AND ( Set bit for lamp HV reset)
3C9F
     $8B; Code
     "TRIGER-LAMP"; Name
     $3C91; Backward Link
     COLON
     $3B4C
     $C4E7
     $3C61
     $C319
     $C4AA
     $3BEE
     $C516
     $3C9B
     $C4E7
     LITEX
     $0032
     $C83F
     $E683
     $3C52
     $C32A
     $C4AA
     $3B4C
     !EX
     $3BEE
     $C516
     ;SEX

;; : LMPFAIL -1 fABORT ! -1 TRIGerr ! fTEST @ 0=
3CD9
     $87
     "LMPFAIL"
     $3C9F; Backward Link
     COLON
     LITEX
     $FFFF
     $2227
     !EX
     LITEX
     $FFFF
     $3C8D; Points to Processing Routine for TRIGerr followed by Var Addr
     !EX
     $F703
     $C4E7
     $C3DE
     $OBRANCHEX
     $0008
     $25C1
     $F4BC
     $F51E
     ;SEX

;; FIRE-LAMP
3D07
     $89
     "FIRE-LAMP"
     $3CD9; Backward Link
     COLON
     $C5B9
     $3C0A
     !EX
     LITEX
     $FFFF
     $3C26
     !EX
     $3CAD
     $C5B9
     $C71D
     $C4AA
     LITEX
     $000A
     $C7BD
     $3AD0
     C@EX
     LITEX
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
     GetVar
     $0EE0

;; 'GET[Sig] 
3E65
     $89
     "'GET[Sig]"
     $3E58; Backward Link
     GetVar
     $0EE2

;; #PRIMES
3E75
     $87
     "#PRIMES"
     $3E65; Backward Link
     GetVar
     $0EE4

;; SET[Offset]
3E83
     $8B; Code
     "SET[Offset]"; Name
     $3E75; Backward Link
     COLON
     $3B4C
     $C4E7
     $C4AA
     $3E61
     !EX
     LITEX
     $009F
     $C319
     LITEX
     $0020
     $C32A
     $3B4C
     !EX
     ;SEX

;; SET[Normal]
3EAF
     $8B; Code
     "SET[Normal]"; Name    
     $3E83; Backward Link
     COLON
     $3E61
     $C4E7
     $3B4C
     !EX
     ;SEX

;; PRIME-LAMP-CONTROL
3EC9
     $92
     "PRIME-LAMP-CONTROL" 
     $3EAF; Backward Link
     COLON
     $3E7F
     $C4E7
     $C5B9
     $(DO)EX
     $3CAD  
     $(LOOP)EX
     $FFFC
     ;SEX

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

3F0E   S_3F0E   LDA A   $0EC5   
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
3F66            STX     $0EC8   
3F69   L_3F69   LDA A   $0EC8   
3F6C            LDA B   $0EC9   
3F6F            ORA A   $0EC6   
3F72            ORA B   $0EC7   
3F75            STA A   $0EC8   
3F78            STA B   $0EC9   
3F7B            JSR     S_3F0E   
3F7E            LDA A   A/DStatus   
3F81            BMI     L_3F95   
3F83            LDA A   $0EC8   
3F86            LDA B   $0EC9   
3F89            EOR A   $0EC6   
3F8C            EOR B   $0EC7   
3F8F            STA A   $0EC8   
3F92            STA B   $0EC9   
3F95   L_3F95   CLC  
3F96            ROR     $0EC6   
3F99            ROR     $0EC7   
3F9C            DEC     $0EEA   
3F9F            LDA A   $0EEA   
3FA2            BNE     L_3F69   
3FA4            LDA A   $0EC8   
3FA7            LDA B   $0EC9   
3FAA            JMP     PUSHD
     
3FAD   L_3FAD   JSR     S_3F30   
3FB0            JMP     NEXT

;; Large Forth Block Here

; Self test RAM Check

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

;;; CODE ERRxab
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

;; FORTH

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
   
;; 2000 CONSTANT RAMEND
5109
     $85; Code
     "RAMEND"; Name
     $50A6; Backward Link
     GetVar; Processing Routine Token
     $2000; Constant value

;; 0000 CONSTANT RMSTRT
5115
     $86; Code
     "RMSTRT"; Name
     $5109; Backward Link
     GetVar; Processing Routine Token
     $0000

;; CLR-RAM
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

;; CHKRAM
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
516A            CLR     fNMIOFF' Enable NMI  
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

;;;  :LMPCHK
517C
     $86; Code
     "LMPCHK"; Name
     $5170; Backward Link
     COLON
     LITEX
     $0010
     $3E7F
     !EX
     $3EDE
     LITEX
     $0032
     $24CD
     $C4E7
     !EX
     $C5B9
     $3C6F
     !EX
     LITEX
     $0000
     LITEX
     $0000
     LITEX
     $000A
     $C5B9
     $C113
     $24E0
     $C4E7
     EXECUTEEX
     $469C
     $C5B9
     $C419
     $3C26
     $C4E7
     $C0A2
     $0008
     $C5C1
     $3C6F
     $C4B8
     $C0CE
     $FFE4
     ;SEX

;;; : SELFTEST 0 fABORT ! 0 #LMPERR ! CHK-DSPLS 3 DELAY[sec]
51D1
     $88
     "SELFTEST"; Name
     $517C
     COLON
     $C5B9
     $2227
     !EX
     $C5B9
     $3C6F
     !EX
     $F66B
     $C5D1
     $E6A8
     $2572
     $F4BC
     $F51E
     $260E
     $F4CB
     $F51E
     $C5C9
     $E6A8
     $2635
     $FACE
     $4FDF
     $23F5
     $C4E7
     EXECUTEEX
     $C71D
     $C0A2
     $0008
     $503E
     $C096
     $0004
     $501F
     $264E
     $FACE
     $4FDF
     $240B
     $C4E7
     EXECUTEEX
     $C71D
     $C0A2
     $0008
     $503E
     $C096
     $0004
     $501F
     $512C
     $2666
     $FACE
     $4FDF
     $5144
     $C3DE
     $C0A2
     $0008
     $503E
     $C096
     $0004
     $501F
     $267E
     LITEX
     $000A
     $4FDF
     $5185
     $D7C8
     $C275
     $CAD3
     $04	; Msg Bytes
     "REF="
     LITEX
     $000A
     $E018
     $D692
     LITEX
     $03E8
     LITEX
     $0000
     $DFA5
     $3C6F
     $C4E7
     $C4AA
     $CAD3
     $0E	; Msg Bytes
     "LAMP FAILURES="
     $D6A0
     LITEX
     $0005
     $C7BD
     $C32A
     $C0A2
     $0008
     $503E
     $C096
     $0004
     $501F
     ;SEX

;;; :FXCLOCK
52A2
     $87; Code
     "FXCLOCK"; Name
     $51D1; Backward Link
     COLON
     ;SEX

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
;;;       IF CR."CLOCK DATA RDY ERROR" QUIT THEN;
5411
     $87; Code
     "?CLKerr"; Name
     $5407; Backward Link
     COLON
     $C5C1
     $5403
     $C4B8
     $5403
     $C4E7
     LITEX
     $03E8
     $C7BD
     $C0A2
     $001D
     $C275
     $CAD3
     $14	; Msg Bytes
     "CLOCK DATA RDY ERROR"
     $CF86
     ;SEX

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

;; !CLKDTA
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

;; :@TSTBYTE
54A1
     $88; Code
     "@TSTBYTE"; Name
     $5483; Backward Link
     COLON
     $53E6
     $548D
     ;SEX

;; !TSTBYTE
54B4
     $88; Code
     "!TSTBYTE"; Name
     $54A1; Backward Link
     COLON
     $53E6
     $5471
     ;SEX
     $87

;; @RUNDLY
54C7
     $87; Code
     "@RUNDLY"; Name
     $54B4; Backward Link
     COLON
     $53D7
     $548D
     LITEX
     $0100
     $D149
     $53D7
     $C71D
     $548D
     $C32A
     ;SEX

;; !RUNDLY
54E7
     $87; Code
     "!RUNDLY"; Name
     $57C7; Backward Link
     COLON
     $C4AA
     LITEX
     $0100
     $D192
     $53D7
     $5471
     $53D7
     $C71D
     $5471
     ;SEX

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

;;; @SMPL# ...
554B
     $86; Code
     "@SMPL#"; Name
     $5529; Backward Link
     COLON
     $53BA
     $548D
     LITEX
     $0100
     $D149
     $53C9
     $548D
     $C32A
     ;SEX

;;; !SMPL# ...
5568
     $86; Code
     "!SMPL#"; Name
     $554B; Backward Link
     COLON
     LITEX
     $0100
     $D15A
     $53BA
     $5471
     $53C9
     $5471
     ;SEX

;;; +!SMPL# ...
5583
     $87; Code
     "+!SMPL#"; Name
     $5568; Backward Link
     COLON
     $5554
     $C408
     $5571
     ;SEX

;;; :CNVRTdate ...
5597
     $89; Code
     "CNVRTdate"; Name
     $5583; Backward Link
     COLON
     $530F
     $548D
     $C5B9
     LITEX
     $0064
     $DFE1
     $5300
     $548D
     $C5B9
     $C419
     LITEX
     $0064
     $DFE1
     $531B
     $548D
     $C5B9
     $C419
     $D5E1
     $D61E
     $D61E
     LITEX
     $002F
     $CC61
     $D61E
     $D61E
     LITEX
     $002F
     $CC61
     $D646
     $D5F0
     ;SEX

;;; :CNVRTtime ...
55E3
     $89; Code
     "CNVRTtime"; Name
     $5597; Backward Link
     COLON
     $52F3
     $548D
     $C4AA
     LITEX
     $007F
     $C7BD
     $540D
     !EX
     LITEX
     $007F
     $C319
     $C5B9
     LITEX
     $0064
     $DFE1
     $52E6
     $548D
     $C5B9
     $C419
     LITEX
     $0064
     $DFE1
     $52D9
     $548D
     $C5B9
     $C419
     $D5E1
     $D61E
     $D61E
     LITEX
     $003A
     $CC61
     $D61E
     $D61E
     LITEX
     $003A
     $CC61
     $D646
     $D5F0
     ;SEX

;;; :!CLKBUFx CLKBUF +1 - C!;
5641
     $88
     "!CLKBUFx"; Name
     $55E3; Backward Link
     COLON
     $2234
     $C408
     $D6F7
     $C516
     ;SEX

;;; :GET-SMPL# RTCday @CLKDTA DAY0 @CLKDTA OVER DAY0 !CLKDTA <>
       IF 1 !SMPL# ELSE 1 +!SMPL# THEN @SMPL#
5658
     $89; Code
     "GET-SMPL#"; Name
     $5641; Backward Link
     COLON
     $5300
     $548D
     $539E
     $548D
     OVEREX
     $539E
     $5471
     $D7EE
     $C0A2
     $000A
     $C5C1
     $5571
     $C096
     $0006
     $C5C1
     $558D
     $5554
     ;SEX     

;;; CLKTST STRTCLK ...
568A'''
     $86; Code
     "CLKTST"; Name
     $5658; Backward Link
     COLON
     $5533
     $C275
     $CAD3
     $015B
     $55A3
     $CA72
     $CAD3
     $0120
     $55EF
     $CA72
     $CAD3
     $025D
     $20C0
     $5D00
     $0EC0
     $5D00
     $0AC1
     $13C0
     $5D00
     $20C2
     $38C1
     $3054
     $8DC5
     $B9C9
     $B9D5
     $E1D6
     $1ED6
     $1ED5
     $F0C9
     $CECA
     $72CA
     $D301
     $48C0
     $CEFF
     $E0C2
     $67C4
     $AAC0
     $A200
     $0CC4
     $83C2
     $50C0
     $5D00
     $1BC7
     $8BC0
     $A2FF
     $A9C3
     $7E;????????? out of sync... $C37E would be correct

;;; :CLR-NUMBER ...
56F2
     $8A: Code
     "CLR-NUMBER"; Name
     $568A; Backward Link
     COLON
     $F27B
     $F21D
     $C71D
     $F23B
     !EX
     $F4DD
     $C4E7
     $C71D
     $3371
     $C4E7
     $C113
     LITEX
     $0020
     $C130
     $F4CB
     $F554
     $C0CE
     $FFF4
     $3371
     $C4E7
     $F4DD
     !EX
     ;SEX    

;;; :get[num] ...
572F
     $88; Code
     "get[num]"; Name
     $56F2; Backward Link
     COLON
     $F4DD
     $C4E7
     $337C
     $C4E7
     $C7BD
     $C0A2
     $000E
     $C5B9
     $F23B
     !EX
     $C5B9
     $33D5
     !EX
     $F912
     $C0A2
     $FFFC
     $32E5
     LITEX
     $002F
     OVEREX
     $C79F
     OVEREX
     LITEX
     $003A
     $C79F
     $C319
     $C0A2
     $0038
     $F23B
     $C4E7
     $C3DE
     $C0A2
     $0004
     $56FF
     $C4AA
     $F4DD
     $C4E7
     $F4CB
     $F554
     $C5C1
     $F4DD
     $C4B8
     LITEX
     $005F
     $F4DD
     $C4E7
     $F4CB
     $F554
     $C4AA
     $F23B
     $C4E7
     $C516
     $C5C1
     $F23B
     $C4B8
     $F4DD
     $C4E7
     $337C
     $C4E7
     $C7BD
     $C0A2
     $000E
     LITEX
     $0020
     $F4DD
     $C4E7
     $F4CB
     $F554
     $F732
     $C78B
     $C0A2
     $FF72
     ;SEX

;;; :SET-INITVLU (n--) 0 INITVLU 2! 0 INITVLU 4 + !;
57CE
     $8B; Code
     "SET-INITVLU"; Name
     $572F; Backward Link
     COLON
     $C5B9
     $338A
     $D74E
     $C5B9
     $338A
     LITEX
     $0004
     $C408
     !EX
     ;SEX

;;; :GET[num] (--n) ...
57F2
     $88; Code
     "GET[num]"; Name
     $57CE; Backward Link
     COLON
     $F27B
     $C5B9
     $33D5
     !EX
     $C5B9
     $33A4
     !EX
     $C5B9
     $33B0
     !EX
     $338A
     $D735
     $338A
     LITEX
     $0004
     $C408
     $C4E7
     $34A1
     $D7C8
     $F21D
     $C71D
     $C491
     $C285
     $3371
     $C4E7
     $F4CB
     $F530
     $3371
     $C4E7
     $C71D
     $337C
     !EX
     $337C
     $C4E7
     $C71D
     $F4DD
     !EX
     $573A
     $F21D
     $CD2B
     $D7C8
     $338A
     $D74E
     $C483
     $C3A7
     $C6DF
     $C4E7
     $C5B9
     $C83F
     $C438
     $338A
     LITEX
     $0004
     $C408
     !EX
     $C3BD
     ;SEX

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
     LITEX
     $0006
     LITEX
     $0008
     $F4BC
     $F56E
     $55EF
     LITEX
     $0011
     LITEX
     $0008
     $F4BC
     $F56E
     $5533
     ;SEX

;;; :?F3KEY DaTmDSPLY ...
58AC
     $86; Code
     "?F3KEY"; Name
     $587C; Backward Link
     COLON
     $5888
     $52D9
     $548D
     $5878
     $C4E7
     OVEREX
     $5878
     !EX
     $D7EE
     $C0A2
     $0004
     $5888
     $F912
     $C4AA
     $C0A2
     $0020
     $C483
     $32E5
     $F70C
     OVEREX
     $C78B
     OVEREX
     $F71E
     $C78B
     $C32A
     $C4AA
     $C3DE
     $C0A2
     $0006
     $C491
     $C483
     $C0A2
     $FFC2
     $F71E
     $C78B
     ;SEX

;;; :?CHNGtime ...
58FF
     $89; Code
     "?CHNGtime"; Name
     $58AC; Backward Link
     COLON
     $2E76
     $F4CB
     $F51E
     $58B5
     ;SEX

;;; :?PM ...
5917
     $83; Code
     "?PM"; Name
     $58FF; Backward Link
     COLON
     $2E9C
     $F4CB
     $F51E
     $58B5
     ;SEX

;;; ?DaTmOK ...
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
     ;SEX

;;; :NEWTIME ...
5945
     $87; Code
     "NEWTIME"; Name
     $5929; Backward Link
     COLON
     $5511
     $C5B9
     $52D9
     $5471
     $C5C9
     $F3DB
     $2EEC
     $FACE
     $C4AA
     $C72A
     $C4AA
     $3371
     !EX
     $C72A
     $337C
     !EX
     $C5C1
     $F4CB
     $F530
     $C5B9
     $C483
     $52F3
     $548D
     LITEX
     $007F
     $C319
     $57DC
     $57FD
     $C4AA
     LITEX
     $000D
     $C79F
     $C0A2
     $FFE6
     $53F3
     !EX
     $C5C9
     $F3DB
     $2EFC
     $FACE
     $C4AA
     $C72A
     $C4AA
     $3371
     !EX
     $C72A
     $337C
     !EX
     $C5C1
     $F4CB
     $F530
     $C5B9
     $C483
     $52E6
     $548D
     $57DC
     $57FD
     $C4AA
     LITEX
     $003C
     $C79F
     $C0A2
     $FFEC
     $52E6
     $5471
     $591D
     $C0A2
     $000A
     LITEX
     $0080
     $C096
     $0004
     $C5B9
     $53F3
     $C4E7
     $C408
     $52F3
     $5471
     $5533
     ;SEX

;;; :NEWDATE ...
59F1
     $87; Code
     "NEWDATE"; Name
     $5945; Backward Link
     COLON
     $5511
     $C5C9
     $F3DB
     $2EBF
     $FACE
     $C4AA
     $C72A
     $C4AA
     $3371
     !EX
     $C71D
     $337C
     !EX
     $C5C1
     $F4CB
     $F530
     $530F
     $548D
     $57DC
     $57FD
     $530F
     $5471
     $C5C9
     $F3DB
     $2ECF
     $FACE
     $C4AA
     $C72A
     $C4AA
     $3371
     !EX
     $C71D
     $337C
     !EX
     $C5C1
     $F4CB
     $F530
     $5300
     $548D
     $57DC
     $57FD
     $5300
     $5471
     $C5C9
     $F3DB
     $2EDD
     $FACE
     $C4AA
     $C72A
     $C4AA
     $3371
     !EX
     $C71D
     $337C
     !EX
     $C5C1
     $F4CB
     $F530
     $531B
     $548D
     $57DC
     $57FD
     $531B
     $5471
     $5533
     ;SEX

;;; :INIT-RTC
5A81
     $88; Code
     "INIT-RTC"; Name
     $59F1; Backward Link
     COLON
     $5393
     $534F
     $C32A
     $5365
     $5471
     $5387
     $535A
     $5471
     $5370
     $548D
     $C483
     $C5C1
     $5571
     $537B
     $548D 
     $C483 
     $5533
     ;SEX

;;; :?CLKDTAok ...
5AB2
     $89; Code
     "?CLKDTAok"; Name
     $5A81; Backward Link
     COLON
     $537B
     $548D
     $53AB
     $C319
     $D844
     ;SEX 

;;; :DATE/TIME ...
5ACC
     $89; Code
     "DATE/TIME"; Name
     $5AB2; Backward Link
     COLON
     LITEX
     $FFFF
     $2201
     !EX
     $5533
     $537B
     $548D
     $53AB
     $C319
     $C0A2 
     $0022
     $5933
     $C0A2
     $000A
     $C5B9
     $2201
     !EX
     $D6BB
     $590B
     $C0A2
     $0008
     $594F
     $C096
     $0004
     $59FB
     $C096
     $000E
     $5A8C
     $2E2A
     $F4BC
     $F51E
     $59FB
     $594F
     $C5B9
     $C0A2
     $FFC4
     ;SEX

;; CkROM2
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
LITEX
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
EXECUTEEX:
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
BRANCHEX
C0A9 $C0AB

;; OBRANCH
C098
     $87
     "OBRANCH"
     $C08D
OBRANCHEX
C0A2 $C0A4

C0A4   L_C0A4   PUL A
C0A5            PUL B
C0A6            ABA  
C0A7            BNE     L_C0BC   
C0A9            BCS     L_C0BC   
C0AB   L_C0AB   LDX     XSafe   
C0AD            LDA B   $03,X
C0AF            LDA A   $02,X
C0B1            ADD B   XSafe+1   
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
(LOOP)EX
C0CE $C0D0

C0D0   L_C0D0   CLR A
C0D1            LDA B   #$01
C0D3            BRA     L_C0E3   

;; (+LOOP)
C0D5
     $87
     "(+LOOP)"
     $C0C5
(+LOOP)EX
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
(DO)EX
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
DIGITEX
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
(FIND)EX
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
ENCLOSEEX
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
     $C23A

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
     $C277


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
     $C31B

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
     $C32C

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
XOREX:
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
;SEX:
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
     $82
     "R>"
     $C3A2
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
     $81
     "R"
     $C3B8
     $C3D2

C3D2   L_C3D2   LDX     $00EE   
C3D4            INX  
C3D5            INX  
C3D6            JMP     L_C02E

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
     $C3F3

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
     $C40A

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
     $C43A

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
OVEREX
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
     $C485

C485   L_C485   INS  
C486            INS  
C487   L_C487   JMP     NEXT   

;; SWAP
C48A
     $84
     "SWAP"
     $C47C
SWAPEX
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
     $C4AC

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
C4CC
     $86
     "TOGGLE"
     $C4B3
     COLON
     OVEREX
     C@EX
     XOREX
     SWAPEX
     $C516
     ;SEX
     $81C0
     $C4CC
     $C4E9

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
C@EX:
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
!EX:
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
     $C518

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
COLONEX:
C53A COLON

C53C   COLON    LDX     $00EE   
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

;; 0
C5B5
     $81
     "0"
     $C59B
     GetVar
;;;;;;;;;;

;; 1
C5BD
     $81
     "1"
     $C5B5
     GetVar
;;;;;;;;;;

;; 2
C5C5
     $81
     "2"
     $C5BD
     GetVar
;;;;;;;;;;

;; 3
C5CD
     $81
     "3"
     $C5C5
     GetVar
;;;;;;;;;;

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
     $C778

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
     $C78D

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
     $C7A1

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
     SWAPEX
     $C7D8
     ;SEX

;; ROT
C7FF
     $83
     "ROT"
     $C7F2
     COLON
     $C3A7
     SWAPEX
     $C3BD
     SWAPEX
     ;SEX

;; SPACE
C811
     $85
     "SPACE"
     $C7FF
     COLON
;;;;;;;;;;

;; MIN
C821
     $83
     "MIN"
     $C811
     COLON
;;;;;;;;;;

;; MAX
C839
     $83
     "MAX"
     $C821
     COLON
;;;;;;;;;;

;; -DUP
C851
     $84
     "-DUP"
     $C839
     COLON
;;;;;;;;;;

;; TRAVERSE
C864
     $88
     "TRAVERSE"
     $C851
     COLON
;;;;;;;;;;

;; LATEST
C88A
     $86
     "LATEST"
     $C864
     COLON
;;;;;;;;;;

;; LFA
C89D
     $83
     "LFA"
     $C88A
     COLON
;;;;;;;;;;

;; CFA
C8AC
     $83
     "CFA"
     $C89D
     COLON
;;;;;;;;;;

;; NFA
C8BA
     $83
     "NFA"
     $C8AC
     COLON
;;;;;;;;;;

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


