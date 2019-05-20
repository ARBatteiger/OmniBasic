;Compiler Delaration Section

format PE console

entry _Start

; End of Declaration Section
section '.data' data readable writeable

_BufSize=300
_CRLF db 13,10
_NullStr db 0,0
_TrueStr db "TRUE",0
_FalseStr db "FALSE",0
tbl:
db 55
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
; LN:1 dim x as long
x rd 1
; End of Uninitialized Data Section

include 'include\kernel.inc'
include 'include\user.inc'
include 'include\gdi.inc'
include 'include\comctl.inc'
include 'include\comdlg.inc'
include 'include\shell.inc'

include 'include\macro\import.inc'
include 'include\macro\stdcall.inc'
include 'include\macro\resource.inc'

section '.idata' import data readable writeable

dd 0,0,0,RVA kernel_name,RVA kernel_table
dd 0,0,0,RVA user_name,RVA user_table
dd 0,0,0,0,0

kernel_table:
ExitProcess dd RVA _ExitProcess
GetModuleHandle dd RVA _GetModuleHandle
GetStdHandle dd RVA _GetStdHandle
Beep dd RVA _Beep
dd 0

user_table:
CheckMenuItem dd RVA _CheckMenuItem
dd 0

kernel_name db 'KERNEL32.DLL',0
user_name db 'USER32.DLL'

_GetModuleHandle dw 0
db 'GetModuleHandleA',0
_ExitProcess dw 0
db 'ExitProcess',0
_GetStdHandle dw 0
db 'GetStdHandle',0
_Beep dw 0
db 'Beep',0
_CheckMenuItem dw 0
db 'CheckMenuItem',0

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

; End of PreCode Section

; LN:3 x=0
mov [x],0; LET constant
invoke Beep,1000,1000

; Automatic END statement
xor eax,eax
invoke ExitProcess, eax
_ErrExit:
mov eax,[_ErrNo]
invoke ExitProcess, eax
; End of Code Section
__TrmStr:

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
; Enter with src vector addr in esi, dst vector addr in edi
push ebx; Save _True flag
mov edx,[edi+4]; Get dst len
mov edi,[edi]; Get dst ptr
__MovStr1:
mov ecx,[esi+4]; Get src len
mov ebx,[esi]; Get src ptr
__MovStr2:
mov al,[ebx]; Get char
mov [edi],al; Put char
inc edi; Inc dst ptr
inc ebx; Inc src ptr
dec edx; Dec dst len
je __MovStrDone; Quit if dst len=0
or al,al; was last char term char?
je __MovStr3; Yes, undo and get next src lnk
dec ecx; Dec src len
jne __MovStr2; Move next char
jp __MovStr4; Skip dst ptr undo
__MovStr3:
dec edi; Point back before term char
__MovStr4:
mov ecx,[esi+8]; Get src lnk
or ecx,ecx; Set z flag
je __MovStrDone
mov esi,ecx; Move lnk to src vec addr
jp __MovStr1; Process new src vec
__MovStrDone:
pop ebx; Restore _True flag
ret

__CmpStr:
; Enter with src vector addr in esi, dst vector addr in edi
push ebx; Save _True flag
mov edx,[edi+4]; Get dst len
mov edi,[edi]; Get dst ptr
__CmpStr1:
mov ecx,[esi+4]; Get src len
mov ebx,[esi]; Get src ptr
__CmpStr2:
mov al,[edi]; Get char to compare to
je __CmpStrDone; Quit if dst term char
cmp al,[ebx]; Compare chars
jne __CmpStrDstDone; Found a difference, time to quit
inc edi; Inc dst ptr
inc ebx; Inc src ptr
dec edx; Dec dst len
je __CmpStrDstDone; Quit if dst len=0
dec ecx; Dec src len
jne __CmpStr2; Move next char
mov ecx,[esi+8]; Get src lnk
or ecx,ecx; Set z flag
je __CmpStrDone
mov esi,ecx; Move lnk to src vec addr
jp __MovStr1; Process new src vec
__CmpStrDstDone:
cmp al,[ebx]; Compare chars
__CmpStrDone:
pop ebx; Restore _True flag
ret

__StrLen:
; Enter with vector addr in esi, receiving var addr in edi
xor ecx,ecx; Clear len ctr
__StrLenGetVec:
mov edi,[esi]; Get vec ptr
mov edx,[esi+4]; Get vec len
__StrLenLp:
mov al,[edi]; Get next str char
cmp al,0; Is it term char?
je __StrLenChkLnk; Yes, check lnk
dec edx; Dec len ctr
je __StrLenChkLnk; Yes, check lnk
inc ecx; Inc len
inc edi; Point to next char
jp __StrLenLp; Go chk next char
__StrLenChkLnk:
mov esi,[esi+8]; Get vec lnk
or esi,esi; Set z flag
jne __StrLenGetVec; Zero lnk means done
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