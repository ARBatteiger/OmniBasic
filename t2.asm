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
; LN:4 dim b(10000) as integer
b rw 10000
; LN:5 dim bool as boolean
bool rb 1
; LN:6 dim ba(10000) as boolean
ba rb 10000
; LN:7 dim p(10) as long
p rd 10

;Temporary Variable
_Tmp1 rd 1


;Temporary Vector
_TmpVec1 rd 3

;Temporary Vector
_TmpVec2 rd 3
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

; LN:9 bool=TRUE
mov [bool],255; LET CONSTANT
; LN:10 bool=FALSE
mov [bool],0; LET CONSTANT
; LN:11 bool=not(bool)
mov al, byte [bool]; LoadReg
not al; BOOLEAN NOT
mov [_Tmp1],eax; StoreD0Tmp
mov al, byte [_Tmp1]; LoadReg
mov [bool],al; Store Reg0
; LN:12 ba(7)=not(bool)
mov ebx,ba; Get base
mov eax,7; LoadReg CONSTANT
dec eax; Array Base Adj
add ebx,eax; Array base+subscript
mov [_TmpVec1],ebx; Set array vector
mov al, byte [bool]; LoadReg
not al; BOOLEAN NOT
mov [_Tmp1],eax; StoreD0Tmp
mov al, byte [_Tmp1]; LoadReg
mov ebx,[_TmpVec1]; Get vector ptr
mov [ebx],al; Store Reg0 vector
; LN:13 ba(3)=not(ba(5))
mov ebx,ba; Get base
mov eax,3; LoadReg CONSTANT
dec eax; Array Base Adj
add ebx,eax; Array base+subscript
mov [_TmpVec1],ebx; Set array vector
mov ebx,ba; Get base
mov eax,5; LoadReg CONSTANT
dec eax; Array Base Adj
add ebx,eax; Array base+subscript
mov [_TmpVec2],ebx; Set array vector
mov ebx,[_TmpVec2]; Load vector ptr
mov al, byte [ebx]; LoadReg vector
not al; BOOLEAN NOT
mov [_Tmp1],eax; StoreD0Tmp
mov al, byte [_Tmp1]; LoadReg
mov ebx,[_TmpVec1]; Get vector ptr
mov [ebx],al; Store Reg0 vector
; LN:15 const a=123
; LN:17 inc b(3)
mov ebx,b; Get base
mov eax,3; LoadReg CONSTANT
dec eax; Array Base Adj
mov ecx,2; Load DataSize
mul ecx; ArrayIndex*DataSize
add ebx,eax; Array base+subscript
mov [_TmpVec1],ebx; Set array vector
mov ebx,[_TmpVec1]; Load ebx from vector
inc word [ebx]; INC/DEC operand
; LN:18 dec b(4)
mov ebx,b; Get base
mov eax,4; LoadReg CONSTANT
dec eax; Array Base Adj
mov ecx,2; Load DataSize
mul ecx; ArrayIndex*DataSize
add ebx,eax; Array base+subscript
mov [_TmpVec1],ebx; Set array vector
mov ebx,[_TmpVec1]; Load ebx from vector
dec word [ebx]; INC/DEC operand
; LN:20 p(5)=b(22)
mov ebx,p; Get base
mov eax,5; LoadReg CONSTANT
dec eax; Array Base Adj
mov ecx,4; Load DataSize
mul ecx; ArrayIndex*DataSize
add ebx,eax; Array base+subscript
mov [_TmpVec1],ebx; Set array vector
mov ebx,b; Get base
mov eax,22; LoadReg CONSTANT
dec eax; Array Base Adj
mov ecx,2; Load DataSize
mul ecx; ArrayIndex*DataSize
add ebx,eax; Array base+subscript
mov [_TmpVec2],ebx; Set array vector
mov ebx,[_TmpVec2]; Load vector ptr
xor eax,eax; Clear Reg0
mov ax, word [ebx]; LoadReg vector
mov ebx,[_TmpVec1]; Get vector ptr
mov [ebx],eax; Store Reg0 vector
; LN:22 x=6
mov [x],6; LET CONSTANT
; LN:23 y=7
mov [y],7; LET CONSTANT
; LN:24 z=b(x)+b(y)
mov ebx,b; Get base
xor eax,eax; Clear Reg0
mov al, byte [x]; LoadReg
dec eax; Array Base Adj
mov ecx,2; Load DataSize
mul ecx; ArrayIndex*DataSize
add ebx,eax; Array base+subscript
mov [_TmpVec1],ebx; Set array vector
mov ebx,b; Get base
xor eax,eax; Clear Reg0
mov ax, word [y]; LoadReg
dec eax; Array Base Adj
mov ecx,2; Load DataSize
mul ecx; ArrayIndex*DataSize
add ebx,eax; Array base+subscript
mov [_TmpVec2],ebx; Set array vector
mov ebx,[_TmpVec1]; Load vector ptr
xor eax,eax; Clear Reg0
mov ax, word [ebx]; LoadReg vector
mov ebx,[_TmpVec2]; Load vector ptr
xor edx,edx; Clear Reg1
mov dx, word [ebx]; LoadReg vector
add eax,edx; ADD operands
mov [z],eax; Store Reg0
; LN:26 inc b(y)
mov ebx,b; Get base
xor eax,eax; Clear Reg0
mov ax, word [y]; LoadReg
dec eax; Array Base Adj
mov ecx,2; Load DataSize
mul ecx; ArrayIndex*DataSize
add ebx,eax; Array base+subscript
mov [_TmpVec1],ebx; Set array vector
mov ebx,[_TmpVec1]; Load ebx from vector
inc word [ebx]; INC/DEC operand
; LN:28 inc x
inc [x]; INC/DEC operand
; LN:29 dec x
dec [x]; INC/DEC operand
; LN:30 inc y
inc [y]; INC/DEC operand
; LN:31 dec y
dec [y]; INC/DEC operand
; LN:32 inc z
inc [z]; INC/DEC operand
; LN:33 dec z
dec [z]; INC/DEC operand
; LN:35 x=a
mov [x],123; LET CONSTANT
; LN:37 z=x+x&y
xor eax,eax; Clear Reg0
mov al, byte [x]; LoadReg
xor edx,edx; Clear Reg1
mov dx, word [y]; LoadReg
and eax,edx; AND operands
mov [_Tmp1],eax; Store Tmp
xor eax,eax; Clear Reg0
mov al, byte [x]; LoadReg
mov edx, dword [_Tmp1]; LoadReg
add eax,edx; ADD operands
mov [z],eax; Store Reg0
; LN:39 z=x+land(x,y)
xor eax,eax; Clear Reg0
mov al, byte [x]; LoadReg
xor edx,edx; Clear Reg1
mov dx, word [y]; LoadReg
and eax,edx; AND operands
mov [_Tmp1],eax; StoreD0Tmp
xor eax,eax; Clear Reg0
mov al, byte [x]; LoadReg
mov edx, dword [_Tmp1]; LoadReg
add eax,edx; ADD operands
mov [z],eax; Store Reg0
; LN:40 z=lor(x,y)
xor eax,eax; Clear Reg0
mov al, byte [x]; LoadReg
xor edx,edx; Clear Reg1
mov dx, word [y]; LoadReg
or eax,edx; OR operands
mov [_Tmp1],eax; StoreD0Tmp
mov eax, dword [_Tmp1]; LoadReg
mov [z],eax; Store Reg0
; LN:41 z=lxor(x,y)
xor eax,eax; Clear Reg0
mov al, byte [x]; LoadReg
xor edx,edx; Clear Reg1
mov dx, word [y]; LoadReg
xor eax,edx; XOR operands
mov [_Tmp1],eax; StoreD0Tmp
mov eax, dword [_Tmp1]; LoadReg
mov [z],eax; Store Reg0
; LN:42 z=mod(x,y)
xor eax,eax; Clear Reg0
mov al, byte [x]; LoadReg
xor edx,edx; Clear Reg1
mov dx, word [y]; LoadReg
mov ecx,edx; Get divisor
xor edx,edx; Clear high half of dividend
div ecx; Divide
mov eax,edx; Get remainder (MOD)
mov [_Tmp1],eax; StoreD0Tmp
mov eax, dword [_Tmp1]; LoadReg
mov [z],eax; Store Reg0
xor eax,eax
invoke ExitProcess, eax
_ErrExit:
mov eax,[_ErrNo]
invoke ExitProcess, eax
; End of Code Section
