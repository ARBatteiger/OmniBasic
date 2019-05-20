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
        comdlg,"COMDLG32.DLL",\
        shell,"SHELL32.DLL"

kernel32:
	import	CloseHandle,"CloseHandle",\
		CreateFile,"CreateFileA",\
		ExitProcess,"ExitProcess",\
		GetCommandLine,"GetCommandLineA",\
		GetFileSize,"GetFileSize",\
		GetLastError,"GetLastError",\
		GetModuleHandle,"GetModuleHandleA",\
		GetStdHandle,"GetStdHandle",\
		LoadLibrary,"LoadLibraryA",\
		ReadFile,"ReadFile",\
		SetEndOfFile,"SetEndOfFile",\
		VirtualAlloc,"VirtualAlloc",\
		VirtualFree,"VirtualFree",\
		WriteFile,"WriteFile"
user32:
	import	CreateWindowEx,"CreateWindowExA",\
		DefWindowProc,"DefWindowProcA",\
		DispatchMessage,"DispatchMessageA",\
		GetMessage,"GetMessageA",\
		InvalidateRect,"InvalidateRect",\
		LoadCursor,"LoadCursorA",\
		LoadIcon,"LoadIconA",\
		MessageBox,"MessageBoxA",\
		PostMessage,"PostMessageA",\
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
comdlg:
	import	GetOpenFileName,"GetOpenFileNameA"
shell:
	import	ShellExecute,"ShellExecuteA"

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
!!RichEd db 'RichEd20.dll',0
!!RAEdit db 'RAEdit.dll',0
!!RAGrid db 'RAGrid.dll',0
!!Csmdll db 'Csmdll.dll',0
!!DrawProgress db 'DrawProgress.dll',0
!!ImageLib db 'ImageLib.dll',0
!!SprShtLib db 'SprSht.dll',0
!!ButtonExLib db 'ButtonEx.dll',0
!!WebBrowserLib db 'WBDll.dll',0
!!ZipLib db 'bszip.dll',0
!!RAVideoLib db 'RAVideo.dll',0
!!GradProgressLib db 'GradProgress.dll',0
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
; LN:96 DIM OldFileName AS STRING
align 4
OldFileName dd OldFileName+12
 dd 255
 dd 0
 rb 255
; LN:97 DIM NewFileName AS STRING
align 4
NewFileName dd NewFileName+12
 dd 255
 dd 0
 rb 255
; LN:103 DIM InitDir AS STRING
align 4
InitDir dd InitDir+12
 dd 255
 dd 0
 rb 255
_StrConst1 db "OBMain",0
_StrConst2 db "Convert",0
_StrConst3 db "Exit",0
_StrConst4 db "C:\nb",0
FileFilter db "OB Project",0,"*.obp",0,0
_StrConst5 db " Converted",0
_StrConst6 db "New",0
;Memory Buffer
FileBuf dd 0
 dd 0
!ObjectCount dd 4
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
!FcnVar1 rd 4
!FcnVar2 rd 4
!FcnVar3 rd 4
!FcnVar4 rd 4
!FcnVar5 rd 4
!FcnVar6 rd 4
!FcnVar7 rd 4
_LongRet rd 1
_StringRet rd 3
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
; LN:2 TYPE OldPuppetData
; LN:38 DIM OldControlRecord AS OldPuppetData
align 4
OldControlRecord rb 252
align 4
; LN:39 DIM OldToolBlockSize AS LONG
OldToolBlockSize rd 1
; LN:41 TYPE NewPuppetData
; LN:90 DIM NewControlRecord AS NewPuppetData
align 4
NewControlRecord rb 312
align 4
; LN:91 DIM NewToolBlockSize AS LONG
NewToolBlockSize rd 1
align 4
; LN:93 DIM I AS LONG
I rd 1
align 4
; LN:94 DIM TempInt AS LONG
TempInt rd 1
; LN:95 DIM TempByte AS BYTE
TempByte rb 1
; LN:98 DIM ToolPropMapCount(50) AS LONG
align 4
ToolPropMapCount rd 50
align 4
; LN:100 DIM InputFile AS FILE
InputFile rd 1
align 4
; LN:101 DIM OutputFile AS FILE
OutputFile rd 1
align 4
; LN:104 DIM FilBufSiz AS LONG
FilBufSiz rd 1
align 4
; LN:105 DIM FilBufAdr AS LONG
FilBufAdr rd 1
align 4
; LN:106 DIM ToolBlockSize AS LONG
ToolBlockSize rd 1

;Temporary Vector
_TmpVec1 rd 3
; LN:108 DIM OBLogFont AS LOGFONT
align 4
OBLogFont rb 60
align 4
; LN:108 DIM OBFont AS FONT
OBFont rd 1

