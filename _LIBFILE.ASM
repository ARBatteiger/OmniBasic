__SetStrConst:
mov al,[esi]; Get char
mov [edi],al; Put char
or al,al; Test for NULL
je __SetStrConstDone
inc esi; Bump source ptr
inc edi; Bump dest ptr
jmp __SetStrConst
__SetStrConstDone:
ret

__TrmStr:

ret

__PrtUsing:

ret

__ReadBool:
; Enter with target byte addr in esi, src addr in _DataPtr
mov edi,[_DataPtr]; Get data addr
mov al,[edi]; Get boolean value
cmp al,$30; Is it false?
jne __ReadBoolTrue; No, must be true
xor al,al; Set to false
jmp __ReadBoolDone
__ReadBoolTrue:
mov al,1; Set to true
__ReadBoolDone:
mov [esi],al;  Save in target var
add edi,2; Point to next data field
mov [_DataPtr],edi; Save for next use
ret

__ReadByte:
; Enter with target byte addr in esi, src addr in _DataPtr
push esi; Save target addr
cinvoke atol,[_DataPtr]
pop esi; Restore target addr
mov [esi],al; Save result into target
call __UpdataDataPtr; Point to next data field
ret

__ReadShort:
; Enter with target word addr in esi, src addr in _DataPtr
push esi; Save target addr
cinvoke atol,[_DataPtr]
pop esi; Restore target addr
mov [esi],ax; Save result into target
call __UpdataDataPtr; Point to next data field
ret

__ReadLong:
; Enter with target long addr in esi, src addr in _DataPtr
push esi; Save target addr
cinvoke atol,[_DataPtr]
pop esi; Restore target addr
mov [esi],eax; Save result into target
call __UpdataDataPtr; Point to next data field
ret

__ReadFlt:

ret

__ReadStr:
; Enter with target string addr in esi, src addr in _DataPtr
mov edi,[_DataPtr]; Get dest addr
__ReadStrLoop:
mov al,[edi]; Get data
mov [esi],al; Put data
inc edi; Bump src ptr
inc esi; Bump dest ptr
cmp al,0; Is it a null?
jne __ReadStrLoop; No, proc next char
mov [_DataPtr],edi; Save result
ret

__UpdataDataPtr:
mov esi,[_DataPtr]; Get ptr
__UpdataDataPtrLoop:
mov al,[esi]; Get char
cmp al,0; Is it null?
je __UpdataDataPtrDone
inc esi; Bump ptr
jmp __UpdataDataPtrLoop
__UpdataDataPtrDone:
inc esi; Point to next data field
mov [_DataPtr],esi; Save result
ret

__MovArg:
; Enter with cmdline ptr in [_ArgList], dst vector in edi
mov esi,[_ArgList]; Point to next char in cmdline
mov edx,[edi+4]; Get dst len
mov edi,[edi]; Get dst ptr
__MovArg1:
mov al,[esi]; Get next char
cmp al,32; Space?
je __MovArgSpace; End of this arg
mov [edi],al; Store in dest
or al,al; Set z flag
je __MovArgDone; End of cmdline
inc esi; Point to nexr char
inc edi; Point to next dest
dec edx; Dec max len
je __MovArgDone; dest len maxed out
jmp __MovArg1; Do next
__MovArgSpace:
xor al,al; Make string terminator
mov [edi],al; Store terminator in dest
inc esi; Point to nexr char
__MovArgDone:
mov [_ArgList],esi; Save cmdline ptr
ret

__MovStr:
; Enter with src vector addr in esi, dst vector addr in edi
push ebx; Save _True flag
mov edx,[edi+4]; Get dst len
mov edi,[edi]; Get dst ptr
__MovStr1:
mov ecx,[esi+4]; Get src len
or ecx,ecx; Set z flag
je __MovStrDone1; Bail out if 0 len in src
mov ebx,[esi]; Get src ptr
__MovStr2:
mov al,[ebx]; Get char
mov [edi],al; Put char
inc edi; Inc dst ptr
inc ebx; Inc src ptr
dec edx; Dec dst len
je __MovStrDone2; Quit if dst len=0
or al,al; was last char term char?
je __MovStr3; Yes, undo and get next src lnk
dec ecx; Dec src len
jne __MovStr2; Move next char
jmp __MovStr4; Skip dst ptr undo
__MovStr3:
dec edi; Point back before term char
__MovStr4:
mov ecx,[esi+8]; Get src lnk
or ecx,ecx; Set z flag
je __MovStrDone1
mov esi,ecx; Move lnk to src vec addr
jmp __MovStr1; Process new src vec
__MovStrDone1:
mov byte [edi],0; Tack on null because dest len not reached
__MovStrDone2:
pop ebx; Restore _True flag
ret

