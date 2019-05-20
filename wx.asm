;Compiler Delaration Section

format PE GUI 4.0

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
; LN:22 dim sst1 as string
align 4
sst1 dd sst1+12
 dd 255
 dd 0
 rb 255
_StrConst1 db "Exit",0
_StrConst2 db "OBMain",0
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
_StrConst3 db "test",0
!Window2WindowClass WNDCLASS
!Window2Class db 'Window2',0
_StrConst4 db "Window2",0
!Window4WindowClass WNDCLASS
!Window4Class db 'Window4',0
_StrConst5 db "Window4",0
_StrConst6 db "Red",0
_StrConst7 db "Green",0
_StrConst8 db "Blue",0
_StrConst9 db "Black",0
_StrConst10 db "White",0
_StrConst11 db "Frame",0
_StrConst12 db "b2",0
_StrConst13 db "b3",0
_StrConst14 db "b1",0
!Window3WindowClass WNDCLASS
!Window3Class db 'Window3',0
_StrConst15 db "Window3",0
_StrConst16 db "b6",0
_StrConst17 db "b5",0
_StrConst18 db "Minimize",0
_StrConst19 db "Maximize",0
_StrConst20 db "Close",0
_StrConst21 db "OBMain",0
_StrConst22 db "Resize",0
_StrConst23 db "OBMain",0
_StrConst24 db "Move",0
_StrConst25 db "OBMain",0
_StrConst26 db "Minimize",0
_StrConst27 db "Maximize",0
_StrConst28 db "Close",0
_StrConst29 db "Window2",0
_StrConst30 db "Resize",0
_StrConst31 db "Window2",0
_StrConst32 db "Move",0
_StrConst33 db "Window2",0
_StrConst34 db "Minimize",0
_StrConst35 db "Maximize",0
_StrConst36 db "Close",0
_StrConst37 db "Window3",0
_StrConst38 db "Resize",0
_StrConst39 db "Window3",0
_StrConst40 db "Move",0
_StrConst41 db "Window3",0
_StrConst42 db "Radio1",0
_StrConst43 db "Radio2",0
_StrConst44 db "Radio3",0
_StrConst45 db "Radio4",0
_StrConst46 db "Radio5",0
!ObjectCount dd 21
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
; LN:10 dim myicon as icon
myicon rd 1

;Temporary Vector
_TmpVec1 rd 3
!OldProc1 rd 1

;Temporary String Variable
_StrTmp1 rb 32
; End of Uninitialized Data Section

; Start of Control Descriptor Section
; LN:1 dim Window2 as form
!Window2 rd 500
; LN:2 dim Window3 as form
!Window3 rd 500
; LN:3 dim Window4 as form
!Window4 rd 500
; LN:4 DIM Frame AS FRAME
!Frame rd 500
; LN:5 DIM RadioButton1 AS RADIOBUTTON
!RadioButton1 rd 500
; LN:6 DIM RadioButton2 AS RADIOBUTTON
!RadioButton2 rd 500
; LN:7 DIM RadioButton3 AS RADIOBUTTON
!RadioButton3 rd 500
; LN:8 DIM RadioButton4 AS RADIOBUTTON
!RadioButton4 rd 500
; LN:9 DIM RadioButton5 AS RADIOBUTTON
!RadioButton5 rd 500
; LN:11 dim b1 as button
!b1 rd 500
; LN:12 dim b2 as button
!b2 rd 500
; LN:13 dim b3 as button
!b3 rd 500
; LN:14 dim b4 as button
!b4 rd 500
; LN:15 dim b5 as button
!b5 rd 500
; LN:16 dim b6 as button
!b6 rd 500
; LN:17 dim b7 as button
!b7 rd 500
; LN:18 dim stx1 as statictext
!stx1 rd 500
; LN:19 dim stx2 as statictext
!stx2 rd 500
; LN:20 dim stx3 as statictext
!stx3 rd 500
; LN:21 dim stx4 as statictext
!stx4 rd 500
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
mov dword [!OBMain+44],0
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

proc !WindowProc,!hwnd,wmsg,wparam,lparam
enter
push ebx esi edi
cmp [wmsg],WM_GETMINMAXINFO
jne NotwmGetMaxInfo
mov dword edi,[!hwnd]
mov dword [OBMain],edi
mov dword [!OBMain+44],edi
mov dword [!OBMain+8],0
jmp !DefWndProc
NotwmGetMaxInfo:
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
invoke DefWindowProc,[!hwnd],[wmsg],[wparam],[lparam]
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