;Temporary Variable
_Tmp1 rd 1

;Temporary Variable
_Tmp2 rd 1

;Temporary Variable
_Tmp3 rd 1

;Temporary Vector
_TmpVec2 rd 3

;For Loop Vector
_LopVec1 rd 2

;Temporary Vector
_TmpVec3 rd 3

;Temporary Vector
_TmpVec4 rd 3
; End of Uninitialized Data Section

; Start of Control Descriptor Section
!OBMain rd 192
; LN:108 DIM Button1 AS BUTTON
!Button1 rd 192
; LN:108 DIM StaticText1 AS STATICTEXT
!StaticText1 rd 192
; LN:108 DIM Button2 AS BUTTON
!Button2 rd 192
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
return

; End of Code Section

; Init Section
_Init:
mov [!CursorFlag],0
mov [!OBMain+80],OBMain_CREATE
mov [!Button1+52],Button1_COMMAND
mov [!Button2+52],Button2_COMMAND
ret
; End of Init Section

; Function Code Section

; LN:37 CONST ControlTableSize=800
ControlTableSize equ 800
; LN:102 DIM FileFilter AS TEXT
; LN:108 OBMain.CREATE
mov edi,!OBMain
mov [!TargetGUIDesc],edi
OBMain_CREATE:
; LN:108 SETPOSITION OBMain,340,150,430,110
mov edi,!OBMain
mov [!TargetGUIDesc],edi
mov eax,340
mov dword [edi+LeftOffs],eax
mov eax,150
mov dword [edi+TopOffs],eax
mov eax,430
mov dword [edi+WidthOffs],eax
mov eax,110
mov dword [edi+HeightOffs],eax
call __SetRightBottom
invoke SetWindowPos, dword [edi+HandleOffs],HWND_TOP, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs],SWP_NOZORDER
; LN:108 OBMain.TEXT="OBMain"
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
; LN:108 OBMain.BACKCOLOR=$c8d0d4
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
; LN:108 CREATE Button1,10,40,120,30
mov edi,!Button1
mov [!TargetGUIDesc],edi
mov eax,10
mov dword [edi+LeftOffs],eax
mov eax,40
mov dword [edi+TopOffs],eax
mov eax,120
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
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword [edi+InterceptSafeOffs],eax
; LN:108 Button1.TEXT="Convert"
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
; LN:108 CREATE StaticText1,10,10,400,20
mov edi,!StaticText1
mov [!TargetGUIDesc],edi
mov eax,10
mov dword [edi+LeftOffs],eax
mov eax,10
mov dword [edi+TopOffs],eax
mov eax,400
mov dword [edi+WidthOffs],eax
mov eax,20
mov dword [edi+HeightOffs],eax
mov [_ArgSafe3],0
call __SetRightBottom
invoke CreateWindowEx,0,!ControlType26,NULL,$50000101, dword [edi+LeftOffs], dword [edi+TopOffs], dword [edi+WidthOffs], dword [edi+HeightOffs], dword [!OBMain],102,[!hinstance],0
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
mov dword [edi+TypeOffs],125
mov dword [edi+IDOffs],102
mov eax,[!OBMain]
mov dword [edi+OwnerOffs],eax
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword [edi+InterceptSafeOffs],eax
; LN:108 StaticText1.TEXT=""
mov edi,!StaticText1
mov [!TargetGUIDesc],edi
mov edi,_IOBuffer
mov esi,_NullStr
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_IOBuffer]
; LN:108 StaticText1.BACKCOLOR=$c8d0d4
mov edi,!StaticText1
mov [!TargetGUIDesc],edi
mov eax,13160660
bts dword [edi+StatusOffs],WinChangeBackColor
mov dword [edi+BackColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:108 StaticText1.FORECOLOR=$0
mov edi,!StaticText1
mov [!TargetGUIDesc],edi
mov eax,0
bts dword [edi+StatusOffs],WinChangeForeColor
mov dword [edi+ForeColorOffs],eax
invoke InvalidateRect, dword [edi+HandleOffs],NULL,TRUE
; LN:108 CREATE Button2,290,40,120,30
mov edi,!Button2
mov [!TargetGUIDesc],edi
mov eax,290
mov dword [edi+LeftOffs],eax
mov eax,40
mov dword [edi+TopOffs],eax
mov eax,120
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
mov dword [edi+ArrayOffs],0
mov dword [edi+StatusOffs],$07
mov dword [edi+BackColorOffs],$ffffffff
mov dword [edi+ForeColorOffs],$ffffff
mov dword [edi+ControlBrushOffs],0
invoke GetWindowLong,dword [edi+HandleOffs],GWL_WNDPROC
mov dword [edi+InterceptSafeOffs],eax
; LN:108 Button2.TEXT="Exit"
mov edi,!Button2
mov [!TargetGUIDesc],edi
mov esi,_StrConst3
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_IOBuffer]
; LN:109 ToolBlockSize=SIZE(OldControlRecord)*ControlTableSize+SIZE(ToolPropMapCount)+30
mov esi,OldControlRecord+0
mov [_TmpVec1],esi
mov [_Tmp1],252
mov eax, dword [_Tmp1]
mov edx,800
imul edx
mov [_Tmp2],eax
mov [_Tmp3],200
mov eax, dword [_Tmp2]
mov edx, dword [_Tmp3]
add eax,edx
mov edx,30
add eax,edx
mov dword [ToolBlockSize],eax
; LN:110 OldFileName=""
mov [OldFileName+12],0
; LN:111 InitDir="C:\nb"
mov edi,[InitDir]
mov esi,_StrConst4
call __SetStrConst
; LN:112 FileFilter="OB Project",0,"*.obp",0,0
; LN:113 END EVENT
ret
; LN:115 Button1.COMMAND
mov edi,!Button1
mov [!TargetGUIDesc],edi
Button1_COMMAND:
; LN:116 OPENDIALOG OldFileName,FileFilter,InitDir
mov eax,[OldFileName]
mov [ofn_lpstrFile],eax
mov eax,[OldFileName+4]
mov [ofn_nMaxFile],eax
mov eax,FileFilter
mov [ofn_lpstrFilter],eax
mov eax,[InitDir]
mov [ofn_lpstrInitialDir],eax
mov eax,[!hinstance]
mov [ofn_hInstance],eax
mov eax,[!OBMain]
mov [ofn_hwndOwner],eax
mov [ofn_Flags],OFN_FILEMUSTEXIST+OFN_PATHMUSTEXIST+OFN_HIDEREADONLY
invoke GetOpenFileName,ofn_lStructSize
mov [STATUS],eax
; LN:117 IF STATUS<>0 THEN
cmp [STATUS],0
je _Lbl4
; LN:118 CALL SUB Convert
call Convert
; LN:119 StaticText1.TEXT=OldFileName+" Converted"
mov edi,!StaticText1
mov [!TargetGUIDesc],edi
mov esi,[OldFileName]
mov [_TmpVec1],esi
mov esi,[OldFileName+4]
mov [_TmpVec1+4],esi
mov esi,[OldFileName+8]
mov [_TmpVec1+8],esi
mov esi,_StrConst5
mov [_TmpVec2],esi
mov [_TmpVec2+4],11
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi; concatenation
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
mov edi,[!TargetGUIDesc]
invoke SendMessage, dword [edi+HandleOffs],WM_SETTEXT,0,[_IOBuffer]
; LN:120 END IF
_Lbl4:
; LN:121 END EVENT
ret
; LN:123 BEGIN SUB Convert
Convert:
; LN:124 OldFileName=TAIL(OldFileName,7)
mov esi,[OldFileName]
mov [_TmpVec1],esi
mov esi,[OldFileName+4]
mov [_TmpVec1+4],esi
mov esi,[OldFileName+8]
mov [_TmpVec1+8],esi
mov esi,_TmpVec1
mov eax,7
call __TailStr
mov edi,OldFileName
mov esi,_TmpVec1
call __MovStr
; LN:125 NewFileName="New"+OldFileName
mov esi,_StrConst6
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
mov esi,[OldFileName]
mov [_TmpVec2],esi
mov esi,[OldFileName+4]
mov [_TmpVec2+4],esi
mov esi,[OldFileName+8]
mov [_TmpVec2+8],esi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi; concatenation
mov edi,NewFileName
mov esi,_TmpVec1
call __MovStr
; LN:126 OPEN NewFileName FOR SCRATCH AS OutputFile
mov edi,_IOBuffer
mov esi,NewFileName
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE,FILE_SHARE_READ+FILE_SHARE_WRITE,0,OPEN_ALWAYS,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [OutputFile],eax
cmp eax,-1
jg _OELbl1
invoke GetLastError
mov [err],eax
mov [erl],126
jmp [_ErrVec]
_OELbl1:
invoke SetEndOfFile,eax
; LN:127 OPEN OldFileName FOR INPUT AS InputFile
mov edi,_IOBuffer
mov esi,OldFileName
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_READ,FILE_SHARE_READ+FILE_SHARE_WRITE,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [InputFile],eax
cmp eax,-1
jg _OELbl2
invoke GetLastError
mov [err],eax
mov [erl],127
jmp [_ErrVec]
_OELbl2:
; LN:128 FilBufSiz=LOF(InputFile)-ToolBlockSize
mov eax, dword [InputFile]
mov [_IOPthNum],eax
invoke GetFileSize,[_IOPthNum],0
mov [STATUS],eax
cmp eax,-1
jg _OELbl3
invoke GetLastError
mov [err],eax
mov [erl],128
jmp [_ErrVec]
_OELbl3:
mov edx, dword [ToolBlockSize]
sub eax,edx
mov dword [FilBufSiz],eax
; LN:129 BUFFER FileBuf=FilBufSiz
mov eax, dword [FilBufSiz]
push eax
cmp [FileBuf+4],0
je _Lbl5
invoke  VirtualFree,[FileBuf],0,MEM_RELEASE
mov [FileBuf],0
mov [FileBuf+4],0
_Lbl5:
pop eax
mov [FileBuf+4],eax
invoke  VirtualAlloc,0,eax,MEM_COMMIT,PAGE_READWRITE
mov [FileBuf],eax
; LN:130 FilBufAdr=BUFADR(FileBuf)
mov eax,[FileBuf]
mov dword [FilBufAdr],eax
; LN:131 BUFREAD InputFile,FilBufAdr,FilBufSiz
mov eax, dword [InputFile]
mov [_IOPthNum],eax
mov eax, dword [FilBufAdr]
mov [_XferAddr],eax
mov eax, dword [FilBufSiz]
mov [XferCount],eax
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl4
invoke GetLastError
mov [err],eax
mov [erl],131
jmp [_ErrVec]
_OELbl4:
; LN:132 BUFWRITE OutputFile,FilBufAdr,FilBufSiz
mov eax, dword [OutputFile]
mov [_IOPthNum],eax
mov eax, dword [FilBufAdr]
mov [_XferAddr],eax
mov eax, dword [FilBufSiz]
mov [XferCount],eax
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl5
invoke GetLastError
mov [err],eax
mov [erl],132
jmp [_ErrVec]
_OELbl5:
; LN:133 BUFFER FileBuf=0
mov eax,0
cmp [FileBuf+4],0
je _Lbl6
invoke  VirtualFree,[FileBuf],0,MEM_RELEASE
mov [FileBuf],0
mov [FileBuf+4],0
_Lbl6:
; LN:134 GET InputFile,TempInt
mov eax, dword [InputFile]
mov [_IOPthNum],eax
mov esi,TempInt
mov [_XferAddr],esi
mov [XferCount],4
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl6
invoke GetLastError
mov [err],eax
mov [erl],134
jmp [_ErrVec]
_OELbl6:
; LN:135 PUT OutputFile,TempInt
mov eax, dword [OutputFile]
mov [_IOPthNum],eax
mov esi,TempInt
mov [_XferAddr],esi
mov [XferCount],4
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl7
invoke GetLastError
mov [err],eax
mov [erl],135
jmp [_ErrVec]
_OELbl7:
; LN:136 GET InputFile,TempInt
mov eax, dword [InputFile]
mov [_IOPthNum],eax
mov esi,TempInt
mov [_XferAddr],esi
mov [XferCount],4
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl8
invoke GetLastError
mov [err],eax
mov [erl],136
jmp [_ErrVec]
_OELbl8:
; LN:137 PUT OutputFile,TempInt
mov eax, dword [OutputFile]
mov [_IOPthNum],eax
mov esi,TempInt
mov [_XferAddr],esi
mov [XferCount],4
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl9
invoke GetLastError
mov [err],eax
mov [erl],137
jmp [_ErrVec]
_OELbl9:
; LN:138 GET InputFile,TempByte
mov eax, dword [InputFile]
mov [_IOPthNum],eax
mov esi,TempByte
mov [_XferAddr],esi
mov [XferCount],1
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl10
invoke GetLastError
mov [err],eax
mov [erl],138
jmp [_ErrVec]
_OELbl10:
; LN:139 PUT OutputFile,TempByte
mov eax, dword [OutputFile]
mov [_IOPthNum],eax
mov esi,TempByte
mov [_XferAddr],esi
mov [XferCount],1
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl11
invoke GetLastError
mov [err],eax
mov [erl],139
jmp [_ErrVec]
_OELbl11:
; LN:140 GET InputFile,TempByte
mov eax, dword [InputFile]
mov [_IOPthNum],eax
mov esi,TempByte
mov [_XferAddr],esi
mov [XferCount],1
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl12
invoke GetLastError
mov [err],eax
mov [erl],140
jmp [_ErrVec]
_OELbl12:
; LN:141 PUT OutputFile,TempByte
mov eax, dword [OutputFile]
mov [_IOPthNum],eax
mov esi,TempByte
mov [_XferAddr],esi
mov [XferCount],1
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl13
invoke GetLastError
mov [err],eax
mov [erl],141
jmp [_ErrVec]
_OELbl13:
; LN:142 GET InputFile,TempInt
mov eax, dword [InputFile]
mov [_IOPthNum],eax
mov esi,TempInt
mov [_XferAddr],esi
mov [XferCount],4
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl14
invoke GetLastError
mov [err],eax
mov [erl],142
jmp [_ErrVec]
_OELbl14:
; LN:143 PUT OutputFile,TempInt
mov eax, dword [OutputFile]
mov [_IOPthNum],eax
mov esi,TempInt
mov [_XferAddr],esi
mov [XferCount],4
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl15
invoke GetLastError
mov [err],eax
mov [erl],143
jmp [_ErrVec]
_OELbl15:
; LN:144 GET InputFile,TempInt
mov eax, dword [InputFile]
mov [_IOPthNum],eax
mov esi,TempInt
mov [_XferAddr],esi
mov [XferCount],4
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl16
invoke GetLastError
mov [err],eax
mov [erl],144
jmp [_ErrVec]
_OELbl16:
; LN:145 PUT OutputFile,TempInt
mov eax, dword [OutputFile]
mov [_IOPthNum],eax
mov esi,TempInt
mov [_XferAddr],esi
mov [XferCount],4
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl17
invoke GetLastError
mov [err],eax
mov [erl],145
jmp [_ErrVec]
_OELbl17:
; LN:146 GET InputFile,TempInt
mov eax, dword [InputFile]
mov [_IOPthNum],eax
mov esi,TempInt
mov [_XferAddr],esi
mov [XferCount],4
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl18
invoke GetLastError
mov [err],eax
mov [erl],146
jmp [_ErrVec]
_OELbl18:
; LN:147 PUT OutputFile,TempInt
mov eax, dword [OutputFile]
mov [_IOPthNum],eax
mov esi,TempInt
mov [_XferAddr],esi
mov [XferCount],4
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl19
invoke GetLastError
mov [err],eax
mov [erl],147
jmp [_ErrVec]
_OELbl19:
; LN:148 GET InputFile,TempInt
mov eax, dword [InputFile]
mov [_IOPthNum],eax
mov esi,TempInt
mov [_XferAddr],esi
mov [XferCount],4
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl20
invoke GetLastError
mov [err],eax
mov [erl],148
jmp [_ErrVec]
_OELbl20:
; LN:149 PUT OutputFile,TempInt
mov eax, dword [OutputFile]
mov [_IOPthNum],eax
mov esi,TempInt
mov [_XferAddr],esi
mov [XferCount],4
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl21
invoke GetLastError
mov [err],eax
mov [erl],149
jmp [_ErrVec]
_OELbl21:
; LN:150 GET InputFile,TempInt
mov eax, dword [InputFile]
mov [_IOPthNum],eax
mov esi,TempInt
mov [_XferAddr],esi
mov [XferCount],4
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl22
invoke GetLastError
mov [err],eax
mov [erl],150
jmp [_ErrVec]
_OELbl22:
; LN:151 PUT OutputFile,TempInt
mov eax, dword [OutputFile]
mov [_IOPthNum],eax
mov esi,TempInt
mov [_XferAddr],esi
mov [XferCount],4
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl23
invoke GetLastError
mov [err],eax
mov [erl],151
jmp [_ErrVec]
_OELbl23:
; LN:152 FOR I=1 TO ControlTableSize
mov eax,1
mov [I],eax
mov eax,800
mov [_LopVec1],eax
_Lbl7:
mov eax,[I]
cmp eax,[_LopVec1]
jg _Lbl9
; LN:153 GET InputFile,OldControlRecord
mov eax, dword [InputFile]
mov [_IOPthNum],eax
mov esi,OldControlRecord+0
mov [_TmpVec1],esi
mov [_XferAddr],esi
mov [XferCount],252
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl24
invoke GetLastError
mov [err],eax
mov [erl],153
jmp [_ErrVec]
_OELbl24:
; LN:154 CALL SUB XferData
call XferData
; LN:155 PUT OutputFile,NewControlRecord
mov eax, dword [OutputFile]
mov [_IOPthNum],eax
mov esi,NewControlRecord+0
mov [_TmpVec1],esi
mov [_XferAddr],esi
mov [XferCount],312
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl25
invoke GetLastError
mov [err],eax
mov [erl],155
jmp [_ErrVec]
_OELbl25:
; LN:156 debug.print lof(OutputFile)
; LN:157 NEXT I
_Lbl8:
mov eax,[I]
add eax,1
mov [I],eax
jmp _Lbl7
_Lbl9:
; LN:158 GET InputFile,ToolPropMapCount
mov eax, dword [InputFile]
mov [_IOPthNum],eax
mov esi,ToolPropMapCount
mov [_XferAddr],esi
mov [XferCount],200
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl26
invoke GetLastError
mov [err],eax
mov [erl],158
jmp [_ErrVec]
_OELbl26:
; LN:159 PUT OutputFile,ToolPropMapCount
mov eax, dword [OutputFile]
mov [_IOPthNum],eax
mov esi,ToolPropMapCount
mov [_XferAddr],esi
mov [XferCount],200
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl27
invoke GetLastError
mov [err],eax
mov [erl],159
jmp [_ErrVec]
_OELbl27:
; LN:160 CLOSE InputFile
mov eax, dword [InputFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl28
invoke GetLastError
mov [err],eax
mov [erl],160
jmp [_ErrVec]
_OELbl28:
; LN:161 CLOSE OutputFile
mov eax, dword [OutputFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl29
invoke GetLastError
mov [err],eax
mov [erl],161
jmp [_ErrVec]
_OELbl29:
; LN:162 END SUB
ret
; LN:164 BEGIN SUB XferData
XferData:
; LN:165 NewControlRecord.NewPuppetHandle=OldControlRecord.OldPuppetHandle
mov esi,NewControlRecord+0
mov [_TmpVec1],esi
mov esi,OldControlRecord+0
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:166 NewControlRecord.NewPuppetID=OldControlRecord.OldPuppetID
mov esi,NewControlRecord+4
mov [_TmpVec1],esi
mov esi,OldControlRecord+4
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:167 NewControlRecord.NewPuppetOwner=OldControlRecord.OldPuppetOwner
mov esi,NewControlRecord+8
mov [_TmpVec1],esi
mov esi,OldControlRecord+8
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:168 NewControlRecord.NewPuppetArrayNdx=OldControlRecord.OldPuppetArrayNdx
mov esi,NewControlRecord+12
mov [_TmpVec1],esi
mov esi,OldControlRecord+12
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:169 NewControlRecord.NewPuppetLeft=OldControlRecord.OldPuppetLeft
mov esi,NewControlRecord+16
mov [_TmpVec1],esi
mov esi,OldControlRecord+16
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:170 NewControlRecord.NewPuppetTop=OldControlRecord.OldPuppetTop
mov esi,NewControlRecord+20
mov [_TmpVec1],esi
mov esi,OldControlRecord+20
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:171 NewControlRecord.NewPuppetWidth=OldControlRecord.OldPuppetWidth
mov esi,NewControlRecord+24
mov [_TmpVec1],esi
mov esi,OldControlRecord+24
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:172 NewControlRecord.NewPuppetHeight=OldControlRecord.OldPuppetHeight
mov esi,NewControlRecord+28
mov [_TmpVec1],esi
mov esi,OldControlRecord+28
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:173 NewControlRecord.NewPuppetBackColor=OldControlRecord.OldPuppetBackColor
mov esi,NewControlRecord+32
mov [_TmpVec1],esi
mov esi,OldControlRecord+32
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:174 NewControlRecord.NewPuppetForeColor=OldControlRecord.OldPuppetForeColor
mov esi,NewControlRecord+36
mov [_TmpVec1],esi
mov esi,OldControlRecord+36
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:175 NewControlRecord.NewPuppetType=OldControlRecord.OldPuppetType
mov esi,NewControlRecord+40
mov [_TmpVec1],esi
mov esi,OldControlRecord+40
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:176 NewControlRecord.NewPuppetStatus=OldControlRecord.OldPuppetStatus
mov esi,NewControlRecord+44
mov [_TmpVec1],esi
mov esi,OldControlRecord+44
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:177 NewControlRecord.NewPuppetFamily=OldControlRecord.OldPuppetFamily
mov esi,NewControlRecord+48
mov [_TmpVec1],esi
mov esi,OldControlRecord+48
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:178 NewControlRecord.NewPuppetGroup=OldControlRecord.OldPuppetGroup
mov esi,NewControlRecord+52
mov [_TmpVec1],esi
mov esi,OldControlRecord+52
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:179 NewControlRecord.NewPuppetChildXOffs=OldControlRecord.OldPuppetChildXOffs
mov esi,NewControlRecord+56
mov [_TmpVec1],esi
mov esi,OldControlRecord+56
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:180 NewControlRecord.NewPuppetChildYOffs=OldControlRecord.OldPuppetChildYOffs
mov esi,NewControlRecord+60
mov [_TmpVec1],esi
mov esi,OldControlRecord+60
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:181 NewControlRecord.NewPuppetMenuHandle=OldControlRecord.OldPuppetMenuHandle
mov esi,NewControlRecord+64
mov [_TmpVec1],esi
mov esi,OldControlRecord+64
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:182 NewControlRecord.NewPuppetEars(1)=OldControlRecord.OldPuppetEars(1)
mov esi,0-(1*4*1)
mov eax,1
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov esi,NewControlRecord+68
mov [_TmpVec2],esi
mov eax,[_TmpVec2]
add eax,[_TmpVec1]
mov [_TmpVec2],eax
mov esi,0-(1*4*1)
mov eax,1
imul eax,4
add esi,eax
mov [_TmpVec3],esi
mov esi,OldControlRecord+68
mov [_TmpVec4],esi
mov eax,[_TmpVec4]
add eax,[_TmpVec3]
mov [_TmpVec4],eax
mov edi,[_TmpVec4]
mov eax, dword [edi]
mov esi,[_TmpVec2]
mov dword [esi],eax
; LN:183 NewControlRecord.NewPuppetEars(2)=OldControlRecord.OldPuppetEars(2)
mov esi,0-(1*4*1)
mov eax,2
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov esi,NewControlRecord+68
mov [_TmpVec2],esi
mov eax,[_TmpVec2]
add eax,[_TmpVec1]
mov [_TmpVec2],eax
mov esi,0-(1*4*1)
mov eax,2
imul eax,4
add esi,eax
mov [_TmpVec3],esi
mov esi,OldControlRecord+68
mov [_TmpVec4],esi
mov eax,[_TmpVec4]
add eax,[_TmpVec3]
mov [_TmpVec4],eax
mov edi,[_TmpVec4]
mov eax, dword [edi]
mov esi,[_TmpVec2]
mov dword [esi],eax
; LN:184 NewControlRecord.NewPuppetEars(3)=OldControlRecord.OldPuppetEars(3)
mov esi,0-(1*4*1)
mov eax,3
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov esi,NewControlRecord+68
mov [_TmpVec2],esi
mov eax,[_TmpVec2]
add eax,[_TmpVec1]
mov [_TmpVec2],eax
mov esi,0-(1*4*1)
mov eax,3
imul eax,4
add esi,eax
mov [_TmpVec3],esi
mov esi,OldControlRecord+68
mov [_TmpVec4],esi
mov eax,[_TmpVec4]
add eax,[_TmpVec3]
mov [_TmpVec4],eax
mov edi,[_TmpVec4]
mov eax, dword [edi]
mov esi,[_TmpVec2]
mov dword [esi],eax
; LN:185 NewControlRecord.NewPuppetEars(4)=OldControlRecord.OldPuppetEars(4)
mov esi,0-(1*4*1)
mov eax,4
imul eax,4
add esi,eax
mov [_TmpVec1],esi
mov esi,NewControlRecord+68
mov [_TmpVec2],esi
mov eax,[_TmpVec2]
add eax,[_TmpVec1]
mov [_TmpVec2],eax
mov esi,0-(1*4*1)
mov eax,4
imul eax,4
add esi,eax
mov [_TmpVec3],esi
mov esi,OldControlRecord+68
mov [_TmpVec4],esi
mov eax,[_TmpVec4]
add eax,[_TmpVec3]
mov [_TmpVec4],eax
mov edi,[_TmpVec4]
mov eax, dword [edi]
mov esi,[_TmpVec2]
mov dword [esi],eax
; LN:186 NewControlRecord.NewPuppetControlType=OldControlRecord.OldPuppetControlType
mov esi,NewControlRecord+84
mov [_TmpVec1],esi
mov esi,OldControlRecord+84
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:187 NewControlRecord.NewPuppetArraySize=OldControlRecord.OldPuppetArraySize
mov esi,NewControlRecord+88
mov [_TmpVec1],esi
mov esi,OldControlRecord+88
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:188 NewControlRecord.NewPuppetFont=OldControlRecord.OldPuppetFont
mov esi,NewControlRecord+92
mov [_TmpVec1],esi
mov esi,OldControlRecord+92
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:189 NewControlRecord.NewPuppetForm=OldControlRecord.OldPuppetForm
mov esi,NewControlRecord+96
mov [_TmpVec1],esi
mov esi,OldControlRecord+96
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:190 NewControlRecord.NewPuppethwndCombo=OldControlRecord.OldPuppethwndCombo
mov esi,NewControlRecord+100
mov [_TmpVec1],esi
mov esi,OldControlRecord+100
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:191 NewControlRecord.NewPuppethwndItem=OldControlRecord.OldPuppethwndItem
mov esi,NewControlRecord+104
mov [_TmpVec1],esi
mov esi,OldControlRecord+104
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:192 NewControlRecord.NewPuppethwndList=OldControlRecord.OldPuppethwndList
mov esi,NewControlRecord+108
mov [_TmpVec1],esi
mov esi,OldControlRecord+108
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:193 NewControlRecord.NewPuppetIcon=OldControlRecord.OldPuppetIcon
mov esi,NewControlRecord+112
mov [_TmpVec1],esi
mov esi,OldControlRecord+112
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:194 NewControlRecord.NewPuppetStyle=OldControlRecord.OldPuppetStyle
mov esi,NewControlRecord+116
mov [_TmpVec1],esi
mov esi,OldControlRecord+116
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:195 NewControlRecord.NewPuppetExStyle=OldControlRecord.OldPuppetExStyle
mov esi,NewControlRecord+120
mov [_TmpVec1],esi
mov esi,OldControlRecord+120
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:196 NewControlRecord.NewPuppetText=OldControlRecord.OldPuppetText
mov esi,NewControlRecord+124
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov esi,OldControlRecord+124
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec1
mov esi,_TmpVec2
call __MovStr
; LN:197 NewControlRecord.NewPuppetName=OldControlRecord.OldPuppetName
mov esi,NewControlRecord+156
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov esi,OldControlRecord+156
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec1
mov esi,_TmpVec2
call __MovStr
; LN:198 NewControlRecord.NewPuppetImage=OldControlRecord.OldPuppetImage
mov esi,NewControlRecord+188
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov esi,OldControlRecord+188
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec1
mov esi,_TmpVec2
call __MovStr
; LN:199 NewControlRecord.NewPuppetToolTip=OldControlRecord.OldPuppetToolTip
mov esi,NewControlRecord+220
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov esi,OldControlRecord+220
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec1
mov esi,_TmpVec2
call __MovStr
; LN:200 NewControlRecord.NewPuppetlfHeight=0
mov esi,NewControlRecord+252
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:201 NewControlRecord.NewPuppetlfWidth=0
mov esi,NewControlRecord+256
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:202 NewControlRecord.NewPuppetlfEscapement=0
mov esi,NewControlRecord+260
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:203 NewControlRecord.NewPuppetlfOrientation=0
mov esi,NewControlRecord+264
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:204 NewControlRecord.NewPuppetlfWeight=0
mov esi,NewControlRecord+268
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:205 NewControlRecord.NewPuppetlfItalic=0
mov esi,NewControlRecord+272
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:206 NewControlRecord.NewPuppetlfUnderline=0
mov esi,NewControlRecord+273
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:207 NewControlRecord.NewPuppetlfStrikeOut=0
mov esi,NewControlRecord+274
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:208 NewControlRecord.NewPuppetlfCharSet=0
mov esi,NewControlRecord+275
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:209 NewControlRecord.NewPuppetlfOutPrecision=0
mov esi,NewControlRecord+276
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:210 NewControlRecord.NewPuppetlfClipPrecision=0
mov esi,NewControlRecord+277
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:211 NewControlRecord.NewPuppetlfQuality=0
mov esi,NewControlRecord+278
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:212 NewControlRecord.NewPuppetlfPitchAndFamily=0
mov esi,NewControlRecord+279
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:213 NewControlRecord.NewPuppetlfFaceName=""
mov esi,NewControlRecord+280
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_NullStr
call __MovStr
; LN:214 END SUB
ret
; LN:216 Button2.COMMAND
mov edi,!Button2
mov [!TargetGUIDesc],edi
Button2_COMMAND:
; LN:217 END
invoke DeleteObject,[!Brush]
invoke PostMessage,[!OBMain],WM_CLOSE,0,0
; LN:218 END EVENT
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

__SetRightBottom:
mov edi,[!TargetGUIDesc]
mov dword eax,[edi+LeftOffs]
add dword eax,[edi+WidthOffs]
mov dword [edi+RightOffs],eax
mov dword eax,[edi+TopOffs]
add dword eax,[edi+HeightOffs]
mov dword [edi+BottomOffs],eax
ret

__TailStr:
push ebx
mov edi,[esi]
mov ecx,[esi+4]
xor edx,edx
dec eax
add eax,edi
__TailStrLen:
mov bl,[edi]
or bl,bl
je __TailStr2
dec ecx
je __TailStr1
inc edi
inc edx
jmp __TailStrLen
__TailStr1:
inc edi
__TailStr2:
mov [esi],eax
mov [esi+4],edx
pop ebx
ret

