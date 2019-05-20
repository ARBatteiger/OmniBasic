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
__NullStr db 0,0
_StrConst1 db "x",0
_StrConst2 db "y",0
; End of Initialized Data Section

; Start of Uninitialized Data Section
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
; LN:1 type dt
; LN:6 dim cpx as dt
cpx rb 264
; LN:7 dim cpxarray(10) as dt
cpxarray rb 2640
; LN:8 dim x as long
x rd 1

;Temporary Vector
_TmpVec1 rd 3

;Temporary Vector
_TmpVec2 rd 3

;Temporary Vector
_TmpVec3 rd 3
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

; End of PreCode Section

; LN:10 cpx.a=x
mov esi,cpx; Get base
mov [_TmpVec1],esi; Store vector ptr
mov eax, dword [x]; LoadReg
mov edi,[_TmpVec1]; Get vector ptr
mov [edi],eax; Store Reg0 vector
; LN:11 cpx.a$="x"
;_TmpVec1=a$;
mov esi,cpx; Get base
add edi,[_TmpVec1]; Add vector ptrs
mov [_TmpVec2],edi; Store vector ptr
mov esi,[_TmpVec1+4]; Get vector len
mov [_TmpVec2+4],esi; Store vector len
mov esi,[_TmpVec1+8]; Get vector lnk
mov [_TmpVec2+8],esi; Store vector lnk
mov esi,_StrConst1; Get base
mov [_TmpVec3],esi; Set vector ptr
mov [_TmpVec3+4],2; Set vector length
mov [_TmpVec3+8],0; Set vector link
;_MovStr(&_TmpVec2,&_TmpVec3);
; LN:12 cpxarray(5).a=x
mov esi,cpxarray; Get base
mov eax,5; LoadReg CONSTANT
dec eax; Array Base Adj
imul eax,264; ArrayIndex*DataSize
add esi,eax; Array base+subscript
mov [_TmpVec1],esi; Store vector ptr
mov eax, dword [x]; LoadReg
mov edi,[_TmpVec1]; Get vector ptr
mov [edi],eax; Store Reg0 vector
; LN:13 cpxarray(5).a$="y"
mov esi,cpxarray; Get base
mov eax,5; LoadReg CONSTANT
dec eax; Array Base Adj
imul eax,264; ArrayIndex*DataSize
add esi,eax; Array base+subscript
;_TmpVec2=a$;
add edi,[_TmpVec2]; Add vector ptrs
mov [_TmpVec1],edi; Store vector ptr
mov esi,[_TmpVec2+4]; Get vector len
mov [_TmpVec1+4],esi; Store vector len
mov esi,[_TmpVec2+8]; Get vector lnk
mov [_TmpVec1+8],esi; Store vector lnk
mov esi,_StrConst2; Get base
mov [_TmpVec3],esi; Set vector ptr
mov [_TmpVec3+4],2; Set vector length
mov [_TmpVec3+8],0; Set vector link
;_MovStr(&_TmpVec1,&_TmpVec3);
; LN:15 'print cpx.a$,cpxarray(5).a$
xor eax,eax
invoke ExitProcess, eax
_ErrExit:
mov eax,[_ErrNo]
invoke ExitProcess, eax
; End of Code Section