; LN:24 OBMain.create
mov edi,!OBMain
mov [!TargetGUIDesc],edi
OBMain_create:
; LN:25 construct b1,10,10,50,20
mov edi,!b1
mov [!TargetGUIDesc],edi
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,50
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl1
invoke CreateWindowEx,0,!ControlType2,NULL,WS_VISIBLE+WS_CHILD+BS_DEFPUSHBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],101,[!hinstance],!b1
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
_Lbl1:
; LN:26 construct b2,70,10,50,20
mov edi,!b2
mov [!TargetGUIDesc],edi
mov eax,70
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,50
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl2
invoke CreateWindowEx,0,!ControlType2,NULL,WS_VISIBLE+WS_CHILD+BS_DEFPUSHBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],102,[!hinstance],!b2
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
_Lbl2:
; LN:27 construct b4,130,10,50,20
mov edi,!b4
mov [!TargetGUIDesc],edi
mov eax,130
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,50
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl3
invoke CreateWindowEx,0,!ControlType2,NULL,WS_VISIBLE+WS_CHILD+BS_DEFPUSHBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],103,[!hinstance],!b4
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],101
mov dword [edi+4],103
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
; LN:28 construct b5,190,10,50,20
mov edi,!b5
mov [!TargetGUIDesc],edi
mov eax,190
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,50
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl4
invoke CreateWindowEx,0,!ControlType2,NULL,WS_VISIBLE+WS_CHILD+BS_DEFPUSHBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],104,[!hinstance],!b5
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],101
mov dword [edi+4],104
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
; LN:29 construct b7,270,10,80,20
mov edi,!b7
mov [!TargetGUIDesc],edi
mov eax,270
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,80
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl5
invoke CreateWindowEx,0,!ControlType2,NULL,WS_VISIBLE+WS_CHILD+BS_DEFPUSHBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],105,[!hinstance],!b7
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],101
mov dword [edi+4],105
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
_Lbl5:
; LN:30 construct stx1,10,100,100,20
mov edi,!stx1
mov [!TargetGUIDesc],edi
mov eax,10
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
jc _Lbl6
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],106,[!hinstance],!stx1
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],106
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
_Lbl6:
; LN:31 construct stx2,220,100,100,20
mov edi,!stx2
mov [!TargetGUIDesc],edi
mov eax,220
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
jc _Lbl7
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],107,[!hinstance],!stx2
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
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
_Lbl7:
; LN:32 construct stx3,220,200,100,20
mov edi,!stx3
mov [!TargetGUIDesc],edi
mov eax,220
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,200
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl8
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],108,[!hinstance],!stx3
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],108
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
_Lbl8:
; LN:33 construct stx4,10,200,100,20
mov edi,!stx4
mov [!TargetGUIDesc],edi
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,200
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl9
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],109,[!hinstance],!stx4
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
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
_Lbl9:
; LN:34 b7.text="Exit"
mov edi,!b7
mov [!TargetGUIDesc],edi
mov esi,_StrConst1
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:35 OBMain.text="OBMain"
mov edi,!OBMain
mov [!TargetGUIDesc],edi
mov esi,_StrConst2
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [OBMain],WM_SETTEXT,0,[_TmpVec1]
; LN:36 createicon myicon,clock06
invoke CreateIconFromResource,!myicon+22,744,1,$30000
mov [myicon],eax
; LN:37 st1="test"
mov edi,[sst1]
mov esi,_StrConst3
call __SetStrConst
; LN:38 END EVENT
ret
; LN:40 b1.command
mov edi,!b1
mov [!TargetGUIDesc],edi
b1_command:
; LN:41 construct Window2,500,500,200,100 child
mov edi,!Window2
mov [!TargetGUIDesc],edi
mov eax,500
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,500
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,200
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl10
invoke LoadIcon,0,IDI_APPLICATION
mov [!Window2WindowClass.hIcon],eax
invoke LoadCursor,0,IDC_ARROW
mov [!Window2WindowClass.hCursor],eax
mov [!Window2WindowClass.style],0
mov [!Window2WindowClass.lpfnWndProc],!Window2Proc
mov [!Window2WindowClass.cbClsExtra],0
mov [!Window2WindowClass.cbWndExtra],0
mov eax,[!hinstance]
mov [!Window2WindowClass.hbrBackground],COLOR_BTNFACE+1
mov [!Window2WindowClass.lpszMenuName],0
mov [!Window2WindowClass.lpszClassName],!Window2Class
invoke RegisterClass,!Window2WindowClass
mov dword [!Window2],0
mov dword [!Window2+4],1
mov dword [!Window2+12],6
mov dword [!Window2+32],$ffffff
mov dword [!Window2+36],$000000
mov dword [!Window2+40],!CT_FORM
mov edi,[!TargetGUIDesc]
invoke CreateWindowEx,0,!Window2Class,!title,WS_VISIBLE+WS_OVERLAPPEDWINDOW,dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],NULL,[!hinstance],!Window2
invoke SetWindowLong,[!Window2+44],GWL_USERDATA,!Window2
mov dword [edi+0],$07
_Lbl10:
; LN:42 Window2.text="Window2"
mov edi,!Window2
mov [!TargetGUIDesc],edi
mov esi,_StrConst4
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:43 Window2.icon=myicon
mov edi,!Window2
mov [!TargetGUIDesc],edi
mov eax, dword [myicon]
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETICON,ICON_BIG,eax
; LN:44 construct Window4,0,400,500,300 child
mov edi,!Window4
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,400
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,500
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,300
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl11
invoke LoadIcon,0,IDI_APPLICATION
mov [!Window4WindowClass.hIcon],eax
invoke LoadCursor,0,IDC_ARROW
mov [!Window4WindowClass.hCursor],eax
mov [!Window4WindowClass.style],0
mov [!Window4WindowClass.lpfnWndProc],!Window4Proc
mov [!Window4WindowClass.cbClsExtra],0
mov [!Window4WindowClass.cbWndExtra],0
mov eax,[!hinstance]
mov [!Window4WindowClass.hbrBackground],COLOR_BTNFACE+1
mov [!Window4WindowClass.lpszMenuName],0
mov [!Window4WindowClass.lpszClassName],!Window4Class
invoke RegisterClass,!Window4WindowClass
mov dword [!Window4],0
mov dword [!Window4+4],1
mov dword [!Window4+12],6
mov dword [!Window4+32],$ffffff
mov dword [!Window4+36],$000000
mov dword [!Window4+40],!CT_FORM
mov edi,[!TargetGUIDesc]
invoke CreateWindowEx,0,!Window4Class,!title,WS_VISIBLE+WS_OVERLAPPEDWINDOW,dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],NULL,[!hinstance],!Window4
invoke SetWindowLong,[!Window4+44],GWL_USERDATA,!Window4
mov dword [edi+0],$07
_Lbl11:
; LN:45 Window4.text="Window4"
mov edi,!Window4
mov [!TargetGUIDesc],edi
mov esi,_StrConst5
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:46 CONSTRUCT Frame,10,70,130,140 in Window4
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
jc _Lbl12
invoke CreateWindowEx,0,!ControlType6,NULL,WS_VISIBLE+WS_CHILD+BS_GROUPBOX, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!Window4+44],112,[!hinstance],!Window4
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],105
mov dword [edi+4],112
mov eax,[!Window4+44]
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
; LN:47 CONSTRUCT RadioButton1,5,30,100,20 IN Frame
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
jc _Lbl13
invoke CreateWindowEx,0,!ControlType19,NULL,WS_VISIBLE+WS_CHILD+BS_AUTORADIOBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!Frame+44],113,[!hinstance],!Frame
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
mov dword [edi+4],113
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
_Lbl13:
; LN:48 RadioButton1.TEXT="Red"
mov edi,!RadioButton1
mov [!TargetGUIDesc],edi
mov esi,_StrConst6
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:49 RadioButton1.FORECOLOR=$0000ff
mov edi,!RadioButton1
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:50 CONSTRUCT RadioButton2,5,50,100,20 IN Frame
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
jc _Lbl14
invoke CreateWindowEx,0,!ControlType19,NULL,WS_VISIBLE+WS_CHILD+BS_AUTORADIOBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!Frame+44],114,[!hinstance],!Frame
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],118
mov dword [edi+4],114
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
_Lbl14:
; LN:51 RadioButton2.TEXT="Green"
mov edi,!RadioButton2
mov [!TargetGUIDesc],edi
mov esi,_StrConst7
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:52 RadioButton2.FORECOLOR=$00ff00
mov edi,!RadioButton2
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:53 CONSTRUCT RadioButton3,5,70,100,20 IN Frame
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
jc _Lbl15
invoke CreateWindowEx,0,!ControlType19,NULL,WS_VISIBLE+WS_CHILD+BS_AUTORADIOBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!Frame+44],115,[!hinstance],!Frame
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],118
mov dword [edi+4],115
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
_Lbl15:
; LN:54 RadioButton3.TEXT="Blue"
mov edi,!RadioButton3
mov [!TargetGUIDesc],edi
mov esi,_StrConst8
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:55 RadioButton3.FORECOLOR=$ff0000
mov edi,!RadioButton3
mov [!TargetGUIDesc],edi
mov eax,16711680
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:56 CONSTRUCT RadioButton4,5,90,100,20 IN Frame
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
jc _Lbl16
invoke CreateWindowEx,0,!ControlType19,NULL,WS_VISIBLE+WS_CHILD+BS_AUTORADIOBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!Frame+44],116,[!hinstance],!Frame
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],118
mov dword [edi+4],116
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
_Lbl16:
; LN:57 RadioButton4.TEXT="Black"
mov edi,!RadioButton4
mov [!TargetGUIDesc],edi
mov esi,_StrConst9
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:58 RadioButton4.FORECOLOR=$000000
mov edi,!RadioButton4
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:59 CONSTRUCT RadioButton5,5,110,100,20 IN Frame
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
jc _Lbl17
invoke CreateWindowEx,0,!ControlType19,NULL,WS_VISIBLE+WS_CHILD+BS_AUTORADIOBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!Frame+44],117,[!hinstance],!Frame
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],118
mov dword [edi+4],117
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
_Lbl17:
; LN:60 RadioButton5.TEXT="White"
mov edi,!RadioButton5
mov [!TargetGUIDesc],edi
mov esi,_StrConst10
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:61 RadioButton5.FORECOLOR=$ffffff
mov edi,!RadioButton5
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:62 Frame.text="Frame"
mov edi,!Frame
mov [!TargetGUIDesc],edi
mov esi,_StrConst11
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:63 END EVENT
ret
; LN:65 Window2.create
mov edi,!Window2
mov [!TargetGUIDesc],edi
Window2_create:
; LN:66 Timer1.interval=1
mov eax,1
invoke SetTimer,[OBMain],1,eax,NULL
; LN:67 end event
ret
; LN:69 Timer1.Timer
Timer1_timer:
; LN:70 Timer1.stop
invoke KillTimer,[OBMain],1
; LN:71 construct b3,10,30,30,20 in Window2
mov edi,!b3
mov [!TargetGUIDesc],edi
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,30
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,30
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl18
invoke CreateWindowEx,0,!ControlType2,NULL,WS_VISIBLE+WS_CHILD+BS_DEFPUSHBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!Window2+44],118,[!hinstance],!Window2
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],101
mov dword [edi+4],118
mov eax,[!Window2+44]
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
; LN:72 b2.text="b2"
mov edi,!b2
mov [!TargetGUIDesc],edi
mov esi,_StrConst12
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:73 endevent
ret
; LN:75 b2.command
mov edi,!b2
mov [!TargetGUIDesc],edi
b2_command:
; LN:76 b3.text="b3"
mov edi,!b3
mov [!TargetGUIDesc],edi
mov esi,_StrConst13
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:77 END EVENT
ret
; LN:79 b3.command
mov edi,!b3
mov [!TargetGUIDesc],edi
b3_command:
; LN:80 b1.text="b1"
mov edi,!b1
mov [!TargetGUIDesc],edi
mov esi,_StrConst14
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:81 construct Window3,500,300,200,100 CHILD
mov edi,!Window3
mov [!TargetGUIDesc],edi
mov eax,500
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,300
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,200
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,100
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl19
invoke LoadIcon,0,IDI_APPLICATION
mov [!Window3WindowClass.hIcon],eax
invoke LoadCursor,0,IDC_ARROW
mov [!Window3WindowClass.hCursor],eax
mov [!Window3WindowClass.style],0
mov [!Window3WindowClass.lpfnWndProc],!Window3Proc
mov [!Window3WindowClass.cbClsExtra],0
mov [!Window3WindowClass.cbWndExtra],0
mov eax,[!hinstance]
mov [!Window3WindowClass.hbrBackground],COLOR_BTNFACE+1
mov [!Window3WindowClass.lpszMenuName],0
mov [!Window3WindowClass.lpszClassName],!Window3Class
invoke RegisterClass,!Window3WindowClass
mov dword [!Window3],0
mov dword [!Window3+4],1
mov dword [!Window3+12],6
mov dword [!Window3+32],$ffffff
mov dword [!Window3+36],$000000
mov dword [!Window3+40],!CT_FORM
mov edi,[!TargetGUIDesc]
invoke CreateWindowEx,0,!Window3Class,!title,WS_VISIBLE+WS_OVERLAPPEDWINDOW,dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],NULL,[!hinstance],!Window3
invoke SetWindowLong,[!Window3+44],GWL_USERDATA,!Window3
mov dword [edi+0],$07
_Lbl19:
; LN:82 Window3.text="Window3"
mov edi,!Window3
mov [!TargetGUIDesc],edi
mov esi,_StrConst15
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:83 construct b6,10,30,30,20 in Window3
mov edi,!b6
mov [!TargetGUIDesc],edi
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,30
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,30
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl20
invoke CreateWindowEx,0,!ControlType2,NULL,WS_VISIBLE+WS_CHILD+BS_DEFPUSHBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!Window3+44],120,[!hinstance],!Window3
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],101
mov dword [edi+4],120
mov eax,[!Window3+44]
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
; LN:84 b6.text="b6"
mov edi,!b6
mov [!TargetGUIDesc],edi
mov esi,_StrConst16
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:85 END EVENT
ret
; LN:87 b4.command
mov edi,!b4
mov [!TargetGUIDesc],edi
b4_command:
; LN:88 Window2.visible=false
mov edi,!Window2
mov [!TargetGUIDesc],edi
btc dword [edi],2
invoke ShowWindow, dword [edi+44],SW_HIDE
; LN:89 invoke CreateSolidBrush,$0000ff
invoke CreateSolidBrush,$0000ff
; LN:90 invoke SetClassLong,[!Window2+44],GCL_HBRBACKGROUND,eax
invoke SetClassLong,[!Window2+44],GCL_HBRBACKGROUND,eax
; LN:91 invoke InvalidateRect,[!Window2+44],NULL,TRUE
invoke InvalidateRect,[!Window2+44],NULL,TRUE
; LN:92 invoke UpdateWindow,[!Window2+44]
invoke UpdateWindow,[!Window2+44]
; LN:93 END EVENT
ret
; LN:95 b5.command
mov edi,!b5
mov [!TargetGUIDesc],edi
b5_command:
; LN:96 Window2.visible=true
mov edi,!Window2
mov [!TargetGUIDesc],edi
bts dword [edi],2
invoke ShowWindow, dword [edi+44],SW_SHOW
; LN:97 END EVENT
ret
; LN:99 b6.command
mov edi,!b6
mov [!TargetGUIDesc],edi
b6_command:
; LN:100 b5.text="b5"
mov edi,!b5
mov [!TargetGUIDesc],edi
mov esi,_StrConst17
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:101 invoke CreateSolidBrush,$800080
invoke CreateSolidBrush,$800080
; LN:102 invoke SetClassLong,[!Window3+44],GCL_HBRBACKGROUND,eax
invoke SetClassLong,[!Window3+44],GCL_HBRBACKGROUND,eax
; LN:103 invoke InvalidateRect,[!Window3+44],NULL,TRUE
invoke InvalidateRect,[!Window3+44],NULL,TRUE
; LN:104 invoke UpdateWindow,[!Window3+44]
invoke UpdateWindow,[!Window3+44]
; LN:105 END EVENT
ret
; LN:107 b7.command
mov edi,!b7
mov [!TargetGUIDesc],edi
b7_command:
; LN:108 end
invoke DeleteObject,[!Brush]
invoke PostQuitMessage,0
; LN:109 END EVENT
ret
; LN:111 OBMain.system
mov edi,!OBMain
mov [!TargetGUIDesc],edi
OBMain_system:
; LN:112 select case STATUS
mov eax, dword [STATUS]
mov [_SwitchInt],eax
; LN:113 case $f020
mov eax,61472
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl22
; LN:114 stx2.text="Minimize"
mov edi,!stx2
mov [!TargetGUIDesc],edi
mov esi,_StrConst18
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:115 invoke CreateSolidBrush,$ff0000
invoke CreateSolidBrush,$ff0000
; LN:116 invoke SetClassLong,[!OBMain+44],GCL_HBRBACKGROUND,eax
invoke SetClassLong,[!OBMain+44],GCL_HBRBACKGROUND,eax
; LN:117 invoke InvalidateRect,[!OBMain+44],NULL,TRUE
invoke InvalidateRect,[!OBMain+44],NULL,TRUE
; LN:118 invoke UpdateWindow,[!OBMain+44]
invoke UpdateWindow,[!OBMain+44]
; LN:119 case $f030
jmp _Lbl21
_Lbl22:
mov eax,61488
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl23
; LN:120 stx2.text="Maximize"
mov edi,!stx2
mov [!TargetGUIDesc],edi
mov esi,_StrConst19
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:121 invoke CreateSolidBrush,$80ffff
invoke CreateSolidBrush,$80ffff
; LN:122 invoke SetClassLong,[!OBMain+44],GCL_HBRBACKGROUND,eax
invoke SetClassLong,[!OBMain+44],GCL_HBRBACKGROUND,eax
; LN:123 invoke InvalidateRect,[!OBMain+44],NULL,TRUE
invoke InvalidateRect,[!OBMain+44],NULL,TRUE
; LN:124 invoke UpdateWindow,[!OBMain+44]
invoke UpdateWindow,[!OBMain+44]
; LN:125 case $f060
jmp _Lbl21
_Lbl23:
mov eax,61536
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl24
; LN:126 stx2.text="Close"
mov edi,!stx2
mov [!TargetGUIDesc],edi
mov esi,_StrConst20
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:127 end select
jmp _Lbl21
_Lbl24:
_Lbl21:
; LN:128 stx1.text="OBMain"
mov edi,!stx1
mov [!TargetGUIDesc],edi
mov esi,_StrConst21
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:129 stx3.text=hex(STATUS)
mov edi,!stx3
mov [!TargetGUIDesc],edi
mov eax, dword [STATUS]
cinvoke ltoa,eax,[_ConvBuf1],16
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:130 END EVENT
ret
; LN:132 OBMain.resize
mov edi,!OBMain
mov [!TargetGUIDesc],edi
OBMain_resize:
; LN:133 stx2.text="Resize"
mov edi,!stx2
mov [!TargetGUIDesc],edi
mov esi,_StrConst22
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:134 stx1.text="OBMain"
mov edi,!stx1
mov [!TargetGUIDesc],edi
mov esi,_StrConst23
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:135 END EVENT
ret
; LN:137 OBMain.move
mov edi,!OBMain
mov [!TargetGUIDesc],edi
OBMain_move:
; LN:138 stx2.text="Move"
mov edi,!stx2
mov [!TargetGUIDesc],edi
mov esi,_StrConst24
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:139 stx1.text="OBMain"
mov edi,!stx1
mov [!TargetGUIDesc],edi
mov esi,_StrConst25
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:140 END EVENT
ret
; LN:142 Window2.system
mov edi,!Window2
mov [!TargetGUIDesc],edi
Window2_system:
; LN:143 select case STATUS
mov eax, dword [STATUS]
mov [_SwitchInt],eax
; LN:144 case $f020
mov eax,61472
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl26
; LN:145 stx2.text="Minimize"
mov edi,!stx2
mov [!TargetGUIDesc],edi
mov esi,_StrConst26
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:146 case $f030
jmp _Lbl25
_Lbl26:
mov eax,61488
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl27
; LN:147 stx2.text="Maximize"
mov edi,!stx2
mov [!TargetGUIDesc],edi
mov esi,_StrConst27
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:148 case $f060
jmp _Lbl25
_Lbl27:
mov eax,61536
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl28
; LN:149 stx2.text="Close"
mov edi,!stx2
mov [!TargetGUIDesc],edi
mov esi,_StrConst28
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:150 passsystemevent
mov [!PassSystemEvent],1
; LN:151 end select
jmp _Lbl25
_Lbl28:
_Lbl25:
; LN:152 stx1.text="Window2"
mov edi,!stx1
mov [!TargetGUIDesc],edi
mov esi,_StrConst29
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:153 stx3.text=hex(STATUS)
mov edi,!stx3
mov [!TargetGUIDesc],edi
mov eax, dword [STATUS]
cinvoke ltoa,eax,[_ConvBuf1],16
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:154 END EVENT
ret
; LN:156 Window2.resize
mov edi,!Window2
mov [!TargetGUIDesc],edi
Window2_resize:
; LN:157 stx2.text="Resize"
mov edi,!stx2
mov [!TargetGUIDesc],edi
mov esi,_StrConst30
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:158 stx1.text="Window2"
mov edi,!stx1
mov [!TargetGUIDesc],edi
mov esi,_StrConst31
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:159 END EVENT
ret
; LN:161 Window2.move
mov edi,!Window2
mov [!TargetGUIDesc],edi
Window2_move:
; LN:162 stx2.text="Move"
mov edi,!stx2
mov [!TargetGUIDesc],edi
mov esi,_StrConst32
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:163 stx1.text="Window2"
mov edi,!stx1
mov [!TargetGUIDesc],edi
mov esi,_StrConst33
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:164 END EVENT
ret
; LN:166 Window3.system
mov edi,!Window3
mov [!TargetGUIDesc],edi
Window3_system:
; LN:167 select case STATUS
mov eax, dword [STATUS]
mov [_SwitchInt],eax
; LN:168 case $f020
mov eax,61472
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl30
; LN:169 stx2.text="Minimize"
mov edi,!stx2
mov [!TargetGUIDesc],edi
mov esi,_StrConst34
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:170 case $f030
jmp _Lbl29
_Lbl30:
mov eax,61488
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl31
; LN:171 stx2.text="Maximize"
mov edi,!stx2
mov [!TargetGUIDesc],edi
mov esi,_StrConst35
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:172 case $f060
jmp _Lbl29
_Lbl31:
mov eax,61536
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl32
; LN:173 stx2.text="Close"
mov edi,!stx2
mov [!TargetGUIDesc],edi
mov esi,_StrConst36
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:174 end select
jmp _Lbl29
_Lbl32:
_Lbl29:
; LN:175 stx1.text="Window3"
mov edi,!stx1
mov [!TargetGUIDesc],edi
mov esi,_StrConst37
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:176 stx3.text=hex(STATUS)
mov edi,!stx3
mov [!TargetGUIDesc],edi
mov eax, dword [STATUS]
cinvoke ltoa,eax,[_ConvBuf1],16
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:177 END EVENT
ret
; LN:179 Window3.resize
mov edi,!Window3
mov [!TargetGUIDesc],edi
Window3_resize:
; LN:180 stx2.text="Resize"
mov edi,!stx2
mov [!TargetGUIDesc],edi
mov esi,_StrConst38
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:181 stx1.text="Window3"
mov edi,!stx1
mov [!TargetGUIDesc],edi
mov esi,_StrConst39
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:182 END EVENT
ret
; LN:184 Window3.move
mov edi,!Window3
mov [!TargetGUIDesc],edi
Window3_move:
; LN:185 stx2.text="Move"
mov edi,!stx2
mov [!TargetGUIDesc],edi
mov esi,_StrConst40
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:186 stx1.text="Window3"
mov edi,!stx1
mov [!TargetGUIDesc],edi
mov esi,_StrConst41
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:187 END EVENT
ret
mouse1:
; LN:190 stx4.text=hex(STATUS)
mov edi,!stx4
mov [!TargetGUIDesc],edi
mov eax, dword [STATUS]
cinvoke ltoa,eax,[_ConvBuf1],16
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:191 return
ret
; LN:193 RadioButton1.command
mov edi,!RadioButton1
mov [!TargetGUIDesc],edi
RadioButton1_command:
; LN:194 b4.text="Radio1"
mov edi,!b4
mov [!TargetGUIDesc],edi
mov esi,_StrConst42
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:195 invoke CreateSolidBrush,$00ff00
invoke CreateSolidBrush,$00ff00
; LN:196 invoke SetClassLong,[!Window4+44],GCL_HBRBACKGROUND,eax
invoke SetClassLong,[!Window4+44],GCL_HBRBACKGROUND,eax
; LN:197 invoke InvalidateRect,[!Window4+44],NULL,TRUE
invoke InvalidateRect,[!Window4+44],NULL,TRUE
; LN:198 invoke UpdateWindow,[!Window4+44]
invoke UpdateWindow,[!Window4+44]
; LN:199 end event
ret
; LN:201 RadioButton2.command
mov edi,!RadioButton2
mov [!TargetGUIDesc],edi
RadioButton2_command:
; LN:202 b4.text="Radio2"
mov edi,!b4
mov [!TargetGUIDesc],edi
mov esi,_StrConst43
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:203 end event
ret
; LN:205 RadioButton3.command
mov edi,!RadioButton3
mov [!TargetGUIDesc],edi
RadioButton3_command:
; LN:206 b4.text="Radio3"
mov edi,!b4
mov [!TargetGUIDesc],edi
mov esi,_StrConst44
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:207 end event
ret
; LN:209 RadioButton4.command
mov edi,!RadioButton4
mov [!TargetGUIDesc],edi
RadioButton4_command:
; LN:210 b4.text="Radio4"
mov edi,!b4
mov [!TargetGUIDesc],edi
mov esi,_StrConst45
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:211 end event
ret
; LN:213 RadioButton5.command
mov edi,!RadioButton5
mov [!TargetGUIDesc],edi
RadioButton5_command:
; LN:214 b4.text="Radio5"
mov edi,!b4
mov [!TargetGUIDesc],edi
mov esi,_StrConst46
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:215 end event
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

