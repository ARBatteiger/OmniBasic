;Compiler Declaration Section

format PE GUI 4.0

entry !Start

macro align value { rb (value-1) - (rva $ + value-1) mod value }

_BufSize=1000

; GUI Equates

HandleOffs equ 0
IDOffs equ 4
OwnerOffs equ 8
ArrayOffs equ 12
LeftOffs equ 16
TopOffs equ 20
RightOffs equ 24
BottomOffs equ 28
BackColorOffs equ 32
ForeColorOffs equ 36
TypeOffs equ 40
StatusOffs equ 44
evActivateOffs equ 48
evCommandOffs equ 52
evMouseActivateOffs equ 56
evPaintOffs equ 60
HDCOffs equ 64
evMouseMoveOffs equ 68
evMouseWheelOffs equ 72
evScrollOffs equ 76
evCreateOffs equ 80
evDestroy equ 84
evKeyDownOffs equ 88
evKeyUpOffs equ 92
evDblClickOffs equ 96
cdDblClickOffs equ 100
evClickOffs equ 104
cdClickOffs equ 108
evChangeOffs equ 112
cdChangeOffs equ 116
evSelectOffs equ 120
cdSelectOffs equ 124
evNotify1Offs equ 128
cdNotify1Offs equ 132
evNotify2Offs equ 136
cdNotify2Offs equ 140
evNotify3Offs equ 144
cdNotify3Offs equ 148
evNotify4Offs equ 152
cdNotify4Offs equ 156
evNotify5Offs equ 160
cdNotify5Offs equ 164
evNotify6Offs equ 168
cdNotify6Offs equ 172
evNotify7Offs equ 176
cdNotify7Offs equ 180
evNotify8Offs equ 184
cdNotify8Offs equ 188
evNotify9Offs equ 192
cdNotify9Offs equ 196
evNotify10Offs equ 200
cdNotify10Offs equ 204
evNotify11Offs equ 208
cdNotify11Offs equ 212
evNotify12Offs equ 216
cdNotify12Offs equ 220
evNotify13Offs equ 224
cdNotify13Offs equ 228
evNotify14Offs equ 232
cdNotify14Offs equ 236
evNotify15Offs equ 240
cdNotify15Offs equ 244
evNotify16Offs equ 248
cdNotify16Offs equ 252
evNotify17Offs equ 256
cdNotify17Offs equ 260
evNotify18Offs equ 264
cdNotify18Offs equ 268
evNotify19Offs equ 272
cdNotify19Offs equ 276
evNotify20Offs equ 280
cdNotify20Offs equ 284
evNotify21Offs equ 288
cdNotify21Offs equ 292
evNotify22Offs equ 296
cdNotify22Offs equ 300
evNotify23Offs equ 304
cdNotify23Offs equ 308
evNotify24Offs equ 312
cdNotify24Offs equ 316
evNotify25Offs equ 320
cdNotify25Offs equ 324
evNotify26Offs equ 328
cdNotify26Offs equ 332
evNotify27Offs equ 336
cdNotify27Offs equ 340
evNotify28Offs equ 344
cdNotify28Offs equ 348
evNotify29Offs equ 352
cdNotify29Offs equ 356
evNotify30Offs equ 360
cdNotify30Offs equ 364
evNotify31Offs equ 368
cdNotify31Offs equ 372
evNotify32Offs equ 376
cdNotify32Offs equ 380
evSysCommandOffs equ 384
evResizeOffs equ 388
evMoveOffs equ 392
evLButtonDownOffs equ 396
evLButtonUpOffs equ 400
evRButtonDownOffs equ 404
evRButtonUpOffs equ 408
CursorOffs equ 412
evContextMenuOffs equ 416
evKeyStruckOffs equ 420
evReserved3Offs equ 424
evReserved4Offs equ 428
evReserved5Offs equ 432
evReserved6Offs equ 436
evReserved7Offs equ 440
Reserved1Offs equ 444
Reserved2Offs equ 448
Reserved3Offs equ 452
Reserved4Offs equ 456
Reserved5Offs equ 460
Reserved6Offs equ 464
Reserved7Offs equ 468
Reserved8Offs equ 472
OldProcOffs equ 476
WidthOffs equ 480
HeightOffs equ 484
ControlBrushOffs equ 488
InterceptSafeOffs equ 492
InterceptProcOffs equ 496
Style1Offs equ 500
Extra2Offs equ 504
DoNotUseOffs equ 508
TTcbSizeOffs equ 512
TTuFlagsOffs equ 516
TThwndOffs equ 520
TTuIDOffs equ 524
TTRectLeftOffs equ 528
TTRectTopOffs equ 532
TTRectRightOffs equ 536
TTRectBottomOffs equ 540
TThinstOffs equ 544
TTlpszTextOffs equ 548
TTlparamOffs equ 552
TTTextOffs equ 556
NextOffs equ 656

WinConstructed equ 0
WinEnabled equ 1
WinVisible equ 2
WinChangeBackColor equ 3
WinChangeForeColor equ 4
WinArray equ 5
WinSubClassed equ 6
WinLoaded equ 7
WinPlaced equ 8
WinTipExists equ 9
!Timers equ 22
; End of Declaration Section
;________________________________________________________________________________________________________________________________

; Import Section

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
include 'include\OBComm.inc'
include 'include\DrawProgress.inc'
include 'include\macro\import.inc'
include 'include\macro\stdcall.inc'
include 'include\macro\resource.inc'
include 'include\buttonex.inc'


section '.idata' import data readable writeable

library kernel32,"kernel32.dll",\
        user32,"User32.dll",\
        gdi,"GDI32.DLL",\
        comctl,"COMCTL32.DLL",\
        shell,"SHELL32.DLL",\
        msvcrt,"msvcrt.dll",\
        imagelib,"ImageLib.dll"

kernel32:
	import	SetThreadPriority,"SetThreadPriority",\
		Sleep,"Sleep",\
		CreateThread,"CreateThread",\
		ClearCommError,"ClearCommError",\
		CloseHandle,"CloseHandle",\
		CreateFile,"CreateFileA",\
		ExitProcess,"ExitProcess",\
		GetCommandLine,"GetCommandLineA",\
		GetFileSize,"GetFileSize",\
		GetLastError,"GetLastError",\
		GetModuleHandle,"GetModuleHandleA",\
		GetStdHandle,"GetStdHandle",\
		GetLocalTime,"GetLocalTime",\
		FileTimeToSystemTime,"FileTimeToSystemTime",\
		SystemTimeToFileTime,"SystemTimeToFileTime",\
		LoadLibrary,"LoadLibraryA",\
		ReadFile,"ReadFile",\
		SetCommMask,"SetCommMask",\
		GetCommState,"GetCommState",\
		SetCommState,"SetCommState",\
		SetFilePointer,"SetFilePointer",\
		WriteFile,"WriteFile"
user32:
	import	CallWindowProc,"CallWindowProcA",\
		CreateWindowEx,"CreateWindowExA",\
		DefWindowProc,"DefWindowProcA",\
		DispatchMessage,"DispatchMessageA",\
		EnableWindow,"EnableWindow",\
		GetComboBoxInfo,"GetComboBoxInfo",\
		GetMessage,"GetMessageA",\
		IsIconic,"IsIconic",\
		InvalidateRect,"InvalidateRect",\
		KillTimer,"KillTimer",\
		LoadCursor,"LoadCursorA",\
		LoadIcon,"LoadIconA",\
		MessageBox,"MessageBoxA",\
		PostMessage,"PostMessageA",\
		PostQuitMessage,"PostQuitMessage",\
		RegisterClass,"RegisterClassA",\
		SendMessage,"SendMessageA",\
		SetClassLong,"SetClassLongA",\
		SetFocus,"SetFocus",\
		SetTimer,"SetTimer",\
		GetWindowLong,"GetWindowLongA",\
		SetWindowLong,"SetWindowLongA",\
		SetWindowPos,"SetWindowPos",\
		ShowWindow,"ShowWindow",\
		UpdateWindow,"UpdateWindow",\
		TranslateMessage,"TranslateMessage"
gdi:
	import	CreateFontIndirect,"CreateFontIndirectA",\
		CreateSolidBrush,"CreateSolidBrush",\
		DeleteObject,"DeleteObject",\
		GetPixel,"GetPixel",\
		GetBkColor,"GetBkColor",\
		SetBkColor,"SetBkColor",\
		SetBkMode,"SetBkMode",\
		GetStockObject,"GetStockObject",\
		SetTextColor,"SetTextColor"
comctl:
	import	InitCommonControlsEx,"InitCommonControlsEx"
shell:
	import	ShellExecute,"ShellExecuteA"
msvcrt:
	import	atol,"atol",\
		ltoa,"_ltoa"
imagelib:
	import	BitmapFromFile,"BitmapFromFile",\
		BitmapFromMemory,"BitmapFromMemory"

; End of Import Section
;________________________________________________________________________________________________________________________________

section '.data' data readable writeable

align 4

ERR dd 0
!ArrayBase dd 1
_ErrVec dd 0
STATUS dd 0
POS dd 0
Ticks dd 0
XferCount dd 0
CommError dd 0
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
!ControlType15 db 'SysAnimate32',0
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
!ControlType26 db 'STATIC',0
!ControlType27 db 'BUTTON',0
!ControlType28 db 'STATIC',0
!ControlType29 db 'OBCOMM',0
!ControlType30 db 'DRAWPROGRESS',0
!ControlType31 db 'SCROLLBAR',0
!ControlType32 db 'SysDateTimePick32',0
!ControlType33 db 'STATIC',0
!ControlType34 db 'SPREAD_SHEET',0
!ControlType35 db 'ButtonEx',0

!OBMainWindowClass WNDCLASS
msg MSG
!TrapColorChange dd 0
!OBMainClass db 'OBMain',0
!ToolTipClass db 'Tooltips_class32',0
!icc dd $00000008,$00003FFF
!!RichEd db 'RichEd20.dll',0
!!RAEdit db 'RAEdit.dll',0
!!RAGrid db 'RAGrid.dll',0
!!Csmdll db 'Csmdll.dll',0
!!DrawProgress db 'DrawProgress.dll',0
!!ImageLib db 'ImageLib.dll',0
!!SprShtLib db 'SprSht.dll',0
!!ButtonExLib db 'ButtonEx.dll',0
!title db 'OBMain',0

align 4
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
ft_SearchMin rd 1
ft_SearchMax rd 1
ft_SearchTextPtr rd 1
ft_FoundMin rd 1
ft_FoundMax rd 1

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
; LN:1 ; Dimension Variables
; LN:91 DIM RadioComm AS STRING
align 4
RadioComm dd RadioComm+12
 dd 255
 dd 0
 rb 255
; LN:149 DIM TempStr AS STRING
align 4
TempStr dd TempStr+12
 dd 255
 dd 0
 rb 255
; LN:150 DIM TempMacAddr AS STRING*10
align 4
TempMacAddr dd TempMacAddr+12
 dd 10
 dd 0
 rb 10
; LN:153 DIM TempData AS STRING*10
align 4
TempData dd TempData+12
 dd 10
 dd 0
 rb 10
; LN:158 DIM TempChar AS STRING*1
align 4
TempChar dd TempChar+12
 dd 1
 dd 0
 rb 1
; LN:169 DIM CommChar AS STRING*1 VECTOR
align 4
CommChar dd CommChar+12
 dd 1
 dd 0
 rb 1
; LN:203 DIM FormattedDate AS STRING*32
align 4
FormattedDate dd FormattedDate+12
 dd 32
 dd 0
 rb 32
; LN:204 DIM FormattedTime AS STRING*32
align 4
FormattedTime dd FormattedTime+12
 dd 32
 dd 0
 rb 32
_StrConst1 db "Verdana",0
_StrConst2 db "CurrentShot",0
_StrConst3 db "_InoHost",0
_StrConst4 db "CompanyName",0
_StrConst5 db "Server Name",0
_StrConst6 db "Password",0
_StrConst7 db "Company Name",0
_StrConst8 db "Server Name",0
_StrConst9 db "Password",0
_StrConst10 db "Wireless",0
_StrConst11 db "COM",0
_StrConst12 db "FirstPort",0
_StrConst13 db "# Of Ports",0
_StrConst14 db "MAC Address",0
_StrConst15 db "Save Configuration",0
_StrConst16 db "Log Item",0
_StrConst17 db "Mach #",0
_StrConst18 db "Date/Time",0
_StrConst19 db "Opt 1",0
_StrConst20 db "Opt 2",0
_StrConst21 db "Stat",0
_StrConst22 db "M",0
_StrConst23 db "Shot",0
_StrConst24 db "Mode",0
_StrConst25 db "Alarm",0
_StrConst26 db "Event",0
_StrConst27 db "Bytes",0
_StrConst28 db "Comm",0
_StrConst29 db "00.00",0
_StrConst30 db "Machine ",0
_StrConst31 db " Last Alarm Time",0
_StrConst32 db "00.00",0
_StrConst33 db "Machine ",0
_StrConst34 db " Last Mode Time",0
_StrConst35 db "00.00",0
_StrConst36 db "Machine ",0
_StrConst37 db " Last Shot Time",0
_StrConst38 db "IDLE",0
_StrConst39 db "Machine ",0
_StrConst40 db " Mode",0
_StrConst41 db "Machine ",0
_StrConst42 db " Mode",0
_StrConst43 db "Machine ",0
_StrConst44 db " Comm Error",0
_StrConst45 db "Machine ",0
_StrConst46 db " Comm Msg",0
_StrConst47 db "Lock",0
_StrConst48 db "Lock System",0
_StrConst49 db "Configuration",0
_StrConst50 db "Configure System",0
_StrConst51 db "View Log",0
_StrConst52 db "View System Log",0
_StrConst53 db "View Stats",0
_StrConst54 db "View System Stats",0
_StrConst55 db "View Data",0
_StrConst56 db "View Last Data",0
_StrConst57 db "Exit",0
_StrConst58 db "Exit System",0
_StrConst59 db "No Message",0
!DefaultBMP:
 db $ff,$d8,$ff,$e0,$00,$10,$4a,$46,$49,$46,$00,$01,$01,$01,$00,$60,$00,$60,$00,$00,$ff,$db,$00,$43,$00,$10,$0b,$0c,$0e,$0c,$0a,$10
 db $0e,$0d,$0e,$12,$11,$10,$13,$18,$28,$1a,$18,$16,$16,$18,$31,$23,$25,$1d,$28,$3a,$33,$3d,$3c,$39,$33,$38,$37,$40,$48,$5c,$4e,$40
 db $44,$57,$45,$37,$38,$50,$6d,$51,$57,$5f,$62,$67,$68,$67,$3e,$4d,$71,$79,$70,$64,$78,$5c,$65,$67,$63,$ff,$c0,$00,$0b,$08,$01,$39
 db $00,$dd,$01,$01,$11,$00,$ff,$c4,$00,$1f,$00,$00,$01,$05,$01,$01,$01,$01,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$01,$02,$03,$04
 db $05,$06,$07,$08,$09,$0a,$0b,$ff,$c4,$00,$b5,$10,$00,$02,$01,$03,$03,$02,$04,$03,$05,$05,$04,$04,$00,$00,$01,$7d,$01,$02,$03,$00
 db $04,$11,$05,$12,$21,$31,$41,$06,$13,$51,$61,$07,$22,$71,$14,$32,$81,$91,$a1,$08,$23,$42,$b1,$c1,$15,$52,$d1,$f0,$24,$33,$62,$72
 db $82,$09,$0a,$16,$17,$18,$19,$1a,$25,$26,$27,$28,$29,$2a,$34,$35,$36,$37,$38,$39,$3a,$43,$44,$45,$46,$47,$48,$49,$4a,$53,$54,$55
 db $56,$57,$58,$59,$5a,$63,$64,$65,$66,$67,$68,$69,$6a,$73,$74,$75,$76,$77,$78,$79,$7a,$83,$84,$85,$86,$87,$88,$89,$8a,$92,$93,$94
 db $95,$96,$97,$98,$99,$9a,$a2,$a3,$a4,$a5,$a6,$a7,$a8,$a9,$aa,$b2,$b3,$b4,$b5,$b6,$b7,$b8,$b9,$ba,$c2,$c3,$c4,$c5,$c6,$c7,$c8,$c9
 db $ca,$d2,$d3,$d4,$d5,$d6,$d7,$d8,$d9,$da,$e1,$e2,$e3,$e4,$e5,$e6,$e7,$e8,$e9,$ea,$f1,$f2,$f3,$f4,$f5,$f6,$f7,$f8,$f9,$fa,$ff,$da
 db $00,$08,$01,$01,$00,$00,$3f,$00,$f3,$fa,$28,$a2,$8a,$28,$a2,$8a,$28,$a2,$8a,$74,$71,$bc,$b2,$2c,$71,$a3,$3b,$b9,$0a,$aa,$a3,$25
 db $89,$e8,$00,$a6,$d1,$45,$14,$51,$45,$14,$51,$45,$14,$51,$45,$14,$51,$45,$14,$51,$45,$14,$51,$45,$7a,$17,$c3,$cf,$0e,$3c,$6c,$35
 db $9b,$d8,$99,$09,$1f,$e8,$a0,$9c,$70,$41,$05,$88,$f7,$07,$03,$f1,$38,$e8,$6b,$3f,$c7,$fe,$1c,$7b,$2b,$d7,$d5,$2d,$22,$63,$6b,$39
 db $dd,$31,$ce,$76,$48,$4f,$27,$d8,$1f,$e7,$91,$c7,$02,$b8,$da,$28,$a2,$8a,$28,$a2,$8a,$28,$a2,$8a,$28,$a2,$8a,$28,$a2,$8a,$28,$a2
 db $8a,$dc,$f0,$96,$84,$da,$ee,$ae,$b1,$b8,$c5,$ac,$38,$92,$72,$41,$c1,$19,$fb,$b9,$1d,$09,$fa,$8e,$32,$7b,$57,$b1,$47,$1a,$45,$1a
 db $c7,$1a,$2a,$22,$00,$aa,$aa,$30,$14,$0e,$80,$0a,$8e,$ee,$d6,$0b,$eb,$59,$2d,$ae,$a2,$59,$61,$90,$61,$91,$bb,$ff,$00,$9f,$5a,$f1
 db $5d,$77,$49,$9b,$44,$d5,$25,$b2,$98,$ef,$db,$82,$92,$05,$20,$3a,$9e,$84,$67,$f2,$fa,$82,$2b,$3e,$8a,$28,$a2,$8a,$28,$a2,$8a,$28
 db $a2,$8a,$28,$a2,$8a,$28,$a2,$8a,$2a,$6b,$4b,$59,$ef,$ae,$a3,$b6,$b5,$89,$a5,$9a,$43,$85,$45,$ef,$fe,$7d,$6b,$da,$34,$0d,$1a,$0d
 db $0b,$4d,$5b,$38,$19,$9c,$e7,$7c,$8e,$df,$c6,$e4,$0c,$9c,$76,$e8,$38,$f6,$ef,$d6,$b4,$a8,$ac,$1f,$17,$78,$7d,$35,$ed,$37,$e4,$dc
 db $2e,$ed,$c3,$34,$04,$1f,$bc,$48,$e5,$4e,$78,$e7,$03,$9e,$df,$98,$3e,$3f,$24,$6f,$14,$8d,$1c,$88,$c8,$e8,$4a,$b2,$b0,$c1,$52,$3a
 db $82,$29,$b4,$51,$45,$14,$51,$45,$14,$51,$45,$14,$51,$45,$14,$51,$45,$14,$57,$a5,$7c,$3c,$f0,$f0,$b6,$b5,$1a,$bd,$d2,$29,$9a,$71
 db $fb,$80,$ca,$73,$1a,$72,$09,$e7,$fb,$df,$cb,$bf,$26,$bb,$6a,$28,$a2,$bc,$e7,$e2,$27,$87,$84,$12,$7f,$6c,$5a,$22,$ac,$72,$10,$b7
 db $08,$aa,$78,$73,$9f,$9c,$f6,$e7,$a1,$e9,$ce,$3a,$93,$5c,$2d,$14,$51,$45,$14,$51,$45,$14,$51,$45,$14,$51,$45,$14,$51,$45,$74,$de
 db $08,$f0,$f1,$d6,$35,$21,$71,$70,$8d,$f6,$2b,$62,$19,$89,$50,$56,$47,$04,$10,$9c,$fe,$67,$af,$1c,$71,$91,$5e,$b5,$45,$14,$51,$4d
 db $92,$34,$96,$36,$8e,$44,$57,$47,$05,$59,$58,$64,$30,$3d,$41,$15,$e3,$3e,$27,$d0,$a4,$d0,$75,$46,$83,$12,$35,$b3,$fc,$d0,$4a,$c3
 db $ef,$8e,$e3,$8e,$e3,$a1,$fc,$f0,$32,$2b,$1e,$8a,$28,$a2,$8a,$28,$a2,$8a,$28,$a2,$8a,$28,$a2,$8a,$2a,$c5,$85,$94,$da,$8d,$f4,$36
 db $76,$eb,$99,$66,$70,$ab,$c1,$c0,$f7,$38,$ec,$3a,$9f,$61,$5e,$d5,$a3,$69,$70,$68,$fa,$6c,$36,$76,$ea,$b8,$40,$37,$b8,$18,$f3,$1f
 db $1c,$b1,$fa,$fe,$9d,$3b,$55,$ea,$28,$a2,$8a,$2b,$1f,$c4,$fa,$14,$7a,$f6,$96,$d0,$62,$35,$b9,$4f,$9a,$09,$58,$7d,$c3,$dc,$71,$d8
 db $f4,$3f,$9e,$0e,$05,$78,$cc,$91,$bc,$52,$34,$72,$23,$23,$a1,$2a,$ca,$c3,$05,$48,$ea,$08,$a6,$d1,$45,$14,$51,$45,$14,$51,$45,$14
 db $51,$45,$14,$51,$5e,$ad,$e0,$4f,$0f,$1d,$27,$4f,$37,$77,$48,$cb,$79,$72,$06,$51,$d4,$03,$12,$67,$81,$eb,$cf,$04,$fe,$03,$1c,$57
 db $55,$45,$14,$51,$45,$14,$57,$0b,$f1,$13,$c3,$c6,$78,$ff,$00,$b6,$2d,$11,$9a,$48,$c0,$5b,$84,$55,$1c,$a0,$cf,$ce,$7b,$f1,$d0,$f5
 db $e3,$1d,$00,$af,$39,$a2,$8a,$28,$a2,$8a,$28,$a2,$8a,$28,$a2,$8a,$28,$ae,$b3,$c0,$be,$1b,$fe,$d5,$bc,$fb,$7d,$d2,$46,$d6,$36,$ef
 db $82,$8d,$cf,$98,$f8,$c8,$18,$f4,$19,$04,$e7,$af,$4e,$79,$c7,$aa,$57,$3b,$e2,$ed,$33,$59,$d4,$23,$b7,$6d,$1a,$f1,$ad,$cc,$21,$cc
 db $88,$b3,$34,$66,$4c,$e3,$00,$63,$83,$d0,$f5,$23,$ad,$70,$f7,$f6,$de,$32,$d3,$e3,$f3,$2e,$65,$d4,$c2,$60,$b1,$64,$b8,$69,$02,$81
 db $d4,$92,$ac,$71,$f8,$d6,$4f,$f6,$ee,$b1,$ff,$00,$41,$5b,$ef,$fc,$08,$7f,$f1,$a3,$fb,$77,$58,$ff,$00,$a0,$ad,$f7,$fe,$04,$3f,$f8
 db $d1,$fd,$bb,$ac,$7f,$d0,$56,$fb,$ff,$00,$02,$1f,$fc,$68,$fe,$dd,$d6,$3f,$e8,$2b,$7d,$ff,$00,$81,$0f,$fe,$35,$b5,$6b,$a7,$f8,$da
 db $ea,$33,$24,$6f,$a9,$a8,$07,$18,$96,$e4,$c6,$7f,$26,$60,$7f,$1a,$ef,$bc,$31,$a7,$ea,$5a,$76,$9d,$24,$3a,$ad,$df,$da,$a7,$69,$4b
 db $2b,$f9,$8c,$f8,$5c,$01,$8c,$b0,$cf,$50,$7f,$3a,$d6,$92,$34,$96,$36,$8e,$44,$57,$47,$05,$59,$58,$64,$30,$3d,$41,$15,$e3,$fe,$2e
 db $f0,$fb,$e8,$3a,$97,$c9,$b4,$da,$5c,$16,$68,$08,$3f,$74,$03,$ca,$9c,$f3,$c6,$47,$3d,$ff,$00,$30,$30,$68,$a2,$8a,$28,$a2,$8a,$28
 db $a2,$8a,$28,$a2,$af,$68,$da,$5c,$fa,$c6,$a5,$0d,$9d,$ba,$b6,$5c,$8d,$ee,$06,$7c,$b4,$cf,$2c,$7e,$9f,$af,$4e,$f5,$ed,$56,$16,$50
 db $e9,$d6,$30,$d9,$db,$ae,$22,$85,$02,$af,$03,$27,$dc,$e3,$b9,$ea,$7d,$cd,$58,$a2,$8a,$f3,$5f,$89,$3a,$44,$16,$97,$56,$fa,$85,$b4
 db $2c,$86,$e4,$b0,$9c,$a8,$f9,$37,$8c,$10,$7d,$89,$e7,$eb,$8c,$fa,$d7,$13,$45,$7a,$27,$c3,$4d,$1e,$31,$6f,$2e,$ad,$34,$59,$94,$b9
 db $8e,$02,$cb,$f7,$40,$1f,$33,$29,$ef,$9c,$e3,$3d,$b6,$91,$9e,$4d,$77,$94,$51,$59,$fa,$ee,$93,$0e,$b7,$a5,$cb,$65,$31,$d9,$bb,$05
 db $24,$0a,$09,$46,$1d,$08,$cf,$e5,$f4,$24,$57,$8a,$dd,$da,$cf,$63,$75,$25,$b5,$d4,$4d,$14,$d1,$9c,$32,$37,$6f,$f3,$eb,$50,$d1,$45
 db $14,$51,$45,$14,$51,$45,$14,$51,$5e,$bd,$e0,$ef,$0e,$26,$87,$a7,$89,$27,$89,$7f,$b4,$26,$1f,$bd,$6c,$ee,$da,$33,$c2,$83,$f9,$67
 db $d4,$f7,$20,$0a,$e8,$a8,$a2,$8a,$e3,$fe,$27,$7f,$c8,$bd,$6f,$ff,$00,$5f,$6b,$ff,$00,$a0,$3d,$79,$7d,$15,$ec,$1e,$04,$ff,$00,$91
 db $42,$c7,$fe,$da,$7f,$e8,$c6,$ae,$82,$8a,$28,$ae,$37,$c7,$fe,$1c,$4b,$db,$27,$d5,$2d,$22,$51,$75,$00,$dd,$31,$ce,$37,$c6,$07,$27
 db $dc,$8f,$e5,$91,$cf,$02,$bc,$c6,$8a,$28,$a2,$8a,$28,$a2,$8a,$28,$a2,$bb,$6f,$87,$9e,$1e,$37,$37,$43,$57,$ba,$46,$10,$c0,$7f,$70
 db $19,$46,$24,$7e,$41,$3c,$ff,$00,$77,$f9,$f7,$e0,$d7,$a5,$51,$45,$14,$57,$1f,$f1,$3b,$fe,$45,$eb,$7f,$fa,$fb,$5f,$fd,$01,$eb,$cb
 db $e8,$af,$60,$f0,$27,$fc,$8a,$16,$3f,$f6,$d3,$ff,$00,$46,$35,$74,$14,$51,$45,$15,$e4,$be,$37,$f0,$f1,$d1,$f5,$23,$71,$6e,$8d,$f6
 db $2b,$92,$59,$48,$50,$16,$37,$24,$92,$9c,$7e,$63,$a7,$1c,$73,$83,$5c,$cd,$14,$51,$45,$14,$51,$45,$14,$56,$a7,$87,$34,$69,$35,$cd
 db $5e,$2b,$44,$e2,$31,$f3,$cc,$db,$b0,$56,$30,$46,$48,$f7,$e7,$03,$8e,$a7,$d2,$bd,$a2,$de,$08,$ed,$ad,$e2,$b7,$85,$76,$c5,$12,$04
 db $45,$ce,$70,$00,$c0,$1c,$d4,$94,$51,$4d,$92,$44,$8a,$36,$92,$47,$54,$44,$05,$99,$98,$e0,$28,$1d,$49,$35,$ca,$ea,$be,$3f,$d2,$ec
 db $99,$e2,$b4,$59,$2f,$65,$5e,$e9,$f2,$c7,$9c,$e0,$8d,$c7,$f3,$c8,$04,$1e,$39,$ae,$3f,$c4,$fe,$2f,$9b,$c4,$16,$f1,$db,$7d,$92,$3b
 db $78,$11,$c4,$98,$de,$5d,$8b,$00,$47,$5e,$06,$30,$7a,$63,$f1,$ae,$6e,$8a,$f4,$af,$04,$f8,$97,$49,$b7,$d0,$ed,$74,$eb,$9b,$a5,$b7
 db $b8,$8c,$b8,$22,$51,$b5,$4e,$58,$b6,$77,$74,$1c,$1c,$72,$47,$23,$e9,$5d,$b5,$35,$a4,$44,$64,$57,$75,$52,$e7,$6a,$82,$71,$b8,$e0
 db $9c,$0f,$5e,$01,$3f,$85,$3a,$8a,$2a,$ae,$a7,$a7,$c1,$aa,$69,$f3,$59,$5d,$06,$31,$4a,$30,$76,$9c,$11,$83,$90,$47,$d0,$80,$6b,$c4
 db $f5,$3d,$3e,$7d,$2f,$50,$9a,$ca,$e8,$28,$96,$23,$83,$b4,$e4,$1c,$8c,$82,$3e,$a0,$83,$55,$68,$a2,$8a,$28,$a2,$8a,$29,$d1,$c6,$f2
 db $c8,$b1,$c6,$8c,$ee,$e4,$2a,$aa,$8c,$96,$27,$a0,$02,$bd,$93,$c2,$da,$02,$78,$7f,$4d,$f2,$4b,$2c,$97,$12,$9d,$f3,$48,$07,$53,$8f
 db $ba,$3b,$e0,$7b,$fa,$93,$c6,$71,$5b,$54,$51,$45,$79,$0f,$8c,$3c,$4a,$fa,$ed,$e8,$8e,$12,$cb,$65,$01,$21,$17,$77,$12,$1c,$9f,$9f
 db $18,$04,$64,$63,$83,$d3,$9f,$53,$5b,$1e,$1b,$f0,$03,$ce,$a9,$75,$ad,$16,$8e,$36,$01,$96,$dd,$4e,$1c,$f3,$d1,$f8,$e3,$8e,$c3,$9e
 db $7a,$82,$2a,$d7,$c4,$0d,$27,$4f,$d3,$bc,$3d,$6c,$6c,$ac,$a0,$81,$85,$c2,$a6,$f4,$40,$18,$8d,$8d,$c1,$6e,$a7,$a0,$eb,$5e,$77,$45
 db $69,$4b,$a1,$de,$c5,$a1,$c1,$ab,$ec,$57,$b4,$98,$90,$4a,$12,$4c,$78,$62,$bf,$30,$ed,$92,$38,$3f,$e2,$2a,$6d,$1b,$c4,$fa,$a6,$8b
 db $84,$b5,$9f,$7c,$03,$fe,$58,$4b,$f3,$27,$7e,$83,$a8,$e4,$e7,$82,$33,$de,$af,$69,$fe,$24,$d4,$f5,$3f,$14,$e9,$d2,$5d,$dc,$33,$a7
 db $da,$50,$2c,$2a,$4a,$22,$ee,$24,$70,$01,$1d,$03,$11,$93,$9c,$8e,$0e,$47,$15,$eb,$54,$51,$45,$72,$fe,$38,$f0,$e7,$f6,$cd,$88,$ba
 db $b7,$e2,$f2,$d5,$18,$aa,$85,$c9,$95,$7a,$ed,$e0,$67,$3e,$9e,$e4,$fa,$e4,$79,$3d,$14,$51,$45,$14,$51,$45,$7a,$07,$c3,$9d,$03,$fe
 db $63,$57,$2b,$ea,$b6,$b8,$6f,$aa,$b3,$11,$fa,$0f,$c7,$8e,$86,$bd,$02,$8a,$28,$ae,$37,$e2,$5e,$a0,$6d,$f4,$78,$2c,$90,$b0,$37,$52
 db $65,$b8,$04,$14,$4c,$12,$3d,$b9,$2a,$78,$f4,$35,$83,$f0,$eb,$46,$fb,$6e,$a8,$da,$8c,$c9,$98,$2d,$3e,$e6,$47,$0d,$21,$e9,$d4,$60
 db $e0,$73,$ea,$0e,$da,$f5,$0a,$e3,$fe,$27,$7f,$c8,$bd,$6f,$ff,$00,$5f,$6b,$ff,$00,$a0,$3d,$79,$7d,$15,$ec,$1e,$04,$ff,$00,$91,$42
 db $c7,$fe,$da,$7f,$e8,$c6,$ae,$5f,$c6,$be,$0f,$fb,$27,$99,$a9,$e9,$51,$ff,$00,$a3,$fd,$e9,$a0,$51,$fe,$af,$d5,$94,$7f,$77,$d4,$76
 db $fa,$74,$e3,$6c,$ee,$0d,$ad,$ec,$17,$0b,$bb,$30,$c8,$ae,$36,$90,$0f,$07,$3c,$64,$11,$f9,$83,$f4,$af,$7a,$a2,$8a,$28,$af,$2f,$f8
 db $83,$a0,$7f,$67,$df,$7f,$69,$db,$ae,$2d,$ae,$9f,$f7,$99,$6c,$95,$94,$e4,$9e,$3d,$0f,$5e,$fc,$e7,$a7,$15,$c7,$d1,$45,$14,$51,$45
 db $6d,$78,$5b,$40,$7f,$10,$6a,$5e,$49,$66,$8e,$de,$21,$be,$69,$00,$e8,$33,$f7,$47,$6c,$9f,$7f,$42,$79,$c6,$2b,$d9,$23,$8d,$22,$8d
 db $63,$8d,$15,$11,$00,$55,$55,$18,$0a,$07,$40,$05,$3a,$8a,$28,$af,$31,$f8,$9d,$23,$9d,$76,$da,$32,$ec,$51,$6d,$83,$05,$cf,$00,$96
 db $6c,$9c,$7b,$e0,$7e,$42,$b7,$be,$18,$ff,$00,$c8,$bd,$71,$ff,$00,$5f,$6d,$ff,$00,$a0,$25,$76,$15,$c7,$fc,$4e,$ff,$00,$91,$7a,$df
 db $fe,$be,$d7,$ff,$00,$40,$7a,$f2,$fa,$2b,$d8,$3c,$09,$ff,$00,$22,$85,$8f,$fd,$b4,$ff,$00,$d1,$8d,$5d,$05,$79,$6f,$8e,$3c,$2e,$fa
 db $6d,$d3,$ea,$16,$51,$28,$b0,$94,$8d,$cb,$18,$ff,$00,$52,$c7,$d4,$7a,$13,$d3,$b0,$ce,$38,$e3,$3e,$99,$67,$72,$97,$96,$50,$5d,$46
 db $18,$24,$f1,$ac,$8a,$1b,$a8,$04,$64,$67,$f3,$a9,$a8,$a2,$8a,$af,$7f,$65,$0e,$a3,$63,$35,$9d,$c2,$e6,$29,$90,$ab,$70,$32,$3d,$c6
 db $7b,$8e,$a3,$dc,$57,$8b,$eb,$ba,$4c,$da,$26,$a9,$2d,$94,$c7,$7e,$dc,$14,$90,$29,$01,$d4,$f4,$23,$3f,$97,$d4,$11,$59,$f4,$51,$45
 db $15,$25,$bc,$12,$5c,$dc,$45,$6f,$0a,$ee,$96,$57,$08,$8b,$9c,$64,$93,$80,$39,$af,$68,$f0,$e6,$8d,$1e,$87,$a4,$45,$68,$9c,$c8,$7e
 db $79,$9b,$76,$43,$48,$40,$c9,$1e,$dc,$60,$71,$d0,$7a,$d6,$a5,$14,$51,$45,$79,$df,$c5,$28,$23,$5b,$8d,$3a,$e0,$2f,$ef,$5d,$24,$46
 db $6c,$f5,$0a,$54,$81,$ff,$00,$8f,$1f,$ce,$b1,$fc,$19,$e2,$4f,$ec,$3b,$e3,$1d,$d3,$c8,$6c,$66,$e1,$d4,$72,$11,$b8,$c3,$e3,$f4,$38
 db $ed,$eb,$80,$2b,$d6,$a3,$91,$25,$8d,$64,$8d,$d5,$d1,$c0,$65,$65,$39,$0c,$0f,$42,$0d,$72,$3f,$13,$bf,$e4,$5e,$b7,$ff,$00,$af,$b5
 db $ff,$00,$d0,$1e,$bc,$be,$8a,$f6,$0f,$02,$7f,$c8,$a1,$63,$ff,$00,$6d,$3f,$f4,$63,$57,$41,$4d,$92,$34,$96,$36,$8e,$44,$57,$47,$05
 db $59,$58,$64,$30,$3d,$41,$14,$db,$78,$23,$b6,$b7,$8a,$de,$15,$db,$14,$48,$11,$17,$39,$c0,$03,$00,$73,$52,$51,$45,$14,$57,$3f,$e3
 db $2d,$03,$fb,$77,$4b,$fd,$ca,$e6,$f2,$df,$2d,$06,$5b,$00,$e7,$1b,$94,$f6,$e4,$0f,$cc,$0e,$40,$cd,$78,$fd,$14,$51,$45,$7a,$57,$c3
 db $cf,$0f,$0b,$6b,$51,$ab,$dd,$22,$99,$a7,$1f,$b8,$0c,$a7,$31,$a7,$20,$9e,$7f,$bd,$fc,$bb,$f2,$6b,$b6,$a2,$8a,$28,$a2,$b1,$fc,$55
 db $a4,$7f,$6d,$68,$73,$5b,$20,$cc,$e9,$fb,$c8,$7f,$df,$1d,$07,$50,$39,$04,$8e,$7a,$67,$3d,$ab,$c5,$eb,$a0,$f0,$ef,$8b,$6f,$b4,$2d
 db $b0,$ff,$00,$c7,$cd,$98,$cf,$ee,$18,$e3,$04,$f7,$56,$c1,$23,$9e,$dd,$39,$3c,$64,$e6,$b5,$bc,$63,$e2,$8d,$3b,$5e,$d0,$a2,$8a,$d0
 db $ca,$93,$25,$c8,$63,$1c,$a9,$83,$b4,$2b,$0c,$e4,$64,$75,$3e,$b9,$ae,$26,$8a,$f6,$0f,$02,$7f,$c8,$a1,$63,$ff,$00,$6d,$3f,$f4,$63
 db $57,$41,$45,$14,$51,$45,$14,$51,$5e,$73,$f1,$13,$c3,$c2,$09,$3f,$b6,$2d,$11,$56,$39,$08,$5b,$84,$55,$3c,$39,$cf,$ce,$7b,$73,$d0
 db $f4,$e7,$1d,$49,$ae,$16,$8a,$2b,$a2,$f0,$77,$87,$1f,$5c,$d4,$04,$93,$c4,$df,$d9,$f0,$9f,$de,$b6,$76,$ee,$38,$e1,$41,$fc,$b3,$e8
 db $3b,$82,$45,$7a,$f5,$14,$51,$45,$14,$51,$5e,$63,$e3,$9f,$0b,$dc,$db,$6a,$13,$6a,$76,$71,$34,$b6,$b3,$93,$24,$81,$01,$26,$26,$c6
 db $58,$9f,$63,$c9,$cf,$41,$d3,$8e,$33,$c6,$d1,$45,$15,$ec,$1e,$04,$ff,$00,$91,$42,$c7,$fe,$da,$7f,$e8,$c6,$ae,$82,$8a,$28,$a2,$8a
 db $28,$a2,$a3,$b8,$82,$3b,$9b,$79,$6d,$e6,$5d,$d1,$4a,$85,$1d,$73,$8c,$82,$30,$47,$15,$e3,$3e,$24,$d0,$e7,$d0,$b5,$27,$82,$44,$6f
 db $21,$c9,$30,$48,$4e,$77,$a6,$7d,$7d,$47,$19,$1f,$d0,$8a,$c9,$a2,$bd,$ab,$c2,$d6,$f6,$56,$fe,$1e,$b3,$1a,$7e,$d3,$13,$c6,$1d,$9c
 db $00,$0b,$b9,$1f,$31,$6e,$4f,$39,$e0,$8c,$9c,$63,$1d,$ab,$5a,$8a,$28,$a2,$8a,$28,$a2,$b8,$3f,$11,$f8,$03,$cf,$9a,$5b,$bd,$19,$a3
 db $8c,$b7,$cc,$6d,$5b,$85,$cf,$39,$da,$7b,$67,$8e,$0f,$1c,$9e,$40,$e2,$b8,$7d,$4b,$4a,$be,$d2,$a6,$11,$5f,$db,$49,$03,$1f,$ba,$5b
 db $95,$6e,$9d,$08,$e0,$f5,$1d,$2a,$9d,$15,$a5,$a4,$6b,$da,$8e,$8b,$26,$eb,$2b,$86,$54,$27,$2d,$13,$72,$8d,$d3,$39,$1e,$f8,$03,$23
 db $07,$1d,$eb,$d1,$3c,$37,$e3,$6b,$4d,$59,$92,$da,$f0,$2d,$a5,$e3,$10,$aa,$32,$4a,$4a,$71,$d8,$f6,$e7,$b1,$f5,$18,$26,$ba,$aa,$28
 db $a2,$8a,$28,$a2,$8a,$e6,$7e,$20,$5b,$d9,$49,$e1,$b9,$65,$bb,$da,$b2,$c4,$47,$d9,$df,$03,$76,$f2,$47,$03,$91,$d4,$75,$f6,$19,$c1
 db $c5,$79,$2d,$15,$d6,$78,$17,$c4,$9f,$d9,$57,$9f,$60,$ba,$78,$d6,$c6,$e1,$f2,$5d,$b8,$f2,$df,$18,$07,$3e,$87,$00,$1c,$f4,$eb,$c7
 db $39,$f5,$4a,$28,$a2,$8a,$28,$a2,$8a,$2b,$8f,$f8,$9d,$ff,$00,$22,$f5,$bf,$fd,$7d,$af,$fe,$80,$f5,$e5,$f4,$51,$45,$7a,$47,$82,$bc
 db $61,$f6,$bf,$2f,$4c,$d5,$64,$ff,$00,$48,$fb,$b0,$ce,$c7,$fd,$67,$a2,$b1,$fe,$f7,$a1,$ef,$f5,$eb,$dc,$51,$45,$14,$51,$45,$36,$49
 db $12,$28,$da,$49,$1d,$51,$10,$16,$66,$63,$80,$a0,$75,$24,$d7,$8f,$f8,$bb,$c4,$0f,$af,$6a,$5f,$26,$d1,$69,$6e,$59,$60,$00,$7d,$e0
 db $4f,$2c,$73,$cf,$38,$1c,$76,$fc,$c9,$c1,$a2,$8a,$f5,$4f,$02,$f8,$93,$fb,$56,$cf,$ec,$17,$4f,$23,$5f,$5b,$a6,$4b,$b7,$3e,$62,$67
 db $00,$e7,$d4,$64,$03,$9e,$bd,$79,$e7,$1d,$65,$14,$51,$45,$14,$51,$45,$71,$ff,$00,$13,$bf,$e4,$5e,$b7,$ff,$00,$af,$b5,$ff,$00,$d0
 db $1e,$bc,$be,$8a,$f4,$2d,$0b,$c2,$5a,$76,$b9,$e1,$2b,$39,$a4,$56,$82,$ec,$87,$1e,$7c,$7d,$f0,$ee,$06,$e1,$d0,$f6,$f4,$3c,$01,$9a
 db $e4,$f5,$cf,$0e,$6a,$3a,$13,$29,$bc,$89,$4c,$4c,$76,$ac,$d1,$9d,$c8,$c7,$19,$c7,$a8,$fc,$40,$e8,$71,$59,$71,$c8,$f1,$48,$b2,$46
 db $ec,$8e,$84,$32,$b2,$9c,$15,$23,$a1,$06,$bd,$cb,$47,$bd,$fe,$d1,$d2,$2d,$2f,$0b,$46,$5a,$68,$95,$9f,$cb,$3f,$28,$6c,$7c,$c0,$7d
 db $0e,$47,$e1,$57,$28,$a2,$8a,$28,$ae,$0f,$e2,$17,$89,$3c,$a5,$6d,$1a,$cd,$e4,$59,$4e,$0d,$cb,$8e,$06,$d2,$33,$b3,$df,$39,$04,$e3
 db $b7,$1c,$e4,$81,$e7,$74,$51,$45,$58,$b0,$bd,$9b,$4e,$be,$86,$f2,$dd,$b1,$2c,$2e,$19,$79,$38,$3e,$c7,$1d,$8f,$43,$ec,$6b,$da,$b4
 db $6d,$52,$0d,$63,$4d,$86,$f2,$dd,$97,$0e,$06,$f4,$07,$3e,$5b,$e3,$95,$3f,$4f,$d7,$af,$7a,$bd,$45,$14,$51,$54,$f4,$8d,$42,$3d,$57
 db $4b,$b7,$be,$88,$61,$66,$4c,$95,$fe,$e9,$e8,$47,$41,$9c,$10,$46,$7d,$aa,$e5,$15,$c7,$fc,$4e,$ff,$00,$91,$7a,$df,$fe,$be,$d7,$ff
 db $00,$40,$7a,$f2,$fa,$2b,$d8,$3c,$09,$ff,$00,$22,$85,$8f,$fd,$b4,$ff,$00,$d1,$8d,$5b,$57,$76,$b0,$5f,$5a,$c9,$6d,$75,$12,$cb,$0c
 db $83,$0c,$8d,$df,$fc,$fa,$d7,$8d,$f8,$9b,$46,$3a,$16,$b1,$25,$a0,$66,$78,$88,$0f,$13,$b6,$32,$c8,$7d,$71,$e8,$41,$1d,$ba,$67,$1c
 db $d7,$6d,$f0,$c6,$f7,$cd,$d2,$2e,$ac,$d9,$a4,$2d,$6f,$28,$61,$b8,$fc,$a1,$58,$70,$07,$e2,$ac,$7f,$1a,$ed,$28,$a2,$8a,$2b,$1f,$c4
 db $fa,$ec,$7a,$0e,$96,$d3,$e6,$36,$b9,$7f,$96,$08,$98,$fd,$f3,$dc,$f1,$d8,$75,$3f,$96,$46,$45,$78,$cc,$92,$3c,$b2,$34,$92,$3b,$3b
 db $b9,$2c,$cc,$c7,$25,$89,$ea,$49,$a6,$d1,$45,$14,$57,$45,$e0,$ef,$11,$be,$87,$a8,$08,$e7,$95,$bf,$b3,$e6,$3f,$bd,$5c,$6e,$da,$71
 db $c3,$01,$f9,$67,$d4,$76,$24,$0a,$f5,$ea,$28,$a2,$8a,$f3,$bf,$86,$fa,$eb,$24,$c7,$45,$9c,$e5,$1f,$74,$90,$31,$24,$90,$7a,$95,$f4
 db $c6,$01,$3d,$b9,$cf,$5c,$d7,$a2,$51,$5c,$7f,$c4,$ef,$f9,$17,$ad,$ff,$00,$eb,$ed,$7f,$f4,$07,$af,$2f,$a2,$bd,$83,$c0,$9f,$f2,$28
 db $58,$ff,$00,$db,$4f,$fd,$18,$d5,$d0,$57,$9e,$fc,$53,$8d,$04,$9a,$64,$81,$14,$3b,$09,$14,$b6,$39,$20,$6d,$c0,$cf,$b6,$4f,$e6,$6a
 db $4f,$85,$91,$b8,$8f,$53,$90,$a3,$04,$63,$1a,$86,$c7,$04,$8d,$d9,$19,$f6,$c8,$fc,$c5,$77,$d4,$51,$45,$47,$71,$3c,$76,$d6,$f2,$dc
 db $4c,$db,$62,$89,$0b,$bb,$63,$38,$00,$64,$9e,$2b,$c6,$7c,$49,$ae,$4f,$ae,$ea,$4f,$3c,$8e,$de,$42,$12,$20,$8c,$8c,$6c,$4c,$fa,$7a
 db $9e,$32,$7f,$a0,$15,$93,$45,$14,$51,$45,$15,$e9,$1f,$0f,$7c,$47,$f6,$98,$57,$46,$ba,$ff,$00,$5b,$0a,$13,$04,$85,$be,$fa,$8f,$e1
 db $e4,$f5,$1d,$b1,$d8,$76,$c7,$3d,$c5,$14,$51,$5e,$03,$24,$6f,$14,$8d,$1c,$88,$c8,$e8,$4a,$b2,$b0,$c1,$52,$3a,$82,$2b,$d1,$bc,$25
 db $e3,$75,$ba,$cd,$a6,$b7,$34,$71,$cd,$c9,$4b,$96,$c2,$2b,$8f,$46,$e8,$01,$f4,$3d,$0f,$d7,$af,$71,$5c,$7f,$c4,$ef,$f9,$17,$ad,$ff
 db $00,$eb,$ed,$7f,$f4,$07,$af,$2f,$a2,$bd,$83,$c0,$9f,$f2,$28,$58,$ff,$00,$db,$4f,$fd,$18,$d5,$d0,$57,$94,$fc,$42,$d5,$d3,$51,$d6
 db $d6,$da,$07,$66,$8a,$cc,$18,$c8,$2b,$8f,$de,$67,$e6,$c7,$73,$d1,$47,$e1,$c7,$a9,$ec,$bc,$01,$65,$f6,$4f,$0b,$c0,$c5,$64,$57,$b8
 db $76,$99,$83,$8c,$75,$38,$18,$f6,$2a,$a0,$fe,$35,$d2,$51,$45,$15,$e6,$ff,$00,$10,$bc,$47,$f6,$99,$9b,$46,$b5,$ff,$00,$55,$0b,$83
 db $3c,$81,$be,$fb,$0f,$e1,$e0,$f4,$1d,$f3,$dc,$76,$c7,$3c,$3d,$14,$51,$45,$14,$51,$52,$5b,$cf,$25,$b5,$c4,$57,$10,$b6,$d9,$62,$70
 db $e8,$d8,$ce,$08,$39,$07,$9a,$f6,$8f,$0e,$6b,$31,$eb,$9a,$44,$57,$69,$c4,$83,$e4,$99,$76,$e0,$2c,$80,$0c,$81,$ed,$ce,$47,$3d,$0f
 db $ad,$6a,$51,$45,$78,$3e,$a0,$bb,$35,$1b,$95,$db,$b7,$12,$b8,$db,$b7,$6e,$39,$3c,$63,$6a,$e3,$e9,$b4,$7d,$07,$4a,$af,$5d,$67,$86
 db $3c,$6d,$71,$a5,$6d,$b6,$d4,$0c,$97,$36,$2a,$9b,$50,$28,$1b,$e3,$c7,$4c,$13,$8c,$8e,$d8,$27,$8e,$31,$d3,$07,$73,$e2,$05,$f5,$ae
 db $a3,$e1,$5b,$6b,$8b,$29,$e3,$9e,$23,$76,$bf,$32,$1c,$e0,$ec,$63,$83,$e8,$79,$1c,$1e,$6b,$cd,$e8,$af,$60,$f0,$27,$fc,$8a,$16,$3f
 db $f6,$d3,$ff,$00,$46,$35,$65,$f8,$ab,$c6,$d6,$b6,$f6,$f3,$59,$69,$72,$79,$f7,$2e,$9b,$7c,$f8,$db,$e4,$8c,$11,$c9,$0c,$0f,$2c,$3d
 db $b8,$19,$eb,$c6,$2b,$89,$f0,$de,$87,$3e,$bb,$a9,$24,$11,$a3,$79,$08,$41,$9e,$40,$71,$b1,$33,$eb,$ea,$79,$c0,$fe,$80,$d7,$b4,$47
 db $1a,$45,$1a,$c7,$1a,$2a,$22,$00,$aa,$aa,$30,$14,$0e,$80,$0a,$75,$14,$57,$3f,$e3,$2d,$7f,$fb,$0b,$4b,$fd,$cb,$62,$f2,$e3,$2b,$06
 db $57,$20,$63,$1b,$98,$f6,$e0,$1f,$cc,$8e,$08,$cd,$78,$fd,$14,$51,$45,$14,$51,$45,$15,$b1,$e1,$8d,$76,$4d,$07,$54,$59,$f3,$23,$5b
 db $3f,$cb,$3c,$4a,$7e,$f8,$ec,$79,$ee,$3a,$8f,$cb,$23,$26,$bd,$9a,$39,$12,$58,$d6,$48,$dd,$5d,$1c,$06,$56,$53,$90,$c0,$f4,$20,$d3
 db $a8,$af,$3f,$f0,$ef,$83,$ed,$ee,$35,$9b,$eb,$cb,$98,$ff,$00,$d0,$6d,$ee,$e4,$8e,$de,$06,$04,$87,$da,$c4,$64,$93,$d5,$47,$4e,$f9
 db $20,$e7,$a6,$0f,$61,$36,$85,$a4,$cf,$0f,$95,$26,$9b,$68,$50,$21,$45,$c4,$4a,$0a,$83,$93,$80,$40,$c8,$e4,$93,$c7,$73,$9a,$e5,$f5
 db $9f,$87,$76,$f3,$66,$4d,$22,$6f,$b3,$bf,$fc,$f1,$94,$96,$43,$d3,$a3,$72,$47,$73,$ce,$7f,$0a,$e1,$75,$1d,$1b,$51,$d2,$d8,$8b,$eb
 db $39,$61,$00,$85,$de,$57,$28,$49,$19,$c0,$61,$c1,$e3,$d0,$d5,$1a,$2b,$42,$3b,$ed,$52,$f6,$ce,$1d,$26,$09,$27,$96,$05,$dd,$b2,$da
 db $25,$fb,$dc,$ee,$39,$03,$96,$e4,$67,$9c,$e2,$ba,$2d,$03,$c0,$17,$77,$8c,$b3,$6a,$c5,$ad,$2d,$c8,$cf,$96,$a4,$79,$ad,$c0,$c7,$62
 db $17,$af,$7e,$78,$c6,$3b,$d7,$a2,$69,$da,$75,$a6,$97,$6a,$2d,$ac,$60,$58,$62,$04,$b6,$01,$27,$24,$f7,$24,$f2,$7f,$1a,$b5,$45,$15
 db $5e,$fe,$f6,$1d,$3a,$c6,$6b,$cb,$86,$c4,$50,$a1,$66,$e4,$64,$fb,$0c,$f7,$3d,$07,$b9,$af,$15,$d6,$75,$49,$f5,$8d,$4a,$6b,$cb,$86
 db $6c,$b9,$3b,$10,$9c,$f9,$69,$9e,$14,$7d,$3f,$5e,$bd,$ea,$8d,$14,$51,$45,$14,$51,$45,$14,$57,$79,$f0,$f7,$c4,$9e,$53,$2e,$8d,$78
 db $f1,$ac,$47,$26,$d9,$cf,$07,$71,$39,$d9,$ef,$9c,$92,$33,$df,$8e,$72,$00,$f4,$4a,$28,$a2,$8a,$e3,$fe,$27,$7f,$c8,$bd,$6f,$ff,$00
 db $5f,$6b,$ff,$00,$a0,$3d,$79,$7d,$15,$eb,$9e,$01,$82,$18,$fc,$2d,$6b,$32,$45,$1a,$cb,$2e,$ff,$00,$31,$d5,$40,$67,$c3,$b0,$19,$3d
 db $f1,$5d,$25,$14,$51,$45,$79,$5f,$8e,$bc,$49,$fd,$ab,$79,$f6,$0b,$57,$8d,$ac,$6d,$df,$21,$d7,$9f,$31,$f1,$82,$73,$e8,$32,$40,$c7
 db $5e,$bc,$f1,$8e,$4e,$8a,$28,$a2,$8a,$28,$a2,$8a,$28,$a7,$47,$23,$c5,$22,$c9,$1b,$b2,$3a,$10,$ca,$ca,$70,$54,$8e,$84,$1a,$f6,$2f
 db $09,$6b,$ab,$ae,$e9,$0b,$23,$9c,$5d,$43,$88,$e7,$04,$8c,$93,$8f,$bd,$81,$d0,$1f,$a0,$e7,$23,$b5,$6e,$51,$45,$15,$c7,$fc,$4e,$ff
 db $00,$91,$7a,$df,$fe,$be,$d7,$ff,$00,$40,$7a,$f2,$fa,$2b,$d8,$3c,$09,$ff,$00,$22,$85,$8f,$fd,$b4,$ff,$00,$d1,$8d,$5d,$05,$14,$51
 db $5c,$9f,$8e,$bc,$49,$fd,$95,$67,$f6,$0b,$57,$91,$6f,$ae,$13,$21,$d7,$8f,$2d,$33,$82,$73,$ea,$70,$40,$c7,$4e,$bc,$71,$9f,$2b,$a2
 db $8a,$28,$a2,$8a,$28,$a2,$8a,$28,$a2,$b4,$34,$2d,$5a,$6d,$13,$54,$8a,$f6,$11,$bf,$6e,$43,$c6,$58,$80,$ea,$7a,$83,$8f,$cf,$ea,$01
 db $af,$6a,$b4,$ba,$82,$fa,$d6,$3b,$9b,$59,$56,$58,$64,$19,$57,$5e,$ff,$00,$e7,$d2,$a6,$a2,$8a,$f3,$7f,$89,$9a,$9c,$73,$de,$5b,$e9
 db $d1,$49,$26,$eb,$6c,$bc,$cb,$d1,$72,$c0,$6d,$fa,$90,$33,$ff,$00,$7d,$7d,$6b,$87,$a2,$bd,$23,$e1,$9e,$a7,$1b,$d8,$cf,$a6,$3c,$92
 db $19,$e3,$73,$32,$2b,$72,$a2,$33,$80,$71,$e9,$f3,$73,$8f,$f6,$be,$b5,$dc,$51,$45,$51,$d6,$75,$48,$34,$7d,$36,$6b,$cb,$86,$5c,$20
 db $3b,$10,$9c,$79,$8f,$8e,$14,$7d,$7f,$4e,$bd,$ab,$c5,$6f,$ef,$66,$d4,$6f,$a6,$bc,$b8,$6c,$cb,$33,$96,$6e,$4e,$07,$b0,$cf,$61,$d0
 db $7b,$0a,$af,$45,$14,$51,$45,$14,$51,$45,$14,$51,$45,$15,$d9,$78,$03,$c4,$6f,$65,$7a,$9a,$5d,$dc,$ac,$6d,$67,$3b,$61,$18,$ce,$c9
 db $09,$e0,$7b,$03,$fc,$f0,$78,$e4,$d7,$a7,$56,$2f,$89,$35,$7b,$fd,$2a,$38,$86,$9f,$a5,$4b,$7e,$f2,$87,$e5,$03,$11,$19,$18,$c6,$40
 db $07,$39,$cf,$a8,$e9,$5c,$4e,$a7,$ab,$78,$cb,$51,$da,$3e,$c5,$7d,$6a,$8b,$8f,$96,$d6,$de,$44,$c9,$e7,$92,$7a,$f7,$e9,$9c,$70,$38
 db $ae,$7f,$fb,$0b,$58,$ff,$00,$a0,$55,$f7,$fe,$03,$bf,$f8,$51,$fd,$85,$ac,$7f,$d0,$2a,$fb,$ff,$00,$01,$df,$fc,$28,$fe,$c2,$d6,$3f
 db $e8,$15,$7d,$ff,$00,$80,$ef,$fe,$14,$e8,$f4,$5d,$6e,$29,$16,$48,$f4,$cd,$41,$1d,$08,$65,$65,$81,$c1,$52,$3a,$10,$71,$5d,$16,$9b
 db $ad,$f8,$cb,$4f,$84,$c4,$74,$fb,$bb,$b5,$fe,$13,$73,$6b,$23,$32,$f5,$ee,$30,$4f,$5e,$f9,$e8,$31,$5d,$d6,$85,$a9,$5c,$ea,$96,$4f
 db $3d,$de,$9d,$2d,$83,$ac,$85,$04,$52,$e7,$24,$60,$1d,$dc,$81,$eb,$8f,$c2,$b4,$ab,$c8,$7c,$63,$e2,$37,$d7,$35,$03,$1c,$12,$b7,$f6
 db $7c,$27,$f7,$4b,$8d,$bb,$8e,$39,$62,$3f,$3c,$7a,$0e,$c0,$93,$5c,$ed,$14,$51,$45,$14,$51,$45,$14,$51,$45,$14,$51,$45,$7a,$c7,$81
 db $fc,$47,$fd,$b3,$62,$6d,$6e,$38,$bc,$b5,$45,$0c,$c5,$b2,$65,$5e,$9b,$b9,$39,$cf,$af,$b9,$1e,$b8,$1d,$45,$14,$51,$45,$14,$51,$5c
 db $3f,$c4,$2f,$11,$fd,$9a,$16,$d1,$ad,$7f,$d6,$cc,$80,$cf,$20,$6f,$b8,$a7,$f8,$78,$3d,$4f,$7c,$f6,$3d,$f3,$c7,$9b,$d1,$45,$14,$51
 db $45,$14,$51,$45,$14,$51,$45,$14,$51,$56,$b4,$cd,$42,$7d,$2f,$50,$86,$f6,$d4,$a8,$96,$23,$91,$b8,$64,$1c,$8c,$10,$7e,$a0,$91,$5e
 db $d9,$a6,$6a,$10,$6a,$9a,$7c,$37,$b6,$a5,$8c,$52,$8c,$8d,$c3,$04,$60,$e0,$83,$f4,$20,$8a,$b5,$45,$14,$51,$45,$65,$f8,$8f,$59,$8f
 db $43,$d2,$25,$bb,$7e,$64,$3f,$24,$2b,$b7,$21,$a4,$20,$e0,$1f,$6e,$32,$79,$e8,$3d,$6b,$c5,$ee,$27,$92,$e6,$e2,$5b,$89,$9b,$74,$b2
 db $b9,$77,$6c,$63,$24,$9c,$93,$c5,$47,$45,$14,$51,$45,$14,$51,$45,$14,$51,$45,$14,$51,$45,$15,$d3,$78,$23,$c4,$27,$47,$d4,$85,$bd
 db $c3,$b7,$d8,$ae,$48,$56,$05,$80,$58,$dc,$90,$03,$f3,$f9,$1e,$9c,$73,$ce,$05,$7a,$d5,$14,$51,$45,$36,$49,$12,$28,$da,$49,$1d,$51
 db $10,$16,$66,$63,$80,$a0,$75,$24,$d7,$8c,$f8,$9f,$5d,$93,$5e,$d5,$1a,$7c,$c8,$b6,$c9,$f2,$c1,$13,$1f,$b8,$3b,$9e,$3b,$9e,$a7,$f2
 db $c9,$c0,$ac,$7a,$28,$a2,$8a,$28,$a2,$8a,$28,$a2,$8a,$28,$a2,$8a,$28,$a2,$8a,$f4,$cf,$00,$78,$93,$ed,$b6,$e3,$4a,$bc,$78,$d6,$78
 db $10,$08,$0f,$43,$22,$01,$d3,$1d,$32,$a0,$0f,$a8,$fa,$13,$5d,$a5,$14,$51,$5e,$77,$f1,$0b,$c4,$9e,$6b,$36,$8d,$66,$f1,$b4,$43,$06
 db $e5,$c7,$27,$70,$39,$d9,$ed,$8c,$02,$71,$df,$8e,$30,$41,$e0,$e8,$a2,$8a,$28,$a2,$8a,$28,$a2,$8a,$28,$a2,$8a,$28,$a2,$8a,$28,$a9
 db $ad,$2e,$a7,$b1,$ba,$8e,$e6,$d6,$56,$8a,$68,$ce,$55,$d7,$b7,$f9,$f4,$af,$6a,$d0,$b5,$68,$75,$bd,$2e,$2b,$d8,$46,$cd,$d9,$0f,$19
 db $60,$4a,$30,$ea,$0e,$3f,$3f,$a1,$06,$b4,$28,$ac,$3f,$16,$eb,$ab,$a1,$69,$0d,$22,$1c,$dd,$4d,$98,$e0,$00,$8c,$83,$8f,$bd,$83,$d4
 db $0f,$a1,$e7,$03,$bd,$78,$ec,$92,$3c,$b2,$34,$92,$3b,$3b,$b9,$2c,$cc,$c7,$25,$89,$ea,$49,$a6,$d1,$45,$14,$51,$45,$14,$51,$45,$14
 db $51,$45,$14,$51,$45,$14,$51,$45,$6e,$78,$4b,$5d,$6d,$0b,$57,$59,$1c,$e6,$d6,$6c,$47,$38,$24,$e0,$0c,$fd,$ec,$0e,$a4,$7d,$0f,$19
 db $1d,$eb,$d8,$a3,$91,$25,$8d,$64,$8d,$d5,$d1,$c0,$65,$65,$39,$0c,$0f,$42,$0d,$47,$77,$75,$05,$8d,$ac,$97,$37,$52,$ac,$50,$c6,$32
 db $ce,$dd,$bf,$cf,$a5,$78,$ae,$bb,$ab,$4d,$ad,$ea,$92,$de,$cc,$36,$6e,$c0,$48,$c3,$12,$11,$47,$40,$33,$f9,$fd,$49,$35,$9f,$45,$14
 db $51,$45,$14,$51,$45,$14,$51,$45,$14,$51,$45,$14,$51,$45,$14,$51,$5e,$85,$f0,$f3,$c4,$6f,$23,$0d,$1a,$f6,$56,$72,$07,$fa,$29,$23
 db $3c,$00,$49,$52,$7d,$80,$c8,$fc,$46,$7a,$0a,$cf,$f1,$ff,$00,$88,$de,$f6,$f5,$f4,$bb,$49,$58,$5a,$c0,$76,$cc,$31,$8d,$f2,$03,$c8
 db $f7,$03,$f9,$e4,$f3,$c1,$ae,$36,$8a,$28,$a2,$8a,$28,$a2,$8a,$28,$a2,$8a,$28,$a2,$8a,$28,$a2,$8a,$28,$a2,$8a,$74,$72,$3c,$52,$2c
 db $91,$bb,$23,$a1,$0c,$ac,$a7,$05,$48,$e8,$41,$a6,$d1,$45,$14,$51,$45,$14,$51,$45,$14,$51,$45,$14,$51,$45,$14,$51,$45,$14,$51,$45
 db $14,$51,$45,$14,$51,$45,$14,$51,$45,$14,$51,$5f,$ff,$d9
_StrConst60 db "c:\nb\TM-300H.JPG",0
_StrConst61 db "Verdana",0
_StrConst62 db "Ino-Toyo Server        <",0
_StrConst63 db ">",0
_StrConst64 db "Server Config",0
_StrConst65 db "Program Must Be Restarted",0
_StrConst66 db "vb",0
_StrConst67 db "Lock",0
_StrConst68 db "Lock System",0
_StrConst69 db "Unlock",0
_StrConst70 db "Unlock System",0
!PasswordWindowWindowClass WNDCLASS
!PasswordWindowClass db 'PasswordWindow',0
_StrConst71 db "Password",0
_StrConst72 db "Submit",0
_StrConst73 db "Configure System",0
_StrConst74 db "COM",0
_StrConst75 db "$",0
_StrConst76 db "_InoHost",0
_StrConst77 db "View Log",0
_StrConst78 db "View Stats",0
_StrConst79 db "View Data",0
_StrConst80 db "IDLE",0
_StrConst81 db "OFF",0
_StrConst82 db "MAN",0
_StrConst83 db "SEMI",0
_StrConst84 db "AUTO",0
_StrConst85 db "RUN",0
_StrConst86 db "Error",0
_StrConst87 db "No Communication",0
_StrConst88 db "Machine ",0
_StrConst89 db " Alarm",0
_StrConst90 db "Machine ",0
_StrConst91 db " Mode",0
_StrConst92 db ".",0
_StrConst93 db "Machine ",0
_StrConst94 db " Shot",0
_StrConst95 db "CurrentShot",0
_StrConst96 db "File Error",0
_StrConst97 db "A File Error Has Occurred",0
_StrConst98 db "COM",0
_StrConst99 db "Server Error",0
_StrConst100 db "System Comm Not Configured",0
_StrConst101 db "COM",0
_StrConst102 db "Server Error",0
_StrConst103 db "System Comm Not Configured",0
_StrConst104 db "AlarmFile",0
_StrConst105 db "ModeFile",0
_StrConst106 db "ShotFile1",0
_StrConst107 db "0000000",0
_StrConst108 db "000000",0
_StrConst109 db "00000",0
_StrConst110 db "0000",0
_StrConst111 db "000",0
_StrConst112 db "00",0
_StrConst113 db "0",0
!ObjectCount dd 143
; End of Initialized Data Section
;________________________________________________________________________________________________________________________________

; Start of Uninitialized Data Section


align 4

; Timer Event Dispatch Vectors
!Timer rd !Timers

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
_AccLo rd 1
_AccHi rd 1
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
!PassEvent rb 1
AltKey rb 1

; COMM DCB Structure
!DCBlengthOffs equ 0; rd 1
!BaudRateOffs equ 4; rd 1
!fBitsOffs equ 8; rd 1
!fBinaryBit equ 0
!fParityBit equ 1
!fOutxCtsFlowBit equ 2
!fOutxDsrFlowBit equ 3
!fDtrControlLoBit equ 4
!fDtrControlHiBit equ 5
!fDsrSensitivityBit equ 6
!fTXContinueOnXoffBit equ 7
!fOutXBit equ 8
!fInXBit equ 9
!fErrorCharBit equ 10
!fNullBit equ 11
!fRtsControlLoBit equ 12
!fRtsControlHiBit equ 13
!fAbortOnErrorBit equ 14
!wReservedOffs equ 12; rw 1
!XonLimOffs equ 14; rw 1
!XoffLimOffs equ 16; rw 1
!ByteSizeOffs equ 18; rb 1
!ParityOffs equ 19;  rb 1
!StopBitsOffs equ 20; rb 1
!XonCharOffs equ 21; rb 1
!XoffCharOffs equ 22; rb 1
!ErrorCharOffs equ 23; rb 1
!EofCharOffs equ 24; rb 1
!EvtCharOffs equ 25; rb 1
!wReserved1Offs equ 26; rw 1
!HandleOffs equ 28; rd 1
!StatusOffs equ 32; rd 1
!ArrayOffs equ 36; rd 1
!CommReserved1Offs equ 40; rb 1
!CommReserved2Offs equ 41; rb 1
!CommReserved3Offs equ 42; rb 1
!CommReserved4Offs equ 43; rb 1
!UserBaudRateOffs equ 44; rd 1
!UserParityOffs equ 48; rb 1
!UserByteSizeOffs equ 49; rb 1
!UserStopBitsOffs equ 50; rb 1
!UserRTSOffs equ 51; rb 1
!UserDSRCheckOffs equ 52; rb 1
!UserParityCheckOffs equ 53; rb 1
!UserDTROffs equ 54; rb 1
!UserCTSCheckOffs equ 55; rb 1
!PortNameOffs equ 56; rb 32
!CommStatusOffs equ 88; rd 1
!cbInQueOffs equ 92; rd 1
!cbOutQueOffs equ 96; rd 1

align 4

;_SYSTEMTIME Structure
wYear rw 1 
wMonth rw 1 
wDayOfWeek rw 1 
wDay rw 1 
wHour rw 1 
wMinute rw 1 
wSecond rw 1 
wMilliseconds rw 1

;_FILETIME Structures
!dwLowDateTime1 rd 1
!dwHighDateTime1 rd 1
!dwLowDateTime2 rd 1
!dwHighDateTime2 rd 1


; RAGrid Column Structure

align 4

gc_colwt rd 1
gc_lpszhdrtext rd 1
gc_halign rd 1
gc_calign rd 1
gc_ctype rd 1
gc_ctextmax rd 1
gc_lpszformat rd 1
gc_himl rd 1
gc_hdrflag rd 1
gc_colxp rd 1
gc_edthwnd rd 1

; RAGrid rowcol Structure
rc_backcolor rd 1
rc_textcolor rd 1

CursorPosX rd 1
CursorPosY rd 1

Rect: ;Structure
RectLeft rd 1
RectTop rd 1
RectRight rd 1
RectBottom rd 1

!ToolTip rd 1

; Paint Structure
PaintStruct rd 16

!TargetGUIDesc rd 1
!SourceGUIDesc rd 1

; RAGrid 
GridRow rd 1
GridCol rd 1

;TC_ITEM structure
!TC_ITEMmask rd 1
!TC_ITEMState rd 1
!TC_ITEMStateMask rd 1
!TC_ITEMText rd 1
!TC_ITEMTextMax rd 1
!TC_ITEMImage rd 1
!TC_ITEMlParam rd 1

; RAEdit Vars
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

!from equ 0; rd 1
!to equ 4; rd 1

; _TBBUTTON Structure
!iBitmap equ 0; rd 1
!idCommand equ 4; rd 1
!fsState equ 8; rb 1
!fsStyle equ 9; rb 1
!dwData equ 10; rd 1
!iString equ 14; rd 1

!CursorFlag rb 1

align 4

!Brush rd 1
!Desc rd 1
NMHDR rd 1
!dsStatus rd 1
ArrayIndex rd 1
!dsBackColor rd 1
!dsForeColor rd 1
!dsControlType rd 1

!CT_FORM equ 100
!CT_BUTTON equ 101
!CT_STATICICON equ 102
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
!CT_ANIMATE equ 114
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
!CT_STATICTEXT equ 125
!CT_ICONBUTTON equ 126
!CT_RECTANGLE equ 127
!CT_OBCOMM equ 128
!CT_DRAWPROGRESS equ 129
!CT_SCROLLBAR equ 130
!CT_DATETIMEPICK equ 131
!CT_IMAGE equ 132
!CT_SPRSHT equ 133
!CT_ButtonEx equ 134
; LN:6 Type CurrentProdType; Used to represent current data as blocks in CurrentProdFile
; LN:35 DIM CurrentProd AS CurrentProdType; Instance of CurrentProdType
align 4
CurrentProd rb 17357
; LN:37 TYPE ConfigType
; LN:46 DIM ConfigData AS ConfigType
align 4
ConfigData rb 157
; LN:48 TYPE CurrentShotType ; Used to represent current shot (dynamic) data
; LN:67 DIM CurrentShot As CurrentShotType
align 4
CurrentShot rb 7599
; LN:69 TYPE ToyoShotData; Used to represent shot data in MachShotFile
; LN:74 DIM MachShotData(16) As ToyoShotData
align 4
MachShotData rb 4240
; LN:76 TYPE ToyoModeData; Used to represent mode data in MachModeFile
; LN:80 DIM MachModeData(16) As ToyoModeData
align 4
MachModeData rb 80
; LN:82 TYPE ToyoAlarmData; Used to represent alarm data in MachAlarmFile
; LN:86 DIM MachAlarmData(16) As ToyoAlarmData
align 4
MachAlarmData rb 96
; LN:89 DIM MacAddr(16) AS LONG
align 4
MacAddr rd 16
align 4
; LN:90 DIM SrcMacAddr AS LONG
SrcMacAddr rd 1
align 4
; LN:92 DIM RawSync AS LONG
RawSync rd 1
align 4
; LN:93 DIM RawData AS LONG
RawData rd 1
align 4
; LN:94 DIM LowLength AS LONG
LowLength rd 1
align 4
; LN:95 DIM HighLength As LONG
HighLength rd 1
align 4
; LN:96 DIM MsgLength AS LONG
MsgLength rd 1
align 4
; LN:97 DIM StartMsgLength AS LONG
StartMsgLength rd 1
; LN:98 DIM InitStr1(4) AS BYTE
align 4
InitStr1 rb 4
; LN:99 DIM InitStr2(4) AS BYTE
align 4
InitStr2 rb 4
; LN:115 DIM lf As LOGFONT
align 4
lf rb 60
align 4
; LN:117 DIM GridFont AS FONT
GridFont rd 1
align 4
; LN:118 DIM BannerFont AS FONT
BannerFont rd 1
align 4
; LN:121 DIM DataGridRow AS LONG
DataGridRow rd 1
align 4
; LN:122 DIM DataGridCol AS LONG
DataGridCol rd 1
align 4
; LN:124 DIM StatsGridRow AS LONG
StatsGridRow rd 1
align 4
; LN:125 DIM StatsGridCol AS LONG
StatsGridCol rd 1
; LN:139 DIM TempAlarm AS BYTE
TempAlarm rb 1
; LN:140 DIM TempMode AS BYTE
TempMode rb 1
; LN:141 DIM Mode(16) AS BYTE
align 4
Mode rb 16
; LN:142 DIM MsgType(16) AS BYTE
align 4
MsgType rb 16
; LN:143 DIM DataField(16) AS LONG
align 4
DataField rd 16
; LN:144 DIM TempDataStr(16) AS STRING*10
TempDataStr rb 160
align 4
; LN:145 DIM I AS LONG
I rd 1
align 4
; LN:146 DIM J AS LONG
J rd 1
align 4
; LN:147 DIM K AS LONG
K rd 1
align 4
; LN:148 DIM LoopVar AS LONG
LoopVar rd 1
align 4
; LN:151 DIM TempInt AS LONG
TempInt rd 1
align 4
; LN:152 DIM TempInt2 AS LONG
TempInt2 rd 1
align 4
; LN:154 DIM TempValue AS LONG
TempValue rd 1
align 4
; LN:155 DIM Scanner AS LONG
Scanner rd 1
align 4
; LN:156 DIM DecimalPlaces AS LONG
DecimalPlaces rd 1
; LN:157 DIM DecimalFlag AS BOOLEAN
DecimalFlag rb 1
; LN:161 DIM OBComm1(16) AS OBCOMM
OBComm1 rb 1600
; LN:162 DIM CommBuf(4096) AS BYTE
align 4
CommBuf rb 4096
align 4
; LN:163 DIM RawCharCtr AS LONG
RawCharCtr rd 1
align 4
; LN:164 DIM CommNum AS LONG
CommNum rd 1
; LN:165 DIM Sync(16) AS LONG
align 4
Sync rd 16
; LN:166 DIM Preamble(16) AS LONG
align 4
Preamble rd 16
align 4
; LN:167 DIM FirstCommPort AS LONG
FirstCommPort rd 1
align 4
; LN:168 DIM LastCommPort AS LONG
LastCommPort rd 1
; LN:170 DIM CommByte AS BYTE
CommByte rb 1
; LN:171 DIM Wireless AS BOOLEAN
Wireless rb 1
; LN:172 DIM Locked AS BOOLEAN
Locked rb 1
; LN:174 DIM PasswordWindowConstructed AS BOOLEAN
PasswordWindowConstructed rb 1
align 4
; LN:178 DIM UserBMP AS BITMAP
UserBMP rd 1
align 4
; LN:179 DIM DefaultBMP AS BITMAP
DefaultBMP rd 1
align 4
; LN:180 DIM LampIndex AS LONG
LampIndex rd 1
; LN:187 DIM Shots(16) AS LONG
align 4
Shots rd 16
; LN:188 DIM Modes(16) AS LONG
align 4
Modes rd 16
; LN:189 DIM Alarms(16) AS LONG
align 4
Alarms rd 16
; LN:190 DIM Events(16) AS LONG
align 4
Events rd 16
; LN:191 DIM Bytes(16) AS LONG
align 4
Bytes rd 16
; LN:192 DIM Errors(16) AS LONG
align 4
Errors rd 16
; LN:193 DIM NeedConfig AS BOOLEAN
NeedConfig rb 1
; LN:194 DIM ConfigFlag AS BOOLEAN
ConfigFlag rb 1
; LN:195 DIM LogFlag AS BOOLEAN
LogFlag rb 1
; LN:196 DIM StatsFlag AS BOOLEAN
StatsFlag rb 1
; LN:197 DIM DataFlag AS BOOLEAN
DataFlag rb 1
; LN:199 DIM InoTimeSeed AS DATETIME
align 4
InoTimeSeed rb 16
; LN:200 DIM Now AS DATETIME
align 4
Now rb 16
; LN:201 DIM DateTimeTemp AS DATETIME
align 4
DateTimeTemp rb 16
align 4
; LN:202 DIM InoTime AS LONG
InoTime rd 1
align 4
; LN:206 DIM ConfigFile AS FILE
ConfigFile rd 1
align 4
; LN:207 DIM CommLogFile AS FILE
CommLogFile rd 1
align 4
; LN:208 DIM LogFile AS FILE
LogFile rd 1
align 4
; LN:209 DIM MachAlarmFile AS FILE
MachAlarmFile rd 1
align 4
; LN:210 DIM MachModeFile AS FILE
MachModeFile rd 1
align 4
; LN:211 DIM MachShotFile AS FILE
MachShotFile rd 1
align 4
; LN:212 DIM CurrentShotFile AS FILE
CurrentShotFile rd 1
align 4
; LN:213 DIM CurrentProdFile AS FILE
CurrentProdFile rd 1

;Temporary Variable
_Tmp1 rd 1

;Temporary Vector
_TmpVec1 rd 3

;Temporary Vector
_TmpVec2 rd 3

;For Loop Vector
_LopVec1 rd 2

;Temporary Vector
_TmpVec3 rd 3

;Temporary String Variable
_StrTmp1 rb 32

;Temporary Variable
_Tmp2 rd 1
!CommTask rd 1

;For Loop Vector
_LopVec2 rd 2

;For Loop Vector
_LopVec3 rd 2

;For Loop Vector
_LopVec4 rd 2

;For Loop Vector
_LopVec5 rd 2

;Temporary Vector
_TmpVec4 rd 3

;For Loop Vector
_LopVec6 rd 2
; End of Uninitialized Data Section
;________________________________________________________________________________________________________________________________

; Start of Control Descriptor Section
!OBMain rd 192
; LN:101 DIM CompanyNameBox AS TEXTBOX
!CompanyNameBox rd 192
; LN:102 DIM CompanyNameLabel AS STATICTEXT
!CompanyNameLabel rd 192
; LN:103 DIM ServerNameBox AS TEXTBOX
!ServerNameBox rd 192
; LN:104 DIM ServerNameLabel AS STATICTEXT
!ServerNameLabel rd 192
; LN:105 DIM PasswordBox AS TEXTBOX
!PasswordBox rd 192
; LN:106 DIM PasswordLabel AS STATICTEXT
!PasswordLabel rd 192
; LN:107 DIM WirelessCheckBox AS CHECKBOX
!WirelessCheckBox rd 192
; LN:108 DIM FirstPortCombo AS COMBOBOX
!FirstPortCombo rd 192
; LN:109 DIM FirstPortLabel AS STATICTEXT
!FirstPortLabel rd 192
; LN:110 DIM NumPortsCombo AS COMBOBOX
!NumPortsCombo rd 192
; LN:111 DIM NumPortsLabel AS STATICTEXT
!NumPortsLabel rd 192
; LN:112 DIM MacLabel AS STATICTEXT
!MacLabel rd 192
; LN:113 DIM MacGrid AS RAGRID
!MacGrid rd 192
; LN:114 DIM SaveConfigButton AS BUTTON
!SaveConfigButton rd 192
; LN:116 DIM ConfigBackground AS RECTANGLE
!ConfigBackground rd 192
; LN:119 DIM LogGrid AS RAGRID
!LogGrid rd 192
; LN:120 DIM DataGrid AS RAGRID
!DataGrid rd 192
; LN:123 DIM StatsGrid AS RAGRID
!StatsGrid rd 192
; LN:126 DIM AlarmTimeBox(16) AS TEXTBOX
!AlarmTimeBox rd 3072
; LN:127 DIM ModeTimeBox(16) AS TEXTBOX
!ModeTimeBox rd 3072
; LN:128 DIM ShotTimeBox(16) AS TEXTBOX
!ShotTimeBox rd 3072
; LN:129 DIM ModeLamp(16) AS STATICTEXT
!ModeLamp rd 3072
; LN:130 DIM ModeLabel(16) AS STATICTEXT
!ModeLabel rd 3072
; LN:131 DIM CommErrorLamp(16) AS STATICTEXT
!CommErrorLamp rd 3072
; LN:132 DIM CommMsgLamp(16) AS STATICTEXT
!CommMsgLamp rd 3072
; LN:133 DIM LockButton AS BUTTON
!LockButton rd 192
; LN:134 DIM ConfigButton AS BUTTON
!ConfigButton rd 192
; LN:135 DIM LogButton AS BUTTON
!LogButton rd 192
; LN:136 DIM StatsButton AS BUTTON
!StatsButton rd 192
; LN:137 DIM DataButton AS BUTTON
!DataButton rd 192
; LN:138 DIM ExitButton AS BUTTON
!ExitButton rd 192
; LN:159 DIM Banner AS STATICTEXT
!Banner rd 192
; LN:160 DIM MsgBanner AS STATICTEXT
!MsgBanner rd 192
; LN:173 DIM PasswordWindow AS TOOLWINDOW
!PasswordWindow rd 192
; LN:175 DIM PasswordText AS TEXTBOX
!PasswordText rd 192
; LN:176 DIM PasswordButton AS BUTTON
!PasswordButton rd 192
; LN:177 DIM MainImage AS IMAGE
!MainImage rd 192
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

invoke CreateWindowEx,0,!ToolTipClass,0,TTS_ALWAYSTIP,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,0,0,[!hinstance],0
mov dword [!ToolTip],eax
invoke InitCommonControlsEx,!icc
invoke LoadIcon,0,IDI_APPLICATION
mov [!OBMainWindowClass.hIcon],eax
invoke LoadCursor,0,IDC_ARROW
mov dword [!OBMain+CursorOffs],eax
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
mov dword [!OBMain+StatusOffs],0
mov dword [!OBMain+IDOffs],1
mov dword [!OBMain+ArrayOffs],0
mov dword [!OBMain+LeftOffs],0
mov dword [!OBMain+TopOffs],0
mov dword [!OBMain+WidthOffs],400
mov dword [!OBMain+HeightOffs],300
mov dword [!OBMain+ForeColorOffs],$ffffff
mov dword [!OBMain+BackColorOffs],$ffffffff
mov dword [!OBMain+TypeOffs],!CT_FORM
mov dword [!OBMain+ControlBrushOffs],0
invoke CreateWindowEx,0,!OBMainClass,!title,WS_VISIBLE+WS_OVERLAPPEDWINDOW,0,0,400,300,NULL,NULL,[!hinstance],!OBMain
invoke SetWindowLong,[!OBMain],GWL_USERDATA,!OBMain

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
mov ebx,[wmsg]
cmp [wmsg],WM_GETMINMAXINFO
jne NotwmGetMaxInfo
mov dword edi,[!hwnd]
mov dword [!OBMain+HandleOffs],edi
mov dword [!OBMain+OwnerOffs],0
mov dword [!OBMain+InterceptSafeOffs],!WindowProc
jmp !DefWndProc
NotwmGetMaxInfo:
mov esi,!OBMain
cmp ebx,WM_DESTROY
je !wmDestroy
!WinProcCommon:
cmp ebx,WM_SYSCOMMAND
je !wmSysCommand
cmp ebx,WM_SIZE
je !wmSize
cmp ebx,WM_MOVE
je !wmMove
cmp ebx,WM_TIMER
je !wmTimer
cmp ebx,WM_SETCURSOR
je !wmSetCursor
cmp ebx,WM_CREATE
je !wmCreate
cmp ebx,WM_PAINT
je !wmPaint
cmp ebx,WM_CONTEXTMENU
je !wmContextMenu
mov eax,[wparam]
mov [EventID],ax
shr eax,16
mov [EventNotify],ax
invoke GetWindowLong,[lparam],GWL_USERDATA
mov [!Desc],eax
cmp ebx,WM_CTLCOLORSTATIC
je !CtlColorChange
cmp ebx,WM_CTLCOLOREDIT
je !CtlColorChange
cmp ebx,WM_CTLCOLORBTN
je !CtlColorChange
cmp ebx,WM_CTLCOLORSCROLLBAR
je !CtlColorChange
cmp ebx,WM_CTLCOLORLISTBOX
je !CtlColorChange
cmp ebx,WM_CTLCOLORDLG
je !CtlColorChange
cmp ebx,WM_CTLCOLORMSGBOX
je !CtlColorChange
cmp ebx,WM_COMMAND
je !wmCommand
cmp ebx,WM_NOTIFY
je !wmNotify
cmp ebx,WM_HSCROLL
je !wmScroll
cmp ebx,WM_VSCROLL
je !wmScroll
cmp ebx,WM_CHAR
je !wmChar
cmp ebx,WM_SYSCHAR
je !wmSysChar
cmp ebx,WM_MOUSEMOVE
je !wmMouseMove
cmp ebx,WM_LBUTTONDOWN
je !wmLButtonDown
cmp ebx,WM_LBUTTONUP
je !wmLButtonUp
cmp ebx,WM_RBUTTONDOWN
je !wmRButtonDown
cmp ebx,WM_RBUTTONUP
je !wmRButtonUp
mov eax,[wmsg]
cmp [FindMsgID],eax
je !FindMsg

!DefWndProc:
invoke DefWindowProc,[!hwnd],[wmsg],[wparam],[lparam]
jmp !Finish

!wmSetCursor:
cmp [!CursorFlag],0
je !DefWndProc
mov eax,1
jmp !Finish

!wmSysCommand:
mov [!PassEvent],0
mov eax,[esi+evSysCommandOffs]
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
cmp [!PassEvent],0
jne !DefWndProc
xor eax,eax
jmp !Finish

!wmSize:; need to update RightOffs and BottomOffs
mov ecx,[lparam]
mov edx,ecx
and ecx,$ffff
shr edx,16
mov [esi+WidthOffs],ecx
mov [esi+HeightOffs],edx
mov eax,[esi+evResizeOffs]
or eax,eax
je !DefWndProc
mov edx,[wparam]
mov [STATUS],edx
call dword eax
xor eax,eax
jmp !Finish

!wmMove:; need to update RightOffs and BottomOffs
mov ecx,[lparam]
mov edx,ecx
and ecx,$ffff
shr edx,16
mov [esi+LeftOffs],ecx
mov [esi+TopOffs],edx
mov eax,[esi+evMoveOffs]
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
mov ebx,edx
shr ebx,16
mov [ArrayIndex],ebx
and edx,$0000ffff
cmp edx,$ffff
je !SysTimer
shl edx,2
add edx,!Timer
mov eax,[edx]
cmp eax,0
je !Finish
call dword eax
xor eax,eax
jmp !Finish

!SysTimer:
mov eax,[!Timer]
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
mov eax,[esi+ArrayOffs]
mov [ArrayIndex],eax
mov eax,[esi+TypeOffs]
mov [!dsControlType],eax
mov ecx,cdNotify32Offs+4; Points past last Notify Offs
add ecx,esi; Add Offs to base
add esi,evNotify1Offs; Points to first Notify Offs
!NotifyLoop:
cmp ebx,[esi+4]
jne !NotNotifyCode
mov eax,[esi]
cmp eax,0
jne !ProcNotify
jmp !DefWndProc
!NotNotifyCode:
add esi,8; Point to next Notify
cmp esi,ecx; Past last Notify?
jne !NotifyLoop; No, Try next
jmp !DefWndProc; Give up, no Notify match

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
jne !TabFolderCheck
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
jmp !NotifyDispatch
!TabFolderCheck:
cmp [!dsControlType],!CT_TABFOLDER
jne !DefWndProc
!NotifyDispatch:
jmp !CommandDispatch

!wmMouseMove:
call !GetMousePos
mov eax,[esi+evMouseMoveOffs]
or eax,eax
je !DefWndProc
call dword eax
xor eax,eax
jmp !Finish

!wmLButtonDown:
call !GetMousePos
invoke SetFocus, dword [esi]
mov eax,[esi+evLButtonDownOffs]
or eax,eax
je !DefWndProc
call dword eax
xor eax,eax
jmp !Finish

!wmLButtonUp:
call !GetMousePos
mov eax,[esi+evLButtonUpOffs]
or eax,eax
je !DefWndProc
call dword eax
xor eax,eax
jmp !Finish

!wmRButtonDown:
call !GetMousePos 
mov eax,[esi+evRButtonDownOffs]
or eax,eax
je !DefWndProc
call dword eax
xor eax,eax
jmp !Finish

!wmRButtonUp:
call !GetMousePos 
mov eax,[esi+evRButtonUpOffs]
or eax,eax
je !DefWndProc
call dword eax
xor eax,eax
jmp !Finish

!GetMousePos:
mov ebx,[lparam]
and ebx,$ffff
mov [CursorPosX],ebx
mov ebx,[lparam]
shr ebx,16
mov [CursorPosY],ebx
ret

!wmCreate:
mov eax,[esi+evCreateOffs]
cmp eax,0
je !DefWndProc
call dword eax
xor eax,eax
jmp !Finish

!wmPaint:
mov eax,[esi+evPaintOffs]
cmp eax,0
je !DefWndProc
call dword eax
xor eax,eax
jmp !Finish

!CtlColorChange:
mov [!PassEvent],0
cmp [!TrapColorChange],0
je !NotColorChangeTrap
mov eax,[!TrapColorChange]
call dword eax
cmp [!PassEvent],0
jne !NotColorChangeTrap
xor eax,eax
jmp !Finish
!NotColorChangeTrap:
invoke GetWindowLong,[lparam],GWL_USERDATA
cmp [!Desc],0
je !DefWndProc
mov esi,[!Desc]
call !GetDesc
bt [!dsStatus],WinChangeBackColor
jc !CtlBackcolorChange
bt [!dsStatus],WinChangeForeColor
jc !CtlForeColorChange
jmp !DefWndProc

!CtlBackcolorChange:
bt [!dsStatus],WinChangeForeColor
jc !CtlBothColorChange
cmp [!dsBackColor],$ffffffff
jne !NotTransparent
invoke SetBkMode,[wparam],TRANSPARENT
invoke GetStockObject,NULL_BRUSH
jmp !Finish
!NotTransparent:
call !BackColorChange
jmp !Finish

!BackColorChange:
invoke DeleteObject,[!Brush]
invoke CreateSolidBrush,[!dsBackColor]
mov [!Brush],eax
invoke SetBkColor,[wparam],[!dsBackColor]
mov eax,[!Brush]
ret

!CtlBothColorChange:
call !BothColorChange
jmp !Finish

!BothColorChange:
invoke DeleteObject,[!Brush]
invoke CreateSolidBrush,[!dsBackColor]
mov [!Brush],eax
invoke SetBkColor,[wparam],[!dsBackColor]
invoke SetTextColor,[wparam],[!dsForeColor]
mov eax,[!Brush]
ret

!CtlForeColorChange:
call !ForeColorChange
jmp !Finish

!ForeColorChange:
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
bts dword [esi+StatusOffs],WinChangeBackColor
mov [esi+BackColorOffs],eax
invoke CreateSolidBrush,eax
mov [!Brush],eax
invoke SetTextColor,[wparam],[!dsForeColor]
invoke SetBkMode,[wparam],TRANSPARENT
mov eax,[!Brush]
ret

!wmCommand:
mov ax,[EventID]
cmp ax,999
jg !wmMenu
cmp [!Desc],0
je !DefWndProc
mov esi,[!Desc]
mov eax,[esi+ArrayOffs]
mov [ArrayIndex],eax
mov eax,[esi+evCommandOffs]
cmp eax,0
jne !CommandDispatch
xor ebx,ebx
mov bx,[EventNotify]
; Click
cmp ebx,[esi+cdClickOffs]
jne !evChange
mov eax,[esi+evClickOffs]
cmp eax,0
jne !CommandDispatch
jmp !DefWndProc
!evChange:
cmp ebx,[esi+cdChangeOffs]
jne !evSelect
mov eax,[esi+evChangeOffs]
cmp eax,0
jne !CommandDispatch
jmp !DefWndProc
!evSelect:
cmp ebx,[esi+cdSelectOffs]
jne !evDblClick
mov eax,[esi+evSelectOffs]
cmp eax,0
jne !CommandDispatch
jmp !DefWndProc
!evDblClick:
cmp ebx,[esi+cdDblClickOffs]
jne !DefWndProc
mov eax,[esi+evDblClickOffs]
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
mov eax,[esi+ArrayOffs]
mov [ArrayIndex],eax
mov eax,[esi+evScrollOffs]
cmp eax,0
je !DefWndProc
call dword eax
xor eax,eax
jmp !Finish

!wmChar:
mov [AltKey],0
jmp !CharCommon
!wmSysChar:
mov [AltKey],1
!CharCommon:
mov [!PassEvent],0
mov esi,!OBMain
mov eax,[esi+evKeyStruckOffs]
cmp eax,0
je !DefWndProc
call dword eax
cmp [!PassEvent],0
jne !DefWndProc
xor eax,eax
jmp !Finish

!wmContextMenu:
invoke GetWindowLong,[wparam],GWL_USERDATA
or eax,eax
je !DefWndProc
mov esi,eax
mov eax,[esi+ArrayOffs]
mov [ArrayIndex],eax
call !GetMousePos
mov eax,[esi+evContextMenuOffs]
cmp eax,0
je !DefWndProc
call dword eax
xor eax,eax
jmp !Finish

!GetDesc:
mov eax,[esi+StatusOffs]
mov [!dsStatus],eax
mov eax,[esi+BackColorOffs]
mov [!dsBackColor],eax
mov eax,[esi+ForeColorOffs]
mov [!dsForeColor],eax
mov eax,[esi+TypeOffs]
mov [!dsControlType],eax
ret

!wmDestroy:
invoke DeleteObject,[!Brush]
invoke PostQuitMessage,0
xor eax,eax

!Finish:
pop edi esi ebx
return

;________________________________________________________________________________________________________________________________
; LN:3 CONST CommaCode=$2c
CommaCode equ 44
; LN:4 CONST ActivityTimeout=120000
ActivityTimeout equ 120000
; LN:88 ;Radio Comm decs
; LN:181 DIM CommWatchTimer1 AS TIMER
; LN:182 DIM CommWatchTimer2 AS TIMER
; LN:183 DIM CommErrorLampTimer AS TIMER
; LN:184 DIM CommMsgLampTimer AS TIMER
; LN:185 DIM RFInitTimer AS TIMER
; LN:186 DIM ActivityTimer(16) AS TIMER
; LN:215 OBMain.CREATE
mov edi,!OBMain
mov [!TargetGUIDesc],edi
OBMain_CREATE:
; LN:216 SETPOSITION OBMain,100,100,685,420
mov edi,!OBMain
mov [!TargetGUIDesc],edi
mov eax,100
mov dword [edi+LeftOffs],eax
mov eax,100
mov dword [edi+TopOffs],eax
mov eax,685
mov dword [edi+WidthOffs],eax
mov eax,420
mov dword [edi+HeightOffs],eax
call __SetRightBottom
invoke SetWindowPos, dword [edi+HandleOffs],HWND_TOP, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs],4
; LN:217 CALL SUB ResyncAll
call ResyncAll
; LN:218 CALL SUB BreakSync
call BreakSync
; LN:220 SETVEC CommChar=ADDR(CommByte)
mov esi,CommByte
mov eax,esi
mov [CommChar],eax
mov [CommChar+4],1
mov [CommChar+8],0
; LN:222 lf.lfHeight=-9
mov esi,lf+0
mov [_TmpVec1],esi
mov eax,0
mov edx,9
sub eax,edx
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:223 lf.lfFaceName="Verdana"
mov esi,lf+28
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov esi,_StrConst1
mov [_TmpVec2],esi
mov [_TmpVec2+4],8
mov [_TmpVec2+8],0
mov edi,_TmpVec1
mov esi,_TmpVec2
call __MovStr
; LN:224 CREATE GridFont,lf
invoke CreateFontIndirect,lf
mov [GridFont],eax
; LN:226 InoTimeSeed.wYear=2002
mov esi,InoTimeSeed+0
mov [_TmpVec1],esi
mov eax,2002
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:227 InoTimeSeed.wMonth=1
mov esi,InoTimeSeed+2
mov [_TmpVec1],esi
mov eax,1
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:228 InoTimeSeed.wDayOfWeek=0
mov esi,InoTimeSeed+4
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:229 InoTimeSeed.wDay=1
mov esi,InoTimeSeed+6
mov [_TmpVec1],esi
mov eax,1
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:230 InoTimeSeed.wHour=0
mov esi,InoTimeSeed+8
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:231 InoTimeSeed.wMinute=0
mov esi,InoTimeSeed+10
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:232 InoTimeSeed.wSecond=0
mov esi,InoTimeSeed+12
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:233 InoTimeSeed.wMilliseconds=0
mov esi,InoTimeSeed+14
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:235 OPEN "CurrentShot" FOR UPDATE AS CurrentShotFile;;;
mov esi,_StrConst2
mov [_TmpVec1],esi
mov [_TmpVec1+4],12
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_READ+GENERIC_WRITE,FILE_SHARE_READ+FILE_SHARE_WRITE,0,OPEN_ALWAYS,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [CurrentShotFile],eax
cmp eax,-1
jg _OELbl1
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl1:
; LN:236 GET CurrentShotFile,CurrentShot;;;
mov eax, dword [CurrentShotFile]
mov [_IOPthNum],eax
mov esi,CurrentShot+0
mov [_TmpVec1],esi
mov [_XferAddr],esi
mov [XferCount],7599
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl2
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl2:
; LN:237 CLOSE CurrentShotFile;;;
mov eax, dword [CurrentShotFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl3
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl3:
; LN:239 OPEN "_InoHost" FOR INPUT AS ConfigFile
mov esi,_StrConst3
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_READ,FILE_SHARE_READ+FILE_SHARE_WRITE,0,OPEN_ALWAYS,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [ConfigFile],eax
cmp eax,-1
jg _OELbl4
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl4:
; LN:240 GET ConfigFile,ConfigData
mov eax, dword [ConfigFile]
mov [_IOPthNum],eax
mov esi,ConfigData+0
mov [_TmpVec1],esi
mov [_XferAddr],esi
mov [XferCount],157
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl5
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl5:
; LN:241 IF LOF(ConfigFile)=0 THEN
mov eax, dword [ConfigFile]
mov [_IOPthNum],eax
invoke GetFileSize,[_IOPthNum],0
mov [STATUS],eax
cmp eax,-1
jg _OELbl6
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl6:
mov edx,0
cmp eax,edx
jne _Lbl1
; LN:242 ConfigData.CompanyName="CompanyName"
mov esi,ConfigData+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],30
mov [_TmpVec1+8],0
mov esi,_StrConst4
mov [_TmpVec2],esi
mov [_TmpVec2+4],12
mov [_TmpVec2+8],0
mov edi,_TmpVec1
mov esi,_TmpVec2
call __MovStr
; LN:243 ConfigData.ServerName="Server Name"
mov esi,ConfigData+30
mov [_TmpVec1],esi
mov [_TmpVec1+4],30
mov [_TmpVec1+8],0
mov esi,_StrConst5
mov [_TmpVec2],esi
mov [_TmpVec2+4],12
mov [_TmpVec2+8],0
mov edi,_TmpVec1
mov esi,_TmpVec2
call __MovStr
; LN:244 ConfigData.Password="Password"
mov esi,ConfigData+60
mov [_TmpVec1],esi
mov [_TmpVec1+4],30
mov [_TmpVec1+8],0
mov esi,_StrConst6
mov [_TmpVec2],esi
mov [_TmpVec2+4],9
mov [_TmpVec2+8],0
mov edi,_TmpVec1
mov esi,_TmpVec2
call __MovStr
; LN:245 ConfigData.RadioEnab=FALSE
mov esi,ConfigData+90
mov [_TmpVec1],esi
mov al,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:246 ConfigData.FirstPort=1
mov esi,ConfigData+91
mov [_TmpVec1],esi
mov eax,1
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:247 ConfigData.NumPorts=1
mov esi,ConfigData+92
mov [_TmpVec1],esi
mov eax,1
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:248 FOR I=1 TO 16
mov [I],1
_Lbl2:
cmp [I],16
jg _Lbl4
; LN:249 ConfigData.MacAddress(I)=0
mov esi,0-(1*4*1)
mov eax, dword [I]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov esi,ConfigData+93
mov [_TmpVec2],esi
mov eax,[_TmpVec2]
add eax,[_TmpVec1]
mov [_TmpVec2],eax
mov eax,0
mov esi,[_TmpVec2]
mov dword [esi],eax
; LN:250 MacAddr(16)=0
mov esi,MacAddr-(1*4*1)
mov eax,16
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:251 NEXT I
_Lbl3:
inc [I]
jmp _Lbl2
_Lbl4:
; LN:252 ELSE
jmp _Lbl5
_Lbl1:
; LN:253 Wireless=ConfigData.RadioEnab
mov esi,ConfigData+90
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov al, byte [edi]
mov byte [Wireless],al
; LN:254 FOR I=1 TO 16
mov [I],1
_Lbl6:
cmp [I],16
jg _Lbl8
; LN:255 MacAddr(I)=ConfigData.MacAddress(I)
mov esi,MacAddr-(1*4*1)
mov eax, dword [I]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov esi,0-(1*4*1)
mov eax, dword [I]
imul eax,4
add esi,eax
mov [_TmpVec2],esi
mov esi,ConfigData+93
mov [_TmpVec3],esi
mov eax,[_TmpVec3]
add eax,[_TmpVec2]
mov [_TmpVec3],eax
mov edi,[_TmpVec3]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:256 NEXT I
_Lbl7:
inc [I]
jmp _Lbl6
_Lbl8:
; LN:257 END IF
_Lbl5:
; LN:258 CLOSE ConfigFile
mov eax, dword [ConfigFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl7
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl7:
; LN:260 CREATE ConfigBackground,12,40,653,148
mov edi,!ConfigBackground
mov [!TargetGUIDesc],edi
mov eax,12
mov dword [edi+LeftOffs],eax
mov eax,40
mov dword [edi+TopOffs],eax
mov eax,653
mov dword [edi+WidthOffs],eax
mov eax,148
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl9
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType28,NULL,$50000000, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],101,[!hinstance],!ConfigBackground
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],127
mov dword [edi+IDOffs],101
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl9:
; LN:261 ConfigBackground.VISIBLE=FALSE
mov edi,!ConfigBackground
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:262 ConfigBackground.BACKCOLOR=$800000
mov edi,!ConfigBackground
mov [!TargetGUIDesc],edi
mov eax,8388608
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:264 CREATE CompanyNameBox,20,45,200,20
mov edi,!CompanyNameBox
mov [!TargetGUIDesc],edi
mov eax,20
mov dword [edi+LeftOffs],eax
mov eax,45
mov dword [edi+TopOffs],eax
mov eax,200
mov dword [edi+WidthOffs],eax
mov eax,20
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl10
call __SetRightBottom
invoke CreateWindowEx,WS_EX_CLIENTEDGE,!ControlType5,NULL,$50000000, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],102,[!hinstance],!CompanyNameBox
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],104
mov dword [edi+IDOffs],102
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl10:
; LN:265 CompanyNameBox.BACKCOLOR=$ffff80
mov edi,!CompanyNameBox
mov [!TargetGUIDesc],edi
mov eax,16777088
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:266 CompanyNameBox.FORECOLOR=$800000
mov edi,!CompanyNameBox
mov [!TargetGUIDesc],edi
mov eax,8388608
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:267 CompanyNameBox.VISIBLE=FALSE
mov edi,!CompanyNameBox
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:269 CREATE CompanyNameLabel,20,67,200,20
mov edi,!CompanyNameLabel
mov [!TargetGUIDesc],edi
mov eax,20
mov dword [edi+LeftOffs],eax
mov eax,67
mov dword [edi+TopOffs],eax
mov eax,200
mov dword [edi+WidthOffs],eax
mov eax,20
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl11
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType26,NULL,$50000101, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],103,[!hinstance],!CompanyNameLabel
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],125
mov dword [edi+IDOffs],103
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl11:
; LN:270 CompanyNameLabel.BACKCOLOR=$800000
mov edi,!CompanyNameLabel
mov [!TargetGUIDesc],edi
mov eax,8388608
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:271 CompanyNameLabel.FORECOLOR=$ffff80
mov edi,!CompanyNameLabel
mov [!TargetGUIDesc],edi
mov eax,16777088
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:272 CompanyNameLabel.TEXT="Company Name"
mov edi,!CompanyNameLabel
mov [!TargetGUIDesc],edi
mov esi,_StrConst7
mov [_TmpVec1],esi
mov [_TmpVec1+4],13
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:273 CompanyNameLabel.VISIBLE=FALSE
mov edi,!CompanyNameLabel
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:275 CREATE ServerNameBox,20,95,200,20
mov edi,!ServerNameBox
mov [!TargetGUIDesc],edi
mov eax,20
mov dword [edi+LeftOffs],eax
mov eax,95
mov dword [edi+TopOffs],eax
mov eax,200
mov dword [edi+WidthOffs],eax
mov eax,20
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl12
call __SetRightBottom
invoke CreateWindowEx,WS_EX_CLIENTEDGE,!ControlType5,NULL,$50000000, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],104,[!hinstance],!ServerNameBox
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],104
mov dword [edi+IDOffs],104
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl12:
; LN:276 ServerNameBox.BACKCOLOR=$ffff80
mov edi,!ServerNameBox
mov [!TargetGUIDesc],edi
mov eax,16777088
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:277 ServerNameBox.FORECOLOR=$800000
mov edi,!ServerNameBox
mov [!TargetGUIDesc],edi
mov eax,8388608
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:278 ServerNameBox.VISIBLE=FALSE
mov edi,!ServerNameBox
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:280 CREATE ServerNameLabel,20,117,200,20
mov edi,!ServerNameLabel
mov [!TargetGUIDesc],edi
mov eax,20
mov dword [edi+LeftOffs],eax
mov eax,117
mov dword [edi+TopOffs],eax
mov eax,200
mov dword [edi+WidthOffs],eax
mov eax,20
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl13
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType26,NULL,$50000101, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],105,[!hinstance],!ServerNameLabel
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],125
mov dword [edi+IDOffs],105
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl13:
; LN:281 ServerNameLabel.BACKCOLOR=$800000
mov edi,!ServerNameLabel
mov [!TargetGUIDesc],edi
mov eax,8388608
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:282 ServerNameLabel.FORECOLOR=$ffff80
mov edi,!ServerNameLabel
mov [!TargetGUIDesc],edi
mov eax,16777088
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:283 ServerNameLabel.TEXT="Server Name"
mov edi,!ServerNameLabel
mov [!TargetGUIDesc],edi
mov esi,_StrConst8
mov [_TmpVec1],esi
mov [_TmpVec1+4],12
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:284 ServerNameLabel.VISIBLE=FALSE
mov edi,!ServerNameLabel
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:286 CREATE PasswordBox,20,145,200,20
mov edi,!PasswordBox
mov [!TargetGUIDesc],edi
mov eax,20
mov dword [edi+LeftOffs],eax
mov eax,145
mov dword [edi+TopOffs],eax
mov eax,200
mov dword [edi+WidthOffs],eax
mov eax,20
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl14
call __SetRightBottom
invoke CreateWindowEx,WS_EX_CLIENTEDGE,!ControlType5,NULL,$50000000, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],106,[!hinstance],!PasswordBox
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],104
mov dword [edi+IDOffs],106
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl14:
; LN:287 PasswordBox.BACKCOLOR=$ffff80
mov edi,!PasswordBox
mov [!TargetGUIDesc],edi
mov eax,16777088
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:288 PasswordBox.FORECOLOR=$800000
mov edi,!PasswordBox
mov [!TargetGUIDesc],edi
mov eax,8388608
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:289 PasswordBox.VISIBLE=FALSE
mov edi,!PasswordBox
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:291 CREATE PasswordLabel,20,167,200,20
mov edi,!PasswordLabel
mov [!TargetGUIDesc],edi
mov eax,20
mov dword [edi+LeftOffs],eax
mov eax,167
mov dword [edi+TopOffs],eax
mov eax,200
mov dword [edi+WidthOffs],eax
mov eax,20
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl15
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType26,NULL,$50000101, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],107,[!hinstance],!PasswordLabel
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],125
mov dword [edi+IDOffs],107
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl15:
; LN:292 PasswordLabel.BACKCOLOR=$800000
mov edi,!PasswordLabel
mov [!TargetGUIDesc],edi
mov eax,8388608
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:293 PasswordLabel.FORECOLOR=$ffff80
mov edi,!PasswordLabel
mov [!TargetGUIDesc],edi
mov eax,16777088
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:294 PasswordLabel.TEXT="Password"
mov edi,!PasswordLabel
mov [!TargetGUIDesc],edi
mov esi,_StrConst9
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:295 PasswordLabel.VISIBLE=FALSE
mov edi,!PasswordLabel
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:297 CREATE WirelessCheckBox,260,45,100,20
mov edi,!WirelessCheckBox
mov [!TargetGUIDesc],edi
mov eax,260
mov dword [edi+LeftOffs],eax
mov eax,45
mov dword [edi+TopOffs],eax
mov eax,100
mov dword [edi+WidthOffs],eax
mov eax,20
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl16
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType18,NULL,$50000003, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],108,[!hinstance],!WirelessCheckBox
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],117
mov dword [edi+IDOffs],108
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl16:
; LN:298 WirelessCheckBox.BACKCOLOR=$800000
mov edi,!WirelessCheckBox
mov [!TargetGUIDesc],edi
mov eax,8388608
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:299 WirelessCheckBox.FORECOLOR=$ffff80
mov edi,!WirelessCheckBox
mov [!TargetGUIDesc],edi
mov eax,16777088
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:300 WirelessCheckBox.TEXT="Wireless"
mov edi,!WirelessCheckBox
mov [!TargetGUIDesc],edi
mov esi,_StrConst10
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:301 WirelessCheckBox.VISIBLE=FALSE
mov edi,!WirelessCheckBox
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:303 CREATE FirstPortCombo,260,95,100,100
mov edi,!FirstPortCombo
mov [!TargetGUIDesc],edi
mov eax,260
mov dword [edi+LeftOffs],eax
mov eax,95
mov dword [edi+TopOffs],eax
mov eax,100
mov dword [edi+WidthOffs],eax
mov eax,100
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl17
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType4,NULL,$50200102, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],109,[!hinstance],!FirstPortCombo
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
invoke GetComboBoxInfo, dword [edi+HandleOffs],!cbSize
mov dword edi,[!TargetGUIDesc]
mov eax,[!hwndCombo]
invoke SetWindowLong,eax,GWL_USERDATA,edi
mov eax,[!hwndItem]
invoke SetWindowLong,eax,GWL_USERDATA,edi
mov eax,[!hwndList]
invoke SetWindowLong,eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],103
mov dword [edi+IDOffs],109
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl17:
; LN:304 FirstPortCombo.BACKCOLOR=$ffff80
mov edi,!FirstPortCombo
mov [!TargetGUIDesc],edi
mov eax,16777088
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:305 FirstPortCombo.FORECOLOR=$800000
mov edi,!FirstPortCombo
mov [!TargetGUIDesc],edi
mov eax,8388608
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:306 FirstPortCombo.VISIBLE=FALSE
mov edi,!FirstPortCombo
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:307 FOR I=1 TO 16
mov [I],1
_Lbl18:
cmp [I],16
jg _Lbl20
; LN:308 TempStr="COM"+STR(I)
mov eax, dword [I]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst11
mov [_TmpVec2],esi
mov [_TmpVec2+4],4
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:309 FirstPortCombo.ADDITEM TempStr
mov edi,!FirstPortCombo
mov [!TargetGUIDesc],edi
invoke SendMessage, dword [edi+HandleOffs],CB_INSERTSTRING,-1,[TempStr]
; LN:310 NEXT I
_Lbl19:
inc [I]
jmp _Lbl18
_Lbl20:
; LN:312 CREATE FirstPortLabel,260,117,100,20
mov edi,!FirstPortLabel
mov [!TargetGUIDesc],edi
mov eax,260
mov dword [edi+LeftOffs],eax
mov eax,117
mov dword [edi+TopOffs],eax
mov eax,100
mov dword [edi+WidthOffs],eax
mov eax,20
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl21
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType26,NULL,$50000101, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],110,[!hinstance],!FirstPortLabel
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],125
mov dword [edi+IDOffs],110
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl21:
; LN:313 FirstPortLabel.BACKCOLOR=$800000
mov edi,!FirstPortLabel
mov [!TargetGUIDesc],edi
mov eax,8388608
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:314 FirstPortLabel.FORECOLOR=$ffff80
mov edi,!FirstPortLabel
mov [!TargetGUIDesc],edi
mov eax,16777088
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:315 FirstPortLabel.TEXT="FirstPort"
mov edi,!FirstPortLabel
mov [!TargetGUIDesc],edi
mov esi,_StrConst12
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:316 FirstPortLabel.VISIBLE=FALSE
mov edi,!FirstPortLabel
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:318 CREATE NumPortsCombo,260,145,100,100
mov edi,!NumPortsCombo
mov [!TargetGUIDesc],edi
mov eax,260
mov dword [edi+LeftOffs],eax
mov eax,145
mov dword [edi+TopOffs],eax
mov eax,100
mov dword [edi+WidthOffs],eax
mov eax,100
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl22
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType4,NULL,$50200102, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],111,[!hinstance],!NumPortsCombo
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
invoke GetComboBoxInfo, dword [edi+HandleOffs],!cbSize
mov dword edi,[!TargetGUIDesc]
mov eax,[!hwndCombo]
invoke SetWindowLong,eax,GWL_USERDATA,edi
mov eax,[!hwndItem]
invoke SetWindowLong,eax,GWL_USERDATA,edi
mov eax,[!hwndList]
invoke SetWindowLong,eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],103
mov dword [edi+IDOffs],111
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl22:
; LN:319 NumPortsCombo.BACKCOLOR=$ffff80
mov edi,!NumPortsCombo
mov [!TargetGUIDesc],edi
mov eax,16777088
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:320 NumPortsCombo.FORECOLOR=$800000
mov edi,!NumPortsCombo
mov [!TargetGUIDesc],edi
mov eax,8388608
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:321 NumPortsCombo.VISIBLE=FALSE
mov edi,!NumPortsCombo
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:322 FOR I=1 TO 16
mov [I],1
_Lbl23:
cmp [I],16
jg _Lbl25
; LN:323 NumPortsCombo.ADDITEM STR(I)
mov edi,!NumPortsCombo
mov [!TargetGUIDesc],edi
mov eax, dword [I]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],CB_INSERTSTRING,-1,[_TmpVec1]
; LN:324 NEXT I
_Lbl24:
inc [I]
jmp _Lbl23
_Lbl25:
; LN:326 CREATE NumPortsLabel,260,167,100,20
mov edi,!NumPortsLabel
mov [!TargetGUIDesc],edi
mov eax,260
mov dword [edi+LeftOffs],eax
mov eax,167
mov dword [edi+TopOffs],eax
mov eax,100
mov dword [edi+WidthOffs],eax
mov eax,20
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl26
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType26,NULL,$50000101, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],112,[!hinstance],!NumPortsLabel
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],125
mov dword [edi+IDOffs],112
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl26:
; LN:327 NumPortsLabel.BACKCOLOR=$800000
mov edi,!NumPortsLabel
mov [!TargetGUIDesc],edi
mov eax,8388608
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:328 NumPortsLabel.FORECOLOR=$ffff80
mov edi,!NumPortsLabel
mov [!TargetGUIDesc],edi
mov eax,16777088
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:329 NumPortsLabel.TEXT="# Of Ports"
mov edi,!NumPortsLabel
mov [!TargetGUIDesc],edi
mov esi,_StrConst13
mov [_TmpVec1],esi
mov [_TmpVec1+4],11
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:330 NumPortsLabel.VISIBLE=FALSE
mov edi,!NumPortsLabel
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:332 CREATE MacLabel,395,45,261,15
mov edi,!MacLabel
mov [!TargetGUIDesc],edi
mov eax,395
mov dword [edi+LeftOffs],eax
mov eax,45
mov dword [edi+TopOffs],eax
mov eax,261
mov dword [edi+WidthOffs],eax
mov eax,15
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl27
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType26,NULL,$50000101, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],113,[!hinstance],!MacLabel
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],125
mov dword [edi+IDOffs],113
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl27:
; LN:333 MacLabel.BACKCOLOR=$800000
mov edi,!MacLabel
mov [!TargetGUIDesc],edi
mov eax,8388608
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:334 MacLabel.FORECOLOR=$ffff80
mov edi,!MacLabel
mov [!TargetGUIDesc],edi
mov eax,16777088
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:335 MacLabel.TEXT="MAC Address"
mov edi,!MacLabel
mov [!TargetGUIDesc],edi
mov esi,_StrConst14
mov [_TmpVec1],esi
mov [_TmpVec1+4],12
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:336 MacLabel.VISIBLE=FALSE
mov edi,!MacLabel
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:338 CREATE MacGrid,395,65,261,77
mov edi,!MacGrid
mov [!TargetGUIDesc],edi
mov eax,395
mov dword [edi+LeftOffs],eax
mov eax,65
mov dword [edi+TopOffs],eax
mov eax,261
mov dword [edi+WidthOffs],eax
mov eax,77
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl28
call __SetRightBottom
invoke CreateWindowEx,WS_EX_CLIENTEDGE,!ControlType23,NULL,$5000000f, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],114,[!hinstance],!MacGrid
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],122
mov dword [edi+IDOffs],114
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl28:
; LN:339 MacGrid.VISIBLE=FALSE
mov edi,!MacGrid
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:340 MacGrid.FONT=GridFont
mov edi,!MacGrid
mov [!TargetGUIDesc],edi
mov eax, dword [GridFont]
invoke SendMessage, dword [edi+HandleOffs],WM_SETFONT,eax,1
; LN:341 MacGrid.BACKCOLOR=$ffff80
mov edi,!MacGrid
mov [!TargetGUIDesc],edi
mov eax,16777088
mov dword [edi+BackColorOffs],eax
invoke SendMessage, dword [edi+HandleOffs],GM_SETBACKCOLOR,eax,0
; LN:342 MacGrid.FORECOLOR=$800000
mov edi,!MacGrid
mov [!TargetGUIDesc],edi
mov eax,8388608
mov dword [edi+ForeColorOffs],eax
invoke SendMessage, dword [edi+HandleOffs],GM_SETTEXTCOLOR,eax,0
; LN:343 MacGrid.HEADERHEIGHT=0
mov edi,!MacGrid
mov [!TargetGUIDesc],edi
mov eax,0
invoke SendMessage,dword [edi+HandleOffs],GM_SETHDRHEIGHT,0,eax
; LN:344 MacGrid.ROWHEIGHT=18
mov edi,!MacGrid
mov [!TargetGUIDesc],edi
mov eax,18
invoke SendMessage,dword [edi+HandleOffs],GM_SETROWHEIGHT,0,eax
; LN:345 FOR I=1 TO 4
mov [I],1
_Lbl29:
cmp [I],4
jg _Lbl31
; LN:346 MacGrid.ADDCOL TEXT,64,"",CENTER,CENTER,31
mov edi,!MacGrid
mov [!TargetGUIDesc],edi
mov [gc_ctype],TYPE_EDITTEXT
mov eax,64
mov [gc_colwt],eax
mov eax,[_NullStr]
mov [gc_lpszhdrtext],eax
mov [gc_halign],GA_ALIGN_CENTER
mov [gc_calign],GA_ALIGN_CENTER
mov eax,31
mov [gc_ctextmax],eax
mov [gc_lpszformat],0
invoke SendMessage,dword [edi+HandleOffs],GM_ADDCOL,0,gc_colwt
; LN:347 NEXT I
_Lbl30:
inc [I]
jmp _Lbl29
_Lbl31:
; LN:348 FOR I=1 TO 4
mov [I],1
_Lbl32:
cmp [I],4
jg _Lbl34
; LN:349 MacGrid.ADDROW
mov edi,!MacGrid
mov [!TargetGUIDesc],edi
invoke SendMessage,dword [edi+HandleOffs],GM_ADDROW,0,0
; LN:350 NEXT I
_Lbl33:
inc [I]
jmp _Lbl32
_Lbl34:
; LN:352 CREATE SaveConfigButton,395,155,261,20
mov edi,!SaveConfigButton
mov [!TargetGUIDesc],edi
mov eax,395
mov dword [edi+LeftOffs],eax
mov eax,155
mov dword [edi+TopOffs],eax
mov eax,261
mov dword [edi+WidthOffs],eax
mov eax,20
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl35
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType2,NULL,$50000001, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],115,[!hinstance],!SaveConfigButton
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],101
mov dword [edi+IDOffs],115
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl35:
; LN:353 SaveConfigButton.TEXT="Save Configuration"
mov edi,!SaveConfigButton
mov [!TargetGUIDesc],edi
mov esi,_StrConst15
mov [_TmpVec1],esi
mov [_TmpVec1+4],19
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:354 SaveConfigButton.VISIBLE=FALSE
mov edi,!SaveConfigButton
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:356 CREATE LogGrid,4,58,669,130
mov edi,!LogGrid
mov [!TargetGUIDesc],edi
mov eax,4
mov dword [edi+LeftOffs],eax
mov eax,58
mov dword [edi+TopOffs],eax
mov eax,669
mov dword [edi+WidthOffs],eax
mov eax,130
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl36
call __SetRightBottom
invoke CreateWindowEx,WS_EX_CLIENTEDGE,!ControlType23,NULL,$5000000f, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],116,[!hinstance],!LogGrid
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],122
mov dword [edi+IDOffs],116
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl36:
; LN:357 LogGrid.VISIBLE=FALSE
mov edi,!LogGrid
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:358 LogGrid.FONT=GridFont
mov edi,!LogGrid
mov [!TargetGUIDesc],edi
mov eax, dword [GridFont]
invoke SendMessage, dword [edi+HandleOffs],WM_SETFONT,eax,1
; LN:359 LogGrid.BACKCOLOR=$800000
mov edi,!LogGrid
mov [!TargetGUIDesc],edi
mov eax,8388608
mov dword [edi+BackColorOffs],eax
invoke SendMessage, dword [edi+HandleOffs],GM_SETBACKCOLOR,eax,0
; LN:360 LogGrid.FORECOLOR=$ffffff
mov edi,!LogGrid
mov [!TargetGUIDesc],edi
mov eax,16777215
mov dword [edi+ForeColorOffs],eax
invoke SendMessage, dword [edi+HandleOffs],GM_SETTEXTCOLOR,eax,0
; LN:361 LogGrid.HEADERHEIGHT=18
mov edi,!LogGrid
mov [!TargetGUIDesc],edi
mov eax,18
invoke SendMessage,dword [edi+HandleOffs],GM_SETHDRHEIGHT,0,eax
; LN:362 LogGrid.ROWHEIGHT=18
mov edi,!LogGrid
mov [!TargetGUIDesc],edi
mov eax,18
invoke SendMessage,dword [edi+HandleOffs],GM_SETROWHEIGHT,0,eax
; LN:363 LogGrid.ADDCOL TEXT,204,"Log Item",CENTER,LEFT,31
mov edi,!LogGrid
mov [!TargetGUIDesc],edi
mov [gc_ctype],TYPE_EDITTEXT
mov eax,204
mov [gc_colwt],eax
mov esi,_StrConst16
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov eax,[_TmpVec1]
mov [gc_lpszhdrtext],eax
mov [gc_halign],GA_ALIGN_CENTER
mov [gc_calign],GA_ALIGN_LEFT
mov eax,31
mov [gc_ctextmax],eax
mov [gc_lpszformat],0
invoke SendMessage,dword [edi+HandleOffs],GM_ADDCOL,0,gc_colwt
; LN:364 LogGrid.ADDCOL TEXT,60,"Mach #",CENTER,LEFT,31
mov edi,!LogGrid
mov [!TargetGUIDesc],edi
mov [gc_ctype],TYPE_EDITTEXT
mov eax,60
mov [gc_colwt],eax
mov esi,_StrConst17
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov eax,[_TmpVec1]
mov [gc_lpszhdrtext],eax
mov [gc_halign],GA_ALIGN_CENTER
mov [gc_calign],GA_ALIGN_LEFT
mov eax,31
mov [gc_ctextmax],eax
mov [gc_lpszformat],0
invoke SendMessage,dword [edi+HandleOffs],GM_ADDCOL,0,gc_colwt
; LN:365 LogGrid.ADDCOL TEXT,200,"Date/Time",CENTER,LEFT,31
mov edi,!LogGrid
mov [!TargetGUIDesc],edi
mov [gc_ctype],TYPE_EDITTEXT
mov eax,200
mov [gc_colwt],eax
mov esi,_StrConst18
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov eax,[_TmpVec1]
mov [gc_lpszhdrtext],eax
mov [gc_halign],GA_ALIGN_CENTER
mov [gc_calign],GA_ALIGN_LEFT
mov eax,31
mov [gc_ctextmax],eax
mov [gc_lpszformat],0
invoke SendMessage,dword [edi+HandleOffs],GM_ADDCOL,0,gc_colwt
; LN:366 LogGrid.ADDCOL TEXT,100,"Opt 1",CENTER,LEFT,31
mov edi,!LogGrid
mov [!TargetGUIDesc],edi
mov [gc_ctype],TYPE_EDITTEXT
mov eax,100
mov [gc_colwt],eax
mov esi,_StrConst19
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov eax,[_TmpVec1]
mov [gc_lpszhdrtext],eax
mov [gc_halign],GA_ALIGN_CENTER
mov [gc_calign],GA_ALIGN_LEFT
mov eax,31
mov [gc_ctextmax],eax
mov [gc_lpszformat],0
invoke SendMessage,dword [edi+HandleOffs],GM_ADDCOL,0,gc_colwt
; LN:367 LogGrid.ADDCOL TEXT,100,"Opt 2",CENTER,LEFT,31
mov edi,!LogGrid
mov [!TargetGUIDesc],edi
mov [gc_ctype],TYPE_EDITTEXT
mov eax,100
mov [gc_colwt],eax
mov esi,_StrConst20
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov eax,[_TmpVec1]
mov [gc_lpszhdrtext],eax
mov [gc_halign],GA_ALIGN_CENTER
mov [gc_calign],GA_ALIGN_LEFT
mov eax,31
mov [gc_ctextmax],eax
mov [gc_lpszformat],0
invoke SendMessage,dword [edi+HandleOffs],GM_ADDCOL,0,gc_colwt
; LN:369 CREATE DataGrid,12,50,653,148
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax,12
mov dword [edi+LeftOffs],eax
mov eax,50
mov dword [edi+TopOffs],eax
mov eax,653
mov dword [edi+WidthOffs],eax
mov eax,148
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl37
call __SetRightBottom
invoke CreateWindowEx,WS_EX_CLIENTEDGE,!ControlType23,NULL,$5000000f, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],117,[!hinstance],!DataGrid
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],122
mov dword [edi+IDOffs],117
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl37:
; LN:370 DataGrid.VISIBLE=FALSE
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:371 DataGrid.FONT=GridFont
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [GridFont]
invoke SendMessage, dword [edi+HandleOffs],WM_SETFONT,eax,1
; LN:372 DataGrid.BACKCOLOR=$800000
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax,8388608
mov dword [edi+BackColorOffs],eax
invoke SendMessage, dword [edi+HandleOffs],GM_SETBACKCOLOR,eax,0
; LN:373 DataGrid.FORECOLOR=$ffffff
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax,16777215
mov dword [edi+ForeColorOffs],eax
invoke SendMessage, dword [edi+HandleOffs],GM_SETTEXTCOLOR,eax,0
; LN:374 DataGrid.HEADERHEIGHT=0
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax,0
invoke SendMessage,dword [edi+HandleOffs],GM_SETHDRHEIGHT,0,eax
; LN:375 DataGrid.ROWHEIGHT=18
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax,18
invoke SendMessage,dword [edi+HandleOffs],GM_SETROWHEIGHT,0,eax
; LN:376 FOR I=1 TO 8
mov [I],1
_Lbl38:
cmp [I],8
jg _Lbl40
; LN:377 DataGrid.ADDCOL TEXT,81,"",CENTER,CENTER,31
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov [gc_ctype],TYPE_EDITTEXT
mov eax,81
mov [gc_colwt],eax
mov eax,[_NullStr]
mov [gc_lpszhdrtext],eax
mov [gc_halign],GA_ALIGN_CENTER
mov [gc_calign],GA_ALIGN_CENTER
mov eax,31
mov [gc_ctextmax],eax
mov [gc_lpszformat],0
invoke SendMessage,dword [edi+HandleOffs],GM_ADDCOL,0,gc_colwt
; LN:378 NEXT I
_Lbl39:
inc [I]
jmp _Lbl38
_Lbl40:
; LN:379 FOR I=1 TO 8
mov [I],1
_Lbl41:
cmp [I],8
jg _Lbl43
; LN:380 DataGrid.ADDROW
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
invoke SendMessage,dword [edi+HandleOffs],GM_ADDROW,0,0
; LN:381 NEXT I
_Lbl42:
inc [I]
jmp _Lbl41
_Lbl43:
; LN:383 CREATE StatsGrid,4,58,669,130
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
mov eax,4
mov dword [edi+LeftOffs],eax
mov eax,58
mov dword [edi+TopOffs],eax
mov eax,669
mov dword [edi+WidthOffs],eax
mov eax,130
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl44
call __SetRightBottom
invoke CreateWindowEx,WS_EX_CLIENTEDGE,!ControlType23,NULL,$5000000f, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],118,[!hinstance],!StatsGrid
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],122
mov dword [edi+IDOffs],118
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl44:
; LN:384 StatsGrid.VISIBLE=FALSE
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:385 StatsGrid.FONT=GridFont
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
mov eax, dword [GridFont]
invoke SendMessage, dword [edi+HandleOffs],WM_SETFONT,eax,1
; LN:386 StatsGrid.BACKCOLOR=$800000
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
mov eax,8388608
mov dword [edi+BackColorOffs],eax
invoke SendMessage, dword [edi+HandleOffs],GM_SETBACKCOLOR,eax,0
; LN:387 StatsGrid.FORECOLOR=$ffffff
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
mov eax,16777215
mov dword [edi+ForeColorOffs],eax
invoke SendMessage, dword [edi+HandleOffs],GM_SETTEXTCOLOR,eax,0
; LN:388 StatsGrid.HEADERHEIGHT=18
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
mov eax,18
invoke SendMessage,dword [edi+HandleOffs],GM_SETHDRHEIGHT,0,eax
; LN:389 StatsGrid.ROWHEIGHT=18
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
mov eax,18
invoke SendMessage,dword [edi+HandleOffs],GM_SETROWHEIGHT,0,eax
; LN:390 StatsGrid.ADDCOL TEXT,40,"Stat",CENTER,CENTER,31
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
mov [gc_ctype],TYPE_EDITTEXT
mov eax,40
mov [gc_colwt],eax
mov esi,_StrConst21
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov eax,[_TmpVec1]
mov [gc_lpszhdrtext],eax
mov [gc_halign],GA_ALIGN_CENTER
mov [gc_calign],GA_ALIGN_CENTER
mov eax,31
mov [gc_ctextmax],eax
mov [gc_lpszformat],0
invoke SendMessage,dword [edi+HandleOffs],GM_ADDCOL,0,gc_colwt
; LN:391 FOR I=1 TO 16
mov [I],1
_Lbl45:
cmp [I],16
jg _Lbl47
; LN:392 TempStr="M"+STR(I)
mov eax, dword [I]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst22
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:393 StatsGrid.ADDCOL LONG,39,TempStr,CENTER,CENTER,31
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
mov [gc_ctype],TYPE_EDITLONG
mov eax,39
mov [gc_colwt],eax
mov eax,[TempStr]
mov [gc_lpszhdrtext],eax
mov [gc_halign],GA_ALIGN_CENTER
mov [gc_calign],GA_ALIGN_CENTER
mov eax,31
mov [gc_ctextmax],eax
mov [gc_lpszformat],0
invoke SendMessage,dword [edi+HandleOffs],GM_ADDCOL,0,gc_colwt
; LN:394 NEXT I
_Lbl46:
inc [I]
jmp _Lbl45
_Lbl47:
; LN:395 FOR I=1 TO 6
mov [I],1
_Lbl48:
cmp [I],6
jg _Lbl50
; LN:396 StatsGrid.ADDROW
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
invoke SendMessage,dword [edi+HandleOffs],GM_ADDROW,0,0
; LN:397 NEXT I
_Lbl49:
inc [I]
jmp _Lbl48
_Lbl50:
; LN:398 StatsGrid.TEXT(1,1)="Shot"
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
mov eax,1
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst23
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:399 StatsGrid.TEXT(2,1)="Mode"
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
mov eax,2
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst24
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:400 StatsGrid.TEXT(3,1)="Alarm"
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
mov eax,3
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst25
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:401 StatsGrid.TEXT(4,1)="Event"
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
mov eax,4
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst26
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:402 StatsGrid.TEXT(5,1)="Bytes"
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
mov eax,5
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst27
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:403 StatsGrid.TEXT(6,1)="Comm"
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
mov eax,6
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
mov esi,_StrConst28
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:404 CALL SUB ClearStatsGrid
call ClearStatsGrid
; LN:405 FOR I=1 TO 16
mov [I],1
_Lbl51:
cmp [I],16
jg _Lbl53
; LN:407 CREATE AlarmTimeBox(I),(I-1)*41+10,255,40,15
mov edi,!AlarmTimeBox
mov eax, dword [I]
mov [ArrayIndex],eax
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax, dword [I]
mov edx,1
sub eax,edx
mov edx,41
imul edx
mov [_Tmp2],eax
mov eax, dword [_Tmp2]
mov edx,10
add eax,edx
mov dword [edi+LeftOffs],eax
mov eax,255
mov dword [edi+TopOffs],eax
mov eax,40
mov dword [edi+WidthOffs],eax
mov eax,15
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl54
call __SetRightBottom
invoke CreateWindowEx,WS_EX_CLIENTEDGE,!ControlType5,NULL,$50000000, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],119,[!hinstance],!AlarmTimeBox
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],104
mov dword [edi+IDOffs],119
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov eax,[ArrayIndex]
mov dword [edi+ArrayOffs],eax
mov dword [edi+StatusOffs],$27
mov dword [edi+BackColorOffs],$ffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl54:
; LN:408 AlarmTimeBox(I).FONT=GridFont
mov edi,!AlarmTimeBox
mov eax, dword [I]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax, dword [GridFont]
invoke SendMessage, dword [edi+HandleOffs],WM_SETFONT,eax,1
; LN:409 AlarmTimeBox(I).TEXT="00.00"
mov edi,!AlarmTimeBox
mov eax, dword [I]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst29
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:410 TempStr="Machine "+STR(I)+" Last Alarm Time"
mov eax, dword [I]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst30
mov [_TmpVec2],esi
mov [_TmpVec2+4],9
mov [_TmpVec2+8],0
mov esi,_StrConst31
mov [_TmpVec3],esi
mov [_TmpVec3+4],17
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:411 AlarmTimeBox(I).TOOLTIP=TempStr
mov edi,!AlarmTimeBox
mov eax, dword [I]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
add edi,TTTextOffs
mov [_TmpVec1],edi
mov [_TmpVec1+4],100
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TempStr
call __MovStr
mov edi,[!TargetGUIDesc]
mov eax,edi
add eax,TTcbSizeOffs
bts dword [edi+StatusOffs],WinTipExists
jc _Lbl55
invoke SendMessage, [!ToolTip],TTM_ADDTOOL,0,eax
jmp _Lbl56
_Lbl55:
invoke SendMessage, [!ToolTip],TTM_UPDATETIPTEXT,0,eax
_Lbl56:
; LN:413 CREATE ModeTimeBox(I),(I-1)*41+10,270,40,15
mov edi,!ModeTimeBox
mov eax, dword [I]
mov [ArrayIndex],eax
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax, dword [I]
mov edx,1
sub eax,edx
mov edx,41
imul edx
mov [_Tmp2],eax
mov eax, dword [_Tmp2]
mov edx,10
add eax,edx
mov dword [edi+LeftOffs],eax
mov eax,270
mov dword [edi+TopOffs],eax
mov eax,40
mov dword [edi+WidthOffs],eax
mov eax,15
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl57
call __SetRightBottom
invoke CreateWindowEx,WS_EX_CLIENTEDGE,!ControlType5,NULL,$50000000, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],120,[!hinstance],!ModeTimeBox
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],104
mov dword [edi+IDOffs],120
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov eax,[ArrayIndex]
mov dword [edi+ArrayOffs],eax
mov dword [edi+StatusOffs],$27
mov dword [edi+BackColorOffs],$ffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl57:
; LN:414 ModeTimeBox(I).FONT=GridFont
mov edi,!ModeTimeBox
mov eax, dword [I]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax, dword [GridFont]
invoke SendMessage, dword [edi+HandleOffs],WM_SETFONT,eax,1
; LN:415 ModeTimeBox(I).TEXT="00.00"
mov edi,!ModeTimeBox
mov eax, dword [I]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst32
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:416 TempStr="Machine "+STR(I)+" Last Mode Time"
mov eax, dword [I]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst33
mov [_TmpVec2],esi
mov [_TmpVec2+4],9
mov [_TmpVec2+8],0
mov esi,_StrConst34
mov [_TmpVec3],esi
mov [_TmpVec3+4],16
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:417 ModeTimeBox(I).TOOLTIP=TempStr
mov edi,!ModeTimeBox
mov eax, dword [I]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
add edi,TTTextOffs
mov [_TmpVec1],edi
mov [_TmpVec1+4],100
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TempStr
call __MovStr
mov edi,[!TargetGUIDesc]
mov eax,edi
add eax,TTcbSizeOffs
bts dword [edi+StatusOffs],WinTipExists
jc _Lbl58
invoke SendMessage, [!ToolTip],TTM_ADDTOOL,0,eax
jmp _Lbl59
_Lbl58:
invoke SendMessage, [!ToolTip],TTM_UPDATETIPTEXT,0,eax
_Lbl59:
; LN:419 CREATE ShotTimeBox(I),(I-1)*41+10,285,40,15
mov edi,!ShotTimeBox
mov eax, dword [I]
mov [ArrayIndex],eax
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax, dword [I]
mov edx,1
sub eax,edx
mov edx,41
imul edx
mov [_Tmp2],eax
mov eax, dword [_Tmp2]
mov edx,10
add eax,edx
mov dword [edi+LeftOffs],eax
mov eax,285
mov dword [edi+TopOffs],eax
mov eax,40
mov dword [edi+WidthOffs],eax
mov eax,15
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl60
call __SetRightBottom
invoke CreateWindowEx,WS_EX_CLIENTEDGE,!ControlType5,NULL,$50000000, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],121,[!hinstance],!ShotTimeBox
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],104
mov dword [edi+IDOffs],121
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov eax,[ArrayIndex]
mov dword [edi+ArrayOffs],eax
mov dword [edi+StatusOffs],$27
mov dword [edi+BackColorOffs],$ffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl60:
; LN:420 ShotTimeBox(I).FONT=GridFont
mov edi,!ShotTimeBox
mov eax, dword [I]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax, dword [GridFont]
invoke SendMessage, dword [edi+HandleOffs],WM_SETFONT,eax,1
; LN:421 ShotTimeBox(I).TEXT="00.00"
mov edi,!ShotTimeBox
mov eax, dword [I]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst35
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:422 TempStr="Machine "+STR(I)+" Last Shot Time"
mov eax, dword [I]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst36
mov [_TmpVec2],esi
mov [_TmpVec2+4],9
mov [_TmpVec2+8],0
mov esi,_StrConst37
mov [_TmpVec3],esi
mov [_TmpVec3+4],16
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:423 ShotTimeBox(I).TOOLTIP=TempStr
mov edi,!ShotTimeBox
mov eax, dword [I]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
add edi,TTTextOffs
mov [_TmpVec1],edi
mov [_TmpVec1+4],100
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TempStr
call __MovStr
mov edi,[!TargetGUIDesc]
mov eax,edi
add eax,TTcbSizeOffs
bts dword [edi+StatusOffs],WinTipExists
jc _Lbl61
invoke SendMessage, [!ToolTip],TTM_ADDTOOL,0,eax
jmp _Lbl62
_Lbl61:
invoke SendMessage, [!ToolTip],TTM_UPDATETIPTEXT,0,eax
_Lbl62:
; LN:425 CREATE ModeLamp(I),(I-1)*41+10,300,40,15
mov edi,!ModeLamp
mov eax, dword [I]
mov [ArrayIndex],eax
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax, dword [I]
mov edx,1
sub eax,edx
mov edx,41
imul edx
mov [_Tmp2],eax
mov eax, dword [_Tmp2]
mov edx,10
add eax,edx
mov dword [edi+LeftOffs],eax
mov eax,300
mov dword [edi+TopOffs],eax
mov eax,40
mov dword [edi+WidthOffs],eax
mov eax,15
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl63
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType26,NULL,$50000101, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],122,[!hinstance],!ModeLamp
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],125
mov dword [edi+IDOffs],122
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov eax,[ArrayIndex]
mov dword [edi+ArrayOffs],eax
mov dword [edi+StatusOffs],$27
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl63:
; LN:426 Mode(I)=0
mov esi,Mode-(1*1*1)
mov eax, dword [I]
add esi,eax
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:427 ModeLamp(I).FONT=GridFont
mov edi,!ModeLamp
mov eax, dword [I]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax, dword [GridFont]
invoke SendMessage, dword [edi+HandleOffs],WM_SETFONT,eax,1
; LN:428 ModeLamp(I).BACKCOLOR=$b0a080
mov edi,!ModeLamp
mov eax, dword [I]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,11575424
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:429 ModeLamp(I).TEXT="IDLE"
mov edi,!ModeLamp
mov eax, dword [I]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst38
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:430 TempStr="Machine "+STR(I)+" Mode"
mov eax, dword [I]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst39
mov [_TmpVec2],esi
mov [_TmpVec2+4],9
mov [_TmpVec2+8],0
mov esi,_StrConst40
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:431 ModeLamp(I).TOOLTIP=TempStr
mov edi,!ModeLamp
mov eax, dword [I]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
add edi,TTTextOffs
mov [_TmpVec1],edi
mov [_TmpVec1+4],100
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TempStr
call __MovStr
mov edi,[!TargetGUIDesc]
mov eax,edi
add eax,TTcbSizeOffs
bts dword [edi+StatusOffs],WinTipExists
jc _Lbl64
invoke SendMessage, [!ToolTip],TTM_ADDTOOL,0,eax
jmp _Lbl65
_Lbl64:
invoke SendMessage, [!ToolTip],TTM_UPDATETIPTEXT,0,eax
_Lbl65:
; LN:433 CREATE ModeLabel(I),(I-1)*41+10,315,40,15
mov edi,!ModeLabel
mov eax, dword [I]
mov [ArrayIndex],eax
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax, dword [I]
mov edx,1
sub eax,edx
mov edx,41
imul edx
mov [_Tmp2],eax
mov eax, dword [_Tmp2]
mov edx,10
add eax,edx
mov dword [edi+LeftOffs],eax
mov eax,315
mov dword [edi+TopOffs],eax
mov eax,40
mov dword [edi+WidthOffs],eax
mov eax,15
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl66
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType26,NULL,$50000101, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],123,[!hinstance],!ModeLabel
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],125
mov dword [edi+IDOffs],123
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov eax,[ArrayIndex]
mov dword [edi+ArrayOffs],eax
mov dword [edi+StatusOffs],$27
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl66:
; LN:434 ModeLabel(I).TEXT=STR(I)
mov edi,!ModeLabel
mov eax, dword [I]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax, dword [I]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:435 ModeLabel(I).BACKCOLOR=$b0a080
mov edi,!ModeLabel
mov eax, dword [I]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,11575424
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:436 TempStr="Machine "+STR(I)+" Mode"
mov eax, dword [I]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst41
mov [_TmpVec2],esi
mov [_TmpVec2+4],9
mov [_TmpVec2+8],0
mov esi,_StrConst42
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:437 ModeLabel(I).TOOLTIP=TempStr
mov edi,!ModeLabel
mov eax, dword [I]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
add edi,TTTextOffs
mov [_TmpVec1],edi
mov [_TmpVec1+4],100
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TempStr
call __MovStr
mov edi,[!TargetGUIDesc]
mov eax,edi
add eax,TTcbSizeOffs
bts dword [edi+StatusOffs],WinTipExists
jc _Lbl67
invoke SendMessage, [!ToolTip],TTM_ADDTOOL,0,eax
jmp _Lbl68
_Lbl67:
invoke SendMessage, [!ToolTip],TTM_UPDATETIPTEXT,0,eax
_Lbl68:
; LN:438 Mode(I)=0
mov esi,Mode-(1*1*1)
mov eax, dword [I]
add esi,eax
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:440 CREATE CommErrorLamp(I),(I-1)*41+10,330,40,10
mov edi,!CommErrorLamp
mov eax, dword [I]
mov [ArrayIndex],eax
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax, dword [I]
mov edx,1
sub eax,edx
mov edx,41
imul edx
mov [_Tmp2],eax
mov eax, dword [_Tmp2]
mov edx,10
add eax,edx
mov dword [edi+LeftOffs],eax
mov eax,330
mov dword [edi+TopOffs],eax
mov eax,40
mov dword [edi+WidthOffs],eax
mov eax,10
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl69
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType26,NULL,$50000101, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],124,[!hinstance],!CommErrorLamp
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],125
mov dword [edi+IDOffs],124
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov eax,[ArrayIndex]
mov dword [edi+ArrayOffs],eax
mov dword [edi+StatusOffs],$27
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl69:
; LN:441 CommErrorLamp(I).BACKCOLOR=$60
mov edi,!CommErrorLamp
mov eax, dword [I]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,96
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:442 TempStr="Machine "+STR(I)+" Comm Error"
mov eax, dword [I]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst43
mov [_TmpVec2],esi
mov [_TmpVec2+4],9
mov [_TmpVec2+8],0
mov esi,_StrConst44
mov [_TmpVec3],esi
mov [_TmpVec3+4],12
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:443 CommErrorLamp(I).TOOLTIP=TempStr
mov edi,!CommErrorLamp
mov eax, dword [I]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
add edi,TTTextOffs
mov [_TmpVec1],edi
mov [_TmpVec1+4],100
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TempStr
call __MovStr
mov edi,[!TargetGUIDesc]
mov eax,edi
add eax,TTcbSizeOffs
bts dword [edi+StatusOffs],WinTipExists
jc _Lbl70
invoke SendMessage, [!ToolTip],TTM_ADDTOOL,0,eax
jmp _Lbl71
_Lbl70:
invoke SendMessage, [!ToolTip],TTM_UPDATETIPTEXT,0,eax
_Lbl71:
; LN:445 CREATE CommMsgLamp(I),(I-1)*41+10,340,40,10
mov edi,!CommMsgLamp
mov eax, dword [I]
mov [ArrayIndex],eax
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax, dword [I]
mov edx,1
sub eax,edx
mov edx,41
imul edx
mov [_Tmp2],eax
mov eax, dword [_Tmp2]
mov edx,10
add eax,edx
mov dword [edi+LeftOffs],eax
mov eax,340
mov dword [edi+TopOffs],eax
mov eax,40
mov dword [edi+WidthOffs],eax
mov eax,10
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl72
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType26,NULL,$50000101, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],125,[!hinstance],!CommMsgLamp
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],125
mov dword [edi+IDOffs],125
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov eax,[ArrayIndex]
mov dword [edi+ArrayOffs],eax
mov dword [edi+StatusOffs],$27
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl72:
; LN:446 CommMsgLamp(I).BACKCOLOR=$6000
mov edi,!CommMsgLamp
mov eax, dword [I]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,24576
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:447 TempStr="Machine "+STR(I)+" Comm Msg"
mov eax, dword [I]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst45
mov [_TmpVec2],esi
mov [_TmpVec2+4],9
mov [_TmpVec2+8],0
mov esi,_StrConst46
mov [_TmpVec3],esi
mov [_TmpVec3+4],10
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:448 CommMsgLamp(I).TOOLTIP=TempStr
mov edi,!CommMsgLamp
mov eax, dword [I]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
add edi,TTTextOffs
mov [_TmpVec1],edi
mov [_TmpVec1+4],100
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TempStr
call __MovStr
mov edi,[!TargetGUIDesc]
mov eax,edi
add eax,TTcbSizeOffs
bts dword [edi+StatusOffs],WinTipExists
jc _Lbl73
invoke SendMessage, [!ToolTip],TTM_ADDTOOL,0,eax
jmp _Lbl74
_Lbl73:
invoke SendMessage, [!ToolTip],TTM_UPDATETIPTEXT,0,eax
_Lbl74:
; LN:450 NEXT I
_Lbl52:
inc [I]
jmp _Lbl51
_Lbl53:
; LN:452 CREATE LockButton,11,360,100,25
mov edi,!LockButton
mov [!TargetGUIDesc],edi
mov eax,11
mov dword [edi+LeftOffs],eax
mov eax,360
mov dword [edi+TopOffs],eax
mov eax,100
mov dword [edi+WidthOffs],eax
mov eax,25
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl75
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType2,NULL,$50000001, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],126,[!hinstance],!LockButton
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],101
mov dword [edi+IDOffs],126
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl75:
; LN:453 LockButton.TEXT="Lock";"Unlock"
mov edi,!LockButton
mov [!TargetGUIDesc],edi
mov esi,_StrConst47
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:454 LockButton.TOOLTIP="Lock System"
mov edi,!LockButton
mov [!TargetGUIDesc],edi
add edi,TTTextOffs
mov esi,_StrConst48
mov [_TmpVec1],esi
mov [_TmpVec1+4],12
mov [_TmpVec1+8],0
mov [_TmpVec2],edi
mov [_TmpVec2+4],100
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_TmpVec1
call __MovStr
mov edi,[!TargetGUIDesc]
mov eax,edi
add eax,TTcbSizeOffs
bts dword [edi+StatusOffs],WinTipExists
jc _Lbl76
invoke SendMessage, [!ToolTip],TTM_ADDTOOL,0,eax
jmp _Lbl77
_Lbl76:
invoke SendMessage, [!ToolTip],TTM_UPDATETIPTEXT,0,eax
_Lbl77:
; LN:456 CREATE ConfigButton,122,360,100,25
mov edi,!ConfigButton
mov [!TargetGUIDesc],edi
mov eax,122
mov dword [edi+LeftOffs],eax
mov eax,360
mov dword [edi+TopOffs],eax
mov eax,100
mov dword [edi+WidthOffs],eax
mov eax,25
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl78
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType2,NULL,$50000001, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],127,[!hinstance],!ConfigButton
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],101
mov dword [edi+IDOffs],127
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl78:
; LN:457 ConfigButton.TEXT="Configuration"
mov edi,!ConfigButton
mov [!TargetGUIDesc],edi
mov esi,_StrConst49
mov [_TmpVec1],esi
mov [_TmpVec1+4],14
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:458 ConfigButton.TOOLTIP="Configure System"
mov edi,!ConfigButton
mov [!TargetGUIDesc],edi
add edi,TTTextOffs
mov esi,_StrConst50
mov [_TmpVec1],esi
mov [_TmpVec1+4],17
mov [_TmpVec1+8],0
mov [_TmpVec2],edi
mov [_TmpVec2+4],100
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_TmpVec1
call __MovStr
mov edi,[!TargetGUIDesc]
mov eax,edi
add eax,TTcbSizeOffs
bts dword [edi+StatusOffs],WinTipExists
jc _Lbl79
invoke SendMessage, [!ToolTip],TTM_ADDTOOL,0,eax
jmp _Lbl80
_Lbl79:
invoke SendMessage, [!ToolTip],TTM_UPDATETIPTEXT,0,eax
_Lbl80:
; LN:459 ConfigButton.ENABLED=true;FALSE
mov edi,!ConfigButton
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],TRUE
; LN:461 CREATE LogButton,233,360,100,25
mov edi,!LogButton
mov [!TargetGUIDesc],edi
mov eax,233
mov dword [edi+LeftOffs],eax
mov eax,360
mov dword [edi+TopOffs],eax
mov eax,100
mov dword [edi+WidthOffs],eax
mov eax,25
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl81
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType2,NULL,$50000001, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],128,[!hinstance],!LogButton
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],101
mov dword [edi+IDOffs],128
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl81:
; LN:462 LogButton.TEXT="View Log"
mov edi,!LogButton
mov [!TargetGUIDesc],edi
mov esi,_StrConst51
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:463 LogButton.TOOLTIP="View System Log"
mov edi,!LogButton
mov [!TargetGUIDesc],edi
add edi,TTTextOffs
mov esi,_StrConst52
mov [_TmpVec1],esi
mov [_TmpVec1+4],16
mov [_TmpVec1+8],0
mov [_TmpVec2],edi
mov [_TmpVec2+4],100
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_TmpVec1
call __MovStr
mov edi,[!TargetGUIDesc]
mov eax,edi
add eax,TTcbSizeOffs
bts dword [edi+StatusOffs],WinTipExists
jc _Lbl82
invoke SendMessage, [!ToolTip],TTM_ADDTOOL,0,eax
jmp _Lbl83
_Lbl82:
invoke SendMessage, [!ToolTip],TTM_UPDATETIPTEXT,0,eax
_Lbl83:
; LN:464 LogButton.ENABLED=true;FALSE
mov edi,!LogButton
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],TRUE
; LN:466 CREATE StatsButton,344,360,100,25
mov edi,!StatsButton
mov [!TargetGUIDesc],edi
mov eax,344
mov dword [edi+LeftOffs],eax
mov eax,360
mov dword [edi+TopOffs],eax
mov eax,100
mov dword [edi+WidthOffs],eax
mov eax,25
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl84
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType2,NULL,$50000001, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],129,[!hinstance],!StatsButton
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],101
mov dword [edi+IDOffs],129
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl84:
; LN:467 StatsButton.TEXT="View Stats"
mov edi,!StatsButton
mov [!TargetGUIDesc],edi
mov esi,_StrConst53
mov [_TmpVec1],esi
mov [_TmpVec1+4],11
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:468 StatsButton.TOOLTIP="View System Stats"
mov edi,!StatsButton
mov [!TargetGUIDesc],edi
add edi,TTTextOffs
mov esi,_StrConst54
mov [_TmpVec1],esi
mov [_TmpVec1+4],18
mov [_TmpVec1+8],0
mov [_TmpVec2],edi
mov [_TmpVec2+4],100
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_TmpVec1
call __MovStr
mov edi,[!TargetGUIDesc]
mov eax,edi
add eax,TTcbSizeOffs
bts dword [edi+StatusOffs],WinTipExists
jc _Lbl85
invoke SendMessage, [!ToolTip],TTM_ADDTOOL,0,eax
jmp _Lbl86
_Lbl85:
invoke SendMessage, [!ToolTip],TTM_UPDATETIPTEXT,0,eax
_Lbl86:
; LN:469 StatsButton.ENABLED=true;FALSE
mov edi,!StatsButton
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],TRUE
; LN:471 CREATE DataButton,455,360,100,25
mov edi,!DataButton
mov [!TargetGUIDesc],edi
mov eax,455
mov dword [edi+LeftOffs],eax
mov eax,360
mov dword [edi+TopOffs],eax
mov eax,100
mov dword [edi+WidthOffs],eax
mov eax,25
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl87
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType2,NULL,$50000001, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],130,[!hinstance],!DataButton
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],101
mov dword [edi+IDOffs],130
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl87:
; LN:472 DataButton.TEXT="View Data"
mov edi,!DataButton
mov [!TargetGUIDesc],edi
mov esi,_StrConst55
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:473 DataButton.TOOLTIP="View Last Data"
mov edi,!DataButton
mov [!TargetGUIDesc],edi
add edi,TTTextOffs
mov esi,_StrConst56
mov [_TmpVec1],esi
mov [_TmpVec1+4],15
mov [_TmpVec1+8],0
mov [_TmpVec2],edi
mov [_TmpVec2+4],100
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_TmpVec1
call __MovStr
mov edi,[!TargetGUIDesc]
mov eax,edi
add eax,TTcbSizeOffs
bts dword [edi+StatusOffs],WinTipExists
jc _Lbl88
invoke SendMessage, [!ToolTip],TTM_ADDTOOL,0,eax
jmp _Lbl89
_Lbl88:
invoke SendMessage, [!ToolTip],TTM_UPDATETIPTEXT,0,eax
_Lbl89:
; LN:474 DataButton.ENABLED=true;FALSE
mov edi,!DataButton
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],TRUE
; LN:476 CREATE ExitButton,566,360,100,25
mov edi,!ExitButton
mov [!TargetGUIDesc],edi
mov eax,566
mov dword [edi+LeftOffs],eax
mov eax,360
mov dword [edi+TopOffs],eax
mov eax,100
mov dword [edi+WidthOffs],eax
mov eax,25
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl90
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType2,NULL,$50000001, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],131,[!hinstance],!ExitButton
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],101
mov dword [edi+IDOffs],131
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl90:
; LN:477 ExitButton.TEXT="Exit"
mov edi,!ExitButton
mov [!TargetGUIDesc],edi
mov esi,_StrConst57
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:478 ExitButton.TOOLTIP="Exit System"
mov edi,!ExitButton
mov [!TargetGUIDesc],edi
add edi,TTTextOffs
mov esi,_StrConst58
mov [_TmpVec1],esi
mov [_TmpVec1+4],12
mov [_TmpVec1+8],0
mov [_TmpVec2],edi
mov [_TmpVec2+4],100
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_TmpVec1
call __MovStr
mov edi,[!TargetGUIDesc]
mov eax,edi
add eax,TTcbSizeOffs
bts dword [edi+StatusOffs],WinTipExists
jc _Lbl91
invoke SendMessage, [!ToolTip],TTM_ADDTOOL,0,eax
jmp _Lbl92
_Lbl91:
invoke SendMessage, [!ToolTip],TTM_UPDATETIPTEXT,0,eax
_Lbl92:
; LN:479 ExitButton.ENABLED=true;FALSE
mov edi,!ExitButton
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],TRUE
; LN:480 OBMain.BACKCOLOR=$80;$8000
mov edi,!OBMain
mov [!TargetGUIDesc],edi
invoke DeleteObject,dword [edi+ControlBrushOffs]
mov eax,128
mov dword [edi+BackColorOffs],eax
invoke CreateSolidBrush,eax
mov [edi+ControlBrushOffs],eax
invoke SetClassLong, dword [edi+HandleOffs],GCL_HBRBACKGROUND,eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
invoke UpdateWindow, dword [edi+HandleOffs]
; LN:481 Locked=false;TRUE
mov byte [Locked],0
; LN:483 CREATE MsgBanner,0,210,685,30
mov edi,!MsgBanner
mov [!TargetGUIDesc],edi
mov eax,0
mov dword [edi+LeftOffs],eax
mov eax,210
mov dword [edi+TopOffs],eax
mov eax,685
mov dword [edi+WidthOffs],eax
mov eax,30
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl93
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType26,NULL,$50000101, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],132,[!hinstance],!MsgBanner
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],125
mov dword [edi+IDOffs],132
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl93:
; LN:484 MsgBanner.BACKCOLOR=$80;$8000
mov edi,!MsgBanner
mov [!TargetGUIDesc],edi
mov eax,128
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:485 MsgBanner.FORECOLOR=$c0d0
mov edi,!MsgBanner
mov [!TargetGUIDesc],edi
mov eax,49360
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:486 MsgBanner.TEXT="No Message"
mov edi,!MsgBanner
mov [!TargetGUIDesc],edi
mov esi,_StrConst59
mov [_TmpVec1],esi
mov [_TmpVec1+4],11
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:487 MsgBanner.VISIBLE=FALSE
mov edi,!MsgBanner
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:489 CREATE MainImage,10,40,655,200
mov edi,!MainImage
mov [!TargetGUIDesc],edi
mov eax,10
mov dword [edi+LeftOffs],eax
mov eax,40
mov dword [edi+TopOffs],eax
mov eax,655
mov dword [edi+WidthOffs],eax
mov eax,200
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl94
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType33,NULL,$5000130e, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],133,[!hinstance],!MainImage
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],132
mov dword [edi+IDOffs],133
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl94:
; LN:490 CREATE DefaultBMP,InnoLogo.jpg
invoke BitmapFromMemory,!DefaultBMP,6062
mov [DefaultBMP],eax
; LN:491 LOADIMAGE UserBMP,"c:\nb\TM-300H.JPG"
mov esi,_StrConst60
mov [_TmpVec1],esi
mov [_TmpVec1+4],18
mov [_TmpVec1+8],0
invoke BitmapFromFile,[_TmpVec1]
mov [STATUS],eax
mov [UserBMP],eax
; LN:492 IF STATUS<>0 THEN	
cmp [STATUS],0
je _Lbl95
; LN:493 MainImage.BITMAP=UserBMP
mov edi,!MainImage
mov [!TargetGUIDesc],edi
mov eax, dword [UserBMP]
invoke SendMessage, dword [edi+HandleOffs],STM_SETIMAGE,IMAGE_BITMAP,eax
; LN:494 ELSE
jmp _Lbl96
_Lbl95:
; LN:495 MainImage.BITMAP=DefaultBMP
mov edi,!MainImage
mov [!TargetGUIDesc],edi
mov eax, dword [DefaultBMP]
invoke SendMessage, dword [edi+HandleOffs],STM_SETIMAGE,IMAGE_BITMAP,eax
; LN:496 END IF
_Lbl96:
; LN:498 lf.lfHeight=-25
mov esi,lf+0
mov [_TmpVec1],esi
mov eax,0
mov edx,25
sub eax,edx
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:499 lf.lfFaceName="Verdana"
mov esi,lf+28
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov esi,_StrConst61
mov [_TmpVec2],esi
mov [_TmpVec2+4],8
mov [_TmpVec2+8],0
mov edi,_TmpVec1
mov esi,_TmpVec2
call __MovStr
; LN:501 CREATE BannerFont,lf
invoke CreateFontIndirect,lf
mov [BannerFont],eax
; LN:502 MsgBanner.FONT=BannerFont
mov edi,!MsgBanner
mov [!TargetGUIDesc],edi
mov eax, dword [BannerFont]
invoke SendMessage, dword [edi+HandleOffs],WM_SETFONT,eax,1
; LN:504 CREATE Banner,0,0,685,30
mov edi,!Banner
mov [!TargetGUIDesc],edi
mov eax,0
mov dword [edi+LeftOffs],eax
mov eax,0
mov dword [edi+TopOffs],eax
mov eax,685
mov dword [edi+WidthOffs],eax
mov eax,30
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl97
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType26,NULL,$50000101, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],134,[!hinstance],!Banner
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],125
mov dword [edi+IDOffs],134
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl97:
; LN:505 Banner.FONT=BannerFont
mov edi,!Banner
mov [!TargetGUIDesc],edi
mov eax, dword [BannerFont]
invoke SendMessage, dword [edi+HandleOffs],WM_SETFONT,eax,1
; LN:506 Banner.BACKCOLOR=$80;$8000
mov edi,!Banner
mov [!TargetGUIDesc],edi
mov eax,128
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:507 Banner.FORECOLOR=$c0d0
mov edi,!Banner
mov [!TargetGUIDesc],edi
mov eax,49360
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:508 Banner.TEXT=ConfigData.CompanyName
mov edi,!Banner
mov [!TargetGUIDesc],edi
mov esi,ConfigData+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],30
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:510 TempStr="Ino-Toyo Server        <"+ConfigData.ServerName+">"
mov esi,ConfigData+30
mov [_TmpVec1],esi
mov [_TmpVec1+4],30
mov [_TmpVec1+8],0
mov esi,_StrConst62
mov [_TmpVec2],esi
mov [_TmpVec2+4],25
mov [_TmpVec2+8],0
mov esi,_StrConst63
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:511 OBMain.TEXT=TempStr
mov edi,!OBMain
mov [!TargetGUIDesc],edi
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[TempStr]
; LN:513 CALL SUB Resync
call Resync
; LN:515 IF Wireless=FALSE THEN
cmp [Wireless],0
jne _Lbl98
; LN:516 CALL InitWired
CALL InitWired
; LN:517 ELSE
jmp _Lbl99
_Lbl98:
; LN:518 CALL InitWireless
CALL InitWireless
; LN:519 END IF
_Lbl99:
; LN:521 IF NeedConfig=TRUE THEN
cmp [NeedConfig],1
jne _Lbl100
; LN:522 WARNINGBOX "Server Config","Program Must Be Restarted",MB_OK
mov esi,_StrConst64
mov [_TmpVec1],esi
mov [_TmpVec1+4],14
mov [_TmpVec1+8],0
mov esi,_StrConst65
mov [_TmpVec2],esi
mov [_TmpVec2+4],26
mov [_TmpVec2+8],0
invoke MessageBox,[!OBMain],[_TmpVec2],[_TmpVec1],MB_OK+MB_ICONWARNING
mov [STATUS],eax
; LN:523 END IF
_Lbl100:
; LN:526 FOR I=1 TO 16
mov [I],1
_Lbl101:
cmp [I],16
jg _Lbl103
; LN:527 ActivityTimer(I).TIME=ActivityTimeout
mov eax, dword [I]
mov ebx,eax
shl ebx,16
mov eax,6
add eax,ebx
mov [_ArgSafe0],eax
mov eax,120000
invoke SetTimer,[!OBMain],[_ArgSafe0],eax,NULL
; LN:528 NEXT I
_Lbl102:
inc [I]
jmp _Lbl101
_Lbl103:
; LN:530 CREATETASK CommTask
invoke CreateThread,0,0,CommTask,0,0,STATUS
mov [!CommTask],eax
; LN:531 SETTASKPRIORITY CommTask,0
mov eax,0
invoke SetThreadPriority,[!CommTask],eax
; LN:533 END EVENT
ret
;________________________________________________________________________________________________________________________________
; LN:535 BEGIN TASK CommTask
CommTask:
pop eax
mov [STATUS],eax
push esp
; LN:536 BEGIN LOOP
_Lbl104:
; LN:537 IF Wireless=False THEN
cmp [Wireless],0
jne _Lbl106
; LN:538 BEGIN LOOP
_Lbl107:
; LN:539 FOR CommNum=FirstCommPort TO LastCommPort
mov eax,[FirstCommPort]
mov [CommNum],eax
mov eax,[LastCommPort]
mov [_LopVec2],eax
_Lbl109:
mov eax,[CommNum]
cmp eax,[_LopVec2]
jg _Lbl111
; LN:540 TempInt=OBComm1(CommNum).STATUS
mov edi,OBComm1
mov [!SourceGUIDesc],edi
mov eax, dword [CommNum]
dec eax
imul eax,100
add edi,eax
mov [!SourceGUIDesc],edi
mov eax,edi
add eax,!CommStatusOffs
invoke ClearCommError, dword [edi+!HandleOffs],CommError,eax
mov edi,[!SourceGUIDesc]
mov eax,[edi+!cbInQueOffs]
mov [TempInt],eax
; LN:541 IF CommError<>0 THEN
cmp [CommError],0
je _Lbl112
; LN:542 CALL SUB ProcessError
call ProcessError
; LN:543 END IF
_Lbl112:
; LN:544 STATUS=OBComm1(CommNum).BINARYINPUT CommBuf,TempInt
mov eax, dword [CommNum]
dec eax
imul eax,100
mov edi,OBComm1
add edi,eax
mov eax, dword [TempInt]
invoke ReadFile, dword [edi+!HandleOffs],CommBuf,eax,XferCount,0
mov [STATUS],eax
; LN:545 Bytes(CommNum)=Bytes(CommNum)+XferCount
mov esi,Bytes-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov esi,Bytes-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov edx, dword [XferCount]
add eax,edx
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:546 IF XferCount>0 THEN
cmp [XferCount],0
jle _Lbl113
; LN:547 FOR RawCharCtr=1 TO XferCount
mov [RawCharCtr],1
mov eax,[XferCount]
mov [_LopVec3],eax
_Lbl114:
mov eax,[RawCharCtr]
cmp eax,[_LopVec3]
jg _Lbl116
; LN:548 CommByte=CommBuf(RawCharCtr)
mov esi,CommBuf-(1*1*1)
mov eax, dword [RawCharCtr]
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov byte [CommByte],al
; LN:549 CALL SUB ProcessData
call ProcessData
; LN:550 NEXT RawCharCtr
_Lbl115:
inc [RawCharCtr]
jmp _Lbl114
_Lbl116:
; LN:551 END IF
_Lbl113:
; LN:552 NEXT CommNum
_Lbl110:
inc [CommNum]
jmp _Lbl109
_Lbl111:
; LN:553 SLEEP 1
mov eax,1
invoke Sleep,eax
; LN:554 END LOOP
jmp _Lbl107
_Lbl108:
; LN:555 ELSE
jmp _Lbl117
_Lbl106:
; LN:556 BEGIN LOOP
_Lbl118:
; LN:557 TempInt=OBComm1(FirstCommPort).STATUS
mov edi,OBComm1
mov [!SourceGUIDesc],edi
mov eax, dword [FirstCommPort]
dec eax
imul eax,100
add edi,eax
mov [!SourceGUIDesc],edi
mov eax,edi
add eax,!CommStatusOffs
invoke ClearCommError, dword [edi+!HandleOffs],CommError,eax
mov edi,[!SourceGUIDesc]
mov eax,[edi+!cbInQueOffs]
mov [TempInt],eax
; LN:558 IF CommError<>0 THEN
cmp [CommError],0
je _Lbl120
; LN:559 CALL SUB ProcessError
call ProcessError
; LN:560 Call SUB BreakSync
call BreakSync
; LN:561 XferCount=0
mov dword [XferCount],0
; LN:562 END IF
_Lbl120:
; LN:563 STATUS=OBComm1(FirstCommPort).BINARYINPUT CommBuf,TempInt
mov eax, dword [FirstCommPort]
dec eax
imul eax,100
mov edi,OBComm1
add edi,eax
mov eax, dword [TempInt]
invoke ReadFile, dword [edi+!HandleOffs],CommBuf,eax,XferCount,0
mov [STATUS],eax
; LN:564 IF XferCount>0 THEN
cmp [XferCount],0
jle _Lbl121
; LN:565 FOR RawCharCtr=1 TO XferCount
mov [RawCharCtr],1
mov eax,[XferCount]
mov [_LopVec3],eax
_Lbl122:
mov eax,[RawCharCtr]
cmp eax,[_LopVec3]
jg _Lbl124
; LN:566 CommByte=CommBuf(RawCharCtr)				
mov esi,CommBuf-(1*1*1)
mov eax, dword [RawCharCtr]
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov byte [CommByte],al
; LN:567 CommWatchTimer1.STOP
mov eax,1
invoke KillTimer,[!OBMain],eax
; LN:568 CommWatchTimer1.TIME=60000
mov eax,1
mov [_ArgSafe0],eax
mov eax,60000
invoke SetTimer,[!OBMain],[_ArgSafe0],eax,NULL
; LN:569 SELECT CASE RawSync
mov eax, dword [RawSync]
mov [_SwitchInt],eax
; LN:570 CASE 0
mov eax,0
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl126
; LN:571 IF CommByte=131 THEN
cmp [CommByte],131
jne _Lbl127
; LN:572 RawSync = 1
mov dword [RawSync],1
; LN:573 END IF
_Lbl127:
; LN:574 CASE 1
jmp _Lbl125
_Lbl126:
mov eax,1
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl128
; LN:575 LowLength=CommByte
xor eax,eax
mov al, byte [CommByte]
mov [LowLength],eax
; LN:576 RawSync=2
mov dword [RawSync],2
; LN:577 CASE 2
jmp _Lbl125
_Lbl128:
mov eax,2
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl129
; LN:578 HighLength=CommByte
xor eax,eax
mov al, byte [CommByte]
mov [HighLength],eax
; LN:579 RawSync=3
mov dword [RawSync],3
; LN:580 StartMsgLength=SHL(HighLength,8)+LowLength-12; Actual data bytes
mov eax, dword [HighLength]
mov edx,8
mov ecx,edx
shl eax,cl
mov edx, dword [LowLength]
add eax,edx
mov edx,12
sub eax,edx
mov dword [StartMsgLength],eax
; LN:581 MsgLength=StartMsgLength
mov eax, dword [StartMsgLength]
mov [MsgLength],eax
; LN:582 CASE 3 To 8
jmp _Lbl125
_Lbl129:
mov eax,3
mov edx,[_SwitchInt]
cmp eax,edx
jg _Lbl130
mov eax,8
mov edx,[_SwitchInt]
cmp eax,edx
jl _Lbl130
; LN:583 INCR RawSync
inc [RawSync]
; LN:584 CASE 9 To 10
jmp _Lbl125
_Lbl130:
mov eax,9
mov edx,[_SwitchInt]
cmp eax,edx
jg _Lbl131
mov eax,10
mov edx,[_SwitchInt]
cmp eax,edx
jl _Lbl131
; LN:585 INCR RawSync
inc [RawSync]
; LN:586 CASE 11 To 14
jmp _Lbl125
_Lbl131:
mov eax,11
mov edx,[_SwitchInt]
cmp eax,edx
jg _Lbl132
mov eax,14
mov edx,[_SwitchInt]
cmp eax,edx
jl _Lbl132
; LN:587 SrcMacAddr=SHL(SrcMacAddr,8)
mov eax, dword [SrcMacAddr]
mov edx,8
mov ecx,edx
shl eax,cl
mov dword [SrcMacAddr],eax
; LN:588 SrcMacAddr=SrcMacAddr+CommByte				
mov eax, dword [SrcMacAddr]
xor edx,edx
mov dl, byte [CommByte]
add eax,edx
mov dword [SrcMacAddr],eax
; LN:589 INCR RawSync
inc [RawSync]
; LN:590 IF RawSync=15 THEN
cmp [RawSync],15
jne _Lbl133
; LN:591 FOR CommNum=1 TO 16
mov [CommNum],1
_Lbl134:
cmp [CommNum],16
jg _Lbl136
; LN:592 EXIT IF MacAddr(CommNum)=SrcMacAddr
mov esi,MacAddr-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx, dword [SrcMacAddr]
cmp eax,edx
je _Lbl136
; LN:593 NEXT CommNum
_Lbl135:
inc [CommNum]
jmp _Lbl134
_Lbl136:
; LN:594 Bytes(CommNum)=Bytes(CommNum)+MsgLength
mov esi,Bytes-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov esi,Bytes-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov edx, dword [MsgLength]
add eax,edx
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:595 END IF
_Lbl133:
; LN:596 CASE 15
jmp _Lbl125
_Lbl132:
mov eax,15
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl137
; LN:597 DECR MsgLength
dec [MsgLength]
; LN:598 CommWatchTimer2.STOP
mov eax,2
invoke KillTimer,[!OBMain],eax
; LN:599 IF MsgLength=0 THEN
cmp [MsgLength],0
jne _Lbl138
; LN:600 RawSync=9999
mov dword [RawSync],9999
; LN:601 ELSE
jmp _Lbl139
_Lbl138:
; LN:602 CALL SUB ProcessData
call ProcessData
; LN:603 END IF
_Lbl139:
; LN:604 CommWatchTimer2.TIME=2000
mov eax,2
mov [_ArgSafe0],eax
mov eax,2000
invoke SetTimer,[!OBMain],[_ArgSafe0],eax,NULL
; LN:605 CASE 9999
jmp _Lbl125
_Lbl137:
mov eax,9999
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl140
; LN:606 CALL SUB BreakSync
call BreakSync
; LN:607 END SELECT
jmp _Lbl125
_Lbl140:
_Lbl125:
; LN:608 NEXT RawCharCtr
_Lbl123:
inc [RawCharCtr]
jmp _Lbl122
_Lbl124:
; LN:609 END IF
_Lbl121:
; LN:610 END LOOP
jmp _Lbl118
_Lbl119:
; LN:611 END IF
_Lbl117:
; LN:612 END LOOP
jmp _Lbl104
_Lbl105:
; LN:613 END TASK
pop esp
ret
;________________________________________________________________________________________________________________________________
; LN:616 OBMain.SYSTEM
mov edi,!OBMain
mov [!TargetGUIDesc],edi
OBMain_SYSTEM:
; LN:617 IF STATUS=$f020 THEN
cmp [STATUS],61472
jne _Lbl141
; LN:618 PASSEVENT
mov [!PassEvent],1
; LN:619 ELSE
jmp _Lbl142
_Lbl141:
; LN:620 IF STATUS<>$f060 AND OBMain.MINIMIZED=TRUE THEN
mov eax, dword [STATUS]
mov edx,61536
cmp eax,edx
setne bl
xor bh,bh
or bh,bl
mov edi,!OBMain
mov [!SourceGUIDesc],edi
invoke IsIconic, dword [edi+HandleOffs]
mov dl,1
cmp al,dl
sete bl
and bh,bl
je _Lbl143
; LN:621 PASSEVENT
mov [!PassEvent],1
; LN:622 END IF
_Lbl143:
; LN:623 END IF
_Lbl142:
; LN:624 END EVENT
ret
;________________________________________________________________________________________________________________________________
; LN:626 CommErrorLamp.COMMAND
mov edi,!CommErrorLamp
CommErrorLamp_COMMAND:
; LN:627 LampIndex=ArrayIndex
mov eax, dword [ArrayIndex]
mov [LampIndex],eax
; LN:628 CALL SUB CommErrorBlink
call CommErrorBlink
; LN:629 END EVENT
ret
;________________________________________________________________________________________________________________________________
; LN:631 BEGIN SUB CommErrorBlink
CommErrorBlink:
; LN:632 CommErrorLamp(LampIndex).BACKCOLOR=$ff
mov edi,!CommErrorLamp
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,255
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:633 CommErrorLampTimer.TIME=300
mov eax,3
mov [_ArgSafe0],eax
mov eax,300
invoke SetTimer,[!OBMain],[_ArgSafe0],eax,NULL
; LN:634 END SUB
ret
;________________________________________________________________________________________________________________________________
; LN:636 CommErrorLampTimer.TIMEOUT
CommErrorLampTimer_TIMEOUT:
; LN:637 CommErrorLampTimer.STOP
mov eax,3
invoke KillTimer,[!OBMain],eax
; LN:638 CommErrorLamp(LampIndex).BACKCOLOR=$60
mov edi,!CommErrorLamp
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,96
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:639 END EVENT
ret
;________________________________________________________________________________________________________________________________
; LN:641 CommMsgLamp.COMMAND
mov edi,!CommMsgLamp
CommMsgLamp_COMMAND:
; LN:642 LampIndex=ArrayIndex
mov eax, dword [ArrayIndex]
mov [LampIndex],eax
; LN:643 CALL SUB CommMsgBlink
call CommMsgBlink
; LN:644 END EVENT
ret
;________________________________________________________________________________________________________________________________
; LN:646 BEGIN SUB CommMsgBlink
CommMsgBlink:
; LN:647 CommMsgLamp(LampIndex).BACKCOLOR=$ff00
mov edi,!CommMsgLamp
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,65280
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:648 CommMsgLampTimer.TIME=300
mov eax,4
mov [_ArgSafe0],eax
mov eax,300
invoke SetTimer,[!OBMain],[_ArgSafe0],eax,NULL
; LN:649 END SUB
ret
;________________________________________________________________________________________________________________________________
; LN:651 CommMsgLampTimer.TIMEOUT
CommMsgLampTimer_TIMEOUT:
; LN:652 CommMsgLampTimer.STOP
mov eax,4
invoke KillTimer,[!OBMain],eax
; LN:653 CommMsgLamp(LampIndex).BACKCOLOR=$6000
mov edi,!CommMsgLamp
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,24576
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:654 END EVENT
ret
;________________________________________________________________________________________________________________________________
; LN:656 PasswordButton.COMMAND
mov edi,!PasswordButton
mov [!TargetGUIDesc],edi
PasswordButton_COMMAND:
; LN:657 IF PasswordText.TEXT="vb" THEN
mov edi,!PasswordText
mov [!SourceGUIDesc],edi
invoke SendMessage, dword [edi+HandleOffs],WM_GETTEXT,_BufSize,[_IOBuffer]
mov esi,_StrConst66
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __CmpStr
jne _Lbl146
; LN:658 IF Locked=TRUE THEN
cmp [Locked],1
jne _Lbl147
; LN:659 LockButton.TEXT="Lock"
mov edi,!LockButton
mov [!TargetGUIDesc],edi
mov esi,_StrConst67
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:660 LockButton.TOOLTIP="Lock System"
mov edi,!LockButton
mov [!TargetGUIDesc],edi
add edi,TTTextOffs
mov esi,_StrConst68
mov [_TmpVec1],esi
mov [_TmpVec1+4],12
mov [_TmpVec1+8],0
mov [_TmpVec2],edi
mov [_TmpVec2+4],100
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_TmpVec1
call __MovStr
mov edi,[!TargetGUIDesc]
mov eax,edi
add eax,TTcbSizeOffs
bts dword [edi+StatusOffs],WinTipExists
jc _Lbl148
invoke SendMessage, [!ToolTip],TTM_ADDTOOL,0,eax
jmp _Lbl149
_Lbl148:
invoke SendMessage, [!ToolTip],TTM_UPDATETIPTEXT,0,eax
_Lbl149:
; LN:661 OBMain.BACKCOLOR=$80
mov edi,!OBMain
mov [!TargetGUIDesc],edi
invoke DeleteObject,dword [edi+ControlBrushOffs]
mov eax,128
mov dword [edi+BackColorOffs],eax
invoke CreateSolidBrush,eax
mov [edi+ControlBrushOffs],eax
invoke SetClassLong, dword [edi+HandleOffs],GCL_HBRBACKGROUND,eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
invoke UpdateWindow, dword [edi+HandleOffs]
; LN:662 Banner.BACKCOLOR=$80
mov edi,!Banner
mov [!TargetGUIDesc],edi
mov eax,128
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:663 MsgBanner.BACKCOLOR=$80
mov edi,!MsgBanner
mov [!TargetGUIDesc],edi
mov eax,128
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:664 ConfigButton.ENABLED=TRUE
mov edi,!ConfigButton
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],TRUE
; LN:665 LogButton.ENABLED=TRUE
mov edi,!LogButton
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],TRUE
; LN:666 StatsButton.ENABLED=TRUE
mov edi,!StatsButton
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],TRUE
; LN:667 DataButton.ENABLED=TRUE
mov edi,!DataButton
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],TRUE
; LN:668 ExitButton.ENABLED=TRUE
mov edi,!ExitButton
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],TRUE
; LN:669 ELSE
jmp _Lbl150
_Lbl147:
; LN:670 LockButton.TEXT="Unlock"
mov edi,!LockButton
mov [!TargetGUIDesc],edi
mov esi,_StrConst69
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:671 LockButton.TOOLTIP="Unlock System"
mov edi,!LockButton
mov [!TargetGUIDesc],edi
add edi,TTTextOffs
mov esi,_StrConst70
mov [_TmpVec1],esi
mov [_TmpVec1+4],14
mov [_TmpVec1+8],0
mov [_TmpVec2],edi
mov [_TmpVec2+4],100
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_TmpVec1
call __MovStr
mov edi,[!TargetGUIDesc]
mov eax,edi
add eax,TTcbSizeOffs
bts dword [edi+StatusOffs],WinTipExists
jc _Lbl151
invoke SendMessage, [!ToolTip],TTM_ADDTOOL,0,eax
jmp _Lbl152
_Lbl151:
invoke SendMessage, [!ToolTip],TTM_UPDATETIPTEXT,0,eax
_Lbl152:
; LN:672 OBMain.BACKCOLOR=$8000
mov edi,!OBMain
mov [!TargetGUIDesc],edi
invoke DeleteObject,dword [edi+ControlBrushOffs]
mov eax,32768
mov dword [edi+BackColorOffs],eax
invoke CreateSolidBrush,eax
mov [edi+ControlBrushOffs],eax
invoke SetClassLong, dword [edi+HandleOffs],GCL_HBRBACKGROUND,eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
invoke UpdateWindow, dword [edi+HandleOffs]
; LN:673 Banner.BACKCOLOR=$8000
mov edi,!Banner
mov [!TargetGUIDesc],edi
mov eax,32768
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:674 MsgBanner.BACKCOLOR=$8000
mov edi,!MsgBanner
mov [!TargetGUIDesc],edi
mov eax,32768
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:675 ConfigButton.ENABLED=FALSE
mov edi,!ConfigButton
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],FALSE
; LN:676 LogButton.ENABLED=FALSE
mov edi,!LogButton
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],FALSE
; LN:677 StatsButton.ENABLED=FALSE
mov edi,!StatsButton
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],FALSE
; LN:678 DataButton.ENABLED=FALSE
mov edi,!DataButton
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],FALSE
; LN:679 ExitButton.ENABLED=FALSE
mov edi,!ExitButton
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],FALSE
; LN:680 END IF
_Lbl150:
; LN:681 Locked=NOT(Locked)
mov al, byte [Locked]
btc eax,0
mov [_Tmp1],eax
mov al, byte [_Tmp1]
mov byte [Locked],al
; LN:682 END IF
_Lbl146:
; LN:683 PasswordText.TEXT=""
mov edi,!PasswordText
mov [!TargetGUIDesc],edi
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_NullStr]
; LN:684 PasswordWindow.VISIBLE=FALSE
mov edi,!PasswordWindow
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:685 END EVENT
ret
;________________________________________________________________________________________________________________________________
; LN:687 LockButton.COMMAND
mov edi,!LockButton
mov [!TargetGUIDesc],edi
LockButton_COMMAND:
; LN:688 IF PasswordWindowConstructed=FALSE THEN
cmp [PasswordWindowConstructed],0
jne _Lbl153
; LN:689 CREATE PasswordWindow,200,300,110,90 APPWINDOW CHILD
mov edi,!PasswordWindow
mov [!TargetGUIDesc],edi
mov eax,200
mov dword [edi+LeftOffs],eax
mov eax,300
mov dword [edi+TopOffs],eax
mov eax,110
mov dword [edi+WidthOffs],eax
mov eax,90
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl154
invoke LoadIcon,0,IDI_APPLICATION
mov [!PasswordWindowWindowClass.hIcon],eax
invoke LoadCursor,0,IDC_ARROW
mov dword [!PasswordWindow+CursorOffs],eax
mov [!PasswordWindowWindowClass.hCursor],eax
mov [!PasswordWindowWindowClass.style],0
mov [!PasswordWindowWindowClass.lpfnWndProc],!PasswordWindowProc
mov [!PasswordWindowWindowClass.cbClsExtra],0
mov [!PasswordWindowWindowClass.cbWndExtra],0
mov eax,[!hinstance]
mov [!PasswordWindowWindowClass.hbrBackground],COLOR_BTNFACE+1
mov [!PasswordWindowWindowClass.lpszMenuName],0
mov [!PasswordWindowWindowClass.lpszClassName],!PasswordWindowClass
invoke RegisterClass,!PasswordWindowWindowClass
mov dword [!PasswordWindow+HandleOffs],0
mov dword [!PasswordWindow+IDOffs],1
mov dword [!PasswordWindow+ArrayOffs],0
mov dword [!PasswordWindow+ForeColorOffs],$ffffff
mov dword [!PasswordWindow+BackColorOffs],$ffffffff
mov dword [!PasswordWindow+TypeOffs],!CT_FORM
mov dword [!PasswordWindow+ControlBrushOffs],0
mov dword [!PasswordWindow+InterceptSafeOffs],!PasswordWindowProc
call __SetRightBottom
invoke CreateWindowEx,WS_EX_TOOLWINDOW+WS_EX_APPWINDOW,!PasswordWindowClass,!title,WS_VISIBLE+WS_OVERLAPPEDWINDOW,dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],NULL,[!hinstance],!PasswordWindow
invoke SetWindowLong,[!PasswordWindow+HandleOffs],GWL_USERDATA,!PasswordWindow
mov dword [edi+StatusOffs],$07
_Lbl154:
; LN:690 PasswordWindow.TEXT="Password"
mov edi,!PasswordWindow
mov [!TargetGUIDesc],edi
mov esi,_StrConst71
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:691 PasswordWindowConstructed=TRUE
mov byte [PasswordWindowConstructed],1
; LN:692 CREATE PasswordText,10,10,80,20 IN PasswordWindow
mov edi,!PasswordText
mov [!TargetGUIDesc],edi
mov eax,10
mov dword [edi+LeftOffs],eax
mov eax,10
mov dword [edi+TopOffs],eax
mov eax,80
mov dword [edi+WidthOffs],eax
mov eax,20
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl155
call __SetRightBottom
invoke CreateWindowEx,WS_EX_CLIENTEDGE,!ControlType5,NULL,$50000000, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!PasswordWindow+HandleOffs],136,[!hinstance],!PasswordWindow
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
bts dword [!PasswordWindow+StatusOffs],WinSubClassed
jc _SCLbl1
invoke SetWindowLong, dword [!PasswordWindow+HandleOffs],GWL_WNDPROC,!SubClassProc
mov [!PasswordWindow+OldProcOffs],eax
_SCLbl1:
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],104
mov dword [edi+IDOffs],136
mov eax,[!PasswordWindow+HandleOffs]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl155:
; LN:693 CREATE PasswordButton,10,40,80,20 IN PasswordWindow
mov edi,!PasswordButton
mov [!TargetGUIDesc],edi
mov eax,10
mov dword [edi+LeftOffs],eax
mov eax,40
mov dword [edi+TopOffs],eax
mov eax,80
mov dword [edi+WidthOffs],eax
mov eax,20
mov dword [edi+HeightOffs],eax
bt dword [edi+StatusOffs],WinConstructed
jc _Lbl156
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType2,NULL,$50000001, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!PasswordWindow+HandleOffs],137,[!hinstance],!PasswordWindow
mov dword edi,[!TargetGUIDesc]
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TTcbSizeOffs],44
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword edi,[!TargetGUIDesc]
mov dword [edi+TypeOffs],101
mov dword [edi+IDOffs],137
mov eax,[!PasswordWindow+HandleOffs]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword edi,[!TargetGUIDesc]
mov dword [edi+InterceptSafeOffs],eax
_Lbl156:
; LN:694 PasswordButton.TEXT="Submit"
mov edi,!PasswordButton
mov [!TargetGUIDesc],edi
mov esi,_StrConst72
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:695 ELSE
jmp _Lbl157
_Lbl153:
; LN:696 PasswordWindow.VISIBLE=TRUE
mov edi,!PasswordWindow
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:697 END IF
_Lbl157:
; LN:698 PasswordText.SETFOCUS
mov edi,!PasswordText
mov [!TargetGUIDesc],edi
invoke SetFocus, dword [edi+HandleOffs]
; LN:699 END EVENT
ret
;________________________________________________________________________________________________________________________________
; LN:701 ConfigButton.COMMAND
mov edi,!ConfigButton
mov [!TargetGUIDesc],edi
ConfigButton_COMMAND:
; LN:702 IF ConfigFlag=FALSE THEN
cmp [ConfigFlag],0
jne _Lbl158
; LN:703 DataFlag=FALSE
mov byte [DataFlag],0
; LN:704 StatsFlag=FALSE
mov byte [StatsFlag],0
; LN:705 LogFlag=FALSE
mov byte [LogFlag],0
; LN:706 LockButton.ENABLED=FALSE
mov edi,!LockButton
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],FALSE
; LN:707 LogButton.ENABLED=FALSE
mov edi,!LogButton
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],FALSE
; LN:708 StatsButton.ENABLED=FALSE
mov edi,!StatsButton
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],FALSE
; LN:709 ExitButton.ENABLED=FALSE
mov edi,!ExitButton
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],FALSE
; LN:710 DataButton.ENABLED=FALSE
mov edi,!DataButton
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],FALSE
; LN:711 MainImage.VISIBLE=FALSE
mov edi,!MainImage
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:712 StatsGrid.VISIBLE=FALSE
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:713 DataGrid.VISIBLE=FALSE
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:714 LogGrid.VISIBLE=FALSE
mov edi,!LogGrid
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:715 ConfigBackground.VISIBLE=TRUE
mov edi,!ConfigBackground
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:716 MsgBanner.VISIBLE=TRUE
mov edi,!MsgBanner
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:717 MsgBanner.TEXT="Configure System"
mov edi,!MsgBanner
mov [!TargetGUIDesc],edi
mov esi,_StrConst73
mov [_TmpVec1],esi
mov [_TmpVec1+4],17
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:718 CompanyNameBox.VISIBLE=TRUE
mov edi,!CompanyNameBox
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:719 CompanyNameLabel.VISIBLE=TRUE
mov edi,!CompanyNameLabel
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:720 ServerNameBox.VISIBLE=TRUE
mov edi,!ServerNameBox
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:721 ServerNameLabel.VISIBLE=TRUE
mov edi,!ServerNameLabel
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:722 PasswordBox.VISIBLE=TRUE
mov edi,!PasswordBox
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:723 PasswordLabel.VISIBLE=TRUE
mov edi,!PasswordLabel
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:724 WirelessCheckBox.VISIBLE=TRUE
mov edi,!WirelessCheckBox
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:725 FirstPortCombo.VISIBLE=TRUE
mov edi,!FirstPortCombo
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:726 FirstPortLabel.VISIBLE=TRUE
mov edi,!FirstPortLabel
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:727 NumPortsCombo.VISIBLE=TRUE
mov edi,!NumPortsCombo
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:728 NumPortsLabel.VISIBLE=TRUE
mov edi,!NumPortsLabel
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:729 MacLabel.VISIBLE=TRUE
mov edi,!MacLabel
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:730 MacGrid.VISIBLE=TRUE
mov edi,!MacGrid
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:731 SaveConfigButton.VISIBLE=TRUE
mov edi,!SaveConfigButton
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:732 CompanyNameBox.TEXT=ConfigData.CompanyName
mov edi,!CompanyNameBox
mov [!TargetGUIDesc],edi
mov esi,ConfigData+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],30
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:733 ServerNameBox.TEXT=ConfigData.ServerName
mov edi,!ServerNameBox
mov [!TargetGUIDesc],edi
mov esi,ConfigData+30
mov [_TmpVec1],esi
mov [_TmpVec1+4],30
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:734 PasswordBox.TEXT=ConfigData.Password
mov edi,!PasswordBox
mov [!TargetGUIDesc],edi
mov esi,ConfigData+60
mov [_TmpVec1],esi
mov [_TmpVec1+4],30
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:735 IF ConfigData.RadioEnab=FALSE THEN
mov esi,ConfigData+90
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov al, byte [edi]
mov dl,0
cmp al,dl
jne _Lbl159
; LN:736 WirelessCheckBox.CHECKED=FALSE
mov edi,!WirelessCheckBox
mov [!TargetGUIDesc],edi
invoke SendMessage, dword [edi+HandleOffs],BM_SETCHECK,BST_UNCHECKED,0
; LN:737 ELSE
jmp _Lbl160
_Lbl159:
; LN:738 WirelessCheckBox.CHECKED=TRUE
mov edi,!WirelessCheckBox
mov [!TargetGUIDesc],edi
invoke SendMessage, dword [edi+HandleOffs],BM_SETCHECK,BST_CHECKED,0
; LN:739 END IF
_Lbl160:
; LN:740 TempStr="COM"+STR(ConfigData.FirstPort)
mov esi,ConfigData+91
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
mov esi,_StrConst74
mov [_TmpVec3],esi
mov [_TmpVec3+4],4
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov edi,TempStr
mov esi,_TmpVec3
call __MovStr
; LN:741 FirstPortCombo.TEXT=TempStr
mov edi,!FirstPortCombo
mov [!TargetGUIDesc],edi
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[TempStr]
; LN:742 Wireless=ConfigData.RadioEnab
mov esi,ConfigData+90
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov al, byte [edi]
mov byte [Wireless],al
; LN:743 NumPortsCombo.TEXT=STR(ConfigData.NumPorts)
mov edi,!NumPortsCombo
mov [!TargetGUIDesc],edi
mov esi,ConfigData+92
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
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec2]
; LN:744 J=1
mov dword [J],1
; LN:745 K=1
mov dword [K],1
; LN:746 For I=1 TO 16
mov [I],1
_Lbl161:
cmp [I],16
jg _Lbl163
; LN:747 TempMacAddr=HEX(ConfigData.MacAddress(I))
mov esi,0-(1*4*1)
mov eax, dword [I]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov esi,ConfigData+93
mov [_TmpVec2],esi
mov eax,[_TmpVec2]
add eax,[_TmpVec1]
mov [_TmpVec2],eax
mov edi,[_TmpVec2]
mov eax, dword [edi]
cinvoke ltoa,eax,[_ConvBuf1],16
mov esi,_StrTmp1
mov [_TmpVec3],esi
mov [_TmpVec3+4],32
mov [_TmpVec3+8],0
mov edi,_TmpVec3
mov esi,_ConvBuf1
call __MovStr
mov edi,TempMacAddr
mov esi,_TmpVec3
call __MovStr
; LN:748 CALL SUB PadMacAddress
call PadMacAddress
; LN:749 TempStr=TempStr+TempMacAddr
mov edi,[TempStr]
mov [_TmpVec1],edi
mov edi,[TempStr+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr+8]
mov [_TmpVec1+8],edi
mov edi,[TempMacAddr]
mov [_TmpVec2],edi
mov edi,[TempMacAddr+4]
mov [_TmpVec2+4],edi
mov edi,[TempMacAddr+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:750 MacGrid.TEXT(J,K)=TempStr
mov edi,!MacGrid
mov [!TargetGUIDesc],edi
mov eax, dword [J]
dec eax
mov ebx,eax
shl ebx,16
mov eax, dword [K]
dec eax
or ebx,eax
invoke SendMessage, dword [edi+HandleOffs],GM_SETCELLDATA,ebx,[TempStr]
; LN:751 INCR J
inc [J]
; LN:752 IF J>4 THEN
cmp [J],4
jle _Lbl164
; LN:753 J=1
mov dword [J],1
; LN:754 INCR K
inc [K]
; LN:755 END IF
_Lbl164:
; LN:756 NEXT I	
_Lbl162:
inc [I]
jmp _Lbl161
_Lbl163:
; LN:757 IF WirelessCheckBox.CHECKED=FALSE THEN
mov edi,!WirelessCheckBox
mov [!SourceGUIDesc],edi
invoke SendMessage, dword [edi+HandleOffs],BM_GETCHECK,0,0
mov [_Tmp1],eax
cmp [_Tmp1],0
jne _Lbl165
; LN:758 NumPortsCombo.VISIBLE=TRUE
mov edi,!NumPortsCombo
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:759 NumPortsLabel.VISIBLE=TRUE
mov edi,!NumPortsLabel
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:760 MacGrid.VISIBLE=FALSE
mov edi,!MacGrid
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:761 MacLabel.VISIBLE=FALSE
mov edi,!MacLabel
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:762 ELSE
jmp _Lbl166
_Lbl165:
; LN:763 NumPortsCombo.VISIBLE=FALSE
mov edi,!NumPortsCombo
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:764 NumPortsLabel.VISIBLE=FALSE
mov edi,!NumPortsLabel
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:765 MacGrid.VISIBLE=TRUE
mov edi,!MacGrid
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:766 MacLabel.VISIBLE=TRUE
mov edi,!MacLabel
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:767 END IF	
_Lbl166:
; LN:768 ELSE
jmp _Lbl167
_Lbl158:
; LN:769 LockButton.ENABLED=TRUE
mov edi,!LockButton
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],TRUE
; LN:770 LogButton.ENABLED=TRUE
mov edi,!LogButton
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],TRUE
; LN:771 StatsButton.ENABLED=TRUE
mov edi,!StatsButton
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],TRUE
; LN:772 ExitButton.ENABLED=TRUE
mov edi,!ExitButton
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],TRUE
; LN:773 DataButton.ENABLED=TRUE
mov edi,!DataButton
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinEnabled
invoke EnableWindow, dword [edi+HandleOffs],TRUE
; LN:774 ConfigBackground.VISIBLE=FALSE
mov edi,!ConfigBackground
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:775 MsgBanner.VISIBLE=FALSE
mov edi,!MsgBanner
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:776 MainImage.VISIBLE=TRUE
mov edi,!MainImage
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:777 CompanyNameBox.VISIBLE=FALSE
mov edi,!CompanyNameBox
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:778 CompanyNameLabel.VISIBLE=FALSE
mov edi,!CompanyNameLabel
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:779 ServerNameBox.VISIBLE=FALSE
mov edi,!ServerNameBox
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:780 ServerNameLabel.VISIBLE=FALSE
mov edi,!ServerNameLabel
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:781 PasswordBox.VISIBLE=FALSE
mov edi,!PasswordBox
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:782 PasswordLabel.VISIBLE=FALSE
mov edi,!PasswordLabel
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:783 WirelessCheckBox.VISIBLE=FALSE
mov edi,!WirelessCheckBox
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:784 FirstPortCombo.VISIBLE=FALSE
mov edi,!FirstPortCombo
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:785 FirstPortLabel.VISIBLE=FALSE
mov edi,!FirstPortLabel
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:786 NumPortsCombo.VISIBLE=FALSE
mov edi,!NumPortsCombo
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:787 NumPortsLabel.VISIBLE=FALSE
mov edi,!NumPortsLabel
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:788 MacLabel.VISIBLE=FALSE
mov edi,!MacLabel
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:789 MacGrid.VISIBLE=FALSE
mov edi,!MacGrid
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:790 SaveConfigButton.VISIBLE=FALSE
mov edi,!SaveConfigButton
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:791 END IF
_Lbl167:
; LN:792 ConfigFlag=NOT(ConfigFlag)
mov al, byte [ConfigFlag]
btc eax,0
mov [_Tmp1],eax
mov al, byte [_Tmp1]
mov byte [ConfigFlag],al
; LN:793 END EVENT
ret
;________________________________________________________________________________________________________________________________
; LN:795 SaveConfigButton.COMMAND
mov edi,!SaveConfigButton
mov [!TargetGUIDesc],edi
SaveConfigButton_COMMAND:
; LN:796 ConfigData.CompanyName=CompanyNameBox.TEXT
mov esi,ConfigData+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],30
mov [_TmpVec1+8],0
mov edi,!CompanyNameBox
mov [!SourceGUIDesc],edi
invoke SendMessage, dword [edi+HandleOffs],WM_GETTEXT,_BufSize,[_IOBuffer]
mov edi,_TmpVec1
mov esi,_IOBuffer
call __MovStr
; LN:797 ConfigData.ServerName=ServerNameBox.TEXT
mov esi,ConfigData+30
mov [_TmpVec1],esi
mov [_TmpVec1+4],30
mov [_TmpVec1+8],0
mov edi,!ServerNameBox
mov [!SourceGUIDesc],edi
invoke SendMessage, dword [edi+HandleOffs],WM_GETTEXT,_BufSize,[_IOBuffer]
mov edi,_TmpVec1
mov esi,_IOBuffer
call __MovStr
; LN:798 ConfigData.Password=PasswordBox.TEXT
mov esi,ConfigData+60
mov [_TmpVec1],esi
mov [_TmpVec1+4],30
mov [_TmpVec1+8],0
mov edi,!PasswordBox
mov [!SourceGUIDesc],edi
invoke SendMessage, dword [edi+HandleOffs],WM_GETTEXT,_BufSize,[_IOBuffer]
mov edi,_TmpVec1
mov esi,_IOBuffer
call __MovStr
; LN:799 IF WirelessCheckBox.CHECKED=FALSE THEN
mov edi,!WirelessCheckBox
mov [!SourceGUIDesc],edi
invoke SendMessage, dword [edi+HandleOffs],BM_GETCHECK,0,0
mov [_Tmp1],eax
cmp [_Tmp1],0
jne _Lbl168
; LN:800 ConfigData.RadioEnab=FALSE
mov esi,ConfigData+90
mov [_TmpVec1],esi
mov al,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:801 ELSE
jmp _Lbl169
_Lbl168:
; LN:802 ConfigData.RadioEnab=TRUE
mov esi,ConfigData+90
mov [_TmpVec1],esi
mov al,1
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:803 END IF
_Lbl169:
; LN:804 TempStr=FirstPortCombo.TEXT
mov edi,!FirstPortCombo
mov [!SourceGUIDesc],edi
invoke SendMessage, dword [edi+HandleOffs],WM_GETTEXT,_BufSize,[_IOBuffer]
mov edi,TempStr
mov esi,_IOBuffer
call __MovStr
; LN:805 TempStr=RIGHT(TempStr,LEN(TempStr)-3)
mov esi,TempStr
call __StrLen
mov edx,3
sub eax,edx
mov [_Tmp2],eax
mov edi,[TempStr]
mov [_TmpVec1],edi
mov edi,[TempStr+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [_Tmp2]
call __RightStr
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:806 ConfigData.FirstPort=VAL(TempStr)
mov esi,ConfigData+91
mov [_TmpVec1],esi
mov esi,[TempStr]
call __AtoL
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:807 TempStr=NumPortsCombo.TEXT
mov edi,!NumPortsCombo
mov [!SourceGUIDesc],edi
invoke SendMessage, dword [edi+HandleOffs],WM_GETTEXT,_BufSize,[_IOBuffer]
mov edi,TempStr
mov esi,_IOBuffer
call __MovStr
; LN:808 ConfigData.NumPorts=VAL(TempStr)
mov esi,ConfigData+92
mov [_TmpVec1],esi
mov esi,[TempStr]
call __AtoL
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:809 J=1
mov dword [J],1
; LN:810 K=1
mov dword [K],1
; LN:811 For I=1 TO 16
mov [I],1
_Lbl170:
cmp [I],16
jg _Lbl172
; LN:812 TempMacAddr=MacGrid.TEXT(J,K)
mov edi,!MacGrid
mov [!SourceGUIDesc],edi
mov eax, dword [J]
dec eax
mov ebx,eax
shl ebx,16
mov eax, dword [K]
dec eax
or ebx,eax
invoke SendMessage, dword [edi+HandleOffs],GM_CELLCONVERT,ebx,[_IOBuffer]
mov edi,TempMacAddr
mov esi,_IOBuffer
call __MovStr
; LN:813 TempStr="$"+TempMacAddr
mov esi,_StrConst75
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,[TempMacAddr]
mov [_TmpVec2],edi
mov edi,[TempMacAddr+4]
mov [_TmpVec2+4],edi
mov edi,[TempMacAddr+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:814 TempInt=VAL(TempStr)
mov esi,[TempStr]
call __AtoL
mov dword [TempInt],eax
; LN:815 ConfigData.MacAddress(I)=TempInt
mov esi,0-(1*4*1)
mov eax, dword [I]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov esi,ConfigData+93
mov [_TmpVec2],esi
mov eax,[_TmpVec2]
add eax,[_TmpVec1]
mov [_TmpVec2],eax
mov eax, dword [TempInt]
mov esi,[_TmpVec2]
mov dword [esi],eax
; LN:816 MacAddr(I)=TempInt
mov esi,MacAddr-(1*4*1)
mov eax, dword [I]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov eax, dword [TempInt]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:817 INCR J
inc [J]
; LN:818 IF J>4 THEN
cmp [J],4
jle _Lbl173
; LN:819 J=1
mov dword [J],1
; LN:820 INCR K
inc [K]
; LN:821 END IF
_Lbl173:
; LN:822 NEXT I
_Lbl171:
inc [I]
jmp _Lbl170
_Lbl172:
; LN:823 OPEN "_InoHost" FOR UPDATE AS ConfigFile
mov esi,_StrConst76
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_READ+GENERIC_WRITE,FILE_SHARE_READ+FILE_SHARE_WRITE,0,OPEN_ALWAYS,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [ConfigFile],eax
cmp eax,-1
jg _OELbl8
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl8:
; LN:824 PUT ConfigFile,ConfigData
mov eax, dword [ConfigFile]
mov [_IOPthNum],eax
mov esi,ConfigData+0
mov [_TmpVec1],esi
mov [_XferAddr],esi
mov [XferCount],157
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl9
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl9:
; LN:825 CLOSE ConfigFile
mov eax, dword [ConfigFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl10
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl10:
; LN:826 END EVENT
ret
;________________________________________________________________________________________________________________________________
; LN:828 WirelessCheckBox.COMMAND
mov edi,!WirelessCheckBox
mov [!TargetGUIDesc],edi
WirelessCheckBox_COMMAND:
; LN:829 IF WirelessCheckBox.CHECKED=FALSE THEN
mov edi,!WirelessCheckBox
mov [!SourceGUIDesc],edi
invoke SendMessage, dword [edi+HandleOffs],BM_GETCHECK,0,0
mov [_Tmp1],eax
cmp [_Tmp1],0
jne _Lbl174
; LN:830 NumPortsCombo.VISIBLE=TRUE
mov edi,!NumPortsCombo
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:831 NumPortsLabel.VISIBLE=TRUE
mov edi,!NumPortsLabel
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:832 MacGrid.VISIBLE=FALSE
mov edi,!MacGrid
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:833 MacLabel.VISIBLE=FALSE
mov edi,!MacLabel
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:834 ELSE
jmp _Lbl175
_Lbl174:
; LN:835 NumPortsCombo.VISIBLE=FALSE
mov edi,!NumPortsCombo
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:836 NumPortsLabel.VISIBLE=FALSE
mov edi,!NumPortsLabel
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:837 MacGrid.VISIBLE=TRUE
mov edi,!MacGrid
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:838 MacLabel.VISIBLE=TRUE
mov edi,!MacLabel
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:839 END IF
_Lbl175:
; LN:840 END EVENT
ret
;________________________________________________________________________________________________________________________________
; LN:842 LogButton.COMMAND
mov edi,!LogButton
mov [!TargetGUIDesc],edi
LogButton_COMMAND:
; LN:843 IF LogFlag=FALSE THEN
cmp [LogFlag],0
jne _Lbl176
; LN:844 DataFlag=FALSE
mov byte [DataFlag],0
; LN:845 StatsFlag=FALSE
mov byte [StatsFlag],0
; LN:846 MainImage.VISIBLE=FALSE
mov edi,!MainImage
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:847 StatsGrid.VISIBLE=FALSE
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:848 DataGrid.VISIBLE=FALSE
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:849 LogGrid.VISIBLE=TRUE
mov edi,!LogGrid
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:850 MsgBanner.VISIBLE=TRUE
mov edi,!MsgBanner
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:851 MsgBanner.TEXT="View Log"
mov edi,!MsgBanner
mov [!TargetGUIDesc],edi
mov esi,_StrConst77
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:852 ELSE
jmp _Lbl177
_Lbl176:
; LN:853 MainImage.VISIBLE=TRUE
mov edi,!MainImage
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:854 LogGrid.VISIBLE=FALSE
mov edi,!LogGrid
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:855 MsgBanner.VISIBLE=FALSE
mov edi,!MsgBanner
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:856 END IF
_Lbl177:
; LN:857 LogFlag=NOT(LogFlag)
mov al, byte [LogFlag]
btc eax,0
mov [_Tmp1],eax
mov al, byte [_Tmp1]
mov byte [LogFlag],al
; LN:858 END EVENT
ret
;________________________________________________________________________________________________________________________________
; LN:860 StatsButton.COMMAND
mov edi,!StatsButton
mov [!TargetGUIDesc],edi
StatsButton_COMMAND:
; LN:861 IF StatsFlag=FALSE THEN
cmp [StatsFlag],0
jne _Lbl178
; LN:862 DataFlag=FALSE
mov byte [DataFlag],0
; LN:863 LogFlag=FALSE
mov byte [LogFlag],0
; LN:864 MainImage.VISIBLE=FALSE
mov edi,!MainImage
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:865 DataGrid.VISIBLE=FALSE
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:866 LogGrid.VISIBLE=FALSE
mov edi,!LogGrid
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:867 StatsGrid.VISIBLE=TRUE
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:868 MsgBanner.VISIBLE=TRUE
mov edi,!MsgBanner
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:869 MsgBanner.TEXT="View Stats"
mov edi,!MsgBanner
mov [!TargetGUIDesc],edi
mov esi,_StrConst78
mov [_TmpVec1],esi
mov [_TmpVec1+4],11
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:870 CALL SUB SetStatsGrid
call SetStatsGrid
; LN:871 ELSE
jmp _Lbl179
_Lbl178:
; LN:872 MainImage.VISIBLE=TRUE
mov edi,!MainImage
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:873 StatsGrid.VISIBLE=FALSE
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:874 MsgBanner.VISIBLE=FALSE
mov edi,!MsgBanner
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:875 END IF
_Lbl179:
; LN:876 StatsFlag=NOT(StatsFlag)
mov al, byte [StatsFlag]
btc eax,0
mov [_Tmp1],eax
mov al, byte [_Tmp1]
mov byte [StatsFlag],al
; LN:877 END EVENT
ret
;________________________________________________________________________________________________________________________________
; LN:879 DataButton.COMMAND
mov edi,!DataButton
mov [!TargetGUIDesc],edi
DataButton_COMMAND:
; LN:880 IF DataFlag=FALSE THEN
cmp [DataFlag],0
jne _Lbl180
; LN:881 StatsFlag=FALSE
mov byte [StatsFlag],0
; LN:882 LogFlag=FALSE
mov byte [LogFlag],0
; LN:883 MainImage.VISIBLE=FALSE
mov edi,!MainImage
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:884 StatsGrid.VISIBLE=FALSE
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:885 LogGrid.VISIBLE=FALSE
mov edi,!LogGrid
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:886 DataGrid.VISIBLE=TRUE
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:887 MsgBanner.VISIBLE=TRUE
mov edi,!MsgBanner
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:888 MsgBanner.TEXT="View Data"
mov edi,!MsgBanner
mov [!TargetGUIDesc],edi
mov esi,_StrConst79
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:889 CALL SUB ClearDataGrid
call ClearDataGrid
; LN:890 ELSE
jmp _Lbl181
_Lbl180:
; LN:891 MainImage.VISIBLE=TRUE
mov edi,!MainImage
mov [!TargetGUIDesc],edi
bts dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_SHOW
; LN:892 DataGrid.VISIBLE=FALSE
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:893 MsgBanner.VISIBLE=FALSE
mov edi,!MsgBanner
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:894 END IF
_Lbl181:
; LN:895 DataFlag=NOT(DataFlag)
mov al, byte [DataFlag]
btc eax,0
mov [_Tmp1],eax
mov al, byte [_Tmp1]
mov byte [DataFlag],al
; LN:896 END EVENT
ret
;________________________________________________________________________________________________________________________________
; LN:898 ExitButton.COMMAND
mov edi,!ExitButton
mov [!TargetGUIDesc],edi
ExitButton_COMMAND:
; LN:899 END
invoke DeleteObject,[!Brush]
invoke PostMessage,[!OBMain],WM_CLOSE,0,0
; LN:900 END EVENT
ret
;________________________________________________________________________________________________________________________________
; LN:903 PasswordWindow.SYSTEM
mov edi,!PasswordWindow
mov [!TargetGUIDesc],edi
PasswordWindow_SYSTEM:
; LN:904 PasswordWindow.VISIBLE=FALSE
mov edi,!PasswordWindow
mov [!TargetGUIDesc],edi
btr dword [edi+StatusOffs],WinVisible
invoke ShowWindow, dword [edi+HandleOffs],SW_HIDE
; LN:905 END EVENT
ret
;________________________________________________________________________________________________________________________________
; LN:907 ModeLamp.COMMAND
mov edi,!ModeLamp
ModeLamp_COMMAND:
; LN:908 CALL SUB ChangeMode
call ChangeMode
; LN:909 END EVENT
ret
;________________________________________________________________________________________________________________________________
; LN:911 ModeLabel.COMMAND
mov edi,!ModeLabel
ModeLabel_COMMAND:
; LN:912 CALL SUB ChangeMode
call ChangeMode
; LN:913 END EVENT
ret
;________________________________________________________________________________________________________________________________
; LN:915 BEGIN SUB ChangeMode
ChangeMode:
; LN:916 IF Locked=TRUE THEN
cmp [Locked],1
jne _Lbl184
; LN:917 EXIT SUB
ret
; LN:918 END IF
_Lbl184:
; LN:919 LampIndex=ArrayIndex
mov eax, dword [ArrayIndex]
mov [LampIndex],eax
; LN:920 INCR Mode(LampIndex)
mov esi,Mode-(1*1*1)
mov eax, dword [LampIndex]
add esi,eax
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
inc byte [esi]; INC/DEC operand
; LN:921 TempMode=Mode(LampIndex)
mov esi,Mode-(1*1*1)
mov eax, dword [LampIndex]
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov byte [TempMode],al
; LN:922 IF TempMode>5 THEN
cmp [TempMode],5
jle _Lbl185
; LN:923 TempMode=0
mov byte [TempMode],0
; LN:924 Mode(LampIndex)=0
mov esi,Mode-(1*1*1)
mov eax, dword [LampIndex]
add esi,eax
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:925 END IF
_Lbl185:
; LN:926 CALL SUB SetModeLamp
call SetModeLamp
; LN:927 ActivityTimer(LampIndex).STOP
mov eax, dword [LampIndex]
mov ebx,eax
shl ebx,16
mov eax,6
add eax,ebx
invoke KillTimer,[!OBMain],eax
; LN:928 ActivityTimer(LampIndex).TIME=ActivityTimeout
mov eax, dword [LampIndex]
mov ebx,eax
shl ebx,16
mov eax,6
add eax,ebx
mov [_ArgSafe0],eax
mov eax,120000
invoke SetTimer,[!OBMain],[_ArgSafe0],eax,NULL
; LN:929 END SUB
ret
;________________________________________________________________________________________________________________________________
; LN:931 BEGIN SUB SetModeLamp
SetModeLamp:
; LN:932 Mode(LampIndex)=TempMode
mov esi,Mode-(1*1*1)
mov eax, dword [LampIndex]
add esi,eax
mov [_TmpVec1],esi
xor eax,eax
mov al, byte [TempMode]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:933 SELECT CASE TempMode
xor eax,eax
mov al, byte [TempMode]
mov [_SwitchInt],eax
; LN:934 CASE 0
mov eax,0
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl187
; LN:935 ModeLamp(LampIndex).BACKCOLOR=$b0a080
mov edi,!ModeLamp
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,11575424
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:936 ModeLamp(LampIndex).FORECOLOR=$0
mov edi,!ModeLamp
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,0
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:937 ModeLabel(LampIndex).BACKCOLOR=$b0a080
mov edi,!ModeLabel
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,11575424
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:938 ModeLabel(LampIndex).FORECOLOR=$0
mov edi,!ModeLabel
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,0
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:939 ModeLamp(LampIndex).TEXT="IDLE"
mov edi,!ModeLamp
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst80
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:940 CASE 1
jmp _Lbl186
_Lbl187:
mov eax,1
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl188
; LN:941 ModeLamp(LampIndex).BACKCOLOR=$ffffff
mov edi,!ModeLamp
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,16777215
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:942 ModeLamp(LampIndex).FORECOLOR=$0
mov edi,!ModeLamp
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,0
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:943 ModeLabel(LampIndex).BACKCOLOR=$ffffff
mov edi,!ModeLabel
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,16777215
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:944 ModeLabel(LampIndex).FORECOLOR=$0
mov edi,!ModeLabel
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,0
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:945 ModeLamp(LampIndex).TEXT="OFF"
mov edi,!ModeLamp
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst81
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:946 CASE 2
jmp _Lbl186
_Lbl188:
mov eax,2
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl189
; LN:947 ModeLamp(LampIndex).BACKCOLOR=$ff
mov edi,!ModeLamp
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,255
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:948 ModeLamp(LampIndex).FORECOLOR=$ffff
mov edi,!ModeLamp
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,65535
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:949 ModeLabel(LampIndex).BACKCOLOR=$ff
mov edi,!ModeLabel
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,255
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:950 ModeLabel(LampIndex).FORECOLOR=$ffff
mov edi,!ModeLabel
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,65535
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:951 ModeLamp(LampIndex).TEXT="MAN"
mov edi,!ModeLamp
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst82
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:952 CASE 3
jmp _Lbl186
_Lbl189:
mov eax,3
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl190
; LN:953 ModeLamp(LampIndex).BACKCOLOR=$ffff
mov edi,!ModeLamp
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,65535
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:954 ModeLamp(LampIndex).FORECOLOR=$0
mov edi,!ModeLamp
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,0
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:955 ModeLabel(LampIndex).BACKCOLOR=$ffff
mov edi,!ModeLabel
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,65535
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:956 ModeLabel(LampIndex).FORECOLOR=$0
mov edi,!ModeLabel
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,0
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:957 ModeLamp(LampIndex).TEXT="SEMI"
mov edi,!ModeLamp
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst83
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:958 CASE 4
jmp _Lbl186
_Lbl190:
mov eax,4
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl191
; LN:959 ModeLamp(LampIndex).BACKCOLOR=$ff00
mov edi,!ModeLamp
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,65280
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:960 ModeLamp(LampIndex).FORECOLOR=$0
mov edi,!ModeLamp
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,0
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:961 ModeLabel(LampIndex).BACKCOLOR=$ff00
mov edi,!ModeLabel
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,65280
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:962 ModeLabel(LampIndex).FORECOLOR=$0
mov edi,!ModeLabel
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,0
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:963 ModeLamp(LampIndex).TEXT="AUTO"
mov edi,!ModeLamp
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst84
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:964 CASE 5
jmp _Lbl186
_Lbl191:
mov eax,5
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl192
; LN:965 ModeLamp(LampIndex).BACKCOLOR=$8000
mov edi,!ModeLamp
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,32768
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:966 ModeLamp(LampIndex).FORECOLOR=$ffff
mov edi,!ModeLamp
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,65535
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:967 ModeLabel(LampIndex).BACKCOLOR=$8000
mov edi,!ModeLabel
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,32768
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:968 ModeLabel(LampIndex).FORECOLOR=$ffff
mov edi,!ModeLabel
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,65535
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:969 ModeLamp(LampIndex).TEXT="RUN"
mov edi,!ModeLamp
mov eax, dword [LampIndex]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov esi,_StrConst85
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_TmpVec1]
; LN:970 END SELECT
jmp _Lbl186
_Lbl192:
_Lbl186:
; LN:971 END SUB
ret
;________________________________________________________________________________________________________________________________
; LN:973 BEGIN SUB ProcessError
ProcessError:
; LN:974 IF CommNum<1 OR CommNum>16 THEN
mov eax, dword [CommNum]
mov edx,1
cmp eax,edx
setl bl
xor bh,bh
or bh,bl
mov eax, dword [CommNum]
mov edx,16
cmp eax,edx
setg bl
or bh,bl
je _Lbl193
; LN:975 MSGBOX "Error","No Communication",MB_OK
mov esi,_StrConst86
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov esi,_StrConst87
mov [_TmpVec2],esi
mov [_TmpVec2+4],17
mov [_TmpVec2+8],0
invoke MessageBox,[!OBMain],[_TmpVec2],[_TmpVec1],MB_OK
mov [STATUS],eax
; LN:976 END
invoke DeleteObject,[!Brush]
invoke PostMessage,[!OBMain],WM_CLOSE,0,0
; LN:977 END IF
_Lbl193:
; LN:978 ActivityTimer(CommNum).STOP
mov eax, dword [CommNum]
mov ebx,eax
shl ebx,16
mov eax,6
add eax,ebx
invoke KillTimer,[!OBMain],eax
; LN:979 ActivityTimer(CommNum).TIME=ActivityTimeout
mov eax, dword [CommNum]
mov ebx,eax
shl ebx,16
mov eax,6
add eax,ebx
mov [_ArgSafe0],eax
mov eax,120000
invoke SetTimer,[!OBMain],[_ArgSafe0],eax,NULL
; LN:980 LampIndex=CommNum
mov eax, dword [CommNum]
mov [LampIndex],eax
; LN:981 CALL SUB CommErrorBlink
call CommErrorBlink
; LN:982 INCR Errors(CommNum)
mov esi,Errors-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
inc dword [esi]; INC/DEC operand
; LN:983 IF DataFlag=TRUE THEN
cmp [DataFlag],1
jne _Lbl194
; LN:984 CALL SUB ClearDataGrid
call ClearDataGrid
; LN:985 END IF
_Lbl194:
; LN:986 IF StatsFlag=TRUE THEN
cmp [StatsFlag],1
jne _Lbl195
; LN:987 CALL SUB SetStatsGrid
call SetStatsGrid
; LN:988 END IF
_Lbl195:
; LN:989 CALL SUB Resync
call Resync
; LN:990 END SUB
ret
;________________________________________________________________________________________________________________________________
; LN:992 BEGIN SUB ProcessData
ProcessData:
; LN:993 If CommNum>16 Then
cmp [CommNum],16
jle _Lbl196
; LN:994 Exit Sub
ret
; LN:995 End If
_Lbl196:
; LN:996 ActivityTimer(CommNum).STOP
mov eax, dword [CommNum]
mov ebx,eax
shl ebx,16
mov eax,6
add eax,ebx
invoke KillTimer,[!OBMain],eax
; LN:997 ActivityTimer(CommNum).TIME=ActivityTimeout
mov eax, dword [CommNum]
mov ebx,eax
shl ebx,16
mov eax,6
add eax,ebx
mov [_ArgSafe0],eax
mov eax,120000
invoke SetTimer,[!OBMain],[_ArgSafe0],eax,NULL
; LN:998 IF Sync(CommNum)<3 THEN; Not already in sync
mov esi,Sync-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx,3
cmp eax,edx
jge _Lbl197
; LN:999 IF Sync(CommNum)=0 THEN; Waiting for first '"'
mov esi,Sync-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx,0
cmp eax,edx
jne _Lbl198
; LN:1000 IF CommByte=$22 THEN; Is it a '"'?
cmp [CommByte],34
jne _Lbl199
; LN:1001 Sync(CommNum)=1; Yes, 1/3rd of sync accomplished
mov esi,Sync-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov eax,1
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:1002 ELSE
jmp _Lbl200
_Lbl199:
; LN:1003 CALL SUB Resync
call Resync
; LN:1004 END IF
_Lbl200:
; LN:1005 EXIT SUB
ret
; LN:1006 END IF
_Lbl198:
; LN:1007 IF Sync(CommNum)=1 THEN; Waiting for ':'
mov esi,Sync-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx,1
cmp eax,edx
jne _Lbl201
; LN:1008 IF CommByte=$3a THEN; Is it a ':'?
cmp [CommByte],58
jne _Lbl202
; LN:1009 Sync(CommNum)=2; Yes, 2/3rd of sync accomplished
mov esi,Sync-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov eax,2
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:1010 ELSE
jmp _Lbl203
_Lbl202:
; LN:1011 CALL SUB Resync
call Resync
; LN:1012 INCR Events(CommNum)
mov esi,Events-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
inc dword [esi]; INC/DEC operand
; LN:1013 IF StatsFlag=TRUE THEN
cmp [StatsFlag],1
jne _Lbl204
; LN:1014 CALL SUB SetStatsGrid
call SetStatsGrid
; LN:1015 END IF
_Lbl204:
; LN:1016 END IF
_Lbl203:
; LN:1017 EXIT SUB
ret
; LN:1018 END IF
_Lbl201:
; LN:1019 IF Sync(CommNum)=2 THEN; Waiting for last '"'
mov esi,Sync-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx,2
cmp eax,edx
jne _Lbl205
; LN:1020 IF CommByte=$22 THEN; Is it a '"'?
cmp [CommByte],34
jne _Lbl206
; LN:1021 Sync(CommNum)=3; Yes, sync accomplished
mov esi,Sync-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov eax,3
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:1022 ELSE
jmp _Lbl207
_Lbl206:
; LN:1023 CALL SUB Resync
call Resync
; LN:1024 INCR Events(CommNum)
mov esi,Events-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
inc dword [esi]; INC/DEC operand
; LN:1025 IF StatsFlag=TRUE THEN
cmp [StatsFlag],1
jne _Lbl208
; LN:1026 CALL SUB SetStatsGrid
call SetStatsGrid
; LN:1027 END IF
_Lbl208:
; LN:1028 END IF
_Lbl207:
; LN:1029 EXIT SUB
ret
; LN:1030 END IF
_Lbl205:
; LN:1031 ELSE; Get here if in Sync
jmp _Lbl209
_Lbl197:
; LN:1032 IF CommByte=$22 THEN; Got sync start when already in sync (error)
cmp [CommByte],34
jne _Lbl210
; LN:1033 CALL SUB Resync
call Resync
; LN:1034 EXIT SUB
ret
; LN:1035 END IF
_Lbl210:
; LN:1036 IF Preamble(CommNum)=0 THEN; Get first comma
mov esi,Preamble-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx,0
cmp eax,edx
jne _Lbl211
; LN:1037 IF CommByte=CommaCode THEN
cmp [CommByte],44
jne _Lbl212
; LN:1038 Preamble(CommNum)=1
mov esi,Preamble-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov eax,1
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:1039 ELSE; Something is wrong... abort sync
jmp _Lbl213
_Lbl212:
; LN:1040 CALL SUB Resync
call Resync
; LN:1041 INCR Events(CommNum)
mov esi,Events-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
inc dword [esi]; INC/DEC operand
; LN:1042 IF StatsFlag=TRUE THEN
cmp [StatsFlag],1
jne _Lbl214
; LN:1043 CALL SUB SetStatsGrid
call SetStatsGrid
; LN:1044 END IF
_Lbl214:
; LN:1045 END IF
_Lbl213:
; LN:1046 EXIT SUB
ret
; LN:1047 END IF
_Lbl211:
; LN:1048 IF Preamble(CommNum)=1 THEN; This must be the msgtype code
mov esi,Preamble-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx,1
cmp eax,edx
jne _Lbl215
; LN:1049 IF CommByte=CommaCode THEN
cmp [CommByte],44
jne _Lbl216
; LN:1050 IF MsgType(CommNum)<1 OR MsgType(CommNum)>3 THEN
mov esi,MsgType-(1*1*1)
mov eax, dword [CommNum]
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,1
cmp eax,edx
setl bl
xor bh,bh
or bh,bl
mov esi,MsgType-(1*1*1)
mov eax, dword [CommNum]
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,3
cmp eax,edx
setg bl
or bh,bl
je _Lbl217
; LN:1051 CALL SUB Resync; Invalid Msg
call Resync
; LN:1052 EXIT SUB
ret
; LN:1053 END IF
_Lbl217:
; LN:1054 INCR Preamble(CommNum)
mov esi,Preamble-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
inc dword [esi]; INC/DEC operand
; LN:1055 EXIT SUB             
ret
; LN:1056 END IF
_Lbl216:
; LN:1057 MsgType(CommNum)=VAL(CommChar)
mov esi,MsgType-(1*1*1)
mov eax, dword [CommNum]
add esi,eax
mov [_TmpVec1],esi
mov esi,[CommChar]
call __AtoL
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1058 IF MsgType(CommNum)<1 OR MsgType(CommNum)>3 THEN
mov esi,MsgType-(1*1*1)
mov eax, dword [CommNum]
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,1
cmp eax,edx
setl bl
xor bh,bh
or bh,bl
mov esi,MsgType-(1*1*1)
mov eax, dword [CommNum]
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,3
cmp eax,edx
setg bl
or bh,bl
je _Lbl218
; LN:1059 CALL SUB Resync; Invalid Msg
call Resync
; LN:1060 END IF
_Lbl218:
; LN:1061 EXIT SUB
ret
; LN:1062 END IF	
_Lbl215:
; LN:1063 END IF
_Lbl209:
; LN:1065 IF MsgType(CommNum)=1 THEN; Alarm Data
mov esi,MsgType-(1*1*1)
mov eax, dword [CommNum]
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,1
cmp eax,edx
jne _Lbl219
; LN:1066 IF Preamble(CommNum)>1 THEN; Must be in data section
mov esi,Preamble-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx,1
cmp eax,edx
jle _Lbl220
; LN:1067 IF CommByte=CommaCode THEN
cmp [CommByte],44
jne _Lbl221
; LN:1068 LampIndex=CommNum
mov eax, dword [CommNum]
mov [LampIndex],eax
; LN:1069 CALL SUB CommMsgBlink
call CommMsgBlink
; LN:1070 TempAlarm=Val(TempDataStr(CommNum))
mov esi,TempDataStr-(1*10*1)
mov eax, dword [CommNum]
imul eax,10
add esi,eax
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov esi,[_TmpVec1]
call __AtoL
mov byte [TempAlarm],al
; LN:1071 MachAlarmData(CommNum).AlarmData=TempAlarm
mov esi,MachAlarmData-(1*6*1)+4
mov eax, dword [CommNum]
imul eax,6
add esi,eax
mov [_TmpVec1],esi
xor eax,eax
mov al, byte [TempAlarm]
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:1072 IF DataFlag=TRUE THEN
cmp [DataFlag],1
jne _Lbl222
; LN:1073 CALL SUB ClearDataGrid
call ClearDataGrid
; LN:1074 DataGrid.TEXT(1,1)=STR(TempAlarm)
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax,1
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
xor eax,eax
mov al, byte [TempAlarm]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:1075 TempStr="Machine "+STR(CommNum)+" Alarm"
mov eax, dword [CommNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst88
mov [_TmpVec2],esi
mov [_TmpVec2+4],9
mov [_TmpVec2+8],0
mov esi,_StrConst89
mov [_TmpVec3],esi
mov [_TmpVec3+4],7
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:1076 MsgBanner.TEXT=TempStr
mov edi,!MsgBanner
mov [!TargetGUIDesc],edi
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[TempStr]
; LN:1077 END IF
_Lbl222:
; LN:1078 AlarmTimeBox(CommNum).BACKCOLOR=$ff
mov edi,!AlarmTimeBox
mov eax, dword [CommNum]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,255
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:1079 INCR Alarms(CommNum)
mov esi,Alarms-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
inc dword [esi]; INC/DEC operand
; LN:1080 CALL SUB WriteAlarm
call WriteAlarm
; LN:1081 IF StatsFlag=TRUE THEN
cmp [StatsFlag],1
jne _Lbl223
; LN:1082 CALL SUB SetStatsGrid
call SetStatsGrid
; LN:1083 END IF
_Lbl223:
; LN:1084 ;InoTime=DateDiff("s", InoTimeSeed, Now)
; LN:1085 ;IF InoTime<LastInoTime THEN
; LN:1086 ;	MsgBox "Check Computer System Date/Time Setting"
; LN:1087 ;	InoTime=LastInoTime
; LN:1088 ;ELSE
; LN:1089 ;	LastInoTime=InoTime
; LN:1090 ;END IF
; LN:1091 ;LastRecord(CommNum).LastAlarmTimeBox=InoTime
; LN:1092 ;UpdateMachAlarmData(CommNum).AlarmTime=InoTime
; LN:1093 ;IF ToyoAlarmTable(Val(TempDataStr(CommNum)), CommNum).AlarmInfoCode<2 THEN; Not real alarm
; LN:1094 ;	EXIT SUB
; LN:1095 ;END IF
; LN:1096 ;UpdateMachAlarmData(CommNum).AlarmData=Val(TempDataStr(CommNum));;;
; LN:1097 ;UpdateAlarmFileName="AlarmFile"+TRIM$(Str$(CommNum+1))
; LN:1098 ;on error Resume Next
; LN:1099 ;OPEN TRIM$(FilePath) & UpdateAlarmFileName For Binary As UpdateMachAlarmFile
; LN:1100 ;IF LOF(UpdateMachAlarmFile)+1>AlarmNdx(CommNum) THEN
; LN:1101 ;	AlarmNdx(CommNum)=LOF(UpdateMachAlarmFile)+1
; LN:1102 ;ELSE
; LN:1103 ;	MsgBox "FAE: Alm "+Str$(AlarmNdx(CommNum))+":"+Str$(CommNum)+":"+Str$(LOF(UpdateMachAlarmFile))
; LN:1104 ;	EXIT SUB
; LN:1105 ;END IF
; LN:1106 ;PUT UpdateMachAlarmFile, AlarmNdx(CommNum), UpdateMachAlarmData(CommNum)
; LN:1107 ;CLOSE UpdateMachAlarmFile
; LN:1108 ; Write to the current shot file
; LN:1109 ;on error Resume Next
; LN:1110 ;OPEN TRIM$(FilePath) & "CurrentShot" For Binary As UpdateCurrentShotFile
; LN:1111 ;Get UpdateCurrentShotFile, 1, UpdateCurrentShot
; LN:1112 ;UpdateCurrentShot.CurrentShotAlarm(CommNum)=Val(TempDataStr(CommNum))
; LN:1113 ;IF UpdateCurrentShot.CurrentShotFirstAlarmNdx(CommNum)=0 THEN
; LN:1114 ;	UpdateCurrentShot.CurrentShotFirstAlarmNdx(CommNum)=AlarmNdx(CommNum)
; LN:1115 ;END IF
; LN:1116 ;UpdateCurrentShot.CurrentShotLastAlarmNdx(CommNum)=AlarmNdx(CommNum)
; LN:1117 ;PUT UpdateCurrentShotFile, 1, UpdateCurrentShot
; LN:1118 ;CLOSE UpdateCurrentShotFile
; LN:1119 CALL SUB Resync
call Resync
; LN:1120 EXIT SUB
ret
; LN:1121 ELSE
jmp _Lbl224
_Lbl221:
; LN:1122 TempDataStr(CommNum)=TempDataStr(CommNum)+CommChar
mov esi,TempDataStr-(1*10*1)
mov eax, dword [CommNum]
imul eax,10
add esi,eax
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov esi,TempDataStr-(1*10*1)
mov eax, dword [CommNum]
imul eax,10
add esi,eax
mov [_TmpVec2],esi
mov [_TmpVec2+4],10
mov [_TmpVec2+8],0
mov edi,[CommChar]
mov [_TmpVec3],edi
mov edi,[CommChar+4]
mov [_TmpVec3+4],edi
mov edi,[CommChar+8]
mov [_TmpVec3+8],edi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,_TmpVec1
mov esi,_TmpVec2
call __MovStr
; LN:1123 END IF
_Lbl224:
; LN:1124 ELSE
jmp _Lbl225
_Lbl220:
; LN:1125 IF CommByte=CommaCode THEN
cmp [CommByte],44
jne _Lbl226
; LN:1126 INCR Preamble(CommNum)
mov esi,Preamble-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
inc dword [esi]; INC/DEC operand
; LN:1127 END IF
_Lbl226:
; LN:1128 END IF
_Lbl225:
; LN:1129 EXIT SUB
ret
; LN:1130 END IF
_Lbl219:
; LN:1132 IF MsgType(CommNum)=2 THEN; Mode data
mov esi,MsgType-(1*1*1)
mov eax, dword [CommNum]
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,2
cmp eax,edx
jne _Lbl227
; LN:1133 IF CommByte=CommaCode THEN; End of field processing
cmp [CommByte],44
jne _Lbl228
; LN:1134 ;IF IsNumeric(TempDataStr(CommNum))=False THEN; Trap for invalid data
; LN:1135 ;	TempDataStr(CommNum)="253"
; LN:1136 ;END IF
; LN:1137 AlarmTimeBox(CommNum).BACKCOLOR=$ffffff
mov edi,!AlarmTimeBox
mov eax, dword [CommNum]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,16777215
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:1138 TempMode=Val(TempDataStr(CommNum))
mov esi,TempDataStr-(1*10*1)
mov eax, dword [CommNum]
imul eax,10
add esi,eax
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov esi,[_TmpVec1]
call __AtoL
mov byte [TempMode],al
; LN:1139 IF TempMode>40 THEN
cmp [TempMode],40
jle _Lbl229
; LN:1140 CALL SUB Resync
call Resync
; LN:1141 INCR Events(CommNum)
mov esi,Events-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
inc dword [esi]; INC/DEC operand
; LN:1142 IF StatsFlag=TRUE THEN
cmp [StatsFlag],1
jne _Lbl230
; LN:1143 CALL SUB SetStatsGrid
call SetStatsGrid
; LN:1144 END IF
_Lbl230:
; LN:1145 EXIT SUB
ret
; LN:1146 END IF
_Lbl229:
; LN:1147 SELECT CASE TempMode
xor eax,eax
mov al, byte [TempMode]
mov [_SwitchInt],eax
; LN:1148 CASE 0
mov eax,0
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl232
; LN:1149 TempMode=1
mov byte [TempMode],1
; LN:1150 CASE 1
jmp _Lbl231
_Lbl232:
mov eax,1
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl233
; LN:1151 TempMode=1
mov byte [TempMode],1
; LN:1152 CASE 9
jmp _Lbl231
_Lbl233:
mov eax,9
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl234
; LN:1153 TempMode=3
mov byte [TempMode],3
; LN:1154 CASE 11
jmp _Lbl231
_Lbl234:
mov eax,11
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl235
; LN:1155 TempMode=4
mov byte [TempMode],4
; LN:1156 CASE ELSE
jmp _Lbl231
_Lbl235:
; LN:1157 TempMode=2
mov byte [TempMode],2
; LN:1158 END SELECT
jmp _Lbl231
_Lbl236:
_Lbl231:
; LN:1159 LampIndex=CommNum
mov eax, dword [CommNum]
mov [LampIndex],eax
; LN:1160 CALL SUB SetModeLamp
call SetModeLamp
; LN:1161 LampIndex=CommNum
mov eax, dword [CommNum]
mov [LampIndex],eax
; LN:1162 CALL SUB CommMsgBlink
call CommMsgBlink
; LN:1163 INCR Modes(CommNum)
mov esi,Modes-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
inc dword [esi]; INC/DEC operand
; LN:1164 IF StatsFlag=TRUE THEN
cmp [StatsFlag],1
jne _Lbl237
; LN:1165 CALL SUB SetStatsGrid
call SetStatsGrid
; LN:1166 END IF
_Lbl237:
; LN:1167 IF DataFlag=TRUE THEN
cmp [DataFlag],1
jne _Lbl238
; LN:1168 CALL SUB ClearDataGrid
call ClearDataGrid
; LN:1169 DataGrid.TEXT(1,1)=STR(TempMode)
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax,1
dec eax
mov ebx,eax
shl ebx,16
mov eax,1
dec eax
or ebx,eax
xor eax,eax
mov al, byte [TempMode]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:1170 TempStr="Machine "+STR(CommNum)+" Mode"
mov eax, dword [CommNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst90
mov [_TmpVec2],esi
mov [_TmpVec2+4],9
mov [_TmpVec2+8],0
mov esi,_StrConst91
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:1171 MsgBanner.TEXT=TempStr
mov edi,!MsgBanner
mov [!TargetGUIDesc],edi
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[TempStr]
; LN:1172 END IF
_Lbl238:
; LN:1173 CALL SUB WriteMode
call WriteMode
; LN:1174 ;Write out the mode to the Nth mode file
; LN:1175 ;InoTime=DateDIFf("s", InoTimeSeed, Now)
; LN:1176 ;IF InoTime<LastInoTime THEN
; LN:1177 ;	MsgBox "Check Computer System Date/Time Setting"
; LN:1178 ;	InoTime=LastInoTime
; LN:1179 ;ELSE
; LN:1180 ;	LastInoTime=InoTime
; LN:1181 ;END IF
; LN:1182 ;TimeOut(CommNum)=0
; LN:1183 ;LastRecord(CommNum).LastModeTimeBox=InoTime
; LN:1184 ;UpdateMachModeData(CommNum).ModeTime=InoTime
; LN:1185 ;UpdateMachModeData(CommNum).ModeData=ShotMode
; LN:1186 ;UpdateModeFileName="ModeFile"+TRIM$(Str$(CommNum+1))
; LN:1187 ;on error Resume Next
; LN:1188 ;OPEN TRIM$(FilePath) & UpdateModeFileName For Binary As UpdateMachModeFile
; LN:1189 ;IF LOF(UpdateMachModeFile)+1>ModeNdx(CommNum) THEN
; LN:1190 ;		ModeNdx(CommNum)=LOF(UpdateMachModeFile)+1
; LN:1191 ;ELSE
; LN:1192 ;	CLOSE UpdateMachModeFile
; LN:1193 ;	EXIT SUB
; LN:1194 ;END IF
; LN:1195 ;PUT UpdateMachModeFile, ModeNdx(CommNum), UpdateMachModeData(CommNum)
; LN:1196 ;CLOSE UpdateMachModeFile
; LN:1197 ; Write to the current shot file
; LN:1198 ;on error Resume Next
; LN:1199 ;OPEN TRIM$(FilePath) & "CurrentShot" For Binary As UpdateCurrentShotFile
; LN:1200 ;Get UpdateCurrentShotFile, 1, UpdateCurrentShot
; LN:1201 ;IF UpdateCurrentShot.CurrentShotFirstModeNdx(CommNum)=0 THEN
; LN:1202 ;	UpdateCurrentShot.CurrentShotFirstModeNdx(CommNum)=ModeNdx(CommNum)
; LN:1203 ;END IF
; LN:1204 ;UpdateCurrentShot.CurrentShotLastModeNdx(CommNum)=ModeNdx(CommNum)
; LN:1205 ;UpdateCurrentShot.CurrentShotMode(CommNum)=ShotMode
; LN:1206 ;PUT UpdateCurrentShotFile, 1, UpdateCurrentShot
; LN:1207 ;CLOSE UpdateCurrentShotFile
; LN:1208 CALL SUB Resync
call Resync
; LN:1209 EXIT SUB
ret
; LN:1210 ELSE
jmp _Lbl239
_Lbl228:
; LN:1211 TempDataStr(CommNum)=TempDataStr(CommNum)+CommChar
mov esi,TempDataStr-(1*10*1)
mov eax, dword [CommNum]
imul eax,10
add esi,eax
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov esi,TempDataStr-(1*10*1)
mov eax, dword [CommNum]
imul eax,10
add esi,eax
mov [_TmpVec2],esi
mov [_TmpVec2+4],10
mov [_TmpVec2+8],0
mov edi,[CommChar]
mov [_TmpVec3],edi
mov edi,[CommChar+4]
mov [_TmpVec3+4],edi
mov edi,[CommChar+8]
mov [_TmpVec3+8],edi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,_TmpVec1
mov esi,_TmpVec2
call __MovStr
; LN:1212 END IF
_Lbl239:
; LN:1213 END IF
_Lbl227:
; LN:1215 IF MsgType(CommNum)=3 THEN; Shot Data
mov esi,MsgType-(1*1*1)
mov eax, dword [CommNum]
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,3
cmp eax,edx
jne _Lbl240
; LN:1216 IF Preamble(CommNum)<9 THEN; Throw away commas and Preamble(commnum)data
mov esi,Preamble-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx,9
cmp eax,edx
jge _Lbl241
; LN:1217 IF Preamble(CommNum)=2 THEN
mov esi,Preamble-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx,2
cmp eax,edx
jne _Lbl242
; LN:1218 AlarmTimeBox(CommNum).BACKCOLOR=$ffffff
mov edi,!AlarmTimeBox
mov eax, dword [CommNum]
dec eax
imul eax,768
add edi,eax
mov [!TargetGUIDesc],edi
mov eax,16777215
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:1219 IF DataFlag=TRUE THEN
cmp [DataFlag],1
jne _Lbl243
; LN:1220 CALL SUB ClearDataGrid
call ClearDataGrid
; LN:1221 END IF
_Lbl243:
; LN:1222 END IF
_Lbl242:
; LN:1223 IF CommByte=CommaCode THEN
cmp [CommByte],44
jne _Lbl244
; LN:1224 INCR Preamble(CommNum)
mov esi,Preamble-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
inc dword [esi]; INC/DEC operand
; LN:1225 END IF
_Lbl244:
; LN:1226 EXIT SUB
ret
; LN:1227 ELSE; Receive data
jmp _Lbl245
_Lbl241:
; LN:1228 IF CommByte=CommaCode THEN; End of field processing
cmp [CommByte],44
jne _Lbl246
; LN:1229 IF DataField(CommNum)<64 THEN
mov esi,DataField-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx,64
cmp eax,edx
jge _Lbl247
; LN:1230 DecimalPlaces=0
mov dword [DecimalPlaces],0
; LN:1231 DecimalFlag=FALSE
mov byte [DecimalFlag],0
; LN:1232 TempData=""
mov [TempData+12],0
; LN:1233 TempStr=(TempDataStr(CommNum))
mov esi,TempDataStr-(1*10*1)
mov eax, dword [CommNum]
imul eax,10
add esi,eax
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:1234 For Scanner=1 TO LEN(TempStr)
mov [Scanner],1
mov esi,TempStr
call __StrLen
mov [_Tmp1],eax
mov eax,[_Tmp1]
mov [_LopVec4],eax
_Lbl248:
mov eax,[Scanner]
cmp eax,[_LopVec4]
jg _Lbl250
; LN:1235 TempChar=MID(TempStr,Scanner,1)
mov edi,[TempStr]
mov [_TmpVec1],edi
mov edi,[TempStr+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [Scanner]
mov edx,1
call __MidStr
mov edi,TempChar
mov esi,_TmpVec1
call __MovStr
; LN:1236 IF TempChar="." THEN
mov esi,_StrConst92
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempChar
mov esi,_TmpVec1
call __CmpStr
jne _Lbl251
; LN:1237 DecimalFlag=TRUE
mov byte [DecimalFlag],1
; LN:1238 ELSE
jmp _Lbl252
_Lbl251:
; LN:1239 TempData=TempData+TempChar
mov edi,[TempData]
mov [_TmpVec1],edi
mov edi,[TempData+4]
mov [_TmpVec1+4],edi
mov edi,[TempData+8]
mov [_TmpVec1+8],edi
mov edi,[TempChar]
mov [_TmpVec2],edi
mov edi,[TempChar+4]
mov [_TmpVec2+4],edi
mov edi,[TempChar+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,TempData
mov esi,_TmpVec1
call __MovStr
; LN:1240 IF DecimalFlag=TRUE THEN
cmp [DecimalFlag],1
jne _Lbl253
; LN:1241 INCR DecimalPlaces
inc [DecimalPlaces]
; LN:1242 END IF
_Lbl253:
; LN:1243 END IF
_Lbl252:
; LN:1244 NEXT Scanner
_Lbl249:
inc [Scanner]
jmp _Lbl248
_Lbl250:
; LN:1245 TempValue=VAL(TempData)
mov esi,[TempData]
call __AtoL
mov dword [TempValue],eax
; LN:1246 FOR Scanner=1 TO 3-DecimalPlaces
mov [Scanner],1
mov eax,3
mov edx, dword [DecimalPlaces]
sub eax,edx
mov [_LopVec4],eax
_Lbl254:
mov eax,[Scanner]
cmp eax,[_LopVec4]
jg _Lbl256
; LN:1247 TempValue=TempValue*10
mov eax, dword [TempValue]
mov edx,10
imul edx
mov dword [TempValue],eax
; LN:1248 NEXT Scanner
_Lbl255:
inc [Scanner]
jmp _Lbl254
_Lbl256:
; LN:1249 IF DataFlag=TRUE THEN
cmp [DataFlag],1
jne _Lbl257
; LN:1250 TempStr="Machine "+STR(CommNum)+" Shot"
mov eax, dword [CommNum]
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
mov [_TmpVec2+4],9
mov [_TmpVec2+8],0
mov esi,_StrConst94
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:1251 MsgBanner.TEXT=TempStr
mov edi,!MsgBanner
mov [!TargetGUIDesc],edi
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[TempStr]
; LN:1252 DataGridRow=DataField(CommNum)/8+1
mov esi,DataField-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx,8
cmp edx,0
jne _Lbl258
mov [ERR],$db00db00
jmp [_ErrVec]
_Lbl258:
mov ecx,edx
xor edx,edx
idiv ecx
mov edx,1
add eax,edx
mov dword [DataGridRow],eax
; LN:1253 DataGridCol=MOD(DataField(CommNum),8)+1
mov esi,DataField-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx,8
mov ecx,edx
xor edx,edx
idiv ecx
mov eax,edx
mov edx,1
add eax,edx
mov dword [DataGridCol],eax
; LN:1254 IF DataGridCol=0 THEN
cmp [DataGridCol],0
jne _Lbl259
; LN:1255 DataGridCol=8
mov dword [DataGridCol],8
; LN:1256 END IF
_Lbl259:
; LN:1257 ;;;TempDataStr(CommNum)=STR(TempValue);;;
; LN:1258 DataGrid.TEXT(DataGridRow,DataGridCol)=(TempDataStr(CommNum))
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [DataGridRow]
dec eax
mov ebx,eax
shl ebx,16
mov eax, dword [DataGridCol]
dec eax
or ebx,eax
mov esi,TempDataStr-(1*10*1)
mov eax, dword [CommNum]
imul eax,10
add esi,eax
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
invoke SendMessage, dword [edi+HandleOffs],GM_SETCELLDATA,ebx,[_TmpVec1]
; LN:1259 END IF
_Lbl257:
; LN:1260 ;IF IsNumeric(TempDataStr(CommNum))=False THEN; Trap for invalid data
; LN:1261 ;	OPEN TRIM$(FilePath) & "CommErrorLog.TXT" For Append As CommLogFile
; LN:1262 ;	Print CommLogFile, "Data", Now, CommNum, TempDataStr(CommNum)
; LN:1263 ;	CLOSE CommLogFile
; LN:1264 ;	CALL SUB Resync
; LN:1265 ;	EXIT SUB
; LN:1266 ;END IF
; LN:1267 ;IF DataField(CommNum)=48 And Val(TempDataStr(CommNum))<5 THEN; Trap for Short Cycle
; LN:1268 ;	OPEN TRIM$(FilePath) & "CommErrorLog.TXT" For Append As CommLogFile
; LN:1269 ;	Print CommLogFile, "Short Cycle", Now, CommNum, TempDataStr(CommNum)
; LN:1270 ;	CLOSE CommLogFile
; LN:1271 ;	CALL SUB Resync
; LN:1272 ;	EXIT SUB
; LN:1273 ;END IF
; LN:1274 MachShotData(CommNum).ShotData(DataField(CommNum)+1)=TempValue
mov esi,MachShotData-(1*265*1)+5
mov eax, dword [CommNum]
imul eax,265
add esi,eax
mov [_TmpVec1],esi
mov esi,DataField-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,0-(1*4*1)
mov eax, dword [_Tmp1]
imul eax,4
add esi,eax
mov [_TmpVec3],esi
mov eax,[_TmpVec1]
add eax,[_TmpVec3]
mov [_TmpVec1],eax
mov eax, dword [TempValue]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:1275 TempDataStr(CommNum)=""
mov esi,TempDataStr-(1*10*1)
mov eax, dword [CommNum]
imul eax,10
add esi,eax
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_NullStr
call __MovStr
; LN:1276 INCR DataField(CommNum); Deliberate post-increment
mov esi,DataField-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
inc dword [esi]; INC/DEC operand
; LN:1277 END IF
_Lbl247:
; LN:1278 ELSE; Accumulate data
jmp _Lbl260
_Lbl246:
; LN:1279 IF CommByte=$0d THEN; Should never get here
cmp [CommByte],13
jne _Lbl261
; LN:1280 CALL SUB Resync
call Resync
; LN:1281 INCR Events(CommNum)
mov esi,Events-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
inc dword [esi]; INC/DEC operand
; LN:1282 IF StatsFlag=TRUE THEN
cmp [StatsFlag],1
jne _Lbl262
; LN:1283 CALL SUB SetStatsGrid
call SetStatsGrid
; LN:1284 END IF
_Lbl262:
; LN:1285 EXIT SUB
ret
; LN:1286 ELSE
jmp _Lbl263
_Lbl261:
; LN:1287 TempDataStr(CommNum)=TempDataStr(CommNum)+CommChar
mov esi,TempDataStr-(1*10*1)
mov eax, dword [CommNum]
imul eax,10
add esi,eax
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov esi,TempDataStr-(1*10*1)
mov eax, dword [CommNum]
imul eax,10
add esi,eax
mov [_TmpVec2],esi
mov [_TmpVec2+4],10
mov [_TmpVec2+8],0
mov edi,[CommChar]
mov [_TmpVec3],edi
mov edi,[CommChar+4]
mov [_TmpVec3+4],edi
mov edi,[CommChar+8]
mov [_TmpVec3+8],edi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,_TmpVec1
mov esi,_TmpVec2
call __MovStr
; LN:1288 END IF
_Lbl263:
; LN:1289 END IF
_Lbl260:
; LN:1290 IF DataField(CommNum)=64 THEN
mov esi,DataField-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx,64
cmp eax,edx
jne _Lbl264
; LN:1291 LampIndex=CommNum
mov eax, dword [CommNum]
mov [LampIndex],eax
; LN:1292 IF Mode(CommNum)<>3 AND Mode(CommNum)<>4 THEN
mov esi,Mode-(1*1*1)
mov eax, dword [CommNum]
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,3
cmp eax,edx
setne bl
xor bh,bh
or bh,bl
mov esi,Mode-(1*1*1)
mov eax, dword [CommNum]
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,4
cmp eax,edx
setne bl
and bh,bl
je _Lbl265
; LN:1293 Mode(CommNum)=5
mov esi,Mode-(1*1*1)
mov eax, dword [CommNum]
add esi,eax
mov [_TmpVec1],esi
mov eax,5
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1294 TempMode=5
mov byte [TempMode],5
; LN:1295 CALL SUB WriteMode
call WriteMode
; LN:1296 CALL SUB SetModeLamp
call SetModeLamp
; LN:1297 END IF
_Lbl265:
; LN:1298 CALL SUB CommMsgBlink
call CommMsgBlink
; LN:1299 INCR Shots(CommNum)
mov esi,Shots-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
inc dword [esi]; INC/DEC operand
; LN:1300 IF StatsFlag=TRUE THEN
cmp [StatsFlag],1
jne _Lbl266
; LN:1301 CALL SUB SetStatsGrid
call SetStatsGrid
; LN:1302 END IF
_Lbl266:
; LN:1303 CALL SUB WriteShot
call WriteShot
; LN:1304 OPEN "CurrentShot" FOR UPDATE AS CurrentShotFile
mov esi,_StrConst95
mov [_TmpVec1],esi
mov [_TmpVec1+4],12
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_READ+GENERIC_WRITE,FILE_SHARE_READ+FILE_SHARE_WRITE,0,OPEN_ALWAYS,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [CurrentShotFile],eax
cmp eax,-1
jg _OELbl11
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl11:
; LN:1305 GET CurrentShotFile,CurrentShot
mov eax, dword [CurrentShotFile]
mov [_IOPthNum],eax
mov esi,CurrentShot+0
mov [_TmpVec1],esi
mov [_XferAddr],esi
mov [XferCount],7599
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl12
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl12:
; LN:1306 FOR LoopVar=1 TO 64
mov [LoopVar],1
_Lbl267:
cmp [LoopVar],64
jg _Lbl269
; LN:1307 CurrentShot.CurrentShotData(LoopVar,CommNum)=MachShotData(CommNum).ShotData(LoopVar)
mov esi,0-(1*4*17)
mov eax, dword [LoopVar]
imul eax,4
mov edx,eax
imul edx,17
mov eax, dword [CommNum]
dec eax
imul eax,4
add eax,edx
add esi,eax
mov [_TmpVec1],esi
mov esi,CurrentShot+85
mov [_TmpVec2],esi
mov eax,[_TmpVec2]
add eax,[_TmpVec1]
mov [_TmpVec2],eax
mov esi,MachShotData-(1*265*1)+5
mov eax, dword [CommNum]
imul eax,265
add esi,eax
mov [_TmpVec3],esi
mov esi,0-(1*4*1)
mov eax, dword [LoopVar]
imul eax,4
add esi,eax
mov [_TmpVec4],esi
mov eax,[_TmpVec3]
add eax,[_TmpVec4]
mov [_TmpVec3],eax
mov edi,[_TmpVec3]
mov eax, dword [edi]
mov esi,[_TmpVec2]
mov dword [esi],eax
; LN:1308 NEXT LoopVar
_Lbl268:
inc [LoopVar]
jmp _Lbl267
_Lbl269:
; LN:1309 PUT CurrentShotFile,CurrentShot
mov eax, dword [CurrentShotFile]
mov [_IOPthNum],eax
mov esi,CurrentShot+0
mov [_TmpVec1],esi
mov [_XferAddr],esi
mov [XferCount],7599
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl13
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl13:
; LN:1310 CLOSE CurrentShotFile
mov eax, dword [CurrentShotFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl14
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl14:
; LN:1311 CALL SUB CurrentToProduction; Updates production record with static and dynamic data
call CurrentToProduction
; LN:1312 ;Write out the shot to the Nth shot file
; LN:1313 ;InoTime=DateDiff("s", InoTimeSeed, Now)
; LN:1314 ;TimeOut(CommNum)=0
; LN:1315 ;LastRecord(CommNum).LastShotTime=InoTime
; LN:1316 ;UpdateMachShotData(CommNum).ShotTime=InoTime
; LN:1317 ;UpdateMachShotData(CommNum).ShotMode=QueryCurrentShot.CurrentShotMode(CommNum)
; LN:1318 ;MsgBox UpdateMachShotData(CommNum).ShotTime
; LN:1319 ;UpdateShotFileName="ShotFile"+TRIM$(Str$(CommNum+1))
; LN:1320 ;OPEN TRIM$(FilePath) & UpdateShotFileName For Binary As UpdateMachShotFile
; LN:1321 ;IF LOF(UpdateMachShotFile)+1>ShotNdx(CommNum) THEN
; LN:1322 ;	ShotNdx(CommNum)=LOF(UpdateMachShotFile)+1
; LN:1323 ;ELSE
; LN:1324 ;	CLOSE UpdateMachShotFile
; LN:1325 ;	EXIT SUB
; LN:1326 ;END IF
; LN:1327 ;PUT UpdateMachShotFile, ShotNdx(CommNum), MachShotData(CommNum)
; LN:1328 ;CLOSE UpdateMachShotFile
; LN:1329 ; Write to the current shot file
; LN:1330 ;on error Resume Next
; LN:1331 ;OPEN TRIM$(FilePath) & "CurrentShot" For Binary As UpdateCurrentShotFile
; LN:1332 ;Get UpdateCurrentShotFile, 1, UpdateCurrentShot
; LN:1333 ;IF UpdateCurrentShot.CurrentShotFirstNdx(CommNum)=0 THEN
; LN:1334 ;	UpdateCurrentShot.CurrentShotFirstNdx(CommNum)=ShotNdx(CommNum)
; LN:1335 ;END IF
; LN:1336 ;FOR LoopVar=1 TO 64; Copy shot data into current shot
; LN:1337 ;	UpdateCurrentShot.CurrentShotData(CommNum, LoopVar)=UpdateMachShotData(CommNum).ShotData(LoopVar)
; LN:1338 ;NEXT LoopVar
; LN:1339 ;UpdateCurrentShot.CurrentShotLastNdx(CommNum)=ShotNdx(CommNum)
; LN:1340 ;UpdateCurrentShot.CurrentShotTotal(CommNum)=UpdateCurrentShot.CurrentShotTotal(CommNum)+1
; LN:1341 ;IF CurrentProd.CurrentCavities(CommNum)>0 THEN
; LN:1342 ;	UpdateCurrentShot.CurrentShotAccepted(CommNum)=UpdateCurrentShot.CurrentShotAccepted(CommNum)+CurrentProd.CurrentCavities(CommNum)
; LN:1343 ;ELSE
; LN:1344 ;	UpdateCurrentShot.CurrentShotAccepted(CommNum)=UpdateCurrentShot.CurrentShotAccepted(CommNum)+1
; LN:1345 ;END IF
; LN:1346 ; Put loop here to Update up to 16 cavity totals %%%%%%%%%%%%%%%%*****
; LN:1347 ;UpdateCurrentShot.CurrentShotTime(CommNum)=UpdateMachShotData(CommNum).ShotTime
; LN:1348 ;UpdateCurrentShot.CurrentShotMode(CommNum)=UpdateMachShotData(CommNum).ShotMode
; LN:1349 ;IF UpdateCurrentShot.CurrentShotMode(CommNum)<3 THEN; Unknown, Off, or Manual
; LN:1350 ;	UpdateCurrentShot.CurrentShotMode(CommNum)=5; Force mode to 'Run'
; LN:1351 ;	UpdateMachModeData(CommNum).ModeTime=InoTime
; LN:1352 ;	UpdateMachModeData(CommNum).ModeData=5
; LN:1353 ;	Added this code to simulate;Run mode in mode file itself for use in efficiency report
; LN:1354 ;	UpdateModeFileName="ModeFile"+TRIM$(Str$(CommNum+1))
; LN:1355 ;	;on error Resume Next
; LN:1356 ;	OPEN TRIM$(FilePath) & UpdateModeFileName For Binary As UpdateMachModeFile
; LN:1357 ;	IF LOF(UpdateMachModeFile)+1>ModeNdx(CommNum) THEN
; LN:1358 ;		ModeNdx(CommNum)=LOF(UpdateMachModeFile)+1
; LN:1359 ;	ELSE
; LN:1360 ;		CLOSE UpdateMachModeFile
; LN:1361 ;		EXIT SUB
; LN:1362 ;	END IF
; LN:1363 ;	PUT UpdateMachModeFile, ModeNdx(CommNum), UpdateMachModeData(CommNum)
; LN:1364 ;	CLOSE UpdateMachModeFile
; LN:1365 ;	IF UpdateCurrentShot.CurrentShotFirstModeNdx(CommNum)=0 THEN
; LN:1366 ;		UpdateCurrentShot.CurrentShotFirstModeNdx(CommNum)=ModeNdx(CommNum)
; LN:1367 ;	END IF
; LN:1368 ;END IF
; LN:1369 ;PUT UpdateCurrentShotFile, 1, UpdateCurrentShot
; LN:1370 ;CLOSE UpdateCurrentShotFile
; LN:1371 ;INCR DataField(CommNum); Point past real data
; LN:1372 ;Production.ProdActive=TRUE
; LN:1373 ;CurrentNdx=CommNum; Set index for CurrentToProduction call
; LN:1374 ;CALL SUB CurrentToProduction; Updates production record with static and dynamic data
; LN:1375 CALL SUB Resync; This is the new way to terminate sync rather than wait for a CR
call Resync
; LN:1376 END IF
_Lbl264:
; LN:1377 END IF
_Lbl245:
; LN:1378 END IF
_Lbl240:
; LN:1379 EXIT SUB
ret
; LN:1380 ;MSComm1Trap:
; LN:1381 ;ON ERROR GOTO 0
; LN:1382 ;IF ErrorFlag=True THEN
; LN:1383 ;	MsgBox "LoadAlarms Error"
; LN:1384 ;ELSE
; LN:1385 ;	CALL SUB FileError
; LN:1386 ;END IF
; LN:1387 END SUB
ret
;________________________________________________________________________________________________________________________________
; LN:1389 BEGIN SUB CurrentToProduction
CurrentToProduction:
; LN:1390 exit sub;;;
ret
; LN:1391 ;Production.ProdMachID=CurrentNdx
; LN:1392 ;Production.ProdType=CurrentProd.CurrentType(CurrentNdx)
; LN:1393 ;Production.ProdFirstShotNdx=QueryCurrentShot.CurrentShotFirstNdx(CurrentNdx)
; LN:1394 ;Production.ProdLastShotNdx=QueryCurrentShot.CurrentShotLastNdx(CurrentNdx)
; LN:1395 ;Production.ProdFirstModeNdx=QueryCurrentShot.CurrentShotFirstModeNdx(CurrentNdx)
; LN:1396 ;Production.ProdLastModeNdx=QueryCurrentShot.CurrentShotLastModeNdx(CurrentNdx)
; LN:1397 ;Production.ProdFirstAlarmNdx=QueryCurrentShot.CurrentShotFirstAlarmNdx(CurrentNdx)
; LN:1398 ;Production.ProdLastAlarmNdx=QueryCurrentShot.CurrentShotLastAlarmNdx(CurrentNdx)
; LN:1399 ;Production.ProdFirstSetupNdx=QueryCurrentShot.CurrentShotFirstSetupNdx(CurrentNdx)
; LN:1400 ;Production.ProdLastSetupNdx=QueryCurrentShot.CurrentShotLastSetupNdx(CurrentNdx)
; LN:1401 ;Production.ProdPartDescription=CurrentProd.CurrentPartDescription(CurrentNdx)
; LN:1402 ;Production.ProdCustomer=CurrentProd.CurrentCustomer(CurrentNdx)
; LN:1403 ;Production.ProdRunID=CurrentProd.CurrentRunID(CurrentNdx)
; LN:1404 ;Production.ProdStart=CurrentProd.CurrentStart(CurrentNdx)
; LN:1405 ;Production.ProdEnd=InoTime 'Now
; LN:1406 ;Production.ProdAccepted=QueryCurrentShot.CurrentShotAccepted(CurrentNdx)
; LN:1407 ;Production.ProdRejected=QueryCurrentShot.CurrentShotAutoRejected(CurrentNdx) + CurrentProd.CurrentManualRejected(CurrentNdx)
; LN:1408 ;Production.ProdMoldID=CurrentProd.CurrentMoldID(CurrentNdx)
; LN:1409 ;Production.ProdCavities=CurrentProd.CurrentCavities(CurrentNdx)
; LN:1410 ;Production.ProdTolerance=CurrentProd.CurrentTolerance(CurrentNdx)
; LN:1411 ;Production.ProdCycle=CurrentProd.CurrentCycle(CurrentNdx)
; LN:1412 ;Production.ProdWeight=CurrentProd.CurrentWeight(CurrentNdx)
; LN:1413 ;Production.ProdLabor=CurrentProd.CurrentLabor(CurrentNdx)
; LN:1414 ;Production.ProdPrice=CurrentProd.CurrentPrice(CurrentNdx)
; LN:1415 ;FOR I=1 TO 16
; LN:1416 ;Production.ProdCavityNames(I)=CurrentProd.CurrentCavityNames(I, (CurrentNdx))
; LN:1417 ;Production.ProdCavityWeight(I)=CurrentProd.CurrentCavityWeight(I, (CurrentNdx))
; LN:1418 ;Production.ProdCavityLabor(I)=CurrentProd.CurrentCavityLabor(I, (CurrentNdx))
; LN:1419 ;Production.ProdCavityPrice(I)=CurrentProd.CurrentCavityPrice(I, (CurrentNdx))
; LN:1420 ;NEXT I
; LN:1421 ;Production.ProdCustOrderNum=CurrentProd.CurrentCustOrderNum(CurrentNdx)
; LN:1422 ;Production.ProdMaterial=CurrentProd.CurrentMaterial(CurrentNdx)
; LN:1423 ;Production.ProdDye=CurrentProd.CurrentDye(CurrentNdx)
; LN:1424 ;Production.ProdAdditive=CurrentProd.CurrentAdditive(CurrentNdx)
; LN:1425 ;Production.ProdComment=CurrentProd.CurrentComment(CurrentNdx)
; LN:1426 ;IF TRIM$(CurrentProd.CurrentPartDescription(CurrentNdx))="" THEN ; Spurious
; LN:1427 ;	EXIT SUB
; LN:1428 ;END IF
; LN:1429 ;ON ERROR GOTO CurrentToProductionTrap
; LN:1430 ;OPEN TRIM$(FilePath) + "Prod_" + TRIM$(CurrentProd.CurrentPartDescription(CurrentNdx)) For Binary As ProductionFile
; LN:1431 ;IF CurrentProd.CurrentRecordNum(CurrentNdx)=0 Then ' Mark the record that will be the permanent home for this production block
; LN:1432 ;    CurrentProd.CurrentRecordNum(CurrentNdx)=LOF(ProductionFile) + 1
; LN:1433 ;    OPEN TRIM$(FilePath) & "CurrentProduction" For Binary As TempFile
; LN:1434 ;    PUT TempFile, , CurrentProd ' Put index to production file in file
; LN:1435 ;    CLOSE TempFile
; LN:1436 ;    UpdateLogData.LogTime=InoTime
; LN:1437 ;    UpdateLogData.LogMachNum=CurrentNdx
; LN:1438 ;    UpdateLogData.LogType=1 ' Normal Log Entry
; LN:1439 ;    UpdateLogData.LogProdFileNdx=CurrentProd.CurrentRecordNum(CurrentNdx)
; LN:1440 ;    UpdateLogData.LogPartNum=CurrentProd.CurrentPartNum(CurrentNdx)
; LN:1441 ;    OPEN TRIM$(FilePath) & "Log" For Binary As UpdateLogFile
; LN:1442 ;    PUT UpdateLogFile, LOF(UpdateLogFile) + 1, UpdateLogData
; LN:1443 ;    CLOSE UpdateLogFile
; LN:1444 ;END IF
; LN:1445 ;PUT ProductionFile, CurrentProd.CurrentRecordNum(CurrentNdx), Production ' Write the production record
; LN:1446 ;CLOSE ProductionFile
; LN:1447 ;ON ERROR GOTO 0
; LN:1448 ;EXIT SUB
; LN:1449 ;CurrentToProductionTrap:
; LN:1450 ;CLOSE UpdateLogFile
; LN:1451 ;CLOSE ProductionFile
; LN:1452 ;ON ERROR GOTO 0
; LN:1453 ;IF ErrorFlag=True Then
; LN:1454 ;    MsgBox "CurrentToproduction Error"
; LN:1455 ;ELSE
; LN:1456 ;    CALL FileError
; LN:1457 ;END IF
; LN:1458 END SUB
ret
;________________________________________________________________________________________________________________________________
; LN:1460 BEGIN SUB FileError
FileError:
; LN:1461 WARNINGBOX "File Error","A File Error Has Occurred",MB_OK
mov esi,_StrConst96
mov [_TmpVec1],esi
mov [_TmpVec1+4],11
mov [_TmpVec1+8],0
mov esi,_StrConst97
mov [_TmpVec2],esi
mov [_TmpVec2+4],26
mov [_TmpVec2+8],0
invoke MessageBox,[!OBMain],[_TmpVec2],[_TmpVec1],MB_OK+MB_ICONWARNING
mov [STATUS],eax
; LN:1462 END SUB
ret
;________________________________________________________________________________________________________________________________
; LN:1464 BEGIN SUB ClearDataGrid
ClearDataGrid:
; LN:1465 ;DataGrid.gridclear
; LN:1466 FOR I=1 TO 8
mov [I],1
_Lbl270:
cmp [I],8
jg _Lbl272
; LN:1467 FOR J=1 TO 8
mov [J],1
_Lbl273:
cmp [J],8
jg _Lbl275
; LN:1468 DataGrid.TEXT(I,J)=""
mov edi,!DataGrid
mov [!TargetGUIDesc],edi
mov eax, dword [I]
dec eax
mov ebx,eax
shl ebx,16
mov eax, dword [J]
dec eax
or ebx,eax
invoke SendMessage, dword [edi+HandleOffs],GM_SETCELLDATA,ebx,[_NullStr]
; LN:1469 NEXT J
_Lbl274:
inc [J]
jmp _Lbl273
_Lbl275:
; LN:1470 NEXT I
_Lbl271:
inc [I]
jmp _Lbl270
_Lbl272:
; LN:1471 END SUB
ret
;________________________________________________________________________________________________________________________________
; LN:1473 BEGIN SUB ClearStatsGrid
ClearStatsGrid:
; LN:1474 ;StatsGrid.gridclear
; LN:1475 FOR I=1 TO 6
mov [I],1
_Lbl276:
cmp [I],6
jg _Lbl278
; LN:1476 FOR J=2 TO 17
mov [J],2
_Lbl279:
cmp [J],17
jg _Lbl281
; LN:1477 StatsGrid.VALUE(I,J)=0
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
mov eax, dword [I]
dec eax
mov ebx,eax
shl ebx,16
mov eax, dword [J]
dec eax
or ebx,eax
mov eax,0
mov [_ArgSafe1],eax
invoke SendMessage, dword [edi+HandleOffs],GM_SETCELLDATA,ebx,_ArgSafe1
; LN:1478 NEXT J
_Lbl280:
inc [J]
jmp _Lbl279
_Lbl281:
; LN:1479 NEXT I
_Lbl277:
inc [I]
jmp _Lbl276
_Lbl278:
; LN:1480 END SUB
ret
;________________________________________________________________________________________________________________________________
; LN:1482 BEGIN SUB SetStatsGrid
SetStatsGrid:
; LN:1483 FOR J=2 TO 17
mov [J],2
_Lbl282:
cmp [J],17
jg _Lbl284
; LN:1484 StatsGrid.VALUE(1,J)=Shots(J-1)
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
mov eax,1
dec eax
mov ebx,eax
shl ebx,16
mov eax, dword [J]
dec eax
or ebx,eax
mov eax, dword [J]
mov edx,1
sub eax,edx
mov [_Tmp1],eax
mov esi,Shots-(1*4*1)
mov eax, dword [_Tmp1]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov [_ArgSafe1],eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],GM_SETCELLDATA,ebx,_ArgSafe1
; LN:1485 StatsGrid.VALUE(2,J)=Modes(J-1)
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
mov eax,2
dec eax
mov ebx,eax
shl ebx,16
mov eax, dword [J]
dec eax
or ebx,eax
mov eax, dword [J]
mov edx,1
sub eax,edx
mov [_Tmp1],eax
mov esi,Modes-(1*4*1)
mov eax, dword [_Tmp1]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov [_ArgSafe1],eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],GM_SETCELLDATA,ebx,_ArgSafe1
; LN:1486 StatsGrid.VALUE(3,J)=Alarms(J-1)
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
mov eax,3
dec eax
mov ebx,eax
shl ebx,16
mov eax, dword [J]
dec eax
or ebx,eax
mov eax, dword [J]
mov edx,1
sub eax,edx
mov [_Tmp1],eax
mov esi,Alarms-(1*4*1)
mov eax, dword [_Tmp1]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov [_ArgSafe1],eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],GM_SETCELLDATA,ebx,_ArgSafe1
; LN:1487 StatsGrid.VALUE(4,J)=Events(J-1)
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
mov eax,4
dec eax
mov ebx,eax
shl ebx,16
mov eax, dword [J]
dec eax
or ebx,eax
mov eax, dword [J]
mov edx,1
sub eax,edx
mov [_Tmp1],eax
mov esi,Events-(1*4*1)
mov eax, dword [_Tmp1]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov [_ArgSafe1],eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],GM_SETCELLDATA,ebx,_ArgSafe1
; LN:1488 StatsGrid.VALUE(5,J)=Bytes(J-1)
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
mov eax,5
dec eax
mov ebx,eax
shl ebx,16
mov eax, dword [J]
dec eax
or ebx,eax
mov eax, dword [J]
mov edx,1
sub eax,edx
mov [_Tmp1],eax
mov esi,Bytes-(1*4*1)
mov eax, dword [_Tmp1]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov [_ArgSafe1],eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],GM_SETCELLDATA,ebx,_ArgSafe1
; LN:1489 StatsGrid.VALUE(6,J)=Errors(J-1)
mov edi,!StatsGrid
mov [!TargetGUIDesc],edi
mov eax,6
dec eax
mov ebx,eax
shl ebx,16
mov eax, dword [J]
dec eax
or ebx,eax
mov eax, dword [J]
mov edx,1
sub eax,edx
mov [_Tmp1],eax
mov esi,Errors-(1*4*1)
mov eax, dword [_Tmp1]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov [_ArgSafe1],eax
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],GM_SETCELLDATA,ebx,_ArgSafe1
; LN:1490 NEXT J
_Lbl283:
inc [J]
jmp _Lbl282
_Lbl284:
; LN:1491 END SUB
ret
;________________________________________________________________________________________________________________________________
; LN:1493 ActivityTimer.TIMEOUT
ActivityTimer_TIMEOUT:
; LN:1494 LampIndex=ArrayIndex
mov eax, dword [ArrayIndex]
mov [LampIndex],eax
; LN:1495 ActivityTimer(LampIndex).STOP
mov eax, dword [LampIndex]
mov ebx,eax
shl ebx,16
mov eax,6
add eax,ebx
invoke KillTimer,[!OBMain],eax
; LN:1496 IF Mode(LampIndex)<>0 AND Mode(LampIndex)<>1 AND Mode(LampIndex)<>2 THEN
mov esi,Mode-(1*1*1)
mov eax, dword [LampIndex]
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,0
cmp eax,edx
setne bl
xor bh,bh
or bh,bl
mov esi,Mode-(1*1*1)
mov eax, dword [LampIndex]
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,1
cmp eax,edx
setne bl
and bh,bl
mov esi,Mode-(1*1*1)
mov eax, dword [LampIndex]
add esi,eax
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,2
cmp eax,edx
setne bl
and bh,bl
je _Lbl286
; LN:1497 Mode(LampIndex)=0
mov esi,Mode-(1*1*1)
mov eax, dword [LampIndex]
add esi,eax
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1498 TempMode=0
mov byte [TempMode],0
; LN:1499 CALL SUB WriteMode
call WriteMode
; LN:1500 CALL SUB SetModeLamp
call SetModeLamp
; LN:1501 ; Write record to Modefile
; LN:1502 ; Write record to CommLogFile
; LN:1503 INCR Events(LampIndex)
mov esi,Events-(1*4*1)
mov eax, dword [LampIndex]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
inc dword [esi]; INC/DEC operand
; LN:1504 IF StatsFlag=TRUE THEN
cmp [StatsFlag],1
jne _Lbl287
; LN:1505 CALL SUB SetStatsGrid
call SetStatsGrid
; LN:1506 END IF
_Lbl287:
; LN:1507 END IF
_Lbl286:
; LN:1508 END EVENT
ret
;________________________________________________________________________________________________________________________________
; LN:1510 BEGIN SUB Resync
Resync:
; LN:1511 Sync(CommNum)=0
mov esi,Sync-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:1512 Preamble(CommNum)=0
mov esi,Preamble-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:1513 MsgType(CommNum)=0
mov esi,MsgType-(1*1*1)
mov eax, dword [CommNum]
add esi,eax
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1514 DataField(CommNum)=0
mov esi,DataField-(1*4*1)
mov eax, dword [CommNum]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:1515 TempDataStr(CommNum)=""
mov esi,TempDataStr-(1*10*1)
mov eax, dword [CommNum]
imul eax,10
add esi,eax
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_NullStr
call __MovStr
; LN:1516 END SUB Resync
ret
;________________________________________________________________________________________________________________________________
; LN:1518 BEGIN SUB ResyncAll
ResyncAll:
; LN:1519 FOR I = 1 TO 16
mov [I],1
_Lbl288:
cmp [I],16
jg _Lbl290
; LN:1520 ;ShotNdx(I)=0
; LN:1521 ;ModeNdx(I)=0
; LN:1522 ;AlarmNdx(I)=0
; LN:1523 Sync(I)=0
mov esi,Sync-(1*4*1)
mov eax, dword [I]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:1524 Preamble(I)=0
mov esi,Preamble-(1*4*1)
mov eax, dword [I]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:1525 DataField(I)=0
mov esi,DataField-(1*4*1)
mov eax, dword [I]
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:1526 MsgType(I)=0
mov esi,MsgType-(1*1*1)
mov eax, dword [I]
add esi,eax
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1527 TempDataStr(I)=""
mov esi,TempDataStr-(1*10*1)
mov eax, dword [I]
imul eax,10
add esi,eax
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_NullStr
call __MovStr
; LN:1528 ;TimeOut(I)=0
; LN:1529 NEXT I
_Lbl289:
inc [I]
jmp _Lbl288
_Lbl290:
; LN:1530 END SUB
ret
;________________________________________________________________________________________________________________________________
; LN:1532 BEGIN SUB BreakSync
BreakSync:
; LN:1533 RawSync=0
mov dword [RawSync],0
; LN:1534 SrcMacAddr=0
mov dword [SrcMacAddr],0
; LN:1535 END SUB
ret
;________________________________________________________________________________________________________________________________
; LN:1537 BEGIN SUB InitWired
InitWired:
; LN:1538 FirstCommPort=ConfigData.FirstPort
mov esi,ConfigData+91
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov dword [FirstCommPort],eax
; LN:1539 LastCommPort=FirstCommPort+ConfigData.NumPorts-1
mov esi,ConfigData+92
mov [_TmpVec1],esi
mov eax, dword [FirstCommPort]
mov edi,[_TmpVec1]
xor edx,edx
mov dl, byte [edi]
add eax,edx
mov edx,1
sub eax,edx
mov dword [LastCommPort],eax
; LN:1540 FOR I=FirstCommPort TO LastCommPort
mov eax,[FirstCommPort]
mov [I],eax
mov eax,[LastCommPort]
mov [_LopVec1],eax
_Lbl291:
mov eax,[I]
cmp eax,[_LopVec1]
jg _Lbl293
; LN:1541 TempStr="COM"+STR(FirstCommPort)
mov eax, dword [FirstCommPort]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst98
mov [_TmpVec2],esi
mov [_TmpVec2+4],4
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:1542 OBMain.text=TempStr
mov edi,!OBMain
mov [!TargetGUIDesc],edi
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[TempStr]
; LN:1543 OBComm1(I).PORTNAME=TempStr
mov eax, dword [I]
dec eax
imul eax,100
mov edi,OBComm1+!PortNameOffs
add edi,eax
mov [_TmpVec1],edi
mov [_TmpVec1+4],31
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TempStr
call __MovStr
; LN:1544 OBComm1(I).BAUDRATE=9600
mov eax, dword [I]
dec eax
imul eax,100
mov edi,OBComm1+!UserBaudRateOffs
add edi,eax
mov eax,9600
mov dword [edi],eax
; LN:1545 OBComm1(I).PARITY=EVENPARITY
mov eax, dword [I]
dec eax
imul eax,100
mov edi,OBComm1+!UserParityOffs
add edi,eax
mov eax,2
mov byte [edi],al
; LN:1546 OBComm1(I).DATABITS=8
mov eax, dword [I]
dec eax
imul eax,100
mov edi,OBComm1+!UserByteSizeOffs
add edi,eax
mov eax,8
mov byte [edi],al
; LN:1547 OBComm1(I).STOPBITS=ONESTOPBIT
mov eax, dword [I]
dec eax
imul eax,100
mov edi,OBComm1+!UserStopBitsOffs
add edi,eax
mov eax,0
mov byte [edi],al
; LN:1548 OBComm1(I).RTS=0
mov eax, dword [I]
dec eax
imul eax,100
mov edi,OBComm1+!UserRTSOffs
add edi,eax
mov eax,0
mov byte [edi],al
; LN:1549 OBComm1(I).CTSCHECK=FALSE
mov eax, dword [I]
dec eax
imul eax,100
mov edi,OBComm1+!UserCTSCheckOffs
add edi,eax
mov byte [edi],0
; LN:1550 OBComm1(I).DSRCHECK=FALSE
mov eax, dword [I]
dec eax
imul eax,100
mov edi,OBComm1+!UserDSRCheckOffs
add edi,eax
mov byte [edi],0
; LN:1551 OBComm1(I).PARITYCHECK=FALSE
mov eax, dword [I]
dec eax
imul eax,100
mov edi,OBComm1+!UserParityCheckOffs
add edi,eax
mov byte [edi],0
; LN:1552 OBComm1(I).DTR=0
mov eax, dword [I]
dec eax
imul eax,100
mov edi,OBComm1+!UserDTROffs
add edi,eax
mov eax,0
mov byte [edi],al
; LN:1553 ON ERROR GOTO CommOpenError1
mov [_ErrVec],CommOpenError1
; LN:1554 OBComm1(I).OPEN
mov eax, dword [I]
dec eax
imul eax,100
mov edi,OBComm1
add edi,eax
mov [!TargetGUIDesc],edi
add edi,!PortNameOffs
invoke CreateFile,edi,GENERIC_WRITE+GENERIC_READ,0,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
cmp eax,-1
jg _OELbl15
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl15:
mov edi,[!TargetGUIDesc]
mov [edi+!HandleOffs],eax
invoke GetCommState,eax,edi
mov edi,[!TargetGUIDesc]
xor eax,eax
mov byte al,[edi+!UserRTSOffs]
shl eax,12
mov ebx,[edi+!fBitsOffs]
and ebx,$cfff
or ebx,eax
mov [edi+!fBitsOffs],ebx
xor eax,eax
mov byte al,[edi+!UserDTROffs]
shl eax,4
mov ebx,[edi+!fBitsOffs]
and ebx,$ffcf
or ebx,eax
mov [edi+!fBitsOffs],ebx
xor eax,eax
mov byte al,[edi+!UserParityCheckOffs]
shl eax,1
mov ebx,[edi+!fBitsOffs]
and ebx,$fffd
or ebx,eax
mov [edi+!fBitsOffs],ebx
xor eax,eax
mov byte al,[edi+!UserDSRCheckOffs]
shl eax,3
mov ebx,[edi+!fBitsOffs]
and ebx,$fff7
or ebx,eax
mov [edi+!fBitsOffs],ebx
xor eax,eax
mov byte al,[edi+!UserCTSCheckOffs]
shl eax,2
mov ebx,[edi+!fBitsOffs]
and ebx,$fffb
or ebx,eax
mov [edi+!fBitsOffs],ebx
mov dword eax,[edi+!UserBaudRateOffs]
mov dword [edi+!BaudRateOffs],eax
mov byte al,[edi+!UserParityOffs]
mov byte [edi+!ParityOffs],al
mov byte al,[edi+!UserByteSizeOffs]
mov byte [edi+!ByteSizeOffs],al
mov byte al,[edi+!UserStopBitsOffs]
mov byte [edi+!StopBitsOffs],al
invoke SetCommState, dword [edi+!HandleOffs],edi
mov edi, dword [!TargetGUIDesc]
invoke SetCommMask, dword [edi+!HandleOffs],EV_ERR
; LN:1555 ON ERROR
mov [_ErrVec],_ErrExit
; LN:1556 NEXT I
_Lbl292:
inc [I]
jmp _Lbl291
_Lbl293:
; LN:1557 NeedConfig=FALSE
mov byte [NeedConfig],0
; LN:1558 EXIT SUB
ret
CommOpenError1:
; LN:1560 WARNINGBOX "Server Error","System Comm Not Configured",MB_OK
mov esi,_StrConst99
mov [_TmpVec1],esi
mov [_TmpVec1+4],13
mov [_TmpVec1+8],0
mov esi,_StrConst100
mov [_TmpVec2],esi
mov [_TmpVec2+4],27
mov [_TmpVec2+8],0
invoke MessageBox,[!OBMain],[_TmpVec2],[_TmpVec1],MB_OK+MB_ICONWARNING
mov [STATUS],eax
; LN:1561 NeedConfig=TRUE
mov byte [NeedConfig],1
; LN:1562 END SUB
ret
;________________________________________________________________________________________________________________________________
; LN:1564 BEGIN Sub InitWireless
InitWireless:
; LN:1565 FirstCommPort=ConfigData.FirstPort
mov esi,ConfigData+91
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov dword [FirstCommPort],eax
; LN:1566 TempStr="COM"+STR(FirstCommPort)
mov eax, dword [FirstCommPort]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst101
mov [_TmpVec2],esi
mov [_TmpVec2+4],4
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:1567 OBComm1(FirstCommPort).PORTNAME=TempStr
mov eax, dword [FirstCommPort]
dec eax
imul eax,100
mov edi,OBComm1+!PortNameOffs
add edi,eax
mov [_TmpVec1],edi
mov [_TmpVec1+4],31
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TempStr
call __MovStr
; LN:1568 OBComm1(FirstCommPort).BAUDRATE=57600
mov eax, dword [FirstCommPort]
dec eax
imul eax,100
mov edi,OBComm1+!UserBaudRateOffs
add edi,eax
mov eax,57600
mov dword [edi],eax
; LN:1569 OBComm1(FirstCommPort).PARITY=NOPARITY
mov eax, dword [FirstCommPort]
dec eax
imul eax,100
mov edi,OBComm1+!UserParityOffs
add edi,eax
mov eax,0
mov byte [edi],al
; LN:1570 OBComm1(FirstCommPort).DATABITS=8
mov eax, dword [FirstCommPort]
dec eax
imul eax,100
mov edi,OBComm1+!UserByteSizeOffs
add edi,eax
mov eax,8
mov byte [edi],al
; LN:1571 OBComm1(FirstCommPort).STOPBITS=ONESTOPBIT
mov eax, dword [FirstCommPort]
dec eax
imul eax,100
mov edi,OBComm1+!UserStopBitsOffs
add edi,eax
mov eax,0
mov byte [edi],al
; LN:1572 OBComm1(FirstCommPort).RTS=2
mov eax, dword [FirstCommPort]
dec eax
imul eax,100
mov edi,OBComm1+!UserRTSOffs
add edi,eax
mov eax,2
mov byte [edi],al
; LN:1573 OBComm1(FirstCommPort).CTSCHECK=FALSE
mov eax, dword [FirstCommPort]
dec eax
imul eax,100
mov edi,OBComm1+!UserCTSCheckOffs
add edi,eax
mov byte [edi],0
; LN:1574 OBComm1(FirstCommPort).DSRCHECK=FALSE
mov eax, dword [FirstCommPort]
dec eax
imul eax,100
mov edi,OBComm1+!UserDSRCheckOffs
add edi,eax
mov byte [edi],0
; LN:1575 OBComm1(FirstCommPort).PARITYCHECK=FALSE
mov eax, dword [FirstCommPort]
dec eax
imul eax,100
mov edi,OBComm1+!UserParityCheckOffs
add edi,eax
mov byte [edi],0
; LN:1576 OBComm1(FirstCommPort).DTR=0
mov eax, dword [FirstCommPort]
dec eax
imul eax,100
mov edi,OBComm1+!UserDTROffs
add edi,eax
mov eax,0
mov byte [edi],al
; LN:1577 ON ERROR GOTO CommOpenError2
mov [_ErrVec],CommOpenError2
; LN:1578 OBComm1(FirstCommPort).OPEN
mov eax, dword [FirstCommPort]
dec eax
imul eax,100
mov edi,OBComm1
add edi,eax
mov [!TargetGUIDesc],edi
add edi,!PortNameOffs
invoke CreateFile,edi,GENERIC_WRITE+GENERIC_READ,0,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
cmp eax,-1
jg _OELbl16
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl16:
mov edi,[!TargetGUIDesc]
mov [edi+!HandleOffs],eax
invoke GetCommState,eax,edi
mov edi,[!TargetGUIDesc]
xor eax,eax
mov byte al,[edi+!UserRTSOffs]
shl eax,12
mov ebx,[edi+!fBitsOffs]
and ebx,$cfff
or ebx,eax
mov [edi+!fBitsOffs],ebx
xor eax,eax
mov byte al,[edi+!UserDTROffs]
shl eax,4
mov ebx,[edi+!fBitsOffs]
and ebx,$ffcf
or ebx,eax
mov [edi+!fBitsOffs],ebx
xor eax,eax
mov byte al,[edi+!UserParityCheckOffs]
shl eax,1
mov ebx,[edi+!fBitsOffs]
and ebx,$fffd
or ebx,eax
mov [edi+!fBitsOffs],ebx
xor eax,eax
mov byte al,[edi+!UserDSRCheckOffs]
shl eax,3
mov ebx,[edi+!fBitsOffs]
and ebx,$fff7
or ebx,eax
mov [edi+!fBitsOffs],ebx
xor eax,eax
mov byte al,[edi+!UserCTSCheckOffs]
shl eax,2
mov ebx,[edi+!fBitsOffs]
and ebx,$fffb
or ebx,eax
mov [edi+!fBitsOffs],ebx
mov dword eax,[edi+!UserBaudRateOffs]
mov dword [edi+!BaudRateOffs],eax
mov byte al,[edi+!UserParityOffs]
mov byte [edi+!ParityOffs],al
mov byte al,[edi+!UserByteSizeOffs]
mov byte [edi+!ByteSizeOffs],al
mov byte al,[edi+!UserStopBitsOffs]
mov byte [edi+!StopBitsOffs],al
invoke SetCommState, dword [edi+!HandleOffs],edi
mov edi, dword [!TargetGUIDesc]
invoke SetCommMask, dword [edi+!HandleOffs],EV_ERR
; LN:1579 ON ERROR
mov [_ErrVec],_ErrExit
; LN:1580 CALL SUB BreakSync
call BreakSync
; LN:1581 CALL SUB RfInit
call RfInit
; LN:1582 ;CommWatchTimer1.Enabled = False
; LN:1583 ;CommWatchTimer1.Enabled = True
; LN:1584 ;CommWatchTimer1.TIME = 60000
; LN:1585 NeedConfig=FALSE
mov byte [NeedConfig],0
; LN:1586 EXIT SUB
ret
CommOpenError2:
; LN:1588 WARNINGBOX "Server Error","System Comm Not Configured",MB_OK
mov esi,_StrConst102
mov [_TmpVec1],esi
mov [_TmpVec1+4],13
mov [_TmpVec1+8],0
mov esi,_StrConst103
mov [_TmpVec2],esi
mov [_TmpVec2+4],27
mov [_TmpVec2+8],0
invoke MessageBox,[!OBMain],[_TmpVec2],[_TmpVec1],MB_OK+MB_ICONWARNING
mov [STATUS],eax
; LN:1589 NeedConfig=TRUE
mov byte [NeedConfig],1
; LN:1590 END SUB
ret
;________________________________________________________________________________________________________________________________
; LN:1592 BEGIN SUB RfInit
RfInit:
; LN:1593 InitStr1(1)=$aa
mov esi,InitStr1-(1*1*1)
mov eax,1
add esi,eax
mov [_TmpVec1],esi
mov eax,170
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1594 InitStr1(2)=$00
mov esi,InitStr1-(1*1*1)
mov eax,2
add esi,eax
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1595 InitStr1(3)=$00
mov esi,InitStr1-(1*1*1)
mov eax,3
add esi,eax
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1596 InitStr1(4)=$aa
mov esi,InitStr1-(1*1*1)
mov eax,4
add esi,eax
mov [_TmpVec1],esi
mov eax,170
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1597 InitStr2(1)=$80
mov esi,InitStr2-(1*1*1)
mov eax,1
add esi,eax
mov [_TmpVec1],esi
mov eax,128
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1598 InitStr2(2)=$00
mov esi,InitStr2-(1*1*1)
mov eax,2
add esi,eax
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1599 InitStr2(3)=$00
mov esi,InitStr2-(1*1*1)
mov eax,3
add esi,eax
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1600 InitStr2(4)=$80
mov esi,InitStr2-(1*1*1)
mov eax,4
add esi,eax
mov [_TmpVec1],esi
mov eax,128
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1601 OBComm1(FirstCommPort).BINARYOUTPUT InitStr1,4
mov eax, dword [FirstCommPort]
dec eax
imul eax,100
mov edi,OBComm1
add edi,eax
mov eax,4
invoke WriteFile, dword [edi+!HandleOffs],InitStr1,eax,XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl17
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl17:
; LN:1602 RFInitTimer.TIME=400
mov eax,5
mov [_ArgSafe0],eax
mov eax,400
invoke SetTimer,[!OBMain],[_ArgSafe0],eax,NULL
; LN:1603 END SUB
ret
;________________________________________________________________________________________________________________________________
; LN:1605 RFInitTimer.TIMEOUT
RFInitTimer_TIMEOUT:
; LN:1606 RFInitTimer.STOP
mov eax,5
invoke KillTimer,[!OBMain],eax
; LN:1607 OBComm1(FirstCommPort).BINARYOUTPUT InitStr2,4
mov eax, dword [FirstCommPort]
dec eax
imul eax,100
mov edi,OBComm1
add edi,eax
mov eax,4
invoke WriteFile, dword [edi+!HandleOffs],InitStr2,eax,XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl18
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl18:
; LN:1608 END EVENT
ret
;________________________________________________________________________________________________________________________________
; LN:1610 BEGIN SUB WriteAlarm
WriteAlarm:
; LN:1611 MachAlarmData(CommNum).AlarmData=TempAlarm
mov esi,MachAlarmData-(1*6*1)+4
mov eax, dword [CommNum]
imul eax,6
add esi,eax
mov [_TmpVec1],esi
xor eax,eax
mov al, byte [TempAlarm]
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:1612 OPEN "AlarmFile"+STR(CommNum) FOR APPEND AS MachAlarmFile
mov eax, dword [CommNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst104
mov [_TmpVec2],esi
mov [_TmpVec2+4],10
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,_IOBuffer
mov esi,_TmpVec2
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE,FILE_SHARE_READ+FILE_SHARE_WRITE,0,OPEN_ALWAYS,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [MachAlarmFile],eax
cmp eax,-1
jg _OELbl19
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl19:
invoke SetFilePointer,eax,0,0,FILE_END
; LN:1613 PUT MachAlarmFile,MachAlarmData(CommNum)
mov eax, dword [MachAlarmFile]
mov [_IOPthNum],eax
mov esi,MachAlarmData
mov eax, dword [CommNum]
imul eax,6
add esi,eax
mov [_TmpVec1],esi
mov [_XferAddr],esi
mov [XferCount],6
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl20
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl20:
; LN:1614 CLOSE MachAlarmFile
mov eax, dword [MachAlarmFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl21
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl21:
; LN:1615 END SUB
ret
;________________________________________________________________________________________________________________________________
; LN:1617 BEGIN SUB WriteMode
WriteMode:
; LN:1618 ; Get time and put it in mode structure
; LN:1619 MachModeData(CommNum).ModeData=TempMode
mov esi,MachModeData-(1*5*1)+4
mov eax, dword [CommNum]
imul eax,5
add esi,eax
mov [_TmpVec1],esi
xor eax,eax
mov al, byte [TempMode]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1620 OPEN "ModeFile"+STR(CommNum) FOR APPEND AS MachModeFile
mov eax, dword [CommNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst105
mov [_TmpVec2],esi
mov [_TmpVec2+4],9
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,_IOBuffer
mov esi,_TmpVec2
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE,FILE_SHARE_READ+FILE_SHARE_WRITE,0,OPEN_ALWAYS,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [MachModeFile],eax
cmp eax,-1
jg _OELbl22
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl22:
invoke SetFilePointer,eax,0,0,FILE_END
; LN:1621 PUT MachModeFile,MachModeData(CommNum)
mov eax, dword [MachModeFile]
mov [_IOPthNum],eax
mov esi,MachModeData
mov eax, dword [CommNum]
imul eax,5
add esi,eax
mov [_TmpVec1],esi
mov [_XferAddr],esi
mov [XferCount],5
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl23
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl23:
; LN:1622 CLOSE MachModeFile
mov eax, dword [MachModeFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl24
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl24:
; LN:1623 END SUB
ret
;________________________________________________________________________________________________________________________________
; LN:1625 BEGIN SUB WriteShot
WriteShot:
; LN:1626 ; Get time and put it in shot structure
; LN:1627 MachShotData(CommNum).ShotMode=Mode(CommNum)
mov esi,MachShotData-(1*265*1)+4
mov eax, dword [CommNum]
imul eax,265
add esi,eax
mov [_TmpVec1],esi
mov esi,Mode-(1*1*1)
mov eax, dword [CommNum]
add esi,eax
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1628 OPEN "ShotFile1" FOR APPEND AS MachShotFile
mov esi,_StrConst106
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE,FILE_SHARE_READ+FILE_SHARE_WRITE,0,OPEN_ALWAYS,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [MachShotFile],eax
cmp eax,-1
jg _OELbl25
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl25:
invoke SetFilePointer,eax,0,0,FILE_END
; LN:1629 PUT MachShotFile,MachShotData;(CommNum)
mov eax, dword [MachShotFile]
mov [_IOPthNum],eax
mov esi,MachShotData
mov [_TmpVec1],esi
mov [_XferAddr],esi
mov [XferCount],4240
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl26
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl26:
; LN:1630 CLOSE MachShotFile
mov eax, dword [MachShotFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl27
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl27:
; LN:1631 END SUB
ret
;________________________________________________________________________________________________________________________________
; LN:1633 BEGIN SUB PadMacAddress
PadMacAddress:
; LN:1634 SELECT CASE LEN(TempMacAddr)
mov esi,TempMacAddr
call __StrLen
mov [_SwitchInt],eax
; LN:1635 CASE 1
mov eax,1
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl295
; LN:1636 TempStr="0000000"
mov edi,[TempStr]
mov esi,_StrConst107
call __SetStrConst
; LN:1637 CASE 2
jmp _Lbl294
_Lbl295:
mov eax,2
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl296
; LN:1638 TempStr="000000"
mov edi,[TempStr]
mov esi,_StrConst108
call __SetStrConst
; LN:1639 CASE 3
jmp _Lbl294
_Lbl296:
mov eax,3
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl297
; LN:1640 TempStr="00000"
mov edi,[TempStr]
mov esi,_StrConst109
call __SetStrConst
; LN:1641 CASE 4
jmp _Lbl294
_Lbl297:
mov eax,4
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl298
; LN:1642 TempStr="0000"
mov edi,[TempStr]
mov esi,_StrConst110
call __SetStrConst
; LN:1643 CASE 5
jmp _Lbl294
_Lbl298:
mov eax,5
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl299
; LN:1644 TempStr="000"
mov edi,[TempStr]
mov esi,_StrConst111
call __SetStrConst
; LN:1645 CASE 6
jmp _Lbl294
_Lbl299:
mov eax,6
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl300
; LN:1646 TempStr="00"
mov edi,[TempStr]
mov esi,_StrConst112
call __SetStrConst
; LN:1647 CASE 7
jmp _Lbl294
_Lbl300:
mov eax,7
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl301
; LN:1648 TempStr="0"
mov edi,[TempStr]
mov esi,_StrConst113
call __SetStrConst
; LN:1649 CASE 8
jmp _Lbl294
_Lbl301:
mov eax,8
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl302
; LN:1650 TempStr=""
mov [TempStr+12],0
; LN:1651 END SELECT
jmp _Lbl294
_Lbl302:
_Lbl294:
; LN:1652 END SUB
ret
;________________________________________________________________________________________________________________________________
GetInoTime:
; LN:1655 GOSUB GetNow
call GetNow
; LN:1656 InoTime=TIMEDIFF(Now,InoTimeSeed)
mov esi,Now+0
mov [_TmpVec1],esi
mov esi,InoTimeSeed+0
mov [_TmpVec2],esi
invoke SystemTimeToFileTime,[_TmpVec1],!dwLowDateTime1
invoke SystemTimeToFileTime,[_TmpVec2],!dwLowDateTime2
mov eax,[!dwLowDateTime1]
mov edx,[!dwHighDateTime1]
sub eax,[!dwLowDateTime2]
sbb edx,[!dwHighDateTime2]
mov ebx,10000000
idiv ebx
mov dword [InoTime],eax
; LN:1657 RETURN
ret
GetNow:
; LN:1660 GETDATETIME Now
invoke GetLocalTime,Now
; LN:1661 RETURN
ret
GetTimeFromInoTime:
; LN:1664 DateTimeTemp=InoTimeSeed
mov esi,DateTimeTemp+0
mov [_TmpVec1],esi
mov esi,InoTimeSeed+0
mov [_TmpVec2],esi
mov edi,[_TmpVec1]
mov esi,[_TmpVec2]; Get src addr
mov ecx,16
_Lbl303:
mov al,byte [esi]
mov byte [edi],al
inc esi
inc edi
dec ecx
jne _Lbl303
; LN:1665 TIMEADD DateTimeTemp,InoTime
mov eax, dword [InoTime]
mov edx,10000000
imul edx
mov [!dwLowDateTime2],eax
mov [!dwHighDateTime2],edx
invoke SystemTimeToFileTime, dword DateTimeTemp,!dwLowDateTime1
mov eax,[!dwLowDateTime1]
mov edx,[!dwHighDateTime1]
add eax,[!dwLowDateTime2]
adc edx,[!dwHighDateTime2]
mov [!dwLowDateTime1],eax
mov [!dwHighDateTime1],edx
invoke FileTimeToSystemTime,!dwLowDateTime1, dword DateTimeTemp
; LN:1666 RETURN
ret
_ErrExit:
invoke MessageBox,[!OBMain],_ErrExitMsg,0,MB_OK
mov eax,[ERR]
invoke ExitProcess, eax
; End of Code Section
;________________________________________________________________________________________________________________________________

; Init Section
_Init:
mov [!CursorFlag],0
mov [!OBMain+80],OBMain_CREATE
mov [!OBMain+384],OBMain_SYSTEM
mov ecx,16
mov esi,!CommErrorLamp
_Lbl144:
mov dword [esi+52],CommErrorLamp_COMMAND
add esi,768
dec ecx
jne _Lbl144
mov [!Timer+12],CommErrorLampTimer_TIMEOUT
mov ecx,16
mov esi,!CommMsgLamp
_Lbl145:
mov dword [esi+52],CommMsgLamp_COMMAND
add esi,768
dec ecx
jne _Lbl145
mov [!Timer+16],CommMsgLampTimer_TIMEOUT
mov [!PasswordButton+52],PasswordButton_COMMAND
mov [!LockButton+52],LockButton_COMMAND
mov [!ConfigButton+52],ConfigButton_COMMAND
mov [!SaveConfigButton+52],SaveConfigButton_COMMAND
mov [!WirelessCheckBox+52],WirelessCheckBox_COMMAND
mov [!LogButton+52],LogButton_COMMAND
mov [!StatsButton+52],StatsButton_COMMAND
mov [!DataButton+52],DataButton_COMMAND
mov [!ExitButton+52],ExitButton_COMMAND
mov [!PasswordWindow+384],PasswordWindow_SYSTEM
mov ecx,16
mov esi,!ModeLamp
_Lbl182:
mov dword [esi+52],ModeLamp_COMMAND
add esi,768
dec ecx
jne _Lbl182
mov ecx,16
mov esi,!ModeLabel
_Lbl183:
mov dword [esi+52],ModeLabel_COMMAND
add esi,768
dec ecx
jne _Lbl183
mov ecx,16
mov esi,!Timer+24
_Lbl285:
mov dword [esi],ActivityTimer_TIMEOUT
add esi,4
dec ecx
jne _Lbl285
mov [!Timer+20],RFInitTimer_TIMEOUT
invoke LoadLibrary,!!RAGrid
invoke LoadLibrary,!!ImageLib
ret
; End of Init Section
;________________________________________________________________________________________________________________________________

; Function Code Section

proc !PasswordWindowProc,!hwnd,wmsg,wparam,lparam
enter
push ebx esi edi
mov [!PassEvent],0
mov ebx,[wmsg]
cmp ebx,WM_GETMINMAXINFO
jne PasswordWindowNotwmGetMaxInfo
mov dword edi,[!hwnd]
mov dword [!PasswordWindow+HandleOffs],edi
mov dword [!PasswordWindow+OwnerOffs],0
jmp !DefWndProc
PasswordWindowNotwmGetMaxInfo:
mov esi,!PasswordWindow
cmp ebx,WM_DESTROY
jne !WinProcCommon
invoke DeleteObject,dword [esi+ControlBrushOffs]
jmp !DefWndProc
proc !SubClassProc,!hwnd,wmsg,wparam,lparam
enter
push ebx esi edi
mov eax,[wparam]
mov [EventID],ax
shr eax,16
mov [EventNotify],ax
invoke GetWindowLong,[lparam],GWL_USERDATA
mov [!Desc],eax
mov ebx,[wmsg]
cmp ebx,WM_CTLCOLORSTATIC
je !CtlColorChange
cmp ebx,WM_CTLCOLOREDIT
je !CtlColorChange
cmp ebx,WM_CTLCOLORBTN
je !CtlColorChange
cmp ebx,WM_CTLCOLORSCROLLBAR
je !CtlColorChange
cmp ebx,WM_CTLCOLORLISTBOX
je !CtlColorChange
cmp ebx,WM_COMMAND
je !wmCommand
invoke GetWindowLong,[!hwnd],GWL_USERDATA
or eax,eax
je !DefWndProc
add eax,OldProcOffs
mov eax,[eax]
invoke CallWindowProc,eax,[!hwnd],[wmsg],[wparam],[lparam]
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

__AtoL:
mov dl,[esi]
cmp dl,'$'
jne __NotHex
call __NumScan
__HexLoop:
dec esi
xor edx,edx
mov dl,[esi]
cmp dl,'$'
je __AtoLDone
cmp dl,$39
jg __HexLetter
and dl,$0f
jmp __HexAcc
__HexLetter:
and dl,$0f
add dl,9
__HexAcc:
imul edx,ecx
add eax,edx
imul ecx,16 
jmp __HexLoop
__NotHex:
cmp dl,'%'
jne __NotOctal
call __NumScan
__OctalLoop:
dec esi
xor edx,edx
mov dl,[esi]
cmp dl,'%'
je __AtoLDone
and dl,$07
imul edx,ecx
add eax,edx
imul ecx,8
jmp __OctalLoop
__NotOctal:
cmp dl,'&'
jne __NotBinary
call __NumScan
__BinaryLoop:
dec esi
xor edx,edx
mov dl,[esi]
cmp dl,'&'
je __AtoLDone
and dl,$01
imul edx,ecx
add eax,edx
imul ecx,2
jmp __OctalLoop
__NotBinary:
cinvoke atol,esi
__AtoLDone:
ret
__NumScan:
inc esi
mov dl,[esi]
cmp dl,0
jne __NumScan
xor eax,eax
mov ecx,1
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

__SetRightBottom:
mov edi,[!TargetGUIDesc]
mov dword eax,[edi+LeftOffs]
add dword eax,[edi+WidthOffs]
mov dword [edi+RightOffs],eax
mov dword eax,[edi+TopOffs]
add dword eax,[edi+HeightOffs]
mov dword [edi+BottomOffs],eax
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
;________________________________________________________________________________________________________________________________
