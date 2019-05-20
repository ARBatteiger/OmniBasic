;Compiler Delaration Section

format PE console

entry _Start

macro align value { rb (value-1) - (rva $ + value-1) mod value }

_BufSize=300
; End of Declaration Section
section '.data' data readable writeable

align 4

ERR dd 0
_ErrVec dd 0
STATUS dd 0
POS dd 0
XferCount dd 0
_TrueStr db "TRUE",0
_FalseStr db "FALSE",0
_ErrExitMsg db 'Error exit',0
align 4
_IOBuffer dd _IOBuffer+12
 dd 300
 dd 0
 rb 300
align 4
_PrintBuf dd _PrintBuf+12
 dd 300
 dd 0
 rb 300
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
 dd 22
 dd 0
 rb 22
align 4
_ConvBuf1 dd _ConvBuf1+12
 dd 22
 dd 0
 rb 22
align 4
ProgramName dd ProgramName+12
 dd 28
 dd 0
 rb 28
; End of Initialized Data Section

; Start of Uninitialized Data Section

align 4
_FltArgSafe0 rf 1
_FltArgSafe1 rf 1
_LoopCtr rd 10
_hInstance rd 1
_InHandle rd 1
_OutHandle rd 1
_IOPthNum rd 1
_XferAddr rd 1
_PUArgs rd 15
_ArgList rd 1
_ArgNum rd 1
_Poker rd 1
_DummyArg rd 1
_ArgSafe0 rd 1
_ArgSafe1 rd 1
_SwitchInt rd 1
_SwitchStr rd 1
_ByteCounter rd 1
_PrtPthNum rd 1
_DataPtr rd 1
_Decimals rw 1
_Digits rw 1

align 4

; LN:1 dim x as long
align 4
x rd 1

;Temporary String Variable
_StrTmp1 rb 22


;Temporary Vector
_TmpVec1 rd 3
; End of Uninitialized Data Section

include 'include\kernel.inc'
include 'include\user.inc'
include 'include\gdi.inc'
include 'include\comctl.inc'
include 'include\comdlg.inc'
include 'include\shell.inc'
include 'include\cproc.inc'

include 'include\macro\import.inc'
include 'include\macro\stdcall.inc'
include 'include\macro\resource.inc'

section '.idata' import data readable writeable

library kernel32, 'kernel32.dll',\
        user32,'User32.dll',\
        gdi,'GDI32.DLL',\
        comctl,'COMCTL32.DLL',\
        comdlg,'COMDLG32.DLL',\
        shell,'SHELL32.DLL',\
        advapi,'ADVAPI32.DLL',\
	msvcrt,'msvcrt.dll'

kernel32:
        import  AddAtomA,'AddAtomA',\
                AddAtomW,'AddAtomW',\
                AllocConsole,'AllocConsole',\
                AreFileApisANSI,'AreFileApisANSI',\
                BackupRead,'BackupRead',\
                BackupSeek,'BackupSeek',\
                BackupWrite,'BackupWrite',\
                Beep,'Beep',\
                BeginUpdateResourceA,'BeginUpdateResourceA',\
                BeginUpdateResourceW,'BeginUpdateResourceW',\
                BuildCommDCBA,'BuildCommDCBA',\
                BuildCommDCBAndTimeoutsA,'BuildCommDCBAndTimeoutsA',\
                BuildCommDCBAndTimeoutsW,'BuildCommDCBAndTimeoutsW',\
                BuildCommDCBW,'BuildCommDCBW',\
                ClearCommBreak,'ClearCommBreak',\
                ClearCommError,'ClearCommError',\
                CommConfigDialog,'CommConfigDialogA',\
                EscapeCommFunction,'EscapeCommFunction',\
                GetCommConfig,'GetCommConfig',\
                GetCommMask,'GetCommMask',\
                GetCommModemStatus,'GetCommModemStatus',\
                GetCommProperties,'GetCommProperties',\
                GetCommState,'GetCommState',\
                GetCommTimeouts,'GetCommTimeouts',\
                GetDefaultCommConfig,'GetDefaultCommConfigA',\
                PurgeComm,'PurgeComm',\
                SetCommBreak,'SetCommBreak',\
                SetCommConfig,'SetCommConfig',\
                SetCommMask,'SetCommMask',\
                SetCommState,'SetCommState',\
                SetCommTimeouts,'SetCommTimeouts',\
                SetDefaultCommConfig,'SetDefaultCommConfigA',\
                SetupComm,'SetupComm',\
                TransmitCommChar,'TransmitCommChar',\
                WaitCommEvent,'WaitCommEvent',\
                CloseHandle,'CloseHandle',\
                CopyFile,'CopyFileA',\
		CreateDirectory,'CreateDirectoryA',\
                CreateFile,'CreateFileA',\
                CreatePipe,'CreatePipe',\
                CreateProcess,'CreateProcessA',\
                DeleteFile,'DeleteFileA',\
                DuplicateHandle,'DuplicateHandle',\
                ExitProcess,'ExitProcess',\
		FreeConsole,'FreeConsole',\
                FreeLibrary,'FreeLibrary',\
                GetCommandLine,'GetCommandLineA',\
                GetCurrentProcess,'GetCurrentProcess',\
		GetCurrentDirectory,"GetCurrentDirectoryA",\
                GetExitCodeProcess,'GetExitCodeProcess',\
                GetFileSize,'GetFileSize',\
                GetFileType,'GetFileType',\
                GetFullPathName,'GetFullPathNameA',\
		GetLastError,'GetLastError',\
		GetLocalTime,'GetLocalTime',\
                GetModuleHandle,'GetModuleHandleA',\
                GetStdHandle,'GetStdHandle',\
                LoadLibrary,'LoadLibraryA',\
                LoadModule,'LoadModule',\
                ReadConsole,'ReadConsoleA',\
                ReadFile,'ReadFile',\
		RemoveDirectory,'RemoveDirectoryA',\
                SetCurrentDirectory,'SetCurrentDirectoryA',\
                SetFilePointer,'SetFilePointer',\
                VirtualAlloc,'VirtualAlloc',\
                VirtualFree,'VirtualFree',\
                WinExec,'WinExec',\
                WriteConsole,'WriteConsoleA',\
                WriteFile,'WriteFile'

