;Compiler Delaration Section

format PE GUI 4.0

entry !Start

macro align value { rb (value-1) - (rva $ + value-1) mod value }

_BufSize=1000
MenuGetListFromCard equ 1000
MenuSaveListToCard equ 1001
MenuGetListFromFile equ 1002
MenuSaveListToFile equ 1003
MenuGetSetupFromFile equ 1004
MenuSaveSetupToFile equ 1005
MenuPutSetupIntoList equ 1006
MenuDeleteSetupFromList equ 1007
MenuCopyCardToFile equ 1008
MenuCopyFileToCard equ 1009
MenuExit equ 1010
MenuClear equ 1011
MenuEraseList equ 1012
MenuEraseSetup equ 1013
MenuExport equ 1014
MenuAbout equ 1015
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
; LN:25 DIM FileName AS STRING
align 4
FileName dd FileName+12
 dd 255
 dd 0
 rb 255
; LN:30 DIM TempStr AS STRING
align 4
TempStr dd TempStr+12
 dd 255
 dd 0
 rb 255
; LN:31 DIM TempStr2 AS STRING
align 4
TempStr2 dd TempStr2+12
 dd 255
 dd 0
 rb 255
; LN:32 DIM DriverName AS STRING
align 4
DriverName dd DriverName+12
 dd 255
 dd 0
 rb 255
; LN:41 DIM MoldNumber AS STRING*10
align 4
MoldNumber dd MoldNumber+12
 dd 10
 dd 0
 rb 10
; LN:42 DIM MachName AS STRING*12 VECTOR
align 4
MachName dd MachName+12
 dd 12
 dd 0
 rb 12
; LN:43 DIM TempMachName AS STRING*12
align 4
TempMachName dd TempMachName+12
 dd 12
 dd 0
 rb 12
; LN:44 DIM MoldName AS STRING*30 VECTOR
align 4
MoldName dd MoldName+12
 dd 30
 dd 0
 rb 30
; LN:45 DIM TempMoldName AS STRING*30
align 4
TempMoldName dd TempMoldName+12
 dd 30
 dd 0
 rb 30
; LN:46 DIM SetupName AS STRING'*32
align 4
SetupName dd SetupName+12
 dd 255
 dd 0
 rb 255
; LN:63 DIM TextSafe AS STRING
align 4
TextSafe dd TextSafe+12
 dd 255
 dd 0
 rb 255
; LN:64 DIM InitDir AS STRING
align 4
InitDir dd InitDir+12
 dd 255
 dd 0
 rb 255
_StrConst1 db "Innomation Systems, Inc.                                      Toyo Setup Manager",0
_StrConst2 db "OmniUSB",0
_StrConst3 db "File",0
_StrConst4 db "Get List From Card",0
_StrConst5 db "Save List To Card",0
_StrConst6 db "Get List From File",0
_StrConst7 db "Save List To File",0
_StrConst8 db "Get Setup From File",0
_StrConst9 db "Save Setup To File",0
_StrConst10 db "Put Setup Into List",0
_StrConst11 db "Delete Setup From List",0
_StrConst12 db "Copy Card To File",0
_StrConst13 db "Copy File To Card",0
_StrConst14 db "Exit",0
_StrConst15 db "Utility",0
_StrConst16 db "Clear All Settings",0
_StrConst17 db "Erase Entire List",0
_StrConst18 db "Erase Setup From List",0
_StrConst19 db "Export Setup",0
_StrConst20 db "Help",0
_StrConst21 db "About",0
_StrConst22 db "Prompt/Result",0
_StrConst23 db "List Source",0
_StrConst24 db "Setup Source",0
_StrConst25 db "Get List From Card",0
_StrConst26 db "Save List To Card",0
_StrConst27 db "Get Setup From File",0
_StrConst28 db "Save Setup To File",0
_StrConst29 db "Get List From File",0
_StrConst30 db "Save List To File",0
_StrConst31 db "Put Setup Into List",0
_StrConst32 db "Delete Setup From List",0
_StrConst33 db "Copy Card To File",0
_StrConst34 db "Copy File To Card",0
_StrConst35 db "Clear",0
_StrConst36 db "Exit",0
_StrConst37 db "Setup Name",0
_StrConst38 db "Parameter",0
_StrConst39 db "1",0
_StrConst40 db "2",0
_StrConst41 db "3",0
_StrConst42 db "4",0
_StrConst43 db "5",0
_StrConst44 db "6",0
_StrConst45 db "7",0
_StrConst46 db "8",0
_StrConst47 db "9",0
_StrConst48 db "10",0
_StrConst49 db "c:\Tsm",0
PCCFileFilter db "Memory Card File",0,"*.pcc",0,0
TSMFileFilter db "Setup File",0,"*.tsm",0,0
CSVFileFilter db "Export File",0,"*.csv",0,0
!Icon:
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
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $0
 db $f0
 db $f0
 db $f0
 db $f
 db $f
 db $ff
 db $f
 db $0
 db $ff
 db $f0
 db $f
 db $f
 db $f
 db $f
 db $f0
 db $ff
 db $f0
 db $f0
 db $f0
 db $f
 db $f
 db $f0
 db $ff
 db $f
 db $f
 db $f
 db $ff
 db $f
 db $f
 db $f
 db $f0
 db $ff
 db $f0
 db $f0
 db $ff
 db $f
 db $f
 db $f0
 db $ff
 db $f
 db $f
 db $0
 db $f
 db $f
 db $f
 db $f
 db $f0
 db $ff
 db $f0
 db $f
 db $f0
 db $f
 db $0
 db $f0
 db $f
 db $f
 db $f
 db $f0
 db $ff
 db $0
 db $0
 db $ff
 db $ff
 db $0
 db $f0
 db $ff
 db $ff
 db $ff
 db $ff
 db $f0
 db $ff
 db $0
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $f0
 db $0
 db $f
 db $ff
 db $f0
 db $0
 db $f
 db $ff
 db $f0
 db $0
 db $f
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $ff
 db $f
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
 db $ff
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $f9
 db $99
 db $99
 db $ff
 db $ff
 db $f
 db $0
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $f9
 db $99
 db $99
 db $ff
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $f9
 db $99
 db $99
 db $ff
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $f9
 db $99
 db $99
 db $ff
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $f9
 db $99
 db $99
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $f9
 db $99
 db $99
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $ff
 db $f
 db $0
 db $ff
 db $f0
 db $0
 db $0
 db $ff
 db $f9
 db $99
 db $99
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $f0
 db $ff
 db $f0
 db $0
 db $0
 db $ff
 db $f9
 db $99
 db $99
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $f0
 db $ff
 db $f0
 db $0
 db $0
 db $ff
 db $f9
 db $99
 db $99
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $f
 db $0
 db $ff
 db $ff
 db $f0
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $f0
 db $f
 db $f0
 db $f
 db $0
 db $f
 db $0
 db $f0
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $f0
 db $f0
 db $f0
 db $f0
 db $ff
 db $f
 db $f
 db $f
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
 db $ff
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
_StrConst50 db "List Erased",0
_StrConst51 db ".CSV",0
_StrConst52 db ".CSV",0
_StrConst53 db "Export Setup To File Canceled",0
_StrConst54 db ",,,,,,,,,,",0
_StrConst55 db "Parameter,1,2,3,4,5,6,7,8,9,10",0
_StrConst56 db ",",0
_StrConst57 db "Export Setup To File Successful",0
_StrConst58 db "No Card Reader Installed",0
_StrConst59 db "No Card Reader Installed",0
_StrConst60 db "Setup Has Been Selected From List",0
_StrConst61 db "List",0
_StrConst62 db "Delete Setup From List",0
_StrConst63 db "Setup Has Been Deleted From List",0
_StrConst64 db "Put Setup Into List",0
_StrConst65 db "Setup Has Been Added To List",0
_StrConst66 db "Get List From Card Failed",0
_StrConst67 db "Get List From Card Successful",0
_StrConst68 db "Card",0
_StrConst69 db "Previous List",0
_StrConst70 db "Save List To Card",0
_StrConst71 db "Overwrite Card?",0
_StrConst72 db "Save List To Card Canceled",0
_StrConst73 db "Save List To Card Failed",0
_StrConst74 db "Save List To Card Successful",0
_StrConst75 db "Get Setup From File Successful",0
_StrConst76 db "0",0
_StrConst77 db "Vacant",0
_StrConst78 db "00000000",0
_StrConst79 db " ",0
_StrConst80 db " ",0
_StrConst81 db "Get Setup From File Canceled",0
_StrConst82 db ".TSM",0
_StrConst83 db ".TSM",0
_StrConst84 db "Save Setup To File Successful",0
_StrConst85 db "Save Setup To File Canceled",0
_StrConst86 db "Get List From File Successful",0
_StrConst87 db "Previous List",0
_StrConst88 db "Get List From File Canceled",0
_StrConst89 db ".PCC",0
_StrConst90 db ".PCC",0
_StrConst91 db "Save List To File Successful",0
_StrConst92 db "Save List To File Canceled",0
_StrConst93 db "Cancel",0
_StrConst94 db "Select Destination In List",0
_StrConst95 db "Put Setup Into List",0
_StrConst96 db "Put Setup Into List Canceled",0
_StrConst97 db "Cancel",0
_StrConst98 db "Select Setup To Delete In List",0
_StrConst99 db "Delete Setup In List",0
_StrConst100 db "Delete Setup In List Canceled",0
_StrConst101 db ".PCC",0
_StrConst102 db ".PCC",0
_StrConst103 db "Copy Card To File Successful",0
_StrConst104 db "Copy Card To File Canceled",0
_StrConst105 db "Copy Card To File Failed",0
_StrConst106 db "Get List From File Successful",0
_StrConst107 db "Copy File To Card Failed",0
_StrConst108 db "Save List To Card",0
_StrConst109 db "Overwrite Card?",0
_StrConst110 db "Save List To Card Canceled",0
_StrConst111 db "Copy File To Card Successful",0
_StrConst112 db "Copy File To Card Failed",0
_StrConst113 db "Inj Speed",0
_StrConst114 db "Inj Press",0
_StrConst115 db "Inj Hold Press",0
_StrConst116 db "Inj Position",0
_StrConst117 db "Inj Time",0
_StrConst118 db "Charge Speed",0
_StrConst119 db "Back Press",0
_StrConst120 db "Charge Position",0
_StrConst121 db "Mold Open Slow",0
_StrConst122 db "Mold Open Fast Pos",0
_StrConst123 db "Mold Movement1",0
_StrConst124 db "Mold Movement2",0
_StrConst125 db "Eject Motion",0
_StrConst126 db "Eject Delay",0
_StrConst127 db "Eject Hold",0
_StrConst128 db "Eject Setup",0
_StrConst129 db "Heater",0
_StrConst130 db "Heater High Limit",0
_StrConst131 db "Heater Low Limit",0
_StrConst132 db "Heater Limit O/X",0
_StrConst133 db "O",0
_StrConst134 db "X",0
_StrConst135 db "O",0
_StrConst136 db "X",0
_StrConst137 db "O",0
_StrConst138 db "X",0
_StrConst139 db "O",0
_StrConst140 db "X",0
_StrConst141 db "O",0
_StrConst142 db "X",0
_StrConst143 db "O",0
_StrConst144 db "X",0
_StrConst145 db "O",0
_StrConst146 db "X",0
_StrConst147 db "Suckback Speed",0
_StrConst148 db "Open Position",0
_StrConst149 db "0",0
_StrConst150 db "Vacant",0
_StrConst151 db "00000000",0
_StrConst152 db " ",0
_StrConst153 db " ",0
_StrConst154 db "No Setup Loaded",0
_StrConst155 db "Welcome To Toyo Setup Manager",0
_StrConst156 db "No List Loaded",0
_StrConst157 db "No Setup Loaded",0
_StrConst158 db ".",0
_StrConst159 db ".",0
_StrConst160 db ".",0
_StrConst161 db ".",0
_StrConst162 db "0.0",0
_StrConst163 db "0.",0
_StrConst164 db ".",0
_StrConst165 db ".",0
_StrConst166 db ".",0
!AboutWindowWindowClass WNDCLASS
!AboutWindowClass db 'AboutWindow',0
_StrConst167 db "Toyo Setup Manager",0
_StrConst168 db "Toyo Setup Manager",0
_StrConst169 db "Version 1.1b",0
_StrConst170 db "Copyright 2004 ISI",0
_StrConst171 db "Powered By OmniBasic",0
_StrConst172 db "Innomation Systems,Inc.",0
!ObjectCount dd 31
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
; LN:6 DIM AboutConstructed AS BOOLEAN
AboutConstructed rb 1
align 4
; LN:12 DIM ReadCardStat AS LONG
ReadCardStat rd 1
align 4
; LN:13 DIM WriteCardStat AS LONG
WriteCardStat rd 1
; LN:14 DIM ByteAcc(4) AS BYTE
align 4
ByteAcc rb 4
; LN:15 DIM IntegerAcc AS INTEGER VECTOR
align 4
IntegerAcc rd 3
; LN:16 DIM LongAcc AS LONG VECTOR
align 4
LongAcc rd 3
; LN:17 DIM BitTestAcc AS INTEGER VECTOR
align 4
BitTestAcc rd 3
align 4
; LN:18 DIM Icon AS ICON
Icon rd 1
align 4
; LN:19 DIM TempInt AS LONG
TempInt rd 1
align 4
; LN:20 DIM TempInt2 AS LONG
TempInt2 rd 1
; LN:21 DIM sbParts(4) as long
align 4
sbParts rd 4
align 4
; LN:22 DIM CardFile AS FILE
CardFile rd 1
align 4
; LN:23 DIM MoldFile AS FILE
MoldFile rd 1
align 4
; LN:24 DIM ExportFile AS FILE
ExportFile rd 1
; LN:26 DIM CardBuf(262144) AS BYTE
align 4
CardBuf rb 262144
align 4
; LN:27 DIM CardBufNdx AS LONG
CardBufNdx rd 1
; LN:28 DIM MoldBuf(2048) AS BYTE
align 4
MoldBuf rb 2048
align 4
; LN:29 DIM MoldBufNdx AS LONG
MoldBufNdx rd 1
align 4
; LN:33 DIM DriverHandle AS LONG
DriverHandle rd 1
align 4
; LN:47 DIM MoldIndex AS LONG
MoldIndex rd 1
align 4
; LN:62 DIM DataGridRow AS LONG
DataGridRow rd 1
; LN:68 DIM StoreFlag AS BOOLEAN
StoreFlag rb 1
; LN:69 DIM DeleteFlag AS BOOLEAN
DeleteFlag rb 1
; LN:70 DIM SetupLoaded AS BOOLEAN
SetupLoaded rb 1
; LN:71 DIM SetupLoadedFromList AS BOOLEAN
SetupLoadedFromList rb 1
; LN:72 DIM ListLoaded AS BOOLEAN
ListLoaded rb 1

;Temporary Vector
_TmpVec1 rd 3
MainMenu rd 1
FileMenu rd 1
UtilityMenu rd 1
MenuHelp rd 1
!OldProc1 rd 1

;For Loop Vector
_LopVec1 rd 2

;Temporary Variable
_Tmp1 rd 1

;For Loop Vector
_LopVec2 rd 2

;Temporary Vector
_TmpVec2 rd 3

;For Loop Vector
_LopVec3 rd 2

;Temporary Variable
_Tmp2 rd 1

;For Loop Vector
_LopVec4 rd 2

;Temporary String Variable
_StrTmp1 rb 32

;Temporary Vector
_TmpVec3 rd 3

;Temporary Vector
_TmpVec4 rd 3

;Temporary Vector
_TmpVec5 rd 3
; End of Uninitialized Data Section

; Start of Control Descriptor Section
; LN:5 DIM AboutWindow AS TOOLWINDOW
!AboutWindow rd 500
; LN:7 DIM AboutLine1 AS STATICTEXT
!AboutLine1 rd 500
; LN:8 DIM AboutLine2 AS STATICTEXT
!AboutLine2 rd 500
; LN:9 DIM AboutLine3 AS STATICTEXT
!AboutLine3 rd 500
; LN:10 DIM AboutLine4 AS STATICTEXT
!AboutLine4 rd 500
; LN:11 DIM AboutLine5 AS STATICTEXT
!AboutLine5 rd 500
; LN:34 DIM StatusBar AS STATUSBAR
!StatusBar rd 500
; LN:35 DIM Stat1 AS STATICTEXT
!Stat1 rd 500
; LN:36 DIM Stat2 AS STATICTEXT
!Stat2 rd 500
; LN:37 DIM Stat3 AS STATICTEXT
!Stat3 rd 500
; LN:38 DIM SetupTitle AS STATICTEXT
!SetupTitle rd 500
; LN:39 DIM MoldList AS COMBOBOX
!MoldList rd 500
; LN:40 DIM DataGrid AS RAGRID
!DataGrid rd 500
; LN:48 DIM GetListFromCard AS BUTTON
!GetListFromCard rd 500
; LN:49 DIM SaveListToCard AS BUTTON
!SaveListToCard rd 500
; LN:50 DIM GetSetupFromFile AS BUTTON
!GetSetupFromFile rd 500
; LN:51 DIM SaveSetupToFile AS BUTTON
!SaveSetupToFile rd 500
; LN:52 DIM CopyCardToFile AS BUTTON
!CopyCardToFile rd 500
; LN:53 DIM PutSetupIntoList AS BUTTON
!PutSetupIntoList rd 500
; LN:54 DIM CopyFileToCard AS BUTTON
!CopyFileToCard rd 500
; LN:55 DIM DeleteSetupFromList AS BUTTON
!DeleteSetupFromList rd 500
; LN:56 DIM CardFromFile AS BUTTON
!CardFromFile rd 500
; LN:57 DIM FileFromCard AS BUTTON
!FileFromCard rd 500
; LN:58 DIM GetListFromFile AS BUTTON
!GetListFromFile rd 500
; LN:59 DIM SaveListToFile AS BUTTON
!SaveListToFile rd 500
; LN:60 DIM Clear AS STATICTEXT
!Clear rd 500
; LN:61 DIM Exit AS STATICTEXT
!Exit rd 500
; LN:73 DIM Stat1Label AS STATICTEXT
!Stat1Label rd 500
; LN:74 DIM Stat2Label AS STATICTEXT
!Stat2Label rd 500
; LN:75 DIM Stat3Label AS STATICTEXT
!Stat3Label rd 500
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
mov dword [!OBMain+488],0
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
mov dword [!OBMain+492],!WindowProc
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
;;;invoke CreateSolidBrush,0
;;;mov [!Brush],eax
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

