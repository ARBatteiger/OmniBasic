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
_StrConst1 db "test",0
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
; LN:8 dim cpx as dt
cpx rb 24
; LN:9 dim cpxarray(10) as dt
cpxarray rb 240
; LN:10 dim x as long
x rd 1
; LN:11 dim b$ as string*16
b$ rd 7

;Temporary Vector
_TmpVec1 rd 3

;Temporary Vector
_TmpVec2 rd 3

;Temporary Vector
_TmpVec3 rd 3

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

mov eax,b$+12
mov [b$],eax
mov [b$+4],16
mov [b$+8],0
; End of PreCode Section

; LN:13 cpx.a$=b$
mov esi,0; Get base
mov [_TmpVec1],esi; Set vector ptr
mov [_TmpVec1+4],16; Set vector length
mov [_TmpVec1+8],0; Set vector link
mov esi,cpx; Get base
mov edi,esi; Get vector ptr for cpx
add edi,[_TmpVec1]; Add vector ptrs
mov [_TmpVec2],edi; Store vector ptr
mov esi,[_TmpVec1+4]; Get vector len
mov [_TmpVec2+4],esi; Store vector len
mov esi,[_TmpVec1+8]; Get vector lnk
mov [_TmpVec2+8],esi; Store vector lnk
;_MovStr(&_TmpVec2,&b$);
; LN:14 cpx.a$="test"
mov esi,0; Get base
mov [_TmpVec1],esi; Set vector ptr
mov [_TmpVec1+4],16; Set vector length
mov [_TmpVec1+8],0; Set vector link
mov esi,cpx; Get base
mov edi,esi; Get vector ptr for cpx
add edi,[_TmpVec1]; Add vector ptrs
mov [_TmpVec2],edi; Store vector ptr
mov esi,[_TmpVec1+4]; Get vector len
mov [_TmpVec2+4],esi; Store vector len
mov esi,[_TmpVec1+8]; Get vector lnk
mov [_TmpVec2+8],esi; Store vector lnk
mov esi,_StrConst1; Get base
mov [_TmpVec3],esi; Set vector ptr
mov [_TmpVec3+4],5; Set vector length
mov [_TmpVec3+8],0; Set vector link
;_MovStr(&_TmpVec2,&_TmpVec3);
; LN:16 x=addr(cpx.a$)
mov esi,0; Get base
mov [_TmpVec1],esi; Set vector ptr
mov [_TmpVec1+4],16; Set vector length
mov [_TmpVec1+8],0; Set vector link
mov esi,cpx; Get base
mov edi,esi; Get vector ptr for cpx
add edi,[_TmpVec1]; Add vector ptrs
mov [_TmpVec2],edi; Store vector ptr
mov esi,[_TmpVec1+4]; Get vector len
mov [_TmpVec2+4],esi; Store vector len
mov esi,[_TmpVec1+8]; Get vector lnk
mov [_TmpVec2+8],esi; Store vector lnk
mov eax,esi
mov [x],eax; Store Reg0
; LN:17 x=addr(cpx)
mov esi,cpx; Get base
mov eax,esi
mov [x],eax; Store Reg0
; LN:18 x=addr(cpx.a)
mov esi,cpx; Get base
mov edi,esi; Get vector ptr for cpx
add esi,16; Add member offset
mov [_TmpVec1],esi; Store vector ptr
mov eax,esi
mov [x],eax; Store Reg0
; LN:19 x=addr(cpx.b)
mov esi,cpx; Get base
mov edi,esi; Get vector ptr for cpx
add esi,18; Add member offset
mov [_TmpVec1],esi; Store vector ptr
mov eax,esi
mov [x],eax; Store Reg0
; LN:20 x=addr(cpx.c)
mov esi,cpx; Get base
mov edi,esi; Get vector ptr for cpx
add esi,20; Add member offset
mov [_TmpVec1],esi; Store vector ptr
mov eax,esi
mov [x],eax; Store Reg0
; LN:22 x=addr(cpxarray)
mov esi,cpxarray; Get base
mov [_TmpVec1],esi; Vectorize
mov eax,esi
mov [x],eax; Store Reg0
; LN:23 x=addr(cpxarray(1))
mov esi,cpxarray; Get base
mov eax,1; LoadReg CONSTANT
dec eax; Array Base Adj
imul eax,24; ArrayIndex*DataSize
add edi,eax; Array base+subscript
mov eax,esi
mov [x],eax; Store Reg0
; LN:24 x=addr(cpxarray(1).a)
mov esi,cpxarray; Get base
mov eax,1; LoadReg CONSTANT
dec eax; Array Base Adj
imul eax,24; ArrayIndex*DataSize
add edi,eax; Array base+subscript
mov edi,esi; Get vector ptr for cpx
add esi,16; Add member offset
mov [_TmpVec1],esi; Store vector ptr
mov eax,esi
mov [x],eax; Store Reg0
; LN:25 x=addr(cpxarray(1).b)
mov esi,cpxarray; Get base
mov eax,1; LoadReg CONSTANT
dec eax; Array Base Adj
imul eax,24; ArrayIndex*DataSize
add edi,eax; Array base+subscript
mov edi,esi; Get vector ptr for cpx
add esi,18; Add member offset
mov [_TmpVec1],esi; Store vector ptr
mov eax,esi
mov [x],eax; Store Reg0
; LN:26 x=addr(cpxarray(1).c)
mov esi,cpxarray; Get base
mov eax,1; LoadReg CONSTANT
dec eax; Array Base Adj
imul eax,24; ArrayIndex*DataSize
add edi,eax; Array base+subscript
mov edi,esi; Get vector ptr for cpx
add esi,20; Add member offset
mov [_TmpVec1],esi; Store vector ptr
mov eax,esi
mov [x],eax; Store Reg0
xor eax,eax
invoke ExitProcess, eax
_ErrExit:
mov eax,[_ErrNo]
invoke ExitProcess, eax
; End of Code Section
