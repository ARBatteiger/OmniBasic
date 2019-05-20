;Compiler Delaration Section

format PE console

entry _Start

include "include\kernel.inc"
include "include\macro\import.inc"
include "include\macro\stdcall.inc"

; End of Declaration Section

section '.data' data readable writeable

_BufSize=300
_IOBuffer rb _BufSize
_PrintBuf rb _BufSize
_ErrVec rd _BufSize
_LoopCtr rd 10
_ErrNo dd 0
_hInstance dd 0
_OutHandle dd 0

; LN:1 dim x as byte
x rb 1
; LN:2 dim y as integer
y rw 1
; LN:3 dim z as long
z rd 1
; LN:4 type dt
; LN:9 dim cpx as dt
cpx rb 8
; LN:10 dim cpxarray(100) as dt
cpxarray rb 800

;Temporary Vector
_TmpVec1 rd 3

;Temporary Variable
_Tmp1 rd 1


;Temporary Variable
_Tmp2 rd 1

; End of Data Section

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
mov eax,_ErrExit
mov [_ErrVec],eax

; LN:12 x=33
mov [x],33; LET CONSTANT
; LN:13 cpx.c=200
mov ebx,cpx; Get base
mov [_TmpVec1],ebx; Vectorize
mov eax,[_TmpVec1]; Get vector ptr for cpx
add eax,4; Add member offset
mov [_TmpVec1],eax; Store vector ptr
mov eax,200; LoadReg CONSTANT
mov ebx,[_TmpVec1]; Get vector ptr
mov [ebx],eax; Store Reg0 vector
; LN:14 cpxarray(x+3).c=x-y*7
xor eax,eax; Clear Reg0
mov al, byte [x]; LoadReg
mov edx,3; LoadReg CONSTANT
add eax,edx; ADD operands
mov [_Tmp1],eax; Store Tmp
mov ebx,cpxarray; Get base
mov eax, dword [_Tmp1]; LoadReg
dec eax; Array Base Adj
mov ecx,8; Load DataSize
mul ecx; ArrayIndex*DataSize
add ebx,eax; Array base+subscript
mov [_TmpVec1],ebx; Set array vector
mov eax,[_TmpVec1]; Get vector ptr for cpx
add eax,4; Add member offset
mov [_TmpVec1],eax; Store vector ptr
xor eax,eax; Clear Reg0
mov ax, word [y]; LoadReg
mov edx,7; LoadReg CONSTANT
mov ecx,edx; Setup for MUL
imul edx; MUL operands
mov [_Tmp2],eax; Store Tmp
xor eax,eax; Clear Reg0
mov al, byte [x]; LoadReg
mov edx, dword [_Tmp2]; LoadReg
sub eax,edx; SUB operands
mov ebx,[_TmpVec1]; Get vector ptr
mov [ebx],eax; Store Reg0 vector
; LN:17 x=2
mov [x],2; LET CONSTANT
; LN:18 x=lsl(x,3)
xor eax,eax; Clear Reg0
mov al, byte [x]; LoadReg
mov edx,3; LoadReg CONSTANT
mov cl,dl; Prepare shift count
shl eax,cl; Logical shift left
mov [_Tmp1],eax;
mov eax, dword [_Tmp1]; LoadReg
mov [x],al; Store Reg0
; LN:19 x=lsr(x,2)
xor eax,eax; Clear Reg0
mov al, byte [x]; LoadReg
mov edx,2; LoadReg CONSTANT
mov cl,dl; Prepare shift count
shr eax,cl; Logical shift right
mov [_Tmp1],eax;
mov eax, dword [_Tmp1]; LoadReg
mov [x],al; Store Reg0
; LN:20 x=asl(x,2)
xor eax,eax; Clear Reg0
mov al, byte [x]; LoadReg
mov edx,2; LoadReg CONSTANT
mov cl,dl; Prepare shift count
sal eax,cl; Aritmetic shift left
mov [_Tmp1],eax;
mov eax, dword [_Tmp1]; LoadReg
mov [x],al; Store Reg0
; LN:21 x=asr(x,2)
xor eax,eax; Clear Reg0
mov al, byte [x]; LoadReg
mov edx,2; LoadReg CONSTANT
mov cl,dl; Prepare shift count
sar eax,cl; Aritmetic shift right
mov [_Tmp1],eax;
mov eax, dword [_Tmp1]; LoadReg
mov [x],al; Store Reg0
; LN:22 x=rotl(x,2)
xor eax,eax; Clear Reg0
mov al, byte [x]; LoadReg
mov edx,2; LoadReg CONSTANT
mov cl,dl; Prepare shift count
rol eax,cl; Rotate left
mov [_Tmp1],eax;
mov eax, dword [_Tmp1]; LoadReg
mov [x],al; Store Reg0
; LN:23 x=rotr(x,2)
xor eax,eax; Clear Reg0
mov al, byte [x]; LoadReg
mov edx,2; LoadReg CONSTANT
mov cl,dl; Prepare shift count
ror eax,cl; Rotate right
mov [_Tmp1],eax;
mov eax, dword [_Tmp1]; LoadReg
mov [x],al; Store Reg0
; LN:24 x=rotlc(x,2)
xor eax,eax; Clear Reg0
mov al, byte [x]; LoadReg
mov edx,2; LoadReg CONSTANT
mov cl,dl; Prepare shift count
rcl eax,cl; Rotate left with carry
mov [_Tmp1],eax;
mov eax, dword [_Tmp1]; LoadReg
mov [x],al; Store Reg0
; LN:25 x=rotrc(x,2)
xor eax,eax; Clear Reg0
mov al, byte [x]; LoadReg
mov edx,2; LoadReg CONSTANT
mov cl,dl; Prepare shift count
rcr eax,cl; Rotate right with carry
mov [_Tmp1],eax;
mov eax, dword [_Tmp1]; LoadReg
mov [x],al; Store Reg0
; LN:26 y=asl(y,x)
xor eax,eax; Clear Reg0
mov ax, word [y]; LoadReg
xor edx,edx; Clear Reg1
mov dl, byte [x]; LoadReg
mov cl,dl; Prepare shift count
sal eax,cl; Aritmetic shift left
mov [_Tmp1],eax;
mov eax, dword [_Tmp1]; LoadReg
mov [y],ax; Store Reg0
; LN:28 x=22
mov [x],22; LET CONSTANT
; LN:29 x=x*2
xor eax,eax; Clear Reg0
mov al, byte [x]; LoadReg
mov edx,2; LoadReg CONSTANT
mov ecx,edx; Setup for MUL
imul edx; MUL operands
mov [x],al; Store Reg0
; LN:31 z=addr(x)
mov ebx,x; Get addr of var
mov [_Tmp1],ebx; Save addr in tmp
mov eax, dword [_Tmp1]; LoadReg
mov [z],eax; Store Reg0
; LN:33 x=size(x)
mov [_Tmp1],1; Set tmp to var size
mov eax, dword [_Tmp1]; LoadReg
mov [x],al; Store Reg0
; LN:34 x=size(y)
mov [_Tmp1],2; Set tmp to var size
mov eax, dword [_Tmp1]; LoadReg
mov [x],al; Store Reg0
; LN:35 x=size(z)
mov [_Tmp1],4; Set tmp to var size
mov eax, dword [_Tmp1]; LoadReg
mov [x],al; Store Reg0
; LN:36 y=size(x)
mov [_Tmp1],1; Set tmp to var size
mov eax, dword [_Tmp1]; LoadReg
mov [y],ax; Store Reg0
; LN:37 z=size(y)
mov [_Tmp1],2; Set tmp to var size
mov eax, dword [_Tmp1]; LoadReg
mov [z],eax; Store Reg0
; LN:39 x=lnot(x)
xor eax,eax; Clear Reg0
mov al, byte [x]; LoadReg
not eax; Logical NOT
mov [_Tmp1],eax; StoreD0Tmp
mov eax, dword [_Tmp1]; LoadReg
mov [x],al; Store Reg0
; LN:40 y=lnot(y)
xor eax,eax; Clear Reg0
mov ax, word [y]; LoadReg
not eax; Logical NOT
mov [_Tmp1],eax; StoreD0Tmp
mov eax, dword [_Tmp1]; LoadReg
mov [y],ax; Store Reg0
; LN:41 z=lnot(z)
mov eax, dword [z]; LoadReg
not eax; Logical NOT
mov [_Tmp1],eax; StoreD0Tmp
mov eax, dword [_Tmp1]; LoadReg
mov [z],eax; Store Reg0
; LN:42 x=lnot(z)
mov eax, dword [z]; LoadReg
not eax; Logical NOT
mov [_Tmp1],eax; StoreD0Tmp
mov eax, dword [_Tmp1]; LoadReg
mov [x],al; Store Reg0
xor eax,eax
invoke ExitProcess, eax
_ErrExit:
mov eax,[_ErrNo]
invoke ExitProcess, eax
; End of Code Section
