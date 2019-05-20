;Compiler Delaration Section

format PE console

entry !Start

macro align value { rb (value-1) - (rva $ + value-1) mod value }

_BufSize=1000
; End of Declaration Section

include 'include\kernel.inc'
include 'include\user.inc'
include 'include\gdi.inc'
include 'include\comctl.inc'
include 'include\comdlg.inc'
include 'include\shell.inc'
include 'include\cproc.inc'
include 'include\riched.inc'
include 'include\raedit.inc'
include 'include\ragrid.inc'

include 'include\macro\import.inc'
include 'include\macro\stdcall.inc'
include 'include\macro\resource.inc'

section '.idata' import data readable writeable

library kernel32,'kernel32.dll',\
        user32,'User32.dll',\
        gdi,'GDI32.DLL',\
        comctl,'COMCTL32.DLL',\
        comdlg,'COMDLG32.DLL',\
        shell,'SHELL32.DLL',\
        advapi,'ADVAPI32.DLL',\
	winmm,'WINMM.DLL',\
	msvcrt,'msvcrt.dll',\
	csmdll,'csmdll.dll',\
	richedit,'RichEd20.dll'

kernel32:
        import  Beep,'Beep',\
                CloseHandle,'CloseHandle',\
		CreateDirectory,'CreateDirectoryA',\
                CreateFile,'CreateFileA',\
                CreatePipe,'CreatePipe',\
                CreateProcess,'CreateProcessA',\
                DeleteFile,'DeleteFileA',\
                ExitProcess,'ExitProcess',\
                GetCommandLine,'GetCommandLineA',\
                GetCurrentProcess,'GetCurrentProcess',\
		GetCurrentDirectory,"GetCurrentDirectoryA",\
                GetFileSize,'GetFileSize',\
                GetFileType,'GetFileType',\
                GetFullPathName,'GetFullPathNameA',\
		GetLastError,'GetLastError',\
		GetLocalTime,'GetLocalTime',\
                GetModuleHandle,'GetModuleHandleA',\
                GetStdHandle,'GetStdHandle',\
		GetTickCount,'GetTickCount',\
		LoadLibrary,'LoadLibraryA',\
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
	import	AppendMenu,'AppendMenuA',\
		CallWindowProc,'CallWindowProcA',\
	  	CheckDlgButton,'CheckDlgButton',\
		CheckMenuItem,'CheckMenuItem',\
		CheckRadioButton,'CheckRadioButton',\
		CreateIconFromResource,'CreateIconFromResource',\
		CreateMenu,'CreateMenu',\
		CreatePopupMenu,'CreatePopupMenu',\
         	CreateWindowEx,'CreateWindowExA',\
         	DefWindowProc,'DefWindowProcA',\
		DeleteMenu,'DeleteMenu',\
		DestroyWindow,'DestroyWindow',\
         	DispatchMessage,'DispatchMessageA',\
		DrawMenuBar,'DrawMenuBar',\
		EnableMenuItem,'EnableMenuItem',\
		EnableWindow,'EnableWindow',\
		FlashWindow,'FlashWindow',\
		GetAncestor,'GetAncestor',\
         	GetClientRect,'GetClientRect',\
		GetComboBoxInfo,'GetComboBoxInfo',\
		GetCursorPos,'GetCursorPos',\
         	GetMessage,'GetMessageA',\
		GetParent,'GetParent',\
		GetWindowRect,'GetWindowRect',\
		HiliteMenuItem,'HiliteMenuItem',\
		InvalidateRect,'InvalidateRect',\
		InsertMenu,'InsertMenuA',\
		InsertMenuItem,'InsertMenuItemA',\
		IsWindowEnabled,'IsWindowEnabled',\
		IsWindowVisible,'IsWindowVisible',\
		KillTimer,'KillTimer',\
         	LoadCursor,'LoadCursorA',\
         	LoadIcon,'LoadIconA',\
         	LoadMenu,'LoadMenuA',\
         	MessageBox,'MessageBoxA',\
		ModifyMenu,'ModifyMenuA',\
		PostMessage,'PostMessageA',\
         	MoveWindow,'MoveWindow',\
         	PostQuitMessage,'PostQuitMessage',\
         	RedrawWindow,'RedrawWindow',\
		RegisterClass,'RegisterClassA',\
		RegisterWindowMessage,'RegisterWindowMessageA',\
		ReleaseCapture,'ReleaseCapture',\
		RemoveMenu,'RemoveMenu',\
		ScreenToClient,'ScreenToClient',\
         	SendMessage,'SendMessageA',\
		SetCapture,'SetCapture',\
		SetClassLong,'SetClassLongA',\
		SetFocus,'SetFocus',\
		SetMenu,'SetMenu',\
		SetMenuItemBitmaps,'SetMenuItemBitmaps',\
		SetTimer,'SetTimer',\
		GetWindowLong,'GetWindowLongA',\
         	SetWindowLong,'SetWindowLongA',\
		SetWindowPos,'SetWindowPos',\
		ShowWindow,'ShowWindow',\
		UpdateWindow,'UpdateWindow',\
		TrackPopupMenuEx,'TrackPopupMenuEx',\
         	TranslateMessage,'TranslateMessage'