__CmpStr:
; Enter with src vector addr in esi, dst vector addr in edi
mov edx,[edi+4]; Get dst len
mov edi,[edi]; Get dst ptr
mov ecx,[esi+4]; Get src len
mov esi,[esi]; Get src ptr
__CmpStrLoop:
mov al,[edi]; Get dest char
mov ah,[esi]; Get src char
cmp al,0; Src end?
je __CmpStrDone; Yes, quit
cmp ah,0; Dst end?
je __CmpStrDone; Yes, quit 
cmp al,ah; Compare chars
jne __CmpStrDiff; Found a difference, time to quit
inc edi; Inc dst ptr
inc esi; Inc src ptr
dec edx; Dec dst len
je __CmpStrDone; Quit if dst len=0
dec ecx; Dec src len
jne __CmpStrLoop; Move next char
__CmpStrDone:
cmp al,ah; Compare chars
__CmpStrDiff:
ret

__StrLen:
; Enter with vector addr in esi
xor eax,eax; Clear len ctr
__StrLenGetVec:
mov edi,[esi]; Get vec ptr
mov edx,[esi+4]; Get vec len
__StrLenLp:
mov cl,[edi]; Get next str char
cmp cl,0; Is it term char?
je __StrLenChkLnk; Yes, check lnk
inc eax; Inc len
dec edx; Dec len ctr
je __StrLenChkLnk; Yes, check lnk
inc edi; Point to next char
jmp __StrLenLp; Go chk next char
__StrLenChkLnk:
mov esi,[esi+8]; Get vec lnk
or esi,esi; Set z flag
jne __StrLenGetVec; Zero lnk means done
ret

__SubStr:

ret

__MidStr:
; Enter with vector addr in esi, start pos in eax, quan in edx
dec eax; Convert offset to 0 base
mov edi,[esi]; Get vec ptr
add edi,eax; Get new start pos
mov [esi],edi; Save new vec ptr
mov [esi+4],edx; Set new len
ret

__RightStr:
; Enter with vector addr in esi, quan in eax
mov edi,[esi]; Get vec ptr
mov ecx,[esi+4]; Get vec len
__RightStrLen:
mov dl,[edi]; Read char
or dl,dl; Is it a null?
je __RightStr2
dec ecx; Dec len
je __RightStr1
inc edi; Bump ptr
jmp __RightStrLen
__RightStr1:
inc edi; Correction factor
__RightStr2:
sub edi,eax; Set new ptr
mov [esi],edi; Save ptr
mov [esi+4],eax; Save len
ret

__ClrConv:

ret

__AtoD:

ret

__AtoL:
mov dl,[esi]; Get first byte of conv string
cmp dl,'$'; Is it a '$'?
jne __NotHex
call __NumScan
__HexLoop:
dec esi; Bump ptr backward
xor edx,edx; Insure 3 high bytes=0
mov dl,[esi]; Get next char
cmp dl,'$'; Term char?
je __AtoLDone
cmp dl,$39; More than '9'?
jg __HexLetter
and dl,$0f; Strip off all but numeric value
jmp __HexAcc; Accumulate result
__HexLetter:
and dl,$0f; Strip off all but numeric offset
add dl,9; Add numeric base to offset
__HexAcc:
imul edx,ecx; Digit position multiplier
add eax,edx; Accumulate result
imul ecx,16; Set multiplier for next digit 
jmp __HexLoop; Do next
__NotHex:
cmp dl,'%'; Is it a '%'?
jne __NotOctal
call __NumScan
__OctalLoop:
dec esi; Bump ptr backward
xor edx,edx; Insure 3 high bytes=0
mov dl,[esi]; Get next char
cmp dl,'%'; Term char?
je __AtoLDone
and dl,$07; Strip off all but octal value
imul edx,ecx; Digit position multiplier
add eax,edx; Accumulate result
imul ecx,8; Set multiplier for next digit 
jmp __OctalLoop; Do next
__NotOctal:
cmp dl,'&'; Is it a '&'?
jne __NotBinary
call __NumScan
__BinaryLoop:
dec esi; Bump ptr backward
xor edx,edx; Insure 3 high bytes=0
mov dl,[esi]; Get next char
cmp dl,'&'; Term char?
je __AtoLDone
and dl,$01; Strip off all but octal value
imul edx,ecx; Digit position multiplier
add eax,edx; Accumulate result
imul ecx,2; Set multiplier for next digit 
jmp __OctalLoop; Do next
__NotBinary:
cinvoke atol,esi; Do non-hex convert
__AtoLDone:
ret

