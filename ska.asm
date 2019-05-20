;Compiler Delaration Section

format PE GUI 4.0

entry !Start

macro align value { rb (value-1) - (rva $ + value-1) mod value }

_BufSize=1000
menuopen equ 1000
menusave equ 1001
menuexit equ 1002
bgred equ 1003
bggreen equ 1004
bgblue equ 1005
bgblack equ 1006
bgwhite equ 1007
fgred equ 1008
fggreen equ 1009
fgblue equ 1010
fgblack equ 1011
fgwhite equ 1012
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
		GetAncestor,'GetAncestor',\
         	GetClientRect,'GetClientRect',\
		GetComboBoxInfo,'GetComboBoxInfo',\
		GetCursorPos,'GetCursorPos',\
         	GetMessage,'GetMessageA',\
		GetParent,'GetParent',\
		GetWindowRect,'GetWindowRect',\
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
		SetFocus,'SetFocus',\
		SetMenu,'SetMenu',\
		SetMenuItemBitmaps,'SetMenuItemBitmaps',\
		SetTimer,'SetTimer',\
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
!ControlType1 db 'Havis',0
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
!ControlType20 db 'TIMER',0
!ControlType21 db 'RICHEDIT20A',0
!ControlType22 db 'RAEdit',0
!ControlType23 db 'RAGrid',0
!ControlType24 db 'Havis',0
!ControlType25 db 'SysListView32',0
!OBMainWindowClass WNDCLASS
msg MSG
!OBMainClass db 'OBMain',0
!icc dd $00000008,$00003FFF
!!RichEd db 'RichEd20.dll',0
!!RAEdit db 'RAEdit.dll',0
!!RAGrid db 'RAGrid.dll',0
!!Csmdll db 'Csmdll.dll',0
!title db 'OmniBasic',0
align 4
!Timer dd 0
Timer1 dd 0
Timer2 dd 0
Timer3 dd 0
Timer4 dd 0
Timer5 dd 0
Timer6 dd 0
Timer7 dd 0
Timer8 dd 0
Timer9 dd 0
Timer10 dd 0
Timer11 dd 0
Timer12 dd 0
Timer13 dd 0
Timer14 dd 0
Timer15 dd 0
Timer16 dd 0
Timer17 dd 0
Timer18 dd 0
Timer19 dd 0
Timer20 dd 0
Timer21 dd 0
Timer22 dd 0
Timer23 dd 0
Timer24 dd 0
Timer25 dd 0
Timer26 dd 0
Timer27 dd 0
Timer28 dd 0
Timer29 dd 0
Timer30 dd 0
Timer31 dd 0
Timer32 dd 0
gc_colwt dd 0
gc_lpszhdrtext dd 0
gc_halign dd 0
gc_calign dd 0
gc_ctype dd 0
gc_ctextmax dd 0
gc_lpszformat dd 0
gc_himl dd 0
gc_hdrflag dd 0
gc_colxp dd 0
gc_edthwnd dd 0
MenuEVPtr dd 0
MenuID dd 0
FindEVPtr dd 0
FindMsgID dd 0
FINDMSGSTRING db 'commdlg_FindReplace',0
FLAGS dd 0
nmhdr_hwndFrom dd 0
nmhdr_idFrom dd 0
nmhdr_code dd 0
cr_cpMin dd 0
cr_cpMax dd 0
ofn_lStructSize dd 76
ofn_hwndOwner dd 0
ofn_hInstance dd 0
ofn_lpstrFilter dd 0
ofn_lpstrCustomFilter dd 0
ofn_nMaxCustFilter dd 0
ofn_nFilterIndex dd 1
ofn_lpstrFile dd 0
ofn_nMaxFile dd 0
ofn_lpstrFileTitle dd 0
ofn_nMaxFileTitle dd 0
ofn_lpstrInitialDir dd 0
ofn_lpstrTitle dd 0
ofn_Flags dd 0
ofn_nFileOffset dw 0
ofn_nFileExtension dw 0
ofn_lpstrDefExt dd 0
ofn_lCustData dd 0
ofn_lpfnHook dd 0
ofn_lpTemplateName dd 0
cc_lStructSize dd 36
cc_hwndOwner dd 0
cc_hInstance dd 0
cc_rgbResult dd 0
cc_lpCustColors dd _CustColors
cc_Flags dd 0
cc_lCustData dd 0
cc_lpfnHook dd 0
cc_lpTemplateName dd 0
_CustColors rd 16
hClassBrush rd 1
fr_lStructSize dd 40
fr_hwndOwner dd 0
fr_hInstance dd 0
fr_Flags dd 0
fr_lpstrFindWhat dd 0
fr_lpstrReplaceWith dd _PrintBuf+12
fr_wFindWhatLen dw 0
fr_wReplaceWithLen dw 0
fr_lCustData dd 0
fr_lpfnHook dd 0
fr_lpTemplateName dd 0
cf_lStructSize dd 58
cf_hwndOwner dd 0
cf_hDC dd 0
cf_lpLogFont dd 0
cf_iPointSize dd 0
cf_Flags dd 0
cf_rgbColors dd 0
cf_lCustData dd 0
cf_lpfnHook dd 0
cf_lpTemplateName dd 0
cf_hInstance dd 0
cf_lpszStyle dd 0
cf_nFontType dw 0
cf_nSizeMin dd 0
cf_nSizeMax dd 0
pr_lStructSize dd 66
pr_hwndOwner dd 0
pr_hDevMode dd 0
pr_hDevNames dd 0
pr_hDC dd 0
pr_Flags dd 0
pr_nFromPage dw 0
pr_nToPage dw 0
pr_nMinPage dw 0
pr_nMaxPage dw 0
pr_nCopies dw 0
pr_hInstance dd 0
pr_lCustData dd 0
pr_lpfnPrintHook dd 0
pr_lpfnSetupHook dd 0
pr_lpPrintTemplateName dd 0
pr_lpSetupTemplateName dd 0
pr_hPrintTemplate dd 0
pr_hSetupTemplate dd 0
!RA_BCKCOLOR dd $C0F0F0
!RA_TXTCOLOR dd $000000
!RA_SELBCKCOLOR dd $800000
!RA_SELTXTCOLOR dd $ffffff
!RA_CMNTCOLOR dd $008000
!RA_STRCOLOR dd $ff0000
!RA_OPRCOLOR dd $0000a0
!RA_HILITE1 dd $F0C0C0
!RA_HILITE2 dd $C0F0C0
!RA_HILITE3 dd $C0C0F0
!RA_SELBARCOLOR dd $c0c0c0
!RA_SELBARPEN dd $808080
!RA_LNRCOLOR dd $800000
!cbSize dd 52
!rcItem dd 0,0,0,0
!rcButton dd 0,0,0,0
!stateButton dd 0
!hwndCombo dd 0
!hwndItem dd 0
!hwndList dd 0
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
; LN:46 ;DIM ToolBar AS TOOLBAR
; LN:59 dim a$ as string*32
align 4
a$ dd a$+12
 dd 32
 dd 0
 rb 32
; LN:60 dim TempStr as string
align 4
TempStr dd TempStr+12
 dd 255
 dd 0
 rb 255
_StrConst1 db "File",0
_StrConst2 db "Open",0
_StrConst3 db "Save",0
_StrConst4 db "Exit",0
_StrConst5 db "BackColor",0
_StrConst6 db "Red",0
_StrConst7 db "Green",0
_StrConst8 db "Blue",0
_StrConst9 db "Black",0
_StrConst10 db "White",0
_StrConst11 db "ForeColor",0
_StrConst12 db "Red",0
_StrConst13 db "Green",0
_StrConst14 db "Blue",0
_StrConst15 db "Black",0
_StrConst16 db "White",0
_StrConst17 db "View",0
_StrConst18 db "Help",0
_StrConst19 db "Innomation Systems, Inc.",0
_StrConst20 db "technical italic",0
!myicon:
 db $0
 db $0
 db $1
 db $0
 db $1
 db $0
 db $20
 db $20
 db $10
 db $0
 db $0
 db $0
 db $0
 db $0
 db $e8
 db $2
 db $0
 db $0
 db $16
 db $0
 db $0
 db $0
 db $28
 db $0
 db $0
 db $0
 db $20
 db $0
 db $0
 db $0
 db $40
 db $0
 db $0
 db $0
 db $1
 db $0
 db $4
 db $0
 db $0
 db $0
 db $0
 db $0
 db $80
 db $2
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $80
 db $0
 db $0
 db $80
 db $0
 db $0
 db $0
 db $80
 db $80
 db $0
 db $80
 db $0
 db $0
 db $0
 db $80
 db $0
 db $80
 db $0
 db $80
 db $80
 db $0
 db $0
 db $80
 db $80
 db $80
 db $0
 db $c0
 db $c0
 db $c0
 db $0
 db $0
 db $0
 db $ff
 db $0
 db $0
 db $ff
 db $0
 db $0
 db $0
 db $ff
 db $ff
 db $0
 db $ff
 db $0
 db $0
 db $0
 db $ff
 db $0
 db $ff
 db $0
 db $ff
 db $ff
 db $0
 db $0
 db $ff
 db $ff
 db $ff
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $11
 db $11
 db $11
 db $11
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $1
 db $11
 db $88
 db $88
 db $88
 db $88
 db $11
 db $10
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $1
 db $18
 db $88
 db $88
 db $80
 db $8
 db $88
 db $88
 db $81
 db $10
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $18
 db $88
 db $88
 db $88
 db $80
 db $8
 db $88
 db $88
 db $88
 db $81
 db $0
 db $0
 db $0
 db $0
 db $0
 db $1
 db $88
 db $0
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $0
 db $88
 db $10
 db $0
 db $0
 db $0
 db $0
 db $18
 db $88
 db $0
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $0
 db $88
 db $81
 db $0
 db $0
 db $0
 db $1
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $10
 db $0
 db $0
 db $18
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $81
 db $0
 db $0
 db $18
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $81
 db $0
 db $1
 db $88
 db $0
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $0
 db $88
 db $10
 db $1
 db $88
 db $0
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $0
 db $88
 db $10
 db $1
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $10
 db $18
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $81
 db $18
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $81
 db $18
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $81
 db $18
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $81
 db $18
 db $0
 db $88
 db $88
 db $88
 db $88
 db $88
 db $10
 db $1
 db $0
 db $0
 db $0
 db $88
 db $88
 db $0
 db $81
 db $18
 db $0
 db $88
 db $88
 db $88
 db $88
 db $88
 db $10
 db $1
 db $0
 db $0
 db $0
 db $88
 db $88
 db $0
 db $81
 db $18
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $81
 db $18
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $81
 db $18
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $80
 db $8
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $81
 db $18
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $80
 db $8
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $81
 db $1
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $80
 db $8
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $10
 db $1
 db $88
 db $0
 db $88
 db $88
 db $88
 db $88
 db $80
 db $8
 db $88
 db $88
 db $88
 db $88
 db $0
 db $88
 db $10
 db $1
 db $88
 db $0
 db $88
 db $88
 db $88
 db $88
 db $80
 db $8
 db $88
 db $88
 db $88
 db $88
 db $0
 db $88
 db $10
 db $0
 db $18
 db $88
 db $88
 db $88
 db $88
 db $88
 db $80
 db $8
 db $88
 db $88
 db $88
 db $88
 db $88
 db $81
 db $0
 db $0
 db $18
 db $88
 db $88
 db $88
 db $88
 db $88
 db $80
 db $8
 db $88
 db $88
 db $88
 db $88
 db $88
 db $81
 db $0
 db $0
 db $1
 db $88
 db $88
 db $88
 db $88
 db $88
 db $80
 db $8
 db $88
 db $88
 db $88
 db $88
 db $88
 db $10
 db $0
 db $0
 db $0
 db $18
 db $88
 db $0
 db $88
 db $88
 db $80
 db $8
 db $88
 db $88
 db $0
 db $88
 db $81
 db $0
 db $0
 db $0
 db $0
 db $1
 db $88
 db $0
 db $88
 db $88
 db $88
 db $88
 db $88
 db $88
 db $0
 db $88
 db $10
 db $0
 db $0
 db $0
 db $0
 db $0
 db $18
 db $88
 db $88
 db $88
 db $80
 db $8
 db $88
 db $88
 db $88
 db $81
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $1
 db $18
 db $88
 db $88
 db $80
 db $8
 db $88
 db $88
 db $81
 db $10
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $1
 db $11
 db $88
 db $88
 db $88
 db $88
 db $11
 db $10
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $11
 db $11
 db $11
 db $11
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $ff
 db $f0
 db $f
 db $ff
 db $ff
 db $80
 db $1
 db $ff
 db $fe
 db $0
 db $0
 db $7f
 db $fc
 db $0
 db $0
 db $3f
 db $f8
 db $0
 db $0
 db $1f
 db $f0
 db $0
 db $0
 db $f
 db $e0
 db $0
 db $0
 db $7
 db $c0
 db $0
 db $0
 db $3
 db $c0
 db $0
 db $0
 db $3
 db $80
 db $0
 db $0
 db $1
 db $80
 db $0
 db $0
 db $1
 db $80
 db $0
 db $0
 db $1
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $0
 db $80
 db $0
 db $0
 db $1
 db $80
 db $0
 db $0
 db $1
 db $80
 db $0
 db $0
 db $1
 db $c0
 db $0
 db $0
 db $3
 db $c0
 db $0
 db $0
 db $3
 db $e0
 db $0
 db $0
 db $7
 db $f0
 db $0
 db $0
 db $f
 db $f8
 db $0
 db $0
 db $1f
 db $fc
 db $0
 db $0
 db $3f
 db $fe
 db $0
 db $0
 db $7f
 db $ff
 db $80
 db $1
 db $ff
 db $ff
 db $f0
 db $f
 db $ff
