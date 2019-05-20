;Compiler Declaration Section

format PE GUI 4.0

entry !Start

macro align value { rb (value-1) - (rva $ + value-1) mod value }

_BufSize=1000
WinCreated equ 0
WinEnabled equ 1
WinVisible equ 2
WinChangeBackColor equ 3
WinChangeForeColor equ 4
WinArray equ 5
WinSubClassed equ 6
WinLoaded equ 7
WinPlaced equ 8
WinTipExists equ 9

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
ScrollBarPageOffs equ 452
ScrollBarMinOffs equ 456
ScrollBarMaxOffs equ 460
ScrollBarPosOffs equ 464
GridColorOffs equ 468
FamilyOffs equ 472
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

; LN:12 begin import dll3.dll
!Timers equ 1
; End of Declaration Section

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
include 'include\macro\export.inc'
include 'include\macro\stdcall.inc'
include 'include\macro\resource.inc'
include 'include\buttonex.inc'
include 'include\wbdll.inc'
include 'include\ravideo.inc'
include 'include\gradprogress.inc'

section '.idata' import data readable writeable

library kernel32,"kernel32.dll",\
        user32,"User32.dll",\
        gdi,"GDI32.DLL",\
        comctl,"COMCTL32.DLL",\
        shell,"SHELL32.DLL",\
        msvcrt,"msvcrt.dll",\
        dll3,"dll3.dll"

kernel32:
	import	ExitProcess,"ExitProcess",\
		GetCommandLine,"GetCommandLineA",\
		GetModuleHandle,"GetModuleHandleA",\
		GetStdHandle,"GetStdHandle",\
		LoadLibrary,"LoadLibraryA"
user32:
	import	CreateWindowEx,"CreateWindowExA",\
		DefWindowProc,"DefWindowProcA",\
		DispatchMessage,"DispatchMessageA",\
		GetMessage,"GetMessageA",\
		InvalidateRect,"InvalidateRect",\
		LoadCursor,"LoadCursorA",\
		LoadIcon,"LoadIconA",\
		MessageBox,"MessageBoxA",\
		PostQuitMessage,"PostQuitMessage",\
		RegisterClass,"RegisterClassA",\
		SendMessage,"SendMessageA",\
		SetClassLong,"SetClassLongA",\
		SetTimer,"SetTimer",\
		GetWindowLong,"GetWindowLongA",\
		SetWindowLong,"SetWindowLongA",\
		SetWindowPos,"SetWindowPos",\
		UpdateWindow,"UpdateWindow",\
		TranslateMessage,"TranslateMessage"
gdi:
	import	CreateSolidBrush,"CreateSolidBrush",\
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
dll3:
	import	uf1,"uf1",\
		uf2,"uf2",\
		uf3,"uf3"

; End of Import Section

section '.data' data readable writeable

align 4

err dd 0
!ArrayBase dd 1
_ErrVec dd 0
STATUS dd 0
erl dd 0
POS dd 0
Ticks dd 0
XferCount dd 0
CommError dd 0
wparamHigh dw 0
wparamLow dw 0
ScrollValue dw 0
ScrollCode dw 0
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
!ControlType36 db 'FAMILY',0
!ControlType37 db 'WEB_BROWSER',0
!ControlType38 db 'OBZIP',0
!ControlType39 db 'RAVIDEO',0
!ControlType40 db 'GradProgress',0

!OBMainWindowClass WNDCLASS
msg MSG
!TrapColorChange dd 0
!OBMainClass db 'OBMain',0
!ToolTipClass db 'Tooltips_class32',0
!icc dd $00000008,$00003FFF
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

cf_lStructSize dd 60
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
cf_alignfiller dw 0
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
!RA_NUMCOLOR dd $800000

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
; LN:4 dim ts as string
align 4
ts dd ts+12
 dd 255
 dd 0
 rb 255
; LN:6 dim tbs as string
align 4
tbs dd tbs+12
 dd 255
 dd 0
 rb 255