user32:
        import  CheckDlgButton,'CheckDlgButton',\
                CheckRadioButton,'CheckRadioButton',\
                CheckMenuItem,'CheckMenuItem',\
                CreateWindowEx,'CreateWindowExA',\
                DefFrameProc,'DefFrameProcA',\
                DefMDIChildProc,'DefMDIChildProcA',\
                DefWindowProc,'DefWindowProcA',\
                DialogBoxParam,'DialogBoxParamA',\
                DispatchMessage,'DispatchMessageA',\
                EnableMenuItem,'EnableMenuItem',\
                EnableWindow,'EnableWindow',\
                EndDialog,'EndDialog',\
                GetClientRect,'GetClientRect',\
                GetDlgItem,'GetDlgItem',\
                GetDlgItemInt,'GetDlgItemInt',\
                GetDlgItemText,'GetDlgItemTextA',\
                GetMessage,'GetMessageA',\
                GetSubMenu,'GetSubMenu',\
                GetWindowLong,'GetWindowLongA',\
                GetWindowRect,'GetWindowRect',\
                GetSysColor,'GetSysColor',\
                GetSystemMetrics,'GetSystemMetrics',\
                GetWindowPlacement,'GetWindowPlacement',\
                InvalidateRect,'InvalidateRect',\
                IsClipboardFormatAvailable,'IsClipboardFormatAvailable',\
                IsDlgButtonChecked,'IsDlgButtonChecked',\
                LoadAccelerators,'LoadAcceleratorsA',\
                LoadCursor,'LoadCursorA',\
                LoadIcon,'LoadIconA',\
                LoadMenu,'LoadMenuA',\
                MessageBox,'MessageBoxA',\
                MoveWindow,'MoveWindow',\
                PostQuitMessage,'PostQuitMessage',\
                RedrawWindow,'RedrawWindow',\
                RegisterClass,'RegisterClassA',\
                SendDlgItemMessage,'SendDlgItemMessageA',\
                SendMessage,'SendMessageA',\
                SetCursor,'SetCursor',\
                SetDlgItemText,'SetDlgItemTextA',\
                SetFocus,'SetFocus',\
		SetTimer,'SetTimer',\
                SetWindowLong,'SetWindowLongA',\
                SetWindowPlacement,'SetWindowPlacement',\
                TranslateAccelerator,'TranslateAcceleratorA',\
                TranslateMDISysAccel,'TranslateMDISysAccel',\
                TranslateMessage,'TranslateMessage',\
                UpdateWindow,'UpdateWindow',\
                WinHelp,'WinHelpA',\
                wvsprintf,'wvsprintfA'

gdi:
        import  CreateFontIndirect,'CreateFontIndirectA',\
                DeleteObject,'DeleteObject'