_StrConst21 db "Combo",0
_StrConst22 db "Test",0
_StrConst23 db "move",0
_StrConst24 db "Property",0
_StrConst25 db "Value",0
_StrConst26 db "Property",0
_StrConst27 db "Value",0
_StrConst28 db "Header",0
_StrConst29 db "TextBox",0
_StrConst30 db "StaticText1",0
_StrConst31 db "StaticText2",0
_StrConst32 db "StaticText3",0
_StrConst33 db "CheckBox",0
_StrConst34 db "BackColor",0
_StrConst35 db "Red",0
_StrConst36 db "Green",0
_StrConst37 db "Blue",0
_StrConst38 db "Black",0
_StrConst39 db "White",0
_StrConst40 db "ForeColor",0
_StrConst41 db "Red",0
_StrConst42 db "Green",0
_StrConst43 db "Blue",0
_StrConst44 db "Black",0
_StrConst45 db "White",0
_StrConst46 db "Item1",0
_StrConst47 db "Item2",0
_StrConst48 db "Item3",0
_StrConst49 db "Item4",0
_StrConst50 db "Item5",0
_StrConst51 db "Item6",0
_StrConst52 db "Item7",0
_StrConst53 db "Item8",0
_StrConst54 db "Item9",0
_StrConst55 db "Item10",0
_StrConst56 db "Murphy",0
_StrConst57 db "Havis1",0
_StrConst58 db "Havis2",0
_StrConst59 db "Havis3",0
_StrConst60 db "Havis4",0
_StrConst61 db "Havis5",0
_StrConst62 db "Havis6",0
_StrConst63 db "Havis7",0
_StrConst64 db "Havis8",0
_StrConst65 db "Havis9",0
_StrConst66 db "Havis10",0
_StrConst67 db "Item1",0
_StrConst68 db "Item2",0
_StrConst69 db "Item3",0
_StrConst70 db "Item4",0
_StrConst71 db "Item5",0
_StrConst72 db "Item6",0
_StrConst73 db "Havis",0
_StrConst74 db "Part1",0
_StrConst75 db "Part2",0
_StrConst76 db "Part3",0
_StrConst77 db "Part4",0
_StrConst78 db "Part5",0
_StrConst79 db "Part6",0
_StrConst80 db "Part7",0
_StrConst81 db "Part8",0
_StrConst82 db "Part9",0
_StrConst83 db "Part10",0
_StrConst84 db "StaticText1 COMMAND",0
_StrConst85 db "E&xit",0
_StrConst86 db "Havis",0
_StrConst87 db "StaticText2  COMMAND",0
_StrConst88 db "Diana",0
_StrConst89 db "StaticTest3 COMMAND",0
_StrConst90 db "TextBox CHANGE",0
_StrConst91 db "ComboBox CHANGE",0
_StrConst92 db "ComboBox2 CHANGE",0
_StrConst93 db "ComboBox SELECT ",0
_StrConst94 db "ComboBox2 SELECT",0
_StrConst95 db "ListBox SELECT ",0
_StrConst96 db "Slider SCROLL",0
_StrConst97 db "RadioButton1 COMMAND",0
_StrConst98 db "RadioButton2 COMMAND",0
_StrConst99 db "RadioButton3 COMMAND",0
_StrConst100 db "RadioButton4 COMMAND",0
_StrConst101 db "RadioButton5 COMMAND",0
_StrConst102 db "RadioButton6 COMMAND",0
_StrConst103 db "RadioButton7 COMMAND",0
_StrConst104 db "RadioButton8 COMMAND",0
_StrConst105 db "RadioButton9 COMMAND",0
_StrConst106 db "RadioButton10 COMMAND",0
_StrConst107 db "CheckBox Checked",0
_StrConst108 db "CheckBox Unchecked ",0
_StrConst109 db "Open",0
_StrConst110 db "Save",0
_StrConst111 db "Exit",0
_StrConst112 db "Error",0
_StrConst113 db "Visible",0
_StrConst114 db "Invisible",0
_StrConst115 db "timer10",0
!ObjectCount dd 44
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
ft_SearchMin rd 1
ft_SearchMax rd 1
ft_SearchTextPtr rd 1
ft_FoundMin rd 1
ft_FoundMax rd 1
OBMain rd 1
!OBMain rd 500
CursorPosX rd 1
CursorPosY rd 1
RectLeft rd 1
RectTop rd 1
RectRight rd 1
RectBottom rd 1
!TargetGUIDesc rd 1
!SourceGUIDesc rd 1
GridRow rd 1
GridCol rd 1
EditcpMin rd 1
EditcpMax rd 1
EditSelType rw 1
EditLine rd 1
EditcpLine rd 1
EditlpLine rd 1
EditnLines rd 1
EditnHidden rd 1
EditfChanged rd 1
EditnPage rd 1
EditnWordGroup rd 1
OldFrameProc rd 1
!Brush rd 1
!Desc rd 1
NMHDR rd 1
!dsStatus rd 1
ArrayIndex rd 1
!dsBackColor rd 1
!dsForeColor rd 1
!dsControlType rd 1
align 4
; LN:3 dim i as long
i rd 1
; LN:4 dim sbParts(11) as long
align 4
sbParts rd 11
align 4
; LN:5 dim mousex as long
mousex rd 1
align 4
; LN:6 dim mousey as long
mousey rd 1
align 4
; LN:7 dim xoffs as long
xoffs rd 1
align 4
; LN:8 dim yoffs as long
yoffs rd 1
; LN:10 dim mousedown as boolean
mousedown rb 1
; LN:11 dim lf as LOGFONT
align 4
lf rb 60
align 4
; LN:12 dim color as long
color rd 1
align 4
; LN:13 dim myfont as font
myfont rd 1
align 4
; LN:14 dim myicon as icon
myicon rd 1
align 4
; LN:15 DIM Ctr1 AS LONG
Ctr1 rd 1
align 4
; LN:16 DIM Ctr2 AS LONG
Ctr2 rd 1
; LN:17 DIM TempBool1 AS BOOLEAN
TempBool1 rb 1
; LN:18 DIM TempBool2 AS BOOLEAN
TempBool2 rb 1
; LN:19 DIM TempBool3 AS BOOLEAN
TempBool3 rb 1
; LN:20 DIM TempBool4 AS BOOLEAN
TempBool4 rb 1
align 4
; LN:21 DIM TempInt AS LONG
TempInt rd 1
align 4
; LN:61 dim a as long
a rd 1
; LN:62 type junk
; LN:67 dim trash(10) as junk
align 4
trash rb 120
pervis rd 1
filemenu rd 1

;Temporary Vector
_TmpVec1 rd 3
backcolormenu rd 1
forecolormenu rd 1
viewmenu rd 1
helpmenu rd 1

;Temporary Vector
_TmpVec2 rd 3

;For Loop Vector
_LopVec1 rd 2

;For Loop Vector
_LopVec2 rd 2
!OldProc1 rd 1
!OldProc2 rd 1
!OldProc3 rd 1

;Temporary String Variable
_StrTmp1 rb 32

;Temporary Variable
_Tmp1 rd 1
; End of Uninitialized Data Section

; Start of Control Descriptor Section
; LN:1 dim chic(4) as statictext
!chic rd 2000
; LN:2 dim havis as statictext
!havis rd 500
; LN:9 dim PropGrid as ragrid
!PropGrid rd 500
; LN:22 DIM ExitButton AS BUTTON
!ExitButton rd 500
; LN:23 DIM TestButton AS BUTTON
!TestButton rd 500
; LN:24 dim movebutton as button
!movebutton rd 500
; LN:25 DIM ComboBox(2) AS COMBOBOX
!ComboBox rd 1000
; LN:26 DIM TextBox AS TEXTBOX
!TextBox rd 500
; LN:27 DIM Frame AS FRAME
!Frame rd 500
; LN:28 DIM Frame2 AS FRAME
!Frame2 rd 500
; LN:29 DIM StaticText1 AS STATICTEXT
!StaticText1 rd 500
; LN:30 DIM StaticText2 AS STATICTEXT
!StaticText2 rd 500
; LN:31 DIM StaticText3 AS STATICTEXT
!StaticText3 rd 500
; LN:32 DIM Box1 AS STATICTEXT
!Box1 rd 500
; LN:33 DIM Box2 AS STATICTEXT
!Box2 rd 500
; LN:34 DIM Box3 AS STATICTEXT
!Box3 rd 500
; LN:35 DIM ListBox AS LISTBOX
!ListBox rd 500
; LN:36 DIM Slider AS SLIDER
!Slider rd 500
; LN:37 DIM Spinner AS SPINNER
!Spinner rd 500
; LN:38 DIM ProgressBar AS PROGRESSBAR
!ProgressBar rd 500
; LN:39 dim pb as progressbar
!pb rd 500
; LN:40 DIM Calendar AS CALENDAR
!Calendar rd 500
; LN:41 DIM Header AS Header
!Header rd 500
; LN:42 DIM TreeView AS TREEVIEW
!TreeView rd 500
; LN:43 DIM TabFolder AS TABFOLDER
!TabFolder rd 500
; LN:44 DIM ResultBox AS STATICTEXT
!ResultBox rd 500
; LN:45 DIM ButtonListBox AS BUTTONLISTBOX
!ButtonListBox rd 500
; LN:47 DIM StatusBar AS STATUSBAR
!StatusBar rd 500
; LN:48 DIM CheckBox AS CheckBox
!CheckBox rd 500
; LN:49 DIM RadioButton1 AS RADIOBUTTON
!RadioButton1 rd 500
; LN:50 DIM RadioButton2 AS RADIOBUTTON
!RadioButton2 rd 500
; LN:51 DIM RadioButton3 AS RADIOBUTTON
!RadioButton3 rd 500
; LN:52 DIM RadioButton4 AS RADIOBUTTON
!RadioButton4 rd 500
; LN:53 DIM RadioButton5 AS RADIOBUTTON
!RadioButton5 rd 500
; LN:54 DIM RadioButton6 AS RADIOBUTTON
!RadioButton6 rd 500
; LN:55 DIM RadioButton7 AS RADIOBUTTON
!RadioButton7 rd 500
; LN:56 DIM RadioButton8 AS RADIOBUTTON
!RadioButton8 rd 500
; LN:57 DIM RadioButton9 AS RADIOBUTTON
!RadioButton9 rd 500
; LN:58 DIM RadioButton10 AS RADIOBUTTON
!RadioButton10 rd 500
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
invoke InitCommonControlsEx,!icc
invoke LoadLibrary,!!RichEd
invoke LoadLibrary,!!RAEdit
invoke LoadLibrary,!!RAGrid
invoke LoadLibrary,!!Csmdll
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
mov dword [!OBMain+4],1
mov dword [!OBMain+12],6
mov dword [!OBMain+16],0
mov dword [!OBMain+20],0
mov dword [!OBMain+24],400
mov dword [!OBMain+28],300
mov dword [!OBMain+32],$ffffff
mov dword [!OBMain+36],$000000
mov dword [!OBMain+40],!CT_FORM
invoke CreateWindowEx,0,!OBMainClass,!title,WS_VISIBLE+WS_OVERLAPPEDWINDOW,0,0,400,300,NULL,NULL,[!hinstance],!OBMain
mov dword eax,[OBMain]
mov dword [!OBMain+44],eax
mov dword [!OBMain+8],eax
invoke SetWindowLong,[OBMain],GWL_USERDATA,!OBMain

!MsgLoop:
invoke GetMessage,msg,NULL,0,0
or eax,eax
jz !EndMsgLoop
invoke TranslateMessage,msg
invoke DispatchMessage,msg
jmp !MsgLoop
!EndMsgLoop:
invoke ExitProcess,[msg.wParam]

proc !WindowProc,OBMain,wmsg,wparam,lparam
enter
push ebx esi edi
mov dword eax,[OBMain]
mov dword [!OBMain+44],eax
mov esi,!OBMain
cmp [wmsg],WM_DESTROY
je !wmDestroy
!WinProcCommon:
cmp [wmsg],WM_SYSCOMMAND
je !wmSysCommand
cmp [wmsg],WM_SIZE
je !wmSize
cmp [wmsg],WM_MOVE
je !wmMove
cmp [wmsg],WM_TIMER
je !wmTimer
cmp [wmsg],WM_CREATE
je !wmCreate
mov eax,[wparam]
mov [EventID],ax
shr eax,16
mov [EventNotify],ax
invoke GetWindowLong,[lparam],GWL_USERDATA
mov [!Desc],eax
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
cmp [wmsg],WM_NOTIFY
je !wmNotify
cmp [wmsg],WM_HSCROLL
je !wmScroll
cmp [wmsg],WM_VSCROLL
je !wmScroll
cmp [wmsg],WM_LBUTTONDOWN
je !wmLMouseDown
cmp [wmsg],WM_LBUTTONUP
je !wmLMouseUp
cmp [wmsg],WM_RBUTTONDOWN
je !wmRMouseDown
cmp [wmsg],WM_RBUTTONUP
je !wmRMouseUp
mov eax,[wmsg]
cmp [FindMsgID],eax
je !FindMsg

!DefWndProc:
invoke DefWindowProc,[OBMain],[wmsg],[wparam],[lparam]
jmp !Finish

!wmSysCommand:
mov [!PassSystemEvent],0
mov eax,[esi+384]
or eax,eax
je !DefWndProc
mov edx,[wparam]
cmp edx,$f020
je !DoSysCmd
cmp edx,$f030
je !DoSysCmd
cmp edx,$f060
je !DoSysCmd
cmp edx,$f120
je !DoSysCmd
jmp !DefWndProc
!DoSysCmd:
mov [STATUS],edx
call dword eax
cmp [!PassSystemEvent],0
jne !DefWndProc
xor eax,eax
jmp !Finish

!wmSize:
mov ecx,[lparam]
mov edx,ecx
and ecx,$ffff
shr edx,16
mov [esi+24],ecx
mov [esi+28],edx
mov eax,[esi+388]
or eax,eax
je !DefWndProc
mov edx,[wparam]
mov [STATUS],edx
call dword eax
xor eax,eax
jmp !Finish

!wmMove:
mov ecx,[lparam]
mov edx,ecx
and ecx,$ffff
shr edx,16
mov [esi+16],ecx
mov [esi+20],edx
mov eax,[esi+392]
or eax,eax
je !DefWndProc
call dword eax
xor eax,eax
jmp !Finish

!FindMsg:
mov edx,[FindEVPtr]
or edx,edx
je !DefWndProc
mov eax,[fr_Flags]
mov [FLAGS],eax
call dword edx
je !DefWndProc

!wmTimer:
mov edx,[wparam]
shl edx,2
add edx,!Timer
mov eax,[edx]
cmp eax,0
je !Finish
call dword eax
xor eax,eax
jmp !Finish

!wmNotify:
mov edi,[lparam]; Address of NMHDR
mov [NMHDR],edi; Save NMHDR for event processing
mov esi,[edi]; Handle
invoke GetWindowLong,esi,GWL_USERDATA
cmp eax,0
je !DefWndProc
mov esi,eax; Address of Desc
mov ebx,[edi+8]; Code
mov eax,[esi+12]
mov [ArrayIndex],eax
mov eax,[esi+40]
mov [!dsControlType],eax
add esi,128
mov ecx,esi
add ecx,128
!NotifyLoop:
cmp ebx,[esi+4]
jne !NotNotifyCode
mov eax,[esi]
cmp eax,0
jne !ProcNotify
jmp !DefWndProc
!NotNotifyCode:
add esi,8
cmp esi,ecx
jne !NotifyLoop
jmp !DefWndProc

!ProcNotify:
mov edi,[NMHDR]
add edi,12
cmp [!dsControlType],!CT_RAGrid
jne !RAEditCheck
mov ebx,[edi]
add ebx,[!ArrayBase]
mov [GridCol],ebx
mov ebx,[edi+4]
add ebx,[!ArrayBase]
mov [GridRow],ebx
jmp !NotifyDispatch
!RAEditCheck:
cmp [!dsControlType],!CT_RAEdit
jne !NotifyDispatch
mov ebx,[edi]
add ebx,[!ArrayBase]
mov [EditcpMin],ebx
sub ebx,[edi+14]
mov [EditcpLine],ebx
mov ebx,[edi+4]
add ebx,[!ArrayBase]
mov [EditcpMax],ebx
mov bx,[edi+8]
mov [EditSelType],bx
mov ebx,[edi+10]
add ebx,[!ArrayBase]
mov [EditLine],ebx
mov ebx,[edi+18]
add ebx,[!ArrayBase]
mov [EditlpLine],ebx
mov ebx,[edi+22]
add ebx,[!ArrayBase]
mov [EditnLines],ebx
mov ebx,[edi+26]
mov [EditnHidden],ebx
mov ebx,[edi+30]
mov [EditfChanged],ebx
mov ebx,[edi+34]
add ebx,[!ArrayBase]
mov [EditnPage],ebx
mov ebx,[edi+38]
add ebx,[!ArrayBase]
mov [EditnWordGroup],ebx
!NotifyDispatch:
jmp !CommandDispatch

!wmLMouseDown:
;call RadioButton1_command 
jmp !Finish

!wmLMouseUp:
;call RadioButton2_command 
jmp !Finish

!wmRMouseDown:
;call RadioButton3_command 
jmp !Finish

!wmRMouseUp:
;call RadioButton4_command 
jmp !Finish

!wmCreate:
invoke CreateSolidBrush,0
mov [!Brush],eax
mov esi,[lparam]
mov esi,[esi]
mov eax,[esi+80]
cmp eax,0
je !DefWndProc
call dword eax
xor eax,eax
jmp !Finish

!CtlColorChange:
invoke GetWindowLong,[lparam],GWL_USERDATA
cmp [!Desc],0
je !DefWndProc
mov esi,[!Desc]
call !GetDesc
bt [!dsStatus],3
jc !CtlBackcolorChange
bt [!dsStatus],4
jc !CtlForecolorChange
jmp !DefWndProc