mov [!Window2],0
mov [!Window3],0
mov [!Window4],0
mov [!Frame],0
mov [!RadioButton1],0
mov [!RadioButton2],0
mov [!RadioButton3],0
mov [!RadioButton4],0
mov [!RadioButton5],0
mov [!b1],0
mov [!b2],0
mov [!b3],0
mov [!b4],0
mov [!b5],0
mov [!b6],0
mov [!b7],0
mov [!stx1],0
mov [!stx2],0
mov [!stx3],0
mov [!stx4],0
mov [!OBMain+80],OBMain_create
mov [!b1+52],b1_command
mov [!Window2+80],Window2_create
mov [Timer1],Timer1_timer
mov [!b2+52],b2_command
mov [!b3+52],b3_command
mov [!b4+52],b4_command
mov [!b5+52],b5_command
mov [!b6+52],b6_command
mov [!b7+52],b7_command
mov [!OBMain+384],OBMain_system
mov [!OBMain+388],OBMain_resize
mov [!OBMain+392],OBMain_move
mov [!Window2+384],Window2_system
mov [!Window2+388],Window2_resize
mov [!Window2+392],Window2_move
mov [!Window3+384],Window3_system
mov [!Window3+388],Window3_resize
mov [!Window3+392],Window3_move
mov [!RadioButton1+52],RadioButton1_command
mov [!RadioButton2+52],RadioButton2_command
mov [!RadioButton3+52],RadioButton3_command
mov [!RadioButton4+52],RadioButton4_command
mov [!RadioButton5+52],RadioButton5_command
ret
; End of Init Section