gdi:
        import  CreateFontIndirect,'CreateFontIndirectA',\
		CreateSolidBrush,'CreateSolidBrush',\
                DeleteObject,'DeleteObject',\
		GetPixel,'GetPixel',\
		GetBkColor,'GetBkColor',\
		SetBkColor,'SetBkColor',\
		SetBkMode,'SetBkMode',\
		SetTextColor,'SetTextColor'

comctl:
        import  CreateMappedBitmap,'CreateMappedBitmap',\
		InitCommonControlsEx,'InitCommonControlsEx',\
                _TrackMouseEvent,'_TrackMouseEvent'

comdlg:
        import  ChooseFont,'ChooseFontA',\
		ChooseColor,'ChooseColorA',\
		GetOpenFileName,'GetOpenFileNameA',\
		GetSaveFileName,'GetSaveFileNameA',\
		FindText,'FindTextA',\
                ReplaceText,'ReplaceTextA'

shell:
        import  DragAcceptFiles,'DragAcceptFiles',\
                Shell_NotifyIcon,'Shell_NotifyIcon'

advapi:
        import  RegCreateKeyEx,'RegCreateKeyExA',\
                RegCloseKey,'RegCloseKey'

winmm:
	import	sndPlaySound,'sndPlaySoundA'

msvcrt:
	import	abs,'abs',\
		atol,'atol',\
		ltoa,'_ltoa',\
		printf,'printf',\
		puts,'puts',\
		sprintf,'sprintf',\
		system,'system'

csmdll:
	import	CSMGetDriveHandle,'CSMGetDriveHandle',\
		CSMDriveStatus,'CSMDriveStatus',\
		CSMReadBlock,'CSMReadBlock',\
		CSMReleaseDriveHandle,'CSMReleaseDriveHandle',\
		CSMWriteBlock,'CSMWriteBlock'

richedit:
	import CreateTextServices,'CreateTextServices'

; End of Import Section



section '.data' data readable writeable

align 4

ERR dd 0
!ArrayBase dd 1
_ErrVec dd 0
STATUS dd 0
POS dd 0
Ticks dd 0
XferCount dd 0
ArrNdx dd 0
EventNotify dw 0
EventID dw 0
_TrueStr db "TRUE",0
_FalseStr db "FALSE",0
_ErrExitMsg db 'Error exit',0
align 4
_IOBuffer dd _IOBuffer+12
 dd 1000
 dd 0
 rb 1000
align 4
_PrintBuf dd _PrintBuf+12
 dd 1000
 dd 0
 rb 1000
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
 dd 32
 dd 0
 rb 32
align 4
_ConvBuf1 dd _ConvBuf1+12
 dd 32
 dd 0
 rb 32
align 4
ProgramName dd ProgramName+12
 dd 28
 dd 0
 rb 28
align 4
_SwitchStr dd _SwitchStr+12
 dd 1000
 dd 0
 rb 1000
meep db 13, $45
 db $46, 47
havis dd 22, 33
 dd 12345, 6789
poop db 'hello', 0
 dw $5555
 dd 12345
; LN:15 dim a$ as string*20 vector
align 4
a$ dd a$+12
 dd 20
 dd 0
 rb 20