!CtlBackcolorChange:
bt [!dsStatus],4
jc !CtlBothColorChange
invoke DeleteObject,[!Brush]
invoke CreateSolidBrush,[!dsBackColor]
mov [!Brush],eax
invoke SetBkColor,[wparam],[!dsBackColor]
mov eax,[!Brush]
jmp !Finish

!CtlBothColorChange:
invoke DeleteObject,[!Brush]
invoke CreateSolidBrush,[!dsBackColor]
mov [!Brush],eax
invoke SetBkColor,[wparam],[!dsBackColor]
invoke SetTextColor,[wparam],[!dsForeColor]
mov eax,[!Brush]
jmp !Finish

!CtlForecolorChange:
invoke DeleteObject,[!Brush]
invoke GetBkColor,[wparam]
cmp [!dsControlType],!CT_TEXTBOX
je !ListOrTextOrCombo
cmp [!dsControlType],!CT_LISTBOX
je !ListOrTextOrCombo
cmp [!dsControlType],!CT_COMBOBOX
je !ListOrTextOrCombo
invoke GetPixel,[wparam],0,0
!ListOrTextOrCombo:
mov esi,[!Desc]
bts dword [esi+0],3
mov [esi+32],eax
invoke CreateSolidBrush,eax
mov [!Brush],eax
invoke SetTextColor,[wparam],[!dsForeColor]
invoke SetBkMode,[wparam],TRANSPARENT
mov eax,[!Brush]
jmp !Finish

!wmCommand:
mov ax,[EventID]
cmp ax,999
jg !wmMenu
cmp [!Desc],0
je !DefWndProc
mov esi,[!Desc]
mov eax,[esi+12]
mov [ArrayIndex],eax
mov eax,[esi+52]
cmp eax,0
jne !CommandDispatch
xor ebx,ebx
mov bx,[EventNotify]
; Click
cmp ebx,[esi+108]
jne !evChange
mov eax,[esi+104]
cmp eax,0
jne !CommandDispatch
jmp !DefWndProc
!evChange:
cmp ebx,[esi+116]
jne !evSelect
mov eax,[esi+112]
cmp eax,0
jne !CommandDispatch
jmp !DefWndProc
!evSelect:
cmp ebx,[esi+124]
jne !evDblClick
mov eax,[esi+120]
cmp eax,0
jne !CommandDispatch
jmp !DefWndProc
!evDblClick:
cmp ebx,[esi+100]
jne !DefWndProc
mov eax,[esi+96]
cmp eax,0
je !DefWndProc
!CommandDispatch:
call dword eax
xor eax,eax
jmp !Finish

!wmMenu:
mov edx,[MenuEVPtr]
or edx,edx
je !DefWndProc
and eax,$ffff
mov [MenuID],eax
call dword edx
jmp !Finish

!wmScroll:
cmp [!Desc],0
je !DefWndProc
mov esi,[!Desc]
mov eax,[esi+12]
mov [ArrayIndex],eax
mov eax,[esi+76]
cmp eax,0
je !DefWndProc
call dword eax
xor eax,eax
jmp !Finish

!GetDesc:
mov eax,[esi+0]
mov [!dsStatus],eax
mov eax,[esi+32]
mov [!dsBackColor],eax
mov eax,[esi+36]
mov [!dsForeColor],eax
mov eax,[esi+40]
mov [!dsControlType],eax
ret

!wmDestroy:
invoke DeleteObject,[!Brush]
invoke PostQuitMessage,0
xor eax,eax

!Finish:
pop edi esi ebx
return