; Function Code Section

proc !Window2Proc,!hwnd,wmsg,wparam,lparam
enter
push ebx esi edi
mov [!PassSystemEvent],0
cmp [wmsg],WM_GETMINMAXINFO
jne Window2NotwmGetMaxInfo
mov dword edi,[!hwnd]
mov dword [!Window2+44],edi
mov dword [!Window2+8],0
jmp !DefWndProc
Window2NotwmGetMaxInfo:
mov esi,!Window2
cmp [wmsg],WM_DESTROY
jne hook
invoke MessageBox,[OBMain],[sst1],[sst1],MB_OK
jmp !Window2DefWndProc
hook:
jmp !WinProcCommon
!Window2DefWndProc:
jmp !DefWndProc
proc !Window4Proc,!hwnd,wmsg,wparam,lparam
enter
push ebx esi edi
mov [!PassSystemEvent],0
cmp [wmsg],WM_GETMINMAXINFO
jne Window4NotwmGetMaxInfo
mov dword edi,[!hwnd]
mov dword [!Window4+44],edi
mov dword [!Window4+8],0
jmp !DefWndProc
Window4NotwmGetMaxInfo:
mov esi,!Window4
cmp [wmsg],WM_DESTROY
je !Window4DefWndProc
jmp !WinProcCommon
!Window4DefWndProc:
jmp !DefWndProc
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
invoke CallWindowProc,[!OldProc1],[!hwnd],[wmsg],[wparam],[lparam]
jmp !Finish

proc !Window3Proc,!hwnd,wmsg,wparam,lparam
enter
push ebx esi edi
mov [!PassSystemEvent],0
cmp [wmsg],WM_GETMINMAXINFO
jne Window3NotwmGetMaxInfo
mov dword edi,[!hwnd]
mov dword [!Window3+44],edi
mov dword [!Window3+8],0
jmp !DefWndProc
Window3NotwmGetMaxInfo:
mov esi,!Window3
cmp [wmsg],WM_DESTROY
je !Window3DefWndProc
jmp !WinProcCommon
!Window3DefWndProc:
jmp !DefWndProc
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