; LN:1 INCLUDE OBDefs.INC
; LN:1 CONST OBRed=$0000ff
OBRed equ 255
; LN:1 CONST OBGreen=$00ff00
OBGreen equ 65280
; LN:1 CONST OBBlue=$ff0000
OBBlue equ 16711680
; LN:1 CONST OBPink=$9090f0
OBPink equ 9474288
; LN:1 CONST OBMint=$90f090
OBMint equ 9498768
; LN:1 CONST OBLtBlue=$f09090
OBLtBlue equ 15765648
; LN:1 CONST OBMagenta=$ff00ff
OBMagenta equ 16711935
; LN:1 CONST OBBlack=$000000
OBBlack equ 0
; LN:1 CONST OBWhite=$ffffff
OBWhite equ 16777215
; LN:1 CONST OBYellow=$00ffff
OBYellow equ 65535
; LN:1 CONST OBLtYellow=$80ffff
OBLtYellow equ 8454143
; LN:1 CONST OBOrange=$0080ff
OBOrange equ 33023
; LN:1 CONST OBViolet=$800080
OBViolet equ 8388736
; LN:1 CONST OBAqua=$ffff00
OBAqua equ 16776960
; LN:1 CONST OBGray=$808080
OBGray equ 8421504
; LN:1 CONST OBLtGray=$c0c0c0
OBLtGray equ 12632256
; LN:1 CONST OBDkGray=$040404
OBDkGray equ 263172
; LN:1 CONST OBDkGreen=$004000
OBDkGreen equ 16384
; LN:1 CONST OBDkRed=$000040
OBDkRed equ 64
; LN:1 CONST OBDkBlue=$400000
OBDkBlue equ 4194304
; LN:1 CONST OBLilac=$ff80ff
OBLilac equ 16744703
; LN:1 CONST OBMinimize=$f020
OBMinimize equ 61472
; LN:1 CONST OBMaximize=$f030
OBMaximize equ 61488
; LN:1 CONST OBClose=$f060
OBClose equ 61536
; LN:3 CONST GridRows=25
GridRows equ 25
; LN:77 MACRO Stat
; LN:83 MACRO LoadIntegerAcc
; LN:88 MACRO LoadLongAcc
; LN:95 OBMain.create
mov edi,!OBMain
mov [!TargetGUIDesc],edi
OBMain_create:
; LN:96 SETPOSITION OBMain,0,0,800,572
mov edi,!OBMain
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,0
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,800
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,572
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
invoke SetWindowPos, dword [OBMain],HWND_TOP, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28],0
; LN:97 OBMain.TEXT="Innomation Systems, Inc.                                      Toyo Setup Manager"
mov edi,!OBMain
mov [!TargetGUIDesc],edi
mov esi,_StrConst1
mov [_TmpVec1],esi
mov [_TmpVec1+4],81
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [OBMain],WM_SETTEXT,0,[_TmpVec1]
; LN:98 DriverName="OmniUSB"
mov edi,[DriverName]
mov esi,_StrConst2
call __SetStrConst
; LN:100 MENU OBMain
; LN:101 MENUBAR MainMenu
invoke CreateMenu
mov [MainMenu],eax
; LN:102 MENUTITLE FileMenu,"File"
invoke CreatePopupMenu
mov [FileMenu],eax
mov esi,_StrConst3
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
invoke AppendMenu,[MainMenu],MF_POPUP,[FileMenu],[_TmpVec1]
; LN:103 MENUITEM MenuGetListFromCard,"Get List From Card"
mov esi,_StrConst4
mov [_TmpVec1],esi
mov [_TmpVec1+4],19
mov [_TmpVec1+8],0
invoke  AppendMenu,[FileMenu],MF_STRING,1000,[_TmpVec1]
; LN:104 MENUITEM MenuSaveListToCard,"Save List To Card"
mov esi,_StrConst5
mov [_TmpVec1],esi
mov [_TmpVec1+4],18
mov [_TmpVec1+8],0
invoke  AppendMenu,[FileMenu],MF_STRING,1001,[_TmpVec1]
; LN:105 MENUSEPARATOR
invoke AppendMenu,[FileMenu],MF_SEPARATOR,0,0
; LN:106 MENUITEM MenuGetListFromFile,"Get List From File"
mov esi,_StrConst6
mov [_TmpVec1],esi
mov [_TmpVec1+4],19
mov [_TmpVec1+8],0
invoke  AppendMenu,[FileMenu],MF_STRING,1002,[_TmpVec1]
; LN:107 MENUITEM MenuSaveListToFile,"Save List To File"
mov esi,_StrConst7
mov [_TmpVec1],esi
mov [_TmpVec1+4],18
mov [_TmpVec1+8],0
invoke  AppendMenu,[FileMenu],MF_STRING,1003,[_TmpVec1]
; LN:108 MENUSEPARATOR
invoke AppendMenu,[FileMenu],MF_SEPARATOR,0,0
; LN:109 MENUITEM MenuGetSetupFromFile,"Get Setup From File"
mov esi,_StrConst8
mov [_TmpVec1],esi
mov [_TmpVec1+4],20
mov [_TmpVec1+8],0
invoke  AppendMenu,[FileMenu],MF_STRING,1004,[_TmpVec1]
; LN:110 MENUITEM MenuSaveSetupToFile,"Save Setup To File"
mov esi,_StrConst9
mov [_TmpVec1],esi
mov [_TmpVec1+4],19
mov [_TmpVec1+8],0
invoke  AppendMenu,[FileMenu],MF_STRING,1005,[_TmpVec1]
; LN:111 MENUSEPARATOR
invoke AppendMenu,[FileMenu],MF_SEPARATOR,0,0
; LN:112 MENUITEM MenuPutSetupIntoList,"Put Setup Into List"
mov esi,_StrConst10
mov [_TmpVec1],esi
mov [_TmpVec1+4],20
mov [_TmpVec1+8],0
invoke  AppendMenu,[FileMenu],MF_STRING,1006,[_TmpVec1]
; LN:113 MENUITEM MenuDeleteSetupFromList,"Delete Setup From List"
mov esi,_StrConst11
mov [_TmpVec1],esi
mov [_TmpVec1+4],23
mov [_TmpVec1+8],0
invoke  AppendMenu,[FileMenu],MF_STRING,1007,[_TmpVec1]
; LN:114 MENUSEPARATOR
invoke AppendMenu,[FileMenu],MF_SEPARATOR,0,0
; LN:115 MENUITEM MenuCopyCardToFile,"Copy Card To File"
mov esi,_StrConst12
mov [_TmpVec1],esi
mov [_TmpVec1+4],18
mov [_TmpVec1+8],0
invoke  AppendMenu,[FileMenu],MF_STRING,1008,[_TmpVec1]
; LN:116 MENUITEM MenuCopyFileToCard,"Copy File To Card"
mov esi,_StrConst13
mov [_TmpVec1],esi
mov [_TmpVec1+4],18
mov [_TmpVec1+8],0
invoke  AppendMenu,[FileMenu],MF_STRING,1009,[_TmpVec1]
; LN:117 MENUSEPARATOR
invoke AppendMenu,[FileMenu],MF_SEPARATOR,0,0
; LN:118 MENUITEM MenuExit,"Exit"
mov esi,_StrConst14
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
invoke  AppendMenu,[FileMenu],MF_STRING,1010,[_TmpVec1]
; LN:119 MENUTITLE UtilityMenu,"Utility"
invoke CreatePopupMenu
mov [UtilityMenu],eax
mov esi,_StrConst15
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
invoke AppendMenu,[MainMenu],MF_POPUP,[UtilityMenu],[_TmpVec1]
; LN:120 MENUITEM MenuClear,"Clear All Settings"
mov esi,_StrConst16
mov [_TmpVec1],esi
mov [_TmpVec1+4],19
mov [_TmpVec1+8],0
invoke  AppendMenu,[UtilityMenu],MF_STRING,1011,[_TmpVec1]
; LN:121 MENUITEM MenuEraseList,"Erase Entire List"
mov esi,_StrConst17
mov [_TmpVec1],esi
mov [_TmpVec1+4],18
mov [_TmpVec1+8],0
invoke  AppendMenu,[UtilityMenu],MF_STRING,1012,[_TmpVec1]
; LN:122 MENUITEM MenuEraseSetup,"Erase Setup From List"
mov esi,_StrConst18
mov [_TmpVec1],esi
mov [_TmpVec1+4],22
mov [_TmpVec1+8],0
invoke  AppendMenu,[UtilityMenu],MF_STRING,1013,[_TmpVec1]
; LN:123 MENUITEM MenuExport,"Export Setup"			 		
mov esi,_StrConst19
mov [_TmpVec1],esi
mov [_TmpVec1+4],13
mov [_TmpVec1+8],0
invoke  AppendMenu,[UtilityMenu],MF_STRING,1014,[_TmpVec1]
; LN:124 MENUTITLE MenuHelp,"Help"
invoke CreatePopupMenu
mov [MenuHelp],eax
mov esi,_StrConst20
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
invoke AppendMenu,[MainMenu],MF_POPUP,[MenuHelp],[_TmpVec1]
; LN:125 MENUITEM MenuAbout,"About"
mov esi,_StrConst21
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke  AppendMenu,[MenuHelp],MF_STRING,1015,[_TmpVec1]
; LN:126 END MENU
invoke SetMenu,[OBMain],[MainMenu]
; LN:128 ' Status Bar
; LN:129 CONSTRUCT StatusBar,0,0,0,0
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
jc _Lbl1
invoke CreateWindowEx,0,!ControlType17,NULL,WS_CHILD+WS_VISIBLE+SBS_SIZEGRIP+SBT_TOOLTIPS, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],101,[!hinstance],!StatusBar
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],116
mov dword [edi+4],101
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl1:
; LN:130 sbParts(1)=0
mov esi,sbParts-(1*4)
mov eax,1
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:131 sbParts(2)=266
mov esi,sbParts-(1*4)
mov eax,2
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,266
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:132 sbParts(3)=532
mov esi,sbParts-(1*4)
mov eax,3
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,532
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:133 sbParts(4)=798
mov esi,sbParts-(1*4)
mov eax,4
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,798
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:134 StatusBar.SETPARTS 4,sbParts
mov edi,!StatusBar
mov [!TargetGUIDesc],edi
mov eax,4
invoke SendMessage, dword [edi+44],SB_SETPARTS,eax,sbParts
; LN:136 ' Stat1
; LN:137 CONSTRUCT Stat1,2,3,262,16 in StatusBar
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,2
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,3
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,262
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,16
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl2
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!StatusBar+44],102,[!hinstance],!StatusBar
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
bts dword [!StatusBar],6
jc _SCLbl1
invoke SetWindowLong, dword [!StatusBar+44],GWL_WNDPROC,!SubClassProc1
mov [!OldProc1],eax
_SCLbl1:
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],102
mov eax,[!StatusBar+44]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl2:
; LN:138 CONSTRUCT Stat1Label,0,485,266,15
mov edi,!Stat1Label
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,485
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,266
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,15
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl3
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],103,[!hinstance],!Stat1Label
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],103
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl3:
; LN:139 Stat1Label.TEXT="Prompt/Result"
mov edi,!Stat1Label
mov [!TargetGUIDesc],edi
mov esi,_StrConst22
mov [_TmpVec1],esi
mov [_TmpVec1+4],14
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:141 ' Stat2
; LN:142 CONSTRUCT Stat2,268,3,262,16 in StatusBar
mov edi,!Stat2
mov [!TargetGUIDesc],edi
mov eax,268
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,3
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,262
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,16
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl4
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!StatusBar+44],104,[!hinstance],!StatusBar
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],104
mov eax,[!StatusBar+44]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl4:
; LN:143 CONSTRUCT Stat2Label,265,485,266,15
mov edi,!Stat2Label
mov [!TargetGUIDesc],edi
mov eax,265
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,485
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,266
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,15
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl5
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],105,[!hinstance],!Stat2Label
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],105
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl5:
; LN:144 Stat2Label.TEXT="List Source"
mov edi,!Stat2Label
mov [!TargetGUIDesc],edi
mov esi,_StrConst23
mov [_TmpVec1],esi
mov [_TmpVec1+4],12
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:146 ' Stat3
; LN:147 CONSTRUCT Stat3,535,3,262,16 in StatusBar
mov edi,!Stat3
mov [!TargetGUIDesc],edi
mov eax,535
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,3
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,262
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,16
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl6
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!StatusBar+44],106,[!hinstance],!StatusBar
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],106
mov eax,[!StatusBar+44]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl6:
; LN:148 CONSTRUCT Stat3Label,533,485,266,15
mov edi,!Stat3Label
mov [!TargetGUIDesc],edi
mov eax,533
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,485
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,266
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,15
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl7
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],107,[!hinstance],!Stat3Label
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
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl7:
; LN:149 Stat3Label.TEXT="Setup Source"
mov edi,!Stat3Label
mov [!TargetGUIDesc],edi
mov esi,_StrConst24
mov [_TmpVec1],esi
mov [_TmpVec1+4],13
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:151 ' GetListFromCard
; LN:152 CONSTRUCT GetListFromCard,10,435,130,20
mov edi,!GetListFromCard
mov [!TargetGUIDesc],edi
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,435
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,130
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl8
invoke CreateWindowEx,0,!ControlType2,NULL,BS_NOTIFY+WS_VISIBLE+WS_CHILD+BS_DEFPUSHBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],108,[!hinstance],!GetListFromCard
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],101
mov dword [edi+4],108
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl8:
; LN:153 GetListFromCard.TEXT="Get List From Card"
mov edi,!GetListFromCard
mov [!TargetGUIDesc],edi
mov esi,_StrConst25
mov [_TmpVec1],esi
mov [_TmpVec1+4],19
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:155 ' SaveListToCard
; LN:156 CONSTRUCT SaveListToCard,10,460,130,20
mov edi,!SaveListToCard
mov [!TargetGUIDesc],edi
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,460
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,130
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl9
invoke CreateWindowEx,0,!ControlType2,NULL,BS_NOTIFY+WS_VISIBLE+WS_CHILD+BS_DEFPUSHBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],109,[!hinstance],!SaveListToCard
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],101
mov dword [edi+4],109
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl9:
; LN:157 SaveListToCard.TEXT="Save List To Card"
mov edi,!SaveListToCard
mov [!TargetGUIDesc],edi
mov esi,_StrConst26
mov [_TmpVec1],esi
mov [_TmpVec1+4],18
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:159 ' GetSetupFromFile
; LN:160 CONSTRUCT GetSetupFromFile,290,435,140,20
mov edi,!GetSetupFromFile
mov [!TargetGUIDesc],edi
mov eax,290
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,435
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,140
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl10
invoke CreateWindowEx,0,!ControlType2,NULL,BS_NOTIFY+WS_VISIBLE+WS_CHILD+BS_DEFPUSHBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],110,[!hinstance],!GetSetupFromFile
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],101
mov dword [edi+4],110
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl10:
; LN:161 GetSetupFromFile.TEXT="Get Setup From File"
mov edi,!GetSetupFromFile
mov [!TargetGUIDesc],edi
mov esi,_StrConst27
mov [_TmpVec1],esi
mov [_TmpVec1+4],20
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:163 ' SaveSetupToFile
; LN:164 CONSTRUCT SaveSetupToFile,290,460,140,20
mov edi,!SaveSetupToFile
mov [!TargetGUIDesc],edi
mov eax,290
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,460
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,140
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl11
invoke CreateWindowEx,0,!ControlType2,NULL,BS_NOTIFY+WS_VISIBLE+WS_CHILD+BS_DEFPUSHBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],111,[!hinstance],!SaveSetupToFile
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],101
mov dword [edi+4],111
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl11:
; LN:165 SaveSetupToFile.TEXT="Save Setup To File"
mov edi,!SaveSetupToFile
mov [!TargetGUIDesc],edi
mov esi,_StrConst28
mov [_TmpVec1],esi
mov [_TmpVec1+4],19
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:167 ' GetListFromFile
; LN:168 CONSTRUCT GetListFromFile,150,435,130,20
mov edi,!GetListFromFile
mov [!TargetGUIDesc],edi
mov eax,150
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,435
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,130
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl12
invoke CreateWindowEx,0,!ControlType2,NULL,BS_NOTIFY+WS_VISIBLE+WS_CHILD+BS_DEFPUSHBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],112,[!hinstance],!GetListFromFile
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],101
mov dword [edi+4],112
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl12:
; LN:169 GetListFromFile.TEXT="Get List From File"
mov edi,!GetListFromFile
mov [!TargetGUIDesc],edi
mov esi,_StrConst29
mov [_TmpVec1],esi
mov [_TmpVec1+4],19
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:171 ' SaveListToFile
; LN:172 CONSTRUCT SaveListToFile,150,460,130,20
mov edi,!SaveListToFile
mov [!TargetGUIDesc],edi
mov eax,150
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,460
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,130
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl13
invoke CreateWindowEx,0,!ControlType2,NULL,BS_NOTIFY+WS_VISIBLE+WS_CHILD+BS_DEFPUSHBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],113,[!hinstance],!SaveListToFile
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],101
mov dword [edi+4],113
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl13:
; LN:173 SaveListToFile.TEXT="Save List To File"
mov edi,!SaveListToFile
mov [!TargetGUIDesc],edi
mov esi,_StrConst30
mov [_TmpVec1],esi
mov [_TmpVec1+4],18
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:175 ' PutSetupIntoList
; LN:176 CONSTRUCT PutSetupIntoList,440,435,160,20
mov edi,!PutSetupIntoList
mov [!TargetGUIDesc],edi
mov eax,440
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,435
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,160
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl14
invoke CreateWindowEx,0,!ControlType2,NULL,BS_NOTIFY+WS_VISIBLE+WS_CHILD+BS_DEFPUSHBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],114,[!hinstance],!PutSetupIntoList
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],101
mov dword [edi+4],114
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl14:
; LN:177 PutSetupIntoList.TEXT="Put Setup Into List"
mov edi,!PutSetupIntoList
mov [!TargetGUIDesc],edi
mov esi,_StrConst31
mov [_TmpVec1],esi
mov [_TmpVec1+4],20
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:179 ' DeleteSetupFromList
; LN:180 CONSTRUCT DeleteSetupFromList,440,460,160,20
mov edi,!DeleteSetupFromList
mov [!TargetGUIDesc],edi
mov eax,440
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,460
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,160
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl15
invoke CreateWindowEx,0,!ControlType2,NULL,BS_NOTIFY+WS_VISIBLE+WS_CHILD+BS_DEFPUSHBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],115,[!hinstance],!DeleteSetupFromList
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],101
mov dword [edi+4],115
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl15:
; LN:181 DeleteSetupFromList.TEXT="Delete Setup From List"
mov edi,!DeleteSetupFromList
mov [!TargetGUIDesc],edi
mov esi,_StrConst32
mov [_TmpVec1],esi
mov [_TmpVec1+4],23
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:183 ' CopyCardToFile
; LN:184 CONSTRUCT CopyCardToFile,610,435,120,20
mov edi,!CopyCardToFile
mov [!TargetGUIDesc],edi
mov eax,610
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,435
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,120
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl16
invoke CreateWindowEx,0,!ControlType2,NULL,BS_NOTIFY+WS_VISIBLE+WS_CHILD+BS_DEFPUSHBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],116,[!hinstance],!CopyCardToFile
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],101
mov dword [edi+4],116
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl16:
; LN:185 CopyCardToFile.TEXT="Copy Card To File"
mov edi,!CopyCardToFile
mov [!TargetGUIDesc],edi
mov esi,_StrConst33
mov [_TmpVec1],esi
mov [_TmpVec1+4],18
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:187 ' CopyFileToCard
; LN:188 CONSTRUCT CopyFileToCard,610,460,120,20
mov edi,!CopyFileToCard
mov [!TargetGUIDesc],edi
mov eax,610
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,460
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,120
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl17
invoke CreateWindowEx,0,!ControlType2,NULL,BS_NOTIFY+WS_VISIBLE+WS_CHILD+BS_DEFPUSHBUTTON, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],117,[!hinstance],!CopyFileToCard
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],101
mov dword [edi+4],117
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl17:
; LN:189 CopyFileToCard.TEXT="Copy File To Card"
mov edi,!CopyFileToCard
mov [!TargetGUIDesc],edi
mov esi,_StrConst34
mov [_TmpVec1],esi
mov [_TmpVec1+4],18
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:191 ' Clear
; LN:192 CONSTRUCT Clear,740,435,40,20
mov edi,!Clear
mov [!TargetGUIDesc],edi
mov eax,740
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,435
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,40
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl18
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],118,[!hinstance],!Clear
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],118
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl18:
; LN:193 Clear.BACKCOLOR=OBYellow
mov edi,!Clear
mov [!TargetGUIDesc],edi
mov eax,65535
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:194 Clear.TEXT="Clear"
mov edi,!Clear
mov [!TargetGUIDesc],edi
mov esi,_StrConst35
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:196 ' Exit
; LN:197 CONSTRUCT Exit,740,460,40,20
mov edi,!Exit
mov [!TargetGUIDesc],edi
mov eax,740
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,460
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,40
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl19
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],119,[!hinstance],!Exit
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],119
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl19:
; LN:198 Exit.BACKCOLOR=OBRed
mov edi,!Exit
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:199 Exit.FORECOLOR=OBYellow
mov edi,!Exit
mov [!TargetGUIDesc],edi
mov eax,65535
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:200 Exit.TEXT="Exit"
mov edi,!Exit
mov [!TargetGUIDesc],edi
mov esi,_StrConst36
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:202 ' MoldList
; LN:203 CONSTRUCT MoldList,10,20,770,422
mov edi,!MoldList
mov [!TargetGUIDesc],edi
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,770
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,422
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl20
invoke CreateWindowEx,0,!ControlType4,NULL,WS_VSCROLL+WS_VISIBLE+WS_CHILD+CBS_DROPDOWN, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],120,[!hinstance],!MoldList
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
mov dword [edi+4],120
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl20:
; LN:204 MoldList.FORECOLOR=$ff0000
mov edi,!MoldList
mov [!TargetGUIDesc],edi
mov eax,16711680
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:206 ' SetupTitle
; LN:207 CONSTRUCT SetupTitle,10,0,770,15
mov edi,!SetupTitle
mov [!TargetGUIDesc],edi
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,0
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,770
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,15
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl21
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],121,[!hinstance],!SetupTitle
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],121
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl21:
; LN:208 SetupTitle.TEXT="Setup Name"
mov edi,!SetupTitle
mov [!TargetGUIDesc],edi
mov esi,_StrConst37
mov [_TmpVec1],esi
mov [_TmpVec1+4],11
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:210 ' DataGrid
; LN:211 CONSTRUCT DataGrid,10,50,770,380
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,50
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,770
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,380
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl22
invoke CreateWindowEx,WS_EX_CLIENTEDGE,!ControlType23,NULL,WS_VISIBLE+WS_CHILD+STYLE_HGRIDLINES+STYLE_VGRIDLINES, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [OBMain],122,[!hinstance],!DataGrid
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],122
mov dword [edi+4],122
mov eax,[OBMain]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl22:
; LN:212 DataGrid.HEADERHEIGHT=20
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax,20
mov edi,[!TargetGUIDesc]
invoke SendMessage,dword [edi+44],GM_SETHDRHEIGHT,0,eax
; LN:213 DataGrid.ADDCOL TEXT,149,"Parameter",CENTER,LEFT,31
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov [gc_ctype],TYPE_EDITTEXT
mov eax,149
mov [gc_colwt],eax
mov esi,_StrConst38
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov eax,[_TmpVec1]
mov [gc_lpszhdrtext],eax
mov [gc_halign],ALIGN_CENTER
mov [gc_calign],ALIGN_LEFT
mov eax,31
mov [gc_ctextmax],eax
mov [gc_lpszformat],0
mov edi,[!TargetGUIDesc]
invoke SendMessage,dword [edi+44],GM_ADDCOL,0,gc_colwt
; LN:214 DataGrid.ADDCOL TEXT,60,"1",CENTER,CENTER,31
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov [gc_ctype],TYPE_EDITTEXT
mov eax,60
mov [gc_colwt],eax
mov esi,_StrConst39
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
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
; LN:215 DataGrid.ADDCOL TEXT,60,"2",CENTER,CENTER,31
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov [gc_ctype],TYPE_EDITTEXT
mov eax,60
mov [gc_colwt],eax
mov esi,_StrConst40
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
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
; LN:216 DataGrid.ADDCOL TEXT,60,"3",CENTER,CENTER,31
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov [gc_ctype],TYPE_EDITTEXT
mov eax,60
mov [gc_colwt],eax
mov esi,_StrConst41
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
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
; LN:217 DataGrid.ADDCOL TEXT,60,"4",CENTER,CENTER,31
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov [gc_ctype],TYPE_EDITTEXT
mov eax,60
mov [gc_colwt],eax
mov esi,_StrConst42
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
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
; LN:218 DataGrid.ADDCOL TEXT,60,"5",CENTER,CENTER,31
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov [gc_ctype],TYPE_EDITTEXT
mov eax,60
mov [gc_colwt],eax
mov esi,_StrConst43
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
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
; LN:219 DataGrid.ADDCOL TEXT,60,"6",CENTER,CENTER,31
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov [gc_ctype],TYPE_EDITTEXT
mov eax,60
mov [gc_colwt],eax
mov esi,_StrConst44
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
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
; LN:220 DataGrid.ADDCOL TEXT,60,"7",CENTER,CENTER,31
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov [gc_ctype],TYPE_EDITTEXT
mov eax,60
mov [gc_colwt],eax
mov esi,_StrConst45
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
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
; LN:221 DataGrid.ADDCOL TEXT,60,"8",CENTER,CENTER,31
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov [gc_ctype],TYPE_EDITTEXT
mov eax,60
mov [gc_colwt],eax
mov esi,_StrConst46
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
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
; LN:222 DataGrid.ADDCOL TEXT,60,"9",CENTER,CENTER,31
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov [gc_ctype],TYPE_EDITTEXT
mov eax,60
mov [gc_colwt],eax
mov esi,_StrConst47
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
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
; LN:223 DataGrid.ADDCOL TEXT,60,"10",CENTER,CENTER,31
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov [gc_ctype],TYPE_EDITTEXT
mov eax,60
mov [gc_colwt],eax
mov esi,_StrConst48
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
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
; LN:225 FOR TempInt=1 TO GridRows
mov [TempInt],1
_Lbl23:
cmp [TempInt],25
jg _Lbl25
; LN:226 DataGrid.ADDROW	
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
invoke SendMessage,dword [edi+44],GM_ADDROW,0,0
; LN:227 NEXT TempInt
_Lbl24:
inc [TempInt]
jmp _Lbl23
_Lbl25:
; LN:229 InitDir="c:\Tsm"
mov edi,[InitDir]
mov esi,_StrConst49
call __SetStrConst
; LN:230 PCCFileFilter="Memory Card File",0,"*.pcc",0,0
; LN:231 TSMFileFilter="Setup File",0,"*.tsm",0,0
; LN:232 CSVFileFilter="Export File",0,"*.csv",0,0
; LN:233 GOSUB ClearAll
call ClearAll
; LN:234 CREATEICON Icon,Graph16
invoke CreateIconFromResource,!Icon+22,744,1,$30000
mov [Icon],eax
; LN:235 OBMain.ICON=Icon
mov edi,!OBMain
mov [!TargetGUIDesc],edi
mov eax, dword [Icon]
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [OBMain],WM_SETICON,ICON_BIG,eax
; LN:236 SETVEC IntegerAcc=ADDR(ByteAcc)
mov esi,ByteAcc
mov eax,esi
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov [IntegerAcc],eax
; LN:237 SETVEC LongAcc=ADDR(ByteAcc)
mov esi,ByteAcc
mov eax,esi
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov [LongAcc],eax
; LN:238 END EVENT
ret
; LN:240 MENU.COMMAND
Menu_command:
; LN:241 SELECT CASE MenuID
mov eax, dword [MenuID]
mov [_SwitchInt],eax
; LN:242 CASE MenuGetListFromCard
mov eax,1000
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl27
; LN:243 GOSUB GetListFromCard_command
call GetListFromCard_command
; LN:244 CASE MenuSaveListToCard
jmp _Lbl26
_Lbl27:
mov eax,1001
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl28
; LN:245 GOSUB SaveListToCard_command
call SaveListToCard_command
; LN:246 CASE MenuGetListFromFile
jmp _Lbl26
_Lbl28:
mov eax,1002
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl29
; LN:247 GOSUB GetListFromFile_command
call GetListFromFile_command
; LN:248 CASE MenuSaveListToFile
jmp _Lbl26
_Lbl29:
mov eax,1003
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl30
; LN:249 GOSUB SaveListToFile_command	
call SaveListToFile_command
; LN:250 CASE MenuGetSetupFromFile
jmp _Lbl26
_Lbl30:
mov eax,1004
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl31
; LN:251 GOSUB GetSetupFromFile_command
call GetSetupFromFile_command
; LN:252 CASE MenuSaveSetupToFile
jmp _Lbl26
_Lbl31:
mov eax,1005
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl32
; LN:253 GOSUB SaveSetupToFile_command
call SaveSetupToFile_command
; LN:254 CASE MenuPutSetupIntoList
jmp _Lbl26
_Lbl32:
mov eax,1006
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl33
; LN:255 GOSUB PutSetupIntoList_command
call PutSetupIntoList_command
; LN:256 CASE MenuDeleteSetupFromList
jmp _Lbl26
_Lbl33:
mov eax,1007
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl34
; LN:257 GOSUB DeleteSetupFromList_command
call DeleteSetupFromList_command
; LN:258 CASE MenuCopyCardToFile
jmp _Lbl26
_Lbl34:
mov eax,1008
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl35
; LN:259 GOSUB CopyCardToFile_command
call CopyCardToFile_command
; LN:260 CASE MenuCopyFileToCard
jmp _Lbl26
_Lbl35:
mov eax,1009
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl36
; LN:261 GOSUB CopyFileToCard_command
call CopyFileToCard_command
; LN:262 CASE MenuExit
jmp _Lbl26
_Lbl36:
mov eax,1010
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl37
; LN:263 END
invoke DeleteObject,[!Brush]
invoke PostMessage,[OBMain],WM_CLOSE,0,0
; LN:264 CASE MenuClear
jmp _Lbl26
_Lbl37:
mov eax,1011
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl38
; LN:265 GOSUB ClearAll
call ClearAll
; LN:266 CASE MenuEraseList
jmp _Lbl26
_Lbl38:
mov eax,1012
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl39
; LN:267 FOR CardBufNdx=1 TO 262144
mov [CardBufNdx],1
_Lbl40:
cmp [CardBufNdx],262144
jg _Lbl42
; LN:268 CardBuf(CardBufNdx)=0
mov esi,CardBuf-(1*1)
mov eax, dword [CardBufNdx]
add esi,eax;
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:269 NEXT CardBufNdx
_Lbl41:
inc [CardBufNdx]
jmp _Lbl40
_Lbl42:
; LN:270 GOSUB PopulateCombo
call PopulateCombo
; LN:271 StatusBar.SETTEXT 1,"List Erased"
mov edi,!StatusBar
mov [!TargetGUIDesc],edi
mov eax,1
mov esi,_StrConst50
mov [_TmpVec1],esi
mov [_TmpVec1+4],12
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],SB_SETTEXT,eax,[_TmpVec1]
; LN:272 CASE MenuEraseSetup
jmp _Lbl26
_Lbl39:
mov eax,1013
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl43
; LN:274 CASE MenuExport
jmp _Lbl26
_Lbl43:
mov eax,1014
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl44
; LN:275 FileName=""
mov [FileName+12],0
; LN:276 SAVEDIALOG FileName,CSVFileFilter,InitDir
mov eax,[FileName]
mov [ofn_lpstrFile],eax
mov eax,[FileName+4]
mov [ofn_nMaxFile],eax
mov eax,CSVFileFilter
mov [ofn_lpstrFilter],eax
mov eax,[InitDir]
mov [ofn_lpstrInitialDir],eax
mov eax,[!hinstance]
mov [ofn_hInstance],eax
mov eax,[OBMain]
mov [ofn_hwndOwner],eax
mov [ofn_Flags],OFN_OVERWRITEPROMPT
invoke GetSaveFileName,ofn_lStructSize
mov [STATUS],eax
; LN:277 IF STATUS<>0 THEN
cmp [STATUS],0
je _Lbl45
; LN:278 IF RIGHT$(FileName,4)<>".CSV" THEN
mov edi,[FileName]
mov [_TmpVec1],edi
mov edi,[FileName+4]
mov [_TmpVec1+4],edi
mov edi,[FileName+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,4
call __RightStr
mov esi,_StrConst51
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
setne bl
or bh,bl
je _Lbl46
; LN:279 FileName=FileName+".CSV"
mov edi,[FileName]
mov [_TmpVec1],edi
mov edi,[FileName+4]
mov [_TmpVec1+4],edi
mov edi,[FileName+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst52
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,FileName
mov esi,_TmpVec1
call __MovStr
; LN:280 ENDIF
_Lbl46:
; LN:281 ELSE
jmp _Lbl47
_Lbl45:
; LN:282 Stat 1,OBRed,OBWhite,"Export Setup To File Canceled"
; LN:282 Stat1.BACKCOLOR=OBRed
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:282 Stat1.FORECOLOR=OBWhite
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:282 Stat1.TEXT="Export Setup To File Canceled"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst53
mov [_TmpVec1],esi
mov [_TmpVec1+4],30
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:283 RETURN
ret
; LN:284 ENDIF
_Lbl47:
; LN:285 ON ERROR GOTO NoCSVFile
mov [_ErrVec],NoCSVFile
; LN:286 DELETE FileName
mov edi,_IOBuffer
mov esi,FileName
call __MovStr
invoke DeleteFile,[_IOBuffer]
mov [STATUS],eax
cmp eax,0
jne _OELbl1
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl1:
NoCSVFile:
; LN:288 CREATE ExportFile,FileName:WRITE
mov edi,_IOBuffer
mov esi,FileName
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,CREATE_NEW,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [ExportFile],eax
cmp eax,-1
jg _OELbl2
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl2:
; LN:289 TempStr=SetupName+",,,,,,,,,,"
mov edi,[SetupName]
mov [_TmpVec1],edi
mov edi,[SetupName+4]
mov [_TmpVec1+4],edi
mov edi,[SetupName+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst54
mov [_TmpVec2],esi
mov [_TmpVec2+4],11
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:290 WRITE ExportFile,TempStr
mov eax, dword [ExportFile]
mov [_IOPthNum],eax
mov esi,[TempStr]
mov [_XferAddr],esi
mov [__ByteCounter],255
call __WriteFile
; LN:291 TempStr="Parameter,1,2,3,4,5,6,7,8,9,10"
mov edi,[TempStr]
mov esi,_StrConst55
call __SetStrConst
; LN:292 WRITE ExportFile,TempStr
mov eax, dword [ExportFile]
mov [_IOPthNum],eax
mov esi,[TempStr]
mov [_XferAddr],esi
mov [__ByteCounter],255
call __WriteFile
; LN:293 FOR TempInt=1 TO GridRows
mov [TempInt],1
_Lbl48:
cmp [TempInt],25
jg _Lbl50
; LN:294 TempStr=""
mov [TempStr+12],0
; LN:295 FOR TempInt2=1 TO 11
mov [TempInt2],1
_Lbl51:
cmp [TempInt2],11
jg _Lbl53
; LN:296 TempStr2=DataGrid.TEXT(TempInt,TempInt2)
mov edi,!DataGrid
mov eax, dword [TempInt]
dec eax
mov ebx,eax
shl ebx,16
mov eax, dword [TempInt2]
dec eax
or ebx,eax
invoke SendMessage, dword [edi+44],GM_CELLCONVERT,ebx,[_IOBuffer]
mov edi,TempStr2
mov esi,_IOBuffer
call __MovStr
; LN:297 TempStr=TempStr+TempStr2
mov edi,[TempStr]
mov [_TmpVec1],edi
mov edi,[TempStr+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr+8]
mov [_TmpVec1+8],edi
mov edi,[TempStr2]
mov [_TmpVec2],edi
mov edi,[TempStr2+4]
mov [_TmpVec2+4],edi
mov edi,[TempStr2+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:298 IF TempInt2<11 THEN
cmp [TempInt2],11
jge _Lbl54
; LN:299 TempStr=TempStr+","
mov edi,[TempStr]
mov [_TmpVec1],edi
mov edi,[TempStr+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst56
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:300 ENDIF
_Lbl54:
; LN:301 Next TempInt2
_Lbl52:
inc [TempInt2]
jmp _Lbl51
_Lbl53:
; LN:302 WRITE ExportFile,TempStr
mov eax, dword [ExportFile]
mov [_IOPthNum],eax
mov esi,[TempStr]
mov [_XferAddr],esi
mov [__ByteCounter],255
call __WriteFile
; LN:303 NEXT TempInt
_Lbl49:
inc [TempInt]
jmp _Lbl48
_Lbl50:
; LN:304 CLOSE ExportFile
mov eax, dword [ExportFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl3
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl3:
; LN:305 Stat 1,OBGreen,OBBlack,"Export Setup To File Successful"
; LN:305 Stat1.BACKCOLOR=OBGreen
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:305 Stat1.FORECOLOR=OBBlack
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:305 Stat1.TEXT="Export Setup To File Successful"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst57
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:306 ON ERROR
mov [_ErrVec],_ErrExit
; LN:307 CASE MenuAbout
jmp _Lbl26
_Lbl44:
mov eax,1015
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl55
; LN:308 GOSUB DoAbout
call DoAbout
; LN:309 END SELECT
jmp _Lbl26
_Lbl55:
_Lbl26:
; LN:310 END EVENT
ret
ReadSRAM:
; LN:313 GOSUB GetDriver
call GetDriver
; LN:314 IF DriverHandle<1 THEN
cmp [DriverHandle],1
jge _Lbl56
; LN:315 Stat 1,OBRed,OBWhite,"No Card Reader Installed"
; LN:315 Stat1.BACKCOLOR=OBRed
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:315 Stat1.FORECOLOR=OBWhite
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:315 Stat1.TEXT="No Card Reader Installed"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst58
mov [_TmpVec1],esi
mov [_TmpVec1+4],25
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:316 RETURN
ret
; LN:317 ENDIF
_Lbl56:
; LN:318 GOSUB ReadData
call ReadData
; LN:319 GOSUB ReleaseDriver
call ReleaseDriver
; LN:320 RETURN
ret
WriteSRAM:
; LN:323 GOSUB GetDriver
call GetDriver
; LN:324 IF DriverHandle<1 THEN
cmp [DriverHandle],1
jge _Lbl57
; LN:325 Stat 1,OBRed,OBWhite,"No Card Reader Installed"
; LN:325 Stat1.BACKCOLOR=OBRed
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:325 Stat1.FORECOLOR=OBWhite
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:325 Stat1.TEXT="No Card Reader Installed"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst59
mov [_TmpVec1],esi
mov [_TmpVec1+4],25
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:326 RETURN
ret
; LN:327 ENDIF
_Lbl57:
; LN:328 GOSUB WriteData
call WriteData
; LN:329 GOSUB ReleaseDriver
call ReleaseDriver
; LN:330 RETURN
ret
GetDriver:
; LN:333 invoke CSMGetDriveHandle, [DriverName], DriverHandle, 1
invoke CSMGetDriveHandle, [DriverName], DriverHandle, 1
; LN:334 RETURN
ret
ReadData:
; LN:337 invoke CSMReadBlock,[DriverHandle],0,2,0,CardBuf,262144
invoke CSMReadBlock,[DriverHandle],0,2,0,CardBuf,262144
; LN:338 mov [ReadCardStat],eax
mov [ReadCardStat],eax
; LN:339 RETURN
ret
WriteData:
; LN:342 invoke CSMWriteBlock,[DriverHandle],0,2,96,0,CardBuf,0,262144
invoke CSMWriteBlock,[DriverHandle],0,2,96,0,CardBuf,0,262144
; LN:343 mov [WriteCardStat],eax
mov [WriteCardStat],eax
; LN:344 RETURN
ret
ReleaseDriver:
; LN:347 invoke CSMReleaseDriveHandle,[DriverHandle]
invoke CSMReleaseDriveHandle,[DriverHandle]
; LN:348 RETURN
ret
; LN:350 MoldList.SELECT
mov edi,!MoldList
mov [!TargetGUIDesc],edi
MoldList_SELECT:
; LN:351 TempInt=MoldList.SELITEM
mov edi,!MoldList
invoke SendMessage, dword [edi+44],CB_GETCURSEL,0,0
inc eax
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov [TempInt],eax
; LN:352 GOSUB ShowGrid
call ShowGrid
; LN:353 IF StoreFlag=FALSE THEN
xor bh,bh
mov al, byte [StoreFlag]
mov dl,0
cmp al,dl
sete bl
or bh,bl
je _Lbl58
; LN:354 SaveSetupToFile.ENABLED=TRUE
mov edi,!SaveSetupToFile
mov [!TargetGUIDesc],edi
bts dword [edi],1
invoke EnableWindow, dword [edi+44],TRUE
; LN:355 ENABLEMENUITEM MainMenu,MenuSaveSetupToFile
mov eax,1005
invoke EnableMenuItem,[MainMenu],eax,MF_ENABLED+MF_BYCOMMAND
; LN:356 CardBufNdx=(TempInt-1)*2048+1
mov eax, dword [TempInt]
mov edx,1
sub eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,2048
imul edx
mov [_Tmp2],eax
mov eax, dword [_Tmp2]
mov edx,1
add eax,edx
mov dword [CardBufNdx],eax
; LN:357 FOR MoldBufNdx=1 TO 2048
mov [MoldBufNdx],1
_Lbl59:
cmp [MoldBufNdx],2048
jg _Lbl61
; LN:358 MoldBuf(MoldBufNdx)=CardBuf(CardBufNdx)
mov esi,MoldBuf-(1*1)
mov eax, dword [MoldBufNdx]
add esi,eax;
mov [_TmpVec1],esi
mov esi,CardBuf-(1*1)
mov eax, dword [CardBufNdx]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:359 INCR CardBufNdx
inc [CardBufNdx]
; LN:360 NEXT MoldBufNdx
_Lbl60:
inc [MoldBufNdx]
jmp _Lbl59
_Lbl61:
; LN:361 GOSUB MoldBufToGrid
call MoldBufToGrid
; LN:362 Stat 1,OBGreen,OBBlack,"Setup Has Been Selected From List"
; LN:362 Stat1.BACKCOLOR=OBGreen
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:362 Stat1.FORECOLOR=OBBlack
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:362 Stat1.TEXT="Setup Has Been Selected From List"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst60
mov [_TmpVec1],esi
mov [_TmpVec1+4],34
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:363 SetupLoaded=TRUE
mov byte [SetupLoaded],1
; LN:364 SetupLoadedFromList=TRUE
mov byte [SetupLoadedFromList],1
; LN:365 SetupName=MoldList.SELTEXT
mov edi,!MoldList
push edi
invoke SendMessage, dword [edi+44],CB_GETCURSEL,0,0
pop edi
invoke SendMessage, dword [edi+44],CB_GETLBTEXT,eax,[_IOBuffer]
mov edi,SetupName
mov esi,_IOBuffer
call __MovStr
; LN:366 Stat 3,OBGreen,OBBlack,"List"
; LN:366 Stat3.BACKCOLOR=OBGreen
mov edi,!Stat3
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:366 Stat3.FORECOLOR=OBBlack
mov edi,!Stat3
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:366 Stat3.TEXT="List"
mov edi,!Stat3
mov [!TargetGUIDesc],edi
mov esi,_StrConst61
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:367 ELSE
jmp _Lbl62
_Lbl58:
; LN:368 ' Transfer MoldBuf To Selected Position on List
; LN:369 StoreFlag=FALSE
mov byte [StoreFlag],0
; LN:370 MoldList.FORECOLOR=$ff0000
mov edi,!MoldList
mov [!TargetGUIDesc],edi
mov eax,16711680
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:371 MoldList.TEXT=TextSafe
mov edi,!MoldList
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[TextSafe]
; LN:372 CardBufNdx=(TempInt-1)*2048+1
mov eax, dword [TempInt]
mov edx,1
sub eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,2048
imul edx
mov [_Tmp2],eax
mov eax, dword [_Tmp2]
mov edx,1
add eax,edx
mov dword [CardBufNdx],eax
; LN:373 IF DeleteFlag=TRUE THEN
xor bh,bh
mov al, byte [DeleteFlag]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl63
; LN:374 FOR MoldBufNdx=1 TO 2048
mov [MoldBufNdx],1
_Lbl64:
cmp [MoldBufNdx],2048
jg _Lbl66
; LN:375 CardBuf(CardBufNdx)=$aa
mov esi,CardBuf-(1*1)
mov eax, dword [CardBufNdx]
add esi,eax;
mov [_TmpVec1],esi
mov eax,170
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:376 INCR CardBufNdx	
inc [CardBufNdx]
; LN:377 NEXT MoldBufNdx
_Lbl65:
inc [MoldBufNdx]
jmp _Lbl64
_Lbl66:
; LN:378 DeleteSetupFromList.TEXT="Delete Setup From List"
mov edi,!DeleteSetupFromList
mov [!TargetGUIDesc],edi
mov esi,_StrConst62
mov [_TmpVec1],esi
mov [_TmpVec1+4],23
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:379 Stat 1,OBGreen,OBBlack,"Setup Has Been Deleted From List"		
; LN:379 Stat1.BACKCOLOR=OBGreen
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:379 Stat1.FORECOLOR=OBBlack
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:379 Stat1.TEXT="Setup Has Been Deleted From List"		
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst63
mov [_TmpVec1],esi
mov [_TmpVec1+4],33
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:380 ELSE
jmp _Lbl67
_Lbl63:
; LN:381 FOR MoldBufNdx=1 TO 2048
mov [MoldBufNdx],1
_Lbl68:
cmp [MoldBufNdx],2048
jg _Lbl70
; LN:382 CardBuf(CardBufNdx)=MoldBuf(MoldBufNdx)
mov esi,CardBuf-(1*1)
mov eax, dword [CardBufNdx]
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax, dword [MoldBufNdx]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:383 INCR CardBufNdx	
inc [CardBufNdx]
; LN:384 NEXT MoldBufNdx
_Lbl69:
inc [MoldBufNdx]
jmp _Lbl68
_Lbl70:
; LN:385 PutSetupIntoList.TEXT="Put Setup Into List"
mov edi,!PutSetupIntoList
mov [!TargetGUIDesc],edi
mov esi,_StrConst64
mov [_TmpVec1],esi
mov [_TmpVec1+4],20
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:386 Stat 1,OBGreen,OBBlack,"Setup Has Been Added To List"
; LN:386 Stat1.BACKCOLOR=OBGreen
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:386 Stat1.FORECOLOR=OBBlack
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:386 Stat1.TEXT="Setup Has Been Added To List"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst65
mov [_TmpVec1],esi
mov [_TmpVec1+4],29
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:387 ENDIF
_Lbl67:
; LN:388 GOSUB PopulateCombo
call PopulateCombo
; LN:389 ENDIF
_Lbl62:
; LN:390 END EVENT
ret
; LN:392 GetListFromCard.command
mov edi,!GetListFromCard
mov [!TargetGUIDesc],edi
GetListFromCard_command:
; LN:393 GOSUB ReadSRAM
call ReadSRAM
; LN:394 IF DriverHandle<1 THEN
cmp [DriverHandle],1
jge _Lbl71
; LN:395 RETURN
ret
; LN:396 ENDIF
_Lbl71:
; LN:397 IF ReadCardStat<>0 THEN
cmp [ReadCardStat],0
je _Lbl72
; LN:398 Stat 1,OBRed,OBWhite,"Get List From Card Failed"
; LN:398 Stat1.BACKCOLOR=OBRed
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:398 Stat1.FORECOLOR=OBWhite
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:398 Stat1.TEXT="Get List From Card Failed"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst66
mov [_TmpVec1],esi
mov [_TmpVec1+4],26
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:399 ELSE
jmp _Lbl73
_Lbl72:
; LN:400 GOSUB PopulateCombo
call PopulateCombo
; LN:401 Stat 1,OBGreen,OBBlack,"Get List From Card Successful"
; LN:401 Stat1.BACKCOLOR=OBGreen
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:401 Stat1.FORECOLOR=OBBlack
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:401 Stat1.TEXT="Get List From Card Successful"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst67
mov [_TmpVec1],esi
mov [_TmpVec1+4],30
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:402 Stat 2,OBGreen,OBBlack,"Card"
; LN:402 Stat2.BACKCOLOR=OBGreen
mov edi,!Stat2
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:402 Stat2.FORECOLOR=OBBlack
mov edi,!Stat2
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:402 Stat2.TEXT="Card"
mov edi,!Stat2
mov [!TargetGUIDesc],edi
mov esi,_StrConst68
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:403 IF SetupLoadedFromList=TRUE THEN
xor bh,bh
mov al, byte [SetupLoadedFromList]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl74
; LN:404 Stat 3,OBGreen,OBBlack,"Previous List"
; LN:404 Stat3.BACKCOLOR=OBGreen
mov edi,!Stat3
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:404 Stat3.FORECOLOR=OBBlack
mov edi,!Stat3
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:404 Stat3.TEXT="Previous List"
mov edi,!Stat3
mov [!TargetGUIDesc],edi
mov esi,_StrConst69
mov [_TmpVec1],esi
mov [_TmpVec1+4],14
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:405 ENDIF
_Lbl74:
; LN:406 ListLoaded=TRUE
mov byte [ListLoaded],1
; LN:407 ENDIF
_Lbl73:
; LN:408 END EVENT
ret
; LN:410 SaveListToCard.command
mov edi,!SaveListToCard
mov [!TargetGUIDesc],edi
SaveListToCard_command:
; LN:411 WARNINGBOX "Save List To Card","Overwrite Card?",MB_YESNO
mov esi,_StrConst70
mov [_TmpVec1],esi
mov [_TmpVec1+4],18
mov [_TmpVec1+8],0
mov esi,_StrConst71
mov [_TmpVec2],esi
mov [_TmpVec2+4],16
mov [_TmpVec2+8],0
invoke MessageBox,[OBMain],[_TmpVec2],[_TmpVec1],MB_YESNO+MB_ICONWARNING
mov [STATUS],eax
; LN:412 SELECT CASE STATUS
mov eax, dword [STATUS]
mov [_SwitchInt],eax
; LN:413 CASE IDYES
mov eax,6
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl76
; LN:414 ' Fall Thru
; LN:415 CASE ELSE
jmp _Lbl75
_Lbl76:
; LN:416 Stat 1,OBRed,OBWhite,"Save List To Card Canceled"
; LN:416 Stat1.BACKCOLOR=OBRed
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:416 Stat1.FORECOLOR=OBWhite
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:416 Stat1.TEXT="Save List To Card Canceled"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst72
mov [_TmpVec1],esi
mov [_TmpVec1+4],27
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:417 RETURN
ret
; LN:418 END SELECT	
jmp _Lbl75
_Lbl77:
_Lbl75:
; LN:419 GOSUB WriteSRAM
call WriteSRAM
; LN:420 IF DriverHandle<1 THEN
cmp [DriverHandle],1
jge _Lbl78
; LN:421 RETURN
ret
; LN:422 ENDIF
_Lbl78:
; LN:423 IF WriteCardStat<>0 THEN
cmp [WriteCardStat],0
je _Lbl79
; LN:424 Stat 1,OBRed,OBWhite,"Save List To Card Failed"
; LN:424 Stat1.BACKCOLOR=OBRed
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:424 Stat1.FORECOLOR=OBWhite
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:424 Stat1.TEXT="Save List To Card Failed"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst73
mov [_TmpVec1],esi
mov [_TmpVec1+4],25
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:425 ELSE
jmp _Lbl80
_Lbl79:
; LN:426 Stat 1,OBGreen,OBBlack,"Save List To Card Successful"
; LN:426 Stat1.BACKCOLOR=OBGreen
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:426 Stat1.FORECOLOR=OBBlack
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:426 Stat1.TEXT="Save List To Card Successful"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst74
mov [_TmpVec1],esi
mov [_TmpVec1+4],29
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:427 GOSUB PopulateCombo
call PopulateCombo
; LN:428 ENDIF
_Lbl80:
; LN:429 END EVENT
ret
; LN:431 GetSetupFromFile.command
mov edi,!GetSetupFromFile
mov [!TargetGUIDesc],edi
GetSetupFromFile_command:
; LN:432 FileName=""
mov [FileName+12],0
; LN:433 OPENDIALOG FileName,TSMFileFilter,InitDir
mov eax,[FileName]
mov [ofn_lpstrFile],eax
mov eax,[FileName+4]
mov [ofn_nMaxFile],eax
mov eax,TSMFileFilter
mov [ofn_lpstrFilter],eax
mov eax,[InitDir]
mov [ofn_lpstrInitialDir],eax
mov eax,[!hinstance]
mov [ofn_hInstance],eax
mov eax,[OBMain]
mov [ofn_hwndOwner],eax
mov [ofn_Flags],OFN_FILEMUSTEXIST+OFN_PATHMUSTEXIST+OFN_HIDEREADONLY
invoke GetOpenFileName,ofn_lStructSize
mov [STATUS],eax
; LN:434 IF STATUS<>0 THEN
cmp [STATUS],0
je _Lbl81
; LN:435 OPEN MoldFile,FileName:READ
mov edi,_IOBuffer
mov esi,FileName
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [MoldFile],eax
cmp eax,-1
jg _OELbl4
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl4:
; LN:436 GET MoldFile,MoldBuf
mov eax, dword [MoldFile]
mov [_IOPthNum],eax
mov esi,MoldBuf
mov [_XferAddr],esi
mov [XferCount],2048
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl5
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl5:
; LN:437 CLOSE MoldFile
mov eax, dword [MoldFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl6
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl6:
; LN:438 Stat 1,OBGreen,OBBlack,"Get Setup From File Successful"
; LN:438 Stat1.BACKCOLOR=OBGreen
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:438 Stat1.FORECOLOR=OBBlack
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:438 Stat1.TEXT="Get Setup From File Successful"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst75
mov [_TmpVec1],esi
mov [_TmpVec1+4],31
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:439 Stat 3,OBGreen,OBBlack,FileName
; LN:439 Stat3.BACKCOLOR=OBGreen
mov edi,!Stat3
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:439 Stat3.FORECOLOR=OBBlack
mov edi,!Stat3
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:439 Stat3.TEXT=FileName
mov edi,!Stat3
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[FileName]
; LN:440 GOSUB ShowGrid
call ShowGrid
; LN:441 GOSUB MoldBufToGrid
call MoldBufToGrid
; LN:442 SETVEC MachName=ADDR(MoldBuf(1987))	
mov esi,MoldBuf-(1*1)
mov eax,1987
add esi,eax;
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
mov eax,esi
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov [MachName],eax
mov [MachName+4],12
mov [MachName+8],0
; LN:443 SETVEC MoldName=ADDR(MoldBuf(1999))
mov esi,MoldBuf-(1*1)
mov eax,1999
add esi,eax;
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
mov eax,esi
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov [MoldName],eax
mov [MoldName+4],30
mov [MoldName+8],0
; LN:444 ByteAcc(1)=MoldBuf(1978)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,1978
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:445 ByteAcc(2)=MoldBuf(1977)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,1977
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:446 ByteAcc(3)=MoldBuf(1976)
mov esi,ByteAcc-(1*1)
mov eax,3
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,1976
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:447 ByteAcc(4)=MoldBuf(1975)
mov esi,ByteAcc-(1*1)
mov eax,4
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,1975
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:448 TempStr=STR(LongAcc)
mov edi,[LongAcc]
mov eax, dword [edi]
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
; LN:449 MoldNumber=""
mov [MoldNumber+12],0
; LN:450 TempMachName=MachName
mov edi,TempMachName
mov esi,MachName
call __MovStr
; LN:451 TempMoldName=MoldName
mov edi,TempMoldName
mov esi,MoldName
call __MovStr
; LN:452 FOR TempInt=1 TO 8-LEN(TempStr)
mov [TempInt],1
mov esi,TempStr
call __StrLen
mov [_Tmp1],eax
mov eax,8
mov edx, dword [_Tmp1]
sub eax,edx
mov [_LopVec1],eax
_Lbl82:
mov eax,[TempInt]
cmp eax,[_LopVec1]
jg _Lbl84
; LN:453 MoldNumber=MoldNumber+"0"
mov edi,[MoldNumber]
mov [_TmpVec1],edi
mov edi,[MoldNumber+4]
mov [_TmpVec1+4],edi
mov edi,[MoldNumber+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst76
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,MoldNumber
mov esi,_TmpVec1
call __MovStr
; LN:454 NEXT TempInt
_Lbl83:
inc [TempInt]
jmp _Lbl82
_Lbl84:
; LN:455 MoldNumber=MoldNumber+TempStr
mov edi,[MoldNumber]
mov [_TmpVec1],edi
mov edi,[MoldNumber+4]
mov [_TmpVec1+4],edi
mov edi,[MoldNumber+8]
mov [_TmpVec1+8],edi
mov edi,[TempStr]
mov [_TmpVec2],edi
mov edi,[TempStr+4]
mov [_TmpVec2+4],edi
mov edi,[TempStr+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,MoldNumber
mov esi,_TmpVec1
call __MovStr
; LN:456 IF BITTST(CardBuf(626),4)=TRUE OR CardBuf(MoldIndex-626)=$aa OR LEN(MoldName)=0 THEN
mov esi,CardBuf-(1*1)
mov eax,626
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,4
bt eax,edx
setc cl; Set result
mov byte [_Tmp1],cl
xor bh,bh
mov al, byte [_Tmp1]
mov dl,1
cmp al,dl
sete bl
or bh,bl
mov eax, dword [MoldIndex]
mov edx,626
sub eax,edx
mov [_Tmp1],eax
mov esi,CardBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,170
cmp eax,edx
sete bl
or bh,bl
mov esi,MoldName
call __StrLen
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
je _Lbl85
; LN:457 TempMachName="Vacant"
mov edi,[TempMachName]
mov esi,_StrConst77
call __SetStrConst
; LN:458 TempMoldName=""
mov [TempMoldName+12],0
; LN:459 MoldNumber="00000000"
mov esi,_StrConst78
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,MoldNumber
mov esi,_TmpVec1
call __MovStr
; LN:460 ENDIF
_Lbl85:
; LN:461 SetupName=MoldNumber+" "+TempMachName+" "+TempMoldName
mov edi,[MoldNumber]
mov [_TmpVec1],edi
mov edi,[MoldNumber+4]
mov [_TmpVec1+4],edi
mov edi,[MoldNumber+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst79
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov edi,[TempMachName]
mov [_TmpVec3],edi
mov edi,[TempMachName+4]
mov [_TmpVec3+4],edi
mov edi,[TempMachName+8]
mov [_TmpVec3+8],edi
mov esi,_StrConst80
mov [_TmpVec4],esi
mov [_TmpVec4+4],2
mov [_TmpVec4+8],0
mov edi,[TempMoldName]
mov [_TmpVec5],edi
mov edi,[TempMoldName+4]
mov [_TmpVec5+4],edi
mov edi,[TempMoldName+8]
mov [_TmpVec5+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec5
mov [_TmpVec4+8],esi
mov edi,SetupName
mov esi,_TmpVec1
call __MovStr
; LN:462 MoldList.TEXT=SetupName
mov edi,!MoldList
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[SetupName]
; LN:463 SaveSetupToFile.ENABLED=TRUE
mov edi,!SaveSetupToFile
mov [!TargetGUIDesc],edi
bts dword [edi],1
invoke EnableWindow, dword [edi+44],TRUE
; LN:464 ENABLEMENUITEM MainMenu,MenuSaveSetupToFile
mov eax,1005
invoke EnableMenuItem,[MainMenu],eax,MF_ENABLED+MF_BYCOMMAND
; LN:465 SetupLoadedFromList=FALSE
mov byte [SetupLoadedFromList],0
; LN:466 SetupLoaded=TRUE
mov byte [SetupLoaded],1
; LN:467 ELSE
jmp _Lbl86
_Lbl81:
; LN:468 Stat 1,OBRed,OBWhite,"Get Setup From File Canceled"	
; LN:468 Stat1.BACKCOLOR=OBRed
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:468 Stat1.FORECOLOR=OBWhite
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:468 Stat1.TEXT="Get Setup From File Canceled"	
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst81
mov [_TmpVec1],esi
mov [_TmpVec1+4],29
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:469 ENDIF
_Lbl86:
; LN:470 END EVENT
ret
; LN:472 SaveSetupToFile.command
mov edi,!SaveSetupToFile
mov [!TargetGUIDesc],edi
SaveSetupToFile_command:
; LN:473 FileName=""
mov [FileName+12],0
; LN:474 SAVEDIALOG FileName,TSMFileFilter,InitDir
mov eax,[FileName]
mov [ofn_lpstrFile],eax
mov eax,[FileName+4]
mov [ofn_nMaxFile],eax
mov eax,TSMFileFilter
mov [ofn_lpstrFilter],eax
mov eax,[InitDir]
mov [ofn_lpstrInitialDir],eax
mov eax,[!hinstance]
mov [ofn_hInstance],eax
mov eax,[OBMain]
mov [ofn_hwndOwner],eax
mov [ofn_Flags],OFN_OVERWRITEPROMPT
invoke GetSaveFileName,ofn_lStructSize
mov [STATUS],eax
; LN:475 IF STATUS<>0 THEN
cmp [STATUS],0
je _Lbl87
; LN:476 IF RIGHT$(FileName,4)<>".TSM" THEN
mov edi,[FileName]
mov [_TmpVec1],edi
mov edi,[FileName+4]
mov [_TmpVec1+4],edi
mov edi,[FileName+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,4
call __RightStr
mov esi,_StrConst82
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
setne bl
or bh,bl
je _Lbl88
; LN:477 FileName=FileName+".TSM"
mov edi,[FileName]
mov [_TmpVec1],edi
mov edi,[FileName+4]
mov [_TmpVec1+4],edi
mov edi,[FileName+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst83
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,FileName
mov esi,_TmpVec1
call __MovStr
; LN:478 ENDIF
_Lbl88:
; LN:479 ON ERROR GOTO NoTSMFile
mov [_ErrVec],NoTSMFile
; LN:480 DELETE FileName
mov edi,_IOBuffer
mov esi,FileName
call __MovStr
invoke DeleteFile,[_IOBuffer]
mov [STATUS],eax
cmp eax,0
jne _OELbl7
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl7:
NoTSMFile:
; LN:482 CREATE MoldFile,FileName:WRITE
mov edi,_IOBuffer
mov esi,FileName
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,CREATE_NEW,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [MoldFile],eax
cmp eax,-1
jg _OELbl8
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl8:
; LN:483 PUT MoldFile,MoldBuf
mov eax, dword [MoldFile]
mov [_IOPthNum],eax
mov esi,MoldBuf
mov [_XferAddr],esi
mov [XferCount],2048
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl9
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl9:
; LN:484 CLOSE MoldFile
mov eax, dword [MoldFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl10
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl10:
; LN:485 Stat 1,OBGreen,OBBlack,"Save Setup To File Successful"
; LN:485 Stat1.BACKCOLOR=OBGreen
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:485 Stat1.FORECOLOR=OBBlack
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:485 Stat1.TEXT="Save Setup To File Successful"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst84
mov [_TmpVec1],esi
mov [_TmpVec1+4],30
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:486 ON ERROR
mov [_ErrVec],_ErrExit
; LN:487 ELSE
jmp _Lbl89
_Lbl87:
; LN:488 Stat 1,OBRed,OBWhite,"Save Setup To File Canceled"
; LN:488 Stat1.BACKCOLOR=OBRed
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:488 Stat1.FORECOLOR=OBWhite
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:488 Stat1.TEXT="Save Setup To File Canceled"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst85
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:489 ENDIF
_Lbl89:
; LN:490 END EVENT
ret
; LN:492 GetListFromFile.command
mov edi,!GetListFromFile
mov [!TargetGUIDesc],edi
GetListFromFile_command:
; LN:493 FileName=""
mov [FileName+12],0
; LN:494 OPENDIALOG FileName,PCCFileFilter,InitDir
mov eax,[FileName]
mov [ofn_lpstrFile],eax
mov eax,[FileName+4]
mov [ofn_nMaxFile],eax
mov eax,PCCFileFilter
mov [ofn_lpstrFilter],eax
mov eax,[InitDir]
mov [ofn_lpstrInitialDir],eax
mov eax,[!hinstance]
mov [ofn_hInstance],eax
mov eax,[OBMain]
mov [ofn_hwndOwner],eax
mov [ofn_Flags],OFN_FILEMUSTEXIST+OFN_PATHMUSTEXIST+OFN_HIDEREADONLY
invoke GetOpenFileName,ofn_lStructSize
mov [STATUS],eax
; LN:495 IF STATUS<>0 THEN
cmp [STATUS],0
je _Lbl90
; LN:496 OPEN CardFile,FileName:READ
mov edi,_IOBuffer
mov esi,FileName
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [CardFile],eax
cmp eax,-1
jg _OELbl11
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl11:
; LN:497 GET CardFile,CardBuf
mov eax, dword [CardFile]
mov [_IOPthNum],eax
mov esi,CardBuf
mov [_XferAddr],esi
mov [XferCount],262144
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl12
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl12:
; LN:498 CLOSE CardFile
mov eax, dword [CardFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl13
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl13:
; LN:499 Stat 1,OBGreen,OBBlack,"Get List From File Successful"
; LN:499 Stat1.BACKCOLOR=OBGreen
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:499 Stat1.FORECOLOR=OBBlack
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:499 Stat1.TEXT="Get List From File Successful"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst86
mov [_TmpVec1],esi
mov [_TmpVec1+4],30
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:500 Stat 2,OBGreen,OBBlack,FileName
; LN:500 Stat2.BACKCOLOR=OBGreen
mov edi,!Stat2
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:500 Stat2.FORECOLOR=OBBlack
mov edi,!Stat2
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:500 Stat2.TEXT=FileName
mov edi,!Stat2
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[FileName]
; LN:501 GOSUB PopulateCombo
call PopulateCombo
; LN:502 IF SetupLoadedFromList=TRUE THEN
xor bh,bh
mov al, byte [SetupLoadedFromList]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl91
; LN:503 Stat 3,OBGreen,OBBlack,"Previous List"
; LN:503 Stat3.BACKCOLOR=OBGreen
mov edi,!Stat3
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:503 Stat3.FORECOLOR=OBBlack
mov edi,!Stat3
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:503 Stat3.TEXT="Previous List"
mov edi,!Stat3
mov [!TargetGUIDesc],edi
mov esi,_StrConst87
mov [_TmpVec1],esi
mov [_TmpVec1+4],14
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:504 ENDIF
_Lbl91:
; LN:505 ListLoaded=TRUE
mov byte [ListLoaded],1
; LN:506 ELSE
jmp _Lbl92
_Lbl90:
; LN:507 Stat 1,OBRed,OBWhite,"Get List From File Canceled"	
; LN:507 Stat1.BACKCOLOR=OBRed
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:507 Stat1.FORECOLOR=OBWhite
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:507 Stat1.TEXT="Get List From File Canceled"	
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst88
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:508 ENDIF
_Lbl92:
; LN:509 END EVENT
ret
; LN:511 SaveListToFile.command
mov edi,!SaveListToFile
mov [!TargetGUIDesc],edi
SaveListToFile_command:
; LN:512 FileName=""
mov [FileName+12],0
; LN:513 SAVEDIALOG FileName,PCCFileFilter,InitDir
mov eax,[FileName]
mov [ofn_lpstrFile],eax
mov eax,[FileName+4]
mov [ofn_nMaxFile],eax
mov eax,PCCFileFilter
mov [ofn_lpstrFilter],eax
mov eax,[InitDir]
mov [ofn_lpstrInitialDir],eax
mov eax,[!hinstance]
mov [ofn_hInstance],eax
mov eax,[OBMain]
mov [ofn_hwndOwner],eax
mov [ofn_Flags],OFN_OVERWRITEPROMPT
invoke GetSaveFileName,ofn_lStructSize
mov [STATUS],eax
; LN:514 IF STATUS<>0 THEN
cmp [STATUS],0
je _Lbl93
; LN:515 IF RIGHT$(FileName,4)<>".PCC" THEN
mov edi,[FileName]
mov [_TmpVec1],edi
mov edi,[FileName+4]
mov [_TmpVec1+4],edi
mov edi,[FileName+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,4
call __RightStr
mov esi,_StrConst89
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
setne bl
or bh,bl
je _Lbl94
; LN:516 FileName=FileName+".PCC"
mov edi,[FileName]
mov [_TmpVec1],edi
mov edi,[FileName+4]
mov [_TmpVec1+4],edi
mov edi,[FileName+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst90
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,FileName
mov esi,_TmpVec1
call __MovStr
; LN:517 ENDIF
_Lbl94:
; LN:518 ON ERROR GOTO NoPCCFile
mov [_ErrVec],NoPCCFile
; LN:519 DELETE FileName
mov edi,_IOBuffer
mov esi,FileName
call __MovStr
invoke DeleteFile,[_IOBuffer]
mov [STATUS],eax
cmp eax,0
jne _OELbl14
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl14:
NoPCCFile:
; LN:521 CREATE CardFile,FileName:WRITE
mov edi,_IOBuffer
mov esi,FileName
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,CREATE_NEW,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [CardFile],eax
cmp eax,-1
jg _OELbl15
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl15:
; LN:522 PUT CardFile,CardBuf
mov eax, dword [CardFile]
mov [_IOPthNum],eax
mov esi,CardBuf
mov [_XferAddr],esi
mov [XferCount],262144
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl16
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl16:
; LN:523 CLOSE CardFile
mov eax, dword [CardFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl17
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl17:
; LN:524 ON ERROR
mov [_ErrVec],_ErrExit
; LN:525 Stat 1,OBGreen,OBBlack,"Save List To File Successful"
; LN:525 Stat1.BACKCOLOR=OBGreen
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:525 Stat1.FORECOLOR=OBBlack
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:525 Stat1.TEXT="Save List To File Successful"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst91
mov [_TmpVec1],esi
mov [_TmpVec1+4],29
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:526 ELSE
jmp _Lbl95
_Lbl93:
; LN:527 Stat 1,OBRed,OBWhite,"Save List To File Canceled"
; LN:527 Stat1.BACKCOLOR=OBRed
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:527 Stat1.FORECOLOR=OBWhite
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:527 Stat1.TEXT="Save List To File Canceled"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst92
mov [_TmpVec1],esi
mov [_TmpVec1+4],27
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:528 ENDIF
_Lbl95:
; LN:529 END EVENT
ret
; LN:531 PutSetupIntoList.command
mov edi,!PutSetupIntoList
mov [!TargetGUIDesc],edi
PutSetupIntoList_command:
; LN:532 IF StoreFlag=FALSE THEN
xor bh,bh
mov al, byte [StoreFlag]
mov dl,0
cmp al,dl
sete bl
or bh,bl
je _Lbl96
; LN:533 TextSafe=MoldList.TEXT
mov edi,!MoldList
invoke SendMessage, dword [edi+44],WM_GETTEXT,_BufSize,[_IOBuffer]
mov edi,TextSafe
mov esi,_IOBuffer
call __MovStr
; LN:534 StoreFlag=TRUE
mov byte [StoreFlag],1
; LN:535 DeleteFlag=FALSE
mov byte [DeleteFlag],0
; LN:536 PutSetupIntoList.TEXT="Cancel"
mov edi,!PutSetupIntoList
mov [!TargetGUIDesc],edi
mov esi,_StrConst93
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:537 MoldList.FORECOLOR=$0000ff
mov edi,!MoldList
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:538 Stat 1,OBWhite,OBRed,"Select Destination In List"
; LN:538 Stat1.BACKCOLOR=OBWhite
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:538 Stat1.FORECOLOR=OBRed
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:538 Stat1.TEXT="Select Destination In List"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst94
mov [_TmpVec1],esi
mov [_TmpVec1+4],27
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:539 ELSE
jmp _Lbl97
_Lbl96:
; LN:540 StoreFlag=FALSE
mov byte [StoreFlag],0
; LN:541 MoldList.FORECOLOR=$ff0000
mov edi,!MoldList
mov [!TargetGUIDesc],edi
mov eax,16711680
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:542 MoldList.TEXT=TextSafe
mov edi,!MoldList
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[TextSafe]
; LN:543 PutSetupIntoList.TEXT="Put Setup Into List"
mov edi,!PutSetupIntoList
mov [!TargetGUIDesc],edi
mov esi,_StrConst95
mov [_TmpVec1],esi
mov [_TmpVec1+4],20
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:544 Stat 1,OBRed,OBWhite,"Put Setup Into List Canceled"	
; LN:544 Stat1.BACKCOLOR=OBRed
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:544 Stat1.FORECOLOR=OBWhite
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:544 Stat1.TEXT="Put Setup Into List Canceled"	
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst96
mov [_TmpVec1],esi
mov [_TmpVec1+4],29
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:545 ENDIF
_Lbl97:
; LN:546 END EVENT
ret
; LN:548 DeleteSetupFromList.command
mov edi,!DeleteSetupFromList
mov [!TargetGUIDesc],edi
DeleteSetupFromList_command:
; LN:549 IF StoreFlag=FALSE THEN
xor bh,bh
mov al, byte [StoreFlag]
mov dl,0
cmp al,dl
sete bl
or bh,bl
je _Lbl98
; LN:550 TextSafe=MoldList.TEXT
mov edi,!MoldList
invoke SendMessage, dword [edi+44],WM_GETTEXT,_BufSize,[_IOBuffer]
mov edi,TextSafe
mov esi,_IOBuffer
call __MovStr
; LN:551 StoreFlag=TRUE
mov byte [StoreFlag],1
; LN:552 DeleteFlag=TRUE
mov byte [DeleteFlag],1
; LN:553 DeleteSetupFromList.TEXT="Cancel"
mov edi,!DeleteSetupFromList
mov [!TargetGUIDesc],edi
mov esi,_StrConst97
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:554 MoldList.FORECOLOR=$0000ff
mov edi,!MoldList
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:555 Stat 1,OBWhite,OBRed,"Select Setup To Delete In List"
; LN:555 Stat1.BACKCOLOR=OBWhite
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:555 Stat1.FORECOLOR=OBRed
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:555 Stat1.TEXT="Select Setup To Delete In List"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst98
mov [_TmpVec1],esi
mov [_TmpVec1+4],31
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:556 ELSE
jmp _Lbl99
_Lbl98:
; LN:557 StoreFlag=FALSE
mov byte [StoreFlag],0
; LN:558 DeleteFlag=FALSE
mov byte [DeleteFlag],0
; LN:559 MoldList.FORECOLOR=$ff0000
mov edi,!MoldList
mov [!TargetGUIDesc],edi
mov eax,16711680
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:560 MoldList.TEXT=TextSafe
mov edi,!MoldList
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[TextSafe]
; LN:561 DeleteSetupFromList.TEXT="Delete Setup In List"
mov edi,!DeleteSetupFromList
mov [!TargetGUIDesc],edi
mov esi,_StrConst99
mov [_TmpVec1],esi
mov [_TmpVec1+4],21
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:562 Stat 1,OBRed,OBWhite,"Delete Setup In List Canceled"
; LN:562 Stat1.BACKCOLOR=OBRed
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:562 Stat1.FORECOLOR=OBWhite
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:562 Stat1.TEXT="Delete Setup In List Canceled"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst100
mov [_TmpVec1],esi
mov [_TmpVec1+4],30
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:563 ENDIF
_Lbl99:
; LN:564 END EVENT
ret
; LN:566 CopyCardToFile.command
mov edi,!CopyCardToFile
mov [!TargetGUIDesc],edi
CopyCardToFile_command:
; LN:567 GOSUB ReadSRAM
call ReadSRAM
; LN:568 IF DriverHandle<1 THEN
cmp [DriverHandle],1
jge _Lbl100
; LN:569 RETURN
ret
; LN:570 ENDIF
_Lbl100:
; LN:571 IF ReadCardStat=0 THEN
cmp [ReadCardStat],0
jne _Lbl101
; LN:572 SAVEDIALOG FileName,PCCFileFilter,InitDir
mov eax,[FileName]
mov [ofn_lpstrFile],eax
mov eax,[FileName+4]
mov [ofn_nMaxFile],eax
mov eax,PCCFileFilter
mov [ofn_lpstrFilter],eax
mov eax,[InitDir]
mov [ofn_lpstrInitialDir],eax
mov eax,[!hinstance]
mov [ofn_hInstance],eax
mov eax,[OBMain]
mov [ofn_hwndOwner],eax
mov [ofn_Flags],OFN_OVERWRITEPROMPT
invoke GetSaveFileName,ofn_lStructSize
mov [STATUS],eax
; LN:573 IF STATUS<>0 THEN
cmp [STATUS],0
je _Lbl102
; LN:574 IF RIGHT$(FileName,4)<>".PCC" THEN
mov edi,[FileName]
mov [_TmpVec1],edi
mov edi,[FileName+4]
mov [_TmpVec1+4],edi
mov edi,[FileName+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,4
call __RightStr
mov esi,_StrConst101
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
setne bl
or bh,bl
je _Lbl103
; LN:575 FileName=FileName+".PCC"
mov edi,[FileName]
mov [_TmpVec1],edi
mov edi,[FileName+4]
mov [_TmpVec1+4],edi
mov edi,[FileName+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst102
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,FileName
mov esi,_TmpVec1
call __MovStr
; LN:576 ENDIF
_Lbl103:
; LN:577 ON ERROR GOTO NoCopyPCCFile
mov [_ErrVec],NoCopyPCCFile
; LN:578 DELETE FileName
mov edi,_IOBuffer
mov esi,FileName
call __MovStr
invoke DeleteFile,[_IOBuffer]
mov [STATUS],eax
cmp eax,0
jne _OELbl18
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl18:
NoCopyPCCFile:
; LN:580 CREATE CardFile,FileName:WRITE
mov edi,_IOBuffer
mov esi,FileName
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,CREATE_NEW,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [CardFile],eax
cmp eax,-1
jg _OELbl19
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl19:
; LN:581 PUT CardFile,CardBuf
mov eax, dword [CardFile]
mov [_IOPthNum],eax
mov esi,CardBuf
mov [_XferAddr],esi
mov [XferCount],262144
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl20
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl20:
; LN:582 CLOSE CardFile
mov eax, dword [CardFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl21
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl21:
; LN:583 ON ERROR
mov [_ErrVec],_ErrExit
; LN:584 Stat 1,OBGreen,OBBlack,"Copy Card To File Successful"
; LN:584 Stat1.BACKCOLOR=OBGreen
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:584 Stat1.FORECOLOR=OBBlack
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:584 Stat1.TEXT="Copy Card To File Successful"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst103
mov [_TmpVec1],esi
mov [_TmpVec1+4],29
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:585 ELSE
jmp _Lbl104
_Lbl102:
; LN:586 Stat 1,OBRed,OBWhite,"Copy Card To File Canceled"
; LN:586 Stat1.BACKCOLOR=OBRed
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:586 Stat1.FORECOLOR=OBWhite
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:586 Stat1.TEXT="Copy Card To File Canceled"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst104
mov [_TmpVec1],esi
mov [_TmpVec1+4],27
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:587 ENDIF
_Lbl104:
; LN:588 ELSE
jmp _Lbl105
_Lbl101:
; LN:589 Stat 1,OBRed,OBWhite,"Copy Card To File Failed"
; LN:589 Stat1.BACKCOLOR=OBRed
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:589 Stat1.FORECOLOR=OBWhite
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:589 Stat1.TEXT="Copy Card To File Failed"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst105
mov [_TmpVec1],esi
mov [_TmpVec1+4],25
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:590 ENDIF
_Lbl105:
; LN:591 END EVENT
ret
; LN:593 CopyFileToCard.command
mov edi,!CopyFileToCard
mov [!TargetGUIDesc],edi
CopyFileToCard_command:
; LN:594 FileName=""
mov [FileName+12],0
; LN:595 OPENDIALOG FileName,PCCFileFilter,InitDir
mov eax,[FileName]
mov [ofn_lpstrFile],eax
mov eax,[FileName+4]
mov [ofn_nMaxFile],eax
mov eax,PCCFileFilter
mov [ofn_lpstrFilter],eax
mov eax,[InitDir]
mov [ofn_lpstrInitialDir],eax
mov eax,[!hinstance]
mov [ofn_hInstance],eax
mov eax,[OBMain]
mov [ofn_hwndOwner],eax
mov [ofn_Flags],OFN_FILEMUSTEXIST+OFN_PATHMUSTEXIST+OFN_HIDEREADONLY
invoke GetOpenFileName,ofn_lStructSize
mov [STATUS],eax
; LN:596 IF STATUS<>0 THEN
cmp [STATUS],0
je _Lbl106
; LN:597 OPEN CardFile,FileName:READ
mov edi,_IOBuffer
mov esi,FileName
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [CardFile],eax
cmp eax,-1
jg _OELbl22
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl22:
; LN:598 GET CardFile,CardBuf
mov eax, dword [CardFile]
mov [_IOPthNum],eax
mov esi,CardBuf
mov [_XferAddr],esi
mov [XferCount],262144
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl23
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl23:
; LN:599 CLOSE CardFile
mov eax, dword [CardFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl24
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl24:
; LN:600 Stat 1,OBGreen,OBBlack,"Get List From File Successful"
; LN:600 Stat1.BACKCOLOR=OBGreen
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:600 Stat1.FORECOLOR=OBBlack
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:600 Stat1.TEXT="Get List From File Successful"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst106
mov [_TmpVec1],esi
mov [_TmpVec1+4],30
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:601 GOSUB PopulateCombo
call PopulateCombo
; LN:602 ELSE
jmp _Lbl107
_Lbl106:
; LN:603 Stat 1,OBRed,OBWhite,"Copy File To Card Failed"
; LN:603 Stat1.BACKCOLOR=OBRed
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:603 Stat1.FORECOLOR=OBWhite
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:603 Stat1.TEXT="Copy File To Card Failed"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst107
mov [_TmpVec1],esi
mov [_TmpVec1+4],25
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:604 RETURN
ret
; LN:605 ENDIF
_Lbl107:
; LN:606 WARNINGBOX "Save List To Card","Overwrite Card?",MB_YESNO
mov esi,_StrConst108
mov [_TmpVec1],esi
mov [_TmpVec1+4],18
mov [_TmpVec1+8],0
mov esi,_StrConst109
mov [_TmpVec2],esi
mov [_TmpVec2+4],16
mov [_TmpVec2+8],0
invoke MessageBox,[OBMain],[_TmpVec2],[_TmpVec1],MB_YESNO+MB_ICONWARNING
mov [STATUS],eax
; LN:607 SELECT CASE STATUS
mov eax, dword [STATUS]
mov [_SwitchInt],eax
; LN:608 CASE IDYES
mov eax,6
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl109
; LN:609 ' Fall Thru
; LN:610 CASE ELSE
jmp _Lbl108
_Lbl109:
; LN:611 Stat 1,OBRed,OBWhite,"Save List To Card Canceled"
; LN:611 Stat1.BACKCOLOR=OBRed
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:611 Stat1.FORECOLOR=OBWhite
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:611 Stat1.TEXT="Save List To Card Canceled"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst110
mov [_TmpVec1],esi
mov [_TmpVec1+4],27
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:612 RETURN
ret
; LN:613 END SELECT
jmp _Lbl108
_Lbl110:
_Lbl108:
; LN:614 GOSUB WriteSRAM
call WriteSRAM
; LN:615 IF DriverHandle<1 THEN
cmp [DriverHandle],1
jge _Lbl111
; LN:616 RETURN
ret
; LN:617 ENDIF
_Lbl111:
; LN:618 IF WriteCardStat=0 THEN
cmp [WriteCardStat],0
jne _Lbl112
; LN:619 Stat 1,OBGreen,OBBlack,"Copy File To Card Successful"
; LN:619 Stat1.BACKCOLOR=OBGreen
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,65280
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:619 Stat1.FORECOLOR=OBBlack
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:619 Stat1.TEXT="Copy File To Card Successful"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst111
mov [_TmpVec1],esi
mov [_TmpVec1+4],29
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:620 ELSE
jmp _Lbl113
_Lbl112:
; LN:621 Stat 1,OBRed,OBWhite,"Copy File To Card Failed"
; LN:621 Stat1.BACKCOLOR=OBRed
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:621 Stat1.FORECOLOR=OBWhite
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:621 Stat1.TEXT="Copy File To Card Failed"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst112
mov [_TmpVec1],esi
mov [_TmpVec1+4],25
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:622 ENDIF
_Lbl113:
; LN:623 END EVENT
ret
MoldBufToGrid:
; LN:627 DataGridRow=0
mov dword [DataGridRow],0
; LN:629 INCR DataGridRow
inc [DataGridRow]
; LN:630 DataGrid.TEXT(DataGridRow,1)="Inj Speed"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst113
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:631 LoadIntegerAcc 1
; LN:631 ByteAcc(2)=MoldBuf(1)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:631 ByteAcc(1)=MoldBuf(1+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,1
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:632 TempStr=STR(IntegerAcc/100)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,100
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:633 DataGrid.TEXT(DataGridRow,2)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,2
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:634 LoadIntegerAcc 3
; LN:634 ByteAcc(2)=MoldBuf(3)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,3
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:634 ByteAcc(1)=MoldBuf(3+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,3
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:635 TempStr=STR(IntegerAcc/100)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,100
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:636 DataGrid.TEXT(DataGridRow,3)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,3
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:637 LoadIntegerAcc 5
; LN:637 ByteAcc(2)=MoldBuf(5)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,5
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:637 ByteAcc(1)=MoldBuf(5+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,5
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:638 TempStr=STR(IntegerAcc/100)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,100
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:639 DataGrid.TEXT(DataGridRow,4)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,4
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:641 INCR DataGridRow
inc [DataGridRow]
; LN:642 DataGrid.TEXT(DataGridRow,1)="Inj Press"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst114
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:643 LoadIntegerAcc 865
; LN:643 ByteAcc(2)=MoldBuf(865)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,865
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:643 ByteAcc(1)=MoldBuf(865+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,865
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:644 GOSUB GetInjPress
call GetInjPress
; LN:645 DataGrid.TEXT(DataGridRow,2)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,2
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:646 LoadIntegerAcc 867
; LN:646 ByteAcc(2)=MoldBuf(867)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,867
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:646 ByteAcc(1)=MoldBuf(867+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,867
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:647 GOSUB GetInjPress
call GetInjPress
; LN:648 DataGrid.TEXT(DataGridRow,3)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,3
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:649 LoadIntegerAcc 869
; LN:649 ByteAcc(2)=MoldBuf(869)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,869
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:649 ByteAcc(1)=MoldBuf(869+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,869
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:650 GOSUB GetInjPress
call GetInjPress
; LN:651 DataGrid.TEXT(DataGridRow,4)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,4
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:652 LoadIntegerAcc 871
; LN:652 ByteAcc(2)=MoldBuf(871)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,871
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:652 ByteAcc(1)=MoldBuf(871+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,871
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:653 GOSUB GetInjPress
call GetInjPress
; LN:654 DataGrid.TEXT(DataGridRow,5)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,5
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:655 LoadIntegerAcc 873
; LN:655 ByteAcc(2)=MoldBuf(873)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,873
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:655 ByteAcc(1)=MoldBuf(873+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,873
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:656 GOSUB GetInjPress
call GetInjPress
; LN:657 DataGrid.TEXT(DataGridRow,6)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,6
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:658 LoadIntegerAcc 875
; LN:658 ByteAcc(2)=MoldBuf(875)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,875
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:658 ByteAcc(1)=MoldBuf(875+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,875
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:659 GOSUB GetInjPress
call GetInjPress
; LN:660 DataGrid.TEXT(DataGridRow,7)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,7
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:661 LoadIntegerAcc 877
; LN:661 ByteAcc(2)=MoldBuf(877)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,877
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:661 ByteAcc(1)=MoldBuf(877+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,877
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:662 GOSUB GetInjPress
call GetInjPress
; LN:663 DataGrid.TEXT(DataGridRow,8)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,8
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:664 LoadIntegerAcc 879
; LN:664 ByteAcc(2)=MoldBuf(879)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,879
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:664 ByteAcc(1)=MoldBuf(879+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,879
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:665 GOSUB GetInjPress
call GetInjPress
; LN:666 DataGrid.TEXT(DataGridRow,9)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,9
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:667 LoadIntegerAcc 881
; LN:667 ByteAcc(2)=MoldBuf(881)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,881
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:667 ByteAcc(1)=MoldBuf(881+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,881
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:668 GOSUB GetInjPress
call GetInjPress
; LN:669 DataGrid.TEXT(DataGridRow,10)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,10
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:670 LoadIntegerAcc 883
; LN:670 ByteAcc(2)=MoldBuf(883)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,883
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:670 ByteAcc(1)=MoldBuf(883+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,883
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:671 GOSUB GetInjPress
call GetInjPress
; LN:672 DataGrid.TEXT(DataGridRow,11)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,11
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:673 INCR DataGridRow
inc [DataGridRow]
; LN:675 DataGrid.TEXT(DataGridRow,1)="Inj Hold Press"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst115
mov [_TmpVec1],esi
mov [_TmpVec1+4],15
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:676 LoadIntegerAcc 25
; LN:676 ByteAcc(2)=MoldBuf(25)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,25
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:676 ByteAcc(1)=MoldBuf(25+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,25
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:677 TempStr=STR(IntegerAcc*1000/3515)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,1000
imul edx
mov edx,3515
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:678 DataGrid.TEXT(DataGridRow,3)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,3
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:679 LoadIntegerAcc 27
; LN:679 ByteAcc(2)=MoldBuf(27)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,27
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:679 ByteAcc(1)=MoldBuf(27+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,27
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:680 TempStr=STR(IntegerAcc*1000/3515)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,1000
imul edx
mov edx,3515
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:681 DataGrid.TEXT(DataGridRow,4)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,4
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:683 INCR DataGridRow
inc [DataGridRow]
; LN:684 DataGrid.TEXT(DataGridRow,1)="Inj Position"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst116
mov [_TmpVec1],esi
mov [_TmpVec1+4],13
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:685 LoadLongAcc 53
; LN:685 ByteAcc(1)=MoldBuf(53+3)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,53
mov edx,3
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:685 ByteAcc(2)=MoldBuf(53+2)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,53
mov edx,2
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:685 ByteAcc(3)=MoldBuf(53+1)
mov esi,ByteAcc-(1*1)
mov eax,3
add esi,eax;
mov [_TmpVec1],esi
mov eax,53
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:685 ByteAcc(4)=MoldBuf(53)
mov esi,ByteAcc-(1*1)
mov eax,4
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,53
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:686 GOSUB GetInjPos
call GetInjPos
; LN:687 DataGrid.TEXT(DataGridRow,2)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,2
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:688 LoadLongAcc 57
; LN:688 ByteAcc(1)=MoldBuf(57+3)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,57
mov edx,3
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:688 ByteAcc(2)=MoldBuf(57+2)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,57
mov edx,2
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:688 ByteAcc(3)=MoldBuf(57+1)
mov esi,ByteAcc-(1*1)
mov eax,3
add esi,eax;
mov [_TmpVec1],esi
mov eax,57
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:688 ByteAcc(4)=MoldBuf(57)
mov esi,ByteAcc-(1*1)
mov eax,4
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,57
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:689 GOSUB GetInjPos
call GetInjPos
; LN:690 DataGrid.TEXT(DataGridRow,3)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,3
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:691 LoadLongAcc 61
; LN:691 ByteAcc(1)=MoldBuf(61+3)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,61
mov edx,3
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:691 ByteAcc(2)=MoldBuf(61+2)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,61
mov edx,2
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:691 ByteAcc(3)=MoldBuf(61+1)
mov esi,ByteAcc-(1*1)
mov eax,3
add esi,eax;
mov [_TmpVec1],esi
mov eax,61
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:691 ByteAcc(4)=MoldBuf(61)
mov esi,ByteAcc-(1*1)
mov eax,4
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,61
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:692 GOSUB GetInjPos
call GetInjPos
; LN:693 DataGrid.TEXT(DataGridRow,4)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,4
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:694 LoadLongAcc 65
; LN:694 ByteAcc(1)=MoldBuf(65+3)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,65
mov edx,3
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:694 ByteAcc(2)=MoldBuf(65+2)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,65
mov edx,2
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:694 ByteAcc(3)=MoldBuf(65+1)
mov esi,ByteAcc-(1*1)
mov eax,3
add esi,eax;
mov [_TmpVec1],esi
mov eax,65
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:694 ByteAcc(4)=MoldBuf(65)
mov esi,ByteAcc-(1*1)
mov eax,4
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,65
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:695 GOSUB GetInjPos
call GetInjPos
; LN:696 DataGrid.TEXT(DataGridRow,5)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,5
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:697 LoadLongAcc 69
; LN:697 ByteAcc(1)=MoldBuf(69+3)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,69
mov edx,3
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:697 ByteAcc(2)=MoldBuf(69+2)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,69
mov edx,2
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:697 ByteAcc(3)=MoldBuf(69+1)
mov esi,ByteAcc-(1*1)
mov eax,3
add esi,eax;
mov [_TmpVec1],esi
mov eax,69
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:697 ByteAcc(4)=MoldBuf(69)
mov esi,ByteAcc-(1*1)
mov eax,4
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,69
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:698 GOSUB GetInjPos
call GetInjPos
; LN:699 DataGrid.TEXT(DataGridRow,6)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,6
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:700 LoadLongAcc 73
; LN:700 ByteAcc(1)=MoldBuf(73+3)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,73
mov edx,3
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:700 ByteAcc(2)=MoldBuf(73+2)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,73
mov edx,2
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:700 ByteAcc(3)=MoldBuf(73+1)
mov esi,ByteAcc-(1*1)
mov eax,3
add esi,eax;
mov [_TmpVec1],esi
mov eax,73
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:700 ByteAcc(4)=MoldBuf(73)
mov esi,ByteAcc-(1*1)
mov eax,4
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,73
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:701 GOSUB GetInjPos
call GetInjPos
; LN:702 DataGrid.TEXT(DataGridRow,7)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,7
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:703 LoadLongAcc 77
; LN:703 ByteAcc(1)=MoldBuf(77+3)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,77
mov edx,3
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:703 ByteAcc(2)=MoldBuf(77+2)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,77
mov edx,2
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:703 ByteAcc(3)=MoldBuf(77+1)
mov esi,ByteAcc-(1*1)
mov eax,3
add esi,eax;
mov [_TmpVec1],esi
mov eax,77
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:703 ByteAcc(4)=MoldBuf(77)
mov esi,ByteAcc-(1*1)
mov eax,4
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,77
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:704 GOSUB GetInjPos
call GetInjPos
; LN:705 DataGrid.TEXT(DataGridRow,8)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,8
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:706 LoadLongAcc 81
; LN:706 ByteAcc(1)=MoldBuf(81+3)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,81
mov edx,3
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:706 ByteAcc(2)=MoldBuf(81+2)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,81
mov edx,2
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:706 ByteAcc(3)=MoldBuf(81+1)
mov esi,ByteAcc-(1*1)
mov eax,3
add esi,eax;
mov [_TmpVec1],esi
mov eax,81
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:706 ByteAcc(4)=MoldBuf(81)
mov esi,ByteAcc-(1*1)
mov eax,4
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,81
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:707 GOSUB GetInjPos
call GetInjPos
; LN:708 DataGrid.TEXT(DataGridRow,9)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,9
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:709 LoadLongAcc 85
; LN:709 ByteAcc(1)=MoldBuf(85+3)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,85
mov edx,3
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:709 ByteAcc(2)=MoldBuf(85+2)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,85
mov edx,2
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:709 ByteAcc(3)=MoldBuf(85+1)
mov esi,ByteAcc-(1*1)
mov eax,3
add esi,eax;
mov [_TmpVec1],esi
mov eax,85
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:709 ByteAcc(4)=MoldBuf(85)
mov esi,ByteAcc-(1*1)
mov eax,4
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,85
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:710 GOSUB GetInjPos
call GetInjPos
; LN:711 DataGrid.TEXT(DataGridRow,10)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,10
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:712 LoadLongAcc 89
; LN:712 ByteAcc(1)=MoldBuf(89+3)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,89
mov edx,3
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:712 ByteAcc(2)=MoldBuf(89+2)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,89
mov edx,2
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:712 ByteAcc(3)=MoldBuf(89+1)
mov esi,ByteAcc-(1*1)
mov eax,3
add esi,eax;
mov [_TmpVec1],esi
mov eax,89
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:712 ByteAcc(4)=MoldBuf(89)
mov esi,ByteAcc-(1*1)
mov eax,4
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,89
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:713 GOSUB GetInjPos
call GetInjPos
; LN:714 DataGrid.TEXT(DataGridRow,11)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,11
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:716 INCR DataGridRow
inc [DataGridRow]
; LN:717 DataGrid.TEXT(DataGridRow,1)="Inj Time"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst117
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:718 LoadIntegerAcc 97
; LN:718 ByteAcc(2)=MoldBuf(97)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,97
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:718 ByteAcc(1)=MoldBuf(97+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,97
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:719 TempStr=STR(IntegerAcc/100)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,100
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:720 DataGrid.TEXT(DataGridRow,2)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,2
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:721 LoadIntegerAcc 99
; LN:721 ByteAcc(2)=MoldBuf(99)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,99
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:721 ByteAcc(1)=MoldBuf(99+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,99
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:722 TempStr=STR(IntegerAcc/100)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,100
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:723 DataGrid.TEXT(DataGridRow,3)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,3
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:724 LoadIntegerAcc 101
; LN:724 ByteAcc(2)=MoldBuf(101)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,101
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:724 ByteAcc(1)=MoldBuf(101+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,101
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:725 TempStr=STR(IntegerAcc/100)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,100
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:726 DataGrid.TEXT(DataGridRow,4)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,4
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:727 LoadIntegerAcc 103
; LN:727 ByteAcc(2)=MoldBuf(103)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,103
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:727 ByteAcc(1)=MoldBuf(103+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,103
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:728 TempStr=STR(IntegerAcc/100)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,100
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:729 DataGrid.TEXT(DataGridRow,5)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,5
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:730 LoadIntegerAcc 105
; LN:730 ByteAcc(2)=MoldBuf(105)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,105
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:730 ByteAcc(1)=MoldBuf(105+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,105
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:731 TempStr=STR(IntegerAcc/100)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,100
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:732 DataGrid.TEXT(DataGridRow,6)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,6
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:733 LoadIntegerAcc 107
; LN:733 ByteAcc(2)=MoldBuf(107)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,107
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:733 ByteAcc(1)=MoldBuf(107+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,107
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:734 TempStr=STR(IntegerAcc/100)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,100
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:735 DataGrid.TEXT(DataGridRow,7)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,7
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:736 LoadIntegerAcc 109
; LN:736 ByteAcc(2)=MoldBuf(109)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,109
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:736 ByteAcc(1)=MoldBuf(109+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,109
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:737 TempStr=STR(IntegerAcc/100)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,100
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:738 DataGrid.TEXT(DataGridRow,8)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,8
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:739 LoadIntegerAcc 111
; LN:739 ByteAcc(2)=MoldBuf(111)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,111
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:739 ByteAcc(1)=MoldBuf(111+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,111
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:740 TempStr=STR(IntegerAcc/100)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,100
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:741 DataGrid.TEXT(DataGridRow,9)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,9
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:742 LoadIntegerAcc 113
; LN:742 ByteAcc(2)=MoldBuf(113)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,113
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:742 ByteAcc(1)=MoldBuf(113+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,113
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:743 TempStr=STR(IntegerAcc/100)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,100
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:744 DataGrid.TEXT(DataGridRow,10)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,10
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:745 LoadIntegerAcc 115
; LN:745 ByteAcc(2)=MoldBuf(115)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,115
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:745 ByteAcc(1)=MoldBuf(115+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,115
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:746 TempStr=STR(IntegerAcc/100)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,100
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:747 DataGrid.TEXT(DataGridRow,11)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,11
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:749 INCR DataGridRow
inc [DataGridRow]
; LN:750 DataGrid.TEXT(DataGridRow,1)="Charge Speed"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst118
mov [_TmpVec1],esi
mov [_TmpVec1+4],13
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:751 LoadIntegerAcc 139
; LN:751 ByteAcc(2)=MoldBuf(139)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,139
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:751 ByteAcc(1)=MoldBuf(139+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,139
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:752 TempStr=STR(IntegerAcc*1000/23474)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,1000
imul edx
mov edx,23474
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:753 DataGrid.TEXT(DataGridRow,2)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,2
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:754 LoadIntegerAcc 141
; LN:754 ByteAcc(2)=MoldBuf(141)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,141
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:754 ByteAcc(1)=MoldBuf(141+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,141
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:755 TempStr=STR(IntegerAcc*1000/23474)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,1000
imul edx
mov edx,23474
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:756 DataGrid.TEXT(DataGridRow,3)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,3
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:757 LoadIntegerAcc 143
; LN:757 ByteAcc(2)=MoldBuf(143)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,143
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:757 ByteAcc(1)=MoldBuf(143+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,143
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:758 TempStr=STR(IntegerAcc*1000/23474)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,1000
imul edx
mov edx,23474
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:759 DataGrid.TEXT(DataGridRow,4)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,4
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:760 LoadIntegerAcc 145
; LN:760 ByteAcc(2)=MoldBuf(145)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,145
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:760 ByteAcc(1)=MoldBuf(145+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,145
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:761 TempStr=STR(IntegerAcc*1000/23474)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,1000
imul edx
mov edx,23474
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:762 DataGrid.TEXT(DataGridRow,5)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,5
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:763 LoadIntegerAcc 147
; LN:763 ByteAcc(2)=MoldBuf(147)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,147
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:763 ByteAcc(1)=MoldBuf(147+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,147
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:764 TempStr=STR(IntegerAcc*1000/23474)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,1000
imul edx
mov edx,23474
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:765 DataGrid.TEXT(DataGridRow,6)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,6
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:766 LoadIntegerAcc 149
; LN:766 ByteAcc(2)=MoldBuf(149)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,149
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:766 ByteAcc(1)=MoldBuf(149+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,149
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:767 TempStr=STR(IntegerAcc*1000/23474)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,1000
imul edx
mov edx,23474
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:768 DataGrid.TEXT(DataGridRow,7)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,7
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:770 INCR DataGridRow
inc [DataGridRow]
; LN:771 DataGrid.TEXT(DataGridRow,1)="Back Press"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst119
mov [_TmpVec1],esi
mov [_TmpVec1+4],11
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:772 LoadIntegerAcc 153
; LN:772 ByteAcc(2)=MoldBuf(153)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,153
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:772 ByteAcc(1)=MoldBuf(153+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,153
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:773 TempStr=STR(IntegerAcc*1000/3515)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,1000
imul edx
mov edx,3515
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:774 DataGrid.TEXT(DataGridRow,2)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,2
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:775 LoadIntegerAcc 155
; LN:775 ByteAcc(2)=MoldBuf(155)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,155
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:775 ByteAcc(1)=MoldBuf(155+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,155
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:776 TempStr=STR(IntegerAcc*1000/3515)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,1000
imul edx
mov edx,3515
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:777 DataGrid.TEXT(DataGridRow,3)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,3
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:778 LoadIntegerAcc 157
; LN:778 ByteAcc(2)=MoldBuf(157)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,157
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:778 ByteAcc(1)=MoldBuf(157+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,157
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:779 TempStr=STR(IntegerAcc*1000/3515)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,1000
imul edx
mov edx,3515
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:780 DataGrid.TEXT(DataGridRow,4)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,4
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:781 LoadIntegerAcc 159
; LN:781 ByteAcc(2)=MoldBuf(159)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,159
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:781 ByteAcc(1)=MoldBuf(159+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,159
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:782 TempStr=STR(IntegerAcc*1000/3515)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,1000
imul edx
mov edx,3515
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:783 DataGrid.TEXT(DataGridRow,5)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,5
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:784 LoadIntegerAcc 161
; LN:784 ByteAcc(2)=MoldBuf(161)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,161
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:784 ByteAcc(1)=MoldBuf(161+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,161
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:785 TempStr=STR(IntegerAcc*1000/3515)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,1000
imul edx
mov edx,3515
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:786 DataGrid.TEXT(DataGridRow,6)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,6
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:787 LoadIntegerAcc 163
; LN:787 ByteAcc(2)=MoldBuf(163)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,163
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:787 ByteAcc(1)=MoldBuf(163+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,163
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:788 TempStr=STR(IntegerAcc*1000/3515)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,1000
imul edx
mov edx,3515
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:789 DataGrid.TEXT(DataGridRow,7)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,7
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:791 INCR DataGridRow
inc [DataGridRow]
; LN:792 DataGrid.TEXT(DataGridRow,1)="Charge Position"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst120
mov [_TmpVec1],esi
mov [_TmpVec1+4],16
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:793 LoadIntegerAcc 167
; LN:793 ByteAcc(2)=MoldBuf(167)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,167
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:793 ByteAcc(1)=MoldBuf(167+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,167
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:794 GOSUB GetChargePos
call GetChargePos
; LN:795 DataGrid.TEXT(DataGridRow,2)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,2
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:796 LoadIntegerAcc 171
; LN:796 ByteAcc(2)=MoldBuf(171)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,171
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:796 ByteAcc(1)=MoldBuf(171+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,171
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:797 GOSUB GetChargePos
call GetChargePos
; LN:798 DataGrid.TEXT(DataGridRow,3)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,3
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:799 LoadIntegerAcc 175
; LN:799 ByteAcc(2)=MoldBuf(175)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,175
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:799 ByteAcc(1)=MoldBuf(175+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,175
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:800 GOSUB GetChargePos
call GetChargePos
; LN:801 DataGrid.TEXT(DataGridRow,4)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,4
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:802 LoadIntegerAcc 179
; LN:802 ByteAcc(2)=MoldBuf(179)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,179
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:802 ByteAcc(1)=MoldBuf(179+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,179
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:803 GOSUB GetChargePos
call GetChargePos
; LN:804 DataGrid.TEXT(DataGridRow,5)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,5
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:805 LoadIntegerAcc 183
; LN:805 ByteAcc(2)=MoldBuf(183)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,183
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:805 ByteAcc(1)=MoldBuf(183+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,183
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:806 GOSUB GetChargePos
call GetChargePos
; LN:807 DataGrid.TEXT(DataGridRow,6)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,6
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:808 LoadIntegerAcc 187
; LN:808 ByteAcc(2)=MoldBuf(187)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,187
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:808 ByteAcc(1)=MoldBuf(187+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,187
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:809 GOSUB GetChargePos
call GetChargePos
; LN:810 DataGrid.TEXT(DataGridRow,7)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,7
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:812 INCR DataGridRow
inc [DataGridRow]
; LN:813 DataGrid.TEXT(DataGridRow,1)="Mold Open Slow"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst121
mov [_TmpVec1],esi
mov [_TmpVec1+4],15
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:814 LoadLongAcc 235
; LN:814 ByteAcc(1)=MoldBuf(235+3)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,235
mov edx,3
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:814 ByteAcc(2)=MoldBuf(235+2)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,235
mov edx,2
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:814 ByteAcc(3)=MoldBuf(235+1)
mov esi,ByteAcc-(1*1)
mov eax,3
add esi,eax;
mov [_TmpVec1],esi
mov eax,235
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:814 ByteAcc(4)=MoldBuf(235)
mov esi,ByteAcc-(1*1)
mov eax,4
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,235
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:815 GOSUB GetMoldMovement
call GetMoldMovement
; LN:816 DataGrid.TEXT(DataGridRow,2)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,2
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:818 INCR DataGridRow
inc [DataGridRow]
; LN:819 DataGrid.TEXT(DataGridRow,1)="Mold Open Fast Pos"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst122
mov [_TmpVec1],esi
mov [_TmpVec1+4],19
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:820 LoadLongAcc 239
; LN:820 ByteAcc(1)=MoldBuf(239+3)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,239
mov edx,3
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:820 ByteAcc(2)=MoldBuf(239+2)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,239
mov edx,2
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:820 ByteAcc(3)=MoldBuf(239+1)
mov esi,ByteAcc-(1*1)
mov eax,3
add esi,eax;
mov [_TmpVec1],esi
mov eax,239
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:820 ByteAcc(4)=MoldBuf(239)
mov esi,ByteAcc-(1*1)
mov eax,4
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,239
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:821 GOSUB GetMoldMovement
call GetMoldMovement
; LN:822 DataGrid.TEXT(DataGridRow,2)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,2
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:824 INCR DataGridRow
inc [DataGridRow]
; LN:825 DataGrid.TEXT(DataGridRow,1)="Mold Movement1"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst123
mov [_TmpVec1],esi
mov [_TmpVec1+4],15
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:826 LoadLongAcc 243
; LN:826 ByteAcc(1)=MoldBuf(243+3)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,243
mov edx,3
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:826 ByteAcc(2)=MoldBuf(243+2)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,243
mov edx,2
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:826 ByteAcc(3)=MoldBuf(243+1)
mov esi,ByteAcc-(1*1)
mov eax,3
add esi,eax;
mov [_TmpVec1],esi
mov eax,243
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:826 ByteAcc(4)=MoldBuf(243)
mov esi,ByteAcc-(1*1)
mov eax,4
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,243
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:827 GOSUB GetMoldMovement
call GetMoldMovement
; LN:828 DataGrid.TEXT(DataGridRow,2)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,2
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:830 INCR DataGridRow
inc [DataGridRow]
; LN:831 DataGrid.TEXT(DataGridRow,1)="Mold Movement2"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst124
mov [_TmpVec1],esi
mov [_TmpVec1+4],15
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:832 LoadLongAcc 247
; LN:832 ByteAcc(1)=MoldBuf(247+3)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,247
mov edx,3
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:832 ByteAcc(2)=MoldBuf(247+2)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,247
mov edx,2
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:832 ByteAcc(3)=MoldBuf(247+1)
mov esi,ByteAcc-(1*1)
mov eax,3
add esi,eax;
mov [_TmpVec1],esi
mov eax,247
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:832 ByteAcc(4)=MoldBuf(247)
mov esi,ByteAcc-(1*1)
mov eax,4
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,247
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:833 GOSUB GetMoldMovement
call GetMoldMovement
; LN:834 DataGrid.TEXT(DataGridRow,2)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,2
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:836 INCR DataGridRow
inc [DataGridRow]
; LN:837 DataGrid.TEXT(DataGridRow,1)="Eject Motion"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst125
mov [_TmpVec1],esi
mov [_TmpVec1+4],13
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:838 LoadIntegerAcc 305
; LN:838 ByteAcc(2)=MoldBuf(305)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,305
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:838 ByteAcc(1)=MoldBuf(305+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,305
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:839 GOSUB GetEjectMotion
call GetEjectMotion
; LN:840 DataGrid.TEXT(DataGridRow,2)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,2
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:841 LoadIntegerAcc 307
; LN:841 ByteAcc(2)=MoldBuf(307)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,307
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:841 ByteAcc(1)=MoldBuf(307+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,307
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:842 GOSUB GetEjectMotion
call GetEjectMotion
; LN:843 DataGrid.TEXT(DataGridRow,3)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,3
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:844 LoadIntegerAcc 309
; LN:844 ByteAcc(2)=MoldBuf(309)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,309
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:844 ByteAcc(1)=MoldBuf(309+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,309
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:845 GOSUB GetEjectMotion
call GetEjectMotion
; LN:846 DataGrid.TEXT(DataGridRow,4)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,4
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:848 INCR DataGridRow
inc [DataGridRow]
; LN:849 DataGrid.TEXT(DataGridRow,1)="Eject Delay"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst126
mov [_TmpVec1],esi
mov [_TmpVec1+4],12
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:850 LoadIntegerAcc 311
; LN:850 ByteAcc(2)=MoldBuf(311)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,311
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:850 ByteAcc(1)=MoldBuf(311+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,311
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:851 GOSUB GetEjectDelay
call GetEjectDelay
; LN:852 DataGrid.TEXT(DataGridRow,2)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,2
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:854 INCR DataGridRow
inc [DataGridRow]
; LN:855 DataGrid.TEXT(DataGridRow,1)="Eject Hold"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst127
mov [_TmpVec1],esi
mov [_TmpVec1+4],11
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:856 LoadIntegerAcc 313
; LN:856 ByteAcc(2)=MoldBuf(313)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,313
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:856 ByteAcc(1)=MoldBuf(313+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,313
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:857 GOSUB GetEjectDelay
call GetEjectDelay
; LN:858 DataGrid.TEXT(DataGridRow,2)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,2
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:860 INCR DataGridRow
inc [DataGridRow]
; LN:861 DataGrid.TEXT(DataGridRow,1)="Eject Setup"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst128
mov [_TmpVec1],esi
mov [_TmpVec1+4],12
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:862 LoadIntegerAcc 315
; LN:862 ByteAcc(2)=MoldBuf(315)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,315
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:862 ByteAcc(1)=MoldBuf(315+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,315
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:863 TempStr=STR(IntegerAcc)
mov edi,[IntegerAcc]
xor eax,eax
mov ax, word [edi]
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
; LN:864 DataGrid.TEXT(DataGridRow,2)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,2
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:866 INCR DataGridRow
inc [DataGridRow]
; LN:867 DataGrid.TEXT(DataGridRow,1)="Heater"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst129
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:868 LoadIntegerAcc 513
; LN:868 ByteAcc(2)=MoldBuf(513)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,513
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:868 ByteAcc(1)=MoldBuf(513+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,513
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:869 GOSUB GetTemperature
call GetTemperature
; LN:870 DataGrid.TEXT(DataGridRow,2)=TempStr' Heater1
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,2
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:871 LoadIntegerAcc 525
; LN:871 ByteAcc(2)=MoldBuf(525)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,525
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:871 ByteAcc(1)=MoldBuf(525+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,525
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:872 GOSUB GetTemperature
call GetTemperature
; LN:873 DataGrid.TEXT(DataGridRow,3)=TempStr' Heater2
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,3
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:874 LoadIntegerAcc 537
; LN:874 ByteAcc(2)=MoldBuf(537)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,537
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:874 ByteAcc(1)=MoldBuf(537+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,537
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:875 GOSUB GetTemperature
call GetTemperature
; LN:876 DataGrid.TEXT(DataGridRow,4)=TempStr' Heater3
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,4
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:877 LoadIntegerAcc 549
; LN:877 ByteAcc(2)=MoldBuf(549)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,549
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:877 ByteAcc(1)=MoldBuf(549+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,549
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:878 GOSUB GetTemperature
call GetTemperature
; LN:879 DataGrid.TEXT(DataGridRow,5)=TempStr' Heater4
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,5
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:880 LoadIntegerAcc 561
; LN:880 ByteAcc(2)=MoldBuf(561)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,561
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:880 ByteAcc(1)=MoldBuf(561+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,561
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:881 GOSUB GetTemperature
call GetTemperature
; LN:882 DataGrid.TEXT(DataGridRow,6)=TempStr' Heater5
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,6
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:883 LoadIntegerAcc 573
; LN:883 ByteAcc(2)=MoldBuf(573)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,573
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:883 ByteAcc(1)=MoldBuf(573+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,573
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:884 GOSUB GetTemperature
call GetTemperature
; LN:885 DataGrid.TEXT(DataGridRow,7)=TempStr' Heater6
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,7
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:886 LoadIntegerAcc 585
; LN:886 ByteAcc(2)=MoldBuf(585)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,585
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:886 ByteAcc(1)=MoldBuf(585+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,585
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:887 GOSUB GetTemperature
call GetTemperature
; LN:888 DataGrid.TEXT(DataGridRow,9)=TempStr' Hopper
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,9
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:891 INCR DataGridRow
inc [DataGridRow]
; LN:892 DataGrid.TEXT(DataGridRow,1)="Heater High Limit"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst130
mov [_TmpVec1],esi
mov [_TmpVec1+4],18
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:893 LoadIntegerAcc 515
; LN:893 ByteAcc(2)=MoldBuf(515)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,515
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:893 ByteAcc(1)=MoldBuf(515+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,515
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:894 GOSUB GetTemperature2
call GetTemperature2
; LN:895 DataGrid.TEXT(DataGridRow,2)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,2
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:896 LoadIntegerAcc 527
; LN:896 ByteAcc(2)=MoldBuf(527)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,527
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:896 ByteAcc(1)=MoldBuf(527+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,527
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:897 GOSUB GetTemperature2
call GetTemperature2
; LN:898 DataGrid.TEXT(DataGridRow,3)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,3
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:899 LoadIntegerAcc 539
; LN:899 ByteAcc(2)=MoldBuf(539)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,539
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:899 ByteAcc(1)=MoldBuf(539+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,539
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:900 GOSUB GetTemperature2
call GetTemperature2
; LN:901 DataGrid.TEXT(DataGridRow,4)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,4
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:902 LoadIntegerAcc 551
; LN:902 ByteAcc(2)=MoldBuf(551)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,551
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:902 ByteAcc(1)=MoldBuf(551+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,551
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:903 GOSUB GetTemperature2
call GetTemperature2
; LN:904 DataGrid.TEXT(DataGridRow,5)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,5
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:905 LoadIntegerAcc 563
; LN:905 ByteAcc(2)=MoldBuf(563)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,563
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:905 ByteAcc(1)=MoldBuf(563+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,563
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:906 GOSUB GetTemperature2
call GetTemperature2
; LN:907 DataGrid.TEXT(DataGridRow,6)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,6
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:908 LoadIntegerAcc 575
; LN:908 ByteAcc(2)=MoldBuf(575)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,575
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:908 ByteAcc(1)=MoldBuf(575+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,575
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:909 GOSUB GetTemperature2
call GetTemperature2
; LN:910 DataGrid.TEXT(DataGridRow,7)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,7
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:911 LoadIntegerAcc 587
; LN:911 ByteAcc(2)=MoldBuf(587)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,587
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:911 ByteAcc(1)=MoldBuf(587+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,587
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:912 GOSUB GetTemperature2
call GetTemperature2
; LN:913 DataGrid.TEXT(DataGridRow,9)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,9
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:915 INCR DataGridRow
inc [DataGridRow]
; LN:916 DataGrid.TEXT(DataGridRow,1)="Heater Low Limit"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst131
mov [_TmpVec1],esi
mov [_TmpVec1+4],17
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:917 LoadIntegerAcc 517
; LN:917 ByteAcc(2)=MoldBuf(517)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,517
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:917 ByteAcc(1)=MoldBuf(517+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,517
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:918 GOSUB GetTemperature2
call GetTemperature2
; LN:919 DataGrid.TEXT(DataGridRow,2)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,2
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:920 LoadIntegerAcc 529
; LN:920 ByteAcc(2)=MoldBuf(529)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,529
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:920 ByteAcc(1)=MoldBuf(529+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,529
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:921 GOSUB GetTemperature2
call GetTemperature2
; LN:922 DataGrid.TEXT(DataGridRow,3)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,3
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:923 LoadIntegerAcc 541
; LN:923 ByteAcc(2)=MoldBuf(541)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,541
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:923 ByteAcc(1)=MoldBuf(541+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,541
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:924 GOSUB GetTemperature2
call GetTemperature2
; LN:925 DataGrid.TEXT(DataGridRow,4)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,4
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:926 LoadIntegerAcc 553
; LN:926 ByteAcc(2)=MoldBuf(553)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,553
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:926 ByteAcc(1)=MoldBuf(553+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,553
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:927 GOSUB GetTemperature2
call GetTemperature2
; LN:928 DataGrid.TEXT(DataGridRow,5)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,5
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:929 LoadIntegerAcc 565
; LN:929 ByteAcc(2)=MoldBuf(565)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,565
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:929 ByteAcc(1)=MoldBuf(565+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,565
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:930 GOSUB GetTemperature2
call GetTemperature2
; LN:931 DataGrid.TEXT(DataGridRow,6)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,6
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:932 LoadIntegerAcc 577
; LN:932 ByteAcc(2)=MoldBuf(577)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,577
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:932 ByteAcc(1)=MoldBuf(577+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,577
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:933 GOSUB GetTemperature2
call GetTemperature2
; LN:934 DataGrid.TEXT(DataGridRow,7)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,7
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:935 LoadIntegerAcc 589
; LN:935 ByteAcc(2)=MoldBuf(589)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,589
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:935 ByteAcc(1)=MoldBuf(589+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,589
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:936 GOSUB GetTemperature2
call GetTemperature2
; LN:937 DataGrid.TEXT(DataGridRow,9)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,9
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:939 INCR DataGridRow
inc [DataGridRow]
; LN:940 DataGrid.TEXT(DataGridRow,1)="Heater Limit O/X"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst132
mov [_TmpVec1],esi
mov [_TmpVec1+4],17
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:941 SETVEC BitTestAcc=ADDR(MoldBuf(753))
mov esi,MoldBuf-(1*1)
mov eax,753
add esi,eax;
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
mov eax,esi
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov [BitTestAcc],eax
; LN:942 IF BITTST(BitTestAcc,7)=TRUE THEN
mov edi,[BitTestAcc]
xor eax,eax
mov ax, word [edi]
mov edx,7
bt eax,edx
setc cl; Set result
mov byte [_Tmp1],cl
xor bh,bh
mov al, byte [_Tmp1]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl114
; LN:943 DataGrid.TEXT(DataGridRow,2)="O"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,2
dec eax
or ebx,eax
mov esi,_StrConst133
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:944 ELSE
jmp _Lbl115
_Lbl114:
; LN:945 DataGrid.TEXT(DataGridRow,2)="X"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,2
dec eax
or ebx,eax
mov esi,_StrConst134
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:946 ENDIF
_Lbl115:
; LN:947 IF BITTST(BitTestAcc,6)=TRUE THEN
mov edi,[BitTestAcc]
xor eax,eax
mov ax, word [edi]
mov edx,6
bt eax,edx
setc cl; Set result
mov byte [_Tmp1],cl
xor bh,bh
mov al, byte [_Tmp1]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl116
; LN:948 DataGrid.TEXT(DataGridRow,3)="O"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,3
dec eax
or ebx,eax
mov esi,_StrConst135
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:949 ELSE
jmp _Lbl117
_Lbl116:
; LN:950 DataGrid.TEXT(DataGridRow,3)="X"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,3
dec eax
or ebx,eax
mov esi,_StrConst136
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:951 ENDIF
_Lbl117:
; LN:952 IF BITTST(BitTestAcc,5)=TRUE THEN
mov edi,[BitTestAcc]
xor eax,eax
mov ax, word [edi]
mov edx,5
bt eax,edx
setc cl; Set result
mov byte [_Tmp1],cl
xor bh,bh
mov al, byte [_Tmp1]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl118
; LN:953 DataGrid.TEXT(DataGridRow,4)="O"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,4
dec eax
or ebx,eax
mov esi,_StrConst137
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:954 ELSE
jmp _Lbl119
_Lbl118:
; LN:955 DataGrid.TEXT(DataGridRow,4)="X"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,4
dec eax
or ebx,eax
mov esi,_StrConst138
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:956 ENDIF
_Lbl119:
; LN:957 IF BITTST(BitTestAcc,4)=TRUE THEN
mov edi,[BitTestAcc]
xor eax,eax
mov ax, word [edi]
mov edx,4
bt eax,edx
setc cl; Set result
mov byte [_Tmp1],cl
xor bh,bh
mov al, byte [_Tmp1]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl120
; LN:958 DataGrid.TEXT(DataGridRow,5)="O"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,5
dec eax
or ebx,eax
mov esi,_StrConst139
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:959 ELSE
jmp _Lbl121
_Lbl120:
; LN:960 DataGrid.TEXT(DataGridRow,5)="X"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,5
dec eax
or ebx,eax
mov esi,_StrConst140
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:961 ENDIF
_Lbl121:
; LN:962 IF BITTST(BitTestAcc,3)=TRUE THEN
mov edi,[BitTestAcc]
xor eax,eax
mov ax, word [edi]
mov edx,3
bt eax,edx
setc cl; Set result
mov byte [_Tmp1],cl
xor bh,bh
mov al, byte [_Tmp1]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl122
; LN:963 DataGrid.TEXT(DataGridRow,6)="O"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,6
dec eax
or ebx,eax
mov esi,_StrConst141
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:964 ELSE
jmp _Lbl123
_Lbl122:
; LN:965 DataGrid.TEXT(DataGridRow,6)="X"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,6
dec eax
or ebx,eax
mov esi,_StrConst142
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:966 ENDIF
_Lbl123:
; LN:967 IF BITTST(BitTestAcc,2)=TRUE THEN
mov edi,[BitTestAcc]
xor eax,eax
mov ax, word [edi]
mov edx,2
bt eax,edx
setc cl; Set result
mov byte [_Tmp1],cl
xor bh,bh
mov al, byte [_Tmp1]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl124
; LN:968 DataGrid.TEXT(DataGridRow,7)="O"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,7
dec eax
or ebx,eax
mov esi,_StrConst143
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:969 ELSE
jmp _Lbl125
_Lbl124:
; LN:970 DataGrid.TEXT(DataGridRow,7)="X"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,7
dec eax
or ebx,eax
mov esi,_StrConst144
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:971 ENDIF
_Lbl125:
; LN:972 IF BITTST(BitTestAcc,1)=TRUE THEN
mov edi,[BitTestAcc]
xor eax,eax
mov ax, word [edi]
mov edx,1
bt eax,edx
setc cl; Set result
mov byte [_Tmp1],cl
xor bh,bh
mov al, byte [_Tmp1]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl126
; LN:973 DataGrid.TEXT(DataGridRow,9)="O"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,9
dec eax
or ebx,eax
mov esi,_StrConst145
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:974 ELSE
jmp _Lbl127
_Lbl126:
; LN:975 DataGrid.TEXT(DataGridRow,9)="X"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,9
dec eax
or ebx,eax
mov esi,_StrConst146
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:976 ENDIF
_Lbl127:
; LN:978 INCR DataGridRow
inc [DataGridRow]
; LN:979 DataGrid.TEXT(DataGridRow,1)="Suckback Speed"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst147
mov [_TmpVec1],esi
mov [_TmpVec1+4],15
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:980 LoadIntegerAcc 195
; LN:980 ByteAcc(2)=MoldBuf(195)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,MoldBuf-(1*1)
mov eax,195
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:980 ByteAcc(1)=MoldBuf(195+1)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax,195
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,MoldBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:981 TempStr=STR(IntegerAcc/100)
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,100
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:982 DataGrid.TEXT(DataGridRow,2)=TempStr
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,2
dec eax
or ebx,eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[TempStr]
; LN:984 INCR DataGridRow
inc [DataGridRow]
; LN:985 DataGrid.TEXT(DataGridRow,1)="Open Position"
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst148
mov [_TmpVec1],esi
mov [_TmpVec1+4],14
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:987 RETURN
ret
PopulateCombo:
; LN:990 MoldList.ENABLED=TRUE
mov edi,!MoldList
mov [!TargetGUIDesc],edi
bts dword [edi],1
invoke EnableWindow, dword [edi+44],TRUE
; LN:991 PutSetupIntoList.ENABLED=TRUE
mov edi,!PutSetupIntoList
mov [!TargetGUIDesc],edi
bts dword [edi],1
invoke EnableWindow, dword [edi+44],TRUE
; LN:992 DeleteSetupFromList.ENABLED=TRUE
mov edi,!DeleteSetupFromList
mov [!TargetGUIDesc],edi
bts dword [edi],1
invoke EnableWindow, dword [edi+44],TRUE
; LN:993 ENABLEMENUITEM MainMenu,MenuPutSetupIntoList
mov eax,1006
invoke EnableMenuItem,[MainMenu],eax,MF_ENABLED+MF_BYCOMMAND
; LN:994 ENABLEMENUITEM MainMenu,MenuDeleteSetupFromList
mov eax,1007
invoke EnableMenuItem,[MainMenu],eax,MF_ENABLED+MF_BYCOMMAND
; LN:995 SaveListToCard.ENABLED=TRUE
mov edi,!SaveListToCard
mov [!TargetGUIDesc],edi
bts dword [edi],1
invoke EnableWindow, dword [edi+44],TRUE
; LN:996 SaveListToFile.ENABLED=TRUE
mov edi,!SaveListToFile
mov [!TargetGUIDesc],edi
bts dword [edi],1
invoke EnableWindow, dword [edi+44],TRUE
; LN:997 ENABLEMENUITEM MainMenu,MenuSaveListToCard
mov eax,1001
invoke EnableMenuItem,[MainMenu],eax,MF_ENABLED+MF_BYCOMMAND
; LN:998 ENABLEMENUITEM MainMenu,MenuSaveListToFile
mov eax,1003
invoke EnableMenuItem,[MainMenu],eax,MF_ENABLED+MF_BYCOMMAND
; LN:999 MoldList.CLEAR
mov edi,!MoldList
mov [!TargetGUIDesc],edi
invoke SendMessage, dword [edi+44],CB_RESETCONTENT,0,0
; LN:1000 MoldIndex=1987
mov dword [MoldIndex],1987
; LN:1001 BEGINLOOP
_Lbl128:
; LN:1002 SETVEC MachName=ADDR(CardBuf(MoldIndex))	
mov esi,CardBuf-(1*1)
mov eax, dword [MoldIndex]
add esi,eax;
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
mov eax,esi
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov [MachName],eax
mov [MachName+4],12
mov [MachName+8],0
; LN:1003 SETVEC MoldName=ADDR(CardBuf(MoldIndex+12))
mov eax, dword [MoldIndex]
mov edx,12
add eax,edx
mov [_Tmp1],eax
mov esi,CardBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
mov eax,esi
mov [_Tmp2],eax
mov eax, dword [_Tmp2]
mov [MoldName],eax
mov [MoldName+4],30
mov [MoldName+8],0
; LN:1004 ByteAcc(1)=CardBuf(MoldIndex-9)
mov esi,ByteAcc-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [MoldIndex]
mov edx,9
sub eax,edx
mov [_Tmp1],eax
mov esi,CardBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1005 ByteAcc(2)=CardBuf(MoldIndex-10)
mov esi,ByteAcc-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [MoldIndex]
mov edx,10
sub eax,edx
mov [_Tmp1],eax
mov esi,CardBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1006 ByteAcc(3)=CardBuf(MoldIndex-11)
mov esi,ByteAcc-(1*1)
mov eax,3
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [MoldIndex]
mov edx,11
sub eax,edx
mov [_Tmp1],eax
mov esi,CardBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1007 ByteAcc(4)=CardBuf(MoldIndex-12)
mov esi,ByteAcc-(1*1)
mov eax,4
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [MoldIndex]
mov edx,12
sub eax,edx
mov [_Tmp1],eax
mov esi,CardBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1008 TempStr=STR(LongAcc)
mov edi,[LongAcc]
mov eax, dword [edi]
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
; LN:1009 MoldNumber=""
mov [MoldNumber+12],0
; LN:1010 TempMachName=MachName
mov edi,TempMachName
mov esi,MachName
call __MovStr
; LN:1011 TempMoldName=MoldName
mov edi,TempMoldName
mov esi,MoldName
call __MovStr
; LN:1012 FOR TempInt=1 TO 8-LEN(TempStr)
mov [TempInt],1
mov esi,TempStr
call __StrLen
mov [_Tmp1],eax
mov eax,8
mov edx, dword [_Tmp1]
sub eax,edx
mov [_LopVec1],eax
_Lbl130:
mov eax,[TempInt]
cmp eax,[_LopVec1]
jg _Lbl132
; LN:1013 MoldNumber=MoldNumber+"0"
mov edi,[MoldNumber]
mov [_TmpVec1],edi
mov edi,[MoldNumber+4]
mov [_TmpVec1+4],edi
mov edi,[MoldNumber+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst149
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,MoldNumber
mov esi,_TmpVec1
call __MovStr
; LN:1014 NEXT TempInt
_Lbl131:
inc [TempInt]
jmp _Lbl130
_Lbl132:
; LN:1015 MoldNumber=MoldNumber+TempStr
mov edi,[MoldNumber]
mov [_TmpVec1],edi
mov edi,[MoldNumber+4]
mov [_TmpVec1+4],edi
mov edi,[MoldNumber+8]
mov [_TmpVec1+8],edi
mov edi,[TempStr]
mov [_TmpVec2],edi
mov edi,[TempStr+4]
mov [_TmpVec2+4],edi
mov edi,[TempStr+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,MoldNumber
mov esi,_TmpVec1
call __MovStr
; LN:1016 IF BITTST(CardBuf(MoldIndex-1361),4)=TRUE OR CardBuf(MoldIndex-1361)=$aa OR LEN(MoldName)=0 THEN
mov eax, dword [MoldIndex]
mov edx,1361
sub eax,edx
mov [_Tmp1],eax
mov esi,CardBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,4
bt eax,edx
setc cl; Set result
mov byte [_Tmp2],cl
xor bh,bh
mov al, byte [_Tmp2]
mov dl,1
cmp al,dl
sete bl
or bh,bl
mov eax, dword [MoldIndex]
mov edx,1361
sub eax,edx
mov [_Tmp1],eax
mov esi,CardBuf-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,170
cmp eax,edx
sete bl
or bh,bl
mov esi,MoldName
call __StrLen
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
je _Lbl133
; LN:1017 TempMachName="Vacant"
mov edi,[TempMachName]
mov esi,_StrConst150
call __SetStrConst
; LN:1018 TempMoldName=""
mov [TempMoldName+12],0
; LN:1019 MoldNumber="00000000"
mov esi,_StrConst151
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,MoldNumber
mov esi,_TmpVec1
call __MovStr
; LN:1020 ENDIF
_Lbl133:
; LN:1021 TempStr=MoldNumber+" "+TempMachName+" "+TempMoldName
mov edi,[MoldNumber]
mov [_TmpVec1],edi
mov edi,[MoldNumber+4]
mov [_TmpVec1+4],edi
mov edi,[MoldNumber+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst152
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov edi,[TempMachName]
mov [_TmpVec3],edi
mov edi,[TempMachName+4]
mov [_TmpVec3+4],edi
mov edi,[TempMachName+8]
mov [_TmpVec3+8],edi
mov esi,_StrConst153
mov [_TmpVec4],esi
mov [_TmpVec4+4],2
mov [_TmpVec4+8],0
mov edi,[TempMoldName]
mov [_TmpVec5],edi
mov edi,[TempMoldName+4]
mov [_TmpVec5+4],edi
mov edi,[TempMoldName+8]
mov [_TmpVec5+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec5
mov [_TmpVec4+8],esi
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:1022 MoldList.ADDITEM TempStr
mov edi,!MoldList
mov [!TargetGUIDesc],edi
invoke SendMessage, dword [edi+44],CB_ADDSTRING,0,[TempStr]
; LN:1023 MoldIndex=MoldIndex+2048
mov eax, dword [MoldIndex]
mov edx,2048
add eax,edx
mov dword [MoldIndex],eax
; LN:1024 EXITIF MoldIndex>262144
xor bh,bh
mov eax, dword [MoldIndex]
mov edx,262144
cmp eax,edx
setg bl
or bh,bl
jne _Lbl129
; LN:1025 ENDLOOP
jmp _Lbl128
_Lbl129:
; LN:1026 Timer1.INTERVAL=200
mov eax,200
invoke SetTimer,[OBMain],1,eax,NULL
; LN:1027 RETURN
ret
; LN:1029 Timer1.timer
Timer1_timer:
; LN:1030 MoldList.TEXT=SetupName
mov edi,!MoldList
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[SetupName]
; LN:1031 Timer1.STOP
invoke KillTimer,[OBMain],1
; LN:1032 END EVENT
ret
ClearAll:
; LN:1035 DISABLEMENUITEM MainMenu,MenuEraseList
mov eax,1012
invoke EnableMenuItem,[MainMenu],eax,MF_GRAYED+MF_BYCOMMAND
; LN:1036 DISABLEMENUITEM MainMenu,MenuEraseSetup
mov eax,1013
invoke EnableMenuItem,[MainMenu],eax,MF_GRAYED+MF_BYCOMMAND
; LN:1037 DISABLEMENUITEM MainMenu,MenuExport
mov eax,1014
invoke EnableMenuItem,[MainMenu],eax,MF_GRAYED+MF_BYCOMMAND
; LN:1038 DISABLEMENUITEM MainMenu,MenuSaveListToCard
mov eax,1001
invoke EnableMenuItem,[MainMenu],eax,MF_GRAYED+MF_BYCOMMAND
; LN:1039 DISABLEMENUITEM MainMenu,MenuSaveListToFile
mov eax,1003
invoke EnableMenuItem,[MainMenu],eax,MF_GRAYED+MF_BYCOMMAND
; LN:1040 DISABLEMENUITEM MainMenu,MenuSaveSetupToFile
mov eax,1005
invoke EnableMenuItem,[MainMenu],eax,MF_GRAYED+MF_BYCOMMAND
; LN:1041 DISABLEMENUITEM MainMenu,MenuPutSetupIntoList
mov eax,1006
invoke EnableMenuItem,[MainMenu],eax,MF_GRAYED+MF_BYCOMMAND
; LN:1042 DISABLEMENUITEM MainMenu,MenuDeleteSetupFromList
mov eax,1007
invoke EnableMenuItem,[MainMenu],eax,MF_GRAYED+MF_BYCOMMAND
; LN:1043 DataGrid.ENABLED=FALSE
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
btc dword [edi],1
invoke EnableWindow, dword [edi+44],FALSE
; LN:1044 DataGrid.BACKCOLOR=OBLtGray
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax,12632256
mov edi,[!TargetGUIDesc]
mov dword [edi+32],eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETBACKCOLOR,eax,0
; LN:1045 DataGrid.FORECOLOR=OBLtGray
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax,12632256
mov edi,[!TargetGUIDesc]
mov dword [edi+36],eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETTEXTCOLOR,eax,0
; LN:1046 DataGrid.GRIDCOLOR=OBLtGray
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax,12632256
mov edi,[!TargetGUIDesc]
mov dword [edi+32],eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETGRIDCOLOR,eax,0
; LN:1047 MoldList.CLEAR
mov edi,!MoldList
mov [!TargetGUIDesc],edi
invoke SendMessage, dword [edi+44],CB_RESETCONTENT,0,0
; LN:1048 StoreFlag=FALSE
mov byte [StoreFlag],0
; LN:1049 DeleteFlag=FALSE
mov byte [DeleteFlag],0
; LN:1050 SetupLoaded=FALSE
mov byte [SetupLoaded],0
; LN:1051 SetupLoadedFromList=FALSE
mov byte [SetupLoadedFromList],0
; LN:1052 TextSafe=""
mov [TextSafe+12],0
; LN:1053 SetupName="No Setup Loaded"
mov edi,[SetupName]
mov esi,_StrConst154
call __SetStrConst
; LN:1054 MoldList.TEXT=SetupName
mov edi,!MoldList
mov [!TargetGUIDesc],edi
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[SetupName]
; LN:1055 ListLoaded=FALSE
mov byte [ListLoaded],0
; LN:1056 Stat 1,OBYellow,OBRed,"Welcome To Toyo Setup Manager"
; LN:1056 Stat1.BACKCOLOR=OBYellow
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,65535
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:1056 Stat1.FORECOLOR=OBRed
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:1056 Stat1.TEXT="Welcome To Toyo Setup Manager"
mov edi,!Stat1
mov [!TargetGUIDesc],edi
mov esi,_StrConst155
mov [_TmpVec1],esi
mov [_TmpVec1+4],30
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:1057 Stat 2,OBYellow,OBRed,"No List Loaded"
; LN:1057 Stat2.BACKCOLOR=OBYellow
mov edi,!Stat2
mov [!TargetGUIDesc],edi
mov eax,65535
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:1057 Stat2.FORECOLOR=OBRed
mov edi,!Stat2
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:1057 Stat2.TEXT="No List Loaded"
mov edi,!Stat2
mov [!TargetGUIDesc],edi
mov esi,_StrConst156
mov [_TmpVec1],esi
mov [_TmpVec1+4],15
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:1058 Stat 3,OBYellow,OBRed,"No Setup Loaded"
; LN:1058 Stat3.BACKCOLOR=OBYellow
mov edi,!Stat3
mov [!TargetGUIDesc],edi
mov eax,65535
mov edi,[!TargetGUIDesc]
bts dword [edi+0],3
mov dword [edi+32],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:1058 Stat3.FORECOLOR=OBRed
mov edi,!Stat3
mov [!TargetGUIDesc],edi
mov eax,255
mov edi,[!TargetGUIDesc]
bts dword [edi+0],4
mov dword [edi+36],eax
invoke InvalidateRect, dword [edi+44],NULL,TRUE
; LN:1058 Stat3.TEXT="No Setup Loaded"
mov edi,!Stat3
mov [!TargetGUIDesc],edi
mov esi,_StrConst157
mov [_TmpVec1],esi
mov [_TmpVec1+4],16
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:1059 MoldList.ENABLED=FALSE
mov edi,!MoldList
mov [!TargetGUIDesc],edi
btc dword [edi],1
invoke EnableWindow, dword [edi+44],FALSE
; LN:1060 PutSetupIntoList.ENABLED=FALSE
mov edi,!PutSetupIntoList
mov [!TargetGUIDesc],edi
btc dword [edi],1
invoke EnableWindow, dword [edi+44],FALSE
; LN:1061 DeleteSetupFromList.ENABLED=FALSE
mov edi,!DeleteSetupFromList
mov [!TargetGUIDesc],edi
btc dword [edi],1
invoke EnableWindow, dword [edi+44],FALSE
; LN:1062 SaveListToCard.ENABLED=FALSE
mov edi,!SaveListToCard
mov [!TargetGUIDesc],edi
btc dword [edi],1
invoke EnableWindow, dword [edi+44],FALSE
; LN:1063 SaveListToFile.ENABLED=FALSE
mov edi,!SaveListToFile
mov [!TargetGUIDesc],edi
btc dword [edi],1
invoke EnableWindow, dword [edi+44],FALSE
; LN:1064 SaveSetupToFile.ENABLED=FALSE
mov edi,!SaveSetupToFile
mov [!TargetGUIDesc],edi
btc dword [edi],1
invoke EnableWindow, dword [edi+44],FALSE
; LN:1065 RETURN
ret
ShowGrid:
; LN:1068 DataGrid.ENABLED=TRUE
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
bts dword [edi],1
invoke EnableWindow, dword [edi+44],TRUE
; LN:1069 DataGrid.BACKCOLOR=OBWhite
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax,16777215
mov edi,[!TargetGUIDesc]
mov dword [edi+32],eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETBACKCOLOR,eax,0
; LN:1070 DataGrid.FORECOLOR=OBBlack
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
mov dword [edi+36],eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETTEXTCOLOR,eax,0
; LN:1071 DataGrid.GRIDCOLOR=OBLtGray
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax,12632256
mov edi,[!TargetGUIDesc]
mov dword [edi+32],eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],GM_SETGRIDCOLOR,eax,0
; LN:1072 ENABLEMENUITEM MainMenu,MenuExport
mov eax,1014
invoke EnableMenuItem,[MainMenu],eax,MF_ENABLED+MF_BYCOMMAND
; LN:1073 RETURN
ret
; LN:1075 Exit.command
mov edi,!Exit
mov [!TargetGUIDesc],edi
Exit_command:
; LN:1076 END
invoke DeleteObject,[!Brush]
invoke PostMessage,[OBMain],WM_CLOSE,0,0
; LN:1077 END EVENT
ret
; LN:1079 Clear.command
mov edi,!Clear
mov [!TargetGUIDesc],edi
Clear_command:
; LN:1080 GOSUB ClearAll
call ClearAll
; LN:1081 END EVENT
ret
GetTemperature:
; LN:1084 TempInt=IntegerAcc*18
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,18
imul edx
mov dword [TempInt],eax
; LN:1085 TempInt=TempInt/100+32
mov eax, dword [TempInt]
mov edx,100
mov ecx,edx
xor edx,edx
idiv ecx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,32
add eax,edx
mov dword [TempInt],eax
; LN:1086 TempStr=STR(TempInt)
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
; LN:1087 RETURN
ret
GetTemperature2:
; LN:1090 TempInt=IntegerAcc*18
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,18
imul edx
mov dword [TempInt],eax
; LN:1091 TempInt=TempInt/100
mov eax, dword [TempInt]
mov edx,100
mov ecx,edx
xor edx,edx
idiv ecx
mov dword [TempInt],eax
; LN:1092 TempStr=STR(TempInt)
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
; LN:1093 RETURN
ret
GetInjPos:
; LN:1096 TempInt=LongAcc*100/137981
mov edi,[LongAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx,100
imul edx
mov edx,137981
mov ecx,edx
xor edx,edx
idiv ecx
mov dword [TempInt],eax
; LN:1097 TempStr2=STR(TempInt)
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr2
mov esi,_TmpVec1
call __MovStr
; LN:1098 GOSUB Decimal3	
call Decimal3
; LN:1099 RETURN
ret
GetMoldMovement:
; LN:1102 TempInt=LongAcc*1000/2540005
mov edi,[LongAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx,1000
imul edx
mov edx,2540005
mov ecx,edx
xor edx,edx
idiv ecx
mov dword [TempInt],eax
; LN:1103 TempStr2=STR(TempInt)
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr2
mov esi,_TmpVec1
call __MovStr
; LN:1104 GOSUB Decimal2
call Decimal2
; LN:1105 RETURN
ret
GetChargePos:
; LN:1108 TempInt=LongAcc/1000
mov edi,[LongAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx,1000
mov ecx,edx
xor edx,edx
idiv ecx
mov dword [TempInt],eax
; LN:1109 TempStr2=STR(TempInt)
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr2
mov esi,_TmpVec1
call __MovStr
; LN:1110 GOSUB Decimal2
call Decimal2
; LN:1111 RETURN
ret
GetInjPress:
; LN:1114 TempInt=IntegerAcc*100000/538095
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,100000
imul edx
mov edx,538095
mov ecx,edx
xor edx,edx
idiv ecx
mov dword [TempInt],eax
; LN:1115 TempStr2=STR(TempInt)
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr2
mov esi,_TmpVec1
call __MovStr
; LN:1116 GOSUB Decimal3
call Decimal3
; LN:1117 RETURN
ret
GetEjectMotion:
; LN:1120 TempInt=IntegerAcc*1000/33898
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,1000
imul edx
mov edx,33898
mov ecx,edx
xor edx,edx
idiv ecx
mov dword [TempInt],eax
; LN:1121 TempStr2=STR(TempInt)
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr2
mov esi,_TmpVec1
call __MovStr
; LN:1122 GOSUB Decimal2
call Decimal2
; LN:1123 RETURN
ret
GetEjectDelay:
; LN:1126 TempInt=IntegerAcc*10000/33898
mov edi,[IntegerAcc]
mov [_TmpVec1],edi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,10000
imul edx
mov edx,33898
mov ecx,edx
xor edx,edx
idiv ecx
mov dword [TempInt],eax
; LN:1127 TempStr2=STR(TempInt)
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,TempStr2
mov esi,_TmpVec1
call __MovStr
; LN:1128 GOSUB Decimal2
call Decimal2
; LN:1129 RETURN
ret
Decimal3:
; LN:1132 SELECT CASE LEN(TempStr2)
mov esi,TempStr2
call __StrLen
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov [_SwitchInt],eax
; LN:1133 CASE 3
mov eax,3
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl135
; LN:1134 TempStr="."+TempStr2
mov esi,_StrConst158
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,[TempStr2]
mov [_TmpVec2],edi
mov edi,[TempStr2+4]
mov [_TmpVec2+4],edi
mov edi,[TempStr2+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:1135 CASE 4
jmp _Lbl134
_Lbl135:
mov eax,4
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl136
; LN:1136 TempStr=LEFT(TempStr2,1)+"."+RIGHT(TempStr2,3)
mov edi,[TempStr2]
mov [_TmpVec1],edi
mov edi,[TempStr2+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr2+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,1
mov edx,eax
mov eax,1
call __MidStr
mov edi,[TempStr2]
mov [_TmpVec2],edi
mov edi,[TempStr2+4]
mov [_TmpVec2+4],edi
mov edi,[TempStr2+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov eax,3
call __RightStr
mov esi,_StrConst159
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:1137 CASE 5
jmp _Lbl134
_Lbl136:
mov eax,5
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl137
; LN:1138 TempStr=LEFT(TempStr2,2)+"."+RIGHT(TempStr2,3)
mov edi,[TempStr2]
mov [_TmpVec1],edi
mov edi,[TempStr2+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr2+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,2
mov edx,eax
mov eax,1
call __MidStr
mov edi,[TempStr2]
mov [_TmpVec2],edi
mov edi,[TempStr2+4]
mov [_TmpVec2+4],edi
mov edi,[TempStr2+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov eax,3
call __RightStr
mov esi,_StrConst160
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:1139 CASE 6
jmp _Lbl134
_Lbl137:
mov eax,6
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl138
; LN:1140 TempStr=LEFT(TempStr2,3)+"."+RIGHT(TempStr2,3)
mov edi,[TempStr2]
mov [_TmpVec1],edi
mov edi,[TempStr2+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr2+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,3
mov edx,eax
mov eax,1
call __MidStr
mov edi,[TempStr2]
mov [_TmpVec2],edi
mov edi,[TempStr2+4]
mov [_TmpVec2+4],edi
mov edi,[TempStr2+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov eax,3
call __RightStr
mov esi,_StrConst161
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:1141 CASE ELSE
jmp _Lbl134
_Lbl138:
; LN:1142 TempStr=TempStr2
mov edi,TempStr
mov esi,TempStr2
call __MovStr
; LN:1143 END SELECT
jmp _Lbl134
_Lbl139:
_Lbl134:
; LN:1144 RETURN
ret
Decimal2:
; LN:1147 SELECT CASE LEN(TempStr2)
mov esi,TempStr2
call __StrLen
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov [_SwitchInt],eax
; LN:1148 CASE 1
mov eax,1
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl141
; LN:1149 TempStr="0.0"+TempStr2
mov esi,_StrConst162
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
mov edi,[TempStr2]
mov [_TmpVec2],edi
mov edi,[TempStr2+4]
mov [_TmpVec2+4],edi
mov edi,[TempStr2+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:1150 CASE 2
jmp _Lbl140
_Lbl141:
mov eax,2
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl142
; LN:1151 TempStr="0."+TempStr2
mov esi,_StrConst163
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
mov edi,[TempStr2]
mov [_TmpVec2],edi
mov edi,[TempStr2+4]
mov [_TmpVec2+4],edi
mov edi,[TempStr2+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:1152 CASE 3
jmp _Lbl140
_Lbl142:
mov eax,3
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl143
; LN:1153 TempStr=LEFT(TempStr2,1)+"."+RIGHT(TempStr2,2)
mov edi,[TempStr2]
mov [_TmpVec1],edi
mov edi,[TempStr2+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr2+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,1
mov edx,eax
mov eax,1
call __MidStr
mov edi,[TempStr2]
mov [_TmpVec2],edi
mov edi,[TempStr2+4]
mov [_TmpVec2+4],edi
mov edi,[TempStr2+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov eax,2
call __RightStr
mov esi,_StrConst164
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:1154 CASE 4
jmp _Lbl140
_Lbl143:
mov eax,4
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl144
; LN:1155 TempStr=LEFT(TempStr2,2)+"."+RIGHT(TempStr2,2)
mov edi,[TempStr2]
mov [_TmpVec1],edi
mov edi,[TempStr2+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr2+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,2
mov edx,eax
mov eax,1
call __MidStr
mov edi,[TempStr2]
mov [_TmpVec2],edi
mov edi,[TempStr2+4]
mov [_TmpVec2+4],edi
mov edi,[TempStr2+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov eax,2
call __RightStr
mov esi,_StrConst165
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:1156 CASE 5
jmp _Lbl140
_Lbl144:
mov eax,5
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl145
; LN:1157 TempStr=LEFT(TempStr2,2)+"."+RIGHT(TempStr2,2)
mov edi,[TempStr2]
mov [_TmpVec1],edi
mov edi,[TempStr2+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr2+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,2
mov edx,eax
mov eax,1
call __MidStr
mov edi,[TempStr2]
mov [_TmpVec2],edi
mov edi,[TempStr2+4]
mov [_TmpVec2+4],edi
mov edi,[TempStr2+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov eax,2
call __RightStr
mov esi,_StrConst166
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:1158 CASE ELSE
jmp _Lbl140
_Lbl145:
; LN:1159 TempStr=TempStr2
mov edi,TempStr
mov esi,TempStr2
call __MovStr
; LN:1160 END SELECT
jmp _Lbl140
_Lbl146:
_Lbl140:
; LN:1161 RETURN
ret
; LN:1163 OBMain.system
mov edi,!OBMain
mov [!TargetGUIDesc],edi
OBMain_system:
; LN:1164 SELECT CASE STATUS
mov eax, dword [STATUS]
mov [_SwitchInt],eax
; LN:1165 CASE OBMinimize
mov eax,61472
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl148
; LN:1167 CASE OBMaximize
jmp _Lbl147
_Lbl148:
mov eax,61488
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl149
; LN:1169 CASE OBClose
jmp _Lbl147
_Lbl149:
mov eax,61536
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl150
; LN:1170 PASSSYSTEMEVENT
mov [!PassSystemEvent],1
; LN:1171 END SELECT
jmp _Lbl147
_Lbl150:
_Lbl147:
; LN:1172 END EVENT
ret
; LN:1174 OBMain.resize
mov edi,!OBMain
mov [!TargetGUIDesc],edi
OBMain_resize:
; LN:1175 SETPOSITION OBMain,0,0,800,572
mov edi,!OBMain
mov [!TargetGUIDesc],edi
mov eax,0
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,0
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,800
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,572
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
invoke SetWindowPos, dword [OBMain],HWND_TOP, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28],0
; LN:1176 END EVENT
ret
; LN:1178 AboutWindow.system
mov edi,!AboutWindow
mov [!TargetGUIDesc],edi
AboutWindow_system:
; LN:1179 AboutWindow.VISIBLE=FALSE
mov edi,!AboutWindow
mov [!TargetGUIDesc],edi
btc dword [edi],2
invoke ShowWindow, dword [edi+44],SW_HIDE
; LN:1180 END EVENT
ret
DoAbout:
; LN:1183 IF AboutConstructed=FALSE THEN
xor bh,bh
mov al, byte [AboutConstructed]
mov dl,0
cmp al,dl
sete bl
or bh,bl
je _Lbl151
; LN:1184 AboutConstructed=TRUE
mov byte [AboutConstructed],1
; LN:1185 CONSTRUCT AboutWindow,300,200,200,160
mov edi,!AboutWindow
mov [!TargetGUIDesc],edi
mov eax,300
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,200
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,200
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,160
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl152
invoke LoadIcon,0,IDI_APPLICATION
mov [!AboutWindowWindowClass.hIcon],eax
invoke LoadCursor,0,IDC_ARROW
mov [!AboutWindowWindowClass.hCursor],eax
mov [!AboutWindowWindowClass.style],0
mov [!AboutWindowWindowClass.lpfnWndProc],!AboutWindowProc
mov [!AboutWindowWindowClass.cbClsExtra],0
mov [!AboutWindowWindowClass.cbWndExtra],0
mov eax,[!hinstance]
mov [!AboutWindowWindowClass.hbrBackground],COLOR_BTNFACE+1
mov [!AboutWindowWindowClass.lpszMenuName],0
mov [!AboutWindowWindowClass.lpszClassName],!AboutWindowClass
invoke RegisterClass,!AboutWindowWindowClass
mov dword [!AboutWindow],0
mov dword [!AboutWindow+4],1
mov dword [!AboutWindow+12],6
mov dword [!AboutWindow+32],$ffffff
mov dword [!AboutWindow+36],$000000
mov dword [!AboutWindow+40],!CT_FORM
mov dword [!AboutWindow+488],0
mov dword [!AboutWindow+492],!AboutWindowProc
mov edi,[!TargetGUIDesc]
invoke CreateWindowEx,WS_EX_TOOLWINDOW,!AboutWindowClass,!title,WS_VISIBLE+WS_OVERLAPPEDWINDOW,dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword NULL,NULL,[!hinstance],!AboutWindow
invoke SetWindowLong,[!AboutWindow+44],GWL_USERDATA,!AboutWindow
mov dword [edi+0],$07
_Lbl152:
; LN:1186 AboutWindow.TEXT="Toyo Setup Manager"
mov edi,!AboutWindow
mov [!TargetGUIDesc],edi
mov esi,_StrConst167
mov [_TmpVec1],esi
mov [_TmpVec1+4],19
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:1187 CONSTRUCT AboutLine1,10,10,180,20 IN AboutWindow
mov edi,!AboutLine1
mov [!TargetGUIDesc],edi
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,180
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl153
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!AboutWindow+44],124,[!hinstance],!AboutWindow
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],124
mov eax,[!AboutWindow+44]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl153:
; LN:1188 AboutLine1.TEXT="Toyo Setup Manager"
mov edi,!AboutLine1
mov [!TargetGUIDesc],edi
mov esi,_StrConst168
mov [_TmpVec1],esi
mov [_TmpVec1+4],19
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:1189 CONSTRUCT AboutLine2,10,30,180,20 IN AboutWindow
mov edi,!AboutLine2
mov [!TargetGUIDesc],edi
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,30
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,180
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl154
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!AboutWindow+44],125,[!hinstance],!AboutWindow
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],125
mov eax,[!AboutWindow+44]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl154:
; LN:1190 AboutLine2.TEXT="Version 1.1b"
mov edi,!AboutLine2
mov [!TargetGUIDesc],edi
mov esi,_StrConst169
mov [_TmpVec1],esi
mov [_TmpVec1+4],13
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:1191 CONSTRUCT AboutLine3,10,50,180,20 IN AboutWindow
mov edi,!AboutLine3
mov [!TargetGUIDesc],edi
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,50
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,180
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl155
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!AboutWindow+44],126,[!hinstance],!AboutWindow
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],126
mov eax,[!AboutWindow+44]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl155:
; LN:1192 AboutLine3.TEXT="Copyright 2004 ISI"
mov edi,!AboutLine3
mov [!TargetGUIDesc],edi
mov esi,_StrConst170
mov [_TmpVec1],esi
mov [_TmpVec1+4],19
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:1193 CONSTRUCT AboutLine4,10,70,180,20 IN AboutWindow
mov edi,!AboutLine4
mov [!TargetGUIDesc],edi
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,70
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,180
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl156
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!AboutWindow+44],127,[!hinstance],!AboutWindow
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],127
mov eax,[!AboutWindow+44]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl156:
; LN:1194 AboutLine4.TEXT="Powered By OmniBasic"
mov edi,!AboutLine4
mov [!TargetGUIDesc],edi
mov esi,_StrConst171
mov [_TmpVec1],esi
mov [_TmpVec1+4],21
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:1195 CONSTRUCT AboutLine5,10,110,180,20 IN AboutWindow
mov edi,!AboutLine5
mov [!TargetGUIDesc],edi
mov eax,10
mov edi,[!TargetGUIDesc]
mov dword [edi+16],eax
mov eax,110
mov edi,[!TargetGUIDesc]
mov dword [edi+20],eax
mov eax,180
mov edi,[!TargetGUIDesc]
mov dword [edi+24],eax
mov eax,20
mov edi,[!TargetGUIDesc]
mov dword [edi+28],eax
bt dword [edi+0],0
jc _Lbl157
invoke CreateWindowEx,0,!ControlType3,NULL,SS_CENTER+SS_NOTIFY+WS_VISIBLE+WS_CHILD, dword [edi+16], dword [edi+20], dword [edi+24], dword [edi+28], dword [!AboutWindow+44],128,[!hinstance],!AboutWindow
mov dword edi,[!TargetGUIDesc]
mov dword [edi+44],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov edi,[!TargetGUIDesc]
mov dword [edi+40],102
mov dword [edi+4],128
mov eax,[!AboutWindow+44]
mov dword [edi+8],eax
mov dword [edi+12],0
mov dword [edi+0],$07
mov dword [edi+32],0
mov dword [edi+36],0
mov dword [edi+488],0
invoke GetWindowLong,dword [edi+44],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+492],eax
_Lbl157:
; LN:1196 AboutLine5.TEXT="Innomation Systems,Inc."
mov edi,!AboutLine5
mov [!TargetGUIDesc],edi
mov esi,_StrConst172
mov [_TmpVec1],esi
mov [_TmpVec1+4],24
mov [_TmpVec1+8],0
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+44],WM_SETTEXT,0,[_TmpVec1]
; LN:1197 ELSE
jmp _Lbl158
_Lbl151:
; LN:1198 AboutWindow.VISIBLE=TRUE	
mov edi,!AboutWindow
mov [!TargetGUIDesc],edi
bts dword [edi],2
invoke ShowWindow, dword [edi+44],SW_SHOW
; LN:1199 ENDIF
_Lbl158:
; LN:1200 RETURN
ret

; Automatic END statement
invoke DeleteObject,[!Brush]
invoke PostMessage,[OBMain],WM_CLOSE,0,0
_ErrExit:
cinvoke puts,_ErrExitMsg
mov eax,[ERR]
invoke ExitProcess, eax
; End of Code Section

; Init Section
_Init:

mov [!AboutWindow],0
mov [!AboutLine1],0
mov [!AboutLine2],0
mov [!AboutLine3],0
mov [!AboutLine4],0
mov [!AboutLine5],0
mov [!StatusBar],0
mov [!Stat1],0
mov [!Stat2],0
mov [!Stat3],0
mov [!SetupTitle],0
mov [!MoldList],0
mov [!DataGrid],0
mov [!GetListFromCard],0
mov [!SaveListToCard],0
mov [!GetSetupFromFile],0
mov [!SaveSetupToFile],0
mov [!CopyCardToFile],0
mov [!PutSetupIntoList],0
mov [!CopyFileToCard],0
mov [!DeleteSetupFromList],0
mov [!CardFromFile],0
mov [!FileFromCard],0
mov [!GetListFromFile],0
mov [!SaveListToFile],0
mov [!Clear],0
mov [!Exit],0
mov [!Stat1Label],0
mov [!Stat2Label],0
mov [!Stat3Label],0
mov [!OBMain+80],OBMain_create
mov [MenuEVPtr],Menu_command
mov [!MoldList+120],MoldList_SELECT
mov [!MoldList+120+4],9
mov [!GetListFromCard+52],GetListFromCard_command
mov [!SaveListToCard+52],SaveListToCard_command
mov [!GetSetupFromFile+52],GetSetupFromFile_command
mov [!SaveSetupToFile+52],SaveSetupToFile_command
mov [!GetListFromFile+52],GetListFromFile_command
mov [!SaveListToFile+52],SaveListToFile_command
mov [!PutSetupIntoList+52],PutSetupIntoList_command
mov [!DeleteSetupFromList+52],DeleteSetupFromList_command
mov [!CopyCardToFile+52],CopyCardToFile_command
mov [!CopyFileToCard+52],CopyFileToCard_command
mov [Timer1],Timer1_timer
mov [!Exit+52],Exit_command
mov [!Clear+52],Clear_command
mov [!OBMain+384],OBMain_system
mov [!OBMain+388],OBMain_resize
mov [!AboutWindow+384],AboutWindow_system
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
invoke CallWindowProc,[!OldProc1],[!hwnd],[wmsg],[wparam],[lparam]
jmp !Finish

proc !AboutWindowProc,!hwnd,wmsg,wparam,lparam
enter
push ebx esi edi
mov [!PassSystemEvent],0
cmp [wmsg],WM_GETMINMAXINFO
jne AboutWindowNotwmGetMaxInfo
mov dword edi,[!hwnd]
mov dword [!AboutWindow+44],edi
mov dword [!AboutWindow+8],0
jmp !DefWndProc
AboutWindowNotwmGetMaxInfo:
mov esi,!AboutWindow
cmp [wmsg],WM_DESTROY
jne !WinProcCommon
invoke DeleteObject,dword [esi+488]
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
__WriteFile:
mov [XferCount],0
__WriteStrLen:
cmp byte [esi],0
je __WriteStrLenDone
inc esi
inc [XferCount]
dec [__ByteCounter]
jne __WriteStrLen
__WriteStrLenDone:
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne __WriteOK
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
__WriteOK:
mov edx,[XferCount]
mov [_ArgSafe0],edx
mov eax,[_CRLF]
mov [_XferAddr],eax
mov [XferCount],2
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov edx,[_ArgSafe0]
add edx,[XferCount]
mov [XferCount],edx
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
__MidStr:
dec eax
mov edi,[esi]
add edi,eax
mov [esi],edi
mov [esi+4],edx
ret
__RightStr:
mov edi,[esi]
mov ecx,[esi+4]
__RightStrLen:
mov dl,[edi]
or dl,dl
je __RightStr2
dec ecx
je __RightStr1
inc edi
jmp __RightStrLen
__RightStr1:
inc edi
__RightStr2:
sub edi,eax
mov [esi],edi
mov [esi+4],eax
ret
; End of Function Section