; LN:69 OBMain.create
mov edi,!OBMain
mov [!TargetGUIDesc],edi
OBMain_create:
; LN:70 mousedown=false
mov byte [mousedown],0
; LN:71 menu OBMain
; LN:72 menubar pervis
invoke CreateMenu
mov [pervis],eax
; LN:73 menutitle filemenu,"File"
invoke CreatePopupMenu
mov [filemenu],eax
mov esi,_StrConst1
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
invoke AppendMenu,[pervis],MF_POPUP,[filemenu],[_TmpVec1]
; LN:74 menuitem menuopen,"Open"
mov esi,_StrConst2
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
invoke  AppendMenu,[filemenu],MF_STRING,1000,[_TmpVec1]
; LN:75 menuitem menusave,"Save"
mov esi,_StrConst3
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
invoke  AppendMenu,[filemenu],MF_STRING,1001,[_TmpVec1]
; LN:76 menuseparator
invoke AppendMenu,[filemenu],MF_SEPARATOR,0,0
; LN:77 menuitem menuexit,"Exit"
mov esi,_StrConst4
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
invoke  AppendMenu,[filemenu],MF_STRING,1002,[_TmpVec1]
; LN:78 menutitle backcolormenu,"BackColor"
invoke CreatePopupMenu
mov [backcolormenu],eax
mov esi,_StrConst5
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
invoke AppendMenu,[pervis],MF_POPUP,[backcolormenu],[_TmpVec1]
; LN:79 menuitem bgred,"Red"
mov esi,_StrConst6
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
invoke  AppendMenu,[backcolormenu],MF_STRING,1003,[_TmpVec1]
; LN:80 menuitem bggreen,"Green"
mov esi,_StrConst7
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke  AppendMenu,[backcolormenu],MF_STRING,1004,[_TmpVec1]
; LN:81 menuitem bgblue,"Blue"
mov esi,_StrConst8
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
invoke  AppendMenu,[backcolormenu],MF_STRING,1005,[_TmpVec1]
; LN:82 menuitem bgblack,"Black"
mov esi,_StrConst9
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke  AppendMenu,[backcolormenu],MF_STRING,1006,[_TmpVec1]
; LN:83 menuitem bgwhite,"White"
mov esi,_StrConst10
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke  AppendMenu,[backcolormenu],MF_STRING,1007,[_TmpVec1]
; LN:84 menutitle forecolormenu,"ForeColor"
invoke CreatePopupMenu
mov [forecolormenu],eax
mov esi,_StrConst11
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
invoke AppendMenu,[pervis],MF_POPUP,[forecolormenu],[_TmpVec1]
; LN:85 menuitem fgred,"Red"
mov esi,_StrConst12
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
invoke  AppendMenu,[forecolormenu],MF_STRING,1008,[_TmpVec1]
; LN:86 menuitem fggreen,"Green"
mov esi,_StrConst13
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke  AppendMenu,[forecolormenu],MF_STRING,1009,[_TmpVec1]
; LN:87 menuitem fgblue,"Blue"
mov esi,_StrConst14
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
invoke  AppendMenu,[forecolormenu],MF_STRING,1010,[_TmpVec1]
; LN:88 menuitem fgblack,"Black"
mov esi,_StrConst15
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke  AppendMenu,[forecolormenu],MF_STRING,1011,[_TmpVec1]
; LN:89 menuitem fgwhite,"White"			 		
mov esi,_StrConst16
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke  AppendMenu,[forecolormenu],MF_STRING,1012,[_TmpVec1]
; LN:90 menutitle viewmenu,"View"
invoke CreatePopupMenu
mov [viewmenu],eax
mov esi,_StrConst17
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
invoke AppendMenu,[pervis],MF_POPUP,[viewmenu],[_TmpVec1]
; LN:91 menutitle helpmenu,"Help"
invoke CreatePopupMenu
mov [helpmenu],eax
mov esi,_StrConst18
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
invoke AppendMenu,[pervis],MF_POPUP,[helpmenu],[_TmpVec1]
; LN:92 end menu
invoke SetMenu,[OBMain],[pervis]
; LN:94 SETPOSITION OBMain,200,100,624,600
mov edi,!OBMain
mov [!TargetGUIDesc],edi
mov eax,200
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,624
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,600
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
invoke SetWindowPos, dword [OBMain],HWND_TOP, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28],0
; LN:95 OBMain.TEXT="Innomation Systems, Inc."
mov edi,!OBMain
mov [!TargetGUIDesc],edi
mov esi,_StrConst19
mov [_TmpVec1],esi
mov [_TmpVec1+4],25
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [OBMain],WM_SETTEXT,0,[_TmpVec1]
; LN:97 lf.lfHeight=18
mov esi,lf+0
mov [_TmpVec1],esi
mov eax,18
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:98 'lf.lfFaceName="rhumbascript"
; LN:99 lf.lfFaceName="technical italic"
mov esi,lf+28
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov esi,_StrConst20
mov [_TmpVec2],esi
mov [_TmpVec2+4],17
mov [_TmpVec2+8],0
mov edi,_TmpVec1
mov esi,_TmpVec2
call __MovStr
; LN:100 CreateFont myfont,lf
invoke CreateFontIndirect,lf
mov [myfont],eax
; LN:101 createicon myicon,clock06
invoke CreateIconFromResource,!myicon+22,744,1,$30000
mov [myicon],eax
; LN:102 OBMain.icon=myicon
mov edi,!OBMain
mov [!TargetGUIDesc],edi
mov eax, dword [myicon]
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [OBMain],WM_SETICON,ICON_BIG,eax
; LN:104 a$="Combo"
mov edi,[a$]
mov esi,_StrConst21
call __SetStrConst
; LN:106 'CONSTRUCT ToolBar,0,0,0,0
; LN:108 CONSTRUCT TestButton,450,480,64,32
mov edi,!TestButton
mov [!TargetGUIDesc],edi
mov eax,450
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,480
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,64
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,32
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl3
invoke CreateWindowEx,0,!ControlType2,NULL,WS_VISIBLE+WS_CHILD+BS_DEFPUSHBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],101,[!hinstance],!TestButton
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],101
mov dword [edi+4],101
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl3:
; LN:109 TestButton.TEXT="Test"
mov edi,!TestButton
mov [!TargetGUIDesc],edi
mov esi,_StrConst22
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:111 construct movebutton,350,480,64,32
mov edi,!movebutton
mov [!TargetGUIDesc],edi
mov eax,350
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,480
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,64
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,32
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl4
invoke CreateWindowEx,0,!ControlType2,NULL,WS_VISIBLE+WS_CHILD+BS_DEFPUSHBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],102,[!hinstance],!movebutton
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],101
mov dword [edi+4],102
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl4:
; LN:112 movebutton.text="move"
mov edi,!movebutton
mov [!TargetGUIDesc],edi
mov esi,_StrConst23
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:114 construct chic(1),300,480,8,8
mov edi,!chic
mov eax,1
mov [ArrayIndex],eax
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,300
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,480
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,8
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,8
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl5
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],103,[!hinstance],!chic
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],103
mov eax,[OBMain]
mov dword [edi+8],eax
mov eax,[ArrayIndex]
mov dword [edi+12],eax
mov dword [edi+0],$27
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl5:
; LN:115 construct chic(2),320,480,8,8
mov edi,!chic
mov eax,2
mov [ArrayIndex],eax
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,320
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,480
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,8
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,8
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl6
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],104,[!hinstance],!chic
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],104
mov eax,[OBMain]
mov dword [edi+8],eax
mov eax,[ArrayIndex]
mov dword [edi+12],eax
mov dword [edi+0],$27
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl6:
; LN:116 construct chic(3),300,500,8,8
mov edi,!chic
mov eax,3
mov [ArrayIndex],eax
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,300
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,500
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,8
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,8
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl7
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],105,[!hinstance],!chic
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],105
mov eax,[OBMain]
mov dword [edi+8],eax
mov eax,[ArrayIndex]
mov dword [edi+12],eax
mov dword [edi+0],$27
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl7:
; LN:117 construct chic(4),320,500,8,8
mov edi,!chic
mov eax,4
mov [ArrayIndex],eax
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,320
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,500
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,8
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,8
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl8
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],106,[!hinstance],!chic
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],106
mov eax,[OBMain]
mov dword [edi+8],eax
mov eax,[ArrayIndex]
mov dword [edi+12],eax
mov dword [edi+0],$27
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl8:
; LN:118 for i=1 to 4
mov [i],1
_Lbl9:
cmp [i],4
jg _Lbl11
; LN:119 chic(i).backcolor=0
mov edi,!chic
mov eax, dword [i]
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:120 next i
_Lbl10:
inc [i]
jmp _Lbl9
_Lbl11:
; LN:122 construct PropGrid,400,320,205,148
mov edi,!PropGrid
mov [!TargetGUIDesc],edi
mov eax,400
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,320
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,205
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,148
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl12
invoke CreateWindowEx,WS_EX_CLIENTEDGE,!ControlType23,NULL,WS_VISIBLE+WS_CHILD+STYLE_HGRIDLINES+STYLE_VGRIDLINES, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],107,[!hinstance],!PropGrid
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],122
mov dword [edi+4],107
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl12:
; LN:123 PropGrid.addcol TEXT,100,"Property",center,center,31
mov edi,!PropGrid
mov [!TargetGUIDesc],edi
mov [gc_ctype],TYPE_EDITTEXT
mov eax,100
mov [gc_colwt],eax
mov esi,_StrConst24
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov eax,[_TmpVec1]
mov [gc_lpszhdrtext],eax
mov [gc_halign],ALIGN_CENTER
mov [gc_calign],ALIGN_CENTER
mov eax,31
mov [gc_ctextmax],eax
mov [gc_lpszformat],0
mov edi,[!TargetGUIDesc]
invoke SendMessage,dword [edi+44],GM_ADDCOL,0,gc_colwt
; LN:124 PropGrid.addcol TEXT,100,"Value",center,center,31
mov edi,!PropGrid
mov [!TargetGUIDesc],edi
mov [gc_ctype],TYPE_EDITTEXT
mov eax,100
mov [gc_colwt],eax
mov esi,_StrConst25
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov eax,[_TmpVec1]
mov [gc_lpszhdrtext],eax
mov [gc_halign],ALIGN_CENTER
mov [gc_calign],ALIGN_CENTER
mov eax,31
mov [gc_ctextmax],eax
mov [gc_lpszformat],0
mov edi,[!TargetGUIDesc]
invoke SendMessage,dword [edi+44],GM_ADDCOL,0,gc_colwt
; LN:125 PropGrid.headerheight=0
mov edi,!PropGrid
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
invoke SendMessage,dword [edi+44],GM_SETHDRHEIGHT,0,eax
; LN:126 for TempInt=1 to 8
mov [TempInt],1
_Lbl13:
cmp [TempInt],8
jg _Lbl15
; LN:127 PropGrid.addrow
mov edi,!PropGrid
mov [!TargetGUIDesc],edi
invoke SendMessage,dword [edi+44],GM_ADDROW,0,0
; LN:128 PropGrid.text(TempInt,1)="Property"	
mov edi,!PropGrid
mov [!TargetGUIDesc],edi
mov eax, dword [TempInt]
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst26
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:129 PropGrid.text(TempInt,2)="Value"
mov edi,!PropGrid
mov [!TargetGUIDesc],edi
mov eax, dword [TempInt]
dec eax
mov ebx,eax
shl ebx,16
mov eax,2
dec eax
or ebx,eax
mov esi,_StrConst27
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:130 next TempInt
_Lbl14:
inc [TempInt]
jmp _Lbl13
_Lbl15:
; LN:132 CONSTRUCT ComboBox(1),10,40,80,100
mov edi,!ComboBox
mov eax,1
mov [ArrayIndex],eax
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,40
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,80
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl16
invoke CreateWindowEx,0,!ControlType4,NULL,WS_VSCROLL+WS_VISIBLE+WS_CHILD+CBS_DROPDOWN, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],108,[!hinstance],!ComboBox
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
invoke GetComboBoxInfo, dword [edi+44],!cbSize
mov dword edi,[!TargetGUIDesc]
mov eax,[!hwndCombo]
invoke SetWindowLong,eax,GWL_USERDATA,edi
mov eax,[!hwndItem]
invoke SetWindowLong,eax,GWL_USERDATA,edi
mov eax,[!hwndList]
invoke SetWindowLong,eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],103
mov dword [edi+4],108
mov eax,[OBMain]
mov dword [edi+8],eax
mov eax,[ArrayIndex]
mov dword [edi+12],eax
mov dword [edi+0],$27
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl16:
; LN:133 ComboBox(1).TEXT=a$
mov edi,!ComboBox
mov eax,1
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[a$]
; LN:134 ComboBox(1).BACKCOLOR=$ffc0c0
mov edi,!ComboBox
mov eax,1
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,16761024
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:135 ComboBox(1).FORECOLOR=$ff0000
mov edi,!ComboBox
mov eax,1
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,16711680
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:136 ComboBox(1).FONT=myfont 
mov edi,!ComboBox
mov eax,1
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov eax, dword [myfont]
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETFONT,eax,1
; LN:138 CONSTRUCT Header,10,80,80,20
mov edi,!Header
mov [!TargetGUIDesc],edi
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,80
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,80
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl17
invoke CreateWindowEx,0,!ControlType12,NULL,WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],109,[!hinstance],!Header
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],111
mov dword [edi+4],109
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl17:
; LN:139 Header.TEXT="Header"
mov edi,!Header
mov [!TargetGUIDesc],edi
mov esi,_StrConst28
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:141 CONSTRUCT TextBox,100,40,80,20
mov edi,!TextBox
mov [!TargetGUIDesc],edi
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,40
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,80
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl18
invoke CreateWindowEx,WS_EX_CLIENTEDGE,!ControlType5,NULL,WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],110,[!hinstance],!TextBox
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],104
mov dword [edi+4],110
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl18:
; LN:142 TextBox.TEXT="TextBox"
mov edi,!TextBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst29
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:143 TextBox.BACKCOLOR=$800080
mov edi,!TextBox
mov [!TargetGUIDesc],edi
mov eax,8388736
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:144 TextBox.FORECOLOR=$0000ff
mov edi,!TextBox
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:145 TextBox.font=myfont
mov edi,!TextBox
mov [!TargetGUIDesc],edi
mov eax, dword [myfont]
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETFONT,eax,1
; LN:147 CONSTRUCT Box1,140,470,20,20
mov edi,!Box1
mov [!TargetGUIDesc],edi
mov eax,140
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,470
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl19
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],111,[!hinstance],!Box1
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],111
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl19:
; LN:149 CONSTRUCT Box2,160,470,20,20
mov edi,!Box2
mov [!TargetGUIDesc],edi
mov eax,160
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,470
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl20
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],112,[!hinstance],!Box2
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],112
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl20:
; LN:151 CONSTRUCT Box3,180,470,20,20
mov edi,!Box3
mov [!TargetGUIDesc],edi
mov eax,180
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,470
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl21
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],113,[!hinstance],!Box3
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],113
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl21:
; LN:152 Box3.forecolor=$00ffff
mov edi,!Box3
mov [!TargetGUIDesc],edi
mov eax,65535
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:154 CONSTRUCT StaticText1,190,40,100,15
mov edi,!StaticText1
mov [!TargetGUIDesc],edi
mov eax,190
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,40
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,15
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl22
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],114,[!hinstance],!StaticText1
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],114
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl22:
; LN:155 StaticText1.TEXT="StaticText1"
mov edi,!StaticText1
mov [!TargetGUIDesc],edi
mov esi,_StrConst30
mov [_TmpVec1],esi
mov [_TmpVec1+4],12
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:156 StaticText1.FORECOLOR=$0000ff
mov edi,!StaticText1
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:157 StaticText1.FONT=myfont
mov edi,!StaticText1
mov [!TargetGUIDesc],edi
mov eax, dword [myfont]
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETFONT,eax,1
; LN:158 ;mov edi,!StaticText1
; LN:159 ;invoke SendMessage, dword [edi+44],WM_SETICON,ICON_BIG,[myicon]
; LN:161 CONSTRUCT StaticText2,190,55,100,15
mov edi,!StaticText2
mov [!TargetGUIDesc],edi
mov eax,190
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,55
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,15
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl23
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],115,[!hinstance],!StaticText2
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],115
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl23:
; LN:162 StaticText2.TEXT="StaticText2"
mov edi,!StaticText2
mov [!TargetGUIDesc],edi
mov esi,_StrConst31
mov [_TmpVec1],esi
mov [_TmpVec1+4],12
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:163 StaticText2.FORECOLOR=$ff0000
mov edi,!StaticText2
mov [!TargetGUIDesc],edi
mov eax,16711680
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:165 CONSTRUCT StaticText3,190,70,100,15
mov edi,!StaticText3
mov [!TargetGUIDesc],edi
mov eax,190
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,70
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,15
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl24
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],116,[!hinstance],!StaticText3
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],116
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl24:
; LN:166 StaticText3.TEXT="StaticText3"
mov edi,!StaticText3
mov [!TargetGUIDesc],edi
mov esi,_StrConst32
mov [_TmpVec1],esi
mov [_TmpVec1+4],12
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:167 StaticText3.FORECOLOR=$ffffff
mov edi,!StaticText3
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:169 CONSTRUCT Slider,300,40,120,20
mov edi,!Slider
mov [!TargetGUIDesc],edi
mov eax,300
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,40
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,120
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl25
invoke CreateWindowEx,0,!ControlType8,NULL,WS_VISIBLE+WS_CHILD+256, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],117,[!hinstance],!Slider
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],107
mov dword [edi+4],117
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl25:
; LN:170 SETSTYLE Slider,TBS_NOTICKS,TRUE
mov edi,!Slider
mov [!TargetGUIDesc],edi
invoke GetWindowLong, dword [edi+44],GWL_STYLE
or eax,TBS_NOTICKS
mov dword edi,[!TargetGUIDesc]
invoke SetWindowLong, dword [edi+44],GWL_STYLE,eax
mov edi,[!TargetGUIDesc]
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:171 Slider.BACKCOLOR=$0080ff
mov edi,!Slider
mov [!TargetGUIDesc],edi
mov eax,33023
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:173 CONSTRUCT ProgressBar,390,100,100,20
mov edi,!ProgressBar
mov [!TargetGUIDesc],edi
mov eax,390
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl26
invoke CreateWindowEx,0,!ControlType10,NULL,WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],118,[!hinstance],!ProgressBar
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],109
mov dword [edi+4],118
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl26:
; LN:174 ProgressBar.BACKCOLOR=$0000ff
mov edi,!ProgressBar
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:175 ProgressBar.FORECOLOR=$00ffff
mov edi,!ProgressBar
mov [!TargetGUIDesc],edi
mov eax,65535
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:177 CONSTRUCT CheckBox,440,40,100,20
mov edi,!CheckBox
mov [!TargetGUIDesc],edi
mov eax,440
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,40
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl27
invoke CreateWindowEx,0,!ControlType18,NULL,WS_VISIBLE+WS_CHILD+BS_AUTOCHECKBOX, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],119,[!hinstance],!CheckBox
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],117
mov dword [edi+4],119
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl27:
; LN:178 CheckBox.TEXT="CheckBox"
mov edi,!CheckBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst33
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:179 CheckBox.BACKCOLOR=$ff0000
mov edi,!CheckBox
mov [!TargetGUIDesc],edi
mov eax,16711680
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:180 CheckBox.FORECOLOR=$00ffff
mov edi,!CheckBox
mov [!TargetGUIDesc],edi
mov eax,65535
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:181 CheckBox.FONT=myfont
mov edi,!CheckBox
mov [!TargetGUIDesc],edi
mov eax, dword [myfont]
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETFONT,eax,1
; LN:183 color=0
mov dword [color],0
; LN:185 'construct ba(2)
; LN:187 CONSTRUCT Frame,10,70,130,140
mov edi,!Frame
mov [!TargetGUIDesc],edi
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,70
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,130
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,140
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl28
invoke CreateWindowEx,0,!ControlType6,NULL,WS_VISIBLE+WS_CHILD+BS_GROUPBOX, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],120,[!hinstance],!Frame
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],105
mov dword [edi+4],120
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl28:
; LN:188 Frame.TEXT="BackColor"
mov edi,!Frame
mov [!TargetGUIDesc],edi
mov esi,_StrConst34
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:189 Frame.FORECOLOR=$ff00ff
mov edi,!Frame
mov [!TargetGUIDesc],edi
mov eax,16711935
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:190 Frame.font=myfont
mov edi,!Frame
mov [!TargetGUIDesc],edi
mov eax, dword [myfont]
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETFONT,eax,1
; LN:192 CONSTRUCT RadioButton1,5,30,100,20 IN Frame
mov edi,!RadioButton1
mov [!TargetGUIDesc],edi
mov eax,5
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,30
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl29
invoke CreateWindowEx,0,!ControlType19,NULL,WS_VISIBLE+WS_CHILD+BS_AUTORADIOBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!Frame+44],121,[!hinstance],!Frame
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
bts dword [!Frame],6
jc _SCLbl1
invoke SetWindowLong, dword [!Frame+44],GWL_WNDPROC,!SubClassProc1
mov [!OldProc1],eax
_SCLbl1:
mov edi,[!TargetGUIDesc]
mov dword [edi+40],118
mov dword [edi+4],121
mov eax,[!Frame+44]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl29:
; LN:193 RadioButton1.TEXT="Red"
mov edi,!RadioButton1
mov [!TargetGUIDesc],edi
mov esi,_StrConst35
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:194 RadioButton1.FORECOLOR=$0000ff
mov edi,!RadioButton1
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:196 CONSTRUCT RadioButton2,5,50,100,20 IN Frame
mov edi,!RadioButton2
mov [!TargetGUIDesc],edi
mov eax,5
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,50
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl30
invoke CreateWindowEx,0,!ControlType19,NULL,WS_VISIBLE+WS_CHILD+BS_AUTORADIOBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!Frame+44],122,[!hinstance],!Frame
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],118
mov dword [edi+4],122
mov eax,[!Frame+44]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl30:
; LN:197 RadioButton2.TEXT="Green"
mov edi,!RadioButton2
mov [!TargetGUIDesc],edi
mov esi,_StrConst36
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:198 RadioButton2.FORECOLOR=$00ff00
mov edi,!RadioButton2
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:200 CONSTRUCT RadioButton3,5,70,100,20 IN Frame
mov edi,!RadioButton3
mov [!TargetGUIDesc],edi
mov eax,5
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,70
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl31
invoke CreateWindowEx,0,!ControlType19,NULL,WS_VISIBLE+WS_CHILD+BS_AUTORADIOBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!Frame+44],123,[!hinstance],!Frame
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],118
mov dword [edi+4],123
mov eax,[!Frame+44]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl31:
; LN:201 RadioButton3.TEXT="Blue"
mov edi,!RadioButton3
mov [!TargetGUIDesc],edi
mov esi,_StrConst37
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:202 RadioButton3.FORECOLOR=$ff0000
mov edi,!RadioButton3
mov [!TargetGUIDesc],edi
mov eax,16711680
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:204 CONSTRUCT RadioButton4,5,90,100,20 IN Frame
mov edi,!RadioButton4
mov [!TargetGUIDesc],edi
mov eax,5
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,90
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl32
invoke CreateWindowEx,0,!ControlType19,NULL,WS_VISIBLE+WS_CHILD+BS_AUTORADIOBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!Frame+44],124,[!hinstance],!Frame
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],118
mov dword [edi+4],124
mov eax,[!Frame+44]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl32:
; LN:205 RadioButton4.TEXT="Black"
mov edi,!RadioButton4
mov [!TargetGUIDesc],edi
mov esi,_StrConst38
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:206 RadioButton4.FORECOLOR=$000000
mov edi,!RadioButton4
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:207 RadioButton4.FONT=myfont
mov edi,!RadioButton4
mov [!TargetGUIDesc],edi
mov eax, dword [myfont]
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETFONT,eax,1
; LN:209 CONSTRUCT RadioButton5,5,110,100,20 IN Frame
mov edi,!RadioButton5
mov [!TargetGUIDesc],edi
mov eax,5
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,110
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl33
invoke CreateWindowEx,0,!ControlType19,NULL,WS_VISIBLE+WS_CHILD+BS_AUTORADIOBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!Frame+44],125,[!hinstance],!Frame
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],118
mov dword [edi+4],125
mov eax,[!Frame+44]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl33:
; LN:210 RadioButton5.TEXT="White"
mov edi,!RadioButton5
mov [!TargetGUIDesc],edi
mov esi,_StrConst39
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:211 RadioButton5.FORECOLOR=$ffffff
mov edi,!RadioButton5
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:213 CONSTRUCT Frame2,10,230,130,140
mov edi,!Frame2
mov [!TargetGUIDesc],edi
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,230
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,130
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,140
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl34
invoke CreateWindowEx,0,!ControlType6,NULL,WS_VISIBLE+WS_CHILD+BS_GROUPBOX, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],126,[!hinstance],!Frame2
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],105
mov dword [edi+4],126
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl34:
; LN:214 Frame2.TEXT="ForeColor"
mov edi,!Frame2
mov [!TargetGUIDesc],edi
mov esi,_StrConst40
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:215 Frame2.FORECOLOR=$ff00ff
mov edi,!Frame2
mov [!TargetGUIDesc],edi
mov eax,16711935
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:216 Frame2.VISIBLE=FALSE
mov edi,!Frame2
mov [!TargetGUIDesc],edi
btc dword [edi],2
invoke ShowWindow, dword [edi+44],SW_HIDE
; LN:218 CONSTRUCT RadioButton6,5,30,100,20 IN Frame2
mov edi,!RadioButton6
mov [!TargetGUIDesc],edi
mov eax,5
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,30
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl35
invoke CreateWindowEx,0,!ControlType19,NULL,WS_VISIBLE+WS_CHILD+BS_AUTORADIOBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!Frame2+44],127,[!hinstance],!Frame2
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
bts dword [!Frame2],6
jc _SCLbl2
invoke SetWindowLong, dword [!Frame2+44],GWL_WNDPROC,!SubClassProc2
mov [!OldProc2],eax
_SCLbl2:
mov edi,[!TargetGUIDesc]
mov dword [edi+40],118
mov dword [edi+4],127
mov eax,[!Frame2+44]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl35:
; LN:219 RadioButton6.TEXT="Red"
mov edi,!RadioButton6
mov [!TargetGUIDesc],edi
mov esi,_StrConst41
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:220 RadioButton6.FORECOLOR=$0000ff
mov edi,!RadioButton6
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:222 CONSTRUCT RadioButton7,5,50,100,20 IN Frame2
mov edi,!RadioButton7
mov [!TargetGUIDesc],edi
mov eax,5
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,50
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl36
invoke CreateWindowEx,0,!ControlType19,NULL,WS_VISIBLE+WS_CHILD+BS_AUTORADIOBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!Frame2+44],128,[!hinstance],!Frame2
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],118
mov dword [edi+4],128
mov eax,[!Frame2+44]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl36:
; LN:223 RadioButton7.TEXT="Green"
mov edi,!RadioButton7
mov [!TargetGUIDesc],edi
mov esi,_StrConst42
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:224 RadioButton7.FORECOLOR=$00ff00
mov edi,!RadioButton7
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:226 CONSTRUCT RadioButton8,5,70,100,20 IN Frame2
mov edi,!RadioButton8
mov [!TargetGUIDesc],edi
mov eax,5
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,70
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl37
invoke CreateWindowEx,0,!ControlType19,NULL,WS_VISIBLE+WS_CHILD+BS_AUTORADIOBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!Frame2+44],129,[!hinstance],!Frame2
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],118
mov dword [edi+4],129
mov eax,[!Frame2+44]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl37:
; LN:227 RadioButton8.TEXT="Blue"
mov edi,!RadioButton8
mov [!TargetGUIDesc],edi
mov esi,_StrConst43
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:228 RadioButton8.FORECOLOR=$ff0000
mov edi,!RadioButton8
mov [!TargetGUIDesc],edi
mov eax,16711680
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:230 CONSTRUCT RadioButton9,5,90,100,20 IN Frame2
mov edi,!RadioButton9
mov [!TargetGUIDesc],edi
mov eax,5
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,90
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl38
invoke CreateWindowEx,0,!ControlType19,NULL,WS_VISIBLE+WS_CHILD+BS_AUTORADIOBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!Frame2+44],130,[!hinstance],!Frame2
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],118
mov dword [edi+4],130
mov eax,[!Frame2+44]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl38:
; LN:231 RadioButton9.TEXT="Black"
mov edi,!RadioButton9
mov [!TargetGUIDesc],edi
mov esi,_StrConst44
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:232 RadioButton9.FORECOLOR=$000000
mov edi,!RadioButton9
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:234 CONSTRUCT RadioButton10,5,110,100,20 IN Frame2
mov edi,!RadioButton10
mov [!TargetGUIDesc],edi
mov eax,5
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,110
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl39
invoke CreateWindowEx,0,!ControlType19,NULL,WS_VISIBLE+WS_CHILD+BS_AUTORADIOBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!Frame2+44],131,[!hinstance],!Frame2
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],118
mov dword [edi+4],131
mov eax,[!Frame2+44]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl39:
; LN:235 RadioButton10.TEXT="White"
mov edi,!RadioButton10
mov [!TargetGUIDesc],edi
mov esi,_StrConst45
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:236 RadioButton10.FORECOLOR=$ffffff
mov edi,!RadioButton10
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:238 RadioButton3.CHECKED=TRUE
mov edi,!RadioButton3
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],BM_SETCHECK,BST_CHECKED,0
; LN:239 RadioButton9.CHECKED=TRUE
mov edi,!RadioButton9
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],BM_SETCHECK,BST_CHECKED,0
; LN:240 CheckBox.CHECKED=TRUE
mov edi,!CheckBox
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],BM_SETCHECK,BST_CHECKED,0
; LN:242 CONSTRUCT TabFolder,10,400,130,100
mov edi,!TabFolder
mov [!TargetGUIDesc],edi
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,400
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,130
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl40
invoke CreateWindowEx,WS_EX_CONTROLPARENT,!ControlType14,NULL,WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],132,[!hinstance],!TabFolder
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],113
mov dword [edi+4],132
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl40:
; LN:244 CONSTRUCT ResultBox,10,502,200,20
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,502
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,200
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl41
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],133,[!hinstance],!ResultBox
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],133
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl41:
; LN:245 ResultBox.BackColor=$0080ff
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov eax,33023
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:246 ResultBox.ForeColor=$00ffff
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov eax,65535
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:248 CONSTRUCT ListBox,150,100,100,100
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov eax,150
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl42
invoke CreateWindowEx,0,!ControlType7,NULL,WS_VSCROLL+WS_VISIBLE+WS_CHILD+LBS_NOTIFY, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],134,[!hinstance],!ListBox
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],106
mov dword [edi+4],134
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl42:
; LN:249 ListBox.ADDITEM "Item1"
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst46
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],LB_ADDSTRING,0,[_TmpVec1]
; LN:250 ListBox.ADDITEM "Item2"
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst47
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],LB_ADDSTRING,0,[_TmpVec1]
; LN:251 ListBox.ADDITEM "Item3"
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst48
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],LB_ADDSTRING,0,[_TmpVec1]
; LN:252 ListBox.ADDITEM "Item4"
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst49
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],LB_ADDSTRING,0,[_TmpVec1]
; LN:253 ListBox.ADDITEM "Item5"
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst50
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],LB_ADDSTRING,0,[_TmpVec1]
; LN:254 ListBox.ADDITEM "Item6"
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst51
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],LB_ADDSTRING,0,[_TmpVec1]
; LN:255 ListBox.ADDITEM "Item7"
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst52
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],LB_ADDSTRING,0,[_TmpVec1]
; LN:256 ListBox.ADDITEM "Item8"
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst53
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],LB_ADDSTRING,0,[_TmpVec1]
; LN:257 ListBox.ADDITEM "Item9"
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst54
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],LB_ADDSTRING,0,[_TmpVec1]
; LN:258 ListBox.ADDITEM "Item10"
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst55
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],LB_ADDSTRING,0,[_TmpVec1]
; LN:259 ListBox.FORECOLOR=$ff0000
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov eax,16711680
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:260 ListBox.FONT=myfont 
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov eax, dword [myfont]
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETFONT,eax,1
; LN:262 CONSTRUCT ButtonListBox,150,300,100,100
mov edi,!ButtonListBox
mov [!TargetGUIDesc],edi
mov eax,150
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,300
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl43
invoke CreateWindowEx,0,!ControlType15,NULL,WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],135,[!hinstance],!ButtonListBox
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],114
mov dword [edi+4],135
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl43:
; LN:263 'setposition ButtonListBox,150,220,100,100
; LN:265 CONSTRUCT Spinner,270,100,100,20
mov edi,!Spinner
mov [!TargetGUIDesc],edi
mov eax,270
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl44
invoke CreateWindowEx,0,!ControlType9,NULL,WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],136,[!hinstance],!Spinner
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],108
mov dword [edi+4],136
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl44:
; LN:266 Spinner.BACKCOLOR=$0000ff
mov edi,!Spinner
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:268 CONSTRUCT TreeView,510,100,100,200
mov edi,!TreeView
mov [!TargetGUIDesc],edi
mov eax,510
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,200
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl45
invoke CreateWindowEx,0,!ControlType13,NULL,WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],137,[!hinstance],!TreeView
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],112
mov dword [edi+4],137
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl45:
; LN:269 TreeView.BACKCOLOR=$ffffff
mov edi,!TreeView
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:271 CONSTRUCT ComboBox(2),510,65,100,100
mov edi,!ComboBox
mov eax,2
mov [ArrayIndex],eax
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,510
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,65
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl46
invoke CreateWindowEx,0,!ControlType4,NULL,WS_VSCROLL+WS_VISIBLE+WS_CHILD+CBS_DROPDOWN, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],138,[!hinstance],!ComboBox
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
invoke GetComboBoxInfo, dword [edi+44],!cbSize
mov dword edi,[!TargetGUIDesc]
mov eax,[!hwndCombo]
invoke SetWindowLong,eax,GWL_USERDATA,edi
mov eax,[!hwndItem]
invoke SetWindowLong,eax,GWL_USERDATA,edi
mov eax,[!hwndList]
invoke SetWindowLong,eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],103
mov dword [edi+4],138
mov eax,[OBMain]
mov dword [edi+8],eax
mov eax,[ArrayIndex]
mov dword [edi+12],eax
mov dword [edi+0],$27
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl46:
; LN:272 ComboBox(2).BACKCOLOR=$808080
mov edi,!ComboBox
mov eax,2
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,8421504
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:273 ComboBox(2).FORECOLOR=$ffffff
mov edi,!ComboBox
mov eax,2
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:275 CONSTRUCT Calendar,270,140,200,150
mov edi,!Calendar
mov [!TargetGUIDesc],edi
mov eax,270
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,140
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,200
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,150
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl47
invoke CreateWindowEx,0,!ControlType11,NULL,WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],139,[!hinstance],!Calendar
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],110
mov dword [edi+4],139
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl47:
; LN:276 ComboBox(2).TEXT="Murphy"
mov edi,!ComboBox
mov eax,2
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst56
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:277 ComboBox(2).ADDITEM "Havis1"
mov edi,!ComboBox
mov eax,2
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst57
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+44],CB_ADDSTRING,0,[_TmpVec1]
; LN:278 ComboBox(2).ADDITEM "Havis2"
mov edi,!ComboBox
mov eax,2
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst58
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+44],CB_ADDSTRING,0,[_TmpVec1]
; LN:279 ComboBox(2).ADDITEM "Havis3"
mov edi,!ComboBox
mov eax,2
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst59
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+44],CB_ADDSTRING,0,[_TmpVec1]
; LN:280 ComboBox(2).ADDITEM "Havis4"
mov edi,!ComboBox
mov eax,2
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst60
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+44],CB_ADDSTRING,0,[_TmpVec1]
; LN:281 ComboBox(2).ADDITEM "Havis5"
mov edi,!ComboBox
mov eax,2
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst61
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+44],CB_ADDSTRING,0,[_TmpVec1]
; LN:282 ComboBox(2).ADDITEM "Havis6"
mov edi,!ComboBox
mov eax,2
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst62
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+44],CB_ADDSTRING,0,[_TmpVec1]
; LN:283 ComboBox(2).ADDITEM "Havis7"
mov edi,!ComboBox
mov eax,2
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst63
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+44],CB_ADDSTRING,0,[_TmpVec1]
; LN:284 ComboBox(2).ADDITEM "Havis8"
mov edi,!ComboBox
mov eax,2
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst64
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+44],CB_ADDSTRING,0,[_TmpVec1]
; LN:285 ComboBox(2).ADDITEM "Havis9"
mov edi,!ComboBox
mov eax,2
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst65
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+44],CB_ADDSTRING,0,[_TmpVec1]
; LN:286 ComboBox(2).ADDITEM "Havis10"
mov edi,!ComboBox
mov eax,2
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst66
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+44],CB_ADDSTRING,0,[_TmpVec1]
; LN:288 ComboBox(1).ADDITEM "Item1"
mov edi,!ComboBox
mov eax,1
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst67
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+44],CB_ADDSTRING,0,[_TmpVec1]
; LN:289 ComboBox(1).ADDITEM "Item2"
mov edi,!ComboBox
mov eax,1
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst68
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+44],CB_ADDSTRING,0,[_TmpVec1]
; LN:290 ComboBox(1).ADDITEM "Item3"
mov edi,!ComboBox
mov eax,1
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst69
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+44],CB_ADDSTRING,0,[_TmpVec1]
; LN:291 ComboBox(1).ADDITEM "Item4"
mov edi,!ComboBox
mov eax,1
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst70
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+44],CB_ADDSTRING,0,[_TmpVec1]
; LN:292 ComboBox(1).ADDITEM "Item5"
mov edi,!ComboBox
mov eax,1
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst71
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+44],CB_ADDSTRING,0,[_TmpVec1]
; LN:293 ComboBox(1).ADDITEM "Item6"
mov edi,!ComboBox
mov eax,1
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst72
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+44],CB_ADDSTRING,0,[_TmpVec1]
; LN:294 Construct StatusBar,0,0,0,0
mov edi,!StatusBar
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,0
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,0
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,0
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl48
invoke CreateWindowEx,0,!ControlType17,NULL,WS_CHILD+WS_VISIBLE+SBS_SIZEGRIP+SBT_TOOLTIPS, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],140,[!hinstance],!StatusBar
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],116
mov dword [edi+4],140
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl48:
; LN:295 'StatusBar.BACKCOLOR=$ffff00
; LN:296 construct havis,2,3,45,16 in StatusBar
mov edi,!havis
mov [!TargetGUIDesc],edi
mov eax,2
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,3
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,45
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,16
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl49
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!StatusBar+44],141,[!hinstance],!StatusBar
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
bts dword [!StatusBar],6
jc _SCLbl3
invoke SetWindowLong, dword [!StatusBar+44],GWL_WNDPROC,!SubClassProc3
mov [!OldProc3],eax
_SCLbl3:
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],141
mov eax,[!StatusBar+44]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl49:
; LN:297 havis.backcolor=$ffff
mov edi,!havis
mov [!TargetGUIDesc],edi
mov eax,65535
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:298 havis.text="Havis"
mov edi,!havis
mov [!TargetGUIDesc],edi
mov esi,_StrConst73
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:299 construct pb,51,3,47,16 in StatusBar
mov edi,!pb
mov [!TargetGUIDesc],edi
mov eax,51
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,3
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,47
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,16
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl50
invoke CreateWindowEx,0,!ControlType10,NULL,WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!StatusBar+44],142,[!hinstance],!StatusBar
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],109
mov dword [edi+4],142
mov eax,[!StatusBar+44]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl50:
; LN:300 sbParts(1)=0
mov esi,sbParts-(1*4)
mov eax,1
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:301 sbParts(2)=50
mov esi,sbParts-(1*4)
mov eax,2
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,50
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:302 sbParts(3)=100
mov esi,sbParts-(1*4)
mov eax,3
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,100
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:303 sbParts(4)=150
mov esi,sbParts-(1*4)
mov eax,4
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,150
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:304 sbParts(5)=200
mov esi,sbParts-(1*4)
mov eax,5
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,200
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:305 sbParts(6)=250
mov esi,sbParts-(1*4)
mov eax,6
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,250
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:306 sbParts(7)=300
mov esi,sbParts-(1*4)
mov eax,7
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,300
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:307 sbParts(8)=350
mov esi,sbParts-(1*4)
mov eax,8
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,350
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:308 sbParts(9)=400
mov esi,sbParts-(1*4)
mov eax,9
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,400
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:309 sbParts(10)=450
mov esi,sbParts-(1*4)
mov eax,10
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,450
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:310 sbParts(11)=500
mov esi,sbParts-(1*4)
mov eax,11
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,500
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:311 StatusBar.SETPARTS 11,sbParts
mov edi,!StatusBar
mov [!TargetGUIDesc],edi
mov eax,11
invoke SendMessage, dword [edi+44],SB_SETPARTS,eax,sbParts
; LN:312 StatusBar.SETTEXT 1,"Part1"
mov edi,!StatusBar
mov [!TargetGUIDesc],edi
mov eax,1
mov esi,_StrConst74
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],SB_SETTEXT,eax,[_TmpVec1]
; LN:313 StatusBar.SETTEXT 2,"Part2"
mov edi,!StatusBar
mov [!TargetGUIDesc],edi
mov eax,2
mov esi,_StrConst75
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],SB_SETTEXT,eax,[_TmpVec1]
; LN:314 StatusBar.SETTEXT 3,"Part3"
mov edi,!StatusBar
mov [!TargetGUIDesc],edi
mov eax,3
mov esi,_StrConst76
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],SB_SETTEXT,eax,[_TmpVec1]
; LN:315 StatusBar.SETTEXT 4,"Part4"
mov edi,!StatusBar
mov [!TargetGUIDesc],edi
mov eax,4
mov esi,_StrConst77
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],SB_SETTEXT,eax,[_TmpVec1]
; LN:316 StatusBar.SETTEXT 5,"Part5"
mov edi,!StatusBar
mov [!TargetGUIDesc],edi
mov eax,5
mov esi,_StrConst78
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],SB_SETTEXT,eax,[_TmpVec1]
; LN:317 StatusBar.SETTEXT 6,"Part6"
mov edi,!StatusBar
mov [!TargetGUIDesc],edi
mov eax,6
mov esi,_StrConst79
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],SB_SETTEXT,eax,[_TmpVec1]
; LN:318 StatusBar.SETTEXT 7,"Part7"
mov edi,!StatusBar
mov [!TargetGUIDesc],edi
mov eax,7
mov esi,_StrConst80
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],SB_SETTEXT,eax,[_TmpVec1]
; LN:319 StatusBar.SETTEXT 8,"Part8"
mov edi,!StatusBar
mov [!TargetGUIDesc],edi
mov eax,8
mov esi,_StrConst81
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],SB_SETTEXT,eax,[_TmpVec1]
; LN:320 StatusBar.SETTEXT 9,"Part9"
mov edi,!StatusBar
mov [!TargetGUIDesc],edi
mov eax,9
mov esi,_StrConst82
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],SB_SETTEXT,eax,[_TmpVec1]
; LN:321 StatusBar.SETTEXT 10,"Part10"
mov edi,!StatusBar
mov [!TargetGUIDesc],edi
mov eax,10
mov esi,_StrConst83
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],SB_SETTEXT,eax,[_TmpVec1]
; LN:322 ;StatusBar.SETICON 2,myicon
; LN:324 checkmenuitem pervis,fgblack	
mov eax,1011
invoke CheckMenuItem,[pervis],eax,MF_CHECKED+MF_BYCOMMAND
; LN:325 END EVENT
ret
; LN:327 ExitButton.command
mov edi,!ExitButton
mov [!TargetGUIDesc],edi
ExitButton_command:
; LN:328 END
invoke DeleteObject,[!Brush]
invoke PostQuitMessage,0
; LN:329 END EVENT
ret
; LN:331 StaticText1.command

