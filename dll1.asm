;Compiler Declaration Section

format PE console DLL

entry !DllEntryPoint

macro align value { rb (value-1) - (rva $ + value-1) mod value }

_BufSize=1000
!Timers equ 1
; End of Declaration Section

; Import Section

include 'include\kernel.inc'
include 'include\user.inc'
include 'include\gdi.inc'
include 'include\comctl.inc'
include 'include\comdlg.inc'
include 'include\shell.inc'
include 'include\cproc.inc'
include 'include\riched.inc'
include 'include\raedit.inc'
include 'include\ragrid.inc'
include 'include\OBComm.inc'
include 'include\DrawProgress.inc'
include 'include\macro\import.inc'
include 'include\macro\export.inc'
include 'include\macro\stdcall.inc'
include 'include\macro\resource.inc'
include 'include\buttonex.inc'
include 'include\wbdll.inc'
include 'include\ravideo.inc'
include 'include\gradprogress.inc'

section '.idata' import data readable writeable

library kernel32,"kernel32.dll",\
        msvcrt,"msvcrt.dll"

kernel32:
	import	ExitProcess,"ExitProcess",\
		GetModuleHandle,"GetModuleHandleA",\
		GetStdHandle,"GetStdHandle"
msvcrt:
	import	puts,"puts"

; End of Import Section

section '.data' data readable writeable

align 4

err dd 0
!ArrayBase dd 1
_ErrVec dd 0
STATUS dd 0
erl dd 0
POS dd 0
Ticks dd 0
XferCount dd 0
CommError dd 0
wparamHigh dw 0
wparamLow dw 0
ScrollValue dw 0
ScrollCode dw 0
_TrueStr db "TRUE",0
_FalseStr db "FALSE",0
_ErrExitMsg db 'Error exit',0
align 4
_IOBuffer dd _IOBuffer+12
 dd 1000
 dd 0
 rb 1000
align 4
_PrintBuf dd _PrintBuf+12
 dd 1000
 dd 0
 rb 1000
align 4
_NullStr dd _NullStr+12
 dd 1
 dd 0
 rb 1
align 4
_CRLF dd _CRLF+12
 dd 2
 dd 0
 rb 2
align 4
_Prompt dd _Prompt+12
 dd 1
 dd 0
 rb 1
align 4
_ConvBuf dd _ConvBuf+12
 dd 32
 dd 0
 rb 32
align 4
_ConvBuf1 dd _ConvBuf1+12
 dd 32
 dd 0
 rb 32
align 4
ProgramName dd ProgramName+12
 dd 28
 dd 0
 rb 28
align 4
_SwitchStr dd _SwitchStr+12
 dd 1000
 dd 0
 rb 1000
; LN:1 ; Dimension Variables
; LN:3 ; Code Section
!ObjectCount dd 0
; End of Initialized Data Section

; Start of Uninitialized Data Section


align 4

; Timer Event Dispatch Vectors
!Timer rd !Timers

_FltArgSafe0 rf 1
_FltArgSafe1 rf 1
_FloatRet rf 1
_LoopCtr rd 10
!hinstance rd 1
!dc rd 1
_InHandle rd 1
_OutHandle rd 1
_IOPthNum rd 1
_XferAddr rd 1
_PUArgs rd 15
_ArgList rd 1
_ArgNum rd 1
_Poker rd 1
_DummyArg rd 1
_Str1VecAddr rd 1
_Str2VecAddr rd 1
_Str1Len rd 1
_Str2Len rd 1
_SubStrLoc rd 1
_SubStrVec rd 3
!FcnVar1 rd 4
!FcnVar2 rd 4
!FcnVar3 rd 4
!FcnVar4 rd 4
!FcnVar5 rd 4
!FcnVar6 rd 4
!FcnVar7 rd 4
_LongRet rd 1
_StringRet rd 3
_ArgSafe0 rd 1
_ArgSafe1 rd 1
_ArgSafe2 rd 1
_ArgSafe3 rd 1
_ArgSafe4 rd 1
_ArgSafe5 rd 1
_ArgSafe6 rd 1
_AccLo rd 1
_AccHi rd 1
!FileHandle rd 1
!FilBufAdr rd 1
!FilBufSiz rd 1
_SwitchInt rd 1
__ByteCounter rd 1
_PrtPthNum rd 1
_DataPtr rd 1
_Decimals rw 1
_Digits rw 1
_BoolRet rb 1
!PassEvent rb 1
AltKey rb 1

