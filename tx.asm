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
; LN:3 dim a$ as string*5
align 4
a$ dd a$+12
 dd 5
 dd 0
 rb 5
_StrConst1 db "qazqaz",0
_StrConst2 db "one",0
_StrConst3 db "two",0
_StrConst4 db "three",0
; End of Initialized Data Section

; Start of Uninitialized Data Section

align 4

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
_DataPtrSaf rd 1
_Decimals rw 1
_Digits rw 1
_ArgCount rw 1

align 4

; LN:1 dim f as long
align 4
f rd 1
; LN:2 dim x as long
align 4
x rd 1

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
	import	atoi,'atoi',\
		ltoa,'_ltoa',\
		printf,'printf',\
		puts,'puts',\
		sprintf,'sprintf'

; End of Import Section




section '.code' code readable executable
; Main Code Section

_Start:

invoke GetModuleHandle, NULL
mov [_hInstance], eax
invoke GetCommandLine
mov [_ArgList],eax
invoke GetStdHandle, STD_OUTPUT_HANDLE
mov [_OutHandle], eax
mov byte [_CRLF+12],13; CR
mov byte [_CRLF+13],10; LF
mov byte [_CRLF+14],0; NULL
mov byte [_Prompt+12],63; ?
mov byte [_Prompt+13],0; NULL
mov byte [_NullStr+12],0; NULL
mov [_ErrVec],_ErrExit
; End of PreCode Section

; LN:5 create #f,"qazqaz":write
mov esi,_StrConst1; Get base
mov [_TmpVec1],esi; Set vector ptr (2)
mov [_TmpVec1+4],7; Set vector len
mov [_TmpVec1+8],0; Set vector lnk
mov edi,_IOBuffer; Get dest
mov esi,_TmpVec1; Get src
call __MovStr; Go do move
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,CREATE_NEW,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [f],eax
cmp eax,-1; Check for error (<0)
jg _OELbl1; Skip if no error
invoke GetLastError
mov [ERR],eax; Capture error code
jmp [_ErrVec]; Dispatch error
_OELbl1:
; LN:6 a$="one"
mov esi,_StrConst2; Get base
mov [_TmpVec1],esi; Set vector ptr (2)
mov [_TmpVec1+4],4; Set vector len
mov [_TmpVec1+8],0; Set vector lnk
mov edi,a$; Get dest
mov esi,_TmpVec1; Get src
call __MovStr; Go do move
; LN:7 gosub putfile
call putfile
; LN:8 a$="two"
mov esi,_StrConst3; Get base
mov [_TmpVec1],esi; Set vector ptr (2)
mov [_TmpVec1+4],4; Set vector len
mov [_TmpVec1+8],0; Set vector lnk
mov edi,a$; Get dest
mov esi,_TmpVec1; Get src
call __MovStr; Go do move
; LN:9 gosub putfile
call putfile
; LN:10 a$="three"
mov esi,_StrConst4; Get base
mov [_TmpVec1],esi; Set vector ptr (2)
mov [_TmpVec1+4],6; Set vector len
mov [_TmpVec1+8],0; Set vector lnk
mov edi,a$; Get dest
mov esi,_TmpVec1; Get src
call __MovStr; Go do move
; LN:11 gosub putfile
call putfile
; LN:15 close #f
mov eax, dword [f]; LoadReg
mov [_IOPthNum],eax; Save path
invoke CloseHandle,[_IOPthNum];
mov [STATUS],eax; Set STATUS
cmp eax,0; Check for error (0)
jne _OELbl2; Skip if no error
invoke GetLastError
mov [ERR],eax; Capture error code
jmp [_ErrVec]; Dispatch error
_OELbl2:
; LN:16 end
xor eax,eax
invoke ExitProcess, eax
putfile:
; LN:19 put #f,a$
mov eax, dword [f]; LoadReg
mov [_IOPthNum],eax; Save path
mov esi,[a$]; Get base for vector
mov [_XferAddr],esi; Save addr
mov [XferCount],5; Save num bytes
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0; Do write
mov [STATUS],eax; Set STATUS
cmp eax,0; Check for error (0)
jne _OELbl3; Skip if no error
invoke GetLastError
mov [ERR],eax; Capture error code
jmp [_ErrVec]; Dispatch error
_OELbl3:
; LN:20 x=XferCount
mov eax,[XferCount]; LET simple LONG
mov [x],eax; Store Reg0 (LONG)
; LN:21 return
ret

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
jmp __MovStr4; Skip dst ptr undo
__MovStr3:
dec edi; Point back before term char
__MovStr4:
mov ecx,[esi+8]; Get src lnk
or ecx,ecx; Set z flag
je __MovStrDone
mov esi,ecx; Move lnk to src vec addr
jmp __MovStr1; Process new src vec
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
jmp __MovStr1; Process new src vec
__CmpStrDstDone:
cmp al,[ebx]; Compare chars
__CmpStrDone:
pop ebx; Restore _True flag
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
dec edx; Dec len ctr
je __StrLenChkLnk; Yes, check lnk
inc eax; Inc len
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
jmp __BldBool; Go build str
__BoolFalse:
mov esi,_FalseStr; Point to false str
__BldBool:
mov al,[esi]; Get char from src
cmp al,0; Is it term char?
je __BtoADone; Yes, all done
mov [edi],al; Put next char in ConvBuf1
inc esi; Point to next char in src
inc edi; Point to next char in dest
jmp __BldBool; Go to next char
__BtoADone:
mov [edi],al; Put term char into dest
ret

__LCase:

ret

__UCase:

ret

__Remnant:

ret