; LN:35 tst: data 33,44,k,"Test"
tst:
db "33",0
db "44",0
db "56",0
db "Test",0
!ObjectCount dd 0
; End of Initialized Data Section

; Start of Uninitialized Data Section

!CT_FORM equ 100
!CT_BUTTON equ 101
!CT_STATICTEXT equ 102
!CT_COMBOBOX equ 103
!CT_TEXTBOX equ 104
!CT_FRAME equ 105
!CT_LISTBOX equ 106
!CT_SLIDER equ 107
!CT_SPINNER equ 108
!CT_PROGRESSBAR equ 109
!CT_CALENDAR equ 110
!CT_HEADER equ 111
!CT_TREEVIEW equ 112
!CT_TABFOLDER equ 113
!CT_BUTTONLISTBOX equ 114
!CT_TOOLBAR equ 115
!CT_STATUSBAR equ 116
!CT_CHECKBOX equ 117
!CT_RADIOBUTTON equ 118
!CT_TIMER equ 119
!CT_RICHEDIT equ 120
!CT_RAEdit equ 121
!CT_RAGrid equ 122
!CT_TOOLWINDOW equ 123
!CT_LISTVIEW equ 124
align 4
_FltArgSafe0 rf 1
_FltArgSafe1 rf 1
_FloatRet rf 1
_LoopCtr rd 10
!hinstance rd 1
!dc rd 1
_InHandle rd 1
_OutHandle rd 1
_IOPthNum rd 1
_XferAddr rd 1
_PUArgs rd 15
_ArgList rd 1
_ArgNum rd 1
_Poker rd 1
_DummyArg rd 1
_FcnArg1 rd 1
_FcnArg2 rd 1
_FcnArg3 rd 1
_FcnArg4 rd 1
_FcnArg5 rd 1
_FcnArg6 rd 1
_FcnArg7 rd 1
_LongRet rd 1
_StringRet rd 3
_ArgSafe0 rd 1
_ArgSafe1 rd 1
_ArgSafe2 rd 1
_ArgSafe3 rd 1
!FileHandle rd 1
!FilBufAdr rd 1
!FilBufSiz rd 1
_SwitchInt rd 1
__ByteCounter rd 1
_PrtPthNum rd 1
_DataPtr rd 1
_Decimals rw 1
_Digits rw 1
_BoolRet rb 1
!PassSystemEvent rb 1
!PassInterceptEvent rb 1
align 4
; LN:1 dim x as long
x rd 1
; LN:2 dim z(5) as byte
align 4
z rb 5
goober equ $0d
!havis rb 1
 rb 1
wow rw 2
 rd 3
 rd $5555

;Temporary Vector
_TmpVec1 rd 3

;Temporary String Variable
_StrTmp1 rb 32

;Temporary Vector
_TmpVec2 rd 3

;Temporary Variable
_Tmp1 rd 1
; End of Uninitialized Data Section

; Start of Control Descriptor Section
section '.code' code readable executable
; Main Code Section
align 4
!Start:
call _Init
invoke GetModuleHandle, NULL
mov dword [!hinstance], eax
invoke GetCommandLine
mov dword [_ArgList],eax
mov dword edi,ProgramName
call __MovArg
invoke GetStdHandle, STD_INPUT_HANDLE
mov dword [_InHandle], eax
invoke GetStdHandle, STD_OUTPUT_HANDLE
mov dword [_OutHandle], eax
mov byte [_CRLF+12],13
mov byte [_CRLF+13],10
mov byte [_CRLF+14],0
mov byte [_Prompt+12],63
mov byte [_Prompt+13],0
mov byte [_NullStr+12],0
mov dword [_ErrVec],_ErrExit
; LN:3 const k=55
k equ 55
; LN:4 const k=56
k equ 56
; LN:5 $exok
; LN:6 goober equ $0d
; LN:7 !havis rb 1
; LN:8 meep db goober,$45
; LN:9 db $46,47
; LN:10 havis dd 22,33
; LN:11 dd 12345, 6789
; LN:12 poop db "hello",0
; LN:13 dw $5555
; LN:14 dd 12345
; LN:17 rb 1
; LN:18 wow rw 2
; LN:19 rd 3
; LN:20 rd $5555
; LN:22 x=0
mov dword [x],0
; LN:23 z(2)=0
mov esi,z-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:24 wow(2)=2222
mov esi,wow-(1*2)
mov eax,2
shl eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,2222
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:25 print meep(1)
mov esi,meep-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov esi,_TmpVec2
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl1
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl1:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:26 setvec a$=addr(poop)
mov esi,poop
mov eax,esi
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov [a$],eax
mov [a$+4],20
mov [a$+8],0
; LN:27 print a$
mov esi,a$
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl2
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl2:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
!label:
; LN:30 print wow(2)
mov esi,wow-(1*2)
mov eax,2
shl eax,1
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov esi,_TmpVec2
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl3
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl3:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:31 print havis(4)
mov esi,havis-(1*4)
mov eax,4
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov esi,_TmpVec2
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl4
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl4:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:32 set goober=99
goober equ 99
; LN:33 print goober
mov eax,99
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_TmpVec1
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl5
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl5:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0