comctl:
        import  CreateMappedBitmap,'CreateMappedBitmap',\
                CreatePropertySheetPage,'CreatePropertySheetPageA',\
                CreateStatusWindow,'CreateStatusWindowA',\
                CreateToolbar,'CreateToolbar',\
                CreateUpDownControl,'CreateUpDownControl',\
                DestroyPropertySheetPage,'DestroyPropertySheetPage',\
                DllGetVersion,'DllGetVersion',\
                DllInstall,'DllInstall',\
                DrawInsert,'DrawInsert',\
                DrawStatusText,'DrawStatusTextA',\
                FlatSB_EnableScrollBar,'FlatSB_EnableScrollBar',\
                FlatSB_GetScrollInfo,'FlatSB_GetScrollInfo',\
                FlatSB_GetScrollPos,'FlatSB_GetScrollPos',\
                FlatSB_GetScrollProp,'FlatSB_GetScrollProp',\
                FlatSB_GetScrollRange,'FlatSB_GetScrollRange',\
                FlatSB_SetScrollInfo,'FlatSB_SetScrollInfo',\
                FlatSB_SetScrollPos,'FlatSB_SetScrollPos',\
                FlatSB_SetScrollProp,'FlatSB_SetScrollProp',\
                FlatSB_SetScrollRange,'FlatSB_SetScrollRange',\
                FlatSB_ShowScrolBar,'FlatSB_ShowScrollBar',\
                GetEffectiveClientRect,'GetEffectiveClientRect',\
                GetMUILanguage,'GetMUILanguage',\
                ImageList_Add,'ImageList_Add',\
                ImageList_AddIcon,'ImageList_AddIcon',\
                ImageList_AddMasked,'ImageList_AddMasked',\
                ImageList_BeginDrag,'ImageList_BeginDrag',\
                ImageList_Copy,'ImageList_Copy',\
                ImageList_Create,'ImageList_Create',\
                ImageList_Destroy,'ImageList_Destroy',\
                ImageList_DragEnter,'ImageList_DragEnter',\
                ImageList_DragLeave,'ImageList_DragLeave',\
                ImageList_DragMove,'ImageList_DragMove',\
                ImageList_DragShowNolock,'ImageList_DragShowNolock',\
                ImageList_Draw,'ImageList_Draw',\
                ImageList_DrawEx,'ImageList_DrawEx',\
                ImageList_DrawIndirect,'ImageList_DrawIndirect',\
                ImageList_Duplicate,'ImageList_Duplicate',\
                ImageList_EndDrag,'ImageList_EndDrag',\
                ImageList_GetBkColor,'ImageList_GetBkColor',\
                ImageList_GetDragImage,'ImageList_GetDragImage',\
                ImageList_GetIcon,'ImageList_GetIcon',\
                ImageList_GetIconSize,'ImageList_GetIconSize',\
                ImageList_GetImageCount,'ImageList_GetImageCount',\
                ImageList_GetImageInfo,'ImageList_GetImageInfo',\
                ImageList_GetImageRect,'ImageList_GetImageRect',\
                ImageList_LoadImage,'ImageList_LoadImage',\
                ImageList_Merge,'ImageList_Merge',\
                ImageList_Read,'ImageList_Read',\
                ImageList_Remove,'ImageList_Remove',\
                ImageList_Replace,'ImageList_Replace',\
                ImageList_ReplaceIcon,'ImageList_ReplaceIcon',\
                ImageList_SetBkColor,'ImageList_SetBkColor',\
                ImageList_SetDragCursorImage,'ImageList_SetDragCursorImage',\
                ImageList_SetFilter,'ImageList_SetFilter',\
                ImageList_SetFlags,'ImageList_SetFlags',\
                ImageList_SetIconSize,'ImageList_SetIconSize',\
                ImageList_SetImageCount,'ImageList_SetImageCount',\
                ImageList_SetOverlayImage,'ImageList_SetOverlayImage',\
                ImageList_Write,'ImageList_Write',\
                InitCommonControls,'InitCommonControls',\
                InitCommonControlsEx,'InitCommonControlsEx',\
                InitMUILanguage,'InitMUILanguage',\
                InitializeFlatSB,'InitializeFlatSB',\
                LBItemFromPt,'LBItemFromPt',\
                MakeDragList,'MakeDragList',\
                MenuHelp,'MenuHelp',\
                PropertySheet,'PropertySheetA',\
                ShowHideMenuCtl,'ShowHideMenuCtl',\
                UninitializeFlatSB,'UninitializeFlatSB',\
                _TrackMouseEvent,'_TrackMouseEvent'

