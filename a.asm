;Compiler Delaration Section

format PE GUI 4.0

entry _Start

macro align value { rb (value-1) - (rva $ + value-1) mod value }

_BufSize=300
; End of Declaration Section

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
	winmm,'WINMM.DLL',\
	msvcrt,'msvcrt.dll'

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
        import	CallWindowProc,'CallWindowProcA',\ 
		CheckDlgButton,'CheckDlgButton',\
		CheckRadioButton,'CheckRadioButton',\
         	CreateWindowEx,'CreateWindowExA',\
         	DefWindowProc,'DefWindowProcA',\
         	DispatchMessage,'DispatchMessageA',\
         	GetClientRect,'GetClientRect',\
         	GetMessage,'GetMessageA',\
		GetParent,'GetParent',\
		InvalidateRect,'InvalidateRect',\
         	LoadCursor,'LoadCursorA',\
         	LoadIcon,'LoadIconA',\
         	LoadMenu,'LoadMenuA',\
         	MessageBox,'MessageBoxA',\
         	MoveWindow,'MoveWindow',\
		PostMessage,'PostMessageA',\
         	PostQuitMessage,'PostQuitMessage',\
         	RedrawWindow,'RedrawWindow',\
		RegisterClass,'RegisterClassA',\
         	SendMessage,'SendMessageA',\
		GetWindowLong,'GetWindowLongA',\
         	SetWindowLong,'SetWindowLongA',\
		SetWindowPos,'SetWindowPos',\
		ShowWindow,'ShowWindow',\
		UpdateWindow,'UpdateWindow',\
         	TranslateMessage,'TranslateMessage'

gdi:
        import  CreateFontIndirect,'CreateFontIndirectA',\
		CreateSolidBrush,'CreateSolidBrush',\
                DeleteObject,'DeleteObject',\
		GetPixel,'GetPixel',\
		SetBkColor,'SetBkColor',\
		SetBkMode,'SetBkMode',\
		SetTextColor,'SetTextColor'

comctl:
        import  CreateMappedBitmap,'CreateMappedBitmap',\
		InitCommonControlsEx,'InitCommonControlsEx',\
                _TrackMouseEvent,'_TrackMouseEvent'

comdlg:
        import  ChooseFont,'ChooseColorA',\
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

; End of Import Section



section '.data' data readable writeable

align 4

ERR dd 0
_ErrVec dd 0
STATUS dd 0
POS dd 0
XferCount dd 0
_TrueStr db "TRUE",0
_FalseStr db "FALSE",0
!ControlType1 db 'HAVIS',0
!ControlType2 db 'BUTTON',0
!ControlType3 db 'STATIC',0
!ControlType4 db 'COMBOBOX',0
!ControlType5 db 'EDIT',0
!ControlType6 db 'BUTTON',0
!ControlType7 db 'LISTBOX',0
!ControlType8 db 'msctls_trackbar32',0
!ControlType9 db 'msctls_updown32',0
!ControlType10 db 'msctls_progress32',0
!ControlType11 db 'SysMonthCal32',0
!ControlType12 db 'SysHeader32',0
!ControlType13 db 'SysTreeView32',0
!ControlType14 db 'SysTabControl32',0
!ControlType15 db 'ButtonListBox',0
!ControlType16 db 'ToolbarWindow32',0
!ControlType17 db 'msctls_statusbar32',0
!ControlType18 db 'BUTTON',0
!ControlType19 db 'BUTTON',0
!OBMainWindowClass WNDCLASS
msg MSG
!OBMainClass db 'FCAPTION',0
!icc dd $00000008,$00003FFF
!title db 'OmniBasic',0
!FirstControl dd 0
_ErrExitMsg db 'Error exit',0
align 4
_IOBuffer dd _IOBuffer+12
 dd 500
 dd 0
 rb 500
align 4
_PrintBuf dd _PrintBuf+12
 dd 500
 dd 0
 rb 500
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
 dd 500
 dd 0
 rb 500
; LN:28 dim a$ as string*32
align 4
a$ dd a$+12
 dd 32
 dd 0
 rb 32
_StrConst1 db "Innomation Systems, Inc.",0
_StrConst2 db "Combo",0
_StrConst3 db "E&xit",0
_StrConst4 db "TextBox",0
_StrConst5 db "Item1",0
_StrConst6 db "Item2",0
_StrConst7 db "Item3",0
_StrConst8 db "Item4",0
_StrConst9 db "Item5",0
_StrConst10 db "Item6",0
_StrConst11 db "Header",0
_StrConst12 db "StaticText1",0
_StrConst13 db "StaticText2",0
_StrConst14 db "StaticText2",0
_StrConst15 db "Frame",0
_StrConst16 db "Havis",0
_StrConst17 db "CheckBox",0
_StrConst18 db "Frame",0
_StrConst19 db "Red",0
_StrConst20 db "Green",0
_StrConst21 db "Blue",0
_StrConst22 db "Black",0
_StrConst23 db "White",0
_StrConst24 db "TabFolder",0
_StrConst25 db "Item1",0
_StrConst26 db "Item2",0
_StrConst27 db "Item3",0
_StrConst28 db "Item4",0
_StrConst29 db "Item5",0
_StrConst30 db "Item6",0
_StrConst31 db "Item7",0
_StrConst32 db "Item8",0
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
align 4
OldFrameProc rd 1
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
_SwitchInt rd 1
__ByteCounter rd 1
_PrtPthNum rd 1
_DataPtr rd 1
_Decimals rw 1
_Digits rw 1
_BoolRet rb 1
align 4
OBMain rd 1
!OBMain rd 12
!Brush rd 1
!dsFwdPtr rd 1
!dsID rd 1
!dsOwner rd 1
!dsStatus rd 1
!dsLeft rd 1
!dsTop rd 1
!dsWidth rd 1
!dsHeight rd 1
!dsBackColor rd 1
!dsForeColor rd 1
!dsControlType rd 1
!dsControlHandle rd 1
; LN:1 DIM ExitButton AS BUTTON
align 4
!ExitButton rd 12
ExitButton rd 1
; LN:2 DIM TestArray(12) AS BUTTON
align 4
align 4
!TestArray rd 144
TestArray rd 12
; LN:3 DIM ComboBox AS COMBOBOX
align 4
!ComboBox rd 12
ComboBox rd 1
; LN:4 DIM TextBox AS TEXTBOX
align 4
!TextBox rd 12
TextBox rd 1
; LN:5 DIM Frame AS FRAME
align 4
!Frame rd 12
Frame rd 1
; LN:6 DIM StaticText1 AS STATICTEXT
align 4
!StaticText1 rd 12
StaticText1 rd 1
; LN:7 DIM StaticText2 AS STATICTEXT
align 4
!StaticText2 rd 12
StaticText2 rd 1
; LN:8 DIM StaticText3 AS STATICTEXT
align 4
!StaticText3 rd 12
StaticText3 rd 1
; LN:9 DIM ListBox AS LISTBOX
align 4
!ListBox rd 12
ListBox rd 1
; LN:10 DIM Slider AS SLIDER
align 4
!Slider rd 12
Slider rd 1
; LN:11 DIM Spinner AS SPINNER
align 4
!Spinner rd 12
Spinner rd 1
; LN:12 DIM ProgressBar AS PROGRESSBAR
align 4
!ProgressBar rd 12
ProgressBar rd 1
; LN:13 DIM Calendar AS CALENDAR
align 4
!Calendar rd 12
Calendar rd 1
; LN:14 DIM Header AS Header
align 4
!Header rd 12
Header rd 1
; LN:15 DIM TreeView AS TREEVIEW
align 4
!TreeView rd 12
TreeView rd 1
; LN:16 DIM TabFolder AS TABFOLDER
align 4
!TabFolder rd 12
TabFolder rd 1
; LN:17 DIM ButtonListBox AS BUTTONLISTBOX
align 4
!ButtonListBox rd 12
ButtonListBox rd 1
; LN:18 DIM ToolBar AS TOOLBAR
align 4
!ToolBar rd 12
ToolBar rd 1
; LN:19 DIM StatusBar AS STATUSBAR
align 4
!StatusBar rd 12
StatusBar rd 1
; LN:20 DIM CheckBox AS CheckBox
align 4
!CheckBox rd 12
CheckBox rd 1
; LN:21 DIM RB1 AS RADIOBUTTON
align 4
!RB1 rd 12
RB1 rd 1
; LN:22 DIM RadioButton1 AS RADIOBUTTON
align 4
!RadioButton1 rd 12
RadioButton1 rd 1
; LN:23 DIM RadioButton2 AS RADIOBUTTON
align 4
!RadioButton2 rd 12
RadioButton2 rd 1
; LN:24 DIM RadioButton3 AS RADIOBUTTON
align 4
!RadioButton3 rd 12
RadioButton3 rd 1
; LN:25 DIM RadioButton4 AS RADIOBUTTON
align 4
!RadioButton4 rd 12
RadioButton4 rd 1
; LN:26 DIM RadioButton5 AS RADIOBUTTON
align 4
!RadioButton5 rd 12
RadioButton5 rd 1
; LN:27 dim test1(10) as button
align 4
align 4
!test1 rd 120
test1 rd 10
; LN:29 type junk
; LN:34 dim trash(10) as junk
align 4
trash rb 120