invoke CreateSolidBrush, 0FF0000h;;;
mov [hClassBrush], eax
invoke SetClassLong, [OBMain], GCL_HBRBACKGROUND, [hClassBrush]
invoke InvalidateRect,[OBMain],NULL,TRUE
invoke UpdateWindow,[OBMain]

mov edi,!StaticText1
mov [!TargetGUIDesc],edi
StaticText1_command:
; LN:332 ResultBox.text="StaticText1 COMMAND"
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst84
mov [_TmpVec1],esi
mov [_TmpVec1+4],20
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:333 Timer7.interval=1000
mov eax,1000
invoke SetTimer,[OBMain],7,eax,NULL
; LN:334 CONSTRUCT ExitButton,550,480,64,32
mov edi,!ExitButton
mov [!TargetGUIDesc],edi
mov eax,550
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,480
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,64
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,32
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl51
invoke CreateWindowEx,0,!ControlType2,NULL,WS_VISIBLE+WS_CHILD+BS_DEFPUSHBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],143,[!hinstance],!ExitButton
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],101
mov dword [edi+4],143
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
mov dword [edi+496],eax
_Lbl51:
; LN:335 ExitButton.TEXT="E&xit"
mov edi,!ExitButton
mov [!TargetGUIDesc],edi
mov esi,_StrConst85
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:336 Frame2.VISIBLE=TRUE
mov edi,!Frame2
mov [!TargetGUIDesc],edi
bts dword [edi],2
invoke ShowWindow, dword [edi+44],SW_SHOW
; LN:337 Frame.FORECOLOR=$0000ff
mov edi,!Frame
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:338 Frame2.FORECOLOR=$00ff00
mov edi,!Frame2
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:339 ComboBox(1).text="Havis"
mov edi,!ComboBox
mov eax,1
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst86
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:340 'gosub StaticText2_command
; LN:341 Timer1.interval=100
mov eax,100
invoke SetTimer,[OBMain],1,eax,NULL
; LN:342 Timer2.interval=2000
mov eax,2000
invoke SetTimer,[OBMain],2,eax,NULL
; LN:343 Timer32.interval=60000
mov eax,60000
invoke SetTimer,[OBMain],32,eax,NULL
; LN:344 Timer25.interval=1000
mov eax,1000
invoke SetTimer,[OBMain],25,eax,NULL
; LN:345 Ctr1=0
mov dword [Ctr1],0
; LN:346 Ctr2=0
mov dword [Ctr2],0
; LN:347 Box2.text=str$(Ctr1)
mov edi,!Box2
mov [!TargetGUIDesc],edi
mov eax, dword [Ctr1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:348 Box3.text=str$(Ctr2)
mov edi,!Box3
mov [!TargetGUIDesc],edi
mov eax, dword [Ctr2]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:349 Box1.visible=true
mov edi,!Box1
mov [!TargetGUIDesc],edi
bts dword [edi],2
invoke ShowWindow, dword [edi+44],SW_SHOW
; LN:350 Box2.visible=true
mov edi,!Box2
mov [!TargetGUIDesc],edi
bts dword [edi],2
invoke ShowWindow, dword [edi+44],SW_SHOW
; LN:351 Box3.visible=true
mov edi,!Box3
mov [!TargetGUIDesc],edi
bts dword [edi],2
invoke ShowWindow, dword [edi+44],SW_SHOW
; LN:352 Box2.backcolor=$00ff00
mov edi,!Box2
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:353 Box3.backcolor=$0080ff
mov edi,!Box3
mov [!TargetGUIDesc],edi
mov eax,33023
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:354 END EVENT
ret
; LN:356 StaticText2.command
mov edi,!StaticText2
mov [!TargetGUIDesc],edi
StaticText2_command:
; LN:357 ResultBox.text="StaticText2  COMMAND"
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst87
mov [_TmpVec1],esi
mov [_TmpVec1+4],21
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:358 Timer7.interval=1000
mov eax,1000
invoke SetTimer,[OBMain],7,eax,NULL
; LN:359 TextBox.BACKCOLOR=$00ffff
mov edi,!TextBox
mov [!TargetGUIDesc],edi
mov eax,65535
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:360 TextBox.TEXT="Diana"
mov edi,!TextBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst88
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:361 DESTROY ButtonListBox
mov edi,!ButtonListBox
mov [!TargetGUIDesc],edi
bt dword [edi],0
jnc _Lbl52
mov dword [edi],0
invoke DestroyWindow, dword [edi+44]
btc dword [edi],0
btc dword [edi+44],6
_Lbl52:
; LN:362 TempInt=StaticText1.left
mov edi,!StaticText1
mov eax,[edi+16]
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov [TempInt],eax
; LN:363 TempStr=str(TempInt)
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:364 StatusBar.SETTEXT 1,TempStr
mov edi,!StatusBar
mov [!TargetGUIDesc],edi
mov eax,1
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],SB_SETTEXT,eax,[TempStr]
; LN:365 TempInt=StaticText1.top
mov edi,!StaticText1
mov eax,[edi+20]
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov [TempInt],eax
; LN:366 TempStr=str(TempInt)
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:367 StatusBar.SETTEXT 2,TempStr
mov edi,!StatusBar
mov [!TargetGUIDesc],edi
mov eax,2
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],SB_SETTEXT,eax,[TempStr]
; LN:368 TempInt=OBMain.left
mov edi,!OBMain
mov eax,[edi+16]
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov [TempInt],eax
; LN:369 TempStr=str(TempInt)
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:370 StatusBar.SETTEXT 3,TempStr
mov edi,!StatusBar
mov [!TargetGUIDesc],edi
mov eax,3
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],SB_SETTEXT,eax,[TempStr]
; LN:371 TempInt=OBMain.top
mov edi,!OBMain
mov eax,[edi+20]
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov [TempInt],eax
; LN:372 TempStr=str(TempInt)
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:373 StatusBar.SETTEXT 4,TempStr
mov edi,!StatusBar
mov [!TargetGUIDesc],edi
mov eax,4
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],SB_SETTEXT,eax,[TempStr]
; LN:374 TempInt=OBMain.width
mov edi,!OBMain
mov eax,[edi+24]
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov [TempInt],eax
; LN:375 TempStr=str(TempInt)
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:376 StatusBar.SETTEXT 5,TempStr
mov edi,!StatusBar
mov [!TargetGUIDesc],edi
mov eax,5
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],SB_SETTEXT,eax,[TempStr]
; LN:377 TempInt=OBMain.height
mov edi,!OBMain
mov eax,[edi+28]
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov [TempInt],eax
; LN:378 TempStr=str(TempInt)
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:379 StatusBar.SETTEXT 6,TempStr
mov edi,!StatusBar
mov [!TargetGUIDesc],edi
mov eax,6
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],SB_SETTEXT,eax,[TempStr]
; LN:380 getwindowrect OBMain
mov edi,!OBMain
mov [!TargetGUIDesc],edi
invoke GetWindowRect, dword [OBMain],RectLeft
; LN:381 TempStr=str(RectLeft)
mov eax, dword [RectLeft]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:382 StatusBar.SETTEXT 7,TempStr
mov edi,!StatusBar
mov [!TargetGUIDesc],edi
mov eax,7
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],SB_SETTEXT,eax,[TempStr]
; LN:383 TempStr=str(RectTop)
mov eax, dword [RectTop]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:384 StatusBar.SETTEXT 8,TempStr
mov edi,!StatusBar
mov [!TargetGUIDesc],edi
mov eax,8
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],SB_SETTEXT,eax,[TempStr]
; LN:385 TempStr=str(RectRight)
mov eax, dword [RectRight]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:386 StatusBar.SETTEXT 9,TempStr
mov edi,!StatusBar
mov [!TargetGUIDesc],edi
mov eax,9
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],SB_SETTEXT,eax,[TempStr]
; LN:387 TempStr=str(RectBottom)
mov eax, dword [RectBottom]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:388 StatusBar.SETTEXT 10,TempStr
mov edi,!StatusBar
mov [!TargetGUIDesc],edi
mov eax,10
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],SB_SETTEXT,eax,[TempStr]
; LN:389 GOSUB Timer32_timer
call Timer32_timer
; LN:390 END EVENT
ret
; LN:392 StaticText3.command
mov edi,!StaticText3
mov [!TargetGUIDesc],edi
StaticText3_command:
; LN:393 ResultBox.text="StaticTest3 COMMAND"
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst89
mov [_TmpVec1],esi
mov [_TmpVec1+4],20
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:394 Timer7.interval=1000
mov eax,1000
invoke SetTimer,[OBMain],7,eax,NULL
; LN:395 TreeView.VISIBLE=FALSE
mov edi,!TreeView
mov [!TargetGUIDesc],edi
btc dword [edi],2
invoke ShowWindow, dword [edi+44],SW_HIDE
; LN:396 SETSTYLE Slider,TBS_VERT,TRUE
mov edi,!Slider
mov [!TargetGUIDesc],edi
invoke GetWindowLong, dword [edi+44],GWL_STYLE
or eax,TBS_VERT
mov dword edi,[!TargetGUIDesc]
invoke SetWindowLong, dword [edi+44],GWL_STYLE,eax
mov edi,[!TargetGUIDesc]
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:397 SETPOSITION Slider,510,100,20,100
mov edi,!Slider
mov [!TargetGUIDesc],edi
mov eax,510
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
invoke SetWindowPos, dword [edi+44],HWND_TOP, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28],0
; LN:398 Slider.BACKCOLOR=$ff0000
mov edi,!Slider
mov [!TargetGUIDesc],edi
mov eax,16711680
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:399 ProgressBar.VALUE=50
mov edi,!ProgressBar
mov [!TargetGUIDesc],edi
mov eax,50
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],PBM_SETPOS,eax,0
; LN:400 Slider.VALUE=30
mov edi,!Slider
mov [!TargetGUIDesc],edi
mov eax,30
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],TBM_SETPOS,TRUE,eax
; LN:401 END EVENT
ret
; LN:403 TextBox.change
mov edi,!TextBox
mov [!TargetGUIDesc],edi
TextBox_change:
; LN:404 IF TextBox.TEXT=ComboBox(1).TEXT THEN
mov edi,!TextBox
invoke SendMessage, dword [edi+44],WM_GETTEXT,_BufSize,[_IOBuffer]
mov edi,!ComboBox
mov eax,1
dec eax
imul eax,500
add edi,eax
invoke SendMessage, dword [edi+44],WM_GETTEXT,_BufSize,[_PrintBuf]
xor bh,bh
mov edi,_IOBuffer
mov esi,_PrintBuf
call __CmpStr
sete bl
or bh,bl
je _Lbl53
; LN:405 ComboBox(1).BACKCOLOR=$c0c0c0
mov edi,!ComboBox
mov eax,1
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,12632256
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:406 ELSE
jmp _Lbl54
_Lbl53:
; LN:407 ComboBox(1).BACKCOLOR=$ffffff
mov edi,!ComboBox
mov eax,1
dec eax
imul eax,500
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:408 ENDIF
_Lbl54:
; LN:409 'IF TextBox.TEXT="aaa" then
; LN:410 '	ComboBox(1).TEXT="AAA"
; LN:411 'ENDIF
; LN:412 ResultBox.text="TextBox CHANGE"
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst90
mov [_TmpVec1],esi
mov [_TmpVec1+4],15
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:413 Timer7.interval=1000
mov eax,1000
invoke SetTimer,[OBMain],7,eax,NULL
; LN:414 END EVENT
ret
; LN:416 ComboBox.change
mov edi,!ComboBox
ComboBox_change:
; LN:417 SELECT CASE ArrayIndex
mov eax, dword [ArrayIndex]
mov [_SwitchInt],eax
; LN:418 CASE 1
mov eax,1
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl57
; LN:419 ResultBox.text="ComboBox CHANGE"
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst91
mov [_TmpVec1],esi
mov [_TmpVec1+4],16
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:420 Timer7.interval=1000
mov eax,1000
invoke SetTimer,[OBMain],7,eax,NULL
; LN:421 ListBox.backcolor=$00ff00
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:422 CASE 2
jmp _Lbl56
_Lbl57:
mov eax,2
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl58
; LN:423 ResultBox.text="ComboBox2 CHANGE"
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst92
mov [_TmpVec1],esi
mov [_TmpVec1+4],17
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:424 TextBox.text=ComboBox(2).text
mov edi,!TextBox
mov [!TargetGUIDesc],edi
mov edi,!ComboBox
mov eax,2
dec eax
imul eax,500
add edi,eax
invoke SendMessage, dword [edi+44],WM_GETTEXT,_BufSize,[_IOBuffer]
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_IOBuffer]
; LN:425 Timer7.interval=1000
mov eax,1000
invoke SetTimer,[OBMain],7,eax,NULL
; LN:426 END SELECT
jmp _Lbl56
_Lbl58:
_Lbl56:
; LN:427 END EVENT
ret
; LN:429 ComboBox.select
mov edi,!ComboBox
ComboBox_select:
; LN:430 SELECT CASE ArrayIndex
mov eax, dword [ArrayIndex]
mov [_SwitchInt],eax
; LN:431 CASE 1
mov eax,1
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl61
; LN:432 a=ComboBox.selitem
mov edi,!ComboBox
invoke SendMessage, dword [edi+44],CB_GETCURSEL,0,0
inc eax
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov [a],eax
; LN:433 a$="ComboBox SELECT "+STR$(a)
mov eax, dword [a]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst93
mov [_TmpVec2],esi
mov [_TmpVec2+4],17
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,a$
mov esi,_TmpVec2
call __MovStr
; LN:434 ResultBox.text=a$
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[a$]
; LN:435 Timer7.interval=1000
mov eax,1000
invoke SetTimer,[OBMain],7,eax,NULL
; LN:436 ListBox.backcolor=$ffff00
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov eax,16776960
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:437 CASE 2
jmp _Lbl60
_Lbl61:
mov eax,2
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl62
; LN:438 ResultBox.text="ComboBox2 SELECT"
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst94
mov [_TmpVec1],esi
mov [_TmpVec1+4],17
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:439 TextBox.text=ComboBox(2).seltext
mov edi,!TextBox
mov [!TargetGUIDesc],edi
mov edi,!ComboBox
mov eax,2
dec eax
imul eax,500
add edi,eax
push edi
invoke SendMessage, dword [edi+44],CB_GETCURSEL,0,0
pop edi
invoke SendMessage, dword [edi+44],CB_GETLBTEXT,eax,[_IOBuffer]
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_IOBuffer]
; LN:440 Timer7.interval=1000
mov eax,1000
invoke SetTimer,[OBMain],7,eax,NULL
; LN:441 END SELECT
jmp _Lbl60
_Lbl62:
_Lbl60:
; LN:442 END EVENT
ret
; LN:444 ListBox.select
mov edi,!ListBox
mov [!TargetGUIDesc],edi
ListBox_select:
; LN:445 a=ListBox.selitem
mov edi,!ListBox
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],LB_GETCURSEL,0,0
inc eax
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov [a],eax
; LN:446 a$="ListBox SELECT "+STR$(a)
mov eax, dword [a]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst95
mov [_TmpVec2],esi
mov [_TmpVec2+4],16
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,a$
mov esi,_TmpVec2
call __MovStr
; LN:447 ResultBox.text=a$
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[a$]
; LN:448 Timer7.interval=1000
mov eax,1000
invoke SetTimer,[OBMain],7,eax,NULL
; LN:449 ListBox.BackColor=$ffffff
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:450 TextBox.text=ListBox.seltext
mov edi,!TextBox
mov [!TargetGUIDesc],edi
mov edi,!ListBox
push edi
invoke SendMessage, dword [edi+44],LB_GETCURSEL,0,0
pop edi
invoke SendMessage, dword [edi+44],LB_GETTEXT,eax,[_IOBuffer]
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_IOBuffer]
; LN:451 END EVENT
ret
; LN:453 Slider.scroll
mov edi,!Slider
mov [!TargetGUIDesc],edi
Slider_scroll:
; LN:454 ResultBox.text="Slider SCROLL"
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst96
mov [_TmpVec1],esi
mov [_TmpVec1+4],14
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:455 Timer7.interval=1000
mov eax,1000
invoke SetTimer,[OBMain],7,eax,NULL
; LN:456 ProgressBar.VALUE=Slider.VALUE
mov edi,!ProgressBar
mov [!TargetGUIDesc],edi
mov edi,!Slider
invoke SendMessage, dword [edi+44],TBM_GETPOS,0,0
mov [_Tmp1],eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],PBM_SETPOS,eax,0
; LN:457 pb.value=Slider.VALUE
mov edi,!pb
mov [!TargetGUIDesc],edi
mov edi,!Slider
invoke SendMessage, dword [edi+44],TBM_GETPOS,0,0
mov [_Tmp1],eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],PBM_SETPOS,eax,0
; LN:458 END EVENT
ret
; LN:460 RadioButton1.command
mov edi,!RadioButton1
mov [!TargetGUIDesc],edi
RadioButton1_command:
; LN:461 TextBox.backcolor=$0000ff
mov edi,!TextBox
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:462 ResultBox.text="RadioButton1 COMMAND"
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst97
mov [_TmpVec1],esi
mov [_TmpVec1+4],21
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:463 Timer7.interval=1000
mov eax,1000
invoke SetTimer,[OBMain],7,eax,NULL
; LN:464 ListBox.selitem=1
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov eax,1
dec eax
invoke SendMessage, dword [edi+44],LB_SETCURSEL,eax,0
; LN:465 END EVENT
ret
; LN:467 RadioButton2.command
mov edi,!RadioButton2
mov [!TargetGUIDesc],edi
RadioButton2_command:
; LN:468 TextBox.backcolor=$00ff00
mov edi,!TextBox
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:469 ResultBox.text="RadioButton2 COMMAND"
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst98
mov [_TmpVec1],esi
mov [_TmpVec1+4],21
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:470 Timer7.interval=1000
mov eax,1000
invoke SetTimer,[OBMain],7,eax,NULL
; LN:471 ListBox.selitem=2
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov eax,2
dec eax
invoke SendMessage, dword [edi+44],LB_SETCURSEL,eax,0
; LN:472 END EVENT
ret
; LN:474 RadioButton3.command
mov edi,!RadioButton3
mov [!TargetGUIDesc],edi
RadioButton3_command:
; LN:475 TextBox.backcolor=$ff0000
mov edi,!TextBox
mov [!TargetGUIDesc],edi
mov eax,16711680
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:476 ResultBox.text="RadioButton3 COMMAND"
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst99
mov [_TmpVec1],esi
mov [_TmpVec1+4],21
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:477 Timer7.interval=1000
mov eax,1000
invoke SetTimer,[OBMain],7,eax,NULL
; LN:478 ListBox.selitem=3
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov eax,3
dec eax
invoke SendMessage, dword [edi+44],LB_SETCURSEL,eax,0
; LN:479 END EVENT
ret
; LN:481 RadioButton4.command
mov edi,!RadioButton4
mov [!TargetGUIDesc],edi
RadioButton4_command:
; LN:482 TextBox.backcolor=$000000
mov edi,!TextBox
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:483 ResultBox.text="RadioButton4 COMMAND"
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst100
mov [_TmpVec1],esi
mov [_TmpVec1+4],21
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:484 Timer7.interval=1000
mov eax,1000
invoke SetTimer,[OBMain],7,eax,NULL
; LN:485 ListBox.selitem=4
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov eax,4
dec eax
invoke SendMessage, dword [edi+44],LB_SETCURSEL,eax,0
; LN:486 END EVENT
ret
; LN:488 RadioButton5.command
mov edi,!RadioButton5
mov [!TargetGUIDesc],edi
RadioButton5_command:
; LN:489 TextBox.backcolor=$ffffff
mov edi,!TextBox
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:490 ResultBox.text="RadioButton5 COMMAND"
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst101
mov [_TmpVec1],esi
mov [_TmpVec1+4],21
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:491 Timer7.interval=1000
mov eax,1000
invoke SetTimer,[OBMain],7,eax,NULL
; LN:492 ListBox.selitem=5
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov eax,5
dec eax
invoke SendMessage, dword [edi+44],LB_SETCURSEL,eax,0
; LN:493 END EVENT
ret
; LN:495 RadioButton6.command
mov edi,!RadioButton6
mov [!TargetGUIDesc],edi
RadioButton6_command:
; LN:496 Slider.backcolor=$0000ff
mov edi,!Slider
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:497 ResultBox.text="RadioButton6 COMMAND"
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst102
mov [_TmpVec1],esi
mov [_TmpVec1+4],21
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:498 Timer7.interval=1000
mov eax,1000
invoke SetTimer,[OBMain],7,eax,NULL
; LN:499 ListBox.selitem=6
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov eax,6
dec eax
invoke SendMessage, dword [edi+44],LB_SETCURSEL,eax,0
; LN:500 END EVENT
ret
; LN:502 RadioButton7.command
mov edi,!RadioButton7
mov [!TargetGUIDesc],edi
RadioButton7_command:
; LN:503 Slider.backcolor=$00ff00
mov edi,!Slider
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:504 ResultBox.text="RadioButton7 COMMAND"
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst103
mov [_TmpVec1],esi
mov [_TmpVec1+4],21
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:505 Timer7.interval=1000
mov eax,1000
invoke SetTimer,[OBMain],7,eax,NULL
; LN:506 ListBox.selitem=7
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov eax,7
dec eax
invoke SendMessage, dword [edi+44],LB_SETCURSEL,eax,0
; LN:507 END EVENT
ret
; LN:509 RadioButton8.command
mov edi,!RadioButton8
mov [!TargetGUIDesc],edi
RadioButton8_command:
; LN:510 Slider.backcolor=$ff0000
mov edi,!Slider
mov [!TargetGUIDesc],edi
mov eax,16711680
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:511 ResultBox.text="RadioButton8 COMMAND"
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst104
mov [_TmpVec1],esi
mov [_TmpVec1+4],21
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:512 Timer7.interval=1000
mov eax,1000
invoke SetTimer,[OBMain],7,eax,NULL
; LN:513 ListBox.selitem=8
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov eax,8
dec eax
invoke SendMessage, dword [edi+44],LB_SETCURSEL,eax,0
; LN:514 END EVENT
ret
; LN:516 RadioButton9.command
mov edi,!RadioButton9
mov [!TargetGUIDesc],edi
RadioButton9_command:
; LN:517 Slider.backcolor=$000000
mov edi,!Slider
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:518 ResultBox.text="RadioButton9 COMMAND"
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst105
mov [_TmpVec1],esi
mov [_TmpVec1+4],21
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:519 Timer7.interval=1000
mov eax,1000
invoke SetTimer,[OBMain],7,eax,NULL
; LN:520 ListBox.selitem=9
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov eax,9
dec eax
invoke SendMessage, dword [edi+44],LB_SETCURSEL,eax,0
; LN:521 END EVENT
ret
; LN:523 RadioButton10.command
mov edi,!RadioButton10
mov [!TargetGUIDesc],edi
RadioButton10_command:
; LN:524 Slider.backcolor=$ffffff
mov edi,!Slider
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:525 ResultBox.text="RadioButton10 COMMAND"
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst106
mov [_TmpVec1],esi
mov [_TmpVec1+4],22
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:526 Timer7.interval=1000
mov eax,1000
invoke SetTimer,[OBMain],7,eax,NULL
; LN:527 ListBox.selitem=10
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov eax,10
dec eax
invoke SendMessage, dword [edi+44],LB_SETCURSEL,eax,0
; LN:528 END EVENT
ret
; LN:530 CheckBox.command
mov edi,!CheckBox
mov [!TargetGUIDesc],edi
CheckBox_command:
; LN:531 Timer7.interval=1000
mov eax,1000
invoke SetTimer,[OBMain],7,eax,NULL
; LN:533 if CheckBox.checked=true then
mov edi,!CheckBox
invoke SendMessage, dword [edi+44],BM_GETCHECK,0,0
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl63
; LN:534 ResultBox.text="CheckBox Checked"
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst107
mov [_TmpVec1],esi
mov [_TmpVec1+4],17
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:535 ListBox.topitem=5
mov edi,!ListBox
mov [!TargetGUIDesc],edi
mov eax,5
dec eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],LB_SETTOPINDEX,eax,0
; LN:536 ELSE
jmp _Lbl64
_Lbl63:
; LN:537 a=ListBox.topitem
mov edi,!ListBox
invoke SendMessage, dword [edi+44],LB_GETTOPINDEX,0,0
inc eax
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov [a],eax
; LN:538 a$="CheckBox Unchecked "+str$(a)
mov eax, dword [a]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst108
mov [_TmpVec2],esi
mov [_TmpVec2+4],20
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,a$
mov esi,_TmpVec2
call __MovStr
; LN:539 ResultBox.text=a$
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[a$]
; LN:540 ENDIF
_Lbl64:
; LN:541 END EVENT
ret
; LN:543 Timer1.timer
Timer1_timer:
; LN:544 TempBool1=NOT(TempBool1)
mov al, byte [TempBool1]
btc eax,0
mov [_Tmp1],eax
mov al, byte [_Tmp1]
mov byte [TempBool1],al
; LN:545 IF TempBool1=FALSE THEN
xor bh,bh
mov al, byte [TempBool1]
mov dl,0
cmp al,dl
sete bl
or bh,bl
je _Lbl65
; LN:546 Box1.BACKCOLOR=$0000ff
mov edi,!Box1
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:547 ELSE
jmp _Lbl66
_Lbl65:
; LN:548 Box1.BACKCOLOR=$00ffff
mov edi,!Box1
mov [!TargetGUIDesc],edi
mov eax,65535
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:549 ENDIF
_Lbl66:
; LN:550 end event
ret
; LN:552 Timer2.timer
Timer2_timer:
; LN:553 TempBool2=NOT(TempBool2)
mov al, byte [TempBool2]
btc eax,0
mov [_Tmp1],eax
mov al, byte [_Tmp1]
mov byte [TempBool2],al
; LN:554 IF TempBool2=FALSE THEN
xor bh,bh
mov al, byte [TempBool2]
mov dl,0
cmp al,dl
sete bl
or bh,bl
je _Lbl67
; LN:555 Box2.BACKCOLOR=$ff00ff
mov edi,!Box2
mov [!TargetGUIDesc],edi
mov eax,16711935
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:556 ELSE
jmp _Lbl68
_Lbl67:
; LN:557 Box2.BACKCOLOR=$00ff00
mov edi,!Box2
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:558 ENDIF
_Lbl68:
; LN:559 Ctr1=Ctr1+2
mov eax, dword [Ctr1]
mov edx,2
add eax,edx
mov dword [Ctr1],eax
; LN:560 Box2.TEXT=STR$(Ctr1)
mov edi,!Box2
mov [!TargetGUIDesc],edi
mov eax, dword [Ctr1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:561 end event
ret
; LN:563 Timer25.timer
Timer25_timer:
; LN:564 TempBool3=NOT(TempBool3)
mov al, byte [TempBool3]
btc eax,0
mov [_Tmp1],eax
mov al, byte [_Tmp1]
mov byte [TempBool3],al
; LN:565 IF TempBool3=FALSE THEN
xor bh,bh
mov al, byte [TempBool3]
mov dl,0
cmp al,dl
sete bl
or bh,bl
je _Lbl69
; LN:566 Box3.backcolor=$0080ff
mov edi,!Box3
mov [!TargetGUIDesc],edi
mov eax,33023
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:567 ELSE
jmp _Lbl70
_Lbl69:
; LN:568 Box3.backcolor=$000090
mov edi,!Box3
mov [!TargetGUIDesc],edi
mov eax,144
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:569 ENDIF
_Lbl70:
; LN:570 INCR Ctr2
inc [Ctr2]
; LN:571 Box3.TEXT=STR$(Ctr2)
mov edi,!Box3
mov [!TargetGUIDesc],edi
mov eax, dword [Ctr2]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:572 end event
ret
; LN:574 Timer7.timer
Timer7_timer:
; LN:575 ResultBox.text=""
mov edi,!ResultBox
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_NullStr]
; LN:576 end event
ret
; LN:578 Timer32.timer
Timer32_timer:
; LN:579 Timer1.stop
invoke KillTimer,[OBMain],1
; LN:580 Timer2.stop
invoke KillTimer,[OBMain],2
; LN:581 Timer25.stop
invoke KillTimer,[OBMain],25
; LN:582 Timer32.stop
invoke KillTimer,[OBMain],32
; LN:583 Box1.VISIBLE=FALSE
mov edi,!Box1
mov [!TargetGUIDesc],edi
btc dword [edi],2
invoke ShowWindow, dword [edi+44],SW_HIDE
; LN:584 Box2.VISIBLE=FALSE
mov edi,!Box2
mov [!TargetGUIDesc],edi
btc dword [edi],2
invoke ShowWindow, dword [edi+44],SW_HIDE
; LN:585 Box3.VISIBLE=FALSE
mov edi,!Box3
mov [!TargetGUIDesc],edi
btc dword [edi],2
invoke ShowWindow, dword [edi+44],SW_HIDE
; LN:586 end event
ret
; LN:588 MENU.COMMAND
Menu_command:
; LN:589 select case MenuID
mov eax, dword [MenuID]
mov [_SwitchInt],eax
; LN:590 case menuopen
mov eax,1000
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl72
; LN:591 gosub uncheck
call uncheck
; LN:592 TempStr="Open"
mov edi,[TempStr]
mov esi,_StrConst109
call __SetStrConst
; LN:593 StaticText1.text=TempStr
mov edi,!StaticText1
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[TempStr]
; LN:594 checkmenuitem pervis,menuopen
mov eax,1000
invoke CheckMenuItem,[pervis],eax,MF_CHECKED+MF_BYCOMMAND
; LN:595 case menusave
jmp _Lbl71
_Lbl72:
mov eax,1001
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl73
; LN:596 gosub uncheck
call uncheck
; LN:597 TempStr="Save"
mov edi,[TempStr]
mov esi,_StrConst110
call __SetStrConst
; LN:598 StaticText1.text=TempStr
mov edi,!StaticText1
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[TempStr]
; LN:599 checkmenuitem pervis,menusave
mov eax,1001
invoke CheckMenuItem,[pervis],eax,MF_CHECKED+MF_BYCOMMAND
; LN:600 case menuexit
jmp _Lbl71
_Lbl73:
mov eax,1002
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl74
; LN:601 gosub uncheck
call uncheck
; LN:602 TempStr="Exit"
mov edi,[TempStr]
mov esi,_StrConst111
call __SetStrConst
; LN:603 StaticText1.text=TempStr
mov edi,!StaticText1
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[TempStr]
; LN:604 checkmenuitem pervis,menuexit
mov eax,1002
invoke CheckMenuItem,[pervis],eax,MF_CHECKED+MF_BYCOMMAND
; LN:605 case bgred
jmp _Lbl71
_Lbl74:
mov eax,1003
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl75
; LN:606 gosub clrframe1
call clrframe1
; LN:607 RadioButton1.checked=true
mov edi,!RadioButton1
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],BM_SETCHECK,BST_CHECKED,0
; LN:608 GOSUB RadioButton1_command
call RadioButton1_command
; LN:609 case bggreen
jmp _Lbl71
_Lbl75:
mov eax,1004
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl76
; LN:610 gosub clrframe1
call clrframe1
; LN:611 RadioButton2.checked=true
mov edi,!RadioButton2
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],BM_SETCHECK,BST_CHECKED,0
; LN:612 GOSUB RadioButton2_command
call RadioButton2_command
; LN:613 case bgblue
jmp _Lbl71
_Lbl76:
mov eax,1005
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl77
; LN:614 gosub clrframe1
call clrframe1
; LN:615 RadioButton3.checked=true
mov edi,!RadioButton3
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],BM_SETCHECK,BST_CHECKED,0
; LN:616 GOSUB RadioButton3_command
call RadioButton3_command
; LN:617 case bgblack
jmp _Lbl71
_Lbl77:
mov eax,1006
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl78
; LN:618 gosub clrframe1
call clrframe1
; LN:619 RadioButton4.checked=true
mov edi,!RadioButton4
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],BM_SETCHECK,BST_CHECKED,0
; LN:620 GOSUB RadioButton4_command
call RadioButton4_command
; LN:621 case bgwhite
jmp _Lbl71
_Lbl78:
mov eax,1007
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl79
; LN:622 gosub clrframe1
call clrframe1
; LN:623 RadioButton5.checked=true
mov edi,!RadioButton5
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],BM_SETCHECK,BST_CHECKED,0
; LN:624 GOSUB RadioButton5_command
call RadioButton5_command
; LN:625 case fgred
jmp _Lbl71
_Lbl79:
mov eax,1008
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl80
; LN:626 gosub clrframe2
call clrframe2
; LN:627 RadioButton6.checked=true
mov edi,!RadioButton6
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],BM_SETCHECK,BST_CHECKED,0
; LN:628 GOSUB RadioButton6_command
call RadioButton6_command
; LN:629 case fggreen
jmp _Lbl71
_Lbl80:
mov eax,1009
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl81
; LN:630 gosub clrframe2
call clrframe2
; LN:631 RadioButton7.checked=true
mov edi,!RadioButton7
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],BM_SETCHECK,BST_CHECKED,0
; LN:632 GOSUB RadioButton7_command
call RadioButton7_command
; LN:633 case fgblue
jmp _Lbl71
_Lbl81:
mov eax,1010
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl82
; LN:634 gosub clrframe2
call clrframe2
; LN:635 RadioButton8.checked=true
mov edi,!RadioButton8
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],BM_SETCHECK,BST_CHECKED,0
; LN:636 GOSUB RadioButton8_command
call RadioButton8_command
; LN:637 case fgblack
jmp _Lbl71
_Lbl82:
mov eax,1011
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl83
; LN:638 gosub clrframe2 
call clrframe2
; LN:639 RadioButton9.checked=true
mov edi,!RadioButton9
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],BM_SETCHECK,BST_CHECKED,0
; LN:640 GOSUB RadioButton9_command
call RadioButton9_command
; LN:641 case fgwhite
jmp _Lbl71
_Lbl83:
mov eax,1012
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl84
; LN:642 gosub clrframe2
call clrframe2
; LN:643 RadioButton10.checked=true
mov edi,!RadioButton10
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],BM_SETCHECK,BST_CHECKED,0
; LN:644 GOSUB RadioButton10_command
call RadioButton10_command
; LN:645 case else
jmp _Lbl71
_Lbl84:
; LN:646 TempStr="Error"
mov edi,[TempStr]
mov esi,_StrConst112
call __SetStrConst
; LN:647 StaticText1.text=TempStr
mov edi,!StaticText1
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[TempStr]
; LN:648 end select
jmp _Lbl71
_Lbl85:
_Lbl71:
; LN:649 END EVENT
ret
uncheck:
; LN:652 uncheckmenuitem pervis,menuopen
mov eax,1000
invoke CheckMenuItem,[pervis],eax,MF_UNCHECKED+MF_BYCOMMAND
; LN:653 uncheckmenuitem pervis,menusave
mov eax,1001
invoke CheckMenuItem,[pervis],eax,MF_UNCHECKED+MF_BYCOMMAND
; LN:654 uncheckmenuitem pervis,menuexit
mov eax,1002
invoke CheckMenuItem,[pervis],eax,MF_UNCHECKED+MF_BYCOMMAND
; LN:655 return
ret
clrframe1:
; LN:658 RadioButton1.checked=false
mov edi,!RadioButton1
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],BM_SETCHECK,BST_UNCHECKED,0
; LN:659 RadioButton2.checked=false
mov edi,!RadioButton2
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],BM_SETCHECK,BST_UNCHECKED,0
; LN:660 RadioButton3.checked=false
mov edi,!RadioButton3
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],BM_SETCHECK,BST_UNCHECKED,0
; LN:661 RadioButton4.checked=false
mov edi,!RadioButton4
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],BM_SETCHECK,BST_UNCHECKED,0
; LN:662 RadioButton5.checked=false
mov edi,!RadioButton5
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],BM_SETCHECK,BST_UNCHECKED,0
; LN:663 return
ret
clrframe2:
; LN:666 RadioButton6.checked=false
mov edi,!RadioButton6
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],BM_SETCHECK,BST_UNCHECKED,0
; LN:667 RadioButton7.checked=false
mov edi,!RadioButton7
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],BM_SETCHECK,BST_UNCHECKED,0
; LN:668 RadioButton8.checked=false
mov edi,!RadioButton8
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],BM_SETCHECK,BST_UNCHECKED,0
; LN:669 RadioButton9.checked=false
mov edi,!RadioButton9
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],BM_SETCHECK,BST_UNCHECKED,0
; LN:670 RadioButton10.checked=false
mov edi,!RadioButton10
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],BM_SETCHECK,BST_UNCHECKED,0
; LN:671 return
ret
; LN:673 TestButton.command
mov edi,!TestButton
mov [!TargetGUIDesc],edi
TestButton_command:
; LN:674 if Frame2.visible=true then
mov edi,!Frame2
invoke IsWindowVisible, dword [edi+44]
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl86
; LN:675 TextBox.text="Visible"
mov edi,!TextBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst113
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:676 else
jmp _Lbl87
_Lbl86:
; LN:677 TextBox.text="Invisible"
mov edi,!TextBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst114
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:678 endif
_Lbl87:
; LN:679 CheckBox.text=TestButton.text
mov edi,!CheckBox
mov [!TargetGUIDesc],edi
mov edi,!TestButton
invoke SendMessage, dword [edi+44],WM_GETTEXT,_BufSize,[_IOBuffer]
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_IOBuffer]
; LN:681 invoke SetWindowLong,[!StaticText1+44],GWL_WNDPROC,!InterceptProc1
invoke SetWindowLong,[!StaticText1+44],GWL_WNDPROC,!InterceptProc1
; LN:683 end event
ret
; LN:685 StaticText1.intercept
mov edi,!StaticText1
mov [!TargetGUIDesc],edi
StaticText1_intercept:
; LN:686 select case wmsg
mov eax, dword [wmsg]
mov [_SwitchInt],eax
; LN:687 case WM_MOUSEMOVE
mov eax,512
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl89
; LN:688 if mousedown=true then
xor bh,bh
mov al, byte [mousedown]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl90
; LN:689 getcursorposition
invoke GetCursorPos,CursorPosX
; LN:690 SETPOSITION StaticText1,CursorPosX-mousex-xoffs,CursorPosY-mousey-yoffs,100,15
mov edi,!StaticText1
mov [!TargetGUIDesc],edi
mov eax, dword [CursorPosX]
mov edx, dword [mousex]
sub eax,edx
mov edx, dword [xoffs]
sub eax,edx
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax, dword [CursorPosY]
mov edx, dword [mousey]
sub eax,edx
mov edx, dword [yoffs]
sub eax,edx
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,15
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
invoke SetWindowPos, dword [edi+44],HWND_TOP, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28],0
; LN:691 endif
_Lbl90:
; LN:692 case WM_LBUTTONDOWN
jmp _Lbl88
_Lbl89:
mov eax,513
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl91
; LN:693 setcapture StaticText1
mov edi,!StaticText1
mov [!TargetGUIDesc],edi
invoke SetCapture, dword [edi+44]
; LN:694 mousedown=true
mov byte [mousedown],1
; LN:695 xoffs=OBMain.left		
mov edi,!OBMain
mov eax,[edi+16]
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov [xoffs],eax
; LN:696 yoffs=OBMain.top
mov edi,!OBMain
mov eax,[edi+20]
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov [yoffs],eax
; LN:697 StaticText1.backcolor=$00ff00
mov edi,!StaticText1
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:698 gosub getmousepos
call getmousepos
; LN:699 case WM_LBUTTONUP
jmp _Lbl88
_Lbl91:
mov eax,514
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl92
; LN:700 releasecapture
invoke ReleaseCapture
; LN:701 mousedown=false
mov byte [mousedown],0
; LN:702 StaticText1.backcolor=$ffffff
mov edi,!StaticText1
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:703 case else
jmp _Lbl88
_Lbl92:
; LN:704 passinterceptevent
mov [!PassInterceptEvent],1
; LN:705 end select
jmp _Lbl88
_Lbl93:
_Lbl88:
; LN:706 end event
ret
getmousepos:
; LN:709 mousex=lparam
mov eax, dword [lparam]
mov [mousex],eax
; LN:710 mousex=land(mousex,$ffff)
mov eax, dword [mousex]
mov edx,65535
and eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [mousex],eax
; LN:711 mousey=lparam
mov eax, dword [lparam]
mov [mousey],eax
; LN:712 mousey=shr(mousey,16)
mov eax, dword [mousey]
mov edx,16
mov ecx,edx
shr eax,cl
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [mousey],eax
; LN:713 return
ret
; LN:715 Timer10.timer
Timer10_timer:
; LN:716 Timer10.stop
invoke KillTimer,[OBMain],10
; LN:717 TestButton.text="timer10"
mov edi,!TestButton
mov [!TargetGUIDesc],edi
mov esi,_StrConst115
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:718 invoke SetWindowLong,[!StaticText1+44],GWL_WNDPROC,[!StaticText1+496]
invoke SetWindowLong,[!StaticText1+44],GWL_WNDPROC,[!StaticText1+496]
; LN:719 end event
ret