_StrConst1 db "OBMain",0
_StrConst2 db "Button1",0
_StrConst3 db "Button2",0
_StrConst4 db "Button3",0
_StrConst5 db "Check1",0
_StrConst6 db "True",0
_StrConst7 db "False",0
!ObjectCount dd 8
; End of Initialized Data Section

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
_Str1VecAddr rd 1
_Str2VecAddr rd 1
_Str1Len rd 1
_Str2Len rd 1
_SubStrLoc rd 1
_SubStrVec rd 3
_ArgSafe0 rd 1
_ArgSafe1 rd 1
_ArgSafe2 rd 1
_ArgSafe3 rd 1
_ArgSafe4 rd 1
_ArgSafe5 rd 1
_ArgSafe6 rd 1
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

;Treeview Structure
!TV_hParent rd 1
!TV_hInsertAfter rd 1
!TV_mask rd 1
!TV_hItem rd 1
!TV_state rd 1
!TV_stateMask rd 1
!TV_pszText rd 1
!TV_cchTextMax rd 1
!TV_iImage rd 1
!TV_iSelectedImage rd 1
!TV_cChildren rd 1
!TV_lParam rd 1
!TV_iIntegral rd 1

;Listview Insert Item Structure
!LV_Itemmask rd 1 
!LV_ItemiItem rd 1 
!LV_ItemiSubItem rd 1 
!LV_Itemstate rd 1 
!LV_ItemstateMask rd 1 
!LV_ItempszText rd 1 
!LV_ItemcchTextMax rd 1 
!LV_ItemiImage rd 1 
!LV_ItemlParam rd 1
!LV_ItemiIndent rd 1
!LV_ItemiGroupId rd 1
!LV_ItemcColumns rd 1
!LV_ItempuColumns rd 1

;ListView Col Structure
!LV_Colmask rd 1 
!LV_Colfmt rd 1 
!LV_Colcx rd 1 
!LV_ColpszText rd 1 
!LV_ColcchTextMax rd 1 
!LV_ColiSubItem rd 1 
!LV_ColiImage rd 1
!LV_ColiOrder rd 1
!LV_ColcxMin rd 1
!LV_ColcxDefault rd 1
!LV_ColcxIdeal rd 1

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
!CT_FAMILY equ 135
!CT_WEB_BROWSER equ 136
!CT_OBZIP equ 137
!CT_RAVIDEO equ 138
!CT_GradProgress equ 139
align 4
; LN:2 dim x as long
x rd 1
align 4
; LN:3 dim y as long
y rd 1
; LN:5 dim tb as boolean
tb rb 1

;Temporary Vector
_TmpVec1 rd 3
; LN:18 DIM OBLogFont AS LOGFONT
align 4
OBLogFont rb 60
align 4
; LN:18 DIM OBFont AS FONT
OBFont rd 1

;Temporary Variable
_Tmp1 rd 1

;Temporary String Variable
_StrTmp1 rb 32
; End of Uninitialized Data Section

; Start of Control Descriptor Section
!OBMain rd 192
; LN:18 DIM Button1 AS BUTTON
!Button1 rd 192
; LN:18 DIM Button2 AS BUTTON
!Button2 rd 192
; LN:18 DIM Button3 AS BUTTON
!Button3 rd 192
; LN:18 DIM Check1 AS CHECKBOX
!Check1 rd 192
; LN:18 DIM TextBox1 AS TEXTBOX
!TextBox1 rd 192
; LN:18 DIM TextBox2 AS TEXTBOX
!TextBox2 rd 192
; LN:18 DIM TextBox3 AS TEXTBOX
!TextBox3 rd 192
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
invoke CreateWindowEx,0,!OBMainClass,!title,WS_VISIBLE+WS_OVERLAPPEDWINDOW,0,0,400,300,NULL,NULL,[!hinstance],0
invoke SetWindowLong,[!OBMain],GWL_USERDATA,!OBMain