__NumScan:
inc esi; Bump ptr
mov dl,[esi]; Get next char
cmp dl,0; Term char?
jne __NumScan; Do next
xor eax,eax; Clear acc
mov ecx,1; First digit multiplier

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
invoke ReadConsole,[_InHandle],[_IOBuffer],_BufSize,XferCount,0
push eax; Save API result
cmp [_ArgSafe1],6; Is data type 'string'?
je __InpDataString
cmp [_ArgSafe1],1; Is data type 'boolean'?
je __InpDataBool
cmp [_ArgSafe1],2; Is data type 'byte'?
je __InpDataByte
cmp [_ArgSafe1],3; Is data type 'short'?
je __InpDataShort
cmp [_ArgSafe1],5; Is data type 'float'?
je __InpDataFloat
; Get here if data type 'long'
call __GetNumVal
mov [esi],eax; Save result into target
jmp __InpDataDone
__InpDataString:
mov edi,[_ArgSafe0]; Get dst vec
mov edx,edi
add edx,4; Point to max len
mov edx,[edx]; Get max len
mov edi,[edi]; Get string addr
mov ecx,[XferCount]; Get len
mov esi,[_IOBuffer]; Get src addr
__InpDataStringLp:
mov al,[esi]; Get char
cmp al,$0d; CR?
jne __NotCR
mov byte [edi],0; Mark end
jmp __InpDataDone
__NotCR:
mov [edi],al; Put char
dec edx; Dec max count
je __InpDataDone; Quit if target max reached
inc esi; Bump src ptr
inc edi; Bump dst ptr
jne __InpDataStringLp; Get next char
jmp __InpDataDone
__InpDataBool:

jmp __InpDataDone
__InpDataByte:
call __GetNumVal
mov [esi],al; Save result into target
jmp __InpDataDone
__InpDataShort:
call __GetNumVal
mov [esi],ax; Save result into target
jmp __InpDataDone
__InpDataFloat:

__InpDataDone:
pop eax; Restore API result
ret

__GetNumVal:
mov esi,[_IOBuffer]; Get buf addr
cinvoke atol,[_IOBuffer]
mov esi,[_ArgSafe0]; Get target vec
mov esi,[esi];  Get target addr
ret

__BtoA:
; Enter with al as bool 
mov edi,[_ConvBuf1]; Point to build str
or al,al; Set z flag
je __BoolFalse; If zero, is false
mov esi,_TrueStr; Point to true str
jmp __BldBool; Go build str
__BoolFalse:
mov esi,_FalseStr; Point to false str
__BldBool:
mov al,[esi]; Get char from src
mov [edi],al; Put next char in ConvBuf1
cmp al,0; Is it term char?
je __BtoADone; Yes, all done
inc esi; Point to next char in src
inc edi; Point to next char in dest
jmp __BldBool; Go to next char
__BtoADone:
mov [edi],al; Put term char into dest
ret

__LCase:
; Enter with vector addr in esi
mov ecx,[esi+4]; Get vec len
mov esi,[esi]; Get vec ptr
__LCaseLoop:
mov al,[esi]; Get char
or al,al; Is it a null?
je __LCaseDone; Yes, quit 
cmp al,$41; Is it less than 'A'?
jb __NotUpper; Yes... don't convert
cmp al, $5a; Is it more than "Z'?
ja __NotUpper; Yes... don't convert
or al,$20; Convert to lower case
__NotUpper:
mov [esi],al; Put char
inc esi; Bump ptr
dec ecx; Dec len
jne __LCaseLoop; Proc next char
__LCaseDone:
ret

__UCase:
; Enter with vector addr in esi
mov ecx,[esi+4]; Get vec len
mov esi,[esi]; Get vec ptr
__UCaseLoop:
mov al,[esi]; Get char
or al,al; Is it a null?
je __UCaseDone; Yes, quit 
cmp al,$61; Is it less than 'a'?
jb __NotLower; Yes... don't convert
cmp al, $7a; Is it more than "z'?
ja __NotLower; Yes... don't convert
and al,$df; Convert to upper case
__NotLower:
mov [esi],al; Put char
inc esi; Bump ptr
dec ecx; Dec len
jne __UCaseLoop; Proc next char
__UCaseDone:
ret

__TailStr:
; Enter with vector addr in esi, quan in eax
push ebx; Save ebx
mov edi,[esi]; Get vec ptr
mov ecx,[esi+4]; Get vec len
xor edx,edx; Clear edx
dec eax; Set value as offset
add eax,edi; Calc new ptr
__TailStrLen:
mov bl,[edi]; Read char
or bl,bl; Is it a null?
je __TailStr2
dec ecx; Dec len
je __TailStr1
inc edi; Bump ptr
inc edx; Bump new len
jmp __TailStrLen
__TailStr1:
inc edi; Correction factor
__TailStr2:
mov [esi],eax; Save new ptr
mov [esi+4],edx; Save new len
pop ebx; restore ebx
ret