; Automatic END statement
invoke DeleteObject,[!Brush]
invoke PostQuitMessage,0
_ErrExit:
cinvoke puts,_ErrExitMsg
mov eax,[ERR]
invoke ExitProcess, eax
; End of Code Section

; Init Section
_Init:

mov ecx,4
mov esi,!chic
_Lbl1:
mov dword [esi],0
add esi,500
dec ecx
jne _Lbl1
mov [!havis],0
mov [!PropGrid],0
mov [!ExitButton],0
mov [!TestButton],0
mov [!movebutton],0
mov ecx,2
mov esi,!ComboBox
_Lbl2:
mov dword [esi],0
add esi,500
dec ecx
jne _Lbl2
mov [!TextBox],0
mov [!Frame],0
mov [!Frame2],0
mov [!StaticText1],0
mov [!StaticText2],0
mov [!StaticText3],0
mov [!Box1],0
mov [!Box2],0
mov [!Box3],0
mov [!ListBox],0
mov [!Slider],0
mov [!Spinner],0
mov [!ProgressBar],0
mov [!pb],0
mov [!Calendar],0
mov [!Header],0
mov [!TreeView],0
mov [!TabFolder],0
mov [!ResultBox],0
mov [!ButtonListBox],0
mov [!StatusBar],0
mov [!CheckBox],0
mov [!RadioButton1],0
mov [!RadioButton2],0
mov [!RadioButton3],0
mov [!RadioButton4],0
mov [!RadioButton5],0
mov [!RadioButton6],0
mov [!RadioButton7],0
mov [!RadioButton8],0
mov [!RadioButton9],0
mov [!RadioButton10],0
mov [!OBMain+80],OBMain_create
mov [!ExitButton+52],ExitButton_command
mov [!StaticText1+52],StaticText1_command
mov [!StaticText2+52],StaticText2_command
mov [!StaticText3+52],StaticText3_command
mov [!TextBox+112],TextBox_change
mov [!TextBox+112+4],768
mov ecx,2
mov esi,!ComboBox
_Lbl55:
mov dword [esi+112],ComboBox_change
mov dword [esi+112+4],5
add esi,500
dec ecx
jne _Lbl55
mov ecx,2
mov esi,!ComboBox
_Lbl59:
mov dword [esi+120],ComboBox_select
mov dword [esi+120+4],9
add esi,500
dec ecx
jne _Lbl59
mov [!ListBox+52],ListBox_select
mov [!Slider+76],Slider_scroll
mov [!RadioButton1+52],RadioButton1_command
mov [!RadioButton2+52],RadioButton2_command
mov [!RadioButton3+52],RadioButton3_command
mov [!RadioButton4+52],RadioButton4_command
mov [!RadioButton5+52],RadioButton5_command
mov [!RadioButton6+52],RadioButton6_command
mov [!RadioButton7+52],RadioButton7_command
mov [!RadioButton8+52],RadioButton8_command
mov [!RadioButton9+52],RadioButton9_command
mov [!RadioButton10+52],RadioButton10_command
mov [!CheckBox+52],CheckBox_command
mov [Timer1],Timer1_timer
mov [Timer2],Timer2_timer
mov [Timer25],Timer25_timer
mov [Timer7],Timer7_timer
mov [Timer32],Timer32_timer
mov [MenuEVPtr],Menu_command
mov [!TestButton+52],TestButton_command
mov dword [!StaticText1+496],!InterceptProc1
mov [Timer10],Timer10_timer
ret
; End of Init Section