;Temporary Vector
_TmpVec1 rd 3
; End of Uninitialized Data Section
section '.code' code readable executable
; Main Code Section
align 4
_Start:
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
invoke InitCommonControlsEx,!icc
invoke LoadIcon,0,IDI_APPLICATION
mov [!OBMainWindowClass.hIcon],eax
invoke LoadCursor,0,IDC_ARROW
mov [!OBMainWindowClass.hCursor],eax
mov [!OBMainWindowClass.style],0
mov [!OBMainWindowClass.lpfnWndProc],!WindowProc
mov [!OBMainWindowClass.cbClsExtra],0
mov [!OBMainWindowClass.cbWndExtra],0
mov eax,[!hinstance]
mov [!OBMainWindowClass.hInstance],eax
mov [!OBMainWindowClass.hbrBackground],COLOR_BTNFACE+1
mov [!OBMainWindowClass.lpszMenuName],0
mov [!OBMainWindowClass.lpszClassName],!OBMainClass
invoke RegisterClass,!OBMainWindowClass
mov dword [!OBMain],0
mov dword [!OBMain+44],eax
mov dword [!OBMain+4],1
mov dword [!OBMain+8],eax
mov dword [!OBMain+12],6
mov dword [!OBMain+16],0
mov dword [!OBMain+20],0
mov dword [!OBMain+24],400
mov dword [!OBMain+28],300
mov dword [!OBMain+32],$ffffff
mov dword [!OBMain+36],$000000
mov dword [!OBMain+40],!CT_FORM
mov dword eax,!OBMain
mov dword [!FirstControl],eax
invoke CreateWindowEx,0,!OBMainClass,!title,WS_VISIBLE+WS_OVERLAPPEDWINDOW,0,0,400,300,NULL,NULL,[!hinstance],NULL
mov dword [OBMain],eax

!MsgLoop:
invoke GetMessage,msg,NULL,0,0
or eax,eax
jz !EndMsgLoop
invoke TranslateMessage,msg
invoke DispatchMessage,msg
jmp !MsgLoop
!EndMsgLoop:
invoke ExitProcess,[msg.wParam]

proc GBSProc,OBMain,wmsg,wparam,lparam
enter
push ebx esi edi
cmp [wmsg],WM_CTLCOLORSTATIC
je CtlColorChange
cmp [wmsg],WM_CTLCOLOREDIT
je CtlColorChange
cmp [wmsg],WM_CTLCOLORBTN
je CtlColorChange
cmp [wmsg],WM_COMMAND
jne notcmd
invoke GetParent,[RadioButton1]
invoke PostMessage,eax,[wmsg],[wparam],[lparam]
call OBMain_Command
jmp finish
notcmd:
invoke CallWindowProc,[OldFrameProc],[OBMain],[wmsg],[wparam],[lparam]
finish:
pop edi esi ebx
return

CtlColorChange:
call !GetDesc
bt [!dsStatus],3
jnc !DefWndProc
invoke DeleteObject,[!Brush]
invoke CreateSolidBrush,[!dsBackColor]
mov [!Brush],eax
invoke SetBkColor,[wparam],[!dsBackColor]
invoke SetTextColor,[wparam],[!dsForeColor]
mov eax,[!Brush]
jmp finish

proc !WindowProc,OBMain,wmsg,wparam,lparam
enter
push ebx esi edi
cmp [wmsg],WM_CREATE
je !wmCreate
cmp [wmsg],WM_CTLCOLORSTATIC
je !CtlColorChange
cmp [wmsg],WM_CTLCOLOREDIT
je !CtlColorChange
cmp [wmsg],WM_CTLCOLORBTN
je !CtlColorChange
cmp [wmsg],WM_CTLCOLORSCROLLBAR
je !CtlColorChange
cmp [wmsg],WM_CTLCOLORLISTBOX
je !CtlColorChange
cmp [wmsg],WM_CTLCOLORDLG
je !CtlColorChange
cmp [wmsg],WM_CTLCOLORMSGBOX
je !CtlColorChange
cmp [wmsg],WM_COMMAND
je !wmCommand
cmp [wmsg],WM_DESTROY
je !wmDestroy

!DefWndProc:
invoke DefWindowProc,[OBMain],[wmsg],[wparam],[lparam]
jmp !Finish

!wmCreate:
invoke CreateSolidBrush,0
mov [!Brush],eax
call OBMain_Load
jmp !Finish

!CtlColorChange:
call !GetDesc
bt [!dsStatus],3
jnc !DefWndProc
invoke DeleteObject,[!Brush]
invoke CreateSolidBrush,[!dsBackColor]
mov [!Brush],eax
invoke SetBkColor,[wparam],[!dsBackColor]
invoke SetTextColor,[wparam],[!dsForeColor]
mov eax,[!Brush]
jmp !Finish

!wmCommand:
call OBMain_Command
jmp !Finish

!GetDesc:
mov esi,[!FirstControl]
!GetDescLp:
mov eax,[esi+44]
cmp [lparam],eax
je !GetDescFound
mov esi,[esi]
or esi,esi
jne !GetDescLp
mov esi,[!FirstControl]
!GetDescFound:
mov eax,[esi]
mov [!dsFwdPtr],eax
mov eax,[esi+4]
mov [!dsID],eax
mov eax,[esi+8]
mov [!dsOwner],eax
mov eax,[esi+12]
mov [!dsStatus],eax
mov eax,[esi+16]
mov [!dsLeft],eax
mov eax,[esi+20]
mov [!dsTop],eax
mov eax,[esi+24]
mov [!dsWidth],eax
mov eax,[esi+28]
mov [!dsHeight],eax
mov eax,[esi+32]
mov [!dsBackColor],eax
mov eax,[esi+36]
mov [!dsForeColor],eax
mov eax,[esi+40]
mov [!dsControlType],eax
mov eax,[esi+44]
mov [!dsControlHandle],eax
ret