; COMM DCB Structure
!DCBlengthOffs equ 0; rd 1
!BaudRateOffs equ 4; rd 1
!fBitsOffs equ 8; rd 1
!fBinaryBit equ 0
!fParityBit equ 1
!fOutxCtsFlowBit equ 2
!fOutxDsrFlowBit equ 3
!fDtrControlLoBit equ 4
!fDtrControlHiBit equ 5
!fDsrSensitivityBit equ 6
!fTXContinueOnXoffBit equ 7
!fOutXBit equ 8
!fInXBit equ 9
!fErrorCharBit equ 10
!fNullBit equ 11
!fRtsControlLoBit equ 12
!fRtsControlHiBit equ 13
!fAbortOnErrorBit equ 14
!wReservedOffs equ 12; rw 1
!XonLimOffs equ 14; rw 1
!XoffLimOffs equ 16; rw 1
!ByteSizeOffs equ 18; rb 1
!ParityOffs equ 19;  rb 1
!StopBitsOffs equ 20; rb 1
!XonCharOffs equ 21; rb 1
!XoffCharOffs equ 22; rb 1
!ErrorCharOffs equ 23; rb 1
!EofCharOffs equ 24; rb 1
!EvtCharOffs equ 25; rb 1
!wReserved1Offs equ 26; rw 1
!HandleOffs equ 28; rd 1
!StatusOffs equ 32; rd 1
!ArrayOffs equ 36; rd 1
!CommReserved1Offs equ 40; rb 1
!CommReserved2Offs equ 41; rb 1
!CommReserved3Offs equ 42; rb 1
!CommReserved4Offs equ 43; rb 1
!UserBaudRateOffs equ 44; rd 1
!UserParityOffs equ 48; rb 1
!UserByteSizeOffs equ 49; rb 1
!UserStopBitsOffs equ 50; rb 1
!UserRTSOffs equ 51; rb 1
!UserDSRCheckOffs equ 52; rb 1
!UserParityCheckOffs equ 53; rb 1
!UserDTROffs equ 54; rb 1
!UserCTSCheckOffs equ 55; rb 1
!PortNameOffs equ 56; rb 32
!CommStatusOffs equ 88; rd 1
!cbInQueOffs equ 92; rd 1
!cbOutQueOffs equ 96; rd 1

align 4

;_FILETIME Structures
!dwLowDateTime1 rd 1
!dwHighDateTime1 rd 1
!dwLowDateTime2 rd 1
!dwHighDateTime2 rd 1

align 4
; LN:2 dim x as long
x rd 1
; End of Uninitialized Data Section

; Start of Control Descriptor Section
section '.code' code readable executable
; Main Code Section
align 4
proc !DllEntryPoint, hinstDLL,fdwReason,lpvReserved
enter
mov	eax,TRUE
endp

; LN:4 x=0
mov dword [x],0
Label1:
Label2:
Label3:

; Automatic END statement
xor eax,eax
invoke ExitProcess, eax
_ErrExit:
cinvoke puts,_ErrExitMsg
mov eax,[err]
invoke ExitProcess, eax
; End of Code Section

; Init Section
_Init:
ret
; End of Init Section

; Function Code Section

; End of Function Section
__MovArg:
mov esi,[_ArgList]
mov edx,[edi+4]
mov edi,[edi]
__MovArg1:
mov al,[esi]
cmp al,32
je __MovArgSpace
mov [edi],al
or al,al
je __MovArgDone
inc esi
inc edi
dec edx
je __MovArgDone
jmp __MovArg1
__MovArgSpace:
xor al,al
mov [edi],al
inc esi
__MovArgDone:
mov [_ArgList],esi
ret

; LN:9 begin export

section '.edata' export data readable

export 'dll1.dll',\
Label1,'Label1',\
Label2,'Label2',\
Label3,'Label3'

; End of Export Section