!MsgLoop:
invoke GetMessage,msg,NULL,0,0
or eax,eax
jz !EndMsgLoop
invoke TranslateMessage,msg
invoke DispatchMessage,msg
jmp !MsgLoop
!EndMsgLoop:
invoke DeleteObject,[!Brush]
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
mov [wparamLow],ax
shr eax,16
mov [wparamHigh],ax
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
je !CommandDispatch
cmp [!dsControlType],!CT_CALENDAR
je !NotifyDispatch
jmp !DefWndProc

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
mov ax,[wparamLow]
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
mov bx,[wparamHigh]
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
mov eax,[wparam]
mov [ScrollCode],ax
shr eax,16
mov [ScrollValue],ax
mov esi,[!Desc]
mov eax,[esi+ArrayOffs]
mov [ArrayIndex],eax
mov eax, dword [esi+TypeOffs]
cmp eax,!CT_SCROLLBAR
jne !NotScrollBar
mov ax,[ScrollCode]
cmp ax,0
je !ScrollLineUp
cmp ax,1
je !ScrollLineDn
cmp ax,2
je !ScrollPageUp
cmp ax,3
je !ScrollPageDn
cmp ax,4
je !ScrollThumbPos
cmp ax,5
jne !NotScrollBar
xor eax,eax
mov ax,[ScrollValue]
mov [esi+ScrollBarPosOffs],eax
jmp !NotScrollBar
!ScrollBarCommon:
mov [esi+ScrollBarPosOffs],eax
invoke SendMessage, dword [esi],SBM_SETPOS,eax,TRUE
!NotScrollBar:
mov eax,[esi+evScrollOffs]
cmp eax,0
je !DefWndProc
call dword eax
xor eax,eax
jmp !Finish

!ScrollLineUp:
mov eax,[esi+ScrollBarPosOffs]
dec eax
cmp eax,[esi+ScrollBarMinOffs]
jge !ScrollBarCommon
mov eax,[esi+ScrollBarMinOffs]
jmp !ScrollBarCommon

!ScrollLineDn:
mov eax,[esi+ScrollBarPosOffs]
inc eax
cmp eax,[esi+ScrollBarMaxOffs]
jle !ScrollBarCommon
mov eax,[esi+ScrollBarMaxOffs]
jmp !ScrollBarCommon

!ScrollPageUp:
mov eax,[esi+ScrollBarPosOffs]
sub eax,[esi+ScrollBarPageOffs]
cmp eax,[esi+ScrollBarMinOffs]
jge !ScrollBarCommon
mov eax,[esi+ScrollBarMinOffs]
jmp !ScrollBarCommon

!ScrollPageDn:
mov eax,[esi+ScrollBarPosOffs]
add eax,[esi+ScrollBarPageOffs]
cmp eax,[esi+ScrollBarMaxOffs]
jle !ScrollBarCommon
mov eax,[esi+ScrollBarMaxOffs]
jmp !ScrollBarCommon

!ScrollThumbPos:
xor eax,eax
mov ax,[ScrollValue]
jmp !ScrollBarCommon

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
endp

; End of Code Section

; Init Section
_Init:
mov [!CursorFlag],0
mov [!OBMain+80],OBMain_CREATE
mov [!Button1+52],Button1_command
mov [!Button2+104],Button2_CLICK
mov [!Button2+104+4],0
mov [!Button3+104],Button3_CLICK
mov [!Button3+104+4],0
ret
; End of Init Section

; Function Code Section