comdlg:
        import  ChooseFont,'ChooseColorA',\
                ChooseColor,'ChooseFontA',\
                FindText,'FindTextA',\
                GetFileTitle,'GetFileTitleA',\
                GetOpenFileName,'GetOpenFileNameA',\
                GetSaveFileName,'GetSaveFileNameA',\
                PageSetupDlg,'PageSetupDlgA',\
                PrintDlg,'PrintDlgA',\
                ReplaceText,'ReplaceTextA'

shell:
        import  DragAcceptFiles,'DragAcceptFiles',\
                DragQueryFile,'DragQueryFile',\
                DragFinish,'DragFinish',\
                Shell_NotifyIcon,'Shell_NotifyIcon'

advapi:
        import  RegCreateKeyEx,'RegCreateKeyExA',\
                RegOpenKeyEx,'RegOpenKeyExA',\
                RegSetValueEx,'RegSetValueExA',\
                RegQueryValueEx,'RegQueryValueExA',\
                RegCloseKey,'RegCloseKey'

msvcrt:
	import	abs,'abs',\
		atol,'atol',\
		ltoa,'_ltoa',\
		printf,'printf',\
		puts,'puts',\
		sprintf,'sprintf',\
		system,'system'

; End of Import Section




section '.code' code readable executable
; Main Code Section

_Start:

invoke GetModuleHandle, NULL
mov dword [_hInstance], eax
invoke GetCommandLine
mov dword [_ArgList],eax
mov dword edi,ProgramName
call __MovArg
invoke GetStdHandle, STD_OUTPUT_HANDLE
mov dword [_OutHandle], eax
mov byte [_CRLF+12],13; CR
mov byte [_CRLF+13],10; LF
mov byte [_CRLF+14],0; NULL
mov byte [_Prompt+12],63; ?
mov byte [_Prompt+13],0; NULL
mov byte [_NullStr+12],0; NULL
mov dword [_ErrVec],_ErrExit
; End of PreCode Section

lp1:
; LN:3 x=1
mov dword [x],1; LET constant
; LN:4 x=2
mov dword [x],2; LET constant
; LN:5 if x=4 then lp1
cmp [x],4; Simple compare
je lp1; Jump if true
; LN:6 x=3
mov dword [x],3; LET constant
; LN:7 x=4
mov dword [x],4; LET constant
; LN:8 print x
mov eax, dword [x]; LoadReg
cinvoke ltoa,eax,[_ConvBuf1],10; Do conversion
mov esi,_StrTmp1; Get addr of temp string
mov [_TmpVec1],esi; Set vector ptr (3)
mov [_TmpVec1+4],22; Set vector len (4)
mov [_TmpVec1+8],0; Set vector lnk (4)
mov edi,_TmpVec1; Get dest
mov esi,_ConvBuf1; Get src
call __MovStr; Go do move
mov esi,_TmpVec1; Get src
mov edi,_PrintBuf; Get dest
call __MovStr; Move arg into print buffer
mov esi,_PrintBuf; Get vector addr
call __StrLen; Get print len
mov edx,eax; Copy print len
add edx,[POS]; Update POS
mov [POS],edx; Save result
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0; Check for error (0)
jne _OELbl1; Skip if no error
invoke GetLastError
mov [ERR],eax; Capture error code
jmp [_ErrVec]; Dispatch error
_OELbl1:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:9 x=5
mov dword [x],5; LET constant
; LN:10 goto lp1
jmp lp1
; LN:11 x=6
mov dword [x],6; LET constant
; LN:12 gosub lp1
call lp1
; LN:13 x=7
mov dword [x],7; LET constant
; LN:14 x=8
mov dword [x],8; LET constant
; LN:15 const qqq=3
qqq equ 3
; LN:16 x=9
mov dword [x],9; LET constant
; LN:17 x=10
mov dword [x],10; LET constant
; LN:18 x=11
mov dword [x],11; LET constant
; LN:19 repeat
_Lbl2:
; LN:20 until x>5
_Lbl3:
xor bh,bh; Init _True
mov eax, dword [x]; LoadReg
mov edx,5; LoadReg CONSTANT
cmp eax,edx; Compare numbers
setg bl; Set condition in reg
or bh,bl; OR result with _True
je _Lbl2; Fail test if zero
_Lbl4:
; LN:21 x=12
mov dword [x],12; LET constant

; Automatic END statement
xor eax,eax
invoke ExitProcess, eax
_ErrExit:
cinvoke puts,_ErrExitMsg
mov eax,[ERR]
invoke ExitProcess, eax
; End of Code Section
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
