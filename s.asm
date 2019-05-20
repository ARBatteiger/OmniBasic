;Compiler Delaration Section

format PE console

entry _Start

include "include\kernel.inc"
include "include\macro\import.inc"
include "include\macro\stdcall.inc"

; End of Declaration Section
section '.data' data readable writeable

_BufSize=300
_CRLF db 13,10
_NullStr db 0,0
_TrueStr db "TRUE",0
_FalseStr db "FALSE",0
; End of Initialized Data Section

; Start of Uninitialized Data Section
_CRLFVec rd 3
_NullStrVec rd 3
_IOBuffer rb _BufSize
_IOBufVec rd 3
_PrintBuf rb _BufSize
_PBufVec rd 3
_ErrVec rd 1
_LoopCtr rd 10
_ErrNo rd 1
_hInstance rd 1
_OutHandle rd 1
XferCount rd 1
STATUS rd 1
POS rd 1
_XferAddr rd 1
_PUArgs rd 15
_ArgCount rw 1
_ArgList rd 1
_ArgNum rd 1
_TestByte rb 1
_Prompt rb 1
_NewLine rb 1
_Poker rd 1
_SrcAddr rd 1
_DestAddr rd 1
_BlkCnt rd 1
_DummyArg rd 1
_Digits rw 1
_Decimals rw 1
_ArgSafe0 rd 1
ArgSafe1 rd 1
_FltArgSafe0 rf 1
_FltArgSafe1 rf 1
_SwitchInt rd 1
_SwitchStr rd 1
_IOPthNum rb 1
_PrtPthNum rb 1
_SafeZone rw 1
_IOBufPtr rd 1
_DataPtr rd 1
_DataPtrSaf rd 1
_ConvBuf rb 22
_CBufVec rd 3
_ConvBuf1 rb 22
_CBuf1Vec rd 3
_ProgramName rb 40
ProgramName rd 3
; LN:1 dim x$ as string
x$ rd 67
; LN:2 dim y$ as string
y$ rd 67
; LN:4 dim a$ as string vector
a$ rd 67
; LN:5 dim b$ as string vector
b$ rd 67

;Temporary Variable
_Tmp1 rd 1

; End of Uninitialized Data Section

section '.idata' import data readable writeable

library kernel32, "kernel32.dll"
kernel32:
	import GetModuleHandle, "GetModuleHandleA", \
		ExitProcess, "ExitProcess", \
		GetStdHandle, "GetStdHandle", \
		WriteConsole, "WriteConsoleA"

; End of Import Section

section '.code' code readable executable
; Main Code Section
_Start:

invoke GetModuleHandle, NULL
mov [_hInstance], eax
invoke GetStdHandle, STD_OUTPUT_HANDLE
mov [_OutHandle], eax
mov [_ErrVec],_ErrExit
mov eax,_IOBuffer
mov [_IOBufVec],eax
mov [_IOBufVec+4],0
mov [_IOBufVec+8],0
mov eax,_NullStr
mov [_NullStrVec],eax
mov [_NullStrVec+4],0
mov [_NullStrVec+8],0
mov eax,_CRLF
mov [_CRLFVec],eax
mov [_CRLFVec+4],0
mov [_CRLFVec+8],0
mov eax,_PrintBuf
mov [_PBufVec],eax
mov [_PBufVec+4],0
mov [_PBufVec+8],0
mov eax,_ConvBuf
mov [_CBufVec],eax
mov [_CBufVec+4],0
mov [_CBufVec+8],0
mov eax,_ConvBuf1
mov [_CBuf1Vec],eax
mov [_CBuf1Vec+4],0
mov [_CBuf1Vec+8],0
mov eax,_ProgramName
mov [ProgramName],eax
mov [ProgramName+4],0
mov [ProgramName+8],0

mov eax,x$+12
mov [x$],eax
mov [x$+4],255
mov [x$+8],0
mov eax,y$+12
mov [y$],eax
mov [y$+4],255
mov [y$+8],0
mov eax,a$+12
mov [a$],eax
mov [a$+4],255
mov [a$+8],0
mov eax,b$+12
mov [b$],eax
mov [b$+4],255
mov [b$+8],0
; End of PreCode Section

; LN:7 setvec a$=addr(x$)
mov esi,[x$]; Get base (common string)
mov eax,esi; Move base to eax
mov [a$],eax; q1
mov [a$+4],255
mov [a$+8],0
; LN:8 setvec b$=addr(y$)
mov esi,[y$]; Get base (common string)
mov eax,esi; Move base to eax
mov [b$],eax; q1
mov [b$+4],255
mov [b$+8],0
; LN:10 a$=a$+b$
mov esi,b$; Get vector addr
mov [a$+8],esi; Save in appended lnk
mov edi,a$; Get dest
mov esi,a$; Get src
call __MovStr; Go do move
xor eax,eax
invoke ExitProcess, eax
_ErrExit:
mov eax,[_ErrNo]
invoke ExitProcess, eax
; End of Code Section
__TrmStr:
xor eax,eax
ret

__PrtUsing:

ret

__ReadBool:

ret

__ReadByte:

ret

__ReadShort:

ret

__ReadLong:

ret

__ReadFlt:

ret

__ReadStr:

ret

__MovArg:

ret

__MovStr:

ret

__CmpStr:

ret

__StrLen:
; Enter with vector addr in esi, receiving var addr in edi
xor ecx,ecx; Clear len ctr
__StrLenGetVec:
mov edx,[esi+4]; Get vec len
mov esi,[esi]; Get vec ptr
__StrLenLp:
mov al,[esi]; Get next str char
cmp al,0; Is it term char?
je __StrLenChkLnk; Yes, check lnk
dec edx; Dec len ctr
je __StrLenChkLnk; Yes, check lnk
inc ecx; Inc len ctr
inc esi; Point to next char
jp __StrLenLp; Go chk next char
__StrLenChkLnk:
mov eax,[esi+8]; Get vec lnk
or eax,eax; Set z flag
jne __StrLenDone; Zero lnk means done
mov esi,eax; Set ptr to lnk
jp __StrLenGetVec; Proc next vector
__StrLenDone:
mov [edi],ecx; Set receiving var
ret

__SubStr:

ret

__MidStr:

ret

__LeftStr:

ret

__RightStr:

ret

__ClrConv:

ret

__AtoD:

ret

__AtoL:

ret

__ZLtoH:

ret

__ZLtoA:

ret

__LtoA:

ret

__DtoA:

ret

__LtoH:

ret

__PrintStr:

ret

__PrintTab:

ret

__InpData:

ret

__BtoA:
; Enter with al as bool 
mov edi,_ConvBuf1; Point to build str
xor al,al; Set z flag
je __BoolFalse; If zero, is false
mov esi,_TrueStr; Point to true str
jp __BldBool; Go build str
__BoolFalse:
mov esi,_FalseStr; Point to false str
__BldBool:
mov al,[esi]; Get char from src
cmp al,0; Is it term char?
je __BtoADone; Yes, all done
mov [edi],al; Put next char in ConvBuf1
inc esi; Point to next char in src
inc edi; Point to next char in dest
jp __BldBool; Go to next char
__BtoADone:
mov [edi],al; Put term char into dest
ret

__LCase:

ret

__UCase:

ret

__Remnant:

ret