; LN:8 declare fcn uf1(integer,integer) AS INTEGER external
; LN:9 declare fcn uf2(string) as string external
; LN:10 declare fcn uf3(boolean) as boolean external
; LN:18 OBMain.CREATE
mov edi,!OBMain
mov [!TargetGUIDesc],edi
OBMain_CREATE:
; LN:18 SETPOSITION OBMain,340,150,640,480
mov edi,!OBMain
mov [!TargetGUIDesc],edi
mov eax,340
mov dword [edi+LeftOffs],eax
mov eax,150
mov dword [edi+TopOffs],eax
mov eax,640
mov dword [edi+WidthOffs],eax
mov eax,480
mov dword [edi+HeightOffs],eax
call __SetRightBottom
invoke SetWindowPos, dword [edi+HandleOffs],HWND_TOP, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs],SWP_NOZORDER
; LN:18 OBMain.TEXT="OBMain"
mov edi,!OBMain
mov [!TargetGUIDesc],edi
mov esi,_StrConst1
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_IOBuffer]
; LN:18 OBMain.BACKCOLOR=$c8d0d4
mov edi,!OBMain
mov [!TargetGUIDesc],edi
invoke DeleteObject,dword [edi+ControlBrushOffs]
mov eax,13160660
mov dword [edi+BackColorOffs],eax
invoke CreateSolidBrush,eax
mov [edi+ControlBrushOffs],eax
invoke SetClassLong, dword [edi+HandleOffs],GCL_HBRBACKGROUND,eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
invoke UpdateWindow, dword [edi+HandleOffs]
; LN:18 CREATE Button1,10,50,90,30
mov edi,!Button1
mov [!TargetGUIDesc],edi
mov eax,10
mov dword [edi+LeftOffs],eax
mov eax,50
mov dword [edi+TopOffs],eax
mov eax,90
mov dword [edi+WidthOffs],eax
mov eax,30
mov dword [edi+HeightOffs],eax
mov [_ArgSafe3],0
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType2,NULL,$50000001, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],101,[!hinstance],0
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword [edi+TTcbSizeOffs],44
mov eax,[_ArgSafe3]
mov [edi+FamilyOffs],eax
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword [edi+TypeOffs],101
mov dword [edi+IDOffs],101
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],$ffffffff
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword [edi+InterceptSafeOffs],eax
; LN:18 Button1.TEXT="Button1"
mov edi,!Button1
mov [!TargetGUIDesc],edi
mov esi,_StrConst2
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_IOBuffer]
; LN:18 CREATE Button2,120,50,90,30
mov edi,!Button2
mov [!TargetGUIDesc],edi
mov eax,120
mov dword [edi+LeftOffs],eax
mov eax,50
mov dword [edi+TopOffs],eax
mov eax,90
mov dword [edi+WidthOffs],eax
mov eax,30
mov dword [edi+HeightOffs],eax
mov [_ArgSafe3],0
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType2,NULL,$50000001, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],102,[!hinstance],0
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword [edi+TTcbSizeOffs],44
mov eax,[_ArgSafe3]
mov [edi+FamilyOffs],eax
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword [edi+TypeOffs],101
mov dword [edi+IDOffs],102
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],$ffffffff
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword [edi+InterceptSafeOffs],eax
; LN:18 Button2.TEXT="Button2"
mov edi,!Button2
mov [!TargetGUIDesc],edi
mov esi,_StrConst3
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_IOBuffer]
; LN:18 CREATE Button3,230,50,90,30
mov edi,!Button3
mov [!TargetGUIDesc],edi
mov eax,230
mov dword [edi+LeftOffs],eax
mov eax,50
mov dword [edi+TopOffs],eax
mov eax,90
mov dword [edi+WidthOffs],eax
mov eax,30
mov dword [edi+HeightOffs],eax
mov [_ArgSafe3],0
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType2,NULL,$50000001, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],103,[!hinstance],0
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword [edi+TTcbSizeOffs],44
mov eax,[_ArgSafe3]
mov [edi+FamilyOffs],eax
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword [edi+TypeOffs],101
mov dword [edi+IDOffs],103
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],$ffffffff
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword [edi+InterceptSafeOffs],eax
; LN:18 Button3.TEXT="Button3"
mov edi,!Button3
mov [!TargetGUIDesc],edi
mov esi,_StrConst4
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_IOBuffer]
; LN:18 CREATE Check1,230,20,90,20
mov edi,!Check1
mov [!TargetGUIDesc],edi
mov eax,230
mov dword [edi+LeftOffs],eax
mov eax,20
mov dword [edi+TopOffs],eax
mov eax,90
mov dword [edi+WidthOffs],eax
mov eax,20
mov dword [edi+HeightOffs],eax
mov [_ArgSafe3],0
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType18,NULL,$50000003, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],104,[!hinstance],0
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword [edi+TTcbSizeOffs],44
mov eax,[_ArgSafe3]
mov [edi+FamilyOffs],eax
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword [edi+TypeOffs],117
mov dword [edi+IDOffs],104
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],$ffffffff
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword [edi+InterceptSafeOffs],eax
; LN:18 Check1.TEXT="Check1"
mov edi,!Check1
mov [!TargetGUIDesc],edi
mov esi,_StrConst5
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_IOBuffer]
; LN:18 Check1.BACKCOLOR=$c8d0d4
mov edi,!Check1
mov [!TargetGUIDesc],edi
mov eax,13160660
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:18 Check1.FORECOLOR=$0
mov edi,!Check1
mov [!TargetGUIDesc],edi
mov eax,0
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:18 CREATE TextBox1,10,20,40,20
mov edi,!TextBox1
mov [!TargetGUIDesc],edi
mov eax,10
mov dword [edi+LeftOffs],eax
mov eax,20
mov dword [edi+TopOffs],eax
mov eax,40
mov dword [edi+WidthOffs],eax
mov eax,20
mov dword [edi+HeightOffs],eax
mov [_ArgSafe3],0
call __SetRightBottom
invoke CreateWindowEx,WS_EX_CLIENTEDGE,!ControlType5,NULL,$50000000, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],105,[!hinstance],0
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword [edi+TTcbSizeOffs],44
mov eax,[_ArgSafe3]
mov [edi+FamilyOffs],eax
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword [edi+TypeOffs],104
mov dword [edi+IDOffs],105
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],$ffffffff
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword [edi+InterceptSafeOffs],eax
; LN:18 TextBox1.TEXT=""
mov edi,!TextBox1
mov [!TargetGUIDesc],edi
mov edi,_IOBuffer
mov esi,_NullStr
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_IOBuffer]
; LN:18 TextBox1.BACKCOLOR=$ffffff
mov edi,!TextBox1
mov [!TargetGUIDesc],edi
mov eax,16777215
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:18 TextBox1.FORECOLOR=$0
mov edi,!TextBox1
mov [!TargetGUIDesc],edi
mov eax,0
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:18 CREATE TextBox2,60,20,40,20
mov edi,!TextBox2
mov [!TargetGUIDesc],edi
mov eax,60
mov dword [edi+LeftOffs],eax
mov eax,20
mov dword [edi+TopOffs],eax
mov eax,40
mov dword [edi+WidthOffs],eax
mov eax,20
mov dword [edi+HeightOffs],eax
mov [_ArgSafe3],0
call __SetRightBottom
invoke CreateWindowEx,WS_EX_CLIENTEDGE,!ControlType5,NULL,$50000000, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],106,[!hinstance],0
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword [edi+TTcbSizeOffs],44
mov eax,[_ArgSafe3]
mov [edi+FamilyOffs],eax
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword [edi+TypeOffs],104
mov dword [edi+IDOffs],106
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],$ffffffff
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword [edi+InterceptSafeOffs],eax
; LN:18 TextBox2.TEXT=""
mov edi,!TextBox2
mov [!TargetGUIDesc],edi
mov edi,_IOBuffer
mov esi,_NullStr
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_IOBuffer]
; LN:18 TextBox2.BACKCOLOR=$ffffff
mov edi,!TextBox2
mov [!TargetGUIDesc],edi
mov eax,16777215
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:18 TextBox2.FORECOLOR=$0
mov edi,!TextBox2
mov [!TargetGUIDesc],edi
mov eax,0
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:18 CREATE TextBox3,120,20,90,20
mov edi,!TextBox3
mov [!TargetGUIDesc],edi
mov eax,120
mov dword [edi+LeftOffs],eax
mov eax,20
mov dword [edi+TopOffs],eax
mov eax,90
mov dword [edi+WidthOffs],eax
mov eax,20
mov dword [edi+HeightOffs],eax
mov [_ArgSafe3],0
call __SetRightBottom
invoke CreateWindowEx,WS_EX_CLIENTEDGE,!ControlType5,NULL,$50000000, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],107,[!hinstance],0
mov dword [edi+HandleOffs],eax
invoke SetWindowLong, dword eax,GWL_USERDATA,edi
mov dword [edi+TTcbSizeOffs],44
mov eax,[_ArgSafe3]
mov [edi+FamilyOffs],eax
mov dword [edi+TTuFlagsOffs],TTF_IDISHWND+TTF_SUBCLASS
mov dword eax,[edi+HandleOffs]
mov dword [edi+TTuIDOffs],eax
mov eax,edi
add eax,TTTextOffs
mov dword [edi+TTlpszTextOffs],eax
mov dword [edi+TypeOffs],104
mov dword [edi+IDOffs],107
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],$ffffffff
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword [edi+InterceptSafeOffs],eax
; LN:18 TextBox3.TEXT=""
mov edi,!TextBox3
mov [!TargetGUIDesc],edi
mov edi,_IOBuffer
mov esi,_NullStr
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_IOBuffer]
; LN:18 TextBox3.BACKCOLOR=$ffffff
mov edi,!TextBox3
mov [!TargetGUIDesc],edi
mov eax,16777215
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:18 TextBox3.FORECOLOR=$0
mov edi,!TextBox3
mov [!TargetGUIDesc],edi
mov eax,0
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:20 END EVENT
ret
; LN:22 Button1.command
mov edi,!Button1
mov [!TargetGUIDesc],edi
Button1_command:
; LN:23 ts=TextBox1.text
mov edi,!TextBox1
mov [!SourceGUIDesc],edi
invoke SendMessage, dword [edi+HandleOffs],WM_GETTEXT,_BufSize,[_IOBuffer]
mov edi,ts
mov esi,_IOBuffer;Hook1
call __MovStr
; LN:24 x=val(ts)
mov esi,[ts]
call __AtoL
mov dword [x],eax
; LN:25 ts=TextBox2.text
mov edi,!TextBox2
mov [!SourceGUIDesc],edi
invoke SendMessage, dword [edi+HandleOffs],WM_GETTEXT,_BufSize,[_IOBuffer]
mov edi,ts
mov esi,_IOBuffer;Hook1
call __MovStr
; LN:26 y=val(ts)
mov esi,[ts]
call __AtoL
mov dword [y],eax
; LN:27 Button1.text=str(uf1(x,y))
mov edi,!Button1
mov [!TargetGUIDesc],edi
mov eax, dword [x]
push eax
mov eax, dword [y]
push eax
call [uf1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_IOBuffer]
; LN:28 beep 1000,500
mov eax,1000
mov [_ArgSafe0],eax
mov eax,500
invoke Beep,[_ArgSafe0],eax
; LN:29 end event
ret
; LN:31 Button2.CLICK
mov edi,!Button2
mov [!TargetGUIDesc],edi
Button2_CLICK:
; LN:32 ts=TextBox3.text
mov edi,!TextBox3
mov [!SourceGUIDesc],edi
invoke SendMessage, dword [edi+HandleOffs],WM_GETTEXT,_BufSize,[_IOBuffer]
mov edi,ts
mov esi,_IOBuffer;Hook1
call __MovStr
; LN:33 Button2.text=uf2(ts)
mov edi,!Button2
mov [!TargetGUIDesc],edi
mov eax,[ts]
push eax
call [uf2]
mov edi,_IOBuffer
mov esi,eax
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_IOBuffer]
; LN:34 END EVENT
ret
; LN:36 Button3.CLICK
mov edi,!Button3
mov [!TargetGUIDesc],edi
Button3_CLICK:
; LN:37 tb=Check1.checked
mov edi,!Check1
mov [!SourceGUIDesc],edi
invoke SendMessage, dword [edi+HandleOffs],BM_GETCHECK,0,0
mov [_Tmp1],eax
mov al, byte [_Tmp1]
mov [tb],al
; LN:38 if uf3(tb)=true then
mov al, byte [tb]
push eax
call [uf3]
mov dl,1
cmp al,dl
jne _Lbl8
; LN:39 Button3.text="True"
mov edi,!Button3
mov [!TargetGUIDesc],edi
mov esi,_StrConst6
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_IOBuffer]
; LN:40 else
jmp _Lbl9
_Lbl8:
; LN:41 Button3.text="False"
mov edi,!Button3
mov [!TargetGUIDesc],edi
mov esi,_StrConst7
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_IOBuffer]
; LN:42 end if
_Lbl9:
; LN:43 END EVENT
ret
_ErrExit:
invoke MessageBox,[!OBMain],_ErrExitMsg,0,MB_OK
mov eax,[err]
invoke ExitProcess, eax
; End of Function Section
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

__SetRightBottom:
mov edi,[!TargetGUIDesc]
mov dword eax,[edi+LeftOffs]
add dword eax,[edi+WidthOffs]
mov dword [edi+RightOffs],eax
mov dword eax,[edi+TopOffs]
add dword eax,[edi+HeightOffs]
mov dword [edi+BottomOffs],eax
ret

