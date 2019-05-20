;Compiler Delaration Section

format PE console

entry _Start

macro align value { rb (value-1) - (rva $ + value-1) mod value }

; End of Declaration Section
section '.data' data readable writeable

_BufSize=300
_CRLF db 13,10
_NullStr db 0,0
_TrueStr db "TRUE",0
_FalseStr db "FALSE",0
; End of Initialized Data Section

; Start of Uninitialized Data Section

align 4

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
STATUS rd 1
POS rd 1
_IOPthNum rd 1
_XferAddr rd 1
XferCount rd 1
_PUArgs rd 15
_ArgCount rw 1
_ArgList rd 1
_ArgNum rd 1
_TestByte rb 1
_Prompt rb 1
_NewLine rb 1
_Poker rd 1
_DummyArg rd 1
_Digits rw 1
_Decimals rw 1
_ArgSafe0 rd 1
ArgSafe1 rd 1
_FltArgSafe0 rf 1
_FltArgSafe1 rf 1
_SwitchInt rd 1
_SwitchStr rd 1
_ByteCounter rd 1
_PrtPthNum rd 1
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
align 4
; LN:1 dim i as long
i rd 1
; LN:2 dim j as long
j rd 1
; LN:3 dim x as long
x rd 1
; LN:4 type dt
; LN:9 dim cpx(10) as dt
cpx rb 120

;For Loop Vector
_LopVec1 rd 2


;For Loop Vector
_LopVec2 rd 2


;Temporary Vector
_TmpVec1 rd 3
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

library kernel32, 'kernel32.dll',\
        user32,'User32.dll',\
        gdi,'GDI32.DLL',\
        comctl,'COMCTL32.DLL',\
        comdlg,'COMDLG32.DLL',\
        shell,'SHELL32.DLL',\
        advapi,'ADVAPI32.DLL'

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
                CreateFile,'CreateFileA',\
                CreatePipe,'CreatePipe',\
                CreateProcess,'CreateProcessA',\
                DeleteFile,'DeleteFileA',\
                DuplicateHandle,'DuplicateHandle',\
                ExitProcess,'ExitProcess',\
                FreeLibrary,'FreeLibrary',\
                GetCommandLine,'GetCommandLineA',\
                GetCurrentProcess,'GetCurrentProcess',\
                GetExitCodeProcess,'GetExitCodeProcess',\
                GetFileSize,'GetFileSize',\
                GetFileType,'GetFileType',\
                GetFullPathName,'GetFullPathNameA',\
                GetModuleHandle,'GetModuleHandleA',\
                GetStdHandle,'GetStdHandle',\
                LoadLibrary,'LoadLibraryA',\
                LoadModule,'LoadModule',\
                ReadConsole,'ReadConsoleA',\
                ReadFile,'ReadFile',\
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

; LN:11 for j=1 to 20
mov [j],1;
_Lbl1:
mov eax,[j]; Load LoopVar value
cmp eax,20; Compare LoopVar to ImmVal
ja _Lbl3; Finish loop if >
; LN:12 for i=1 to 100000000
mov [i],1;
_Lbl4:
mov eax,[i]; Load LoopVar value
cmp eax,100000000; Compare LoopVar to ImmVal
ja _Lbl6; Finish loop if >
; LN:13 if i>10 then
cmp [i],10; Simple compare
jnae _Lbl7; Jump if false
; LN:14 cpx(3).c=x
mov esi,cpx-(1*12)+8; Get base for array
mov eax,3; LoadReg CONSTANT
imul eax,12; ArrayIndex*DataSize
add esi,eax; Array base+subscript
mov [_TmpVec1],esi; Set vector ptr (1)
mov eax, dword [x]; LoadReg
mov esi,[_TmpVec1]; Get vector ptr
mov dword [esi],eax; Store Reg0 vector
; LN:15 endif
_Lbl7:
; LN:16 next i
_Lbl5:
inc [i]; Inc LoopVar (no step)
jmp _Lbl4
_Lbl6:
; LN:17 next j
_Lbl2:
inc [j]; Inc LoopVar (no step)
jmp _Lbl1
_Lbl3:

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