; Automatic END statement
xor eax,eax
invoke ExitProcess, eax
_ErrExit:
cinvoke puts,_ErrExitMsg
mov eax,[ERR]
invoke ExitProcess, eax
; End of Code Section

; Init Section
_Init:

ret
; End of Init Section

; Function Code Section

__MovArg:
mov esi,[_ArgList]
mov edx,[edi+4]
mov edi,[edi]
__MovArg1:
mov al,[esi]
cmp al,32
je __MovArgSpace
mov [edi],al
or al,al
je __MovArgDone
inc esi
inc edi
dec edx
je __MovArgDone
jmp __MovArg1
__MovArgSpace:
xor al,al
mov [edi],al
inc esi
__MovArgDone:
mov [_ArgList],esi
ret
__ReadBool:
mov edi,[_DataPtr]
mov al,[edi]
cmp al,$30
jne __ReadBoolTrue
xor al,al
jmp __ReadBoolDone
__ReadBoolTrue:
mov al,1
__ReadBoolDone:
mov [esi],al
add edi,2
mov [_DataPtr],edi
ret
__ReadByte:
push esi
cinvoke atol,[_DataPtr]
pop esi
mov [esi],al
call __UpDateDataPtr
ret
__ReadShort:
push esi
cinvoke atol,[_DataPtr]
pop esi
mov [esi],ax
call __UpDateDataPtr
ret
__ReadLong:
push esi
cinvoke atol,[_DataPtr]
pop esi
mov [esi],eax
call __UpDateDataPtr
ret
__ReadFlt:
ret
__ReadStr:
mov edi,[_DataPtr]
__ReadStrLoop:
mov al,[edi]
mov [esi],al
inc edi
inc esi
cmp al,0
jne __ReadStrLoop
mov [_DataPtr],edi
ret
__UpDateDataPtr:
mov esi,[_DataPtr]
__UpDateDataPtrLoop:
mov al,[esi]
cmp al,0
je __UpDateDataPtrDone
inc esi
jmp __UpDateDataPtrLoop
__UpDateDataPtrDone:
inc esi
mov [_DataPtr],esi
ret
__MovStr:
push ebx
mov edx,[edi+4]
mov edi,[edi]
__MovStr1:
mov ecx,[esi+4]
or ecx,ecx
je __MovStrDone1
mov ebx,[esi]
__MovStr2:
mov al,[ebx]
mov [edi],al
inc edi
inc ebx
dec edx
je __MovStrDone2
or al,al
je __MovStr3
dec ecx
jne __MovStr2
jmp __MovStr4
__MovStr3:
dec edi
__MovStr4:
mov ecx,[esi+8]
or ecx,ecx
je __MovStrDone1
mov esi,ecx
jmp __MovStr1
__MovStrDone1:
mov byte [edi],0
__MovStrDone2:
pop ebx
ret
__StrLen:
xor eax,eax
__StrLenGetVec:
mov edi,[esi]
mov edx,[esi+4]
__StrLenLp:
mov cl,[edi]
cmp cl,0
je __StrLenChkLnk
inc eax
dec edx
je __StrLenChkLnk
inc edi
jmp __StrLenLp
__StrLenChkLnk:
mov esi,[esi+8]
or esi,esi
jne __StrLenGetVec
ret
; End of Function Section