!wmDestroy:
invoke DeleteObject,[!Brush]
invoke PostQuitMessage,0
xor eax,eax

!Finish:
pop edi esi ebx
return

OBMain_Load:
; LN:37 SETPOSITION OBMain,200,200,624,368
mov eax,200
mov [!OBMain+16],eax
mov eax,200
mov [!OBMain+20],eax
mov eax,624
mov [!OBMain+24],eax
mov eax,368
mov [!OBMain+28],eax
invoke SetWindowPos,[OBMain],HWND_BOTTOM,[!OBMain+16],[!OBMain+20],[!OBMain+24],[!OBMain+28],0
; LN:38 SETTEXT OBMain,"Innomation Systems, Inc."
mov esi,_StrConst1
mov [_TmpVec1],esi
mov [_TmpVec1+4],25
mov [_TmpVec1+8],0
invoke SendMessage,[OBMain],WM_SETTEXT,0,[_TmpVec1]
; LN:40 a$="Combo"
mov edi,[a$]
mov esi,_StrConst2
call __SetStrConst
; LN:42 'setbackcolor OBMain,$ff0000
; LN:44 CONSTRUCT ToolBar
invoke CreateWindowEx,0,!ControlType16,NULL,WS_VISIBLE+WS_CHILD,0,0,200,20,[OBMain],101,[!hinstance],NULL
mov dword [ToolBar],eax
mov dword [!ToolBar+44],eax
mov dword [!OBMain+0],!ToolBar
mov dword [!ToolBar+0],0
mov dword [!ToolBar+40],115
mov dword [!ToolBar+4],101
mov eax,[OBMain]
mov dword [!ToolBar+8],eax
mov dword [!ToolBar+12],6
mov dword [!ToolBar+20],0
mov dword [!ToolBar+16],0
mov dword [!ToolBar+24],200
mov dword [!ToolBar+28],20
mov dword [!ToolBar+32],0
mov dword [!ToolBar+36],0
; LN:46 Construct StatusBar
invoke CreateWindowEx,0,!ControlType17,NULL,WS_VISIBLE+WS_CHILD,0,0,200,200,[OBMain],102,[!hinstance],NULL
mov dword [StatusBar],eax
mov dword [!StatusBar+44],eax
mov dword [!ToolBar+0],!StatusBar
mov dword [!StatusBar+0],0
mov dword [!StatusBar+40],116
mov dword [!StatusBar+4],102
mov eax,[OBMain]
mov dword [!StatusBar+8],eax
mov dword [!StatusBar+12],6
mov dword [!StatusBar+20],0
mov dword [!StatusBar+16],0
mov dword [!StatusBar+24],200
mov dword [!StatusBar+28],200
mov dword [!StatusBar+32],0
mov dword [!StatusBar+36],0
; LN:48 CONSTRUCT ExitButton
invoke CreateWindowEx,0,!ControlType2,NULL,WS_VISIBLE+WS_CHILD+BS_DEFPUSHBUTTON,0,0,80,30,[OBMain],103,[!hinstance],NULL
mov dword [ExitButton],eax
mov dword [!ExitButton+44],eax
mov dword [!StatusBar+0],!ExitButton
mov dword [!ExitButton+0],0
mov dword [!ExitButton+40],101
mov dword [!ExitButton+4],103
mov eax,[OBMain]
mov dword [!ExitButton+8],eax
mov dword [!ExitButton+12],6
mov dword [!ExitButton+20],0
mov dword [!ExitButton+16],0
mov dword [!ExitButton+24],80
mov dword [!ExitButton+28],30
mov dword [!ExitButton+32],0
mov dword [!ExitButton+36],0
; LN:49 SETPOSITION ExitButton,550,280,64,32
mov eax,550
mov [!ExitButton+16],eax
mov eax,280
mov [!ExitButton+20],eax
mov eax,64
mov [!ExitButton+24],eax
mov eax,32
mov [!ExitButton+28],eax
invoke SetWindowPos,[ExitButton],HWND_BOTTOM,[!ExitButton+16],[!ExitButton+20],[!ExitButton+24],[!ExitButton+28],0
; LN:50 SETTEXT ExitButton,"E&xit"
mov esi,_StrConst3
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage,[ExitButton],WM_SETTEXT,0,[_TmpVec1]
; LN:52 CONSTRUCT TextBox
invoke CreateWindowEx,WS_EX_CLIENTEDGE,!ControlType5,NULL,WS_VISIBLE+WS_CHILD,0,0,80,30,[OBMain],104,[!hinstance],NULL
mov dword [TextBox],eax
mov dword [!TextBox+44],eax
mov dword [!ExitButton+0],!TextBox
mov dword [!TextBox+0],0
mov dword [!TextBox+40],104
mov dword [!TextBox+4],104
mov eax,[OBMain]
mov dword [!TextBox+8],eax
mov dword [!TextBox+12],6
mov dword [!TextBox+20],0
mov dword [!TextBox+16],0
mov dword [!TextBox+24],80
mov dword [!TextBox+28],30
mov dword [!TextBox+32],0
mov dword [!TextBox+36],0
; LN:53 SETPOSITION TextBox,100,40,80,20
mov eax,100
mov [!TextBox+16],eax
mov eax,40
mov [!TextBox+20],eax
mov eax,80
mov [!TextBox+24],eax
mov eax,20
mov [!TextBox+28],eax
invoke SetWindowPos,[TextBox],HWND_BOTTOM,[!TextBox+16],[!TextBox+20],[!TextBox+24],[!TextBox+28],0
; LN:54 SETTEXT TextBox,"TextBox"
mov esi,_StrConst4
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
invoke SendMessage,[TextBox],WM_SETTEXT,0,[_TmpVec1]
; LN:55 SETCOLOR TextBox,$c0c000,$0080ff
bts dword [!TextBox+12],3
mov eax,12632064
mov [!TextBox+32],eax
mov eax,33023
mov [!TextBox+36],eax
invoke InvalidateRect,[TextBox],NULL,TRUE
; LN:57 CONSTRUCT ComboBox
invoke CreateWindowEx,0,!ControlType4,NULL,WS_VSCROLL+WS_VISIBLE+WS_CHILD+CBS_DROPDOWN,0,0,80,30,[OBMain],105,[!hinstance],NULL
mov dword [ComboBox],eax
mov dword [!ComboBox+44],eax
mov dword [!TextBox+0],!ComboBox
mov dword [!ComboBox+0],0
mov dword [!ComboBox+40],103
mov dword [!ComboBox+4],105
mov eax,[OBMain]
mov dword [!ComboBox+8],eax
mov dword [!ComboBox+12],6
mov dword [!ComboBox+20],0
mov dword [!ComboBox+16],0
mov dword [!ComboBox+24],80
mov dword [!ComboBox+28],30
mov dword [!ComboBox+32],0
mov dword [!ComboBox+36],0
; LN:58 SETPOSITION ComboBox,10,40,80,100
mov eax,10
mov [!ComboBox+16],eax
mov eax,40
mov [!ComboBox+20],eax
mov eax,80
mov [!ComboBox+24],eax
mov eax,100
mov [!ComboBox+28],eax
invoke SetWindowPos,[ComboBox],HWND_BOTTOM,[!ComboBox+16],[!ComboBox+20],[!ComboBox+24],[!ComboBox+28],0
; LN:59 SETTEXT ComboBox,a$
invoke SendMessage,[ComboBox],WM_SETTEXT,0,[a$]
; LN:60 SETCOLOR ComboBox,$000080,$00ffff
bts dword [!ComboBox+12],3
mov eax,128
mov [!ComboBox+32],eax
mov eax,65535
mov [!ComboBox+36],eax
invoke InvalidateRect,[ComboBox],NULL,TRUE
; LN:61 ADDITEM ComboBox,"Item1"
mov esi,_StrConst5
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage,[ComboBox],CB_ADDSTRING,0,[_TmpVec1]
; LN:62 ADDITEM ComboBox,"Item2"
mov esi,_StrConst6
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage,[ComboBox],CB_ADDSTRING,0,[_TmpVec1]
; LN:63 ADDITEM ComboBox,"Item3"
mov esi,_StrConst7
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage,[ComboBox],CB_ADDSTRING,0,[_TmpVec1]
; LN:64 ADDITEM ComboBox,"Item4"
mov esi,_StrConst8
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage,[ComboBox],CB_ADDSTRING,0,[_TmpVec1]
; LN:65 ADDITEM ComboBox,"Item5"
mov esi,_StrConst9
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage,[ComboBox],CB_ADDSTRING,0,[_TmpVec1]
; LN:66 ADDITEM ComboBox,"Item6"
mov esi,_StrConst10
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage,[ComboBox],CB_ADDSTRING,0,[_TmpVec1]
; LN:68 CONSTRUCT Header
invoke CreateWindowEx,0,!ControlType12,NULL,WS_VISIBLE+WS_CHILD,0,0,80,30,[OBMain],106,[!hinstance],NULL
mov dword [Header],eax
mov dword [!Header+44],eax
mov dword [!ComboBox+0],!Header
mov dword [!Header+0],0
mov dword [!Header+40],111
mov dword [!Header+4],106
mov eax,[OBMain]
mov dword [!Header+8],eax
mov dword [!Header+12],6
mov dword [!Header+20],0
mov dword [!Header+16],0
mov dword [!Header+24],80
mov dword [!Header+28],30
mov dword [!Header+32],0
mov dword [!Header+36],0
; LN:69 SETPOSITION Header,10,80,80,20
mov eax,10
mov [!Header+16],eax
mov eax,80
mov [!Header+20],eax
mov eax,80
mov [!Header+24],eax
mov eax,20
mov [!Header+28],eax
invoke SetWindowPos,[Header],HWND_BOTTOM,[!Header+16],[!Header+20],[!Header+24],[!Header+28],0
; LN:70 SETTEXT Header,"Header"
mov esi,_StrConst11
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
invoke SendMessage,[Header],WM_SETTEXT,0,[_TmpVec1]
; LN:72 CONSTRUCT StaticText1
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD,0,0,80,30,[OBMain],107,[!hinstance],NULL
mov dword [StaticText1],eax
mov dword [!StaticText1+44],eax
mov dword [!Header+0],!StaticText1
mov dword [!StaticText1+0],0
mov dword [!StaticText1+40],102
mov dword [!StaticText1+4],107
mov eax,[OBMain]
mov dword [!StaticText1+8],eax
mov dword [!StaticText1+12],6
mov dword [!StaticText1+20],0
mov dword [!StaticText1+16],0
mov dword [!StaticText1+24],80
mov dword [!StaticText1+28],30
mov dword [!StaticText1+32],0
mov dword [!StaticText1+36],0
; LN:73 SETPOSITION StaticText1,200,40,80,15
mov eax,200
mov [!StaticText1+16],eax
mov eax,40
mov [!StaticText1+20],eax
mov eax,80
mov [!StaticText1+24],eax
mov eax,15
mov [!StaticText1+28],eax
invoke SetWindowPos,[StaticText1],HWND_BOTTOM,[!StaticText1+16],[!StaticText1+20],[!StaticText1+24],[!StaticText1+28],0
; LN:74 SETTEXT StaticText1,"StaticText1"
mov esi,_StrConst12
mov [_TmpVec1],esi
mov [_TmpVec1+4],12
mov [_TmpVec1+8],0
invoke SendMessage,[StaticText1],WM_SETTEXT,0,[_TmpVec1]
; LN:75 SETCOLOR StaticText1,$ff,$ffffff
bts dword [!StaticText1+12],3
mov eax,255
mov [!StaticText1+32],eax
mov eax,16777215
mov [!StaticText1+36],eax
invoke InvalidateRect,[StaticText1],NULL,TRUE
; LN:77 CONSTRUCT StaticText2
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD,0,0,80,30,[OBMain],108,[!hinstance],NULL
mov dword [StaticText2],eax
mov dword [!StaticText2+44],eax
mov dword [!StaticText1+0],!StaticText2
mov dword [!StaticText2+0],0
mov dword [!StaticText2+40],102
mov dword [!StaticText2+4],108
mov eax,[OBMain]
mov dword [!StaticText2+8],eax
mov dword [!StaticText2+12],6
mov dword [!StaticText2+20],0
mov dword [!StaticText2+16],0
mov dword [!StaticText2+24],80
mov dword [!StaticText2+28],30
mov dword [!StaticText2+32],0
mov dword [!StaticText2+36],0
; LN:78 SETPOSITION StaticText2,200,55,80,15
mov eax,200
mov [!StaticText2+16],eax
mov eax,55
mov [!StaticText2+20],eax
mov eax,80
mov [!StaticText2+24],eax
mov eax,15
mov [!StaticText2+28],eax
invoke SetWindowPos,[StaticText2],HWND_BOTTOM,[!StaticText2+16],[!StaticText2+20],[!StaticText2+24],[!StaticText2+28],0
; LN:79 SETTEXT StaticText2,"StaticText2"
mov esi,_StrConst13
mov [_TmpVec1],esi
mov [_TmpVec1+4],12
mov [_TmpVec1+8],0
invoke SendMessage,[StaticText2],WM_SETTEXT,0,[_TmpVec1]
; LN:80 SETCOLOR StaticText2,$ff00,$ff0000
bts dword [!StaticText2+12],3
mov eax,65280
mov [!StaticText2+32],eax
mov eax,16711680
mov [!StaticText2+36],eax
invoke InvalidateRect,[StaticText2],NULL,TRUE
; LN:82 CONSTRUCT StaticText3
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD,0,0,80,30,[OBMain],109,[!hinstance],NULL
mov dword [StaticText3],eax
mov dword [!StaticText3+44],eax
mov dword [!StaticText2+0],!StaticText3
mov dword [!StaticText3+0],0
mov dword [!StaticText3+40],102
mov dword [!StaticText3+4],109
mov eax,[OBMain]
mov dword [!StaticText3+8],eax
mov dword [!StaticText3+12],6
mov dword [!StaticText3+20],0
mov dword [!StaticText3+16],0
mov dword [!StaticText3+24],80
mov dword [!StaticText3+28],30
mov dword [!StaticText3+32],0
mov dword [!StaticText3+36],0
; LN:83 SETPOSITION StaticText3,200,70,80,15
mov eax,200
mov [!StaticText3+16],eax
mov eax,70
mov [!StaticText3+20],eax
mov eax,80
mov [!StaticText3+24],eax
mov eax,15
mov [!StaticText3+28],eax
invoke SetWindowPos,[StaticText3],HWND_BOTTOM,[!StaticText3+16],[!StaticText3+20],[!StaticText3+24],[!StaticText3+28],0
; LN:84 SETTEXT StaticText3,"StaticText2"
mov esi,_StrConst14
mov [_TmpVec1],esi
mov [_TmpVec1+4],12
mov [_TmpVec1+8],0
invoke SendMessage,[StaticText3],WM_SETTEXT,0,[_TmpVec1]
; LN:85 SETCOLOR StaticText3,$ff0000,$00ffff
bts dword [!StaticText3+12],3
mov eax,16711680
mov [!StaticText3+32],eax
mov eax,65535
mov [!StaticText3+36],eax
invoke InvalidateRect,[StaticText3],NULL,TRUE
; LN:87 CONSTRUCT Slider
invoke CreateWindowEx,0,!ControlType8,NULL,WS_VISIBLE+WS_CHILD+256,0,0,100,30,[OBMain],110,[!hinstance],NULL
mov dword [Slider],eax
mov dword [!Slider+44],eax
mov dword [!StaticText3+0],!Slider
mov dword [!Slider+0],0
mov dword [!Slider+40],107
mov dword [!Slider+4],110
mov eax,[OBMain]
mov dword [!Slider+8],eax
mov dword [!Slider+12],6
mov dword [!Slider+20],0
mov dword [!Slider+16],0
mov dword [!Slider+24],100
mov dword [!Slider+28],30
mov dword [!Slider+32],0
mov dword [!Slider+36],0
invoke GetWindowLong,[Slider],GWL_STYLE
or eax,TBS_NOTICKS
invoke SetWindowLong,[Slider],GWL_STYLE,eax
; LN:91 '+invoke UpdateWindow,[Slider]
; LN:92 SETPOSITION Slider,300,40,120,20
mov eax,300
mov [!Slider+16],eax
mov eax,40
mov [!Slider+20],eax
mov eax,120
mov [!Slider+24],eax
mov eax,20
mov [!Slider+28],eax
invoke SetWindowPos,[Slider],HWND_BOTTOM,[!Slider+16],[!Slider+20],[!Slider+24],[!Slider+28],0
; LN:93 SETTEXT Slider,"Frame",$80ff
mov esi,_StrConst15
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage,[Slider],WM_SETTEXT,0,[_TmpVec1]
; LN:94 SETCOLOR Slider,$80ff,0
bts dword [!Slider+12],3
mov eax,33023
mov [!Slider+32],eax
mov eax,0
mov [!Slider+36],eax
invoke InvalidateRect,[Slider],NULL,TRUE
; LN:96 CONSTRUCT RB1
invoke CreateWindowEx,0,!ControlType19,NULL,WS_VISIBLE+WS_CHILD+BS_AUTORADIOBUTTON,0,0,80,30,[OBMain],111,[!hinstance],NULL
mov dword [RB1],eax
mov dword [!RB1+44],eax
mov dword [!Slider+0],!RB1
mov dword [!RB1+0],0
mov dword [!RB1+40],118
mov dword [!RB1+4],111
mov eax,[OBMain]
mov dword [!RB1+8],eax
mov dword [!RB1+12],6
mov dword [!RB1+20],0
mov dword [!RB1+16],0
mov dword [!RB1+24],80
mov dword [!RB1+28],30
mov dword [!RB1+32],0
mov dword [!RB1+36],0
; LN:97 SETPOSITION RB1,300,70,100,20
mov eax,300
mov [!RB1+16],eax
mov eax,70
mov [!RB1+20],eax
mov eax,100
mov [!RB1+24],eax
mov eax,20
mov [!RB1+28],eax
invoke SetWindowPos,[RB1],HWND_BOTTOM,[!RB1+16],[!RB1+20],[!RB1+24],[!RB1+28],0
; LN:98 SETTEXT RB1,"Havis"
mov esi,_StrConst16
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage,[RB1],WM_SETTEXT,0,[_TmpVec1]
; LN:99 SETCOLOR RB1,$800080,$00ffff
bts dword [!RB1+12],3
mov eax,8388736
mov [!RB1+32],eax
mov eax,65535
mov [!RB1+36],eax
invoke InvalidateRect,[RB1],NULL,TRUE
; LN:101 CONSTRUCT CheckBox
invoke CreateWindowEx,0,!ControlType18,NULL,WS_VISIBLE+WS_CHILD+BS_AUTOCHECKBOX,0,0,80,30,[OBMain],112,[!hinstance],NULL
mov dword [CheckBox],eax
mov dword [!CheckBox+44],eax
mov dword [!RB1+0],!CheckBox
mov dword [!CheckBox+0],0
mov dword [!CheckBox+40],117
mov dword [!CheckBox+4],112
mov eax,[OBMain]
mov dword [!CheckBox+8],eax
mov dword [!CheckBox+12],6
mov dword [!CheckBox+20],0
mov dword [!CheckBox+16],0
mov dword [!CheckBox+24],80
mov dword [!CheckBox+28],30
mov dword [!CheckBox+32],0
mov dword [!CheckBox+36],0
; LN:102 SETPOSITION CheckBox,440,40,100,20
mov eax,440
mov [!CheckBox+16],eax
mov eax,40
mov [!CheckBox+20],eax
mov eax,100
mov [!CheckBox+24],eax
mov eax,20
mov [!CheckBox+28],eax
invoke SetWindowPos,[CheckBox],HWND_BOTTOM,[!CheckBox+16],[!CheckBox+20],[!CheckBox+24],[!CheckBox+28],0
; LN:103 SETTEXT CheckBox,"CheckBox"
mov esi,_StrConst17
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
invoke SendMessage,[CheckBox],WM_SETTEXT,0,[_TmpVec1]
; LN:104 SETCOLOR CheckBox,$ff0000,$00ffff
bts dword [!CheckBox+12],3
mov eax,16711680
mov [!CheckBox+32],eax
mov eax,65535
mov [!CheckBox+36],eax
invoke InvalidateRect,[CheckBox],NULL,TRUE
invoke SendMessage,[CheckBox],BM_SETCHECK,BST_CHECKED,0
; LN:108 CONSTRUCT Frame
invoke CreateWindowEx,0,!ControlType6,NULL,WS_VISIBLE+WS_CHILD+BS_GROUPBOX,0,0,200,200,[OBMain],113,[!hinstance],NULL
mov dword [Frame],eax
mov dword [!Frame+44],eax
mov dword [!CheckBox+0],!Frame
mov dword [!Frame+0],0
mov dword [!Frame+40],105
mov dword [!Frame+4],113
mov eax,[OBMain]
mov dword [!Frame+8],eax
mov dword [!Frame+12],6
mov dword [!Frame+20],0
mov dword [!Frame+16],0
mov dword [!Frame+24],200
mov dword [!Frame+28],200
mov dword [!Frame+32],0
mov dword [!Frame+36],0
; LN:109 SETPOSITION Frame,10,70,130,140
mov eax,10
mov [!Frame+16],eax
mov eax,70
mov [!Frame+20],eax
mov eax,130
mov [!Frame+24],eax
mov eax,140
mov [!Frame+28],eax
invoke SetWindowPos,[Frame],HWND_BOTTOM,[!Frame+16],[!Frame+20],[!Frame+24],[!Frame+28],0
; LN:110 SETTEXT Frame,"Frame"
mov esi,_StrConst18
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage,[Frame],WM_SETTEXT,0,[_TmpVec1]
; LN:112 SETCOLOR Frame,$00ffff,$0000ff
bts dword [!Frame+12],3
mov eax,65535
mov [!Frame+32],eax
mov eax,255
mov [!Frame+36],eax
invoke InvalidateRect,[Frame],NULL,TRUE
; LN:114 CONSTRUCT RadioButton1 IN Frame
invoke CreateWindowEx,0,!ControlType19,NULL,WS_VISIBLE+WS_CHILD+BS_AUTORADIOBUTTON,0,0,80,30,[Frame],114,[!hinstance],NULL
mov dword [RadioButton1],eax
mov dword [!RadioButton1+44],eax
mov dword [!Frame+0],!RadioButton1
mov dword [!RadioButton1+0],0
mov dword [!RadioButton1+40],118
mov dword [!RadioButton1+4],114
mov eax,[Frame]
mov dword [!RadioButton1+8],eax
mov dword [!RadioButton1+12],6
mov dword [!RadioButton1+20],0
mov dword [!RadioButton1+16],0
mov dword [!RadioButton1+24],80
mov dword [!RadioButton1+28],30
mov dword [!RadioButton1+32],0
mov dword [!RadioButton1+36],0
invoke SetWindowLong,[Frame],GWL_WNDPROC,GBSProc
mov [OldFrameProc],eax
; LN:115 SETPOSITION RadioButton1,5,30,100,20
mov eax,5
mov [!RadioButton1+16],eax
mov eax,30
mov [!RadioButton1+20],eax
mov eax,100
mov [!RadioButton1+24],eax
mov eax,20
mov [!RadioButton1+28],eax
invoke SetWindowPos,[RadioButton1],HWND_BOTTOM,[!RadioButton1+16],[!RadioButton1+20],[!RadioButton1+24],[!RadioButton1+28],0
; LN:116 SETTEXT RadioButton1,"Red"
mov esi,_StrConst19
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
invoke SendMessage,[RadioButton1],WM_SETTEXT,0,[_TmpVec1]
; LN:117 SETCOLOR RadioButton1,$0000ff,$00ffff
bts dword [!RadioButton1+12],3
mov eax,255
mov [!RadioButton1+32],eax
mov eax,65535
mov [!RadioButton1+36],eax
invoke InvalidateRect,[RadioButton1],NULL,TRUE
; LN:119 CONSTRUCT RadioButton2 IN Frame
invoke CreateWindowEx,0,!ControlType19,NULL,WS_VISIBLE+WS_CHILD+BS_AUTORADIOBUTTON,0,0,80,30,[Frame],115,[!hinstance],NULL
mov dword [RadioButton2],eax
mov dword [!RadioButton2+44],eax
mov dword [!RadioButton1+0],!RadioButton2
mov dword [!RadioButton2+0],0
mov dword [!RadioButton2+40],118
mov dword [!RadioButton2+4],115
mov eax,[Frame]
mov dword [!RadioButton2+8],eax
mov dword [!RadioButton2+12],6
mov dword [!RadioButton2+20],0
mov dword [!RadioButton2+16],0
mov dword [!RadioButton2+24],80
mov dword [!RadioButton2+28],30
mov dword [!RadioButton2+32],0
mov dword [!RadioButton2+36],0
; LN:120 SETPOSITION RadioButton2,5,50,100,20
mov eax,5
mov [!RadioButton2+16],eax
mov eax,50
mov [!RadioButton2+20],eax
mov eax,100
mov [!RadioButton2+24],eax
mov eax,20
mov [!RadioButton2+28],eax
invoke SetWindowPos,[RadioButton2],HWND_BOTTOM,[!RadioButton2+16],[!RadioButton2+20],[!RadioButton2+24],[!RadioButton2+28],0
; LN:121 SETTEXT RadioButton2,"Green"
mov esi,_StrConst20
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage,[RadioButton2],WM_SETTEXT,0,[_TmpVec1]
bts dword [!RadioButton2+12],3
mov eax,$ff00
mov [!RadioButton2+32],eax
mov eax,65535
mov [!RadioButton2+36],eax
invoke InvalidateRect,[RadioButton1],NULL,TRUE
; LN:123 CONSTRUCT RadioButton3 IN Frame
invoke CreateWindowEx,0,!ControlType19,NULL,WS_VISIBLE+WS_CHILD+BS_AUTORADIOBUTTON,0,0,80,30,[Frame],116,[!hinstance],NULL
mov dword [RadioButton3],eax
mov dword [!RadioButton3+44],eax
mov dword [!RadioButton2+0],!RadioButton3
mov dword [!RadioButton3+0],0
mov dword [!RadioButton3+40],118
mov dword [!RadioButton3+4],116
mov eax,[Frame]
mov dword [!RadioButton3+8],eax
mov dword [!RadioButton3+12],6
mov dword [!RadioButton3+20],0
mov dword [!RadioButton3+16],0
mov dword [!RadioButton3+24],80
mov dword [!RadioButton3+28],30
mov dword [!RadioButton3+32],0
mov dword [!RadioButton3+36],0
; LN:124 SETPOSITION RadioButton3,5,70,100,20
mov eax,5
mov [!RadioButton3+16],eax
mov eax,70
mov [!RadioButton3+20],eax
mov eax,100
mov [!RadioButton3+24],eax
mov eax,20
mov [!RadioButton3+28],eax
invoke SetWindowPos,[RadioButton3],HWND_BOTTOM,[!RadioButton3+16],[!RadioButton3+20],[!RadioButton3+24],[!RadioButton3+28],0
; LN:125 SETTEXT RadioButton3,"Blue"
mov esi,_StrConst21
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
invoke SendMessage,[RadioButton3],WM_SETTEXT,0,[_TmpVec1]
bts dword [!RadioButton3+12],3
mov eax,$ff0000
mov [!RadioButton3+32],eax
mov eax,65535
mov [!RadioButton3+36],eax
invoke InvalidateRect,[RadioButton1],NULL,TRUE
; LN:127 CONSTRUCT RadioButton4 IN Frame
invoke CreateWindowEx,0,!ControlType19,NULL,WS_VISIBLE+WS_CHILD+BS_AUTORADIOBUTTON,0,0,80,30,[Frame],117,[!hinstance],NULL
mov dword [RadioButton4],eax
mov dword [!RadioButton4+44],eax
mov dword [!RadioButton3+0],!RadioButton4
mov dword [!RadioButton4+0],0
mov dword [!RadioButton4+40],118
mov dword [!RadioButton4+4],117
mov eax,[Frame]
mov dword [!RadioButton4+8],eax
mov dword [!RadioButton4+12],6
mov dword [!RadioButton4+20],0
mov dword [!RadioButton4+16],0
mov dword [!RadioButton4+24],80
mov dword [!RadioButton4+28],30
mov dword [!RadioButton4+32],0
mov dword [!RadioButton4+36],0
; LN:128 SETPOSITION RadioButton4,5,90,100,20
mov eax,5
mov [!RadioButton4+16],eax
mov eax,90
mov [!RadioButton4+20],eax
mov eax,100
mov [!RadioButton4+24],eax
mov eax,20
mov [!RadioButton4+28],eax
invoke SetWindowPos,[RadioButton4],HWND_BOTTOM,[!RadioButton4+16],[!RadioButton4+20],[!RadioButton4+24],[!RadioButton4+28],0
; LN:129 SETTEXT RadioButton4,"Black"
mov esi,_StrConst22
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage,[RadioButton4],WM_SETTEXT,0,[_TmpVec1]
; LN:131 CONSTRUCT RadioButton5 IN Frame
invoke CreateWindowEx,0,!ControlType19,NULL,WS_VISIBLE+WS_CHILD+BS_AUTORADIOBUTTON,0,0,80,30,[Frame],118,[!hinstance],NULL
mov dword [RadioButton5],eax
mov dword [!RadioButton5+44],eax
mov dword [!RadioButton4+0],!RadioButton5
mov dword [!RadioButton5+0],0
mov dword [!RadioButton5+40],118
mov dword [!RadioButton5+4],118
mov eax,[Frame]
mov dword [!RadioButton5+8],eax
mov dword [!RadioButton5+12],6
mov dword [!RadioButton5+20],0
mov dword [!RadioButton5+16],0
mov dword [!RadioButton5+24],80
mov dword [!RadioButton5+28],30
mov dword [!RadioButton5+32],0
mov dword [!RadioButton5+36],0
; LN:132 SETPOSITION RadioButton5,5,110,100,20
mov eax,5
mov [!RadioButton5+16],eax
mov eax,110
mov [!RadioButton5+20],eax
mov eax,100
mov [!RadioButton5+24],eax
mov eax,20
mov [!RadioButton5+28],eax
invoke SetWindowPos,[RadioButton5],HWND_BOTTOM,[!RadioButton5+16],[!RadioButton5+20],[!RadioButton5+24],[!RadioButton5+28],0
; LN:133 SETTEXT RadioButton5,"White"
mov esi,_StrConst23
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage,[RadioButton5],WM_SETTEXT,0,[_TmpVec1]
invoke SendMessage,[RadioButton3],BM_SETCHECK,BST_CHECKED,0
; LN:139 CONSTRUCT TabFolder
invoke CreateWindowEx,0,!ControlType14,NULL,WS_VISIBLE+WS_CHILD,0,0,200,200,[OBMain],119,[!hinstance],NULL
mov dword [TabFolder],eax
mov dword [!TabFolder+44],eax
mov dword [!RadioButton5+0],!TabFolder
mov dword [!TabFolder+0],0
mov dword [!TabFolder+40],113
mov dword [!TabFolder+4],119
mov eax,[OBMain]
mov dword [!TabFolder+8],eax
mov dword [!TabFolder+12],6
mov dword [!TabFolder+20],0
mov dword [!TabFolder+16],0
mov dword [!TabFolder+24],200
mov dword [!TabFolder+28],200
mov dword [!TabFolder+32],0
mov dword [!TabFolder+36],0
; LN:140 SETPOSITION TabFolder,10,220,100,100
mov eax,10
mov [!TabFolder+16],eax
mov eax,220
mov [!TabFolder+20],eax
mov eax,100
mov [!TabFolder+24],eax
mov eax,100
mov [!TabFolder+28],eax
invoke SetWindowPos,[TabFolder],HWND_BOTTOM,[!TabFolder+16],[!TabFolder+20],[!TabFolder+24],[!TabFolder+28],0
; LN:141 SETTEXT TabFolder,"TabFolder"
mov esi,_StrConst24
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
invoke SendMessage,[TabFolder],WM_SETTEXT,0,[_TmpVec1]
; LN:142 SETCOLOR TabFolder,$ff00ff,$00ffff
bts dword [!TabFolder+12],3
mov eax,16711935
mov [!TabFolder+32],eax
mov eax,65535
mov [!TabFolder+36],eax
invoke InvalidateRect,[TabFolder],NULL,TRUE
; LN:144 CONSTRUCT ListBox
invoke CreateWindowEx,0,!ControlType7,NULL,WS_VSCROLL+WS_VISIBLE+WS_CHILD+LBS_NOTIFY,0,0,200,100,[OBMain],120,[!hinstance],NULL
mov dword [ListBox],eax
mov dword [!ListBox+44],eax
mov dword [!TabFolder+0],!ListBox
mov dword [!ListBox+0],0
mov dword [!ListBox+40],106
mov dword [!ListBox+4],120
mov eax,[OBMain]
mov dword [!ListBox+8],eax
mov dword [!ListBox+12],6
mov dword [!ListBox+20],0
mov dword [!ListBox+16],0
mov dword [!ListBox+24],200
mov dword [!ListBox+28],100
mov dword [!ListBox+32],0
mov dword [!ListBox+36],0
; LN:145 SETPOSITION ListBox,150,100,100,100
mov eax,150
mov [!ListBox+16],eax
mov eax,100
mov [!ListBox+20],eax
mov eax,100
mov [!ListBox+24],eax
mov eax,100
mov [!ListBox+28],eax
invoke SetWindowPos,[ListBox],HWND_BOTTOM,[!ListBox+16],[!ListBox+20],[!ListBox+24],[!ListBox+28],0
; LN:146 ADDITEM ListBox,"Item1"
mov esi,_StrConst25
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage,[ListBox],LB_ADDSTRING,0,[_TmpVec1]
; LN:147 ADDITEM ListBox,"Item2"
mov esi,_StrConst26
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage,[ListBox],LB_ADDSTRING,0,[_TmpVec1]
; LN:148 ADDITEM ListBox,"Item3"
mov esi,_StrConst27
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage,[ListBox],LB_ADDSTRING,0,[_TmpVec1]
; LN:149 ADDITEM ListBox,"Item4"
mov esi,_StrConst28
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage,[ListBox],LB_ADDSTRING,0,[_TmpVec1]
; LN:150 ADDITEM ListBox,"Item5"
mov esi,_StrConst29
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage,[ListBox],LB_ADDSTRING,0,[_TmpVec1]
; LN:151 ADDITEM ListBox,"Item6"
mov esi,_StrConst30
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage,[ListBox],LB_ADDSTRING,0,[_TmpVec1]
; LN:152 ADDITEM ListBox,"Item7"
mov esi,_StrConst31
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage,[ListBox],LB_ADDSTRING,0,[_TmpVec1]
; LN:153 ADDITEM ListBox,"Item8"
mov esi,_StrConst32
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage,[ListBox],LB_ADDSTRING,0,[_TmpVec1]
; LN:154 SETCOLOR ListBox,$ff0000,$ffffff
bts dword [!ListBox+12],3
mov eax,16711680
mov [!ListBox+32],eax
mov eax,16777215
mov [!ListBox+36],eax
invoke InvalidateRect,[ListBox],NULL,TRUE
; LN:156 CONSTRUCT ButtonListBox
invoke CreateWindowEx,0,!ControlType15,NULL,WS_VISIBLE+WS_CHILD,0,0,200,200,[OBMain],121,[!hinstance],NULL
mov dword [ButtonListBox],eax
mov dword [!ButtonListBox+44],eax
mov dword [!ListBox+0],!ButtonListBox
mov dword [!ButtonListBox+0],0
mov dword [!ButtonListBox+40],114
mov dword [!ButtonListBox+4],121
mov eax,[OBMain]
mov dword [!ButtonListBox+8],eax
mov dword [!ButtonListBox+12],6
mov dword [!ButtonListBox+20],0
mov dword [!ButtonListBox+16],0
mov dword [!ButtonListBox+24],200
mov dword [!ButtonListBox+28],200
mov dword [!ButtonListBox+32],0
mov dword [!ButtonListBox+36],0
; LN:157 SETPOSITION ButtonListBox,150,220,100,100
mov eax,150
mov [!ButtonListBox+16],eax
mov eax,220
mov [!ButtonListBox+20],eax
mov eax,100
mov [!ButtonListBox+24],eax
mov eax,100
mov [!ButtonListBox+28],eax
invoke SetWindowPos,[ButtonListBox],HWND_BOTTOM,[!ButtonListBox+16],[!ButtonListBox+20],[!ButtonListBox+24],[!ButtonListBox+28],0
; LN:158 SETCOLOR ButtonListBox,$ff00ff,$00ffff
bts dword [!ButtonListBox+12],3
mov eax,16711935
mov [!ButtonListBox+32],eax
mov eax,65535
mov [!ButtonListBox+36],eax
invoke InvalidateRect,[ButtonListBox],NULL,TRUE
; LN:160 CONSTRUCT Spinner
invoke CreateWindowEx,0,!ControlType9,NULL,WS_VISIBLE+WS_CHILD,0,0,40,30,[OBMain],122,[!hinstance],NULL
mov dword [Spinner],eax
mov dword [!Spinner+44],eax
mov dword [!ButtonListBox+0],!Spinner
mov dword [!Spinner+0],0
mov dword [!Spinner+40],108
mov dword [!Spinner+4],122
mov eax,[OBMain]
mov dword [!Spinner+8],eax
mov dword [!Spinner+12],6
mov dword [!Spinner+20],0
mov dword [!Spinner+16],0
mov dword [!Spinner+24],40
mov dword [!Spinner+28],30
mov dword [!Spinner+32],0
mov dword [!Spinner+36],0
; LN:161 SETPOSITION Spinner,270,100,100,20
mov eax,270
mov [!Spinner+16],eax
mov eax,100
mov [!Spinner+20],eax
mov eax,100
mov [!Spinner+24],eax
mov eax,20
mov [!Spinner+28],eax
invoke SetWindowPos,[Spinner],HWND_BOTTOM,[!Spinner+16],[!Spinner+20],[!Spinner+24],[!Spinner+28],0
; LN:162 SETCOLOR Spinner,$ff00ff,$00ffff
bts dword [!Spinner+12],3
mov eax,16711935
mov [!Spinner+32],eax
mov eax,65535
mov [!Spinner+36],eax
invoke InvalidateRect,[Spinner],NULL,TRUE
; LN:164 CONSTRUCT ProgressBar
invoke CreateWindowEx,0,!ControlType10,NULL,WS_VISIBLE+WS_CHILD,0,0,100,30,[OBMain],123,[!hinstance],NULL
mov dword [ProgressBar],eax
mov dword [!ProgressBar+44],eax
mov dword [!Spinner+0],!ProgressBar
mov dword [!ProgressBar+0],0
mov dword [!ProgressBar+40],109
mov dword [!ProgressBar+4],123
mov eax,[OBMain]
mov dword [!ProgressBar+8],eax
mov dword [!ProgressBar+12],6
mov dword [!ProgressBar+20],0
mov dword [!ProgressBar+16],0
mov dword [!ProgressBar+24],100
mov dword [!ProgressBar+28],30
mov dword [!ProgressBar+32],0
mov dword [!ProgressBar+36],0
; LN:165 SETPOSITION ProgressBar,390,100,100,20
mov eax,390
mov [!ProgressBar+16],eax
mov eax,100
mov [!ProgressBar+20],eax
mov eax,100
mov [!ProgressBar+24],eax
mov eax,20
mov [!ProgressBar+28],eax
invoke SetWindowPos,[ProgressBar],HWND_BOTTOM,[!ProgressBar+16],[!ProgressBar+20],[!ProgressBar+24],[!ProgressBar+28],0
; LN:166 SETCOLOR ProgressBar,$ff00ff,$00ffff
bts dword [!ProgressBar+12],3
mov eax,16711935
mov [!ProgressBar+32],eax
mov eax,65535
mov [!ProgressBar+36],eax
invoke InvalidateRect,[ProgressBar],NULL,TRUE
; LN:168 CONSTRUCT TreeView
invoke CreateWindowEx,0,!ControlType13,NULL,WS_VISIBLE+WS_CHILD,0,0,200,200,[OBMain],124,[!hinstance],NULL
mov dword [TreeView],eax
mov dword [!TreeView+44],eax
mov dword [!ProgressBar+0],!TreeView
mov dword [!TreeView+0],0
mov dword [!TreeView+40],112
mov dword [!TreeView+4],124
mov eax,[OBMain]
mov dword [!TreeView+8],eax
mov dword [!TreeView+12],6
mov dword [!TreeView+20],0
mov dword [!TreeView+16],0
mov dword [!TreeView+24],200
mov dword [!TreeView+28],200
mov dword [!TreeView+32],0
mov dword [!TreeView+36],0
; LN:169 SETPOSITION TreeView,510,100,100,150
mov eax,510
mov [!TreeView+16],eax
mov eax,100
mov [!TreeView+20],eax
mov eax,100
mov [!TreeView+24],eax
mov eax,150
mov [!TreeView+28],eax
invoke SetWindowPos,[TreeView],HWND_BOTTOM,[!TreeView+16],[!TreeView+20],[!TreeView+24],[!TreeView+28],0
; LN:170 SETCOLOR TreeView,$ff00ff,$00ffff
bts dword [!TreeView+12],3
mov eax,16711935
mov [!TreeView+32],eax
mov eax,65535
mov [!TreeView+36],eax
invoke InvalidateRect,[TreeView],NULL,TRUE
; LN:172 CONSTRUCT Calendar
invoke CreateWindowEx,0,!ControlType11,NULL,WS_VISIBLE+WS_CHILD,0,0,200,150,[OBMain],125,[!hinstance],NULL
mov dword [Calendar],eax
mov dword [!Calendar+44],eax
mov dword [!TreeView+0],!Calendar
mov dword [!Calendar+0],0
mov dword [!Calendar+40],110
mov dword [!Calendar+4],125
mov eax,[OBMain]
mov dword [!Calendar+8],eax
mov dword [!Calendar+12],6
mov dword [!Calendar+20],0
mov dword [!Calendar+16],0
mov dword [!Calendar+24],200
mov dword [!Calendar+28],150
mov dword [!Calendar+32],0
mov dword [!Calendar+36],0
; LN:173 SETPOSITION Calendar,270,140,200,150
mov eax,270
mov [!Calendar+16],eax
mov eax,140
mov [!Calendar+20],eax
mov eax,200
mov [!Calendar+24],eax
mov eax,150
mov [!Calendar+28],eax
invoke SetWindowPos,[Calendar],HWND_BOTTOM,[!Calendar+16],[!Calendar+20],[!Calendar+24],[!Calendar+28],0
; LN:175 RETURN
ret
OBMain_Command:
; LN:178 SETCOLOR StaticText1,$008000,$00ffff
bts dword [!StaticText1+12],3
mov eax,32768
mov [!StaticText1+32],eax
mov eax,65535
mov [!StaticText1+36],eax
invoke InvalidateRect,[StaticText1],NULL,TRUE
; LN:180 RETURN
ret

; Automatic END statement
xor eax,eax
invoke ExitProcess, eax
_ErrExit:
cinvoke puts,_ErrExitMsg
mov eax,[ERR]
invoke ExitProcess, eax
; End of Code Section

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
__SetStrConst:
mov al,[esi]
mov [edi],al
or al,al
je __SetStrConstDone
inc esi
inc edi
jmp __SetStrConst
__SetStrConstDone:
ret
; End of Function Section