; Function Code Section

proc !SubClassProc1,OBMain,wmsg,wparam,lparam
enter
push ebx esi edi
mov eax,[wparam]
mov [EventID],ax
shr eax,16
mov [EventNotify],ax
invoke GetWindowLong,[lparam],GWL_USERDATA
mov [!Desc],eax
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
cmp [wmsg],WM_COMMAND
je !wmCommand
invoke CallWindowProc,[!OldProc1],[OBMain],[wmsg],[wparam],[lparam]
jmp !Finish

proc !SubClassProc2,OBMain,wmsg,wparam,lparam
enter
push ebx esi edi
mov eax,[wparam]
mov [EventID],ax
shr eax,16
mov [EventNotify],ax
invoke GetWindowLong,[lparam],GWL_USERDATA
mov [!Desc],eax
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
cmp [wmsg],WM_COMMAND
je !wmCommand
invoke CallWindowProc,[!OldProc2],[OBMain],[wmsg],[wparam],[lparam]
jmp !Finish

proc !SubClassProc3,OBMain,wmsg,wparam,lparam
enter
push ebx esi edi
mov eax,[wparam]
mov [EventID],ax
shr eax,16
mov [EventNotify],ax
invoke GetWindowLong,[lparam],GWL_USERDATA
mov [!Desc],eax
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
cmp [wmsg],WM_COMMAND
je !wmCommand
invoke CallWindowProc,[!OldProc3],[OBMain],[wmsg],[wparam],[lparam]
jmp !Finish

proc !InterceptProc1,OBMain,wmsg,wparam,lparam
enter
push ebx esi edi
mov [!PassInterceptEvent],0
mov [!Desc],!StaticText1
call StaticText1_intercept
cmp [!PassInterceptEvent],0
je !NoPass1
invoke CallWindowProc,[!StaticText1+492],[!StaticText1+44],[wmsg],[wparam],[lparam]
!NoPass1:
jmp !Finish

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
__CmpStr:
mov edx,[edi+4]
mov edi,[edi]
mov ecx,[esi+4]
mov esi,[esi]
__CmpStrLoop:
mov al,[edi]
mov ah,[esi]
cmp al,0
je __CmpStrDone
cmp ah,0
je __CmpStrDone
cmp al,ah
jne __CmpStrDiff
inc edi
inc esi
dec edx
je __CmpStrDone
dec ecx
jne __CmpStrLoop
__CmpStrDone:
cmp al,ah
__CmpStrDiff:
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
__SetStrConst:
mov ecx,[esi+4]
mov al,[esi]
mov [edi],al
or al,al
je __SetStrConstDone
dec ecx
je __SetStrConstDone
inc esi
inc edi
jmp __SetStrConst
__SetStrConstDone:
ret
; End of Function Section
